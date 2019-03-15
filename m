Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF6360557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 09:50:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2F9o7uf017272
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Mar 2019 02:50:07 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 15 Mar 2019 02:50:06 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Fri, 15 Mar 2019 02:50:06 -0700
Message-ID: <20190315095006.29889-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: fix atomic support on arm
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
X-List-Received-Date: Fri, 15 Mar 2019 09:50:07 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Check to link with libatomic to enable C11
atomics support to fix below build error on arm:
| /build/tmp/work/armv5e-wrs-linux-gnueabi/mariadb/10.3.13-r0/recipe-sysroot-native/usr/bin/arm-wrs-linux-gnueabi/../../libexec/arm-wrs-linux-gnueabi/gcc/arm-wrs-linux-gnueabi/8.3.0/ld.bfd: librocksdblib.a(env_posix.cc.o): in function `std::__atomic_base<unsigned long long>::store(unsigned long long, std::memory_order)':
| /usr/include/c++/8.3.0/bits/atomic_base.h:374: undefined reference to `__atomic_store_8'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  2 +-
 .../mysql/mariadb/fix-arm-atomic.patch        | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 00a9d668c..fca74d448 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -17,6 +17,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BPN}-${PV}/source/${BPN}
            file://0001-disable-ucontext-on-musl.patch \
            file://c11_atomics.patch \
            file://clang_version_header_conflict.patch \
+           file://fix-arm-atomic.patch \
           "
 SRC_URI[md5sum] = "603ce42e35b9a688f2cca05275acb5cb"
 SRC_URI[sha256sum] = "b2aa857ef5b84f85a7ea60a1eac7b34c0ca5151c71a0d44ce2d7fb028d71459a"
@@ -63,7 +64,6 @@ PACKAGECONFIG[setupdb] = ", ,,${PN}-setupdb"
 # https://mariadb.atlassian.net/browse/MDEV-5982
 TARGET_CFLAGS += "-fuse-ld=bfd"
 LDFLAGS += " -pthread"
-LDFLAGS_append_armv5 = " -latomic"
 BUILD_CFLAGS += "-fuse-ld=bfd"
 BUILD_CXXFLAGS += "-fuse-ld=bfd"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
new file mode 100644
index 000000000..34d31148b
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
@@ -0,0 +1,34 @@
+From ffaaf4d43ebf2ef6d0229a60f407c1f5a06e5c53 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 15 Mar 2019 01:46:05 -0700
+Subject: [PATCH] build_rocksdb.cmake: fix atomic support on arm
+
+Check to link with libatomic to enable C11 atomics support
+to fix below build error on arm:
+| /build/tmp/work/armv5e-wrs-linux-gnueabi/mariadb/10.3.13-r0/recipe-sysroot-native/usr/bin/arm-wrs-linux-gnueabi/../../libexec/arm-wrs-linux-gnueabi/gcc/arm-wrs-linux-gnueabi/8.3.0/ld.bfd: librocksdblib.a(env_posix.cc.o): in function `std::__atomic_base<unsigned long long>::store(unsigned long long, std::memory_order)':
+| /usr/include/c++/8.3.0/bits/atomic_base.h:374: undefined reference to `__atomic_store_8'
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ storage/rocksdb/build_rocksdb.cmake | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/storage/rocksdb/build_rocksdb.cmake b/storage/rocksdb/build_rocksdb.cmake
+index c36c761..2b539ff 100644
+--- a/storage/rocksdb/build_rocksdb.cmake
++++ b/storage/rocksdb/build_rocksdb.cmake
+@@ -424,6 +424,9 @@ list(APPEND SOURCES ${CMAKE_CURRENT_BINARY_DIR}/build_version.cc)
+ 
+ ADD_CONVENIENCE_LIBRARY(rocksdblib ${SOURCES})
+ target_link_libraries(rocksdblib ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
++IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
++  TARGET_LINK_LIBRARIES(rocksdblib atomic)
++ENDIF()
+ IF(CMAKE_CXX_COMPILER_ID MATCHES "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
+   set_target_properties(rocksdblib PROPERTIES COMPILE_FLAGS "-fPIC -fno-builtin-memcmp -frtti")
+ endif()
+-- 
+2.17.1
+
-- 
2.17.1


