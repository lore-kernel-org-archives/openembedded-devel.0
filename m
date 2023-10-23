Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E8FC001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:17:39 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.116118.1698049050438272769
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="124886782"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="124886782"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:17:27 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 868B6DDC7C
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:17:25 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BB0FBD88A6
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:17:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BFBB86F98;
	Mon, 23 Oct 2023 17:17:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-backgrounds: upgrade 44.0 -> 45.0
Date: Mon, 23 Oct 2023 16:16:46 +0800
Message-Id: <1698049006-24315-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10--4.148800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrz8j+bxoiWAy8B7vl7G5M0b4z
	fTpGjdbaMzTo2qNcI5YNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2O3i
	gRTX1/Yqu9xE0vJpX53k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6UIb
	ShDCHkEKDjpQmRx1/JweNXqbj26UFbZ6MD2oTyPUdvvduoH4CuWKIQS9TQfCMqXzCMJV7ft09n0
	WW2SeErwyPwaasb0mGCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105634

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- revert to JPEGs
- blue default (light)
- new default
- morphogenesis (reactive diffusion)
- pipes
- updated pixels & truchet

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-backgrounds_44.0.bb => gnome-backgrounds_45.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_44.0.bb => gnome-backgrounds_45.0.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_44.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_44.0.bb
rename to meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb
index 2934b7398b..534f9a4c23 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb
@@ -8,7 +8,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gettext allarch
 
-SRC_URI[archive.sha256sum] = "4a8393b387135f2a6a424a1a0c3ac94e0742b62b8235a0923c929f51e04be04e"
+SRC_URI[archive.sha256sum] = "cee0e688fbae5ef7a75f335ada2d10779e08ebca9445f1586de32c5a9b6dee2d"
 
 FILES:${PN} += " \
     ${datadir}/backgrounds \
-- 
2.34.1


