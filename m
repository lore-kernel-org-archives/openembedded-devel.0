Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B537DC001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:19:19 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.116134.1698049158564817437
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="136682220"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="136682220"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:19:16 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 007DBCA1E6
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:19:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BF4AD5E26
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:19:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 83CDB6BA7B;
	Mon, 23 Oct 2023 17:19:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-font-viewer: upgrade 44.0 -> 45.0
Date: Mon, 23 Oct 2023 16:18:57 +0800
Message-Id: <1698049137-24409-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-6.003100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrItpoBuaLs/yU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNupDIC9422DoEa8g1x8eqFwGmfURCSgJBzGZ
	7HyniqgKZmUM+T2hLBfU6xtukJhsx5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO1zbS
	W8HZ+hqMTeh7ZDtigZNBOa5C80X/6dTOZTZaXFA8NNnQkFta1GbvAKS1bxoZbttmuzufESmUOby
	qNxmHbWD9KlZc4OGQZRzEX76yNB9w==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105636

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
translation update:
 * Belarusian
 * Chinese (China)
 * Dutch
 * English (United Kingdom)
 * Greek, Modern (1453*)
 * Icelandic
 * Italian
 * Kazakh
 * Portuguese (Brazil)
 * Turkish

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-font-viewer_44.0.bb => gnome-font-viewer_45.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_44.0.bb => gnome-font-viewer_45.0.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_44.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_44.0.bb
rename to meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb
index ff5e1e2c8c..2b24e54fe5 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb
@@ -16,7 +16,7 @@ inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "a1511df30b228cc2ef1175dd9d2b93438ea912e25913404b263cf3d457bb9f97"
+SRC_URI[archive.sha256sum] = "97cb6b68dda60de0ab3038383586f1e4bc1da5a48f44025bd6bbe74ea05c2b08"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.34.1


