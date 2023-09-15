Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDE6EEAA7E
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 01:05:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.11149.1694739925823755037
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 18:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=y6lg0MBG;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38F15OUC096159;
	Thu, 14 Sep 2023 20:05:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694739924;
	bh=p1Se3BgmHNSvUW2t0DJ/Svtn7wtFmblLJBIuKxLYlJs=;
	h=From:To:CC:Subject:Date;
	b=y6lg0MBG/mJniMGeiw5A6yRMkj6VfpVtFRb/lc+tV8cJiwxs1YIxX441MaONJE0QY
	 nOYTVHgy+QxEANbKj6WHDzhWa2n+Kwb46xWurKQfjFdWdGCYMCA4ear+KNPzvm0Jz1
	 fSdS08Hk0Gjmq0V5NOv8/D+JLtYotTRXRH0B4Cdc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38F15Ol3112605
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 14 Sep 2023 20:05:24 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Sep 2023 20:05:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Sep 2023 20:05:24 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38F15OCG002423;
	Thu, 14 Sep 2023 20:05:24 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [oe][meta-oe][kirkstone] freeglut: add packageconfigs for x11, wayland, gles, and demos
Date: Thu, 14 Sep 2023 20:05:13 -0500
Message-ID: <20230915010513.3425887-1-rs@ti.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 01:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104881

From: Randolph Sapp <rs@ti.com>

Add the PACKAGECONFIG entries to build freeglut for wayland and x11,
which should conflict in this release, and add the ability to build a
GLES release.

Also split the demos their own config. The demos will conflict with the
gles flag as they still require desktop GL in this release. This is
essentially a loose backport of the following patch for this older
release:

a9212722c (freeglut: Add packageconfigs for x11/wayland/gles, 2023-01-10)

It does not change the current default behavior of compiling for x11
with demos.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
index 6ef9f74c70..a204f86a6f 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
@@ -10,11 +10,18 @@ SRC_URI[sha256sum] = "d4000e02102acaf259998c870e25214739d1f16f67f99cb35e4f468413
 inherit cmake features_check
 
 # depends on virtual/libx11, virtual/libgl
-REQUIRED_DISTRO_FEATURES = "x11 opengl"
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+PACKAGECONFIG ?= "x11 demos"
+
+PACKAGECONFIG[x11] = ",,virtual/libx11 virtual/libgl libxi libglu,,,wayland"
+PACKAGECONFIG[wayland] = "-DFREEGLUT_WAYLAND=ON,-DFREEGLUT_WAYLAND=OFF,wayland,,,x11"
+PACKAGECONFIG[gles] = "-DFREEGLUT_GLES=ON,-DFREEGLUT_GLES=OFF,virtual/libgles1 virtual/libgles2 virtual/egl,,,demos"
+PACKAGECONFIG[demos] = "-DFREEGLUT_BUILD_DEMOS=ON,-DFREEGLUT_BUILD_DEMOS=OFF"
 
 # Do not use -fno-common, check back when upgrading to new version it might not be needed
 CFLAGS += "-fcommon"
 
 PROVIDES += "mesa-glut"
 
-DEPENDS = "virtual/libx11 libxmu libxi virtual/libgl libglu libxrandr"
+DEPENDS = "libxkbcommon"
-- 
2.42.0


