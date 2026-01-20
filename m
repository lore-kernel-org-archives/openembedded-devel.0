Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8996D2ED12
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:09:23 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3960.1768907361528344892
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=PF89bEBW;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.43, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b87174fbacdso68410466b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 03:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768907360; x=1769512160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q94CRbY1bv+ACVkMy/mZTPfoPjTNOqKFwxTpT+kgKIA=;
        b=PF89bEBWerq1P9u7VEyjVpB03nJq/4jwCd8mSIxi/j1mOqar+mub2MG9WDt9mHKlWd
         T7K0UyRMY5B01v+4I1Ml3CDutBnJsRx3/0Fq0+Wk06C4i+P3IYa29SYSMtNRkX71NK0k
         S6qih0WiH5DBMq+p2O9HN/tBAj9ayAmUep6AU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907360; x=1769512160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q94CRbY1bv+ACVkMy/mZTPfoPjTNOqKFwxTpT+kgKIA=;
        b=aMeQ4vc3ME+Rlf+HqRil3UbkDigS7b251gKvAIjELkKi+oJTjnq4n4+c8/8WsizocG
         5o/TqRh+f4KLMP54zhs9S7/T6fYTpkt3MRSHuAJAo7s9eJ3MvaTgzGMOY0ambt5oe+aN
         Sr/k33vuognkhOPGPezZe3/dQeOBnkx06/Uj6GmPChpGT9RLlvucNDwsoMd3HnHcYu12
         RR5eB+j9LhgPeCtz7x6dvepbPZmbepm1cDWPX6F01JGxKo17lCSfBUq1hLZTTO1AN0lC
         4AD7xVi53bXD53IrKA/jlWXl3KBrPq1F5HhkZ4uS13qjcbMmolvc84icigYCDk9mfARP
         XFVw==
X-Gm-Message-State: AOJu0Yx6hdtLtk0uDzmBGcTnYpPYMfFpZYkZVfXmfqE0ScNeqg0oVp2x
	7C6uWvJDvbxFne0LAxBe9QrVIg192O4hzI936g9LW3ntsHlcwwkOQ5WJKXbm3SVA9gjHg6iR+zK
	iipli
X-Gm-Gg: AZuq6aJXXo1uk29R8+TR+GG8r7d8CHXtsg5wTyP02fe8NYvMRijRKNjpBsqhudXbuS+
	P7DnxrZtUebXcbs0YPl1AAzvgiK0Oau+1SAkuOBKfavHpMI6h+sNA5hdTkoktO2pbbuIbT2XhJg
	GY82bViVMaqD1+GY65s7q8LBtOVXuS8+q4EU1z5+x9X1jxzEqf8K5twfhKmhKxqe/QymXBAwIpr
	GW4V9Au1/O93f6KE6Qe3LND8XUdUMYZq3G//+SX1m8/MkhR3GVI+dSrp/EWWpb7OYrk2T2eadR9
	4U6ehqli7m3m5vK9YHDCM4drC0sBAxYCjyx8+/0GA+C1c06vgwL6wi3qP6ukDkR22GIYCSyaeYJ
	eLQI7Us3wViR3X5glJ2wVfIwOzkMvrAdRGyeePCdeUUT5o3UJvUYQkbwzYXLNETD3/TSQhM0wyn
	p5wAq9oCO8POO9NFFDQ9tQ2KFCPzGSBTxWBwvV9FhybVIFqssl3LI7/bv4GDy3NtYcFMHgb+jJ1
	XFSQdiBwJ52WCt3WNcNp2SC3fn9qlkQJAoZ8BfK5MNrN+5UUHt9
X-Received: by 2002:a17:907:9307:b0:b87:3c3a:cb7e with SMTP id a640c23a62f3a-b8793250e70mr688697166b.6.1768907359781;
        Tue, 20 Jan 2026 03:09:19 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87ed991b75sm399299266b.1.2026.01.20.03.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:09:19 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 2/2] [meta-oe] kmscon: Add recipe
Date: Tue, 20 Jan 2026 12:09:16 +0100
Message-ID: <20260120110917.1390032-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120110917.1390032-1-adam.duskett@amarulasolutions.com>
References: <20260120110917.1390032-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 11:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123664

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
v3 -> v4: Fix packaging errors when systemd and usrmerge are not in DISTRO_FEATURES

 ..._conf.c-Fix-llvm-compilation-failure.patch | 40 +++++++++++
 .../recipes-graphics/kmscon/kmscon_9.2.1.bb   | 71 +++++++++++++++++++
 2 files changed, 111 insertions(+)
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
index 0000000000..508f24c58e
--- /dev/null
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
@@ -0,0 +1,71 @@
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
+    else
+        # kmscon always installs service files.
+        # If systemd and usrmerge are not in DISTRO_FEATURES, packaging errors
+        # occur because service files are installed to /usr/lib/systemd/system/kmscon.service.
+        rm -rf ${D}${libdir}/systemd
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


