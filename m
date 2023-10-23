Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E47CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:23:49 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.116184.1698049422947307647
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="116018560"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="116018560"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:23:40 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9950ACA1E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:23:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BCC83D5D0A
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:23:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 09A382005932A;
	Mon, 23 Oct 2023 17:23:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] nautilus: upgrade 45.0 -> 45.1
Date: Mon, 23 Oct 2023 16:23:24 +0800
Message-Id: <1698049404-24685-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-5.789500-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrg55m5RSwLMIzOk0/RiyBubWq
	EGxX7nLrSpAFNe4DUJ6flBXZPsT+jhJ8EINAmcWbpzmJJw2f0KGy2aVB7PCjFapJJeOmt6X/I7c
	nzSpYxIOMx5HzfQifbE9pvTDp873GJS5vQb+mjdzTfU1/F+PbM1QQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaI2YNXUKC1G1khwlOfYeSqxnv1LjgVCGOKPaLJ/Ca3ST6H2J
	RtkvQH/+WwLl4YNYY55OPD8XJFfpB8TzIzimOwPruuVAw9Gg4LEQdG7H66TyMdRT5TQAJnAnT+p
	Tm26NDQ67DNGkPBLBnDV88FoMLeJCBWchITZDIhAW53w8x4XCA9UPsZDQeIIFoNgPVhuFN1Ngg0
	l/lajzgwL5Tx53DnK
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105643

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Bugfixes:
  - Don't crash when opening Properties from admin://*
  - Don't crash on unmount
  - Stop jumping to top when using the Menu key
  - Properly reorder bookmarks by drag and drop
  - Re-add search results when switching view mode
  - Fix compilation on 32-bit musl ("Newbyte")
  - Fix various leaks and warnings
* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_45.0.bb => nautilus_45.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_45.0.bb => nautilus_45.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_45.0.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_45.0.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
index a083d1799f..4853c0ce30 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_45.0.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
@@ -23,7 +23,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "b311c465ce2ca7bc648f61b865187b4451388dec9358a169f3277e741718ab5d"
+SRC_URI[archive.sha256sum] = "23bdaa9a85466c5937a89daddd080ed03bcc2b49e8b64af607206353bde82fe3"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 
-- 
2.34.1


