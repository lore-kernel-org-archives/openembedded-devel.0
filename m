Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 456A27E64D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 15:32:45 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5BFWkqx021378
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 17:32:46 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.78.240])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x5BFWi8P021380;
	Tue, 11 Jun 2019 17:32:44 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id F2C3510D1262;
	Tue, 11 Jun 2019 17:32:43 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 17:32:39 +0200
Message-Id: <20190611153239.29835-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] rocksdb: 5.18.3 -> 6.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2019 15:32:46 -0000

Also add support for snappy and gflags as these are enabled by default
and recipes are available in meta-oe. They can still be disabled via
PACKAGECONFIG.

zstd is also added as an PACKAGECONFIG but currently the zstd recipe is not in
meta-oe so it stays disabled for the moment.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...01-CMake-has-stock-FindZLIB-in-upper-case.patch | 29 ++++++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb         | 11 +++++---
 2 files changed, 36 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper-case.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper-case.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper-case.patch
new file mode 100644
index 000000000..9682f8ad4
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper-case.patch
@@ -0,0 +1,29 @@
+From 38146a5d803a1fb9b10f011aa857872b6f20cd02 Mon Sep 17 00:00:00 2001
+From: Tongliang Liao <xkszltl@gmail.com>
+Date: Mon, 29 Apr 2019 03:51:51 -0700
+Subject: [PATCH] CMake has stock FindZLIB in upper case. More details in
+ https://cmake.org/cmake/help/v3.14/module/FindZLIB.html
+
+
+Upstream-Status: Backport https://github.com/facebook/rocksdb/pull/5261
+
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 40cdd26bb..355686566 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -92,7 +92,7 @@ else()
+   endif()
+
+   if(WITH_ZLIB)
+-    find_package(zlib REQUIRED)
++    find_package(ZLIB REQUIRED)
+     add_definitions(-DZLIB)
+     if(ZLIB_INCLUDE_DIRS)
+       # CMake 3
+--
+2.11.0
+
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 8d846197a..6320c10fa 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -6,11 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "641fae60f63619ed5d0c9d9e4c4ea5a0ffa3e253"
-SRCBRANCH = "5.18.fb"
-PV = "5.18.3"
+SRCREV = "628a7fd74b5611657106c57f724f1682b114684c"
+SRCBRANCH = "6.0.fb"
+PV = "6.0.2"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
+           file://0001-CMake-has-stock-FindZLIB-in-upper-case.patch \
            file://0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch \
            file://0001-utilities-Fix-build-failure-with-Werror-maybe-uninit.patch \
           "
@@ -19,11 +20,13 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-PACKAGECONFIG ??= "bzip2 zlib lz4"
+PACKAGECONFIG ??= "bzip2 zlib lz4 snappy gflags"
 PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON -DBZIP2_LIBRARIES:STRING=bz2,-DWITH_BZ2=OFF,bzip2"
 PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON -DLZ4_LIBRARIES:STRING=lz4,-DWITH_LZ4=OFF,lz4"
 PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON -DZLIB_LIBRARIES:STRING=z,-DWITH_ZLIB=OFF,zlib"
+PACKAGECONFIG[zstd] = "-DWITH_ZSTD=ON,-DWITH_ZSTD=OFF,zstd"
 PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
+PACKAGECONFIG[gflags] = "-DWITH_GFLAGS=ON,-DWITH_GFLAGS=OFF,gflags"
 
 # Tools and tests currently don't compile on armv5 so we disable them
 EXTRA_OECMAKE = "\
-- 
2.11.0


