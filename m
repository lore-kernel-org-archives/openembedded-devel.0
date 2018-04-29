Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3724971DD2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 18:02:17 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x12so8936640wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 11:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W+xlSUrTvLuYwSYts9qwap0J/pEeMoIUTydW7+Zx2vk=;
	b=hMgSETFPtooe/rmbQEgWJXwOuqXQ3+KbRrEccEsT0xHH55Qv5q0SDreCG9SYRSLjNj
	XSFBDIXecTUzppCoZgYN++T89kGZecX951V59AOFeanYHlcNNtGTBbOOUfe70ZbxETav
	zUeKjij7qOZJzDsU8AsGKHC0dDHydMe3r27HQ69aZ3vOVAxwxmwnAwuXXCGgIAprIovd
	hNqIiyFv2iBcIiyeeX+/Bul7nGeL1WnyRieOCVQ9n/LXjh140nTRpN9UdP1FBRYbMXS0
	JhNQQAuuLlRi7nysTBsBCFhM+b3OAD8QGY3DKC8j6z+ekk3a+0Zzn2B+J2VzJ89LWiL1
	eubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=W+xlSUrTvLuYwSYts9qwap0J/pEeMoIUTydW7+Zx2vk=;
	b=N+8fFfylVgZM+MOQpPgvIAZ0BOEEjhdegfr4cBnqqM/Sji7FU17vvDXWWm15Xvhh1+
	AaWtva2zJxXKlMBYG5YXirxrXbf17d8caxNzW/KJ8NTQetykDBf/6eW4LWREJKV8KT03
	FNNcvFkU529VoXs/fGLHvZ7vdlcQFIfvoW0f+w11dNZD3+fvnxg5sb+1Rrnh3VFaO/q7
	qwCFRPc/XgppqBmVFW2TBGyH2IAyIZGigDEPzZ7k2MrIdw5A+Y4R62yF2cd4ftjxQsfG
	8cSNMqffcNWa+O8AnLFNfX/i3PyGpXEXNjTcZkNqP+Y1NAWtY1KoQCTmdoXb5eAil8vy
	nd7g==
X-Gm-Message-State: ALQs6tAqsA47hJlWjgbDy0zvVcXoPd/nSdf1sn1pzflhVV280PMqsYO/
	6KwoZ90Tx4c6xMRpjr01vgDzTA==
X-Google-Smtp-Source: AB8JxZrSJF2CbrP2esYLUq3uSTJzADevIOQ2Y39btTthmFpuRyDQx346cZtGjMyReZxSGfKJ303kHw==
X-Received: by 10.28.3.197 with SMTP id 188mr5379886wmd.43.1525024938219;
	Sun, 29 Apr 2018 11:02:18 -0700 (PDT)
Received: from localhost.localdomain ([2.43.123.17])
	by smtp.gmail.com with ESMTPSA id
	u196sm5638653wmf.30.2018.04.29.11.02.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 11:02:17 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Apr 2018 20:02:06 +0200
Message-Id: <20180429180206.12683-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180429180206.12683-1-costamagnagianfranco@yahoo.it>
References: <20180429180206.12683-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [meta-networking][PATCH 2/2] cpprest: add new recipe based on Debian packaging
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
X-List-Received-Date: Sun, 29 Apr 2018 18:02:18 -0000

From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>

The patches were imported from the Debian repository
(https://salsa.debian.org/debian/casablanca) as of commit id 5b58637016a569a5d54714bd151a800028f77532

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Co-developed-by: Cristiano Prato <cristiano.prato@cnhind.com>
---
 .../cpprest/cpprest-2.10.2/fix-cmake-install.patch | 59 ++++++++++++++++++++++
 .../recipes-support/cpprest/cpprest_2.10.2.bb      | 17 +++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta-networking/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
 create mode 100644 meta-networking/recipes-support/cpprest/cpprest_2.10.2.bb

diff --git a/meta-networking/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch b/meta-networking/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
new file mode 100644
index 000000000..56fd704ad
--- /dev/null
+++ b/meta-networking/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
@@ -0,0 +1,59 @@
+Description: install cmake files into /usr/lib/cmake/cpprestsdk
+Author: Gianfranco Costamagna <locutusofborg@debian.org>
+Upstream-Status: https://github.com/Microsoft/cpprestsdk/pull/737
+Forwarded: https://github.com/Microsoft/cpprestsdk/pull/737
+Last-Update: 2018-04-19
+
+Index: cpprest/CMakeLists.txt
+===================================================================
+--- cpprest.orig/CMakeLists.txt
++++ cpprest/CMakeLists.txt
+@@ -18,7 +18,6 @@
+ set(WERROR ON CACHE BOOL "Treat Warnings as Errors.")
+ set(CPPREST_EXCLUDE_WEBSOCKETS OFF CACHE BOOL "Exclude websockets functionality.")
+ set(CPPREST_EXCLUDE_COMPRESSION OFF CACHE BOOL "Exclude compression functionality.")
+-set(CPPREST_EXPORT_DIR lib/cpprestsdk CACHE STRING "Directory to install CMake config files.")
+ set(CPPREST_INSTALL_HEADERS ON CACHE BOOL "Install header files.")
+ set(CPPREST_INSTALL ON CACHE BOOL "Add install commands.")
+ 
+@@ -63,6 +62,9 @@
+ include(cmake/cpprest_find_openssl.cmake)
+ include(cmake/cpprest_find_websocketpp.cmake)
+ include(CheckIncludeFiles)
++if(UNIX)
++include(GNUInstallDirs)
++endif(UNIX)
+ 
+ find_package(Threads REQUIRED)
+ if(THREADS_HAVE_PTHREAD_ARG)
+Index: cpprest/src/CMakeLists.txt
+===================================================================
+--- cpprest.orig/src/CMakeLists.txt
++++ cpprest/src/CMakeLists.txt
+@@ -250,21 +250,21 @@
+   install(
+     TARGETS ${CPPREST_TARGETS}
+     EXPORT cpprestsdk-targets
+-    RUNTIME DESTINATION bin
+-    LIBRARY DESTINATION lib
+-    ARCHIVE DESTINATION lib
++    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
++    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+   )
+ 
+   configure_file(../cmake/cpprestsdk-config.in.cmake "${CMAKE_CURRENT_BINARY_DIR}/cpprestsdk-config.cmake" @ONLY)
+ 
+   install(
+     FILES "${CMAKE_CURRENT_BINARY_DIR}/cpprestsdk-config.cmake"
+-    DESTINATION ${CPPREST_EXPORT_DIR}
++    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
+   )
+   install(
+     EXPORT cpprestsdk-targets
+     FILE cpprestsdk-targets.cmake
+     NAMESPACE cpprestsdk::
+-    DESTINATION ${CPPREST_EXPORT_DIR}
++    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
+   )
+ endif()
diff --git a/meta-networking/recipes-support/cpprest/cpprest_2.10.2.bb b/meta-networking/recipes-support/cpprest/cpprest_2.10.2.bb
new file mode 100644
index 000000000..2ba6fc66c
--- /dev/null
+++ b/meta-networking/recipes-support/cpprest/cpprest_2.10.2.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
+SECTION = "libs/network"
+HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${S}/../license.txt;md5=a2e15b954769218ff912468eecd6a02f"
+DEPENDS = "openssl websocketpp zlib boost"
+
+SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master"
+
+SRC_URI += "file://fix-cmake-install.patch"
+
+# tag 2.10.2
+SRCREV= "fea848e2a77563cf2a6f28f8eab396fd6e787fbf"
+
+S = "${WORKDIR}/git/Release"
+
+inherit cmake
-- 
2.14.1


