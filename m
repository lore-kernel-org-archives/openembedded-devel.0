Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8381AEB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2313.1687157419852830676
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="121192078"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="121192078"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:17 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DB29D29E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:15 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C74DD4BF5
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:14 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 87F972FC5C6B;
	Mon, 19 Jun 2023 15:50:13 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] adw-gtk3: upgrade 4.7 -> 4.8
Date: Mon, 19 Jun 2023 14:48:06 +0800
Message-Id: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10-0.161700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yRIRh9wkXSlFVOLMRauooBFL/3rQmWrTBvtT
	6sMMZ5MuhuRfRV85bwpJgQ29vKZLez9OpHvdKg7z7L2CHKVJ7UZUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiCGqH67UhpHuVd49c0zgWMxCE2NlBjIjcmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZIJvuBQkQp92rLjRkL/0eNuXVy6tEa4zV3yiexpvJMbc8cn3
	lPaGwNeouwjoiyRfU9x2kiXQdrSHLv1moEDdxYqPFYAT4BZUyRLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103357

From: Wang Mingyu <wangmy@fujitsu.com>

Chanelog:
==========
Remove color variable
Use libadwaita style outline border on list rows
Update README.md
Merge pull request #230 from SamuelBorn/patch-1
Don't style phosh #231
remove the gtk-4.0 folder from the theme

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-themes/{adw-gtk3_4.7.bb => adw-gtk3_4.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_4.7.bb => adw-gtk3_4.8.bb} (88%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.7.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.8.bb
similarity index 88%
rename from meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.7.bb
rename to meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.8.bb
index 8f412e431..2a3f772f8 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.7.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.8.bb
@@ -11,6 +11,6 @@ inherit meson
 SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "f5e0807a4572ef6d9ca27042b41211efb41936d2"
+SRCREV = "7ee024ed79f68875e5dea3616be24a703cf72cc5"
 
 FILES:${PN} = "${datadir}/themes"
-- 
2.34.1


