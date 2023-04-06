Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FD2C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 03:34:22 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.150419.1680752053534695820
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Apr 2023 20:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bOZvqIgW;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id o2so36359337plg.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 20:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680752053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=naYPdzCJVR1VPc/79KHLryK/AU74aK3LrMXC9w4/GVg=;
        b=bOZvqIgWDbogn6jtj0OWfm8mlOxx26QXlHKXn9vYH24ebjo2TEnLm1h2tl5RER56ni
         zBfIVI2lev93l+0s8WXvfgvxzLrS7aBimhk+6W1XmVE6QcJWVPRi6+CMDlRXqWkZm3Vd
         bwLpBjQ20ATQdvMWMIetg6wfNcRr2s8bG0ZswV/FshC7nZwBbe89CxilRRAstzy6pIrU
         nV2TN/tA8TVjX6sZv/QjHdwgye6Wdk5RopJwqLpF8zHebWi7BbudGq570R4vYRvPWmv4
         VJoa0+5wORnXKI9Daji66OnIRsg6Zdpnzo5BNm2F4bQfWKy1JlPbUWPjGcsVAz/dKtLM
         Lr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680752053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naYPdzCJVR1VPc/79KHLryK/AU74aK3LrMXC9w4/GVg=;
        b=r4izIq0dxEK5Rqp1QSnWqOZYRQT0bIFpBQrF6bh7bNnti+U35JWojumc9nZWTHBvJC
         Gzv/kJw4OvfZPpJTY95od/xqwj0wb0/YULzJmaYGbIyp786Hs/micAruTWpJxlZzxnEf
         yRypHbH8ZJE4NalRe6QI1Rvv+Tr240MRZvDil0RPB6Cq0gcImVpamzT1o9VLsV3eWbiG
         6TDvUQCP+gl40NefnxpQSGE1S9qqG/cArX+hpayfXlPbWq9SqqjRxkKWuQRj/Vfp22K0
         eSWUz8SfapYO4lcJQ6hOwg06MuR2bZ18jV3DFgtNKkySJEeOwYuObyrEaoa+5T5V5oE/
         qiOg==
X-Gm-Message-State: AAQBX9fZkXP7LKSQcidyNQILEYO+40527fmW1qZS0Ba6Wwy7TElnSSDH
	QyZsihspzcieOUVgZHuUCcJgOpN+rGfxUg==
X-Google-Smtp-Source: AKy350aaVWvbRO2STPqBt09do/dvyHgtkWIyQ63TJiLX86XMeYZdIsYNQx7D/qww/zu8pjdvjd1LFQ==
X-Received: by 2002:a17:902:ecca:b0:19a:b754:4053 with SMTP id a10-20020a170902ecca00b0019ab7544053mr10601455plh.26.1680752052501;
        Wed, 05 Apr 2023 20:34:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id u20-20020a170902a61400b0019a7ef5e9a8sm273358plq.82.2023.04.05.20.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 20:34:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] meta-multimedia: Fix missing upstream status in several patches
Date: Wed,  5 Apr 2023 20:34:09 -0700
Message-Id: <20230406033409.3287941-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 03:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101964

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Makefile-Use-LINKFLAGS-during-link-step.patch       | 1 +
 .../caps/0001-basic.h-Use-c99-supported-stdint-types.patch   | 1 +
 .../recipes-multimedia/caps/caps/append_ldflags.patch        | 3 ++-
 ...0001-check-for-null-buffer-before-trying-a-byteswap.patch | 1 +
 .../0001-utils-Use-c99-compiler-independent-types.patch      | 1 +
 .../cdparanoia/files/0002-Fix-printf-format-errors.patch     | 1 +
 .../cdparanoia/files/dont-use-internal-configs.patch         | 5 +++++
 .../cdparanoia/files/out-of-tree-build.patch                 | 5 +++++
 .../dvb-apps/files/0001-Fix-generate-keynames.patch          | 1 +
 .../0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch      | 1 +
 .../files/0003-handle-static-shared-only-build.patch         | 1 +
 .../dvb-apps/files/0004-Makefile-remove-test.patch           | 1 +
 .../dvb-apps/files/0005-libucsi-optimization-removal.patch   | 5 +++++
 .../recipes-multimedia/dvb-apps/files/0006-CA_SET_PID.patch  | 4 ++++
 .../gerbera/gerbera/0001-Fix-build-with-fmt-9.0.patch        | 2 ++
 .../gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch   | 2 ++
 .../libdc1394/files/install_examples.patch                   | 5 +++++
 .../nv-codec-headers/0001-Makefile-add-clean-target.patch    | 2 ++
 ...emove-the-error-line-and-live-without-file-type-det.patch | 4 ++--
 .../vlc/0004-Use-packageconfig-to-detect-mmal-support.patch  | 1 +
 20 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-Makefile-Use-LINKFLAGS-during-link-step.patch b/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-Makefile-Use-LINKFLAGS-during-link-step.patch
index 90e997561a..f7656913b5 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-Makefile-Use-LINKFLAGS-during-link-step.patch
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-Makefile-Use-LINKFLAGS-during-link-step.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] Makefile: Use LINKFLAGS during link step
 
 Adds much needed GNU_HASH section into the .so
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  make/linux/Makefile | 2 +-
diff --git a/meta-multimedia/recipes-multimedia/caps/caps/0001-basic.h-Use-c99-supported-stdint-types.patch b/meta-multimedia/recipes-multimedia/caps/caps/0001-basic.h-Use-c99-supported-stdint-types.patch
index 1087b0e79c..528bd153dd 100644
--- a/meta-multimedia/recipes-multimedia/caps/caps/0001-basic.h-Use-c99-supported-stdint-types.patch
+++ b/meta-multimedia/recipes-multimedia/caps/caps/0001-basic.h-Use-c99-supported-stdint-types.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] basic.h: Use c99 supported stdint types
 
 include stdint.h for getting the definitions for int types
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  basics.h | 17 +++++++++--------
diff --git a/meta-multimedia/recipes-multimedia/caps/caps/append_ldflags.patch b/meta-multimedia/recipes-multimedia/caps/caps/append_ldflags.patch
index 3abd381891..6e34a8a984 100644
--- a/meta-multimedia/recipes-multimedia/caps/caps/append_ldflags.patch
+++ b/meta-multimedia/recipes-multimedia/caps/caps/append_ldflags.patch
@@ -1,7 +1,8 @@
 Change the order of linker flags such that -shared is appearig after -pie/-fpie
 this helps in building the package when secuiry flags are enabled
 
--Khem
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: caps-0.9.24/Makefile
 ===================================================================
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-check-for-null-buffer-before-trying-a-byteswap.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-check-for-null-buffer-before-trying-a-byteswap.patch
index 682cf6e033..0451a453a3 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-check-for-null-buffer-before-trying-a-byteswap.patch
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-check-for-null-buffer-before-trying-a-byteswap.patch
@@ -8,6 +8,7 @@ Author: Monty <paranoia@xiph.org>
 Patch from debian
 http://sources.debian.net/src/cdparanoia/3.10.2%2Bdebian-11/debian/patches/04-endian.patch
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  interface/interface.c | 2 +-
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-utils-Use-c99-compiler-independent-types.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-utils-Use-c99-compiler-independent-types.patch
index 7699017f77..b364a3b2a7 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-utils-Use-c99-compiler-independent-types.patch
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-utils-Use-c99-compiler-independent-types.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] utils: Use c99 compiler independent types
 
 Make it portable across different platforms
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  utils.h | 13 +++++++------
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/0002-Fix-printf-format-errors.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/0002-Fix-printf-format-errors.patch
index 024479ca7d..ea30559384 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/files/0002-Fix-printf-format-errors.patch
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/0002-Fix-printf-format-errors.patch
@@ -5,6 +5,7 @@ Subject: [PATCH 2/2] Fix printf format errors
 
 error: format not a string literal and no format arguments
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  main.c | 4 ++--
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/dont-use-internal-configs.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/dont-use-internal-configs.patch
index 9b268b7ed6..2738ba70e8 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/files/dont-use-internal-configs.patch
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/dont-use-internal-configs.patch
@@ -1,3 +1,8 @@
+Fix build on aarch64
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 Index: cdparanoia-III-10.2/configure.in
 ===================================================================
 --- cdparanoia-III-10.2.orig/configure.in
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/out-of-tree-build.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/out-of-tree-build.patch
index 06ee82099d..96c5dda31c 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/files/out-of-tree-build.patch
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/out-of-tree-build.patch
@@ -1,3 +1,8 @@
+Fix build out of tree builds
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 Index: cdparanoia-III-10.2/Makefile.in
 ===================================================================
 --- cdparanoia-III-10.2.orig/Makefile.in
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-Fix-generate-keynames.patch b/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-Fix-generate-keynames.patch
index 498607d97d..f3d14354b4 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-Fix-generate-keynames.patch
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-Fix-generate-keynames.patch
@@ -5,6 +5,7 @@ symbols. However, when cross-compiling, the include path points
 somewhere else. Allow the user to pass CROSS_ROOT to point to the
 root of the cross-compilation environment.
 
+Upstream-Status: Inappropriate [Cross-compile specific]
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ---
 diff -rup dvb-apps-83c746462ccb.orig/util/av7110_loadkeys/generate-keynames.sh dvb-apps-83c746462ccb/util/av7110_loadkeys/generate-keynames.sh
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch b/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch
index e89f9a3cdc..8ff1e029b0 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/files/0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] dvbdate: Remove Obsoleted stime API calls
 stime() has been deprecated in glibc 2.31+ its recommended to
 replaced with clock_settime()
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  util/dvbdate/dvbdate.c | 5 ++++-
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/files/0003-handle-static-shared-only-build.patch b/meta-multimedia/recipes-multimedia/dvb-apps/files/0003-handle-static-shared-only-build.patch
index 4dc7c68ac2..ce51084c97 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/files/0003-handle-static-shared-only-build.patch
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/files/0003-handle-static-shared-only-build.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] Make.rules: Handle static/shared only build
 Do not build .a library when enable_static is set to "no"
 Do not build .so library when enable_shared is set to "no"
 
+Upstream-Status: Pending
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 ---
  Make.rules | 10 ++++++++--
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/files/0004-Makefile-remove-test.patch b/meta-multimedia/recipes-multimedia/dvb-apps/files/0004-Makefile-remove-test.patch
index 45bfad914c..6ec5b08ccc 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/files/0004-Makefile-remove-test.patch
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/files/0004-Makefile-remove-test.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] Makefile: remove test
 
 Tests needs static libraries, remove them for shared only build.
 
+Upstream-Status: Inappropriate [Cross-compile specific]
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 ---
  Makefile | 1 -
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/files/0005-libucsi-optimization-removal.patch b/meta-multimedia/recipes-multimedia/dvb-apps/files/0005-libucsi-optimization-removal.patch
index f12d35bc7e..dbb848c72c 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/files/0005-libucsi-optimization-removal.patch
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/files/0005-libucsi-optimization-removal.patch
@@ -1,3 +1,8 @@
+Use -O1 with gcc > 6
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 diff -r 3d43b280298c lib/libucsi/endianops.h
 --- a/lib/libucsi/endianops.h	Fri Mar 21 20:26:36 2014 +0100
 +++ b/lib/libucsi/endianops.h	Fri Jan 19 06:56:15 2018 +0000
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/files/0006-CA_SET_PID.patch b/meta-multimedia/recipes-multimedia/dvb-apps/files/0006-CA_SET_PID.patch
index e100c659e7..59abd32a01 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/files/0006-CA_SET_PID.patch
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/files/0006-CA_SET_PID.patch
@@ -1,3 +1,7 @@
+Fix build with newer than 4.14 kernels
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Index: dvb-apps/util/dst-utils/dst_test.c
 ===================================================================
 --- dvb-apps.orig/util/dst-utils/dst_test.c
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-with-fmt-9.0.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-with-fmt-9.0.patch
index 9de0e4f28e..bb8e438304 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-with-fmt-9.0.patch
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-with-fmt-9.0.patch
@@ -4,6 +4,8 @@ Date: Fri, 19 Aug 2022 15:22:10 +0300
 Subject: [PATCH] Fix build with fmt 9.0
 
 Fixes #2681
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/database/sql_format.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
index c1c88999a5..64fd578a96 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
@@ -3,6 +3,8 @@ From: Carlos <carlos.rodriguez@ridgerun.com>
 Date: Fri, 15 Dec 2017 10:14:05 -0600
 Subject: [PATCH] gstd:yocto compatibility
 
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gstd/Makefile.am                | 2 +-
  3 files changed, 9 insertions(+), 3 deletions(-)
diff --git a/meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch b/meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch
index df0c2355d0..51761eb8c9 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch
+++ b/meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch
@@ -1,3 +1,8 @@
+Install all examples
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 Index: libdc1394/examples/Makefile.am
 ===================================================================
 --- libdc1394.orig/examples/Makefile.am
diff --git a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers/0001-Makefile-add-clean-target.patch b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers/0001-Makefile-add-clean-target.patch
index 7ae749beda..ac9e70a718 100644
--- a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers/0001-Makefile-add-clean-target.patch
+++ b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers/0001-Makefile-add-clean-target.patch
@@ -3,6 +3,8 @@ From: Markus Volk <f_L_K@t-online.de>
 Date: Sat, 1 Apr 2023 04:42:32 +0200
 Subject: [PATCH] Makefile: add clean target
 
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
diff --git a/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch b/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch
index 4f02a66fcc..3085bd495c 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch
+++ b/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch
@@ -1,11 +1,11 @@
 From d0313be5fb947df399a4db24a5f9244510d2ce87 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 12 Jul 2017 16:36:06 -0700
-Subject: [PATCH] remove the #error line and live without file-type detection
- with pipes
+Subject: [PATCH] remove the #error line and live without file-type detection with pipes
 
 this fallback is executed with musl
 
+Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/formats.c | 1 -
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch
index 078ac41ca5..b9f5ad591c 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch
@@ -8,6 +8,7 @@ in different locations, therefore its best to rely on pkgconf to find
 the libs and header locations instead of assuming /opt/vc which might
 work on some distros ( like raspbian ) but not everywhere
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  configure.ac | 31 +++++++++++--------------------
-- 
2.40.0


