Return-Path: <dev@codyps.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id E709177029
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 20:51:47 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id s71so9008208oih.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2016 13:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=+7bjgCkExbzVNP/wMfnXDLUukPWNB2/O3q8nGuFyCZ4=;
	b=Yn0xY/Eq0ZWvF2SSVptL0HQsUD4KozIcTYt77qmYUbPQCnHf/+nEcQyVjK1sGf0IdG
	BC6Es4dplYOQxZ5K5ba34ITpzxtSRk96t1kb1QhNm0Nw2RcpQOeZI40KPrisXewlBcfs
	740jh4/vFuTG+7NG1eXpVPhUQ5Cq1dzri/vGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+7bjgCkExbzVNP/wMfnXDLUukPWNB2/O3q8nGuFyCZ4=;
	b=IO3/aF7CGx0JArgZ/Yu1B810GG0zCLNGOy/a3E4EnCF0LcbF9Tbonh8kEHEv6y7dRb
	YijW+KKZHFqGfCBfwAZ08Us4qcOeRd9Gn0LcS+LxtdemPfr8fi5J5qC+RmhhopLwzsGA
	XO3HoXIaNnBb2qwU6LMuoLGbsz4wsOyqP1fJ9XAkiJ1TcSwN5Swgfxa6tYQaTvSlE7TM
	x17HVjH1WA/FG7y9cE465PgaiH1/dXEmyHScof4Z5+DT89/2VvH/7Ha3N15zDlMb2KJf
	fVepR3QXs53+Wvb29dIT2D9ObMK8MfHrr5LIwqXiiaSR1DqLB+7uHEEWJRi8o2Z6jW7m
	/Z4g==
X-Gm-Message-State: AE9vXwNNDw6qFdx1QCrIqSfOjLP8tGdsjWuq3i8xEE1xIrIi7jxa9o6xnN7SWR9gHVK+Yg==
X-Received: by 10.157.12.100 with SMTP id 91mr7025461otr.12.1473454307691;
	Fri, 09 Sep 2016 13:51:47 -0700 (PDT)
Received: from localhost (static-96-237-165-28.bstnma.fios.verizon.net.
	[96.237.165.28])
	by smtp.gmail.com with ESMTPSA id 194sm2444812itu.4.2016.09.09.13.51.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Sep 2016 13:51:47 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2016 16:51:42 -0400
Message-Id: <20160909205142.23429-1-dev@codyps.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-oe][PATCH][now-with-changes] meta-oe/thrift: fix build on gcc-6
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
X-List-Received-Date: Fri, 09 Sep 2016 20:51:49 -0000

thrift build issues on gcc-6 were essentially 2 issues:

 - gcc-6 has stricter overflow checking on array declaration, and
   thrift was using `char` when it should have used `signed char`
 - gcc-6 is really picky about it's include paths (`-I`), and thrift
   had a bad habbit of passing internal ones when it was cross compiled
   due to how it was using `include_directories()`

This adds 2 patches (both variations of those submitted upstream, the
ones included here are rebased onto thrift-0.9.3).

	https://issues.apache.org/jira/browse/THRIFT-3831
	https://issues.apache.org/jira/browse/THRIFT-3828

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 ...-In-cmake-avoid-use-of-both-quoted-paths-.patch | 110 +++++++++++++++++++++
 ...31-in-test-cpp-explicitly-use-signed-char.patch |  40 ++++++++
 .../recipes-connectivity/thrift/thrift_0.9.3.bb    |   5 +-
 3 files changed, 152 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch
new file mode 100644
index 0000000..7cc8d17
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch
@@ -0,0 +1,110 @@
+From bc577820ad25795543b31f123e309cdaebc7d6c6 Mon Sep 17 00:00:00 2001
+From: Cody P Schafer <dev@codyps.com>
+Date: Mon, 16 May 2016 15:21:10 -0400
+Subject: [PATCH 1/2] THRIFT-3828 In cmake avoid use of both quoted paths and
+ SYSTEM with include_directories()
+
+This allows us to avoid issues where there are no paths to be added to
+the include path (include_directories() errors when given an empty
+string).
+
+Specifically, gcc-6 requires that libraries stop passing paths like
+'/usr/include' (or they will get libstdc++ build errors), so these paths
+will be empty more often in the future.
+---
+ lib/cpp/CMakeLists.txt      | 8 ++++----
+ lib/cpp/test/CMakeLists.txt | 2 +-
+ test/cpp/CMakeLists.txt     | 6 +++---
+ tutorial/cpp/CMakeLists.txt | 2 +-
+ 4 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/lib/cpp/CMakeLists.txt b/lib/cpp/CMakeLists.txt
+index 4c7caeb..a716ac3 100755
+--- a/lib/cpp/CMakeLists.txt
++++ b/lib/cpp/CMakeLists.txt
+@@ -24,7 +24,7 @@ else()
+   find_package(Boost 1.53.0 REQUIRED)
+ endif()
+ 
+-include_directories(SYSTEM "${Boost_INCLUDE_DIRS}")
++include_directories(${Boost_INCLUDE_DIRS})
+ include_directories(src)
+ 
+ # SYSLIBS contains libraries that need to be linked to all lib targets
+@@ -104,7 +104,7 @@ if(OPENSSL_FOUND AND WITH_OPENSSL)
+        src/thrift/transport/TSSLSocket.cpp
+        src/thrift/transport/TSSLServerSocket.cpp
+     )
+-    include_directories(SYSTEM "${OPENSSL_INCLUDE_DIR}")
++    include_directories(${OPENSSL_INCLUDE_DIR})
+     list(APPEND SYSLIBS "${OPENSSL_LIBRARIES}")
+ endif()
+ 
+@@ -162,7 +162,7 @@ TARGET_LINK_LIBRARIES_THRIFT(thrift ${SYSLIBS})
+ 
+ if(WITH_LIBEVENT)
+     find_package(Libevent REQUIRED)  # Libevent comes with CMake support form upstream
+-    include_directories(SYSTEM ${LIBEVENT_INCLUDE_DIRS})
++    include_directories(${LIBEVENT_INCLUDE_DIRS})
+ 
+     ADD_LIBRARY_THRIFT(thriftnb ${thriftcppnb_SOURCES})
+     TARGET_LINK_LIBRARIES_THRIFT(thriftnb ${SYSLIBS} ${LIBEVENT_LIBRARIES})
+@@ -171,7 +171,7 @@ endif()
+ 
+ if(WITH_ZLIB)
+     find_package(ZLIB REQUIRED)
+-    include_directories(SYSTEM ${ZLIB_INCLUDE_DIRS})
++    include_directories(${ZLIB_INCLUDE_DIRS})
+ 
+     ADD_LIBRARY_THRIFT(thriftz ${thriftcppz_SOURCES})
+     TARGET_LINK_LIBRARIES_THRIFT(thriftz ${SYSLIBS} ${ZLIB_LIBRARIES})
+diff --git a/lib/cpp/test/CMakeLists.txt b/lib/cpp/test/CMakeLists.txt
+index 5de9fc4..c956c38 100644
+--- a/lib/cpp/test/CMakeLists.txt
++++ b/lib/cpp/test/CMakeLists.txt
+@@ -20,7 +20,7 @@
+ # Find required packages
+ set(Boost_USE_STATIC_LIBS ON) # Force the use of static boost test framework
+ find_package(Boost 1.53.0 REQUIRED COMPONENTS chrono filesystem system thread unit_test_framework)
+-include_directories(SYSTEM "${Boost_INCLUDE_DIRS}")
++include_directories(${Boost_INCLUDE_DIRS})
+ 
+ #Make sure gen-cpp files can be included
+ include_directories("${CMAKE_CURRENT_BINARY_DIR}")
+diff --git a/test/cpp/CMakeLists.txt b/test/cpp/CMakeLists.txt
+index 2d75f2e..b1409de 100755
+--- a/test/cpp/CMakeLists.txt
++++ b/test/cpp/CMakeLists.txt
+@@ -22,13 +22,13 @@ include(ThriftMacros)
+ 
+ set(Boost_USE_STATIC_LIBS ON)
+ find_package(Boost 1.53.0 REQUIRED COMPONENTS program_options system filesystem)
+-include_directories(SYSTEM "${Boost_INCLUDE_DIRS}")
++include_directories(${Boost_INCLUDE_DIRS})
+ 
+ find_package(OpenSSL REQUIRED)
+-include_directories(SYSTEM "${OPENSSL_INCLUDE_DIR}")
++include_directories(${OPENSSL_INCLUDE_DIR})
+ 
+ find_package(Libevent REQUIRED)  # Libevent comes with CMake support from upstream
+-include_directories(SYSTEM ${LIBEVENT_INCLUDE_DIRS})
++include_directories(${LIBEVENT_INCLUDE_DIRS})
+ 
+ #Make sure gen-cpp files can be included
+ include_directories("${CMAKE_CURRENT_BINARY_DIR}")
+diff --git a/tutorial/cpp/CMakeLists.txt b/tutorial/cpp/CMakeLists.txt
+index 2b0c143..5ecae17 100644
+--- a/tutorial/cpp/CMakeLists.txt
++++ b/tutorial/cpp/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ #
+ 
+ find_package(Boost 1.53.0 REQUIRED)
+-include_directories(SYSTEM "${Boost_INCLUDE_DIRS}")
++include_directories(${Boost_INCLUDE_DIRS})
+ 
+ #Make sure gen-cpp files can be included
+ include_directories("${CMAKE_CURRENT_BINARY_DIR}")
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch
new file mode 100644
index 0000000..f13adbb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch
@@ -0,0 +1,40 @@
+From f6cad0580e5391c37af7f60adddb71bf1a403dc4 Mon Sep 17 00:00:00 2001
+From: Cody P Schafer <dev@codyps.com>
+Date: Fri, 9 Sep 2016 15:50:26 -0400
+Subject: [PATCH 2/2] THRIFT-3831 in test/cpp explicitly use `signed char`
+
+`char`'s signed-ness is implimentation dependent, and in the case where
+`char` was not signed, we previously recieved errors like
+
+    thrift/0.9.3-r0/git/test/cpp/src/TestClient.cpp:404:15: error: narrowing conversion of '-127' from 'int' to 'char' inside { } [-Wnarrowing]
+
+(This example from gcc-6 on arm)
+---
+ test/cpp/src/TestClient.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/test/cpp/src/TestClient.cpp b/test/cpp/src/TestClient.cpp
+index e709899..4a961f8 100644
+--- a/test/cpp/src/TestClient.cpp
++++ b/test/cpp/src/TestClient.cpp
+@@ -383,7 +383,7 @@ int main(int argc, char** argv) {
+      * BINARY TEST
+      */
+     printf("testBinary([-128..127]) = {");
+-    const char bin_data[256]
++    const signed char bin_data[256]
+         = {-128, -127, -126, -125, -124, -123, -122, -121, -120, -119, -118, -117, -116, -115, -114,
+            -113, -112, -111, -110, -109, -108, -107, -106, -105, -104, -103, -102, -101, -100, -99,
+            -98,  -97,  -96,  -95,  -94,  -93,  -92,  -91,  -90,  -89,  -88,  -87,  -86,  -85,  -84,
+@@ -404,7 +404,7 @@ int main(int argc, char** argv) {
+            127};
+     try {
+       string bin_result;
+-      testClient.testBinary(bin_result, string(bin_data, 256));
++      testClient.testBinary(bin_result, string(reinterpret_cast<const char *>(bin_data), 256));
+       if (bin_result.size() != 256) {
+         printf("}\n*** FAILED ***\n");
+         printf("invalid length: %lu\n", bin_result.size());
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
index ce0b492..fdea7f1 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
@@ -10,6 +10,8 @@ DEPENDS = "thrift-native boost python libevent flex-native bison-native \
 
 SRC_URI = "git://git-wip-us.apache.org/repos/asf/thrift.git;protocol=https \
            file://0001-Forcibly-disable-check-for-Qt5.patch \
+           file://0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch \
+           file://0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch \
 "
 SRCREV = "61b8a29b0704ccd81b520f2300f5d1bb261fea3e"
 S = "${WORKDIR}/git"
@@ -32,6 +34,3 @@ EXTRA_OECMAKE_class-nativesdk = "-DWITH_QT4=OFF -DWITH_QT5=OFF \
 do_install_append () {
     ln -sf thrift ${D}/${bindir}/thrift-compiler
 }
-
-# http://errors.yoctoproject.org/Errors/Details/68622/
-PNBLACKLIST[thrift] ?= "BROKEN: fails to build with gcc-6"
-- 
2.9.3


