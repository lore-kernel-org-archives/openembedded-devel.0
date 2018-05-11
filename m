Return-Path: <cshored@thecshore.com>
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id EF6E57522C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 02:51:05 +0000 (UTC)
Received: from [10.137.0.15] (107-179-160-78.cpe.teksavvy.com [107.179.160.78])
	by mail.thecshore.com (Postfix) with ESMTPSA id D08D02657;
	Thu, 10 May 2018 22:51:05 -0400 (EDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com D08D02657
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com D08D02657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1526007066;
	bh=ulhA/TRUPIDO7GwOlZiNFrWfLv6T7iZJ4MGjkJA9Gpw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=gm8gg5bxGoEkrJtc0hUm1eiUNE0pzpIOPKfeFdgQ6kkbW6uAhyVB4lV2pBgeaChrM
	sEeiEfofYAL/TAEsiEhfWRzXz80hexB6R/Lc5Ta2AX+QzQk7l3t1xtvdIdkBthlCHb
	fALZAKCV9fZBqU0p3vquhW/tt+z6fzhApNNsReSg=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.4 at mail.thecshore.com
To: Khem Raj <raj.khem@gmail.com>, Parthiban Nallathambi <pn@denx.de>,
	openembedded-devel@lists.openembedded.org
References: <20180318164919.5142-1-pn@denx.de>
	<20180318164919.5142-2-pn@denx.de>
	<99fe4319-0f92-1544-599e-354633ae78aa@gmail.com>
From: "Daniel F. Dickinson" <cshored@thecshore.com>
Message-ID: <32080680-ba12-c608-5f29-9376be84a8ea@thecshore.com>
Date: Thu, 10 May 2018 22:51:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <99fe4319-0f92-1544-599e-354633ae78aa@gmail.com>
Cc: barathiraja@gmail.com
Subject: Re: [meta-openwrt][PATCH] [hostapd]: Update patch based on 2.6 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 May 2018 02:51:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 2018-03-19 12:50 AM, Khem Raj wrote:
> 
> 
> On 3/18/18 9:49 AM, Parthiban Nallathambi wrote:
>> Update the existing patch to work for hostapd 2.6
>> (which is the current version of openembedded-core
>> rocko branch).
>>
>> "netifd.sh" is no more part of hostapd source, so
>> removing it from do_install section of tweak
>>
> 
> thanks looks ok.
> 

Sorry I just noticed this.  hostapd.sh comes from the OpenWrt repo not 
the hostapd repo, and is required for netifd, so this will break AP mode 
for meta-openwrt.

I think P.N. was confused because most recipes don't use multiple repos.

Regards,

Daniel


>> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
>> ---
>>   recipes-tweaks/hostapd/hostapd/300-noscan.patch | 42 
>> ++++++++++++-------------
>>   recipes-tweaks/hostapd/hostapd_%.bbappend       |  2 --
>>   2 files changed, 21 insertions(+), 23 deletions(-)
>>
>> diff --git a/recipes-tweaks/hostapd/hostapd/300-noscan.patch 
>> b/recipes-tweaks/hostapd/hostapd/300-noscan.patch
>> index e89cb9d..e9f8ee1 100644
>> --- a/recipes-tweaks/hostapd/hostapd/300-noscan.patch
>> +++ b/recipes-tweaks/hostapd/hostapd/300-noscan.patch
>> @@ -1,7 +1,7 @@
>> -diff -ruN hostapd-2.5.orig/hostapd/config_file.c 
>> hostapd-2.5/hostapd/config_file.c
>> ---- hostapd-2.5.orig/hostapd/config_file.c    2017-02-15 
>> 16:20:07.102232803 -0700
>> -+++ hostapd-2.5/hostapd/config_file.c    2017-02-15 
>> 16:20:35.132232593 -0700
>> -@@ -2795,6 +2795,10 @@
>> +diff -ruN hostapd-2.6/hostapd/config_file.c 
>> hostapd-2.6.orig/hostapd/config_file.c
>> +--- hostapd-2.6/hostapd/config_file.c    2016-10-02 
>> 20:51:11.000000000 +0200
>> ++++ hostapd-2.6.orig/hostapd/config_file.c    2018-03-17 
>> 23:05:11.032723997 +0100
>> +@@ -2863,6 +2863,10 @@
>>            }
>>    #endif /* CONFIG_IEEE80211W */
>>    #ifdef CONFIG_IEEE80211N
>> @@ -12,10 +12,10 @@ diff -ruN hostapd-2.5.orig/hostapd/config_file.c 
>> hostapd-2.5/hostapd/config_file
>>        } else if (os_strcmp(buf, "ieee80211n") == 0) {
>>            conf->ieee80211n = atoi(pos);
>>        } else if (os_strcmp(buf, "ht_capab") == 0) {
>> -diff -ruN hostapd-2.5.orig/src/ap/ap_config.h 
>> hostapd-2.5/src/ap/ap_config.h
>> ---- hostapd-2.5.orig/src/ap/ap_config.h    2017-02-15 
>> 16:20:07.105566137 -0700
>> -+++ hostapd-2.5/src/ap/ap_config.h    2017-02-15 16:20:35.135565927 
>> -0700
>> -@@ -626,6 +626,8 @@
>> +diff -ruN hostapd-2.6/src/ap/ap_config.h 
>> hostapd-2.6.orig/src/ap/ap_config.h
>> +--- hostapd-2.6/src/ap/ap_config.h    2016-10-02 20:51:11.000000000 
>> +0200
>> ++++ hostapd-2.6.orig/src/ap/ap_config.h    2018-03-17 
>> 23:04:30.697722861 +0100
>> +@@ -664,6 +664,8 @@
>>        int ht_op_mode_fixed;
>>        u16 ht_capab;
>> @@ -24,22 +24,22 @@ diff -ruN hostapd-2.5.orig/src/ap/ap_config.h 
>> hostapd-2.5/src/ap/ap_config.h
>>        int ieee80211n;
>>        int secondary_channel;
>>        int no_pri_sec_switch;
>> -diff -ruN hostapd-2.5.orig/src/ap/hw_features.c 
>> hostapd-2.5/src/ap/hw_features.c
>> ---- hostapd-2.5.orig/src/ap/hw_features.c    2017-02-15 
>> 16:20:07.105566137 -0700
>> -+++ hostapd-2.5/src/ap/hw_features.c    2017-02-15 16:22:03.158898602 
>> -0700
>> -@@ -472,7 +472,7 @@
>> -     struct wpa_driver_scan_params params;
>> -     int ret;
>> +diff -ruN hostapd-2.6/src/ap/hw_features.c 
>> hostapd-2.6.orig/src/ap/hw_features.c
>> +--- hostapd-2.6/src/ap/hw_features.c    2016-10-02 20:51:11.000000000 
>> +0200
>> ++++ hostapd-2.6.orig/src/ap/hw_features.c    2018-03-17 
>> 23:05:54.273725214 +0100
>> +@@ -226,7 +226,7 @@
>> + {
>> +     int pri_chan, sec_chan;
>>   -    if (!iface->conf->secondary_channel)
>>   +    if (!iface->conf->secondary_channel || iface->conf->noscan)
>> -         return 0; /* HT40 not used */
>> +         return 1; /* HT40 not used */
>> -     hostapd_set_state(iface, HAPD_IFACE_HT_SCAN);
>> -diff -ruN hostapd-2.5.orig/src/ap/ieee802_11_ht.c 
>> hostapd-2.5/src/ap/ieee802_11_ht.c
>> ---- hostapd-2.5.orig/src/ap/ieee802_11_ht.c    2017-02-15 
>> 16:20:07.105566137 -0700
>> -+++ hostapd-2.5/src/ap/ieee802_11_ht.c    2017-02-15 
>> 16:20:35.135565927 -0700
>> -@@ -221,6 +221,9 @@
>> +     pri_chan = iface->conf->channel;
>> +diff -ruN hostapd-2.6/src/ap/ieee802_11_ht.c 
>> hostapd-2.6.orig/src/ap/ieee802_11_ht.c
>> +--- hostapd-2.6/src/ap/ieee802_11_ht.c    2016-10-02 
>> 20:51:11.000000000 +0200
>> ++++ hostapd-2.6.orig/src/ap/ieee802_11_ht.c    2018-03-17 
>> 23:08:20.303729325 +0100
>> +@@ -244,6 +244,9 @@
>>        if (!(iface->conf->ht_capab & HT_CAP_INFO_SUPP_CHANNEL_WIDTH_SET))
>>            return;
>> @@ -49,7 +49,7 @@ diff -ruN hostapd-2.5.orig/src/ap/ieee802_11_ht.c 
>> hostapd-2.5/src/ap/ieee802_11_
>>        if (len < IEEE80211_HDRLEN + 2 + sizeof(*bc_ie))
>>            return;
>> -@@ -345,6 +348,9 @@
>> +@@ -368,6 +371,9 @@
>>        if (iface->current_mode->mode != HOSTAPD_MODE_IEEE80211G)
>>            return;
>> diff --git a/recipes-tweaks/hostapd/hostapd_%.bbappend 
>> b/recipes-tweaks/hostapd/hostapd_%.bbappend
>> index be45723..3b2f646 100644
>> --- a/recipes-tweaks/hostapd/hostapd_%.bbappend
>> +++ b/recipes-tweaks/hostapd/hostapd_%.bbappend
>> @@ -15,8 +15,6 @@ do_install_append() {
>>       install -d ${D}${base_libdir}/netifd/wireless
>>       install -d ${D}${base_libdir}/wifi
>> -    install -m 0755 
>> ${WORKDIR}/git/openwrt/package/network/services/hostapd/files/netifd.sh ${D}${base_libdir}/netifd/hostapd.sh 
>>
>> -
>>       install -m 0755 
>> ${WORKDIR}/git/openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh 
>> ${D}${base_libdir}/wifi/mac80211.sh
>>       install -m 0755 
>> ${WORKDIR}/git/openwrt/package/kernel/mac80211/files/lib/netifd/wireless/mac80211.sh 
>> ${D}${base_libdir}/netifd/wireless/mac80211.sh
>>   }
>>


