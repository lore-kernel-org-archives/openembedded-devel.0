Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E32C5DF74
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:11 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24532.1786747627397900129
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LIoOuEq/;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39266382df6so1322852a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747627; x=1787352427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlDW0feNDBs9FPufTOwIaTQj3MHMZ8SbKCIEcUPfjEY=;
        b=LIoOuEq/lXiJRLv1ETyxlxbQjSKY95fY5RwrtQ++6is09aNf5Iv12NQl0D6ogymXz7
         AKJpO7J9xL33gtlUAKExhnsUZUkGN12Pesw4DUF4kbrcEYu2sIym1npGlVOZSz7hXaAf
         FekxEUgwN4EuzC9h9bj2tFwKpbIWn1bjhyS7o3HEHv5J21/xtTDLO1f5fKxhpRrEIDu4
         TXxC5uSM5mKwzCf3/1ZIaVNK+vm4ZYJoMujBs+5AewVsJ8tzNpaHgLDt4QcVqGgJbXR4
         4I30IAwmchhGLjuXsIGNzeo2SeoCSX63LGWLziC6onWfYgIAYqBxEPfPk+cJlYTyfCfI
         3tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747627; x=1787352427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WlDW0feNDBs9FPufTOwIaTQj3MHMZ8SbKCIEcUPfjEY=;
        b=HXf8LSENIn1H+ORDukT6YA7IS2yZgKbM0z9Mt+mRkdLOmVmg72kLdpVi8POx55ypSR
         0TL8JXHEPk18f4lOsz6jUD08n1MTTbYEIOAq12lC66WicrX0XbFdMyo29f96C4LToDuR
         caXz6lSKB99AdBVUC7ZhRIjdTMRga+MO9ycJpQ9gQ4mw9BiLeIIRe+6r7v/2+/vPVAsR
         mO7Bn+8xBFb4Q5CI2G+CDLAOTuhTwRWS+6auj9QmPr5CLrfnsygFpkWx8VVPcFDoG3k1
         yMzrGbaHwQKL0l8eo7K0KfzFH4aYuL3gsLo4CCyFAIU7xv/Jqv0Q35bOB8xDpZiW02bk
         Pf8Q==
X-Gm-Message-State: AOJu0YxsgHO5T/fvX9ErcUaGPrBG4ewipTzVZP/DaMahZYCJjkJxF4SL
	BYu6hExvFLGgCf/amdnlNBKCD4BjM+EUBkSb6Jz6SmKZzyojDcYhPeNzPhR2kK5S
X-Gm-Gg: AR+sD13uGhjqZFrbxPmMvFY51n8AT4CoxWzYq5gmRk+HeaZPGCQaK+OgWnLHpE1xd9u
	o/Dy9LHZKWamXYK55+LiDa//VQJBzG+/Px5Cs/s42s01yPEOkccN9fX+V1WkF1L1O+3D2YKBko/
	1Q6o6RtDp4Fz66gs9LgPz/IX4Z4CJWJTXL46WFDFXDeTGKEpk8JyNsVu5UAJoCeLKmPFhDVQhaR
	g8EWPuAEgUGv1xkAS/pfCrPcTh8jxzZq8IKg/RutWT7T3i03Q/u+/007vilq+vHR1N/Q7rYhOMk
	4DuPVtaZ2/dKiACLWMVEhr4oIZhN0pKUQZd/5VRaqRT/nq7ZD8okZ6liQnzQpPHAw1nMVO3F+Cv
	BhCzmOZrRNdPBtZop2Dn/MMmqc8ImemQWSczecJUYAGbWC8u9XOa4w7ZDj7ivCEHxoLDVQGCrNw
	QgODfZm07hQh+a7qAJPGb+RhY8qcRj8YQAj1r4eJ3YbsHzSDlsJa6T+TAKpRaqzVSSHrP2A2sz1
	W4iDWrzluDp34nobFo5ppHXc2Z4DdFDI3Czj8XLxeUZEcojlXC32yyJQgq+FTc+d/1fCqGK/K9u
	IaZ1kaLYO7VRnHIpnsOKJUQwrrxKjbn0+jyDddCDWkQlsv5isf7VJWfs7w/oz1dP59LR8YartfD
	ZDiaSQDlE5G6v7RIci+iZ9vdJcCC3X6vMy7Qjgu4IkuceeA==
X-Received: by 2002:a17:90b:398c:b0:38f:c90c:72d9 with SMTP id 98e67ed59e1d1-3933b7e8021mr9220438a91.9.1786747626644;
        Fri, 14 Aug 2026 15:47:06 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 075/109] kmscon: upgrade 9.3.5 -> 10.0.1
Date: Fri, 14 Aug 2026 15:45:01 -0700
Message-ID: <20260814224539.1523174-75-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129139

Major release. 10.0.1 installs a new terminfo entry
(${datadir}/terminfo/k/kmscon) that FILES:${PN} didn't claim; added.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...0001-fix-zlib-cross-compiling-errors.patch | 51 -------------------
 .../{kmscon_9.3.5.bb => kmscon_10.0.1.bb}     | 16 +++---
 2 files changed, 6 insertions(+), 61 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/kmscon/files/0001-fix-zlib-cross-compiling-errors.patch
 rename meta-oe/recipes-graphics/kmscon/{kmscon_9.3.5.bb => kmscon_10.0.1.bb} (83%)

diff --git a/meta-oe/recipes-graphics/kmscon/files/0001-fix-zlib-cross-compiling-errors.patch b/meta-oe/recipes-graphics/kmscon/files/0001-fix-zlib-cross-compiling-errors.patch
deleted file mode 100644
index c720aa6dde..0000000000
--- a/meta-oe/recipes-graphics/kmscon/files/0001-fix-zlib-cross-compiling-errors.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 0ff9beddd959ec9afc99f64789fdfb959842ba52 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <adam.duskett@amarulasolutions.com>
-Date: Thu, 21 May 2026 16:30:27 +0200
-Subject: [PATCH 1/1] fix zlib cross-compiling errors
-
-zlib compression was introduced in version 9.3.3. However, when
-cross-compiling kmscon for an architecture other than x86_64, the
-genunifont executable tries to use the build-systems zlib instead
-of the hosts zlib.
-
-This leads to the following error during compiling:
-libz.so: error adding symbols: file in wrong format
-
-Fix this by adding a new native zlib dependency specifically for the
-genunifont executable.
-
-Upstream-Status: Submitted [https://github.com/kmscon/kmscon/pull/402]
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- meson.build     | 1 +
- src/meson.build | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index f7c0858..74cf595 100644
---- a/meson.build
-+++ b/meson.build
-@@ -52,6 +52,7 @@ libudev_deps = dependency('libudev', version: '>=172')
- dl_deps = dependency('dl')
- threads_deps = dependency('threads')
- zlib_deps = dependency('zlib')
-+zlib_deps_native = dependency('zlib', native: true)
- 
- python = find_program('python3')
- 
-diff --git a/src/meson.build b/src/meson.build
-index 63d38ca..070e2a4 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -159,7 +159,7 @@ endif
- # Unifont Generator
- # This generates the unifont sources from raw hex-encoded font data.
- #
--genunifont = executable('genunifont', 'genunifont.c', dependencies: [zlib_deps], native: true)
-+genunifont = executable('genunifont', 'genunifont.c', dependencies: [zlib_deps_native], native: true)
- 
- unifont_bin = custom_target('unifont-bin',
-   input: ['font_unifont_data.hex'],
--- 
-2.54.0
-
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
similarity index 83%
rename from meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb
rename to meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
index 83256480ee..d02ea24612 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
@@ -20,34 +20,30 @@ DEPENDS = "\
     zlib \
 "
 
-SRC_URI = "\
-    git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV} \
-    file://0001-fix-zlib-cross-compiling-errors.patch \
-"
-SRCREV = "a8832afb1dcca5bb4c0476d4c13c7239fecbd93a"
+SRC_URI = "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "c9d0e23336c6bb7645a1f5f48a4a82f1d5a589d9"
 
 inherit meson pkgconfig systemd
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
+PACKAGECONFIG[dbus] = "-Ddbus=enabled, -Ddbus=disabled, dbus"
 PACKAGECONFIG[font_freetype] = "-Dfont_freetype=enabled, -Dfont_freetype=disabled, fontconfig freetype"
 PACKAGECONFIG[font_pango] = "-Dfont_pango=enabled, -Dfont_pango=disabled, pango"
-PACKAGECONFIG[multi_seat] = "-Dmulti_seat=enabled, -Dmulti_seat=disabled, systemd"
+PACKAGECONFIG[libseat] = "-Dlibseat=enabled, -Dlibseat=disabled, seatd"
 PACKAGECONFIG[opengl] = "-Drenderer_gltex=enabled -Dvideo_drm3d=enabled, -Drenderer_gltex=disabled -Dvideo_drm3d=disabled, libdrm virtual/egl virtual/libgles2 virtual/libgbm"
 PACKAGECONFIG[video_drm2d] = "-Dvideo_drm2d=enabled, -Dvideo_drm2d=disabled, libdrm"
 
 EXTRA_OEMESON = "\
-    -Delogind=disabled \
+    -Ddocs=disabled \
     -Dextra_debug=false \
     -Dfont_unifont=enabled \
-    -Dsession_dummy=enabled \
-    -Dsession_terminal=enabled \
     -Dtests=false \
     -Dvideo_fbdev=enabled \
 "
 
 SYSTEMD_SERVICE:${PN} = "kmscon.service"
-FILES:${PN} += "${systemd_system_unitdir}/kmsconvt@.service"
+FILES:${PN} += "${systemd_system_unitdir}/kmsconvt@.service ${datadir}/terminfo"
 
 do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then

