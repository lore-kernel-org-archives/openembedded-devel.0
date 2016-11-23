Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6D8D771AA9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:47 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e9so668863pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rv8HNXp6AUPyBJfbyNrWhBM/Vu7GiOo1IpaB2gwNxUM=;
	b=LcMk/LTteh4Jz7pfFH2gQykyCzuVPNerRiFEPnbXKL12osDqUjVI1aBZEefyj95BEY
	Cwg/HnSZRzEEKZu9IfpFMgeUzp3cEhmGO/Gia5S8PyK2zLYbGanlCSoV2e49OyJWx66k
	45av138B1UOKkInBYoeaI2ZNtY+bdY9IgVso0gvHQp2K0TsqOaVh2Teaaw+g/1/O3uYa
	lOOaGOQe61OQ+K3rAog0yTmubJyqfjk2Q5ir2tKhm8SeH7KloZ3n/LjVnC91hsOShbrH
	qb1MpkoY7tDo7gzwRekuoJMAGkN4qDS5FNKKoCHkyInXOSQx5gF8QyPbWMJ7iS8RzRYZ
	dn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rv8HNXp6AUPyBJfbyNrWhBM/Vu7GiOo1IpaB2gwNxUM=;
	b=T9L1FsRbdAvxANrzyGsUijSoE9spw0F3sFod5zJX95el10ECnIjJogqizijGsD28Wl
	WYYswLu/YRuaxGzGbUqwY1ZRZ8TIXukTGWx4cxjL90VicAU8MJMrf9K8zbCicgpjUYpp
	97fz9ED9ACkP5eiNa9UU+Ik99mmjZTjsXBcYG+U5wfKsw1ROh1rBYkFRGTOj+6j5waYd
	cw8mWIs7G264jlMMds5mJMub6RQePzINFO62SLoBPfl9UfZDY6azx9SmopJt9RK4jAom
	stlf570LtJ0jeci/MpNlrPaDKOidhgwhFrq87YzolpFH7v0IudWT1ZQ4+VpZA4nBgOj0
	j5rA==
X-Gm-Message-State: AKaTC03HwtZWWmsBIF60YXCH9kG0YFkcSg084FwSnTIrk58MN0O7OZZ3XUjSZYRVvBGibQ==
X-Received: by 10.84.210.233 with SMTP id a96mr4618554pli.72.1479892968870;
	Wed, 23 Nov 2016 01:22:48 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:22:01 -0800
Message-Id: <20161123092209.23699-41-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 41/49] jsonrpc: Add recipe
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ce-hardcoded-lib-CMAKE_LIBRARY_PATH-with-.patch | 77 ++++++++++++++++++++++
 ...torclient-Typecast-min-arguments-correctl.patch | 33 ++++++++++
 ...torserver-Include-sys-select.h-before-oth.patch | 34 ++++++++++
 meta-oe/recipes-devtools/jsonrpc/jsonrpc_0.7.0.bb  | 30 +++++++++
 4 files changed, 174 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-replace-hardcoded-lib-CMAKE_LIBRARY_PATH-with-.patch
 create mode 100644 meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorclient-Typecast-min-arguments-correctl.patch
 create mode 100644 meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorserver-Include-sys-select.h-before-oth.patch
 create mode 100644 meta-oe/recipes-devtools/jsonrpc/jsonrpc_0.7.0.bb

diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-replace-hardcoded-lib-CMAKE_LIBRARY_PATH-with-.patch b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-replace-hardcoded-lib-CMAKE_LIBRARY_PATH-with-.patch
new file mode 100644
index 0000000..748e4da
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-replace-hardcoded-lib-CMAKE_LIBRARY_PATH-with-.patch
@@ -0,0 +1,77 @@
+From ac61124df17ab76527508bbb9a3115d4d6cc1af6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 21 Nov 2016 11:26:26 -0800
+Subject: [PATCH] cmake: replace hardcoded lib/${CMAKE_LIBRARY_PATH} with
+ {CMAKE_INSTALL_LIBDIR}
+
+Fixes
+| CMake Error at src/jsonrpccpp/CMakeLists.txt:207 (install):
+|   install TARGETS given unknown argument "/lib".
+
+and
+
+Wrong install paths during cross compile
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/jsonrpccpp/CMakeLists.txt    | 8 ++++----
+ src/stubgenerator/CMakeLists.txt | 6 +++---
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/jsonrpccpp/CMakeLists.txt b/src/jsonrpccpp/CMakeLists.txt
+index e4a1eb5..13f9056 100644
+--- a/src/jsonrpccpp/CMakeLists.txt
++++ b/src/jsonrpccpp/CMakeLists.txt
+@@ -205,15 +205,15 @@ if (WIN32)
+ endif()
+ 
+ install(TARGETS ${ALL_LIBS}
+-	LIBRARY DESTINATION lib${LIB_SUFFIX}/${CMAKE_LIBRARY_PATH}
+-	ARCHIVE DESTINATION lib${LIB_SUFFIX}/${CMAKE_LIBRARY_PATH}
++	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++	ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+ 	RUNTIME DESTINATION bin
+ )
+ 
+ #set pkg-config
+ get_filename_component(FULL_PATH_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX} ABSOLUTE)
+ set(FULL_PATH_INCLUDEDIR "${FULL_PATH_INSTALL_PREFIX}/include")
+-set(FULL_PATH_LIBDIR "${FULL_PATH_INSTALL_PREFIX}/lib/${CMAKE_LIBRARY_PATH}")
++set(FULL_PATH_LIBDIR "${FULL_PATH_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}")
+ 
+ CONFIGURE_FILE(${PROJECT_SOURCE_DIR}/cmake/libjsonrpccpp-client.pc.cmake ${CMAKE_BINARY_DIR}/libjsonrpccpp-client.pc)
+ CONFIGURE_FILE(${PROJECT_SOURCE_DIR}/cmake/libjsonrpccpp-server.pc.cmake ${CMAKE_BINARY_DIR}/libjsonrpccpp-server.pc)
+@@ -223,6 +223,6 @@ INSTALL(FILES
+     "${CMAKE_BINARY_DIR}/libjsonrpccpp-server.pc"
+     "${CMAKE_BINARY_DIR}/libjsonrpccpp-client.pc"
+     "${CMAKE_BINARY_DIR}/libjsonrpccpp-common.pc"
+-    DESTINATION "lib${LIB_SUFFIX}/${CMAKE_LIBRARY_PATH}/pkgconfig")
++    DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
+ 
+ 
+diff --git a/src/stubgenerator/CMakeLists.txt b/src/stubgenerator/CMakeLists.txt
+index f9dbe4c..b57b0fe 100644
+--- a/src/stubgenerator/CMakeLists.txt
++++ b/src/stubgenerator/CMakeLists.txt
+@@ -58,15 +58,15 @@ CONFIGURE_FILE(${CMAKE_SOURCE_DIR}/cmake/libjsonrpccpp-stub.pc.cmake ${CMAKE_BIN
+ 
+ INSTALL(FILES
+     "${CMAKE_BINARY_DIR}/libjsonrpccpp-stub.pc"
+-    DESTINATION "lib/${CMAKE_LIBRARY_PATH}/pkgconfig")
++    DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
+ 
+ install(DIRECTORY ${CMAKE_SOURCE_DIR}/src/stubgenerator/
+         DESTINATION include/jsonrpccpp/stubgen
+         FILES_MATCHING PATTERN "*.h")
+ 
+ install(TARGETS ${ALL_LIBS} jsonrpcstub
+-        LIBRARY DESTINATION lib${LIB_SUFFIX}/${CMAKE_LIBRARY_PATH}
+-        ARCHIVE DESTINATION lib${LIB_SUFFIX}/${CMAKE_LIBRARY_PATH}
++        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+         RUNTIME DESTINATION bin
+ )
+ 
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorclient-Typecast-min-arguments-correctl.patch b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorclient-Typecast-min-arguments-correctl.patch
new file mode 100644
index 0000000..d21e979
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorclient-Typecast-min-arguments-correctl.patch
@@ -0,0 +1,33 @@
+From 9500f12f5d827840634311d6ca972d9551211e4d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 21 Nov 2016 01:00:51 -0800
+Subject: [PATCH] filedescriptorclient: Typecast min() arguments correctly
+
+Fixes
+
+| /mnt/a/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/jsonrpc/0.7.0-r0/git/src/jsonrpccp
+p/client/connectors/filedescriptorclient.cpp:47:92: note:   deduced conflicting types for parameter 'co
+nst _Tp' ('unsigned int' and 'long unsigned int')
+|      ssize_t byteWritten = write(outputfd, toSend.c_str(), min(toSend.size(), MAX_WRITE_SIZE));
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/jsonrpccpp/client/connectors/filedescriptorclient.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/jsonrpccpp/client/connectors/filedescriptorclient.cpp b/src/jsonrpccpp/client/connectors/filedescriptorclient.cpp
+index 77aac7e..6325b5c 100644
+--- a/src/jsonrpccpp/client/connectors/filedescriptorclient.cpp
++++ b/src/jsonrpccpp/client/connectors/filedescriptorclient.cpp
+@@ -43,7 +43,7 @@ void FileDescriptorClient::SendRPCMessage(const std::string& message,
+   string toSend = message;
+   do
+   {
+-    ssize_t byteWritten = write(outputfd, toSend.c_str(), min(toSend.size(), MAX_WRITE_SIZE));
++    ssize_t byteWritten = write(outputfd, toSend.c_str(), min((long unsigned int)toSend.size(), MAX_WRITE_SIZE));
+     if (byteWritten < 1)
+       throw JsonRpcException(Errors::ERROR_CLIENT_CONNECTOR,
+         "Unknown error occured while writing to the output file descriptor");
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorserver-Include-sys-select.h-before-oth.patch b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorserver-Include-sys-select.h-before-oth.patch
new file mode 100644
index 0000000..3b9068a
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-filedescriptorserver-Include-sys-select.h-before-oth.patch
@@ -0,0 +1,34 @@
+From c7aad10628949e126f50e3264b5bc7eb417347c6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 21 Nov 2016 01:25:10 -0800
+Subject: [PATCH] filedescriptorserver: Include sys/select.h before other
+ headers
+
+Fixes errors e.g.
+| /mnt/a/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/jsonrpc/0.7.0-r0/git/src/jsonrpccp
+p/server/connectors/filedescriptorserver.h:63:7: error: unknown type name 'fd_set'
+|       fd_set read_fds;
+|       ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/jsonrpccpp/server/connectors/filedescriptorserver.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/jsonrpccpp/server/connectors/filedescriptorserver.cpp b/src/jsonrpccpp/server/connectors/filedescriptorserver.cpp
+index 9d74223..8e019ca 100644
+--- a/src/jsonrpccpp/server/connectors/filedescriptorserver.cpp
++++ b/src/jsonrpccpp/server/connectors/filedescriptorserver.cpp
+@@ -7,8 +7,8 @@
+  * @license See attached LICENSE.txt
+  ************************************************************************/
+ 
+-#include "filedescriptorserver.h"
+ #include <sys/select.h>
++#include "filedescriptorserver.h"
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_0.7.0.bb b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_0.7.0.bb
new file mode 100644
index 0000000..3a43f90
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_0.7.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "C++ framework for json-rpc 1.0 and 2.0"
+DESCRIPTION = "JsonRpc-Cpp is an OpenSource implementation of JSON-RPC \
+               protocol in C++. JSON-RPC is a lightweight remote procedure \
+               call protocol similar to XML-RPC."
+HOMEPAGE = "https://github.com/cinemast/libjson-rpc-cpp"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee72d601854d5d2a065cf642883c489b"
+
+PV = "0.7.0+git${SRCPV}"
+
+SRC_URI = "git://github.com/cinemast/libjson-rpc-cpp \
+           file://0001-cmake-replace-hardcoded-lib-CMAKE_LIBRARY_PATH-with-.patch \
+           file://0001-filedescriptorclient-Typecast-min-arguments-correctl.patch \
+           file://0001-filedescriptorserver-Include-sys-select.h-before-oth.patch \
+"
+SRCREV = "ccbdb41388bdd929828941652da816bf52a0580e"
+
+SECTION = "libs"
+
+DEPENDS = "curl jsoncpp libmicrohttpd"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DCOMPILE_TESTS=NO -DCOMPILE_STUBGEN=NO -DCOMPILE_EXAMPLES=NO \
+                  -DBUILD_SHARED_LIBS=YES -DBUILD_STATIC_LIBS=YES \
+                  -DCMAKE_LIBRARY_PATH=${libdir} \
+"
-- 
2.10.2


