Return-Path: <pn@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 81D977867B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 16:50:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4044vm34cLz1qsVy;
	Sun, 18 Mar 2018 17:51:00 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4044vm2pHMz1qql0;
	Sun, 18 Mar 2018 17:51:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id C-fB1RG71xgV; Sun, 18 Mar 2018 17:50:59 +0100 (CET)
X-Auth-Info: coiciNpxnos1m132Hhi9seVznthm5+aU3e9EcDzakhI=
Received: from hercules.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 18 Mar 2018 17:50:59 +0100 (CET)
From: Parthiban Nallathambi <pn@denx.de>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Sun, 18 Mar 2018 17:49:19 +0100
Message-Id: <20180318164919.5142-2-pn@denx.de>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180318164919.5142-1-pn@denx.de>
References: <20180318164919.5142-1-pn@denx.de>
Cc: barathiraja@gmail.com
Subject: [meta-openwrt][PATCH] [hostapd]: Update patch based on 2.6 version
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
X-List-Received-Date: Sun, 18 Mar 2018 16:50:59 -0000

Update the existing patch to work for hostapd 2.6
(which is the current version of openembedded-core
rocko branch).

"netifd.sh" is no more part of hostapd source, so
removing it from do_install section of tweak

Signed-off-by: Parthiban Nallathambi <pn@denx.de>
---
 recipes-tweaks/hostapd/hostapd/300-noscan.patch | 42 ++++++++++++-------------
 recipes-tweaks/hostapd/hostapd_%.bbappend       |  2 --
 2 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/recipes-tweaks/hostapd/hostapd/300-noscan.patch b/recipes-tweaks/hostapd/hostapd/300-noscan.patch
index e89cb9d..e9f8ee1 100644
--- a/recipes-tweaks/hostapd/hostapd/300-noscan.patch
+++ b/recipes-tweaks/hostapd/hostapd/300-noscan.patch
@@ -1,7 +1,7 @@
-diff -ruN hostapd-2.5.orig/hostapd/config_file.c hostapd-2.5/hostapd/config_file.c
---- hostapd-2.5.orig/hostapd/config_file.c	2017-02-15 16:20:07.102232803 -0700
-+++ hostapd-2.5/hostapd/config_file.c	2017-02-15 16:20:35.132232593 -0700
-@@ -2795,6 +2795,10 @@
+diff -ruN hostapd-2.6/hostapd/config_file.c hostapd-2.6.orig/hostapd/config_file.c
+--- hostapd-2.6/hostapd/config_file.c	2016-10-02 20:51:11.000000000 +0200
++++ hostapd-2.6.orig/hostapd/config_file.c	2018-03-17 23:05:11.032723997 +0100
+@@ -2863,6 +2863,10 @@
  		}
  #endif /* CONFIG_IEEE80211W */
  #ifdef CONFIG_IEEE80211N
@@ -12,10 +12,10 @@ diff -ruN hostapd-2.5.orig/hostapd/config_file.c hostapd-2.5/hostapd/config_file
  	} else if (os_strcmp(buf, "ieee80211n") == 0) {
  		conf->ieee80211n = atoi(pos);
  	} else if (os_strcmp(buf, "ht_capab") == 0) {
-diff -ruN hostapd-2.5.orig/src/ap/ap_config.h hostapd-2.5/src/ap/ap_config.h
---- hostapd-2.5.orig/src/ap/ap_config.h	2017-02-15 16:20:07.105566137 -0700
-+++ hostapd-2.5/src/ap/ap_config.h	2017-02-15 16:20:35.135565927 -0700
-@@ -626,6 +626,8 @@
+diff -ruN hostapd-2.6/src/ap/ap_config.h hostapd-2.6.orig/src/ap/ap_config.h
+--- hostapd-2.6/src/ap/ap_config.h	2016-10-02 20:51:11.000000000 +0200
++++ hostapd-2.6.orig/src/ap/ap_config.h	2018-03-17 23:04:30.697722861 +0100
+@@ -664,6 +664,8 @@
  
  	int ht_op_mode_fixed;
  	u16 ht_capab;
@@ -24,22 +24,22 @@ diff -ruN hostapd-2.5.orig/src/ap/ap_config.h hostapd-2.5/src/ap/ap_config.h
  	int ieee80211n;
  	int secondary_channel;
  	int no_pri_sec_switch;
-diff -ruN hostapd-2.5.orig/src/ap/hw_features.c hostapd-2.5/src/ap/hw_features.c
---- hostapd-2.5.orig/src/ap/hw_features.c	2017-02-15 16:20:07.105566137 -0700
-+++ hostapd-2.5/src/ap/hw_features.c	2017-02-15 16:22:03.158898602 -0700
-@@ -472,7 +472,7 @@
- 	struct wpa_driver_scan_params params;
- 	int ret;
+diff -ruN hostapd-2.6/src/ap/hw_features.c hostapd-2.6.orig/src/ap/hw_features.c
+--- hostapd-2.6/src/ap/hw_features.c	2016-10-02 20:51:11.000000000 +0200
++++ hostapd-2.6.orig/src/ap/hw_features.c	2018-03-17 23:05:54.273725214 +0100
+@@ -226,7 +226,7 @@
+ {
+ 	int pri_chan, sec_chan;
  
 -	if (!iface->conf->secondary_channel)
 +	if (!iface->conf->secondary_channel || iface->conf->noscan)
- 		return 0; /* HT40 not used */
+ 		return 1; /* HT40 not used */
  
- 	hostapd_set_state(iface, HAPD_IFACE_HT_SCAN);
-diff -ruN hostapd-2.5.orig/src/ap/ieee802_11_ht.c hostapd-2.5/src/ap/ieee802_11_ht.c
---- hostapd-2.5.orig/src/ap/ieee802_11_ht.c	2017-02-15 16:20:07.105566137 -0700
-+++ hostapd-2.5/src/ap/ieee802_11_ht.c	2017-02-15 16:20:35.135565927 -0700
-@@ -221,6 +221,9 @@
+ 	pri_chan = iface->conf->channel;
+diff -ruN hostapd-2.6/src/ap/ieee802_11_ht.c hostapd-2.6.orig/src/ap/ieee802_11_ht.c
+--- hostapd-2.6/src/ap/ieee802_11_ht.c	2016-10-02 20:51:11.000000000 +0200
++++ hostapd-2.6.orig/src/ap/ieee802_11_ht.c	2018-03-17 23:08:20.303729325 +0100
+@@ -244,6 +244,9 @@
  	if (!(iface->conf->ht_capab & HT_CAP_INFO_SUPP_CHANNEL_WIDTH_SET))
  		return;
  
@@ -49,7 +49,7 @@ diff -ruN hostapd-2.5.orig/src/ap/ieee802_11_ht.c hostapd-2.5/src/ap/ieee802_11_
  	if (len < IEEE80211_HDRLEN + 2 + sizeof(*bc_ie))
  		return;
  
-@@ -345,6 +348,9 @@
+@@ -368,6 +371,9 @@
  	if (iface->current_mode->mode != HOSTAPD_MODE_IEEE80211G)
  		return;
  
diff --git a/recipes-tweaks/hostapd/hostapd_%.bbappend b/recipes-tweaks/hostapd/hostapd_%.bbappend
index be45723..3b2f646 100644
--- a/recipes-tweaks/hostapd/hostapd_%.bbappend
+++ b/recipes-tweaks/hostapd/hostapd_%.bbappend
@@ -15,8 +15,6 @@ do_install_append() {
     install -d ${D}${base_libdir}/netifd/wireless
     install -d ${D}${base_libdir}/wifi
 
-    install -m 0755 ${WORKDIR}/git/openwrt/package/network/services/hostapd/files/netifd.sh ${D}${base_libdir}/netifd/hostapd.sh
-
     install -m 0755 ${WORKDIR}/git/openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh ${D}${base_libdir}/wifi/mac80211.sh
     install -m 0755 ${WORKDIR}/git/openwrt/package/kernel/mac80211/files/lib/netifd/wireless/mac80211.sh ${D}${base_libdir}/netifd/wireless/mac80211.sh
 }
-- 
2.14.3


