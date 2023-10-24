select * from Youtube_Statistics..Global_YouTube_Statistics

--1
--a. Top Continents in the Youtube Space; uploads,views, earnings and subscribers

select
	case
		when Country in ('Algeria','Angola','Benin','Botswana','Burkina Faso'
		,'Burundi','Cameroon','Cape Verde','Central African Republic','Chad','Comoros'
		,'Democratic Republic of the Congo','Republic of the Congo','Cote dIvoire'
		,'Djibouti','Egypt','Equatorial Guinea','Eritrea','Ethiopia','Gabon','Gambia'
		,'Ghana','Guinea','Guinea-BissauKenya','Lesotho','Liberia','Libya','Madagascar'
		,'Malawi','Mali','Mauritania','Mauritius','Morocco','Mozambique','Namibia'
		,'Niger','Nigeria','Rwanda','Sao Tome and Principe','Senegal','Seychelles'
		,'Sierra Leone','Somalia','South Africa','South Sudan','Sudan','Swaziland'
		,'Tanzania','Togo','Tunisia','Uganda','Zambia','Zimbabwe') then 'Africa'
		when Country in('Albania','Andorra','Armenia','Austria','Azerbaijan','Belarus'
		,'Belgium','Bosnia and Herzegovina','Bulgaria','Croatia','Cyprus','Czech Republic'
		,'Denmark','Estonia','Finland','France','Georgia','Germany','Greece','Hungary'
		,'Iceland','Ireland','Italy','Kazakhstan','Latvia','Liechtenstein','Lithuania'
		,'Luxembourg','Macedonia','Malta','Moldova','Monaco','Montenegro','Norway'
		,'Poland','Portugal','Romania','Russia','San Marino','Serbia','Slovakia','Slovenia'
		,'Spain','Sweden','Switzerland','The Netherlands','Turkey','Ukraine','United Kingdom'
		,'Vatican City') then 'Europe'
		when Country in('Afghanistan','Armenia','Azerbaijan','Bahrain','Bangladesh','Bhutan'
		,'Brunei','Cambodia','China','Cyprus','Georgia','Hong Kong','India','Indonesia'
		,'Iran','Iraq','Israel','Japan','Jordan','Kazakhstan','Kuwait','Kyrgyzstan','Laos'
		,'Lebanon','Macao','Malaysia','Maldives','Mongolia','Myanmar','Nepal','North Korea'
		,'Oman','Pakistan','Palestine','Philippines','Qatar','Saudi Arabia','Singapore'
		,'South Korea','Sri Lanka','Syria','Taiwan','Tajikistan','Thailand','Timor-Leste'
		,'Turkey','Turkmenistan','United Arab Emirates','Uzbekistan','Vietnam','Yemen') then 'Asia'
		when Country in('Antigua and Barbuda','Bahamas','Barbados','Belize','Canada','Costa Rica'
		,'Cuba','Dominica','Dominican Republic','El Salvador','Grenada','Guatemala','Haiti'
		,'Honduras','Jamaica','Mexico','Nicaragua','Panama','Saint Kitts and Nevis'
		,'Saint Lucia','Saint Vincent and the Grenadines','Trinidad and Tobago'
		,'United States') then 'North_America'
		when Country in('Argentina','Bolivia','Brazil','Chile','Colombia','Eucuador','Guyana'
		,'Paraguay','Peru','Suriname','Uruguay','Venezuela') then 'South_America'
		when Country in('Autralia','Fiji','Kiribati','Marshall Islands','Micronesia'
		,'Naura','New Zealand','Palau','Papua New Guinea','Samoa','Solomom Islands'
		,'Tonga','Tuvalu','Vanuatu') then 'Australia_and_Oceania'
	end as Continents,
sum(subscribers) as Total_subscribers,
sum(uploads) as Total_uploads,
sum("video views") as Total_views,
round(sum(highest_yearly_earnings),0) as Total_earnings,
count(Youtuber) as No_of_youtubers
from Youtube_Statistics..Global_YouTube_Statistics
--where Continents is not null
group by 
	case
		when Country in ('Algeria','Angola','Benin','Botswana','Burkina Faso'
		,'Burundi','Cameroon','Cape Verde','Central African Republic','Chad','Comoros'
		,'Democratic Republic of the Congo','Republic of the Congo','Cote dIvoire'
		,'Djibouti','Egypt','Equatorial Guinea','Eritrea','Ethiopia','Gabon','Gambia'
		,'Ghana','Guinea','Guinea-BissauKenya','Lesotho','Liberia','Libya','Madagascar'
		,'Malawi','Mali','Mauritania','Mauritius','Morocco','Mozambique','Namibia'
		,'Niger','Nigeria','Rwanda','Sao Tome and Principe','Senegal','Seychelles'
		,'Sierra Leone','Somalia','South Africa','South Sudan','Sudan','Swaziland'
		,'Tanzania','Togo','Tunisia','Uganda','Zambia','Zimbabwe') then 'Africa'
		when Country in('Albania','Andorra','Armenia','Austria','Azerbaijan','Belarus'
		,'Belgium','Bosnia and Herzegovina','Bulgaria','Croatia','Cyprus','Czech Republic'
		,'Denmark','Estonia','Finland','France','Georgia','Germany','Greece','Hungary'
		,'Iceland','Ireland','Italy','Kazakhstan','Latvia','Liechtenstein','Lithuania'
		,'Luxembourg','Macedonia','Malta','Moldova','Monaco','Montenegro','Norway'
		,'Poland','Portugal','Romania','Russia','San Marino','Serbia','Slovakia','Slovenia'
		,'Spain','Sweden','Switzerland','The Netherlands','Turkey','Ukraine','United Kingdom'
		,'Vatican City') then 'Europe'
		when Country in('Afghanistan','Armenia','Azerbaijan','Bahrain','Bangladesh','Bhutan'
		,'Brunei','Cambodia','China','Cyprus','Georgia','Hong Kong','India','Indonesia'
		,'Iran','Iraq','Israel','Japan','Jordan','Kazakhstan','Kuwait','Kyrgyzstan','Laos'
		,'Lebanon','Macao','Malaysia','Maldives','Mongolia','Myanmar','Nepal','North Korea'
		,'Oman','Pakistan','Palestine','Philippines','Qatar','Saudi Arabia','Singapore'
		,'South Korea','Sri Lanka','Syria','Taiwan','Tajikistan','Thailand','Timor-Leste'
		,'Turkey','Turkmenistan','United Arab Emirates','Uzbekistan','Vietnam','Yemen') then 'Asia'
		when Country in('Antigua and Barbuda','Bahamas','Barbados','Belize','Canada','Costa Rica'
		,'Cuba','Dominica','Dominican Republic','El Salvador','Grenada','Guatemala','Haiti'
		,'Honduras','Jamaica','Mexico','Nicaragua','Panama','Saint Kitts and Nevis'
		,'Saint Lucia','Saint Vincent and the Grenadines','Trinidad and Tobago'
		,'United States') then 'North_America'
		when Country in('Argentina','Bolivia','Brazil','Chile','Colombia','Eucuador','Guyana'
		,'Paraguay','Peru','Suriname','Uruguay','Venezuela') then 'South_America'
		when Country in('Autralia','Fiji','Kiribati','Marshall Islands','Micronesia'
		,'Naura','New Zealand','Palau','Papua New Guinea','Samoa','Solomom Islands'
		,'Tonga','Tuvalu','Vanuatu') then 'Australia_and_Oceania'
	end
order by Continents


--b.Percentage of pay per continent
With pct_pay as(
SELECT
	case
		when Country in ('Algeria','Angola','Benin','Botswana','Burkina Faso'
		,'Burundi','Cameroon','Cape Verde','Central African Republic','Chad','Comoros'
		,'Democratic Republic of the Congo','Republic of the Congo','Cote dIvoire'
		,'Djibouti','Egypt','Equatorial Guinea','Eritrea','Ethiopia','Gabon','Gambia'
		,'Ghana','Guinea','Guinea-BissauKenya','Lesotho','Liberia','Libya','Madagascar'
		,'Malawi','Mali','Mauritania','Mauritius','Morocco','Mozambique','Namibia'
		,'Niger','Nigeria','Rwanda','Sao Tome and Principe','Senegal','Seychelles'
		,'Sierra Leone','Somalia','South Africa','South Sudan','Sudan','Swaziland'
		,'Tanzania','Togo','Tunisia','Uganda','Zambia','Zimbabwe') then 'Africa'
		when Country in('Albania','Andorra','Armenia','Austria','Azerbaijan','Belarus'
		,'Belgium','Bosnia and Herzegovina','Bulgaria','Croatia','Cyprus','Czech Republic'
		,'Denmark','Estonia','Finland','France','Georgia','Germany','Greece','Hungary'
		,'Iceland','Ireland','Italy','Kazakhstan','Latvia','Liechtenstein','Lithuania'
		,'Luxembourg','Macedonia','Malta','Moldova','Monaco','Montenegro','Norway'
		,'Poland','Portugal','Romania','Russia','San Marino','Serbia','Slovakia','Slovenia'
		,'Spain','Sweden','Switzerland','The Netherlands','Turkey','Ukraine','United Kingdom'
		,'Vatican City') then 'Europe'
		when Country in('Afghanistan','Armenia','Azerbaijan','Bahrain','Bangladesh','Bhutan'
		,'Brunei','Cambodia','China','Cyprus','Georgia','Hong Kong','India','Indonesia'
		,'Iran','Iraq','Israel','Japan','Jordan','Kazakhstan','Kuwait','Kyrgyzstan','Laos'
		,'Lebanon','Macao','Malaysia','Maldives','Mongolia','Myanmar','Nepal','North Korea'
		,'Oman','Pakistan','Palestine','Philippines','Qatar','Saudi Arabia','Singapore'
		,'South Korea','Sri Lanka','Syria','Taiwan','Tajikistan','Thailand','Timor-Leste'
		,'Turkey','Turkmenistan','United Arab Emirates','Uzbekistan','Vietnam','Yemen') then 'Asia'
		when Country in('Antigua and Barbuda','Bahamas','Barbados','Belize','Canada','Costa Rica'
		,'Cuba','Dominica','Dominican Republic','El Salvador','Grenada','Guatemala','Haiti'
		,'Honduras','Jamaica','Mexico','Nicaragua','Panama','Saint Kitts and Nevis'
		,'Saint Lucia','Saint Vincent and the Grenadines','Trinidad and Tobago'
		,'United States') then 'North_America'
		when Country in('Argentina','Bolivia','Brazil','Chile','Colombia','Eucuador','Guyana'
		,'Paraguay','Peru','Suriname','Uruguay','Venezuela') then 'South_America'
		when Country in('Autralia','Fiji','Kiribati','Marshall Islands','Micronesia'
		,'Naura','New Zealand','Palau','Papua New Guinea','Samoa','Solomom Islands'
		,'Tonga','Tuvalu','Vanuatu') then 'Australia_and_Oceania'
	end as Continents,
	round(sum(highest_yearly_earnings),0) as total_earnings
from Youtube_Statistics..Global_YouTube_Statistics
Group by 
	case
		when Country in ('Algeria','Angola','Benin','Botswana','Burkina Faso'
		,'Burundi','Cameroon','Cape Verde','Central African Republic','Chad','Comoros'
		,'Democratic Republic of the Congo','Republic of the Congo','Cote dIvoire'
		,'Djibouti','Egypt','Equatorial Guinea','Eritrea','Ethiopia','Gabon','Gambia'
		,'Ghana','Guinea','Guinea-BissauKenya','Lesotho','Liberia','Libya','Madagascar'
		,'Malawi','Mali','Mauritania','Mauritius','Morocco','Mozambique','Namibia'
		,'Niger','Nigeria','Rwanda','Sao Tome and Principe','Senegal','Seychelles'
		,'Sierra Leone','Somalia','South Africa','South Sudan','Sudan','Swaziland'
		,'Tanzania','Togo','Tunisia','Uganda','Zambia','Zimbabwe') then 'Africa'
		when Country in('Albania','Andorra','Armenia','Austria','Azerbaijan','Belarus'
		,'Belgium','Bosnia and Herzegovina','Bulgaria','Croatia','Cyprus','Czech Republic'
		,'Denmark','Estonia','Finland','France','Georgia','Germany','Greece','Hungary'
		,'Iceland','Ireland','Italy','Kazakhstan','Latvia','Liechtenstein','Lithuania'
		,'Luxembourg','Macedonia','Malta','Moldova','Monaco','Montenegro','Norway'
		,'Poland','Portugal','Romania','Russia','San Marino','Serbia','Slovakia','Slovenia'
		,'Spain','Sweden','Switzerland','The Netherlands','Turkey','Ukraine','United Kingdom'
		,'Vatican City') then 'Europe'
		when Country in('Afghanistan','Armenia','Azerbaijan','Bahrain','Bangladesh','Bhutan'
		,'Brunei','Cambodia','China','Cyprus','Georgia','Hong Kong','India','Indonesia'
		,'Iran','Iraq','Israel','Japan','Jordan','Kazakhstan','Kuwait','Kyrgyzstan','Laos'
		,'Lebanon','Macao','Malaysia','Maldives','Mongolia','Myanmar','Nepal','North Korea'
		,'Oman','Pakistan','Palestine','Philippines','Qatar','Saudi Arabia','Singapore'
		,'South Korea','Sri Lanka','Syria','Taiwan','Tajikistan','Thailand','Timor-Leste'
		,'Turkey','Turkmenistan','United Arab Emirates','Uzbekistan','Vietnam','Yemen') then 'Asia'
		when Country in('Antigua and Barbuda','Bahamas','Barbados','Belize','Canada','Costa Rica'
		,'Cuba','Dominica','Dominican Republic','El Salvador','Grenada','Guatemala','Haiti'
		,'Honduras','Jamaica','Mexico','Nicaragua','Panama','Saint Kitts and Nevis'
		,'Saint Lucia','Saint Vincent and the Grenadines','Trinidad and Tobago'
		,'United States') then 'North_America'
		when Country in('Argentina','Bolivia','Brazil','Chile','Colombia','Eucuador','Guyana'
		,'Paraguay','Peru','Suriname','Uruguay','Venezuela') then 'South_America'
		when Country in('Autralia','Fiji','Kiribati','Marshall Islands','Micronesia'
		,'Naura','New Zealand','Palau','Papua New Guinea','Samoa','Solomom Islands'
		,'Tonga','Tuvalu','Vanuatu') then 'Australia_and_Oceania'
	end 
--Order by Continents 
)

Select
sum(total_earnings) as Total_earnings,
round(1.0 * sum(case when continents = 'Africa' then total_earnings else 0 end)/ nullif(sum(total_earnings),0) *100,2) as Pct_earnings_africa,
round(1.0 * sum(case when continents = 'Asia' then total_earnings else 0 end)/ nullif(sum(total_earnings),0) *100,2) as Pct_earnings_Asia,
round(1.0 * sum(case when continents = 'North_America' then total_earnings else 0 end)/ nullif(sum(total_earnings),0) *100,2) as Pct_earnings_North_America,
round(1.0 * sum(case when continents = 'Europe' then total_earnings else 0 end)/ nullif(sum(total_earnings),0) *100,2) as Pct_earnings_Europe,
round(1.0 * sum(case when continents = 'South_America' then total_earnings else 0 end)/ nullif(sum(total_earnings),0) *100,2) as Pct_earnings_South_America,
round(1.0 * sum(case when continents = 'Australia_and_Oceania' then total_earnings else 0 end)/ nullif(sum(total_earnings),0) *100,2) as Pct_earnings_Australia_and_Oceania,
round(1.0 * sum(case when continents = 'NULL' then total_earnings else 0 end)/ nullif(sum(total_earnings),0) *100,2) as Pct_earnings_Unkown_Country
-- Asia, North_America, Europe, South_America, Australia_and_Oceania
from pct_pay

--2. Top 10 Countries, percentage pay

With Country_pct as (
Select Country, round(sum(highest_yearly_earnings),0) as total_earnings
from Youtube_Statistics..Global_YouTube_Statistics
Group by Country
--Order by total_earnings 
)

select
sum(total_earnings) as total_earnings,
round(1.0*sum(case when Country = 'United States' then total_earnings else 0 end)/nullif(sum(total_earnings),0)*100,2) as pct_us,
round(1.0*sum(case when Country = 'India' then total_earnings else 0 end)/nullif(sum(total_earnings),0)*100,2) as pct_india,
round(1.0*sum(case when Country = 'Brazil' then total_earnings else 0 end)/nullif(sum(total_earnings),0)*100,2) as pct_brazil,
round(1.0*sum(case when Country = 'South Korea' then total_earnings else 0 end)/nullif(sum(total_earnings),0)*100,2) as pct_southKorea,
round(1.0*sum(case when Country = 'United Kingdom' then total_earnings else 0 end)/nullif(sum(total_earnings),0)*100,2) as pct_uk,
round(1.0*sum(case when Country = 'Pakistan' then total_earnings else 0 end)/nullif(sum(total_earnings),0)*100,2) as pct_pakistan,
round(1.0*sum(case when Country = 'Argentina' then total_earnings else 0 end)/nullif(sum(total_earnings),0)*100,2) as pct_argentina,
round(1.0*sum(case when Country = 'Russia' then total_earnings else 0 end)/nullif(sum(total_earnings),0)*100,2) as pct_russia,
round(1.0*sum(case when Country = 'United Arab Emirates' then total_earnings else 0 end)/nullif(sum(total_earnings),0)*100,2) as pct_united_arab_emirates,
round(1.0*sum(case when Country = 'Indonesia' then total_earnings else 0 end)/nullif(sum(total_earnings),0)*100,2) as pct_indonesia
from Country_pct

--3. Top 10 Channel Types, sum Views

Select top 10 channel_type, sum("video views") as Total_views
from Youtube_Statistics..Global_YouTube_Statistics
Group by channel_type
Order by Total_views desc