Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id BAF70745BC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jun 2018 07:54:52 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id f1-v6so7425479plt.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jun 2018 00:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=T1VMAzSrgsYHN11EA3EDQsLfDBq0rFMl8hlCI4FFECw=;
	b=VFu2wgl9kFISJ8PYX+xrcAdTfdq/p7nfr7oun0tqy019eIlUH9XV2Ck0gYeE1x2mnB
	5kexOscOEkjxPBipREM77l5a4vBbtFUko+4jjAB9OCOW44PQhiUlfA8nyx7AtHJcQKHv
	l6yVjh3QNEsi1p0qDDBTDfCuOyhY8yqbwwydbVFEOxsV3eZGAu11gMeIvHcrFhg5jqz8
	HSpJAsmFzq3yOgpGxuZVsYwRs5tfCGwjm2TL0Au8vQ+MOeTdulT8VxwLtYkldwCJ+Ksx
	hZ0fpQNYm/UNtPwkQo1cX4CHa8akrqJcMVsVoYZXCLr4sYGCzur2uABigDggHKOFVFs5
	DYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T1VMAzSrgsYHN11EA3EDQsLfDBq0rFMl8hlCI4FFECw=;
	b=U6h/ZmrwZNC59A+PknZJ3niQvobJCr3i9PJ0nPr8t6QOUkQMiwcZetjFtO7KdlHMKW
	lEGY4p6CJ3zjK7VrLzyuSxSvZn69Vc5Il1ribtmJgBc1XQILfxC/N+6tj+Z0y43hsUI7
	aPtNA0YZJr+F9I8maX36XQfep10Mvpix72alCZFwKFrfMIFDV7Kf6s9n5TjbCZ70pXcu
	1mv+eFsJ2aECoQFUj/y+3qYKm/v7sj9BqsQciyASxCk7sBoikzJXft4RkZvF8z0g/1dG
	KKdoPABCSbF1gn6wO2rWTS0PnzM9ibyZ0TOhlQOreO9RTIq47VyI3tvTmq2hpzxdsYkN
	pEKw==
X-Gm-Message-State: APt69E2uL5KWCm7Jc7oVlkAdc/N5U86aGKQ8gq0kjvoZ74z4zYRUtg9d
	tkinssXfnIBwNGWpcyfFTON4Zg==
X-Google-Smtp-Source: ADUXVKKIulLnGJEqtBl7fkPojRBuAemnG0kf4M3aQUR/EXv1SXELGkfNC+IgXi5+n9UKdiI5WOj1gg==
X-Received: by 2002:a17:902:88:: with SMTP id
	a8-v6mr9061898pla.156.1529222093350; 
	Sun, 17 Jun 2018 00:54:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	p3-v6sm14538587pga.72.2018.06.17.00.54.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Jun 2018 00:54:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jun 2018 00:54:53 -0700
Message-Id: <20180617075454.17209-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH 1/2] move cpprest to meta-oe
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
X-List-Received-Date: Sun, 17 Jun 2018 07:54:52 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cpprest-2.10.2/fix-cmake-install.patch    | 59 -------------------
 .../recipes-support/cpprest/cpprest_2.10.2.bb | 17 ------
 2 files changed, 76 deletions(-)
 delete mode 100644 meta-networking/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
 delete mode 100644 meta-networking/recipes-support/cpprest/cpprest_2.10.2.bb

diff --git a/meta-networking/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch b/meta-networking/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
deleted file mode 100644
index 56fd704ad7..0000000000
--- a/meta-networking/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Description: install cmake files into /usr/lib/cmake/cpprestsdk
-Author: Gianfranco Costamagna <locutusofborg@debian.org>
-Upstream-Status: https://github.com/Microsoft/cpprestsdk/pull/737
-Forwarded: https://github.com/Microsoft/cpprestsdk/pull/737
-Last-Update: 2018-04-19
-
-Index: cpprest/CMakeLists.txt
-===================================================================
---- cpprest.orig/CMakeLists.txt
-+++ cpprest/CMakeLists.txt
-@@ -18,7 +18,6 @@
- set(WERROR ON CACHE BOOL "Treat Warnings as Errors.")
- set(CPPREST_EXCLUDE_WEBSOCKETS OFF CACHE BOOL "Exclude websockets functionality.")
- set(CPPREST_EXCLUDE_COMPRESSION OFF CACHE BOOL "Exclude compression functionality.")
--set(CPPREST_EXPORT_DIR lib/cpprestsdk CACHE STRING "Directory to install CMake config files.")
- set(CPPREST_INSTALL_HEADERS ON CACHE BOOL "Install header files.")
- set(CPPREST_INSTALL ON CACHE BOOL "Add install commands.")
- 
-@@ -63,6 +62,9 @@
- include(cmake/cpprest_find_openssl.cmake)
- include(cmake/cpprest_find_websocketpp.cmake)
- include(CheckIncludeFiles)
-+if(UNIX)
-+include(GNUInstallDirs)
-+endif(UNIX)
- 
- find_package(Threads REQUIRED)
- if(THREADS_HAVE_PTHREAD_ARG)
-Index: cpprest/src/CMakeLists.txt
-===================================================================
---- cpprest.orig/src/CMakeLists.txt
-+++ cpprest/src/CMakeLists.txt
-@@ -250,21 +250,21 @@
-   install(
-     TARGETS ${CPPREST_TARGETS}
-     EXPORT cpprestsdk-targets
--    RUNTIME DESTINATION bin
--    LIBRARY DESTINATION lib
--    ARCHIVE DESTINATION lib
-+    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-+    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-   )
- 
-   configure_file(../cmake/cpprestsdk-config.in.cmake "${CMAKE_CURRENT_BINARY_DIR}/cpprestsdk-config.cmake" @ONLY)
- 
-   install(
-     FILES "${CMAKE_CURRENT_BINARY_DIR}/cpprestsdk-config.cmake"
--    DESTINATION ${CPPREST_EXPORT_DIR}
-+    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
-   )
-   install(
-     EXPORT cpprestsdk-targets
-     FILE cpprestsdk-targets.cmake
-     NAMESPACE cpprestsdk::
--    DESTINATION ${CPPREST_EXPORT_DIR}
-+    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
-   )
- endif()
diff --git a/meta-networking/recipes-support/cpprest/cpprest_2.10.2.bb b/meta-networking/recipes-support/cpprest/cpprest_2.10.2.bb
deleted file mode 100644
index 2ba6fc66cc..0000000000
--- a/meta-networking/recipes-support/cpprest/cpprest_2.10.2.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
-SECTION = "libs/network"
-HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../license.txt;md5=a2e15b954769218ff912468eecd6a02f"
-DEPENDS = "openssl websocketpp zlib boost"
-
-SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master"
-
-SRC_URI += "file://fix-cmake-install.patch"
-
-# tag 2.10.2
-SRCREV= "fea848e2a77563cf2a6f28f8eab396fd6e787fbf"
-
-S = "${WORKDIR}/git/Release"
-
-inherit cmake
-- 
2.17.1


