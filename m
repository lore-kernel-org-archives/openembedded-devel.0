Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF942C6FA8B
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 03:41:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.3793.1662954089040768708
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lIRo6iFX;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id b75so2116555pfb.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5CQllqUNijE0eVLU0/USJ2JhqanNLSRQXtYj6W45eDo=;
        b=lIRo6iFXgbxGWnxgTdTY7+Tmysjlt4OiV4b4+ZkCfiI5kajkXwOwHfSBGnQO+SGwyO
         W6CEJw6u3VlsJ3O+PAAXcooafm54R0i7IAph2V3D3YJxeht05K671GuAqiLC3OFIYkdb
         RS1FXWj6KMM1WofXF4CJH9Rd5HSFoCqWQ03XF2spyz638wyygDgQRxDhQ9KaJmQFC7aN
         wSfaTVC9BONUCr6pTxTLmOnjcD2ZNS0b2fhzcga/GrywrgFrt1kcpnjp5Jco6VrhXdpA
         bxWd7jvWsdxQnvwzHZSctoqCDS3+hYmPULq38CGetw+Ge0+LA2h5oNxFN1mjtcjOyUfE
         Jg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5CQllqUNijE0eVLU0/USJ2JhqanNLSRQXtYj6W45eDo=;
        b=RxxPCfDNlahHfsup6fE9MzwB2L3g39s1y4qAfUfH9Bz30iXqYDcfcarrPni19KT+BI
         33wi9Vwf94fQeIkhJsWXze9upJPmamp321t2QjVZFPbkTRa0iGUgA2MLsi/64ZUrvb3s
         jdfTYzxl7gjjPK9HzODGRGPt8rBf+uFLrPVr9XPBPnAiDOGUh+vxnf96aok+xt32ryVM
         t5FP8zkXbpPx02uIIHgKknNrLcDDLxVdNKedyzKXxuqAjZDXSbP7LFfWwLMDgQZNve7l
         6O67Baiqk/V2EW5tOjg4G4nzlhzngBqQokgTyjEVFN4TOLaZaPFJjzDDjApUSfrSXjm3
         FyVA==
X-Gm-Message-State: ACgBeo0kPNDuQALJsDbx1o7M68710JF/ohq6inFxGDEPK+nTNIfc9w3A
	C4VYH1e2mwe7iRfaPMa9f2nKEo39XoxkpQ==
X-Google-Smtp-Source: 
 AA6agR4AxBuEktJCjYUH0LYjVBmiNmNoThyTAT9EB8a900M6ICXd2ya2Vfee+Y+XgZurH2oVI6q7dg==
X-Received: by 2002:a63:2c8b:0:b0:41c:5f9e:a1d6 with SMTP id
 s133-20020a632c8b000000b0041c5f9ea1d6mr21338989pgs.601.1662954088166;
        Sun, 11 Sep 2022 20:41:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 d7-20020a170902cec700b00176ea6ce0efsm4664940plg.109.2022.09.11.20.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 20:41:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/7] rocksdb: Upgrade to 7.5.3 release
Date: Sun, 11 Sep 2022 20:41:18 -0700
Message-Id: <20220912034123.1885229-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912034123.1885229-1-raj.khem@gmail.com>
References: <20220912034123.1885229-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Sep 2022 03:41:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98742

Drop upstreamed patches and forward port existing ones

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-cmake-Add-check-for-atomic-support.patch |  4 +-
 ...01-cmake-Use-exported-target-for-bz2.patch | 11 +----
 ...0001-folly-Use-SYS_futex-for-syscall.patch | 42 ------------------
 ...Limit-the-mm_malloc.h-hack-to-glibc-.patch | 23 ----------
 ...ment-toku_time_now-for-rv32-rv64-in-.patch | 44 -------------------
 meta-oe/recipes-dbs/rocksdb/files/arm.patch   |  2 +-
 meta-oe/recipes-dbs/rocksdb/files/mips.patch  |  9 ++--
 meta-oe/recipes-dbs/rocksdb/files/ppc64.patch |  6 +--
 .../{rocksdb_6.20.3.bb => rocksdb_7.5.3.bb}   |  7 +--
 9 files changed, 13 insertions(+), 135 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-folly-Use-SYS_futex-for-syscall.patch
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-jemalloc_helper-Limit-the-mm_malloc.h-hack-to-glibc-.patch
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-range_tree-Implement-toku_time_now-for-rv32-rv64-in-.patch
 rename meta-oe/recipes-dbs/rocksdb/{rocksdb_6.20.3.bb => rocksdb_7.5.3.bb} (88%)

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
index 8bdd27ff25..2906100dee 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
@@ -27,7 +27,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -935,7 +935,12 @@ endif()
+@@ -1000,7 +1000,12 @@ option(ROCKSDB_BUILD_SHARED "Build share
  if(WIN32)
    set(SYSTEM_LIBS ${SYSTEM_LIBS} shlwapi.lib rpcrt4.lib)
  else()
@@ -39,7 +39,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +  endif()
  endif()
  
- add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})
+ set(ROCKSDB_PLUGIN_EXTERNS "")
 --- /dev/null
 +++ b/cmake/modules/CheckAtomic.cmake
 @@ -0,0 +1,69 @@
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
index d3054759a7..139312a298 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
@@ -13,16 +13,7 @@ Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/7541]
 
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -32,7 +32,7 @@
- # 3. cmake ..
- # 4. make -j
- 
--cmake_minimum_required(VERSION 3.5.1)
-+cmake_minimum_required(VERSION 3.7.2)
- 
- list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake/modules/")
- include(ReadVersion)
-@@ -152,12 +152,7 @@ else()
+@@ -153,12 +153,7 @@ else()
    if(WITH_BZ2)
      find_package(BZip2 REQUIRED)
      add_definitions(-DBZIP2)
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-folly-Use-SYS_futex-for-syscall.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-folly-Use-SYS_futex-for-syscall.patch
deleted file mode 100644
index 9c70d4f6a6..0000000000
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-folly-Use-SYS_futex-for-syscall.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From ddcc8a9f7e0f0bfee96f2f0a0c10f21f9fa9b05d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Nov 2020 15:02:28 -0800
-Subject: [PATCH] folly: Use SYS_futex for syscall
-
-glibc defines SYS_futex and on newer 32bit CPUs like RISCV-32, arc there
-is no 32bit time_t therefore define SYS_futex in terms of SYS_futex_time64
-
-Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/7676]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- third-party/folly/folly/detail/Futex.cpp | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
---- a/third-party/folly/folly/detail/Futex.cpp
-+++ b/third-party/folly/folly/detail/Futex.cpp
-@@ -48,9 +48,15 @@ namespace {
- #define FUTEX_CLOCK_REALTIME 256
- #endif
- 
-+/// Newer 32bit CPUs eg. RISCV-32 are defaulting to 64bit time_t from get go and
-+/// therefore do not define __NR_futex
-+#if !defined(SYS_futex) && defined(SYS_futex_time64)
-+# define SYS_futex SYS_futex_time64
-+#endif
-+
- int nativeFutexWake(const void* addr, int count, uint32_t wakeMask) {
-   long rv = syscall(
--      __NR_futex,
-+      SYS_futex,
-       addr, /* addr1 */
-       FUTEX_WAKE_BITSET | FUTEX_PRIVATE_FLAG, /* op */
-       count, /* val */
-@@ -112,7 +118,7 @@ FutexResult nativeFutexWaitImpl(
-   // Unlike FUTEX_WAIT, FUTEX_WAIT_BITSET requires an absolute timeout
-   // value - http://locklessinc.com/articles/futex_cheat_sheet/
-   long rv = syscall(
--      __NR_futex,
-+      SYS_futex,
-       addr, /* addr1 */
-       op, /* op */
-       expected, /* val */
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-jemalloc_helper-Limit-the-mm_malloc.h-hack-to-glibc-.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-jemalloc_helper-Limit-the-mm_malloc.h-hack-to-glibc-.patch
deleted file mode 100644
index dbb0dda221..0000000000
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-jemalloc_helper-Limit-the-mm_malloc.h-hack-to-glibc-.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 1a69d4cc3f97e348dba9714c7ec60da1a8650664 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Jun 2021 22:05:36 -0700
-Subject: [PATCH] jemalloc_helper: Limit the mm_malloc.h hack to glibc on linux
-
-Musl does not need this hack
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- port/jemalloc_helper.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/port/jemalloc_helper.h
-+++ b/port/jemalloc_helper.h
-@@ -5,7 +5,7 @@
- 
- #pragma once
- 
--#if defined(__clang__)
-+#if defined(__clang__) && defined(__GLIBC__)
- // glibc's `posix_memalign()` declaration specifies `throw()` while clang's
- // declaration does not. There is a hack in clang to make its re-declaration
- // compatible with glibc's if they are declared consecutively. That hack breaks
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-range_tree-Implement-toku_time_now-for-rv32-rv64-in-.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-range_tree-Implement-toku_time_now-for-rv32-rv64-in-.patch
deleted file mode 100644
index 86c1bffea6..0000000000
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-range_tree-Implement-toku_time_now-for-rv32-rv64-in-.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 89c032a9b4011385c0b504ea61e5df0db71f0ff5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 16 Jun 2021 19:06:02 -0700
-Subject: [PATCH] range_tree: Implement toku_time_now for rv32/rv64 in asm
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../range_tree/lib/portability/toku_time.h    | 19 +++++++++++++++++++
- 1 file changed, 19 insertions(+)
-
-diff --git a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
-index 4425a4a2e..4ac964f85 100644
---- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
-+++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
-@@ -133,6 +133,25 @@ static inline tokutime_t toku_time_now(void) {
-   return result;
- #elif defined(__powerpc__)
-   return __ppc_get_timebase();
-+#elif defined(__riscv) // RISC-V
-+#if __riscv_xlen == 32
-+  uint32_t lo, hi0, hi1;
-+  __asm __volatile__(
-+      "rdcycleh %0\n"
-+      "rdcycle %1\n"
-+      "rdcycleh %2\n"
-+      "sub %0, %0, %2\n"
-+      "seqz %0, %0\n"
-+      "sub %0, zero, %0\n"
-+      "and %1, %1, %0\n"
-+      : "=r"(hi0), "=r"(lo), "=r"(hi1));
-+  return ((uint64_t)hi1 << 32) | lo;
-+#else
-+  uint64_t result;
-+  __asm __volatile__("rdcycle %0" : "=r"(result));
-+  return result;
-+#endif
-+
- #else
- #error No timer implementation for this platform
- #endif
--- 
-2.32.0
-
diff --git a/meta-oe/recipes-dbs/rocksdb/files/arm.patch b/meta-oe/recipes-dbs/rocksdb/files/arm.patch
index d428a6624a..573767797d 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/arm.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/arm.patch
@@ -3,7 +3,7 @@ implement timer for arm >= v6
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
 +++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
-@@ -161,6 +161,20 @@ static inline tokutime_t toku_time_now(v
+@@ -164,6 +164,20 @@ static inline tokutime_t toku_time_now(v
    struct timeval tv;
    gettimeofday(&tv, nullptr);
    return (uint64_t)tv.tv_sec * 1000000 + tv.tv_usec;
diff --git a/meta-oe/recipes-dbs/rocksdb/files/mips.patch b/meta-oe/recipes-dbs/rocksdb/files/mips.patch
index db2305d296..0104d54347 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/mips.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/mips.patch
@@ -3,11 +3,10 @@ implement timer implementation for mips platform
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
 +++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
-@@ -155,7 +155,12 @@ static inline tokutime_t toku_time_now(v
-   __asm __volatile__("rdcycle %0" : "=r"(result));
-   return result;
- #endif
--
+@@ -158,6 +158,12 @@ static inline tokutime_t toku_time_now(v
+   uint64_t cycles;
+   asm volatile("rdcycle %0" : "=r"(cycles));
+   return cycles;
 +#elif defined(__mips__)
 +  // mips apparently only allows rdtsc for superusers, so we fall
 +  // back to gettimeofday.  It's possible clock_gettime would be better.
diff --git a/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch b/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch
index bc40f1b1e7..45deef338c 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch
@@ -23,6 +23,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +  uint64_t result;
 +  asm volatile("mfspr %0, 268" : "=r"(result));
 +  return result;
- #elif defined(__riscv) // RISC-V
- #if __riscv_xlen == 32
-   uint32_t lo, hi0, hi1;
+ #elif defined(__s390x__)
+   uint64_t result;
+   asm volatile("stckf %0" : "=Q"(result) : : "cc");
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_7.5.3.bb
similarity index 88%
rename from meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
rename to meta-oe/recipes-dbs/rocksdb/rocksdb_7.5.3.bb
index 2ad2d38a53..d4f0346ee1 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_7.5.3.bb
@@ -6,15 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "8608d75d85f8e1b3b64b73a4fb6d19baec61ba5c"
-SRCBRANCH = "6.20.fb"
+SRCREV = "540d5aae516265170564ec27b3e67a54a11b7045"
+SRCBRANCH = "7.5.fb"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=https \
            file://0001-cmake-Add-check-for-atomic-support.patch \
            file://0001-cmake-Use-exported-target-for-bz2.patch \
-           file://0001-folly-Use-SYS_futex-for-syscall.patch \
-           file://0001-jemalloc_helper-Limit-the-mm_malloc.h-hack-to-glibc-.patch \
-           file://0001-range_tree-Implement-toku_time_now-for-rv32-rv64-in-.patch \
            file://ppc64.patch \
            file://mips.patch \
            file://arm.patch \
-- 
2.37.3


