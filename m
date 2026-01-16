Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC36DD47CD5
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 10:48:25 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3253.1768560501248357813
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 02:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=fqodrAW1;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.45, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-655b5094119so57829a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 02:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768560499; x=1769165299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8mDzfML2h6j0/Exp/HnDJ/sWAKl/CNqRBPlcFhiTIQ=;
        b=fqodrAW17N0ACmx0cgVA2lJIvyJFmKxqnjkIqE68h28PVLXY9RbVNLUktCbK2RdAsd
         1msawuFSNxaNvsUcWaOGR1U8Q4df0Pddoa0/lgbGe+6UIubKJG+AiU1JUAS/VEBf23n2
         2pHNzbqB9wUh0RmX3sN8p2TyUP1bfBPIiJSK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560499; x=1769165299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k8mDzfML2h6j0/Exp/HnDJ/sWAKl/CNqRBPlcFhiTIQ=;
        b=gnGZSL93pfd883FIW0Hde9pyCvhhUs6WoWqllRE18HchW1B7ybPFsh1II8AyZjEWUA
         s+5j7QALdI1DYC3ks6o3UzSW6noUYkje1PuSD4RXegjxepwZnDoJl0Ahus3pF7XmN3QI
         wxFCOmV034KsgCnsK3SymIb649NRkwfB04jjsVPsqHxlHPlxC+pS3o9MgoAGrUnMWle5
         cy0345QpnA1o8QNjOjA8U0FCHaMeGf9QFcURPFaPJakcKBueOyEKn0ox1+ixjUx1cLW/
         TuVB9NN99QLZBPj7fdjoG7Mbawmqg3V7Ki5nRsSVhJx/0M0tLSxwrz5m2IFVkECJ8uBT
         Xxug==
X-Gm-Message-State: AOJu0YzZmcDks0ql1q7CK7AqEbzMhS5Xws6xWutsBqByMgHtcKNQyYW5
	0E7/GMbIScd8oqyCvPrpwWOZSEP4CyNB4Hm7E2mb0Zqm/LPeaaC6e46p66Kze5/DvhGMHXNKBEw
	VhgE+
X-Gm-Gg: AY/fxX69oyIiiWIBeV95SLxf/TrmtegKRxaU+U4VGOzRnWpVOzde90WwYLJqLvd2Kxs
	bLyWHjzORbGtY5nZq8PcHbBH9MpvIO1C83FxECdaJp7rfn8uwU5ZQ+0d+7b7XzAfeizYszo9xgb
	+aPkzLz5IdCV7CQjG+d7sM9xHK+0T0Ky6BnB2G6Iwo/UKShPyWMFMg9QfOmdMqIRmhjoWdA3zGr
	/SXwy4pftFvhEavSoCfsMhRa2uh1a5TDUHwO3FuPhaee38cT5gW6M5P+WiE5zXdYFePaNFYsra5
	eTzaPtOsiNJWJaU21pfK0v7s5QuKE1ligccuj2ukAp/pedE/EKJqRSJlp6GwNCKNUa04fBClq2D
	1FrsPC43Xx8Oc3ApdGFwcUe60Jt2FrWbov4E9kvS8AgD5lot4nZy8S20/wuxvE7k99HBDT0f/Cb
	dxf/qQ4h3btsmiwxpotzLVNmfdOmlnxGSDPmznI7mmi5NlqKKA+Lk9ZoLOyKD5dqIr6K23Mdwro
	/0nGOPDA5N9/6uJ6ayKuDAtPPoGwAMs8MI8dgfAq/gxvBNJ433P
X-Received: by 2002:a05:6402:5114:b0:64b:45db:3624 with SMTP id 4fb4d7f45d1cf-654529d2140mr1203774a12.3.1768560499582;
        Fri, 16 Jan 2026 02:48:19 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fc273sm198654166b.54.2026.01.16.02.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:48:19 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 2/2] [meta-oe] kmscon: Add recipe
Date: Fri, 16 Jan 2026 11:48:16 +0100
Message-ID: <20260116104816.513803-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116104816.513803-1-adam.duskett@amarulasolutions.com>
References: <20260116104816.513803-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 10:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123531

Provide sane defaults that do not have dependencies, such as
a dummy and terminal session support and basic fbdev support.

kmsconvt@.service must be added separatly or else
do_rootfs fails with the following error:

```
do_rootfs: Postinstall scriptlets of ['kmscon'] have failed. If the intention
is to defer them to first boot, then please place them into
pkg_postinst_ontarget:${PN} (). Deferring to first boot via 'exit 1' is no
longer supported.
```

Add a small patch to fix a compiling error when using LLVM as the
preferred toolchain.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: add tag=v${PV} to the SRC_URI
v2 -> v3: Add a small patch to fix LLVM compiling errors

 ..._conf.c-Fix-llvm-compilation-failure.patch | 40 +++++++++++
 .../recipes-graphics/kmscon/kmscon_9.2.1.bb   | 66 +++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch
 create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb

diff --git a/meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch b/meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch
new file mode 100644
index 0000000000..0806f9bb04
--- /dev/null
+++ b/meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch
@@ -0,0 +1,40 @@
+From 03a330d486132e3798a125d26d4f10252ffd8e2d Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Fri, 16 Jan 2026 11:35:39 +0100
+Subject: [PATCH] kmscon_conf.c: Fix llvm compilation failure
+
+When building with an LLVM toolchain, the follow error occurs:
+
+```
+kmscon_conf.c:757:72:
+error: expression which evaluates to zero treated as a null pointer constant
+of type 'void *' [-Werror,-Wnon-literal-null-conversion]
+CONF_OPTION(0, 0, "gpus", &conf_gpus, NULL, NULL, NULL, &conf->gpus, KMSCON_GPU_ALL),
+                                                                     ^~~~~~~~~~~~~~
+1 error generated.
+```
+
+Fix the error by adding a cast to (void *).
+
+Upstream-Status: Submitted [https://github.com/kmscon/kmscon/pull/225]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ src/kmscon_conf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/kmscon_conf.c b/src/kmscon_conf.c
+index df2e51d..9e9a839 100644
+--- a/src/kmscon_conf.c
++++ b/src/kmscon_conf.c
+@@ -754,7 +754,7 @@ int kmscon_conf_new(struct conf_ctx **out)
+ 		/* Video Options */
+ 		CONF_OPTION_BOOL_FULL(0, "drm", aftercheck_drm, NULL, NULL, &conf->drm, true),
+ 		CONF_OPTION_BOOL(0, "hwaccel", &conf->hwaccel, false),
+-		CONF_OPTION(0, 0, "gpus", &conf_gpus, NULL, NULL, NULL, &conf->gpus, KMSCON_GPU_ALL),
++		CONF_OPTION(0, 0, "gpus", &conf_gpus, NULL, NULL, NULL, &conf->gpus, (void *)KMSCON_GPU_ALL),
+ 		CONF_OPTION_STRING(0, "render-engine", &conf->render_engine, NULL),
+ 		CONF_OPTION_BOOL(0, "use-original-mode", &conf->use_original_mode, true),
+ 		CONF_OPTION_STRING(0, "mode", &conf->mode, NULL),
+-- 
+2.52.0
+
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb b/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
new file mode 100644
index 0000000000..925bebee81
--- /dev/null
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
@@ -0,0 +1,66 @@
+SUMMARY = "Simple terminal emulator based on linux kernel mode setting (KMS)."
+DESCRIPTION = "\
+    Kmscon is a simple terminal emulator based on linux kernel mode setting \
+    (KMS). It is an attempt to replace the in-kernel VT implementation with \
+    a userspace console. \
+"
+HOMEPAGE = "https://github.com/kmscon/kmscon"
+BUGTRACKER = "https://github.com/kmscon/kmscon/issues"
+CVE_PRODUCT = "kmscon"
+
+SECTION = "graphics"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6d4602d249f8a3401040238e98367d9e"
+
+DEPENDS = "\
+    libtsm \
+    libxkbcommon \
+    udev \
+"
+
+SRC_URI = "\
+    git://github.com/kmscon/kmscon;branch=main;protocol=https \
+    file://0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch \
+"
+SRCREV = "7d46650dbb0826f9b89de42f879be879391c14fd"
+
+inherit meson pkgconfig systemd
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
+
+PACKAGECONFIG[backspace_sends_delete] = "-Dbackspace_sends_delete=true, -Dbackspace_sends_delete=false"
+PACKAGECONFIG[font_pango] = "-Dfont_pango=enabled, -Dfont_pango=disabled, pango"
+PACKAGECONFIG[multi_seat] = "-Dmulti_seat=enabled, -Dmulti_seat=disabled, systemd"
+PACKAGECONFIG[opengl] = "-Drenderer_gltex=enabled -Dvideo_drm3d=enabled, -Drenderer_gltex=disabled -Dvideo_drm3d=disabled, libdrm virtual/egl virtual/libgles2 virtual/libgbm"
+PACKAGECONFIG[video_drm2d] = "-Dvideo_drm2d=enabled, -Dvideo_drm2d=disabled, libdrm"
+
+EXTRA_OEMESON = "\
+    -Delogind=disabled \
+    -Dextra_debug=false \
+    -Dfont_unifont=enabled \
+    -Dsession_dummy=enabled \
+    -Dsession_terminal=enabled \
+    -Dtests=false \
+    -Dvideo_fbdev=enabled \
+"
+
+SYSTEMD_SERVICE:${PN} = "kmscon.service"
+FILES:${PN} += "${systemd_system_unitdir}/kmsconvt@.service"
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/systemd/system
+        ln -sf ${systemd_system_unitdir}/kmsconvt@.service \
+            ${D}${sysconfdir}/systemd/system/autovt@.service
+    fi
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'true', 'false', d)}; then
+        sed -e "s@#drm@drm@g" \
+            -e "s@#hwaccel@hwaccel@g" \
+            -e "s@#render-engine=gltex@render-engine=gltex@g" \
+            -i ${D}${sysconfdir}/kmscon/kmscon.conf
+    fi
+}
+
+RDEPENDS:${PN} = "xkeyboard-config"
-- 
2.52.0


