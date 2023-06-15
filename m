Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB51C001DC
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 20:57:03 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.29803.1686862618962631900
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 13:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=skd2KcpV;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FKutP9122360;
	Thu, 15 Jun 2023 15:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686862615;
	bh=P5WbaqDEWOKMhqwW2ebpEICvGU76C0XM8Gx5uHbnK0Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=skd2KcpV8zcjheTAQtzUf5ea2+fzsW02zPszMK2l8HpLqzOKfszGfsfR42dQD/ox7
	 PQFEGA8qyDjTw+OORATFQmqrOqozr2tgonv7zbayhr7RGLXkZLtFuB5VruZKr20210
	 17JQzgN1y+VbXMNRms1KT8Yc+h2JjflTu/hbi6mA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FKut0u117331
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 15:56:55 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 15:56:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 15:56:55 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FKutXg012389;
	Thu, 15 Jun 2023 15:56:55 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <afd@ti.com>, <denis@denix.org>
CC: <Openembedded-devel@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-oe][kirkstone][PATCH 1/6] glfw: add packageconfig and wayland dependencies
Date: Thu, 15 Jun 2023 15:56:32 -0500
Message-ID: <20230615205637.724348-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230615205637.724348-1-rs@ti.com>
References: <20230615205637.724348-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 20:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103324

From: Randolph Sapp <rs@ti.com>

GLFW has the ability to use a wayland backend. This patch adds a config
for it, but does not enable it by default because it has a dependency on
extra-cmake-modules which is provided (most commonly) by meta-qt5-extra.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-oe/recipes-core/glfw/glfw_3.3.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core/glfw/glfw_3.3.bb
index b31bba6b6..5b0d61241 100644
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
2.41.0


