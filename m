Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5843.1794230683146439248
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:24:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ritwemZ7;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so10110915e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 05:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794230681; x=1794835481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDdjs5LCgBTt5ObcHwGuur1gIe2ldMuxtLm9epXcZR8=;
        b=ritwemZ7EBh5bje39cDjYFo3DWMnf0fYICOMSkzpovt2NN0yo5L/Kllpkuv0S21aPB
         QH6sMvTcLbhJZCVaAlbEJokCleiRTb3631ezWZL6InMCwxm28tLjcKdNsaPmLxYcU2Mt
         mpsKCtEr/mAEiRb99jedho9YP6tkmJgQAUoMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230681; x=1794835481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDdjs5LCgBTt5ObcHwGuur1gIe2ldMuxtLm9epXcZR8=;
        b=u8YnhyhDCg5YtZHfFbg0tFWEi8lrN6WYgsOEH8vspdz8peMvBchDvCpG1yqB8b7YsL
         9d1RGjzPX8mSgtOGx63fBP+14s2Lk4cMZKrpCuRp9PhG+zTDN04P1fnn8f2Ic7mK4obL
         sqRk1mmlRJNOfFhnGUPV6j1qxPqEotBs8kkIItKrVPAnxxbOpTOQDIaVyHtCCn7Gbfxe
         8ysAjD1MGZiXPbZrS3tGjGGcFFwyN/O0DCT/m3VHAffPXN2SVebTNtx1iLSAnfgnYWAC
         lT53y3c355azyL52MB53zksC/mm492COZkW7mG/4aCXUFFMQ+p8Wb2u8Fl0mXmLMEzhn
         cD4Q==
X-Gm-Message-State: APuU4Z+h/81sA3Cje/2Ph7yNnacPLFeEgC981IsglH1REevsejuktTcE
	HdpM4+fl1lr0bwIsQgjr4Rh7orGcZ6xsWC167aa0U9vNz0oW5HsSPCBRU/xBZcTe1xdOjt78MPo
	WAR/h
X-Gm-Gg: AYBFou2uaj6km+inzkGCXm7SR6o3/YkevIgQCk9E/D2/cvuyenaUiGQMu/VZoja74jQ
	lQhjtftXzoG3GThJFbFKJ4MW+3SWP6A6al+wmLIL/0qkkML7+7YGeul1Vr188Da3A6vSgCvouUS
	gElxvfL6IqqV/AJp+TgqkeDAsN1DZZfdfZ9G5zLOZzSfSL+A7/2nrfUBf44liAqb8R81dam4wGh
	I6nv1aDhtGlwV4vjwBGw4P+sjf6GnN8h+rJzzHbq+HWTMuLURdaxDsvY7QxoUQoyHdJx3Hw2qyD
	qFQF8h+lspKu74vkjyPcgdh6IvU0y3XSCPIzsbnuMQNrh+30TdErO+2Vuou6SatwNoZoqD9ac9o
	C6Cd1CnztxbZO99MjHCiq0EoPusK4a0KB/Hlc1ymyvz81HnZ8yaCd5h4Cz5ZjnMVGl63+YG2RQU
	jJK7PHQlwuEycabpaQrnp/GUQODsRn6WjLMuw8P8gBwE2O5wnMHZH7vcLT72lQvDuedv2nmriDi
	lL/XEbinTw5ShLO9xSzidr7H6xBTBegPIn2WvyEVV09loD3feXkqtyRYZb3GcUcBIqjNwvPNz7A
	yVeAq4mPWDCqyj/6lX1yHSWB4n1U7MUidDTLyHUI0m7Es8zp7Pe4RWO1BpwgZvh36+TBAZr2Obd
	H6WsYuKk/p/WcPBtzJKcES4E1BmxRORhaZ8R6PfXaXR/AvVy9I2Rqmw==
X-Received: by 2002:a05:600c:4f89:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4b963c97d7cmr81610225e9.26.1794230680982;
        Mon, 09 Nov 2026 05:24:40 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959765218asm10422750f8f.42.2026.11.09.05.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:24:40 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] rocksdb: Upgrade 11.1.2 -> 11.13.2
Date: Mon,  9 Nov 2026 15:24:37 +0200
Message-ID: <20261109132437.668417-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 13:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132061
Content-Type: text/plain; charset="utf-8"

Upgrade to release 11.13.2:

- Fixed a secondary instance with open_files_async = true getting
  stuck after TryCatchUpWithPrimary() returned PathNotFound for a
  table file that the primary deleted before the background opener
  reached it.
- Fixed blob direct write with more than one concurrent flush of a
  column family: a later flush sealed and published the blob files
  of the oldest pending memtable instead of its own, so flushes
  failed with Corruption: VersionBuilder: Blob file #N already
  added and the database stopped.

Change the the SRC_URI from https://github.com/facebook the new
Meta organization in GitHub: https://github.com/meta

Remove the following patches:

1. 0001-CMakeLists.txt-Make-the-test-discovery-occur-on-targ.patch

Because the change has been applied with commit 6d8370e:
https://github.com/meta/rocksdb/commit/6d8370ec56256c9f70daed364cdba9d1edabd417

2. 0001-checkpoint.h-Add-missing-includes-cstdint.patch

Because the change has been applied with commit 0a2ba2a:
https://github.com/meta/rocksdb/commit/0a2ba2a16441c1edd2a3d520e7d574e7ce78dbb2

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ake-the-test-discovery-occur-on-targ.patch | 42 ----------------
 ...point.h-Add-missing-includes-cstdint.patch | 49 -------------------
 .../{rocksdb_11.1.2.bb => rocksdb_11.13.2.bb} |  8 ++-
 3 files changed, 3 insertions(+), 96 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-CMakeLists.txt-Make-the-test-discovery-occur-on-targ.patch
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-checkpoint.h-Add-missing-includes-cstdint.patch
 rename meta-oe/recipes-dbs/rocksdb/{rocksdb_11.1.2.bb => rocksdb_11.13.2.bb} (91%)

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-CMakeLists.txt-Make-the-test-discovery-occur-on-targ.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-CMakeLists.txt-Make-the-test-discovery-occur-on-targ.patch
deleted file mode 100644
index b0a949fe31..0000000000
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-CMakeLists.txt-Make-the-test-discovery-occur-on-targ.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9abf6cd09c60f0be9a85c055dfdf43698f057f73 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 25 Sep 2024 13:47:37 +0800
-Subject: [PATCH] CMakeLists.txt: Make the test discovery occur on target
-
-Set DISCOVERY_MODE to PRE_TEST to delay test discovery until just
-prior to test execution on the target to fix the build failure as
-the default POST_BUILD behavior is not desirable in cross-compiling
-env.
-
-/build/tmp/work/core2-64-wrs-linux/rocksdb/9.0.0/build/env_basic_test: error while loading shared libraries: libgflags.so.2.2: cannot open shared object file: No such file or directory
-CMake Error at /build/tmp/work/core2-64-wrs-linux/rocksdb/9.0.0/recipe-sysroot-native/usr/share/cmake-3.30/Modules/GoogleTestAddTests.cmake:112 (message):
-  Error running test executable.
-
-    Path: '/build/tmp/work/core2-64-wrs-linux/rocksdb/9.0.0/build/env_basic_test'
-    Working directory: '/build/tmp/work/core2-64-wrs-linux/rocksdb/9.0.0/build'
-    Result: 127
-    Output:
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 403ad1243..f34397798 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1502,7 +1502,7 @@ if(WITH_TESTS)
-       )
-       target_link_libraries(${exename}${ARTIFACT_SUFFIX} testutillib${ARTIFACT_SUFFIX} testharness gtest ${THIRDPARTY_LIBS} ${ROCKSDB_LIB})
-       if(NOT "${exename}" MATCHES "db_sanity_test")
--        gtest_discover_tests(${exename} DISCOVERY_TIMEOUT 120)
-+        gtest_discover_tests(${exename} DISCOVERY_TIMEOUT 120 DISCOVERY_MODE PRE_TEST)
-         add_dependencies(rocksdb_check ${exename}${ARTIFACT_SUFFIX})
-       endif()
-   endforeach(sourcefile ${TESTS})
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-checkpoint.h-Add-missing-includes-cstdint.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-checkpoint.h-Add-missing-includes-cstdint.patch
deleted file mode 100644
index 9950be4c90..0000000000
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-checkpoint.h-Add-missing-includes-cstdint.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 31012cdfa435d9203da3c3de8127b66bf018692a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 24 Jan 2023 21:40:43 -0800
-Subject: [PATCH] checkpoint.h: Add missing includes <cstdint>
-
-It uses uint64_t and it comes from <cstdint>
-This is needed with GCC 13 and newer [1]
-
-[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-* build error:
-FAILED: CMakeFiles/checkpoint_test.dir/utilities/checkpoint/checkpoint_test.cc.o 
-In file included from rocksdb/9.10.0/git/utilities/checkpoint/checkpoint_test.cc:11:
-rocksdb/9.10.0/git/include/rocksdb/utilities/checkpoint.h:49:35: error: 'uint64_t' has not been declared
-   49 |                                   uint64_t log_size_for_flush = 0,
-      |                                   ^~~~~~~~
-rocksdb/9.10.0/git/include/rocksdb/utilities/checkpoint.h:14:1: note: 'uint64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
-   13 | #include "rocksdb/status.h"
-  +++ |+#include <cstdint>
-   14 | 
-
-Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/11137]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- include/rocksdb/utilities/checkpoint.h | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/include/rocksdb/utilities/checkpoint.h
-+++ b/include/rocksdb/utilities/checkpoint.h
-@@ -7,6 +7,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
---- a/include/rocksdb/utilities/transaction_db_mutex.h
-+++ b/include/rocksdb/utilities/transaction_db_mutex.h
-@@ -5,6 +5,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <memory>
- 
- #include "rocksdb/status.h"
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_11.1.2.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_11.13.2.bb
similarity index 91%
rename from meta-oe/recipes-dbs/rocksdb/rocksdb_11.1.2.bb
rename to meta-oe/recipes-dbs/rocksdb/rocksdb_11.13.2.bb
index 3bc90d1e5e..d315a01edc 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_11.1.2.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_11.13.2.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "3b446089141659fad25328c5ea3e7ed283df46e4"
-SRCBRANCH = "11.1.fb"
+SRCREV = "17b624b5c0d41bd42db5cf88aa867f3b26eaf1fa"
+SRCBRANCH = "11.13.fb"
 
-SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=https;tag=v${PV} \
+SRC_URI = "git://github.com/meta/${BPN}.git;branch=${SRCBRANCH};protocol=https;tag=v${PV} \
            file://0001-cmake-Add-check-for-atomic-support.patch \
            file://0002-cmake-Use-exported-target-for-bz2.patch \
            file://0003-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch \
@@ -18,10 +18,8 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=htt
            file://0006-Implement-timer-for-arm-v6.patch \
            file://0007-Fix-declaration-scope-of-LE_LOAD32-in-crc32c.patch \
            file://static_library_as_option.patch \
-           file://0001-CMakeLists.txt-Make-the-test-discovery-occur-on-targ.patch \
            file://run-ptest \
            file://0001-Fix-build-error-with-gcc-13-by-adding-cstdint-header.patch \
-           file://0001-checkpoint.h-Add-missing-includes-cstdint.patch \
            file://0001-Findzstd.cmake-support-pkg-config-based-zstd-detecti.patch \
           "
 
-- 
2.47.3

