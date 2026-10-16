Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B32CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:36:16 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15518.1792128968653110934
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LQE+gUqr;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso1470526a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 22:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792128968; x=1792733768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZyBHlAwc8/X+kne8y+SNRRN88PB+odXP/YwJeqHkiQ=;
        b=LQE+gUqrWu7yQdDR3xiv2UzXgAuTR2eiwjEy3yrdcMsoClydSAbJwt+3iDTUTPSjdg
         wqhIgSSPY1O2c74XCfvXgxNjJgwYHKGen+I7pckCCY7uKBBdPyIO8lkDbxhvPSxSEZFo
         3fvnvTe0u5ib0o6iHebabwvTq4vLVghceYSnTNJvL8Z4W4ueGHwiGO5HKBeDSmloDRgo
         VnJ0lEON47pkkEUNOyRg1aOK9CM4CTqzuIiMDDZjEWYh/uPrzt5378cp5H5nSWRtmCd3
         nNT+i3x2T0J+LQu44f8+r/f+0R5MQ6g9nLLj1PnyV1dpQ/SbJ99p+E1anJ/oa4K2kdyQ
         /krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792128968; x=1792733768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZyBHlAwc8/X+kne8y+SNRRN88PB+odXP/YwJeqHkiQ=;
        b=P+ARjLnEFjOiHP43NfS3xY9sMc/5yOIZQNeXwDAcFdX7KcEY5UBd2CvCycxS8FqTI8
         d88Udg4bt5nXuoq3iLA890W3gYyslgjZ5Ygx6wHIuTqzV9pexZ/Hgl/FYHro0KsZ4+IJ
         IWR2XNcWBuH/s/1jvGYCT/nn5tvx5v5QLoJz1yTA9XA+sVGdVk0qDGUaNOItEq0VNLTJ
         QV7jXP3moj6yzDw3nxFMigHxYnPkDERKslhFXom0284BTZSg0xdpqwfsVb6T+3Z8ju3V
         yPzoXI7nJAbjvfCvtUDxw5VEYch0CCSf1zwOPZn7F9r5OVKwJQALathUeCopDPJph+p4
         TYAA==
X-Gm-Message-State: AFq9FYJcwfcZRFz6Rlb/uB7zo+nTZYySoyaTK+F4rTr/V6P9hHCDUsrb
	Q30+xxzUVPwHqXYJrFsG/v0EctU5eEn10YNsqv+E0CE+vZzz+nAOSn1+kE9A3g==
X-Gm-Gg: AYBFou2K9Jux3LSTFxavSXjLfF9nJHP0Y5+sqDNCaYrj9jw/p9gDAGM0bBeVfGO8w3A
	u4Oc/RCgEvgPOOk4+M87FYjveiCNN20yhFy2vGGZA2o682O2ewF4pW7CHIzCKdWMkthkvNoqX/A
	4J3lEaCVbjOIB2JoPr752lmukdqvxS9gMkf0vV97JWLuMoTMBVv6b6AVUkJPp3uFG6oKzMEoQI8
	8YXjcwhydEWelDnX8JqQSG7lVepslk/Qc3PbtNRYi53GGqsk4Q7xihnyjzS21mwu491nhju50cl
	92Q4kaQgkXAkJQxYBI8QIBazJP/N8Csk/IDAV0f6NnAFCAStm0EgDoVT7BuHVlCvBkszTKmQr6H
	3EOTZiCFcVKqcSXjZOGvA2Fnw0qt+L7mcV9pa3XeH0/lhBNZVWpNBeS2KYiCAWSeAkT30jS0tVx
	qN5ub9p2LtLpi04MxysaMqsP3E72cyUUdFGYDbGBcgsJB8uw7S/HlR9sKPZXKYMfYLBkHwIyM/j
	GvtdT1iQV7vBtgVxjWSllofTtFTlBYgwPwrn9I=
X-Received: by 2002:a17:90b:3888:b0:3ac:7449:40b4 with SMTP id 98e67ed59e1d1-3ac7449442amr7366264a91.45.1792128967882;
        Thu, 15 Oct 2026 22:36:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947cf9a5sm7324931a91.15.2026.10.15.22.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:36:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH v3 1/1] x265: upgrade 4.2 -> 4.3
Date: Fri, 16 Oct 2026 18:36:00 +1300
Message-ID: <20261016053600.1560563-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 05:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131054

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Update SRC_URI as official repository moved to GitHub[1]
- Replace 0001-json11.cpp-Include-cstdint.patch with upstream backport
- Refresh 0002-x265-fix-build-with-cmake-4.patch

Changelog:
https://github.com/Multicorewareinc/x265/blob/4.3/doc/reST/releasenotes.rst

[1] https://www.x265.org/#contribute

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...1-fix-dynamicHDR10-undefined-uint8_t.patch | 24 ++++++++++++++
 .../0001-json11.cpp-Include-cstdint.patch     | 33 -------------------
 ...=> 0002-x265-fix-build-with-cmake-4.patch} | 31 +++++++----------
 .../x265/{x265_4.2.bb => x265_4.3.bb}         | 13 ++++----
 4 files changed, 41 insertions(+), 60 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-undefined-uint8_t.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch
 rename meta-multimedia/recipes-multimedia/x265/x265/{0001-x265-fix-build-with-cmake-4.patch => 0002-x265-fix-build-with-cmake-4.patch} (61%)
 rename meta-multimedia/recipes-multimedia/x265/{x265_4.2.bb => x265_4.3.bb} (72%)

diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-undefined-uint8_t.patch b/meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-undefined-uint8_t.patch
new file mode 100644
index 0000000000..53a389c8a2
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-undefined-uint8_t.patch
@@ -0,0 +1,24 @@
+From 3b7d8d1e6134db80db46a927c06c33074dcb4bda Mon Sep 17 00:00:00 2001
+From: ReenigneArcher <reenignearcher@gmail.com>
+Date: Wed, 9 Jul 2025 14:41:33 +0000
+Subject: [PATCH] fix(dynamicHDR10): undefined-uint8_t
+
+(cherry picked from commit 98eec4057fc20850b59ed292b3f13ddeefc2f93f)
+Upstream-Status: Backport [https://github.com/Multicorewareinc/x265/commit/98eec4057fc20850b59ed292b3f13ddeefc2f93f]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ source/dynamicHDR10/json11/json11.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/source/dynamicHDR10/json11/json11.cpp b/source/dynamicHDR10/json11/json11.cpp
+index 762577735..c111ebb82 100644
+--- a/source/dynamicHDR10/json11/json11.cpp
++++ b/source/dynamicHDR10/json11/json11.cpp
+@@ -22,6 +22,7 @@
+ #include "json11.h"
+ #include <cassert>
+ #include <cmath>
++#include <cstdint>
+ #include <cstdlib>
+ #include <cstdio>
+ #include <limits>
diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch b/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch
deleted file mode 100644
index f32316009f..0000000000
--- a/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6cbd417be3f6bcbda77464db6a4d83cef3df8904 Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Mon, 5 May 2025 14:08:36 +0000
-Subject: [PATCH] json11.cpp: Include cstdint
-
-Fixes:
-
-json11.cpp:101:32: error: 'uint8_t' does not name a type
-
-This work was sponsored by GOVCERT.LU.
-
-Upstream-Status: Pending [https://bitbucket.org/multicoreware/x265_git/pull-requests/33]
-
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- dynamicHDR10/json11/json11.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/dynamicHDR10/json11/json11.cpp b/dynamicHDR10/json11/json11.cpp
-index 7625777..74f990a 100644
---- a/dynamicHDR10/json11/json11.cpp
-+++ b/dynamicHDR10/json11/json11.cpp
-@@ -25,6 +25,7 @@
- #include <cstdlib>
- #include <cstdio>
- #include <limits>
-+#include <cstdint>
- 
- #if _MSC_VER
- #pragma warning(disable: 4510) //const member cannot be default initialized
--- 
-2.39.5
-
diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch b/meta-multimedia/recipes-multimedia/x265/x265/0002-x265-fix-build-with-cmake-4.patch
similarity index 61%
rename from meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch
rename to meta-multimedia/recipes-multimedia/x265/x265/0002-x265-fix-build-with-cmake-4.patch
index 7d301777f0..64da2c31e0 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch
+++ b/meta-multimedia/recipes-multimedia/x265/x265/0002-x265-fix-build-with-cmake-4.patch
@@ -1,4 +1,4 @@
-From f376b858b38f8a3b922bb9a5165a5f6f806bd245 Mon Sep 17 00:00:00 2001
+From 5e759128b016cb03866ada875166560155b9d21e Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Thu, 10 Jul 2025 09:04:27 +0200
 Subject: [PATCH] x265: fix build with cmake 4
@@ -8,16 +8,17 @@ with 4.0
 
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 
-Upstream-Status: Submitted [https://github.com/videolan/x265/pull/17]
+Upstream-Status: Submitted [https://github.com/Multicorewareinc/x265/pull/996]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
 ---
  source/CMakeLists.txt              | 2 +-
- source/dynamicHDR10/CMakeLists.txt | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
+ source/dynamicHDR10/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt
-index 2e3beaaf3..45df2e9fd 100755
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
+index 3177af99a..f1364b886 100755
+--- a/source/CMakeLists.txt
++++ b/source/CMakeLists.txt
 @@ -11,7 +11,7 @@ if(POLICY CMP0042)
      cmake_policy(SET CMP0042 NEW) # MACOSX_RPATH
  endif()
@@ -28,9 +29,9 @@ index 2e3beaaf3..45df2e9fd 100755
  if (POLICY CMP0075)
      cmake_policy(SET CMP0075 NEW) # CMAKE_REQUIRED_LIBRARIES warning
 diff --git a/source/dynamicHDR10/CMakeLists.txt b/source/dynamicHDR10/CMakeLists.txt
-index 4243338c6..03c866b1f 100644
---- a/dynamicHDR10/CMakeLists.txt
-+++ b/dynamicHDR10/CMakeLists.txt
+index 4243338c6..2c3af4f00 100644
+--- a/source/dynamicHDR10/CMakeLists.txt
++++ b/source/dynamicHDR10/CMakeLists.txt
 @@ -10,7 +10,7 @@ add_library(dynamicHDR10 OBJECT
      hdr10plus.h
      api.cpp )
@@ -40,13 +41,3 @@ index 4243338c6..03c866b1f 100644
  project(dynamicHDR10)
  include(CheckIncludeFiles)
  include(CheckFunctionExists)
-@@ -150,4 +150,4 @@ set(BIN_INSTALL_DIR bin CACHE STRING "Install location of executables")
- option(ENABLE_SHARED "Build shared library" OFF)
- 
- install(FILES hdr10plus.h DESTINATION include)
--endif()
-\ No newline at end of file
-+endif()
--- 
-2.43.0
-
diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.2.bb b/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
similarity index 72%
rename from meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
rename to meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
index 9bef2b8bd2..6459fbc8cf 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "H.265/HEVC video encoder"
 DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
-HOMEPAGE = "https://bitbucket.org/multicoreware/x265_git"
+HOMEPAGE = "https://github.com/Multicorewareinc/x265"
 
 LICENSE = "GPL-2.0-only"
 LICENSE_FLAGS = "commercial"
@@ -9,12 +9,12 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
 DEPENDS = "nasm-native gnutls zlib libpcre numactl"
 
 SRC_URI = " \
-    https://download.videolan.org/pub/pub/videolan/${BPN}/${BPN}_${PV}.tar.gz \
-    file://0001-json11.cpp-Include-cstdint.patch \
-    file://0001-x265-fix-build-with-cmake-4.patch \
+    git://github.com/Multicorewareinc/x265.git;protocol=https;branch=master;tag=${PV} \
+    file://0001-fix-dynamicHDR10-undefined-uint8_t.patch \
+    file://0002-x265-fix-build-with-cmake-4.patch \
 "
-SRC_URI[sha256sum] = "40b1ea0453e0309f0eba934e0ddf533f8f6295966679e8894e8f1c1c8d5e1210"
-S = "${UNPACKDIR}/x265_${PV}/source"
+SRCREV = "e9b88125dc21393b3fd8d68e98083bdfb89778a8"
+S = "${UNPACKDIR}/x265-${PV}/source"
 
 inherit lib_package cmake pkgconfig
 
@@ -30,4 +30,3 @@ PACKAGECONFIG[10bit] = "-DHIGH_BIT_DEPTH=ON,-DHIGH_BIT_DEPTH=OFF"
 
 FILES:${PN} += "${libdir}/libhdr10plus.so"
 FILES:${PN}-dev = "${includedir} ${libdir}/pkgconfig ${libdir}/libx265.so"
-

