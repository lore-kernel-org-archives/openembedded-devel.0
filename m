Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E7421788DA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 04:50:08 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h11so6600424pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 21:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oOPyEcjS3sgjiAjw51+U41HYMHtQ5vo3BIY7pLVUUeA=;
	b=R6eR05VMpDA2+WxiZFo/6ddh3r+sYWCl0KSqOjUM51gr6J7UqFW+EFaMoAgF7bGKuj
	zC1xqwaSWJzqDzO/00BUzv124G1hMumODfQvAX6rTWOn+Ugd/H59WZGSwvldwYI7CWOO
	tCoVMA1FbAAE3KxW+a9WDaGoECkpGxzWy1heW7nNgaclQWqt3eAFsmepuyWvd/K9l6nq
	WsETXuIVYtE4t0tOimkW30AgRZYEtomxoptELV5xCl0cjZIWeRZ0fNvwOYqVvXB40gZs
	30KYyVpenI33KCVWYPZ17RWB9M4WqiFGzacoJynzXPxUzSKb5YyA4/d9wGZVb5/AdElr
	+xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=oOPyEcjS3sgjiAjw51+U41HYMHtQ5vo3BIY7pLVUUeA=;
	b=gMG75dZfM3/yN9nYFihm4qm/DQux9Pp7LxMS2uuHQd8L04qlokBTn+kIfMbVByzSSZ
	b+ju1dnXLcbmPxwXeIQ623pQtllQvYOnFaNfspZbASoKG0d061NxZECCHjRnbsW6O0pk
	DXody7eaI8uJ7z+0eF7Bg96nCD6cZbdkDWtbZOyrO6E5E26H215T9YJacTEOT8J2Yrz+
	oZvbaCO99D08fUAYflA9aTjUDTlHWUL0MVOQ8ikq07XXa+rJN4nieCSVT3JVwqDU8tio
	nXu0lE0VkueDvuj7DKXkSaJ8neX7sAlOPNWYarjC3mbotjxKpwS4W3ycVaCNBfO0Qlv8
	30Yw==
X-Gm-Message-State: AElRT7HP4T9QPOM64UmwUVBVfm8Np7eaRFtFLjqWOZXpxpgEbHtcWN6v
	Ck6ZE+JE4kJAERqobPNsBoIQwGy0
X-Google-Smtp-Source: AG47ELvMCjx6bbH0yzhXPllgtzN5CE3CLzO/BcxkOebN4yZpvpnpzdn8HIPlUmrHkbmKynLn00zclA==
X-Received: by 10.98.73.89 with SMTP id w86mr9107385pfa.227.1521435009825;
	Sun, 18 Mar 2018 21:50:09 -0700 (PDT)
Received: from hermes.local ([2601:646:8880:466c:9caa:7a18:94ee:bf41])
	by smtp.gmail.com with ESMTPSA id
	b6sm19279279pfm.160.2018.03.18.21.50.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 21:50:08 -0700 (PDT)
To: Parthiban Nallathambi <pn@denx.de>,
	openembedded-devel@lists.openembedded.org
References: <20180318164919.5142-1-pn@denx.de>
	<20180318164919.5142-2-pn@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <99fe4319-0f92-1544-599e-354633ae78aa@gmail.com>
Date: Sun, 18 Mar 2018 21:50:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20180318164919.5142-2-pn@denx.de>
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
X-List-Received-Date: Mon, 19 Mar 2018 04:50:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/18/18 9:49 AM, Parthiban Nallathambi wrote:
> Update the existing patch to work for hostapd 2.6
> (which is the current version of openembedded-core
> rocko branch).
> 
> "netifd.sh" is no more part of hostapd source, so
> removing it from do_install section of tweak
> 

thanks looks ok.

> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
> ---
>   recipes-tweaks/hostapd/hostapd/300-noscan.patch | 42 ++++++++++++-------------
>   recipes-tweaks/hostapd/hostapd_%.bbappend       |  2 --
>   2 files changed, 21 insertions(+), 23 deletions(-)
> 
> diff --git a/recipes-tweaks/hostapd/hostapd/300-noscan.patch b/recipes-tweaks/hostapd/hostapd/300-noscan.patch
> index e89cb9d..e9f8ee1 100644
> --- a/recipes-tweaks/hostapd/hostapd/300-noscan.patch
> +++ b/recipes-tweaks/hostapd/hostapd/300-noscan.patch
> @@ -1,7 +1,7 @@
> -diff -ruN hostapd-2.5.orig/hostapd/config_file.c hostapd-2.5/hostapd/config_file.c
> ---- hostapd-2.5.orig/hostapd/config_file.c	2017-02-15 16:20:07.102232803 -0700
> -+++ hostapd-2.5/hostapd/config_file.c	2017-02-15 16:20:35.132232593 -0700
> -@@ -2795,6 +2795,10 @@
> +diff -ruN hostapd-2.6/hostapd/config_file.c hostapd-2.6.orig/hostapd/config_file.c
> +--- hostapd-2.6/hostapd/config_file.c	2016-10-02 20:51:11.000000000 +0200
> ++++ hostapd-2.6.orig/hostapd/config_file.c	2018-03-17 23:05:11.032723997 +0100
> +@@ -2863,6 +2863,10 @@
>    		}
>    #endif /* CONFIG_IEEE80211W */
>    #ifdef CONFIG_IEEE80211N
> @@ -12,10 +12,10 @@ diff -ruN hostapd-2.5.orig/hostapd/config_file.c hostapd-2.5/hostapd/config_file
>    	} else if (os_strcmp(buf, "ieee80211n") == 0) {
>    		conf->ieee80211n = atoi(pos);
>    	} else if (os_strcmp(buf, "ht_capab") == 0) {
> -diff -ruN hostapd-2.5.orig/src/ap/ap_config.h hostapd-2.5/src/ap/ap_config.h
> ---- hostapd-2.5.orig/src/ap/ap_config.h	2017-02-15 16:20:07.105566137 -0700
> -+++ hostapd-2.5/src/ap/ap_config.h	2017-02-15 16:20:35.135565927 -0700
> -@@ -626,6 +626,8 @@
> +diff -ruN hostapd-2.6/src/ap/ap_config.h hostapd-2.6.orig/src/ap/ap_config.h
> +--- hostapd-2.6/src/ap/ap_config.h	2016-10-02 20:51:11.000000000 +0200
> ++++ hostapd-2.6.orig/src/ap/ap_config.h	2018-03-17 23:04:30.697722861 +0100
> +@@ -664,6 +664,8 @@
>    
>    	int ht_op_mode_fixed;
>    	u16 ht_capab;
> @@ -24,22 +24,22 @@ diff -ruN hostapd-2.5.orig/src/ap/ap_config.h hostapd-2.5/src/ap/ap_config.h
>    	int ieee80211n;
>    	int secondary_channel;
>    	int no_pri_sec_switch;
> -diff -ruN hostapd-2.5.orig/src/ap/hw_features.c hostapd-2.5/src/ap/hw_features.c
> ---- hostapd-2.5.orig/src/ap/hw_features.c	2017-02-15 16:20:07.105566137 -0700
> -+++ hostapd-2.5/src/ap/hw_features.c	2017-02-15 16:22:03.158898602 -0700
> -@@ -472,7 +472,7 @@
> - 	struct wpa_driver_scan_params params;
> - 	int ret;
> +diff -ruN hostapd-2.6/src/ap/hw_features.c hostapd-2.6.orig/src/ap/hw_features.c
> +--- hostapd-2.6/src/ap/hw_features.c	2016-10-02 20:51:11.000000000 +0200
> ++++ hostapd-2.6.orig/src/ap/hw_features.c	2018-03-17 23:05:54.273725214 +0100
> +@@ -226,7 +226,7 @@
> + {
> + 	int pri_chan, sec_chan;
>    
>   -	if (!iface->conf->secondary_channel)
>   +	if (!iface->conf->secondary_channel || iface->conf->noscan)
> - 		return 0; /* HT40 not used */
> + 		return 1; /* HT40 not used */
>    
> - 	hostapd_set_state(iface, HAPD_IFACE_HT_SCAN);
> -diff -ruN hostapd-2.5.orig/src/ap/ieee802_11_ht.c hostapd-2.5/src/ap/ieee802_11_ht.c
> ---- hostapd-2.5.orig/src/ap/ieee802_11_ht.c	2017-02-15 16:20:07.105566137 -0700
> -+++ hostapd-2.5/src/ap/ieee802_11_ht.c	2017-02-15 16:20:35.135565927 -0700
> -@@ -221,6 +221,9 @@
> + 	pri_chan = iface->conf->channel;
> +diff -ruN hostapd-2.6/src/ap/ieee802_11_ht.c hostapd-2.6.orig/src/ap/ieee802_11_ht.c
> +--- hostapd-2.6/src/ap/ieee802_11_ht.c	2016-10-02 20:51:11.000000000 +0200
> ++++ hostapd-2.6.orig/src/ap/ieee802_11_ht.c	2018-03-17 23:08:20.303729325 +0100
> +@@ -244,6 +244,9 @@
>    	if (!(iface->conf->ht_capab & HT_CAP_INFO_SUPP_CHANNEL_WIDTH_SET))
>    		return;
>    
> @@ -49,7 +49,7 @@ diff -ruN hostapd-2.5.orig/src/ap/ieee802_11_ht.c hostapd-2.5/src/ap/ieee802_11_
>    	if (len < IEEE80211_HDRLEN + 2 + sizeof(*bc_ie))
>    		return;
>    
> -@@ -345,6 +348,9 @@
> +@@ -368,6 +371,9 @@
>    	if (iface->current_mode->mode != HOSTAPD_MODE_IEEE80211G)
>    		return;
>    
> diff --git a/recipes-tweaks/hostapd/hostapd_%.bbappend b/recipes-tweaks/hostapd/hostapd_%.bbappend
> index be45723..3b2f646 100644
> --- a/recipes-tweaks/hostapd/hostapd_%.bbappend
> +++ b/recipes-tweaks/hostapd/hostapd_%.bbappend
> @@ -15,8 +15,6 @@ do_install_append() {
>       install -d ${D}${base_libdir}/netifd/wireless
>       install -d ${D}${base_libdir}/wifi
>   
> -    install -m 0755 ${WORKDIR}/git/openwrt/package/network/services/hostapd/files/netifd.sh ${D}${base_libdir}/netifd/hostapd.sh
> -
>       install -m 0755 ${WORKDIR}/git/openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh ${D}${base_libdir}/wifi/mac80211.sh
>       install -m 0755 ${WORKDIR}/git/openwrt/package/kernel/mac80211/files/lib/netifd/wireless/mac80211.sh ${D}${base_libdir}/netifd/wireless/mac80211.sh
>   }
> 

