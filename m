Received: from david.siemens.de (david.siemens.de [192.35.17.14])
 by mx.groups.io with SMTP id smtpd.web11.6573.1602573953326209972
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 00:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.14, mailfrom: pascal.bach@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09D7Po3A024002
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 09:25:51 +0200
Received: from md2m476c.bach.lan ([167.87.72.135])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 09D7PoeY018530;
	Tue, 13 Oct 2020 09:25:50 +0200
From: "Pascal Bach" <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pascal Bach <pascal.bach@siemens.com>
Subject: [meta-oe][PATCH] rocksdb: 6.6.4 -> 6.11.4
Date: Tue, 13 Oct 2020 09:21:46 +0200
Message-Id: <20201013072146.600295-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Thread patch was fixed upstream
- CMake atomic patch is still pending but was refreshed
- Additional patch for proper bz2 support in CMake added.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...1-cmake-Add-check-for-atomic-support.patch | 23 ++++++----
 ...01-cmake-Use-exported-target-for-bz2.patch | 43 +++++++++++++++++++
 ...-db-write_thread.cc-Initialize-state.patch | 31 -------------
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb    |  9 ++--
 4 files changed, 63 insertions(+), 43 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-db-write_thread.cc-Initialize-state.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
index 9bfb1f31d..eb9928a0c 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Add-check-for-atomic-support.patch
@@ -1,4 +1,4 @@
-From ba0a0e54d9544babbd3963891f4e3200dd5583f5 Mon Sep 17 00:00:00 2001
+From cf168ae0b7bceab8432d096719b331f18428fe39 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2020 15:10:37 -0700
 Subject: [PATCH] cmake: Add check for atomic support
@@ -20,27 +20,31 @@ Fixes
 Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/6555]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- CMakeLists.txt                  |  6 +++
+ CMakeLists.txt                  |  5 +++
  cmake/modules/CheckAtomic.cmake | 69 +++++++++++++++++++++++++++++++++
- 2 files changed, 75 insertions(+)
+ 2 files changed, 74 insertions(+)
  create mode 100644 cmake/modules/CheckAtomic.cmake
 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f9c8f3346..4d604004b 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -780,7 +780,13 @@ if(WIN32)
+@@ -852,7 +852,12 @@ endif()
+ if(WIN32)
    set(SYSTEM_LIBS ${SYSTEM_LIBS} shlwapi.lib rpcrt4.lib)
-   set(LIBS ${ROCKSDB_STATIC_LIB} ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
  else()
 +  # check if linking against libatomic is necessary
 +  include(CheckAtomic)
-+
    set(SYSTEM_LIBS ${CMAKE_THREAD_LIBS_INIT})
 +  if(HAVE_CXX_ATOMIC_WITH_LIB OR HAVE_CXX_ATOMICS64_WITH_LIB)
 +    set(SYSTEM_LIBS ${SYSTEM_LIBS} atomic)
 +  endif()
-   set(LIBS ${ROCKSDB_SHARED_LIB} ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
+ endif()
  
-   add_library(${ROCKSDB_SHARED_LIB} SHARED ${SOURCES})
+ add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES})
+diff --git a/cmake/modules/CheckAtomic.cmake b/cmake/modules/CheckAtomic.cmake
+new file mode 100644
+index 000000000..8b7dc8a37
 --- /dev/null
 +++ b/cmake/modules/CheckAtomic.cmake
 @@ -0,0 +1,69 @@
@@ -113,3 +117,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +  endif()
 +endif()
 +
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
new file mode 100644
index 000000000..57433b057
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-cmake-Use-exported-target-for-bz2.patch
@@ -0,0 +1,43 @@
+From 46a4e585175cac8d76bd0b64f0fc27c9e22f04a1 Mon Sep 17 00:00:00 2001
+From: Pascal Bach <pascal.bach@nextrem.ch>
+Date: Mon, 12 Oct 2020 21:22:46 +0200
+Subject: [PATCH] cmake: Use exported target for bz2
+
+Without this change, CMake puts the entire path into the generated file.
+This is not portable and makes it fail in environment like Yocto.
+
+Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/7541]
+---
+ CMakeLists.txt | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 676192913..801586c30 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -32,7 +32,7 @@
+ # 3. cmake ..
+ # 4. make -j
+ 
+-cmake_minimum_required(VERSION 3.5.1)
++cmake_minimum_required(VERSION 3.7.2)
+ 
+ list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake/modules/")
+ include(ReadVersion)
+@@ -148,12 +148,7 @@ else()
+   if(WITH_BZ2)
+     find_package(BZip2 REQUIRED)
+     add_definitions(-DBZIP2)
+-    if(BZIP2_INCLUDE_DIRS)
+-      include_directories(${BZIP2_INCLUDE_DIRS})
+-    else()
+-      include_directories(${BZIP2_INCLUDE_DIR})
+-    endif()
+-    list(APPEND THIRDPARTY_LIBS ${BZIP2_LIBRARIES})
++    list(APPEND THIRDPARTY_LIBS BZip2::BZip2)
+   endif()
+ 
+   if(WITH_LZ4)
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-db-write_thread.cc-Initialize-state.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-db-write_thread.cc-Initialize-state.patch
deleted file mode 100644
index 97ddbce59..000000000
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-db-write_thread.cc-Initialize-state.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 49dcd22dcf1aae5995c42eac0fda68516fc1cd43 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 19 Jun 2019 17:57:24 +0800
-Subject: [PATCH] db/write_thread.cc: Initialize state
-
-Fixed an error when compiled without -O2:
-db/write_thread.cc:183:14: error: 'state' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- db/write_thread.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/db/write_thread.cc b/db/write_thread.cc
-index 835992c..6f99a11 100644
---- a/db/write_thread.cc
-+++ b/db/write_thread.cc
-@@ -59,7 +59,7 @@ uint8_t WriteThread::BlockingAwaitState(Writer* w, uint8_t goal_mask) {
- 
- uint8_t WriteThread::AwaitState(Writer* w, uint8_t goal_mask,
-                                 AdaptationContext* ctx) {
--  uint8_t state;
-+  uint8_t state = 0;
- 
-   // 1. Busy loop using "pause" for 1 micro sec
-   // 2. Else SOMETIMES busy loop using "yield" for 100 micro sec (default)
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index b9038df81..7ebc5ab1d 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "551a110918493a19d11243f53408b97485de1411"
-SRCBRANCH = "6.6.fb"
-PV = "6.6.4"
+SRCREV = "48bfca38f6f175435052a59791922a1a453d9609"
+SRCBRANCH = "6.11.fb"
+PV = "6.11.4"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
-           file://0001-db-write_thread.cc-Initialize-state.patch \
            file://0001-cmake-Add-check-for-atomic-support.patch \
+           file://0001-cmake-Use-exported-target-for-bz2.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -31,6 +31,7 @@ PACKAGECONFIG[gflags] = "-DWITH_GFLAGS=ON,-DWITH_GFLAGS=OFF,gflags"
 EXTRA_OECMAKE = "\
     -DPORTABLE=ON \
     -DWITH_TESTS=OFF \
+    -DWITH_BENCHMARK_TOOLS=OFF \
     -DWITH_TOOLS=OFF \
     -DFAIL_ON_WARNINGS=OFF \
 "
-- 
2.28.0

