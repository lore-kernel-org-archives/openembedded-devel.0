Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBB3C77B7C
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 20:35:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3774.1682541320640065638
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Apr 2023 13:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=p57SSBdF;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QKZF5i099030;
	Wed, 26 Apr 2023 15:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682541315;
	bh=Mph+rePm4eJQGL0gBObBhikvFQJGBjGNLdv/MEgsbRQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=p57SSBdFmhbRV7GbRfKXyoqQ4CYSdGKQw/icDGdo97rZgnLuTwuyaDEazsiNOvbGC
	 hJD6Dl0tbzaq9fBEiT7beaeOesvvhGAaObELfdU17mhwTdi4qrRpqdQRFOmzPDFMHO
	 KnMhyDL7EhTS1j0wqdX6ZwJf+NdY3C5kH0ikvunw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QKZFbo007518
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Apr 2023 15:35:15 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Apr 2023 15:35:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Apr 2023 15:35:15 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QKZ7wG003450;
	Wed, 26 Apr 2023 15:35:15 -0500
From: <rs@ti.com>
To: <openembedded-devel@lists.openembedded.org>, <afd@ti.com>,
        <reatmon@ti.com>, <denis@denix.org>, <akuster808@gmail.com>
CC: <detheridge@ti.com>, Randolph Sapp <rs@ti.com>
Subject: [meta-oe][kirkstone][PATCH] glfw: add packageconfig and wayland dependencies
Date: Wed, 26 Apr 2023 15:34:53 -0500
Message-ID: <20230426203453.3497409-2-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426203453.3497409-1-rs@ti.com>
References: <20230426203453.3497409-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Apr 2023 20:35:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102202

From: Randolph Sapp <rs@ti.com>

GLFW has the ability to use a wayland backend. This patch adds a config
for it and attempts to automatically resolve the most common collision
since the wayland and x11 backends are mutually exclusive.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-oe/recipes-core/glfw/glfw_3.3.bb | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core/glfw/glfw_3.3.bb
index b31bba6b6b..29d7b5de42 100644
--- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
+++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
@@ -20,7 +20,18 @@ EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DGLFW_BUILD_DOCS=OFF"
 
 CFLAGS += "-fPIC"
 
-DEPENDS = "libpng libglu zlib libxrandr libxinerama libxi libxcursor"
-REQUIRED_DISTRO_FEATURES = "x11 opengl"
+DEPENDS = "libpng libglu zlib"
+REQUIRED_DISTRO_FEATURES = "opengl"
+ANY_OF_DISTRO_FEATURES = "wayland x11"
+
+# upstream considers x11 and wayland backends mutually exclusive and will
+# prioritize wayland if it is enabled
+
+PACKAGECONFIG ??= " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'x11', d)} \
+"
+
+PACKAGECONFIG[wayland] = "-DGLFW_USE_WAYLAND=ON,,wayland wayland-native wayland-protocols extra-cmake-modules libxkbcommon"
+PACKAGECONFIG[x11] = ",,libxrandr libxinerama libxi libxcursor"
 
 COMPATIBLE_HOST:libc-musl = "null"
-- 
2.40.0


