Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E6DC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 16:47:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.26274.1682614060221363318
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 09:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=n1ZVtquT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RGlYsl106233;
	Thu, 27 Apr 2023 11:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682614054;
	bh=Ss2e7j9L1/inMQYndIXKlA7ZU4w1m86Yyz1HBfPLL0k=;
	h=From:To:CC:Subject:Date;
	b=n1ZVtquTArQrYpISMxcTtoJj/aQnQ0xZX5EjXo1L23iBm2vCrzSd7IroPwtMBSE7i
	 iUXp8rQ3c3HT1RmXRjOYyra+vyNytTAHK+tHDU8poIPM2Tlj7qQuquSoboUencdCXP
	 gk0fXMy2gbNVPSnPkArHNTJIgk/HwB69plGJr63I=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RGlYgK019676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 11:47:34 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 11:47:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 11:47:33 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RGlXRM006264;
	Thu, 27 Apr 2023 11:47:33 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <afd@ti.com>, <akuster808@gmail.com>,
        <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <Openembedded-devel@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-oe][kirkstone][PATCHv2] glfw: add packageconfig and wayland dependencies
Date: Thu, 27 Apr 2023 11:47:23 -0500
Message-ID: <20230427164723.863197-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 16:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102216

From: Randolph Sapp <rs@ti.com>

GLFW has the ability to use a wayland backend. This patch adds a config
for it, but does not enable it by default because it has a dependency on
extra-cmake-modules which is provided (most commonly) by meta-qt5-extra.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-oe/recipes-core/glfw/glfw_3.3.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core/glfw/glfw_3.3.bb
index b31bba6b6b..5b0d61241e 100644
--- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
+++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
@@ -20,7 +20,17 @@ EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DGLFW_BUILD_DOCS=OFF"
 
 CFLAGS += "-fPIC"
 
-DEPENDS = "libpng libglu zlib libxrandr libxinerama libxi libxcursor"
-REQUIRED_DISTRO_FEATURES = "x11 opengl"
+DEPENDS = "libpng libglu zlib"
+REQUIRED_DISTRO_FEATURES = "opengl"
+ANY_OF_DISTRO_FEATURES = "wayland x11"
+
+# upstream considers x11 and wayland backends mutually exclusive and will
+# prioritize wayland if it is enabled, but wayland has dependencies that cannot
+# be satisfied by this layer so it is disabled by default
+
+PACKAGECONFIG ??= "x11"
+
+PACKAGECONFIG[wayland] = "-DGLFW_USE_WAYLAND=ON,,wayland wayland-native wayland-protocols extra-cmake-modules libxkbcommon"
+PACKAGECONFIG[x11] = ",,libxrandr libxinerama libxi libxcursor"
 
 COMPATIBLE_HOST:libc-musl = "null"
-- 
2.40.0


