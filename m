Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B158CC6B30
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 01:28:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29779.1792027691965165353
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 18:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VCghV30F;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e5378b281aso26367405ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 18:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792027691; x=1792632491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGvdcBxdgJSOeMakFBUyE8x0BsOvy58/C9GxTjfKLTw=;
        b=VCghV30FtYKNMFh+BV0P2e+oIMlswlMLyNhvi7z0Xkhur9Cq9qa0xtdFLWxk/uWo1i
         dc/FqMAyLAr0UNqJaDtG9KR3m88+veHq+3G6lyCA34T/2FHgHMmwRxKJ0o8WhaBeqaGY
         Rkyj5KUscgCdZ6a4+SSBJpiHoJL7wNzCQ/AxHj2ig9UV855U22LConzSshBRhe8/tviW
         +AgOgAf2JzGxGav8Xbd9X8YjMmXFfmu76py5+g1QCwRlXXsvxCSQR1ofh+rdNyBjwrXB
         9Sn4yvAhPg6tyQbeN37QwG657EsZWEfeUkwzTlT5/RIdz3y0h+zI4Ha/PCo/S6DZr1Q8
         F/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792027691; x=1792632491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGvdcBxdgJSOeMakFBUyE8x0BsOvy58/C9GxTjfKLTw=;
        b=ghgF3/FRKp4+Iwnb2RwYg7MxX41YVECmh0lyD9YG7ltNux4GWWeTreHmlZHiUM9+9v
         Hb9Zxk5uswTkgGJ0s5JabywTUOWEfWXDSIxJWUH5mhDVgoagRXbLzDwAixr2vn+E4gWC
         ivnL1fYVi7BQZ/xIWDJP0EaYgVd6PKsoO3C1blCvnLSVhVAjSU51A0JNJ2rvpNYUpwAZ
         WtkaTTFrBNbLRvzOq9lf8Sve88VIw9CtugJ8ywn2dOGNoNbUC3wmYU6+2rXxgdl5p/1L
         NNtD9Q3quCXuPf/Old2grJE4N+0DeWgPkEG3t8ZM/NTKIOn1XEsaMnQXk8rr3CgBXTv1
         vNQg==
X-Gm-Message-State: AFq9FYLDbdDhKytWc+d+z6eFooOhwRtAbHmAKIOdEy1kEscS90VaAE0r
	NJ+z+pgo6fR0WQSnSBrfukL3QtouekaEmGgrn2hCVdXG9SYGZB2HhG8EDLtKEw==
X-Gm-Gg: AYBFou2F5WUqTpqN2/zSOaSGbm1qc15dtMRsOYRb86FfVGuhvXTiiAm/K0rCT2TsHnB
	ATSXhZ+92y/0+WCLKyePG0PlW5zkb4/rlUL+9X5uHGlHVzuR2P7yuDDbKmeQPXMClZidNgacA2t
	oGkUbBWGXLZK4jmBvx2DYefVPCpZDlu66lO0MW73C33op75Q4LJjD45B09s1TQq+qYB5sMriz2c
	34n9e/uvqhFLHcMnME+bn+Tn1l98X37JpvHoiAhWv365geUoUkNdEU2w/64DfHXgzcQMPgZEeVG
	TcxIMnH0ngu7FJTG4e4NzrM5bydcb9BHiZk/s/IyemrcCz1K61y2jAMmczw3pmx07aNB64iojro
	271+xc3gq+sREFyet7nPy+AGR+x8IHIFrkoXht48czfPL8HoqBk4nchhJVkUTHjIkVO8t4Ecmvi
	ffeFIx8Nih6Frd1wNeUZhWN4ddttWCmdHOfu+k6IHhyN5II3zhzRFFdZZOpEIzPe1GDJqkKpfy+
	our0rkBasl2JTHHw3upwImRhWafPlYzI9K+isiiJDQCKzN3gQ==
X-Received: by 2002:a17:902:e88a:b0:2e5:54b9:6b37 with SMTP id d9443c01a7336-2e842bc121dmr176882605ad.28.1792027691087;
        Wed, 14 Oct 2026 18:28:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841432a03sm74429495ad.0.2026.10.14.18.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:28:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 5/6] x65: upgrade 4.2 -> 4.3
Date: Thu, 15 Oct 2026 14:27:51 +1300
Message-ID: <20261015012752.1650544-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015012752.1650544-1-ankur.tyagi85@gmail.com>
References: <20261015012752.1650544-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 01:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130905

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Update SRC_URI as official repository moved to GitHub[1]
- Replace 0001-json11.cpp-Include-cstdint.patch with upstream backport
- Refresh 0002-x265-fix-build-with-cmake-4.patch

Changelog:
https://github.com/Multicorewareinc/x265/blob/4.3/doc/reST/releasenotes.rst

[1] https://www.x265.org/#contribute

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...1-fix-dynamicHDR10-undefined-uint8_t.patch | 23 +++++++++++++
 .../0001-json11.cpp-Include-cstdint.patch     | 33 -------------------
 ...=> 0002-x265-fix-build-with-cmake-4.patch} | 31 +++++++----------
 .../x265/{x265_4.2.bb => x265_4.3.bb}         | 13 ++++----
 4 files changed, 40 insertions(+), 60 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-undefined-uint8_t.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch
 rename meta-multimedia/recipes-multimedia/x265/x265/{0001-x265-fix-build-with-cmake-4.patch => 0002-x265-fix-build-with-cmake-4.patch} (61%)
 rename meta-multimedia/recipes-multimedia/x265/{x265_4.2.bb => x265_4.3.bb} (72%)

diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-undefined-uint8_t.patch b/meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-undefined-uint8_t.patch
new file mode 100644
index 0000000000..cce6c8f6f2
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-undefined-uint8_t.patch
@@ -0,0 +1,23 @@
+From 3b7d8d1e6134db80db46a927c06c33074dcb4bda Mon Sep 17 00:00:00 2001
+From: ReenigneArcher <reenignearcher@gmail.com>
+Date: Wed, 9 Jul 2025 14:41:33 +0000
+Subject: [PATCH] fix(dynamicHDR10): undefined-uint8_t
+
+(cherry picked from commit 98eec4057fc20850b59ed292b3f13ddeefc2f93f)
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

