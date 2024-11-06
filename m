Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35068D59F71
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 20:25:39 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.56321.1730924729247689268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 12:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J8pE2xXo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 547D860004;
	Wed,  6 Nov 2024 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730924727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Xli6OYkAgIJk/htxjoWU3vdK1uHGRqEXDY4Nql96YY=;
	b=J8pE2xXo94vajyARMjnb4k2NupXIzucfNjJx/akOJbgBZWELgCtupRsPlUeaspVsYYoTqV
	RrCnkMpFDrCeUEGfY0zLhqRL9xmZ/0saMaKmAlqkI3a+nGuEIODSc/L//P9JWYC6zVrxsk
	s+qR11xreVw7+oG0vkWlDu42jb5ROJ/M/6Gdq2rUY1kQ8sfh5C0qkRfXwsgl3rYSTNCVY4
	s+Ocui/qT4BVdUq2YPeybL2CpyRQIG/cbFElViYciR85Yw3pYM2g11quiXB+d/KVrfbAIs
	idVN9mhAHHo2IlQUPZa7gPozrwN4VcQx738OQwp+mYMEQQlmF/rujOQrKm8tCw==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-oe][PATCH v2] taisei: add a recipe for version 1.4.2
Date: Wed,  6 Nov 2024 21:23:16 +0100
Message-ID: <20241106202327.94170-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 20:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113745

From: Thomas Perrot <thomas.perrot@bootlin.com>

Taisei Project is an open source danmaku.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---

Changes in version 2:
- Fixes the strip issue
- Uses the variable ${datadir}
- Moves the recipe to a dynamic layer.

 meta-oe/conf/layer.conf                       |  2 +
 ...e-strip-option-from-executable-build.patch | 29 +++++++++++
 .../recipes-graphics/taisei/taisei_1.4.2.bb   | 52 +++++++++++++++++++
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 4 files changed, 84 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-Remove-strip-option-from-executable-build.patch
 create mode 100644 meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index d05f26588cab..351837eafc39 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -28,6 +28,8 @@ BBFILE_PRIORITY_openembedded-layer = "5"
 BBFILES_DYNAMIC += " \
     meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
     meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bbappend \
+    multimedia-layer:${LAYERDIR}/dynamic-layers/multimedia-layer/recipes-*/*/*.bb \
+    multimedia-layer:${LAYERDIR}/dynamic-layers/multimedia-layer/recipes-*/*/*.bbappend \
     networking-layer:${LAYERDIR}/dynamic-layers/networking-layer/recipes-*/*/*.bb \
     networking-layer:${LAYERDIR}/dynamic-layers/networking-layer/recipes-*/*/*.bbappend \
     gnome-layer:${LAYERDIR}/dynamic-layers/gnome-layer/recipes-*/*/*.bb \
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-Remove-strip-option-from-executable-build.patch b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-Remove-strip-option-from-executable-build.patch
new file mode 100644
index 000000000000..da9f9267008b
--- /dev/null
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-Remove-strip-option-from-executable-build.patch
@@ -0,0 +1,29 @@
+From 6c86f8aea2a29c33af3f212afa9f0ea180822d1e Mon Sep 17 00:00:00 2001
+From: Thomas Perrot <thomas.perrot@bootlin.com>
+Date: Wed, 6 Nov 2024 21:02:54 +0100
+Subject: [PATCH] Remove strip option from executable build
+
+To improve debugging experience, OE tasks will strip binaries.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 88d4d53263ae..8a1f540836e0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -73,7 +73,6 @@ project('taisei', 'c',
+
+         # You may want to change these for a debug build dir
+         'buildtype=release',
+-        'strip=true',
+         'b_lto=true',
+         'b_ndebug=if-release',
+     ]
+--
+2.47.0
+
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
new file mode 100644
index 000000000000..4d34239a984d
--- /dev/null
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
@@ -0,0 +1,52 @@
+SUMMARY = "Taisei Project is an open source danmaku"
+DESCRIPTION = "Taisei Project is an open source fan-game set in the world of \
+               Tōhō Project. It is a top-down vertical-scrolling curtain fire \
+               shooting game (STG), also known as a 'bullet hell' or 'danmaku'. \
+               STGs are fast-paced games focused around pattern recognition and \
+               mastery through practice."
+HOMEPAGE = "https://taisei-project.org"
+BUGTRACKER = "https://github.com/taisei-project/taisei/issues"
+LICENSE = "CC-BY-4.0 & CC0-1.0 & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1a11ffd7e1bdd1d3156cecec60a2846f"
+
+DEPENDS = "\
+    cglm \
+    freetype \
+    libsdl2 \
+    libwebp \
+    opusfile \
+    zstd \
+"
+
+RDEPENDS_${PN} = "\
+    cglm (>= 0.7.8) \
+    freetype \
+    libsdl2 (>= 2.0.16) \
+    libpng (>= 1.5.0) \
+    libwebp (>= 0.5) \
+    libzstd (>= 1.4.0) \
+    opengl (>= 3.3) \
+    opusfile \
+    zlib \
+"
+
+SRC_URI = "gitsm://github.com/taisei-project/taisei.git;branch=v1.4.x;protocol=https \
+           file://0001-Remove-strip-option-from-executable-build.patch"
+
+SRCREV = "c098579d4fa0f004ccc204c5bc46eac3717cba28"
+
+S = "${WORKDIR}/git"
+
+inherit features_check meson mime mime-xdg pkgconfig python3native
+
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[a_null] = "-Da_null=true,-Da_null=false"
+PACKAGECONFIG[developer] = "-Ddeveloper=true,-Ddeveloper=false"
+PACKAGECONFIG[docs] = "-Ddocs=true,-Ddocs=false,python3-docutils-native"
+
+
+
+FILES:${PN} += "${datadir}"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 178256c83f63..4635fe3d44d0 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -521,6 +521,7 @@ RDEPENDS:packagegroup-meta-oe-graphics = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "st", "", d)} \
     stalonetray \
     surf \
+    taisei \
     terminus-font-consolefonts \
     terminus-font-pcf \
     tesseract \
--
2.47.0

