Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09199CF8869
	for <webhook@archiver.kernel.org>; Sat,  5 Oct 2024 06:54:16 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.7091.1728111249521686352
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Oct 2024 23:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UzK7OvkI;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20b64584fd4so28575715ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 23:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728111249; x=1728716049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfI6cwxIF5Hhx9upprMP/cobOYwzj90JI2z9wO9ep20=;
        b=UzK7OvkIwRK7hi/xhnfaS67BOXhcRIfL2vfa9Zpj9DgTvIgMWkE6w7ULc/Ya+YyJ06
         LBJKCW5qiP4sm8sfstTnWRYWGyQoMFW6j1VULe1+QP5dp4N3sVBbTA8e/QLeETY0zDWH
         XDgHZGHUeLkO+t/f3Ks07bdzDBhKrXPMINtW17TeTy4KU1DDa61Y5m836CD1/Z2athCo
         pA/zPwZdgVxYVSmAPOLDdwlcV+dqU0wuPp/l41qREKwga83ZB+T5i11iCLnJTD1TOCz0
         WPkQPjCDoRLGsPQ82W0pKcxLIsIoMs7ClkRZdYeKbhtTvZsgJP1CA5r39E46PkP3722R
         o/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728111249; x=1728716049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WfI6cwxIF5Hhx9upprMP/cobOYwzj90JI2z9wO9ep20=;
        b=uqhorAEhUxSSww43DphUMEnSpF0210CINXMAmQyDmzT0h3NNwu1pQlofXd84EJ2dPB
         ccHN5y2SV0Qn781FGiskXG8AXYhXRQCplMvvClWRX/w9crIDFySOPnLlnMPSzG1iJgff
         YncCcbXYeisIEC+WSkyNszRsEJ3SQAQ3g7QkcnLRDTGIsSdj6N6MiNapCjT6q/dc+cfV
         Lwf2AgkVzK3Xi9Ko7+C1bDi9n99FyhMTN52pZs6ERL3ZurxnnqcN/iQ4ItDkDu+qkqqL
         /zT1nj10ROdwf4djP7G7baQt5eVovZCTaVO6pRAx4dKxLkEXBrZoIKGdZ4GEp2SQ99Ah
         1WfA==
X-Gm-Message-State: AOJu0Yy3by17a+rnmWM0tnzJ/9rwvH7x1M9Aec39DkYCUwFfOxblAgpI
	UEgmqB1cctyILkgUOZCQv6PCOkaoC0hD9w1Ws0ix9IIszpQqSEn4LxQFc5Ou
X-Google-Smtp-Source: AGHT+IHuh/Fg7wnIcOcsQdLME78UNdJYyMS2AK0A3itk6Ua4MTBuSHhwbYw9c3zQvy/RoeG+4sdQuQ==
X-Received: by 2002:a17:902:dac6:b0:20b:8109:2c87 with SMTP id d9443c01a7336-20bfe023e2cmr76845165ad.6.1728111248598;
        Fri, 04 Oct 2024 23:54:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6d1b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138afaa0sm8024325ad.4.2024.10.04.23.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 23:54:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] highway: Update the risc32 RVV selection patch
Date: Fri,  4 Oct 2024 23:54:05 -0700
Message-ID: <20241005065406.3182738-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Oct 2024 06:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112672

Use the v3 of upstream submitted patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ck-for-deducing-32bit-or-64bit-RISCV.patch | 71 +++++++++----------
 1 file changed, 35 insertions(+), 36 deletions(-)

diff --git a/meta-oe/recipes-extended/highway/highway/0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch b/meta-oe/recipes-extended/highway/highway/0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch
index bafe218f0d..ecc9c441c5 100644
--- a/meta-oe/recipes-extended/highway/highway/0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch
+++ b/meta-oe/recipes-extended/highway/highway/0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch
@@ -1,4 +1,4 @@
-From 5d40c0c49f9acde83ba71b6f59094cdbd12e1b78 Mon Sep 17 00:00:00 2001
+From b06541a75043c9a8213187fca942a0270783bd0e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 17 Sep 2024 18:22:36 +0000
 Subject: [PATCH] Add cmake check for deducing 32bit or 64bit RISCV
@@ -7,52 +7,49 @@ Currently its only compilable for RV64 when RVV is
 enabled, this will extend it to build for RV32 with
 RVV as well
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/google/highway/pull/2330]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- CMakeLists.txt | 36 ++++++++++++++++++++++++++++++++++--
- 1 file changed, 34 insertions(+), 2 deletions(-)
+ CMakeLists.txt | 38 +++++++++++++++++++++++++++++++++++---
+ 1 file changed, 35 insertions(+), 3 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ea8b330c..cd824787 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -65,6 +65,34 @@ if (NOT CMAKE_BUILD_TYPE)
-   set(CMAKE_BUILD_TYPE RelWithDebInfo)
+@@ -59,6 +59,33 @@ if(CHECK_PIE_SUPPORTED)
+   endif()
  endif()
  
-+include(CheckCSourceCompiles)
++if (CMAKE_CXX_COMPILER_ARCHITECTURE_ID MATCHES "RISCV32|RISCV64|RISCV128" OR CMAKE_SYSTEM_PROCESSOR MATCHES "riscv32|riscv64|riscv128")
++  include(CheckCSourceCompiles)
++  check_c_source_compiles("
++  #if __riscv_xlen == 64
++  int main() { return 0; }
++  #else
++  #error Not RISCV-64
++  #endif
++  " IS_RISCV_XLEN_64)
 +
-+check_c_source_compiles("
-+#if __riscv_xlen == 64
-+int main() { return 0; }
-+#else
-+#error Not RISCV-64
-+#endif
-+" IS_RISCV_XLEN_64)
++  check_c_source_compiles("
++  #if __riscv_xlen == 32
++  int main() { return 0; }
++  #else
++  #error Not RISCV-32
++  #endif
++  " IS_RISCV_XLEN_32)
 +
-+check_c_source_compiles("
-+#if __riscv_xlen == 32
-+int main() { return 0; }
-+#else
-+#error Not RISCV-32
-+#endif
-+" IS_RISCV_XLEN_32)
-+
-+if(IS_RISCV_XLEN_32)
-+  set(RISCV_XLEN 32)
-+elseif(IS_RISCV_XLEN_64)
-+  set(RISCV_XLEN 64)
-+else()
-+  message(WARNING "Unable to determine RISC-V XLEN")
++  if(IS_RISCV_XLEN_32)
++    set(RISCV_XLEN 32)
++  elseif(IS_RISCV_XLEN_64)
++    set(RISCV_XLEN 64)
++  else()
++    message(WARNING "Unable to determine RISC-V XLEN")
++  endif()
 +endif()
 +
-+message(STATUS "RISC-V XLEN: ${RISCV_XLEN}")
-+
- # The following is only required with GCC < 6.1.0 or CLANG < 16.0
- set(HWY_CMAKE_ARM7 OFF CACHE BOOL "Set copts for Armv7 with NEON (requires vfpv4)?")
+ include(GNUInstallDirs)
  
-@@ -72,7 +100,7 @@ set(HWY_CMAKE_ARM7 OFF CACHE BOOL "Set copts for Armv7 with NEON (requires vfpv4
+ if (NOT CMAKE_BUILD_TYPE)
+@@ -72,7 +99,7 @@ set(HWY_CMAKE_ARM7 OFF CACHE BOOL "Set c
  # skipped. For GCC 13.1+, you can also build with -fexcess-precision=standard.
  set(HWY_CMAKE_SSE2 OFF CACHE BOOL "Set SSE2 as baseline for 32-bit x86?")
  
@@ -61,15 +58,17 @@ index ea8b330c..cd824787 100644
  set(HWY_CMAKE_RVV ON CACHE BOOL "Set copts for RISCV with RVV?")
  
  # Unconditionally adding -Werror risks breaking the build when new warnings
-@@ -378,7 +406,11 @@ else()
+@@ -378,7 +405,13 @@ else()
      # we add the gcv compiler flag, which then requires the CPU (now when using
      # either compiler) to support V.
      if(HWY_CMAKE_RVV)
 -      list(APPEND HWY_FLAGS -march=rv64gcv1p0)
 +      if(RISCV_XLEN EQUAL 64)
 +        list(APPEND HWY_FLAGS -march=rv64gcv1p0)
++        add_link_options(-march=rv64gcv1p0)
 +      elseif(RISCV_XLEN EQUAL 32)
 +        list(APPEND HWY_FLAGS -march=rv32gcv1p0)
++        add_link_options(-march=rv32gcv1p0)
 +      endif()
        if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
          list(APPEND HWY_FLAGS -menable-experimental-extensions)

