Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB9BCCF9FF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:49:55 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2253.1693964988796251540
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="119203835"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="119203835"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:49:45 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CA1DFDDC63
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:49:43 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DCF6D948F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:49:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C5A22FC7C3F;
	Wed,  6 Sep 2023 10:49:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] adw-gtk3: upgrade 4.8 -> 4.9
Date: Wed,  6 Sep 2023 09:49:33 +0800
Message-Id: <1693964973-13664-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.003
X-TMASE-Result: 10-1.063900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrA3QlQeE0l8Dk6Qbi+9i6D7qT
	orL333BQIX+UmmSwEkcNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl7SwC3zqzycU+Hv
	2UJ08905Zms6w/rdLbvU6xtukJhsx5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2FR9
	Hau8GO7qfDnZdVcKQkxSkRi4vw0T4k1fvN4Cjw/K4rUueqjfxXZE6fj4irdPA9ot0XgTlRSvsmy
	lfsXSo3+4swf/yK9P0asjjhzBAoQ1l4qW3QdlsIHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104729

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Radio buttons in Firefox
Make highlight more similar to Libadwaita
Icons in Budgie Panel are cutoff at sides
Add sidebar colors
Custom tab color fix

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-themes/{adw-gtk3_4.8.bb => adw-gtk3_4.9.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_4.8.bb => adw-gtk3_4.9.bb} (88%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.8.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.9.bb
similarity index 88%
rename from meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.8.bb
rename to meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.9.bb
index 2a3f772f8f..d7b7eef977 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.8.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.9.bb
@@ -11,6 +11,6 @@ inherit meson
 SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "7ee024ed79f68875e5dea3616be24a703cf72cc5"
+SRCREV = "08d3dfbde51d4cb0a3bb8e58a81aa61064857d89"
 
 FILES:${PN} = "${datadir}/themes"
-- 
2.34.1


