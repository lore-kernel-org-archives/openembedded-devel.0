Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B891C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 04:20:56 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.13853.1736914850163770009
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 20:20:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BhDVpYtM;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21661be2c2dso110047335ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 20:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736914849; x=1737519649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=55viSJ2mDVgzLQFKcuCc5gsI1bL4n/WiOecolF1gf/8=;
        b=BhDVpYtMdOcVA9hBNuXV6Sl/cfiiIAmlVr4fxts1A6hNVuZDe+NrAosb6e9RtjsFaP
         TfK1zLv3IM22mV1ylntN4viYQelxGxI2TINDTuifVlPQTniHv9KZ+AZT3N7DpyybNRxB
         mi3DW5iro0XvpQ+y/zUKKhYIsI6LzU7foHNgULGbFoeBGV4/WGS0AGI6PJkv3YTG5TB6
         gvTwT0AvENfru6dYcp1jldH8jKoJexlEqCV4AoR1qjy2a1/fMzHy2fHX03jyNo40ItH+
         9SV92BvWwT8IN1AO71+6Ag3rXlni/561W7ee63QbRl8egOTpe2jYtB+w+VuOcazZDC98
         +J1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736914849; x=1737519649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55viSJ2mDVgzLQFKcuCc5gsI1bL4n/WiOecolF1gf/8=;
        b=OhApcdfbBrhQC7YiCC6nXmXu7+CNEGNZssW40NUh1662vq4T+IJsT7YegW7KqdvJ1V
         jQ98yYNZxdHbnuhFqGGrfNwpN2EfiO/UD+NXz7WkTqhBU+A6i3cXE4vAr8/olavmS3vk
         Q1N4Vs9+6cHKoFBmcRx6OT4781JrSDQE/fsnxn9UoWldEb9Kp4r8YviCrbvopJzmxd8h
         OBDsTdmoq+yLpFv9S3rWKXSSb+FJXFdZtcLjkDL/cRue57+z2JKvy+iznlzwelEBHxrx
         guv+B6JFe9thvTBVxJ6Q3rB054c8Ov8KjqLdoY5Edd5BuiPbRL92k8DIyOBIy5AaQKwa
         1lQA==
X-Gm-Message-State: AOJu0Yzl56fSBVOLQbwuTeXbDUKcGWdrcUex1u1QJ1Kymy9i2Jnbm9h8
	5HCvahaHH1s4BHbmKTotAvM9XfkzdGNB/E8qcP8ZpsOraY4kJeGQQHCix6jD
X-Gm-Gg: ASbGnctoIRYX66gqQDrrMBkbfgmcMYEteLIcqKqpWe0drK0hdNSQ6kEJh3a7NR4koWR
	Qcyg66ZkqjQeyiTb4PUAVOBdK3brQTEIbp2trL3CmR/UGIx1gztVYdowUbmYGs2hTXpo1j3XWb7
	1k/k1C4N+R8FJ4/08uYnA2zT21ODTNPX91eHrMBdX0JyW7e95TQYIF5f7Ao6mwoSNmxe35CTpbg
	mjecuZbwNUnVgJQxBncrcMMB7rP3QCCRkKa7GnGTSKZznlr
X-Google-Smtp-Source: AGHT+IHkJSnL7yyKoQK7xJEO0gCNUhVYc8QE3rYtM+TlxRC1sT8BHKqThpPGhWVsENr6TEmpPH3BLw==
X-Received: by 2002:a05:6a20:3d83:b0:1e1:cba5:8e1b with SMTP id adf61e73a8af0-1e88d12b176mr43437188637.18.1736914848982;
        Tue, 14 Jan 2025 20:20:48 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::4ed6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a319c386290sm8842152a12.51.2025.01.14.20.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 20:20:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mariadb: Upgrade to 11.4.4
Date: Tue, 14 Jan 2025 20:20:46 -0800
Message-ID: <20250115042046.4024396-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 04:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114881

Its the latest LTS supported release series

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ative_10.11.10.bb => mariadb-native_11.4.4.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc             |  5 ++++-
 ...-Add-missing-includes-cstdint-and-cstdio.patch | 14 +++++---------
 ...tibility-with-ARMv9-by-updating-.arch-di.patch | 13 +++++--------
 .../mariadb/0001-Fix-library-LZ4-lookup.patch     | 10 +++-------
 ...-Check-if-syscall-exists-before-using-it.patch | 15 +++++----------
 ...e-Define-__NR_futex-if-it-does-not-exist.patch |  7 ++-----
 ...MakeLists.txt-fix-gen_lex_hash-not-found.patch | 11 ++++-------
 .../mariadb/configure.cmake-fix-valgrind.patch    |  7 +++----
 .../mysql/mariadb/cross-compiling.patch           |  9 +++------
 .../mysql/mariadb/fix-arm-atomic.patch            |  9 +++------
 meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch     | 10 ++++++++++
 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch | 10 ++++++++++
 meta-oe/recipes-dbs/mysql/mariadb/ssize_t.patch   | 11 ++++++++++-
 ...s-CMakeLists.txt-fix-do_populate_sysroot.patch |  7 +++----
 meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch | 12 ++++++++++--
 .../{mariadb_10.11.10.bb => mariadb_11.4.4.bb}    |  0
 17 files changed, 80 insertions(+), 70 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.10.bb => mariadb-native_11.4.4.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.10.bb => mariadb_11.4.4.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.10.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.10.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index ae782e78af..dae41d89aa 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
           "
-SRC_URI[sha256sum] = "b06a74650b83a16aa9ab098984482b028e75b000674b11ff288772c619a6f022"
+SRC_URI[sha256sum] = "96fbd2e6e93fb7e8b373eea75d85b6fea57c0e111a02090cbbefed52599dc77b"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
@@ -98,6 +98,9 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DCAT_EXECUTABLE=`which cat` \
                  -DSTACK_DIRECTION=1 \
                  -DHAVE_SYSTEM_LIBFMT_EXITCODE=0 \
+                 -DLSTAT_FOLLOWS_SLASHED_SYMLINK_EXITCODE=0 \
+                 -DSTAT_EMPTY_STRING_BUG_EXITCODE=0 \
+                 -DMASK_LONGDOUBLE_EXITCODE=0 \
                  -DCMAKE_AR:FILEPATH=${AR}"
 
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
index f8ccb998be..08e73424d1 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
@@ -1,4 +1,4 @@
-From 68100b1f2243304289b9a9a35e8fb0e1bb0cf70f Mon Sep 17 00:00:00 2001
+From ef47f8f41722b90a86ace86f0f509b4775c2f725 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 24 Jan 2023 21:40:43 -0800
 Subject: [PATCH] Add missing includes <cstdint> and <cstdio>
@@ -66,19 +66,15 @@ index 6db11cc9..c26b6a21 100644
  #include "rocksdb/slice_transform.h"
  #include "rocksdb/slice.h"
  #include "util/string_util.h"
-
-diff --git a/util/string_util.h b/util/string_util.h
-index 55d106fff02..11178fd1d7b 100644
+diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rocksdb/rocksdb/util/string_util.h
+index a761be66..064d059f 100644
 --- a/storage/rocksdb/rocksdb/util/string_util.h
 +++ b/storage/rocksdb/rocksdb/util/string_util.h
 @@ -6,6 +6,7 @@
-
+ 
  #pragma once
-
+ 
 +#include <cstdint>
  #include <sstream>
  #include <string>
  #include <unordered_map>
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
index 11d1724768..2a1c74a68c 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
@@ -1,4 +1,4 @@
-From 1b0c05b53ede7decb3f4dfe6187f9573cab5e0ab Mon Sep 17 00:00:00 2001
+From 0b1ba174bd5148c0675b335fcebde767a56e10bb Mon Sep 17 00:00:00 2001
 From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
 Date: Mon, 2 Dec 2024 02:18:46 +0000
 Subject: [PATCH] Ensure compatibility with ARMv9 by updating .arch directive
@@ -19,11 +19,11 @@ Upstream-Status: Submitted
 
 Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
 ---
- storage/innobase/sync/cache.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ storage/innobase/sync/cache.cc | 5 +++++
+ 1 file changed, 5 insertions(+)
 
 diff --git a/storage/innobase/sync/cache.cc b/storage/innobase/sync/cache.cc
-index 43d642d05b5..af2d1f3d221 100644
+index 43d642d0..c5e67709 100644
 --- a/storage/innobase/sync/cache.cc
 +++ b/storage/innobase/sync/cache.cc
 @@ -82,7 +82,12 @@ static void pmem_cvap(const void* buf, size_t size)
@@ -38,7 +38,4 @@ index 43d642d05b5..af2d1f3d221 100644
 +
    __asm__ __volatile__("dmb ishst" ::: "memory");
  }
-
--- 
-2.43.0
-
+ 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
index d8671b76b0..8105d3d785 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
@@ -1,18 +1,17 @@
-From f15fbdf1244ca9ce01c5507660a86d685ed88bcf Mon Sep 17 00:00:00 2001
+From 2e64c0c22f630cbc301d385e46021853116f9c75 Mon Sep 17 00:00:00 2001
 From: Sumit Garg <sumit.garg@linaro.org>
 Date: Mon, 21 Mar 2022 15:08:40 +0800
 Subject: [PATCH] Fix library LZ4 lookup.
 
+Upstream-Status: Pending
 Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
-Upstream-Status: Pending
-
  cmake/FindLZ4.cmake | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/cmake/FindLZ4.cmake b/cmake/FindLZ4.cmake
-index eebd859..094241c 100644
+index eebd8596..094241ce 100644
 --- a/cmake/FindLZ4.cmake
 +++ b/cmake/FindLZ4.cmake
 @@ -1,5 +1,10 @@
@@ -28,6 +27,3 @@ index eebd859..094241c 100644
  
  if(LZ4_INCLUDE_DIRS AND EXISTS "${LZ4_INCLUDE_DIRS}/lz4.h")
    file(STRINGS "${LZ4_INCLUDE_DIRS}/lz4.h" LZ4_H REGEX "^#define LZ4_VERSION_[MR]")
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
index aba9b9d966..eddfdaaf77 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
@@ -1,4 +1,4 @@
-From 0a3222338efc108c831fbdd719a47d35f4b0adcd Mon Sep 17 00:00:00 2001
+From f9f019049a9bb09471e8303d4510afae07f225c8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Aug 2021 06:49:25 +0000
 Subject: [PATCH] aio_linux: Check if syscall exists before using it
@@ -10,19 +10,17 @@ tpool/aio_linux.cc:63:20: error: '__NR_io_getevents' was not declared in this sc
       |                    ^~~~~~~~~~~~~~~~~
       |                    io_getevents
 
-Upstream-Staus: Pending
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
  tpool/aio_linux.cc | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/tpool/aio_linux.cc b/tpool/aio_linux.cc
-index 4abc213..da75411 100644
+index 507c6b92..a6adf1af 100644
 --- a/tpool/aio_linux.cc
 +++ b/tpool/aio_linux.cc
-@@ -58,6 +58,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
+@@ -59,6 +59,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
  */
  static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
  {
@@ -30,7 +28,7 @@ index 4abc213..da75411 100644
    int saved_errno= errno;
    int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
                     min_nr, nr, ev, 0);
-@@ -67,6 +68,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
+@@ -68,6 +69,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
      errno= saved_errno;
    }
    return ret;
@@ -40,6 +38,3 @@ index 4abc213..da75411 100644
  }
  
  
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
index 0a2eed44f4..bfcd45b64b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
@@ -1,4 +1,4 @@
-From d611f78198dee64bb6a05933d200b544e2510b76 Mon Sep 17 00:00:00 2001
+From 3a29c2f7afe10bf0bc0529b5d9ea44866946ac5a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 14 Nov 2020 14:37:13 -0800
 Subject: [PATCH] innobase: Define __NR_futex if it does not exist
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/storage/innobase/log/log0sync.cc b/storage/innobase/log/log0sync.cc
-index 7799e605..4fab8f74 100644
+index 0de283ca..265ab691 100644
 --- a/storage/innobase/log/log0sync.cc
 +++ b/storage/innobase/log/log0sync.cc
 @@ -66,6 +66,9 @@ Note that if write operation is very fast, a) or b) can be fine as alternative.
@@ -32,6 +32,3 @@ index 7799e605..4fab8f74 100644
  #endif
  
  #include <atomic>
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
index 456a2bad64..1475bb1a51 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
@@ -1,4 +1,4 @@
-From f92f657973997df30afdb0032c88ad3a14ead46b Mon Sep 17 00:00:00 2001
+From 360d41c1dd2d28d5102d66179095cedacaf5dc3a Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 23 Sep 2022 15:48:21 +0800
 Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
@@ -15,10 +15,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 22 insertions(+), 8 deletions(-)
 
 diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
-index 241b482..27a3991 100644
+index 0195555e..507136cb 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
-@@ -60,11 +60,18 @@ ${CMAKE_BINARY_DIR}/sql
+@@ -64,11 +64,18 @@ ${CMAKE_BINARY_DIR}/sql
  ${CMAKE_SOURCE_DIR}/tpool
  )
  
@@ -41,7 +41,7 @@ index 241b482..27a3991 100644
  
  FIND_PACKAGE(BISON 2.4)
  
-@@ -372,11 +379,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
+@@ -405,11 +412,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
    ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
  ENDIF()
  
@@ -64,6 +64,3 @@ index 241b482..27a3991 100644
  
  MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc)
  SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES COMPILE_FLAGS "-DTZINFO2SQL")
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch b/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
index ac94279585..2841a59a73 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
@@ -1,4 +1,4 @@
-From 24e2b0edc2612acefcc48414bb6f0aeb086061a9 Mon Sep 17 00:00:00 2001
+From c24181245bc502a384635d7f7f48f12863f84c2f Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Tue, 26 Feb 2019 23:57:06 -0800
 Subject: [PATCH] configure.cmake: fix valgrind
@@ -16,16 +16,15 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
 ---
  configure.cmake | 5 ++---
  1 file changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/configure.cmake b/configure.cmake
-index 3cfc4b31..d017b3b3 100644
+index 61f30a75..3e730082 100644
 --- a/configure.cmake
 +++ b/configure.cmake
-@@ -930,10 +930,9 @@ HAVE_GCC_C11_ATOMICS)
+@@ -881,10 +881,9 @@ ENDIF()
  
  IF(WITH_VALGRIND)
    SET(HAVE_valgrind 1)
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
index d0d6e3c730..dc34c07d31 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
@@ -1,4 +1,4 @@
-From 80be37351d995654f86b838f6b5ed47e8a90261b Mon Sep 17 00:00:00 2001
+From b6d8dbb7e930f5caa9e3e3c71706b0cf9eea7bb3 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 23 Sep 2022 12:05:17 +0800
 Subject: [PATCH] CMakeLists.txt: not include import_executables.cmake
@@ -14,10 +14,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f9e2b1b..34924ba 100644
+index 3828420c..ee38615a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -394,11 +394,6 @@ CHECK_LIBFMT()
+@@ -428,11 +428,6 @@ CHECK_LIBFMT()
  ADD_SUBDIRECTORY(tpool)
  CHECK_SYSTEMD()
  
@@ -29,6 +29,3 @@ index f9e2b1b..34924ba 100644
  #
  # Setup maintainer mode options. Platform checks are
  # not run with the warning options as to not perturb fragile checks
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
index 05b0cf8ff7..39b7fad983 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
@@ -1,4 +1,4 @@
-From f447aca534d1a12809eeb146e8220d305cc3884d Mon Sep 17 00:00:00 2001
+From af4247cd24eab2d728fb3592f6e125ef5290361b Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 9 Apr 2020 14:07:19 +0800
 Subject: [PATCH] build_rocksdb.cmake: fix atomic support on arm
@@ -16,10 +16,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/storage/rocksdb/build_rocksdb.cmake b/storage/rocksdb/build_rocksdb.cmake
-index d7895b0..3bcd52a 100644
+index e89dbfc0..acc6b48e 100644
 --- a/storage/rocksdb/build_rocksdb.cmake
 +++ b/storage/rocksdb/build_rocksdb.cmake
-@@ -470,6 +470,9 @@ list(APPEND SOURCES ${CMAKE_CURRENT_BINARY_DIR}/build_version.cc)
+@@ -490,6 +490,9 @@ list(APPEND SOURCES ${CMAKE_CURRENT_BINARY_DIR}/build_version.cc)
  
  ADD_CONVENIENCE_LIBRARY(rocksdblib ${SOURCES})
  target_link_libraries(rocksdblib ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
@@ -29,6 +29,3 @@ index d7895b0..3bcd52a 100644
  IF(CMAKE_CXX_COMPILER_ID MATCHES "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    set_target_properties(rocksdblib PROPERTIES COMPILE_FLAGS "-fPIC -fno-builtin-memcmp -Wno-error")
  endif()
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch b/meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch
index 7a685a6521..d53eb99e4c 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch
@@ -1,5 +1,15 @@
+From 24667f728fabe141a92d4de828ab24d9fe953b08 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 25 Dec 2022 19:23:17 -0800
+Subject: [PATCH] mariadb: Alias lseek64/open64/ftruncate64 on musl systems
+
 Upstream-Status: Pending
+---
+ storage/connect/os.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
+diff --git a/storage/connect/os.h b/storage/connect/os.h
+index 7d0d5cab..10da630f 100644
 --- a/storage/connect/os.h
 +++ b/storage/connect/os.h
 @@ -2,13 +2,15 @@
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
index 6aa6c84882..a590a3fa36 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
@@ -1,5 +1,15 @@
+From 76e4c3e8d001eaaabd0fb34c136b81b82830c420 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Jun 2021 22:48:07 -0700
+Subject: [PATCH] mariadb: Fix build with clang/musl
+
 Upstream-Status: Pending
+---
+ storage/rocksdb/rocksdb/port/jemalloc_helper.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/storage/rocksdb/rocksdb/port/jemalloc_helper.h b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
+index f6f72f8c..b9657cf3 100644
 --- a/storage/rocksdb/rocksdb/port/jemalloc_helper.h
 +++ b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
 @@ -5,7 +5,7 @@
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ssize_t.patch b/meta-oe/recipes-dbs/mysql/mariadb/ssize_t.patch
index 4e499d4137..819b65f041 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/ssize_t.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/ssize_t.patch
@@ -1,7 +1,16 @@
-ssize_t comes from sys/types.h therefore include it
+From cfa843c91a036d0926c76c6dec6fd2a1f38e4843 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 31 May 2021 21:55:00 -0700
+Subject: [PATCH] ssize_t comes from sys/types.h therefore include it
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ wsrep-lib/include/wsrep/gtid.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wsrep-lib/include/wsrep/gtid.hpp b/wsrep-lib/include/wsrep/gtid.hpp
+index 0d49c58d..d61a6585 100644
 --- a/wsrep-lib/include/wsrep/gtid.hpp
 +++ b/wsrep-lib/include/wsrep/gtid.hpp
 @@ -25,7 +25,7 @@
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
index 233d9e6af6..30c9e2452a 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
@@ -1,4 +1,4 @@
-From 4ac5b555d058d4d489f25a3806a787b7b2465d09 Mon Sep 17 00:00:00 2001
+From 34713c3bba68cb94b373b750c1c8fcc0b04b2c45 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 27 Feb 2019 22:41:26 -0800
 Subject: [PATCH] support-files/CMakeLists.txt: fix do_populate_sysroot issue
@@ -10,16 +10,15 @@ ERROR: mariadb-native-10.3.13-r0 do_populate_sysroot: sstate found an absolute p
 Upstream-Status: Inappropriate [oe build specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
 ---
  support-files/CMakeLists.txt | 7 -------
  1 file changed, 7 deletions(-)
 
 diff --git a/support-files/CMakeLists.txt b/support-files/CMakeLists.txt
-index b5767432..56733de1 100644
+index ee1d420e..a99c0605 100644
 --- a/support-files/CMakeLists.txt
 +++ b/support-files/CMakeLists.txt
-@@ -165,12 +165,5 @@ IF(UNIX)
+@@ -245,12 +245,5 @@ IF(UNIX AND NOT WITHOUT_SERVER)
        INSTALL(FILES rpm/enable_encryption.preset DESTINATION ${INSTALL_SYSCONF2DIR}
                COMPONENT IniFiles)
      ENDIF()
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch b/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
index 3244ab8da2..3840472213 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
@@ -1,14 +1,22 @@
-Use SYS_futex for syscall
+From 166811dfcfc61e7646275aa993d7d7f4b02d1f49 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Apr 2021 12:40:14 -0700
+Subject: [PATCH] Use SYS_futex for syscall
 
 glibc defines SYS_futex and on newer 32bit CPUs like RISCV-32, arc there
 is no 32bit time_t therefore define SYS_futex in terms of SYS_futex_time64
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ storage/innobase/sync/srw_lock.cc | 6 ++++++
+ 1 file changed, 6 insertions(+)
 
+diff --git a/storage/innobase/sync/srw_lock.cc b/storage/innobase/sync/srw_lock.cc
+index 28b586de..3ee71142 100644
 --- a/storage/innobase/sync/srw_lock.cc
 +++ b/storage/innobase/sync/srw_lock.cc
-@@ -210,6 +210,12 @@ void ssux_lock_low::wake() { WakeByAddre
+@@ -226,6 +226,12 @@ void ssux_lock_impl<spinloop>::wake() noexcept { WakeByAddressSingle(&readers);
  #  ifdef __linux__
  #   include <linux/futex.h>
  #   include <sys/syscall.h>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.10.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.10.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb

