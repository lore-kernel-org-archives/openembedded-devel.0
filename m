Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390C1D43FFD
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.36710.1731922207111980736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZxWSOj26;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922207; x=1763458207;
  h=from:to:cc:subject:date:message-id;
  bh=1QTBUIdGXuFTx7/hoGUfiPaflmrz2HvAOFMn98oVBF4=;
  b=ZxWSOj26TflKObnQqfGlbFz1ZtXJkm0q5IE35z42knuNVFi5nj/j6nO0
   w1n4EkMcPurLfdzABfFxYkeV2oUM4KXu4mjjOSxl1P307CoD3c2DpdWnI
   MN5ONKlQZ4qJaBMrApr8XB/Htb4rCpKTryJbSjmGS4HO3bX6iU609N912
   S8V01wUYYBJrKCRJOeqF2Yg7dxggeanalo7eDv+DTkEbpH+G93VYA/x//
   gEMuh2mm+JV4g8w9Pp4y4NH+6wDutosjY/MFQmx8DOZg8YxD/I+QWkuEX
   W2y9mIuAG21mgVy7TtLy1w1+rM6cR26X54GiQFIqFBubR3lcdZsZixqcs
   Q==;
X-CSE-ConnectionGUID: V/oZE3frSgWvsERQJr1nLA==
X-CSE-MsgGUID: o8RQS8AdRB23nf8NbBWJeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="180826421"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="180826421"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:05 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B866D79AEA
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4777FBDC8F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A1F2B20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2FA741A000B;
	Mon, 18 Nov 2024 17:30:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 01/32] gegl: upgrade 0.4.48 -> 0.4.50
Date: Mon, 18 Nov 2024 17:29:24 +0800
Message-Id: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--2.064100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2s0FJKIRy8cWoSrTBNvgnvJs0T0PE+KHuV9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrdAj/zRL3+XlE4UbEXb4hC9mKo1y2nb53D0XEWX/8okHqRh7c8TPhrnV84
	0qV/p3JSTlr+RthoQMudybeOCTxs9xDW8N7XNuKR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113867

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.48.bb => gegl_0.4.50.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.48.bb => gegl_0.4.50.bb} (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.48.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.50.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.48.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.50.bb
index 34e001a5f..665e8ae1b 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.48.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.50.bb
@@ -26,7 +26,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "418c26d94be8805d7d98f6de0c6825ca26bd74fcacb6c188da47533d9ee28247"
+SRC_URI[sha256sum] = "6084969b06ee86ca71142133773f27e13f02e5a6a22c2cfce452ecaaddb790c1"
 
 PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "libpng librsvg"
-- 
2.34.1


