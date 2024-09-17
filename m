Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4757FCAC59A
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 20:01:05 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.361.1726603264281307550
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 13:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IyMjurks;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20551e2f1f8so54950325ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 13:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726603263; x=1727208063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oZKcLO5MnbECAvANEhsfjgj6yrYKnOB/ZkXuN7HnTaM=;
        b=IyMjurksjy33HDV4Gic7lXJzdHvD1Cb3ZT0auTAYi3jlQ4TlmaPXRuVcypDecjbvor
         4ZFPrTH8pFUx5celoU1SrtD7dpSc8abRMsXb0goqgBdtWxR1j1hP/uSvoDx6P60AqoWp
         O2Q5ZLh2ruXyqDQpWV8sbzewH7Qftp0ULGBho4rIELzUaDuQwpvsK40eg0LjnLVryqjT
         LEgtaelkWwffdx5bL6xZBBCgPZoZXGSzg2tIQQ6dTM2gk28Qezn2ecZbqWYtWzGbTt1r
         P6daku/t998nXTbvHKMa9tGNJg2dECUOd7CeqB7xhaJJJRkEMWKr0SCQD5yC38Rc9f5V
         a6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726603263; x=1727208063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZKcLO5MnbECAvANEhsfjgj6yrYKnOB/ZkXuN7HnTaM=;
        b=Uz0e5a15noS5Wj2jaE/rGLTxUlrgWL8Zjtb7zCi7dz0nvMgYWyBUXs8gZi9LjKvpAG
         YANbM/bJFPSGkWDD3I9Zm/p9bv8HRz7c7APvqfO8lCXsqgNVtfu/AEJgkqLHlGcoIwNh
         vBF23R8wXtMeoacO7dm0MrHqTMecF3mpwC/9OyjeSBKkLh1S0ezszDfqm34aGsmf+Djm
         GvvL1t+w2NWb9Jh9FvUpZgrpPBCLghLlnc8NAQ5qlecYNPiojJooDwZEiQxV970HJTX9
         sgh0/s09nrEJVSVn382UjvGZaJ4Bg/lU06hStsXrKQvrw4kzbv+qUTPLLs0A3aYtY37J
         J6Vg==
X-Gm-Message-State: AOJu0YwEkKDdA+GRxZOF0+8UZgAvSMonymodBDFKQyeGeb/oPZXZh7Vc
	lNfg4ck6K5JmAjXf32rreyA4bRUWpPmofypSPr4OYC2Mo/DqMMD+udEdIf4t
X-Google-Smtp-Source: AGHT+IFR0u9icDDndLg2+O0t2bHT12uGxIFXtnj7bT1irozKUu37V7msjxl20JK94Sckuv8HYNqX9A==
X-Received: by 2002:a17:902:f54f:b0:202:4666:f018 with SMTP id d9443c01a7336-20781d628afmr242670275ad.15.1726603263321;
        Tue, 17 Sep 2024 13:01:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::2c8d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079472e148sm53300775ad.245.2024.09.17.13.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 13:01:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] highway: Fix cmake to detect riscv32
Date: Tue, 17 Sep 2024 13:01:00 -0700
Message-ID: <20240917200100.792443-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 20:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112347

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ck-for-deducing-32bit-or-64bit-RISCV.patch | 76 +++++++++++++++++++
 .../recipes-extended/highway/highway_1.2.0.bb |  7 +-
 2 files changed, 80 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/highway/highway/0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch

diff --git a/meta-oe/recipes-extended/highway/highway/0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch b/meta-oe/recipes-extended/highway/highway/0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch
new file mode 100644
index 0000000000..bafe218f0d
--- /dev/null
+++ b/meta-oe/recipes-extended/highway/highway/0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch
@@ -0,0 +1,76 @@
+From 5d40c0c49f9acde83ba71b6f59094cdbd12e1b78 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 17 Sep 2024 18:22:36 +0000
+Subject: [PATCH] Add cmake check for deducing 32bit or 64bit RISCV
+
+Currently its only compilable for RV64 when RVV is
+enabled, this will extend it to build for RV32 with
+RVV as well
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 36 ++++++++++++++++++++++++++++++++++--
+ 1 file changed, 34 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ea8b330c..cd824787 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -65,6 +65,34 @@ if (NOT CMAKE_BUILD_TYPE)
+   set(CMAKE_BUILD_TYPE RelWithDebInfo)
+ endif()
+ 
++include(CheckCSourceCompiles)
++
++check_c_source_compiles("
++#if __riscv_xlen == 64
++int main() { return 0; }
++#else
++#error Not RISCV-64
++#endif
++" IS_RISCV_XLEN_64)
++
++check_c_source_compiles("
++#if __riscv_xlen == 32
++int main() { return 0; }
++#else
++#error Not RISCV-32
++#endif
++" IS_RISCV_XLEN_32)
++
++if(IS_RISCV_XLEN_32)
++  set(RISCV_XLEN 32)
++elseif(IS_RISCV_XLEN_64)
++  set(RISCV_XLEN 64)
++else()
++  message(WARNING "Unable to determine RISC-V XLEN")
++endif()
++
++message(STATUS "RISC-V XLEN: ${RISCV_XLEN}")
++
+ # The following is only required with GCC < 6.1.0 or CLANG < 16.0
+ set(HWY_CMAKE_ARM7 OFF CACHE BOOL "Set copts for Armv7 with NEON (requires vfpv4)?")
+ 
+@@ -72,7 +100,7 @@ set(HWY_CMAKE_ARM7 OFF CACHE BOOL "Set copts for Armv7 with NEON (requires vfpv4
+ # skipped. For GCC 13.1+, you can also build with -fexcess-precision=standard.
+ set(HWY_CMAKE_SSE2 OFF CACHE BOOL "Set SSE2 as baseline for 32-bit x86?")
+ 
+-# Currently this will compile the entire codebase with `-march=rv64gcv1p0`:
++# Currently this will compile the entire codebase with `-march=rv<XLEN>gcv1p0`:
+ set(HWY_CMAKE_RVV ON CACHE BOOL "Set copts for RISCV with RVV?")
+ 
+ # Unconditionally adding -Werror risks breaking the build when new warnings
+@@ -378,7 +406,11 @@ else()
+     # we add the gcv compiler flag, which then requires the CPU (now when using
+     # either compiler) to support V.
+     if(HWY_CMAKE_RVV)
+-      list(APPEND HWY_FLAGS -march=rv64gcv1p0)
++      if(RISCV_XLEN EQUAL 64)
++        list(APPEND HWY_FLAGS -march=rv64gcv1p0)
++      elseif(RISCV_XLEN EQUAL 32)
++        list(APPEND HWY_FLAGS -march=rv32gcv1p0)
++      endif()
+       if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
+         list(APPEND HWY_FLAGS -menable-experimental-extensions)
+       endif()
diff --git a/meta-oe/recipes-extended/highway/highway_1.2.0.bb b/meta-oe/recipes-extended/highway/highway_1.2.0.bb
index 020116d864..d226cd82ce 100644
--- a/meta-oe/recipes-extended/highway/highway_1.2.0.bb
+++ b/meta-oe/recipes-extended/highway/highway_1.2.0.bb
@@ -6,15 +6,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2b42edef8fa55315f34f2370b4715ca9"
 
 inherit cmake
 
-SRC_URI = "git://github.com/google/highway.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/google/highway.git;protocol=https;branch=master \
+           file://0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch"
 
 SRCREV = "457c891775a7397bdb0376bb1031e6e027af1c48"
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = "-DBUILD_TESTING=0 -DCMAKE_BUILD_TYPE=Release"
-# RVV is enabled by default and highway cmake system assumes that RISCV64 = RISCV
-EXTRA_OECMAKE:append:riscv32 = " -DHWY_CMAKE_RVV=OFF"
 
 CXXFLAGS:append:arm = " -mfp16-format=ieee"
 # Option not supported with clang and its default format for __fp16 anyway with clang
 CXXFLAGS:remove:toolchain-clang = "-mfp16-format=ieee"
+
+TOOLCHAIN = "gcc"

