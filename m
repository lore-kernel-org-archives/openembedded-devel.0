Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376F8C98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 17:04:29 +0000 (UTC)
Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3091.1790355859180259698
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 10:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QVl843Rf;
 spf=pass (domain: konsulko.com, ip: 74.125.228.171, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af3a4f193so79890166b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 10:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790355857; x=1790960657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNd1J9mqC/hwNgX7sKV9KzwLicGBZ3mcJmEEGbUfVl4=;
        b=QVl843Rfd0K3BFa1ErFQMmagO8iU/rT7smRhLi9MmPOoMa5JYQYbye+sy3KBafHQKp
         +IQBC8TpdWa5W8CikVKX9oH7+ToOB2Ad/zYh/bBMcGMdtHqsNfuNnZPfb0n+UeOJgV8G
         4TqKGaAJUrgVER+aICRCXaUVVvlQiKixvsM9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355857; x=1790960657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNd1J9mqC/hwNgX7sKV9KzwLicGBZ3mcJmEEGbUfVl4=;
        b=MTsMXWtVmqrSQ4/TzIjqHs9bzvChpxAHh4n0SufqYlXG8k1uuzhGgkit7+2RXDObCh
         +bo/7G545jlEY7d21o+dyscazQjqZzA9re5cJAPocYOxt1OC8w1EQ2nkNiZpjuaHwr04
         LkRGSUJLUXfO9Ms8PGY2SOPeS4i8r24ydwysYOWC3BpnI67AX3RvGbWQo/XsUDGXL2uL
         DdFrltSOl59WOiM/5T6E+lH3AhDLUuzY2jUow2NDWp2ihMZDbEbXXt8W9UIYifh2z5Ws
         8Jb6Tpw4XUGC3wSbZnZHystqxToJ5a86X1mE23oQrAJN+DxQJlBAzjYn62VvcSCeQlit
         CnIg==
X-Gm-Message-State: AFuF++nEAqcb7OefR3dgwl1zFVbLroNc5kvL1SF+rRHCH78WpJWQApLJ
	lBatviFfbSRuL4x1cLekx80RvmUxu+VA96UghrsmmZyOKeFm2R9Ilt6POYUI8Uvkz5gX0pK82xx
	CzMqk
X-Gm-Gg: AYBFou3jy5K1TV80VuPk8gRaO8x3xmqdz1UjglHEJSfWdUz9+72joR4a+4ct0EnMTFp
	yB4d9C0gV9moxgXS2ItqhSMEUFqdxK/Xd78SC14uXX7P+ErNlyJIfA1fryfv/ROKNk1eomSmmNn
	FG/KXDR2Pvo4ingF8WOi0mOkgCHlRNt19xsbBNy1fUF82K01tDOs/hU1LkvPNDhAgJEjv7BxCKB
	t3rbiQ8QmnrMuCU5cgvBVUZ08GmGj2Rhj30YmWpXirr7DxKYib93FEWWzcM2rENJ9yMh2HEhkAV
	n0GkVMZZz1NNVEqBFbVhKz/sAsLpj0YNBWfRuLTiwIbxH84xNcuIsaeumMoDsUtggS8DgeBdCo1
	dYODz9CBKDUNfAcsGLJzTNIlmVxDhIjGz45h1ZjOKLnjiVaezA3AC31pCFs0NZWxSW69F4SU2N7
	QNqVm1YMxb/awCPhYrMaAV+tO+X1ULkuuLisCU63BqqsEQbh/nN3gS20cS949hDVtkdn7uze3ip
	WTE/K4OPGHeiKDdspYpKe1oCrGbqgxLiYpBRI0goKXbjgRl7Ty/HKLqY5Ki1tErDrLU/tLWbMt4
	i6LFmkBPpr1oKUpCzVj5rKjE6Ft3aXjdUw==
X-Received: by 2002:a17:907:cd0d:b0:c25:2fb9:b897 with SMTP id a640c23a62f3a-c2ac24c85f4mr583041966b.18.1790355857212;
        Fri, 25 Sep 2026 10:04:17 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2af3128c48sm79413366b.3.2026.09.25.10.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:04:16 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCHv2] x265: Upgrade 4.1 -> 4.2
Date: Fri, 25 Sep 2026 20:04:13 +0300
Message-ID: <20260925170413.2564098-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 17:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130310

Switch to the alternate URI from videolan. Upgrade to release 4.2:

- Threaded Motion Estimation (Experimental feature)-It uses a
  dedicated threadpool to precompute Motion Estimation in parallel.
  Improves encoding speed upto 1.5x for 1080p & lower resolution on
  multi core machines with low frequency setting. On high frequency
  systems or on machines with low number of cores, the overhead of
  additional Motion estimation work may outweigh parallelism
- Add new Levels 6.3 to 7.2 specified in ITU-T H.265 (V9) (09/2023)
  and above
- Improve Slices feature with check zeroMv
- Enable frame parallelism with MCSTF feature
- Updated support to signal AOM FGM params
- Improve quality with SBRC feature 6.Updated DolbyVision P5 VUI
  defaults
- API Support to enable Threaded Motion Estimation(-threaded-me)
- RISC V optimizations including SAD, SATD, DCT, IDCT, block copy,
  pixel utilities, SAO, loopfilter, transpose kernels resulting in
  2x encoding speed.
- ARM SIMD optimizations including the use of NEON and SVE
  instruction set extensions. The following algorithms now have
  optimized SIMD implementations: DST, IDCT, SSE, SSD,
  intra_pred_planar, pelFilterLumaStrong, interpolation, planecopy,
  dequant_normal, blockcopy, pixel variance resulting in 8% faster
  encoding speed compared to v4.1
- Fix memory leaks (no command line option, SEI buffer, analysis
  save/load)
- Fix chroma qp offset for non yuv444 inputs
- Fix max supported input resolution
- Fix bugs with ARM SIMD optimizations
- Fix Alpha and Multiview feature flag support in x265_config
- Fix test harness issues, CMake errors
- Fix inconsistent output with aq-motion
- Fix crash with hist-scenecut on high bit-depth builds
- Fix lookahead concurrency bug
- Fix shared link issue (R_X86_64_PC32), yuv recon output issue,
  rd-refine and dynamic-refine issue, inputs for Windows named
  pipe, weighted prediction delta_chroma_offset, crf and vbv issue
  in abr-ladder, psnr and ssim reported with MCSTF feature,
  internally overflowed VBV variables

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-x265-fix-build-with-cmake-4.patch    | 39 +++++++------------
 .../x265/{x265_4.1.bb => x265_4.2.bb}         |  4 +-
 2 files changed, 16 insertions(+), 27 deletions(-)
 rename meta-multimedia/recipes-multimedia/x265/{x265_4.1.bb => x265_4.2.bb} (87%)

diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch b/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch
index f218fec5f7..7d301777f0 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch
+++ b/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch
@@ -1,4 +1,4 @@
-From de68f4d02946d588af6a0c21cf966288c40b039f Mon Sep 17 00:00:00 2001
+From f376b858b38f8a3b922bb9a5165a5f6f806bd245 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Thu, 10 Jul 2025 09:04:27 +0200
 Subject: [PATCH] x265: fix build with cmake 4
@@ -10,43 +10,32 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
 
 Upstream-Status: Submitted [https://github.com/videolan/x265/pull/17]
 ---
- source/CMakeLists.txt              | 8 +-------
+ source/CMakeLists.txt              | 2 +-
  source/dynamicHDR10/CMakeLists.txt | 4 ++--
- 2 files changed, 3 insertions(+), 9 deletions(-)
+ 2 files changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5c6dda9e8..bd9e0f8d9 100755
+diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt
+index 2e3beaaf3..45df2e9fd 100755
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -6,18 +6,12 @@ if(NOT CMAKE_BUILD_TYPE)
-         FORCE)
- endif()
- message(STATUS "cmake version ${CMAKE_VERSION}")
--if(POLICY CMP0025)
--    cmake_policy(SET CMP0025 OLD) # report Apple's Clang as just Clang
--endif()
- if(POLICY CMP0042)
+@@ -11,7 +11,7 @@ if(POLICY CMP0042)
      cmake_policy(SET CMP0042 NEW) # MACOSX_RPATH
  endif()
--if(POLICY CMP0054)
--    cmake_policy(SET CMP0054 OLD) # Only interpret if() arguments as variables or keywords when unquoted
--endif()
  
- project (x265)
--cmake_minimum_required (VERSION 2.8.8) # OBJECT libraries require 2.8.8
+-cmake_minimum_required (VERSION 2.8.8...3.10) # OBJECT libraries require 2.8.8
 +cmake_minimum_required (VERSION 2.8.8...4.0) # OBJECT libraries require 2.8.8
- include(CheckIncludeFiles)
- include(CheckFunctionExists)
- include(CheckSymbolExists)
-diff --git a/dynamicHDR10/CMakeLists.txt b/dynamicHDR10/CMakeLists.txt
-index 22fb79d44..03c866b1f 100644
+ 
+ if (POLICY CMP0075)
+     cmake_policy(SET CMP0075 NEW) # CMAKE_REQUIRED_LIBRARIES warning
+diff --git a/source/dynamicHDR10/CMakeLists.txt b/source/dynamicHDR10/CMakeLists.txt
+index 4243338c6..03c866b1f 100644
 --- a/dynamicHDR10/CMakeLists.txt
 +++ b/dynamicHDR10/CMakeLists.txt
 @@ -10,7 +10,7 @@ add_library(dynamicHDR10 OBJECT
      hdr10plus.h
      api.cpp )
  
--cmake_minimum_required (VERSION 2.8.11)
+-cmake_minimum_required (VERSION 2.8.11...3.26)
 +cmake_minimum_required (VERSION 2.8.11...4.0)
  project(dynamicHDR10)
  include(CheckIncludeFiles)
@@ -59,5 +48,5 @@ index 22fb79d44..03c866b1f 100644
 \ No newline at end of file
 +endif()
 -- 
-2.49.0
+2.43.0
 
diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
similarity index 87%
rename from meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
rename to meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
index 79dd99220e..9bef2b8bd2 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
 DEPENDS = "nasm-native gnutls zlib libpcre numactl"
 
 SRC_URI = " \
-    https://bitbucket.org/multicoreware/x265_git/downloads/x265_${PV}.tar.gz \
+    https://download.videolan.org/pub/pub/videolan/${BPN}/${BPN}_${PV}.tar.gz \
     file://0001-json11.cpp-Include-cstdint.patch \
     file://0001-x265-fix-build-with-cmake-4.patch \
 "
-SRC_URI[sha256sum] = "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29"
+SRC_URI[sha256sum] = "40b1ea0453e0309f0eba934e0ddf533f8f6295966679e8894e8f1c1c8d5e1210"
 S = "${UNPACKDIR}/x265_${PV}/source"
 
 inherit lib_package cmake pkgconfig
-- 
2.47.3


