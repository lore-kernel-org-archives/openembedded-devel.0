Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41111D59F74
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 20:37:19 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.56377.1730925430877699936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 12:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=crr6wiz4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE9361C0004;
	Wed,  6 Nov 2024 20:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730925429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+IxRqg6zERTkXGXP2f9yzQpZqd1shREo5xOrOurWDqI=;
	b=crr6wiz4Uix/63xJvq4WL+hQYJexqau3/Oi0PuH3T8G7fxBwZ/C1+x854o6WG6gb56/lru
	q1V0B2jUtW9UMO1Hpmy2P/AlBt+13ajKGlAg/RNJEMHOBP4HmI3qctVRw8VnUtEYNBLSFG
	PY7XfZF217hXHoJC+Ts7gBDiBVltTokIJnSHh69wCWsUDowMOmKmLG01DPZUXW7Ih5Dleg
	l734KA/QmdrbU9eTPfIuycKyOca195R8sDHin+dgnDea7LBJheExdVDPzh+escrmRKycSU
	Sha87vr+1a7LIcbwElO2ucsAK8AHOBi4FMrxcQ95NHYCq5Q2XmzZouVxZRwUWg==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-oe][PATCH v3] taisei: add a recipe for version 1.4.2
Date: Wed,  6 Nov 2024 21:37:01 +0100
Message-ID: <20241106203705.113159-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 20:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113746

From: Thomas Perrot <thomas.perrot@bootlin.com>

Taisei Project is an open source danmaku.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---

Changes in version 2:
- Fixes the strip issue.
- Uses the variable ${datadir}.
- Moves the recipe to a dynamic layer.

Changes in version 3:
- Add a packagegroup-meta-oe.bbappend in multimedia-layer.

 meta-oe/conf/layer.conf                       |  2 +
 .../packagegroup-meta-oe.bbappend             |  1 +
 ...e-strip-option-from-executable-build.patch | 29 +++++++++++
 .../recipes-graphics/taisei/taisei_1.4.2.bb   | 52 +++++++++++++++++++
 4 files changed, 84 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/multimedia-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
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
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/multimedia-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
new file mode 100644
index 000000000000..7353193c2379
--- /dev/null
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -0,0 +1 @@
+RDEPENDS:packagegroup-meta-oe-graphics:append = "${@bb.utils.contains('BBFILE_COLLECTIONS', 'multimedia-layer', ' taisei', '', d)}"
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
--
2.47.0

