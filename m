Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CFAC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:33:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.22333.1647419592012384552
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jAmuJmWu;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647419593; i=@fujitsu.com;
	bh=pSPQFLew6oUV+jKmWb6ge5UkAZaRPWdJ4hj526VrnEg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jAmuJmWuRhHgyyB+tyCsnACe2Qee2KK5cgP4Jlvm+munriyYrzUgE9VQ/I5fLxkA0
	 jlayhnyixU5xITxF4FEkoV4u+vr/C45JR8QR5L870xEfHJ8O0gTQIXEMO8blyhlpjh
	 vNeuj+Cv372uXQRK9AzTNLXxs3fG5pA7TKMphLRmH6l4s6T9QsvTYIBCvicwWyZQVZ
	 rnmAUGoivGVVwZR9E7FalC5rFdBJ+BNetORYQa1kT3H29AKlwe7p5WmZloP4f5rPLm
	 XA/j3HpHktiRdyzaytT+cWIuRC7blyTPGy081ZUt6+08T9UackNeeT9J2Dw609ge2N
	 dHIHZYONpYBoA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqHtsgWG
  SQctHQYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPnxROWgl2SFX2Xb7A0MHaKdzFycQgJPGGU
  mPTxLAuEc4FJYtKEq8wQzglGiUs/WoEynBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILCwRI/LzYBFbPIqAqsWTJRiYQm1fASeLsg8NgvRICChJTHr4H6+UUcJaYNGUPI4gtBFQz9f
  JXZoh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM1klFmekZJbmJmTm6hgYGuoaGprrGRrqGRmZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBgZxSrFC3g/Hayp96hxglOZiURHnPzzRMEuJLyk+pzEgszogvKs1JLT7EK
  MPBoSTBu3sOUE6wKDU9tSItMwcYVTBpCQ4eJRFe13lAad7igsTc4sx0iNQpRkUpcV4GkD4BkE
  RGaR5cGyySLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5rWZATSFJzOvBG76K6DFTECL50n
  rgSwuSURISTUwrbvyKqfikk2qXqZVrbZTss0TmbKN+qvOx0xerPhi0seNZ7qqilX2T5996wjj
  2sQfZcqHhDKPek949P7j9x98esm1N95Evype/WzOl7O1fmfu7O28uus8+6X8BSG7XLgTf93ey
  Ls/w3/mPtdvqVX2PrWGxrlfrJUvTvIxS/m3h+PAsQi3rqRF52vPOe0/dCbo+/3XQgdeHpLmDD
  A5vV0+s1zautxDc8Xj/B2er5mf1aUKf+9WXsOx49L+quXNr4vVa48aODTcjmd4uJxNMP2N+tq
  CS/uUNhp82vwgp9ef24BDf0VFoonPRe7yPMuz78R23zA9KXOUL7akpspvj+/3iE8Cxlt/zOhR
  zjufMZkjXYmlOCPRUIu5qDgRAJpZKVlfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1647419590!51565!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2831 invoked from network); 16 Mar 2022 08:33:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Mar 2022 08:33:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7B8A21001AE
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:33:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 419CD10004D
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:33:09 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Mar 2022 08:33:03 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] networkmanager: upgrade 1.36.0 ->
 1.36.2
Date: Wed, 16 Mar 2022 16:32:41 +0800
Message-ID: <1647419561-81555-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647419561-81555-1-git-send-email-wangmy@fujitsu.com>
References: <1647419561-81555-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 08:33:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96010

0001-do-not-ask-host-for-ifcfg-defaults.patch refreshed for new version

Changelog:
==========
* When the list of plugins is not specified via "main.plugins" in
  NetworkManager.conf and no build-time default is set with
  "--with-config-plugins-default" configure argument, now all known
  plugins found in the plugin directory are loaded (and the built-in
  "keyfile" plugin is preferred over others).
* Preserve external ports during checkpoint rollback
* Fix removal of ovsdb entry when an OVS interface goes away
* Fix DNS configuration for WWAN connections

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-do-not-ask-host-for-ifcfg-defaults.patch        | 9 +++------
 ...networkmanager_1.36.0.bb => networkmanager_1.36.2.bb} | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.36.0.bb => networkmanager_1.36.2.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-do-not-ask-host-for-ifcfg-defaults.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-do-not-ask-host-for-ifcfg-defaults.patch
index d3393b50c1..92b129320c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-do-not-ask-host-for-ifcfg-defaults.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-do-not-ask-host-for-ifcfg-defaults.patch
@@ -1,4 +1,4 @@
-From 3894ddf5f677a42ed01d676b68e25a414fd8a0ce Mon Sep 17 00:00:00 2001
+From 37559b659e22886d5f55837d4f167ba5fda73e85 Mon Sep 17 00:00:00 2001
 From: Adrian Freihofer <adrian.freihofer@siemens.com>
 Date: Sun, 29 Aug 2021 15:50:35 +0200
 Subject: [PATCH] do-not-ask-host-for-ifcfg-defaults
@@ -8,7 +8,7 @@ Subject: [PATCH] do-not-ask-host-for-ifcfg-defaults
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 3c4be61509..8833c62fa3 100644
+index d0cec83..289aa1b 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -304,8 +304,8 @@ else
@@ -21,7 +21,4 @@ index 3c4be61509..8833c62fa3 100644
 +enable_ifupdown = get_option('ifupdown')
  
  config_plugins_default = get_option('config_plugins_default')
- if config_plugins_default == ''
--- 
-2.31.1
-
+ config_h.set_quoted('NM_CONFIG_DEFAULT_MAIN_PLUGINS', config_plugins_default)
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
index 0ab8cad21c..b09ff18bf7 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
@@ -30,7 +30,7 @@ SRC_URI = " \
     file://enable-iwd.conf \
     file://0001-do-not-ask-host-for-ifcfg-defaults.patch \
 "
-SRC_URI[sha256sum] = "faa389c9e9ca78243cfab4a8bed6db132f82e5b5e66bb9d44af93379d1348398"
+SRC_URI[sha256sum] = "ab855cbe3b41832e9a3b003810e7c7313dfe19e630d29806d14d87fdd1470cab"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.25.1


