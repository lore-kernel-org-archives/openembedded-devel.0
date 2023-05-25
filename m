Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1224AC7EE2C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:56:37 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.6187.1684997788012085625
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="97363561"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="97363561"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:56:24 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5134CCA1E8
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CF49E4AF5
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B09D2007CA80;
	Thu, 25 May 2023 15:56:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] adw-gtk3: upgrade 4.6 -> 4.7
Date: Thu, 25 May 2023 14:56:04 +0800
Message-Id: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10-3.329300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysS62IelkmKxwJi
	yPH3UolSSsgH/Q0SazFmVqJuy3MMGRLmJd2F/yFuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6pByRBJ91zJDrmb2Z4b9ZL3PhwfmFb3pieAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNV1AUl3bmfTuRItS85pP16s4ZIykaq+sj4bVfLXLvL+3w8qLxrFBpAUEH8Mh5S4IhMW0T
	7xmYkHNhKTbEgd+JVzO8mb+NX8MymJbZ4D2dIMgU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102804

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Make sure text selection is somewhat visible on websites with various
  backgrounds in both chromium and firefox
- Slightly increase contrast of menuitems
- Fix borders on vertical linked buttons
- Fix borders on vertical spinbuttons
- Change list row image-button style

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-themes/{adw-gtk3_4.6.bb => adw-gtk3_4.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_4.6.bb => adw-gtk3_4.7.bb} (88%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.6.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.7.bb
similarity index 88%
rename from meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.6.bb
rename to meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.7.bb
index 0b121183a..8f412e431 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.6.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.7.bb
@@ -11,6 +11,6 @@ inherit meson
 SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "f26e86c8a7b40ac23f165efdb620f734c0f1db23"
+SRCREV = "f5e0807a4572ef6d9ca27042b41211efb41936d2"
 
 FILES:${PN} = "${datadir}/themes"
-- 
2.34.1


