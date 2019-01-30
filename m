Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id B51167C187
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 05:29:24 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z10so9848743pgp.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 21:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tNrrdJjOsktW7ZSPbA+XPYORPtF+wP/VTpTN4lOjOE0=;
	b=WgZtoXplCeAW17DPTsil0Elp939DnCOjbaFgPxLoRdcA7Io5Y+CdO/lymiDDxWgqq9
	eEOeyDdxSY1mPp27hKJWOr63EXv6KMYBYMYu0P5kDX/rocsRSPmUWe4NhhDHVpkHNcS3
	By/o0rxySYrHxdYtshFvXV26HYbFnSZoywFUg6yOQVmcA0FR5GvQ51Jlg3SY4BZGhQqy
	t9eYvH1aigR6sbQngjKiJTlm/ye33vcHEiW7ZumnbjNuVuSQMqYL40z2XB/fGP0zaHqw
	P5fmcEfImfQ+OXbU8xjOGD2UQp8PZCLGdrzm9jtqKikynJBMDMNFK6Qnz/umOoARc2zc
	VgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tNrrdJjOsktW7ZSPbA+XPYORPtF+wP/VTpTN4lOjOE0=;
	b=IjkgyHIi6LpLr8pqkqTvCU2lselXERo3Q2G/Kg6Tr8DvHkaheAe9evEOeFZNEngAfY
	mjaQKVVMrYPEAHVs4+YdqiZ2jHUBcMhhH68gW/iFg8Po4w3L46l0zo13VwQM3HdmMXGy
	suvcFfZQuZgim9n9Ba/EJopXX2vaCcO+cfOAEAE/TV92NXWQj/BIH5AfLM9uPGWfLhyf
	KnXPiCRH8RzY81+oy/0CRw0uuyHDT+j701MQ2krzleEsdIUMn5pFKUQam6QnZhpzKhx9
	bqQg7K0FTlmmLClB3n01YQVYZWays4QHANq7quT1K/On5oc4SpENQZTaudmfn5IjzEAo
	5hWA==
X-Gm-Message-State: AJcUukdu7d6k9ErYYceRdw5GGD+LBonUVGwu6tXk4HdD+IGWu19sYGEG
	PI3f8uyUXfD8g/7snWa/XoQ+RAWa6MM=
X-Google-Smtp-Source: ALg8bN42ELiMmtqWRLuHKq6nlSq42PDP/lL9jebxnnKrgvhAaavtzQ8hBtidgzu4Q6/3EAO+IlFjvw==
X-Received: by 2002:a62:c101:: with SMTP id i1mr29091355pfg.80.1548826165134; 
	Tue, 29 Jan 2019 21:29:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	v190sm652633pfv.26.2019.01.29.21.29.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 21:29:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2019 21:29:08 -0800
Message-Id: <20190130052911.36336-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130052911.36336-1-raj.khem@gmail.com>
References: <20190130052911.36336-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/8] jsonrpc: Update to 1.1.1
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
X-List-Received-Date: Wed, 30 Jan 2019 05:29:24 -0000
Content-Transfer-Encoding: 8bit

License-Updare: Change in copyright headers
https://github.com/cinemast/libjson-rpc-cpp/commit/ba3507a24bd07e89641ecbc7e567c01a754c8d73#diff-61e0bdf7e1b43c5c93d9488b22e04170

Drop all patches since these issues are already fixed in new version
add new dependency on hiredis

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rdcoded-lib-CMAKE_LIBRARY_PATH-with-.patch | 77 -------------------
 ...ient-Typecast-min-arguments-correctl.patch | 33 --------
 ...rver-Include-sys-select.h-before-oth.patch | 34 --------
 ...and-family-needs-to-include-string.h.patch | 26 -------
 .../0002-Fix-build-problem-on-Mac.patch       | 27 -------
 .../{jsonrpc_0.7.0.bb => jsonrpc_git.bb}      | 20 ++---
 6 files changed, 8 insertions(+), 209 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-replace-hardcoded-lib-CMAKE_LIBRARY_PATH-with-.patch
 delete mode 100644 meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorclient-Typecast-min-arguments-correctl.patch
 delete mode 100644 meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorserver-Include-sys-select.h-before-oth.patch
 delete mode 100644 meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-memset-and-family-needs-to-include-string.h.patch
 delete mode 100644 meta-oe/recipes-devtools/jsonrpc/jsonrpc/0002-Fix-build-problem-on-Mac.patch
 rename meta-oe/recipes-devtools/jsonrpc/{jsonrpc_0.7.0.bb => jsonrpc_git.bb} (53%)

diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-replace-hardcoded-lib-CMAKE_LIBRARY_PATH-with-.patch b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-replace-hardcoded-lib-CMAKE_LIBRARY_PATH-with-.patch
deleted file mode 100644
index 748e4da1a6..0000000000
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-replace-hardcoded-lib-CMAKE_LIBRARY_PATH-with-.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From ac61124df17ab76527508bbb9a3115d4d6cc1af6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 21 Nov 2016 11:26:26 -0800
-Subject: [PATCH] cmake: replace hardcoded lib/${CMAKE_LIBRARY_PATH} with
- {CMAKE_INSTALL_LIBDIR}
-
-Fixes
-| CMake Error at src/jsonrpccpp/CMakeLists.txt:207 (install):
-|   install TARGETS given unknown argument "/lib".
-
-and
-
-Wrong install paths during cross compile
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/jsonrpccpp/CMakeLists.txt    | 8 ++++----
- src/stubgenerator/CMakeLists.txt | 6 +++---
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/jsonrpccpp/CMakeLists.txt b/src/jsonrpccpp/CMakeLists.txt
-index e4a1eb5..13f9056 100644
---- a/src/jsonrpccpp/CMakeLists.txt
-+++ b/src/jsonrpccpp/CMakeLists.txt
-@@ -205,15 +205,15 @@ if (WIN32)
- endif()
- 
- install(TARGETS ${ALL_LIBS}
--	LIBRARY DESTINATION lib${LIB_SUFFIX}/${CMAKE_LIBRARY_PATH}
--	ARCHIVE DESTINATION lib${LIB_SUFFIX}/${CMAKE_LIBRARY_PATH}
-+	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+	ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
- 	RUNTIME DESTINATION bin
- )
- 
- #set pkg-config
- get_filename_component(FULL_PATH_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX} ABSOLUTE)
- set(FULL_PATH_INCLUDEDIR "${FULL_PATH_INSTALL_PREFIX}/include")
--set(FULL_PATH_LIBDIR "${FULL_PATH_INSTALL_PREFIX}/lib/${CMAKE_LIBRARY_PATH}")
-+set(FULL_PATH_LIBDIR "${FULL_PATH_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}")
- 
- CONFIGURE_FILE(${PROJECT_SOURCE_DIR}/cmake/libjsonrpccpp-client.pc.cmake ${CMAKE_BINARY_DIR}/libjsonrpccpp-client.pc)
- CONFIGURE_FILE(${PROJECT_SOURCE_DIR}/cmake/libjsonrpccpp-server.pc.cmake ${CMAKE_BINARY_DIR}/libjsonrpccpp-server.pc)
-@@ -223,6 +223,6 @@ INSTALL(FILES
-     "${CMAKE_BINARY_DIR}/libjsonrpccpp-server.pc"
-     "${CMAKE_BINARY_DIR}/libjsonrpccpp-client.pc"
-     "${CMAKE_BINARY_DIR}/libjsonrpccpp-common.pc"
--    DESTINATION "lib${LIB_SUFFIX}/${CMAKE_LIBRARY_PATH}/pkgconfig")
-+    DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
- 
- 
-diff --git a/src/stubgenerator/CMakeLists.txt b/src/stubgenerator/CMakeLists.txt
-index f9dbe4c..b57b0fe 100644
---- a/src/stubgenerator/CMakeLists.txt
-+++ b/src/stubgenerator/CMakeLists.txt
-@@ -58,15 +58,15 @@ CONFIGURE_FILE(${CMAKE_SOURCE_DIR}/cmake/libjsonrpccpp-stub.pc.cmake ${CMAKE_BIN
- 
- INSTALL(FILES
-     "${CMAKE_BINARY_DIR}/libjsonrpccpp-stub.pc"
--    DESTINATION "lib/${CMAKE_LIBRARY_PATH}/pkgconfig")
-+    DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
- 
- install(DIRECTORY ${CMAKE_SOURCE_DIR}/src/stubgenerator/
-         DESTINATION include/jsonrpccpp/stubgen
-         FILES_MATCHING PATTERN "*.h")
- 
- install(TARGETS ${ALL_LIBS} jsonrpcstub
--        LIBRARY DESTINATION lib${LIB_SUFFIX}/${CMAKE_LIBRARY_PATH}
--        ARCHIVE DESTINATION lib${LIB_SUFFIX}/${CMAKE_LIBRARY_PATH}
-+        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-         RUNTIME DESTINATION bin
- )
- 
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorclient-Typecast-min-arguments-correctl.patch b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorclient-Typecast-min-arguments-correctl.patch
deleted file mode 100644
index d21e97950c..0000000000
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorclient-Typecast-min-arguments-correctl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9500f12f5d827840634311d6ca972d9551211e4d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 21 Nov 2016 01:00:51 -0800
-Subject: [PATCH] filedescriptorclient: Typecast min() arguments correctly
-
-Fixes
-
-| /mnt/a/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/jsonrpc/0.7.0-r0/git/src/jsonrpccp
-p/client/connectors/filedescriptorclient.cpp:47:92: note:   deduced conflicting types for parameter 'co
-nst _Tp' ('unsigned int' and 'long unsigned int')
-|      ssize_t byteWritten = write(outputfd, toSend.c_str(), min(toSend.size(), MAX_WRITE_SIZE));
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/jsonrpccpp/client/connectors/filedescriptorclient.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/jsonrpccpp/client/connectors/filedescriptorclient.cpp b/src/jsonrpccpp/client/connectors/filedescriptorclient.cpp
-index 77aac7e..6325b5c 100644
---- a/src/jsonrpccpp/client/connectors/filedescriptorclient.cpp
-+++ b/src/jsonrpccpp/client/connectors/filedescriptorclient.cpp
-@@ -43,7 +43,7 @@ void FileDescriptorClient::SendRPCMessage(const std::string& message,
-   string toSend = message;
-   do
-   {
--    ssize_t byteWritten = write(outputfd, toSend.c_str(), min(toSend.size(), MAX_WRITE_SIZE));
-+    ssize_t byteWritten = write(outputfd, toSend.c_str(), min((long unsigned int)toSend.size(), MAX_WRITE_SIZE));
-     if (byteWritten < 1)
-       throw JsonRpcException(Errors::ERROR_CLIENT_CONNECTOR,
-         "Unknown error occured while writing to the output file descriptor");
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorserver-Include-sys-select.h-before-oth.patch b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorserver-Include-sys-select.h-before-oth.patch
deleted file mode 100644
index 3b9068a7d8..0000000000
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorserver-Include-sys-select.h-before-oth.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c7aad10628949e126f50e3264b5bc7eb417347c6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 21 Nov 2016 01:25:10 -0800
-Subject: [PATCH] filedescriptorserver: Include sys/select.h before other
- headers
-
-Fixes errors e.g.
-| /mnt/a/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/jsonrpc/0.7.0-r0/git/src/jsonrpccp
-p/server/connectors/filedescriptorserver.h:63:7: error: unknown type name 'fd_set'
-|       fd_set read_fds;
-|       ^
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/jsonrpccpp/server/connectors/filedescriptorserver.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/jsonrpccpp/server/connectors/filedescriptorserver.cpp b/src/jsonrpccpp/server/connectors/filedescriptorserver.cpp
-index 9d74223..8e019ca 100644
---- a/src/jsonrpccpp/server/connectors/filedescriptorserver.cpp
-+++ b/src/jsonrpccpp/server/connectors/filedescriptorserver.cpp
-@@ -7,8 +7,8 @@
-  * @license See attached LICENSE.txt
-  ************************************************************************/
- 
--#include "filedescriptorserver.h"
- #include <sys/select.h>
-+#include "filedescriptorserver.h"
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <unistd.h>
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-memset-and-family-needs-to-include-string.h.patch b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-memset-and-family-needs-to-include-string.h.patch
deleted file mode 100644
index 21ef98bf5a..0000000000
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-memset-and-family-needs-to-include-string.h.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From f5416f1c2b2989f94163a2ae4b91c9b9fa13c620 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 31 Mar 2017 13:32:31 -0700
-Subject: [PATCH 1/2] memset() and family needs to include string.h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/jsonrpccpp/server/connectors/unixdomainsocketserver.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/jsonrpccpp/server/connectors/unixdomainsocketserver.cpp b/src/jsonrpccpp/server/connectors/unixdomainsocketserver.cpp
-index 9fca57b..e63c49e 100644
---- a/src/jsonrpccpp/server/connectors/unixdomainsocketserver.cpp
-+++ b/src/jsonrpccpp/server/connectors/unixdomainsocketserver.cpp
-@@ -16,7 +16,7 @@
- #include <cstdio>
- #include <fcntl.h>
- #include <unistd.h>
--#include <string>
-+#include <cstring>
- 
- using namespace jsonrpc;
- using namespace std;
--- 
-2.12.1
-
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0002-Fix-build-problem-on-Mac.patch b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0002-Fix-build-problem-on-Mac.patch
deleted file mode 100644
index aece45b020..0000000000
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0002-Fix-build-problem-on-Mac.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 79050ef9607f242e0d509969b19e9390220c3411 Mon Sep 17 00:00:00 2001
-From: Yongwei Wu <wuyongwei@gmail.com>
-Date: Sat, 31 Dec 2016 11:57:11 +0800
-Subject: [PATCH 2/2] Fix build problem on Mac.
-
-__suseconds_t is not defined on Mac/BSD; use the POSIX-conformant
-suseconds_t.
----
- src/jsonrpccpp/server/connectors/filedescriptorserver.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/jsonrpccpp/server/connectors/filedescriptorserver.cpp b/src/jsonrpccpp/server/connectors/filedescriptorserver.cpp
-index 8e019ca..68107f2 100644
---- a/src/jsonrpccpp/server/connectors/filedescriptorserver.cpp
-+++ b/src/jsonrpccpp/server/connectors/filedescriptorserver.cpp
-@@ -122,7 +122,7 @@ int FileDescriptorServer::WaitForRead() {
-   FD_ZERO(&except_fds);
-   FD_SET(inputfd, &read_fds);
-   timeout.tv_sec = 0;
--  timeout.tv_usec = (__suseconds_t) (READ_TIMEOUT * 1000000);
-+  timeout.tv_usec = (suseconds_t) (READ_TIMEOUT * 1000000);
-   // Wait for something to read
-   return select(inputfd + 1, &read_fds, &write_fds, &except_fds, &timeout);
- }
--- 
-2.12.1
-
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_0.7.0.bb b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_git.bb
similarity index 53%
rename from meta-oe/recipes-devtools/jsonrpc/jsonrpc_0.7.0.bb
rename to meta-oe/recipes-devtools/jsonrpc/jsonrpc_git.bb
index eb1ff65b63..aea11b0828 100644
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_0.7.0.bb
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_git.bb
@@ -5,22 +5,16 @@ DESCRIPTION = "JsonRpc-Cpp is an OpenSource implementation of JSON-RPC \
 HOMEPAGE = "https://github.com/cinemast/libjson-rpc-cpp"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee72d601854d5d2a065cf642883c489b"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4e728c5b36018f6c383b4b9efd9c8840"
+SECTION = "libs"
+DEPENDS = "curl jsoncpp libmicrohttpd hiredis"
 
-PV = "0.7.0+git${SRCPV}"
+PV = "1.1.1+git${SRCPV}"
+# v1.1.1
+SRCREV = "319783c635cf8cabcc1a980495c99a88f9ebbd97"
 
 SRC_URI = "git://github.com/cinemast/libjson-rpc-cpp \
-           file://0001-cmake-replace-hardcoded-lib-CMAKE_LIBRARY_PATH-with-.patch \
-           file://0001-filedescriptorclient-Typecast-min-arguments-correctl.patch \
-           file://0001-filedescriptorserver-Include-sys-select.h-before-oth.patch \
-           file://0001-memset-and-family-needs-to-include-string.h.patch \
-           file://0002-Fix-build-problem-on-Mac.patch \
            "
-SRCREV = "ccbdb41388bdd929828941652da816bf52a0580e"
-
-SECTION = "libs"
-
-DEPENDS = "curl jsoncpp libmicrohttpd"
 
 S = "${WORKDIR}/git"
 
@@ -30,3 +24,5 @@ EXTRA_OECMAKE += "-DCOMPILE_TESTS=NO -DCOMPILE_STUBGEN=NO -DCOMPILE_EXAMPLES=NO
                   -DBUILD_SHARED_LIBS=YES -DBUILD_STATIC_LIBS=YES \
                   -DCMAKE_LIBRARY_PATH=${libdir} \
 "
+
+FILES_${PN}-dev += "${libdir}/libjson-rpc-cpp/cmake"
-- 
2.20.1


