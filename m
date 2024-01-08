Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326CDC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:12:25 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.6090.1704719543985313899
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="145718853"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="145718853"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:12:21 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3015AD4F5A
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:12:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FD8216639
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:12:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E9E156895D
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:12:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C32F1A0072;
	Mon,  8 Jan 2024 21:12:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] adw-gtk3: upgrade 5.1 -> 5.2
Date: Mon,  8 Jan 2024 21:12:10 +0800
Message-Id: <1704719530-29333-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-2.173200-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLHBvqhRdA8sja7IBuOPthEuce7gFxhKa1C4sa7AidY08EguqiGeZ5Jo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLMXJoEAUtQ77oJZxLXxx3W9CjWx3I5WTvcmG
	V2uy1DBp1HbpC4YEZNivsqXGYj0vafdJCA52EmOCrFk10Th12FFgugh8e4OS7+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108130

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-themes/{adw-gtk3_5.1.bb => adw-gtk3_5.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_5.1.bb => adw-gtk3_5.2.bb} (88%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.1.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.2.bb
similarity index 88%
rename from meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.1.bb
rename to meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.2.bb
index 577acda59..d10f5ad41 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.1.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.2.bb
@@ -11,6 +11,6 @@ inherit meson
 SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "a3e1050341956fcae53b2b4403affcf2578a42f4"
+SRCREV = "8056d8701afbd9b985668916557159432e6ad824"
 
 FILES:${PN} = "${datadir}/themes"
-- 
2.34.1


