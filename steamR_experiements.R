####
####  Experiments with steamR
###
## get a steam username and password
## get a steam API

## go here
## https://steamcommunity.com/login/home/?goto=%2Fdev%2Fapikey
##https://steamcommunity.com/dev/apikey

## https://steamcommunity.com/dev/registerkey



##  devtools::install_github("drewlake/steamR")


remotes::install_github("josegallegos07/steamR")

### online manual
## https://rdrr.io/github/drewlake/steamR/man/

library(streamR)
library(tidyverse)
library(magrittr)

## Steam_ID
kid <- "CECB46DA0497FFE2EFC509BBC02C184A"

## Get Player_ID
id1 <- steamR::get_steam_id_64(kid,"Yifan Liu")

## Get list of friends
friends1 <- steamR::get_friend_list(kid, id1, "all")

####--------------------------------------------------------------- get App List
## get spp list
steam_apps <- steamR::get_app_list()

n_app <- length(steam_apps)

sa_1 <- unlist(steam_apps)

head(sa_1)
sa_1[1]
sa_1[2]
as.integer(sa_1[1])
as.character(sa_1[2])
sa_1[3]
sa_1[4]

s1 <- as.integer(sa_1[c(1,3,5,7)])
s2 <- as.character(sa_1[c(2,4,6,8)])
s_apps <- cbind(s1,s2)

sa_1_n <- length(sa_1)

s1 <- as.integer(sa_1[((1:n_app)+(0:(n_app-1)))])

s2 <- as.character(sa_1[((1:n_app)+(1:n_app))])

s_apps <- as.data.frame(cbind(s1,s2))

colnames(s_apps) <- c("appid", "name")

######################################################################  --- Team Fortress

team_fortress <- s_apps %>% filter(str_detect(name, "^Team For"))


#######################################################################  Portal

portal <- s_apps %>% filter(str_detect(name, "^Portal"))


################

achieve_1 <- steamR::get_schema_achievements(kid, 672920) ## The Bounty: Deluxe Edition

schema_1 <- steamR::get_schema_for_game(kid, 672920)


### didn't work

my_games <- steamR::get_owned_games(kid, steam64_id = id1, include_appinfo = TRUE, include_played_free_games = TRUE)

try_stats <- steamR::get_schema_stats(kid, 672920)  ##




###

news <- steamR::get_json("http://api.steampowered.com/ISteamNews/GetNewsForApp/v0002/?appid=440&count=3&maxlength=300&format=json")
fromJSON(news)

news <- fromJSON()


ex1 <- steamR::get_schema_stats(steam_key = kid, app_id = 440)

ex1[[1]]


#########################################################
#riot try
#########################################################

remotes::install_github("Tutuchan/lolapi")

library(lolapi)

##riot api key
rkey = "RGAPI-543d36a7-f479-4777-b9c0-e5eda8efa0db"

##api set_up
su = api_setup(rkey, "na")
