Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D58CC98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 15:18:05 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.278.1790176675892636794
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 08:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rH8F7mar;
 spf=pass (domain: konsulko.com, ip: 74.125.225.141, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so5563015e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 08:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790176674; x=1790781474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AL+jan2JSzjsO1XbipMqIwLy4QODmfpMSfl3zEYRE/Y=;
        b=rH8F7marzJZsXyJQ2KZslTtDtJNaf4Uv4/zjxQDYYGTBHe1cnnvQC8fi86NR7HsVmN
         IjmN+zw59DNsf9eVWu5TC6PNdlN19GZrZ67unDrA8LJkDR3zQ/74F9FT5quGwF3rv7LG
         9RfTNXWTcK5N0R8ZEsEl23I5axi0dV6rjHLiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176674; x=1790781474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AL+jan2JSzjsO1XbipMqIwLy4QODmfpMSfl3zEYRE/Y=;
        b=W7vzqNYIJjyfm27BHP2+OIJLR+AtBgrikMChVCRzmsChfXP2WbZxCaDjm4KUdnUjeG
         dpF837iAGbJUzi3UGwtcRmYAci/Iq23TNwDY2dNWnLe/a/QcG8bTsUHs/3InSZSigTR+
         lJn0HY0r8U8KsyqM1k4zpm8pKKZGcSzl1xBj4HSSpfPZrev7FrU1/bman0ZZ84oJvOwz
         K2tBn9L7IkNZaYF2bDzwnRRdCwlS0WRgi9ihYsH0L79feWNrgpVVIjezVjKOWpeizyHw
         TBNHsoGd9HIPdwXcbBS8eAAwOVX9Jd5Kb/d/eWyzrAvws5jH0ncoQursegdep4aKKBJO
         fBKA==
X-Gm-Message-State: AFuF++mHHBVShl9+d2nvn7A6+JoX2HUD/U/jnpFDrbs81RBE1ilzINnX
	eckWNSEyLGGNv/A9oXwPbj4gOdcFkj37BroypNbXT5HpYYC49CvUn9xPWs2Hd+9HfEfMPht8kW6
	M1XZt
X-Gm-Gg: AYBFou3AfoP8l2BpMWxWkZ4pQyk4uLpztS2fCOpKGLa5XJlPLTVKg2wxJ6pAVbi/0mq
	6UCji6+RbNf1tnM3AxiNRoGDWf0TWOYVlzwGFhwJV8b/UnMT1cQ4ZqHA+zNKET8pmBuCc2c68Fd
	57cJpuDlP2CLlSNQhInRsW71G8oJAqtUEnXNGeTOt70YCiPZBDvameFXgHE4NpmMSuKePHoqQCy
	+Wo0HmhzOV4mOf0bW1WfbydwdEjXCo5MdUY3bkM+V/TF7NnsB0Bz7MnQPArs11bU1MFL17OV+Y8
	fmjBQes1oR5rU2nZg5GEvSUWr64oFiZ21EQ7FB2M7hOrQpF5TakWvxaeeG/F/lL9CeOHbPD0eim
	PJ87i8Y+TZgFAo9Z3SuBSzvsjdm6YDaH9z3ryQlO1sqPfc8ixSmqHtmGjEqhrLG7G8Qf3R6BGAx
	Iozg6izD2q/oCQp3F9pZ6mfgY5Wrzlp/EZzc9O2YtxvOCOZd16r0G0bIkNh0R51R55Zdfbxmwcd
	VBfWWB914PmXL94KLsHcINDffMj8VlPl2fqa02OqJqwJS8YFOa54kwePZLJFEvqdUV4B2ehE3oL
	16nvDPWfubXvzVXfKAX6n2Y=
X-Received: by 2002:a05:600c:c8a:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-49fdf2543f4mr45290095e9.34.1790176674097;
        Wed, 23 Sep 2026 08:17:54 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde18093csm95949225e9.3.2026.09.23.08.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:17:53 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-multimedia][PATCH] x265: Upgrade 4.1 -> 4.2
Date: Wed, 23 Sep 2026 18:17:50 +0300
Message-ID: <20260923151750.3398973-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 15:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130240

Upgrade to release 4.2:

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
---
 .../0001-x265-fix-build-with-cmake-4.patch    | 39 +++++++------------
 .../x265/{x265_4.1.bb => x265_4.2.bb}         |  2 +-
 2 files changed, 15 insertions(+), 26 deletions(-)
 rename meta-multimedia/recipes-multimedia/x265/{x265_4.1.bb => x265_4.2.bb} (93%)

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
similarity index 93%
rename from meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
rename to meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
index 79dd99220e..4841f34016 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://0001-json11.cpp-Include-cstdint.patch \
     file://0001-x265-fix-build-with-cmake-4.patch \
 "
-SRC_URI[sha256sum] = "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29"
+SRC_URI[sha256sum] = "40b1ea0453e0309f0eba934e0ddf533f8f6295966679e8894e8f1c1c8d5e1210"
 S = "${UNPACKDIR}/x265_${PV}/source"
 
 inherit lib_package cmake pkgconfig
-- 
2.47.3


