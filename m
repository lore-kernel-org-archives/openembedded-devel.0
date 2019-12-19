Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 820467FD95
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 15:25:41 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id bg7so2198836pjb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 07:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cT6zH/t2m6rW/WT3SZAdzvOUztKsgHCiCoPBx7IOf/Q=;
	b=pGHnFWqmKkx+9aaciSaMtWTdNdfVFVf1jpFHMI+JBnerpFraOU6Y8VrlF/9zU7RKvC
	SqzyqyykIZfYIkFbcT17ZfKUVE8YCXTlIgvVGjlAOsyyH2PWeWg272+vVDDF7+Vu1yhA
	9wI2pg7iaSvdNadY1P6rSxk48gTnhiajeUhVOHFERlkJkvlhVQiQgNcmDBvvkapRkAsn
	dsZtanGDs/uvvApPQOFLFgICge0/LwGLOwa9wa92DMFiNiytb8fcXDVkFpN8aWhGi+oC
	0SuUlqQxG2ugJKhGTrh0nndPVFSJVohDK4V9MLfnGsQJWPWD41/5lpGWi8ccxYrL7CA0
	rXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cT6zH/t2m6rW/WT3SZAdzvOUztKsgHCiCoPBx7IOf/Q=;
	b=LvdKsT7JMWOaZgUxwFYKkf/P4R1s5msxyaEUAcYQLHkWs8Qtdxtdz9eG+3PhghrqIl
	GGZOt7KThSgob6tan4zV5JPNYtP73rY2LmJoUeJGkjD5mbJ+fxPB9JKCLeKMYp5ZIi1W
	kHO8joW92Qxv6KaH5igwPWH0PrZbO1hzWv+hhiBmuK5Z/+N4NLGkjBloFh3WZ3s+mLy5
	oAGvfRCXCqqLt4OiRq/403D5Z4NxUTtQKR0zxqt9Pmb2S4Jme6CIYur2QeCZbekUAHO6
	MfIH4WJdzvW3Yz6HtICImZvpGZqFvy/0E7XeTiRr6+lJJFNTMKRSinj23/blGPCLXXLa
	xt4A==
X-Gm-Message-State: APjAAAUWcCHZV7sgoMuXHsCzjeum3sthuH8pbzP3Vj2QZdlXWcfMfdwH
	ZJbkK24/GTFBbsopONNf0ortR9kolik=
X-Google-Smtp-Source: APXvYqymPjxZ2+5WHd/G2yDea1VErPLiospm3mBW3VEnr0NtZBocMH3zgDC99bUc7+CaONlGfKrvIQ==
X-Received: by 2002:a17:902:ff0e:: with SMTP id
	f14mr9378034plj.95.1576769142063; 
	Thu, 19 Dec 2019 07:25:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b])
	by smtp.gmail.com with ESMTPSA id
	s18sm8840470pfs.20.2019.12.19.07.25.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 07:25:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Dec 2019 07:25:27 -0800
Message-Id: <20191219152529.725879-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219152529.725879-1-raj.khem@gmail.com>
References: <20191219152529.725879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 6/8] libinih: Fix multilib build
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
X-List-Received-Date: Thu, 19 Dec 2019 15:25:41 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: libinih-0.0+gitrAUTOINC+25078f7156-r3 do_package: QA Issue: libinih: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libinih.a
  /usr/lib/libinihcpp.a
  /usr/lib/pkgconfig
  /usr/lib/pkgconfig/inihcpp.pc
  /usr/lib/pkgconfig/inih.pc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rs-to-specify-multilib-specific-dirs.patch | 50 +++++++++++++++++++
 meta-oe/recipes-support/inih/libinih_git.bb   |  6 ++-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/inih/libinih/0001-Use-GNUInstallDirs-to-specify-multilib-specific-dirs.patch

diff --git a/meta-oe/recipes-support/inih/libinih/0001-Use-GNUInstallDirs-to-specify-multilib-specific-dirs.patch b/meta-oe/recipes-support/inih/libinih/0001-Use-GNUInstallDirs-to-specify-multilib-specific-dirs.patch
new file mode 100644
index 0000000000..7fe7973f69
--- /dev/null
+++ b/meta-oe/recipes-support/inih/libinih/0001-Use-GNUInstallDirs-to-specify-multilib-specific-dirs.patch
@@ -0,0 +1,50 @@
+From e99c040e32d261a61ca283ccfad7d1a3f5937922 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Dec 2019 23:02:15 -0800
+Subject: [PATCH] Use GNUInstallDirs to specify multilib specific dirs
+
+Helps in building on arches where default baselib is lib64
+
+Upstream-Status: Submitted [https://github.com/OSSystems/inih/pull/3]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt     | 6 ++++--
+ lib/CMakeLists.txt | 2 +-
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 906b3e1..683a0c7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,8 +1,10 @@
+ cmake_minimum_required(VERSION 2.6)
+ project(inih)
+ 
+-add_subdirectory(lib)
++INCLUDE(GNUInstallDirs)
++
+ add_subdirectory(include)
++add_subdirectory(lib)
+ 
+ if( CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64" )
+   set_target_properties(${PROJECT_NAME} PROPERTIES COMPILE_FLAGS "-fPIC")
+@@ -10,4 +12,4 @@ endif( CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64" )
+ 
+ configure_file(inih.pc.in inih.pc @ONLY)
+ configure_file(inihcpp.pc.in inihcpp.pc @ONLY)
+-install(FILES ${CMAKE_BINARY_DIR}/inih.pc ${CMAKE_BINARY_DIR}/inihcpp.pc DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/pkgconfig)
++install(FILES ${CMAKE_BINARY_DIR}/inih.pc ${CMAKE_BINARY_DIR}/inihcpp.pc DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
+index 63a16e9..18da39c 100644
+--- a/lib/CMakeLists.txt
++++ b/lib/CMakeLists.txt
+@@ -18,5 +18,5 @@ else(BUILD_SHARED_LIBS)
+   add_library(inihcpp STATIC ini.c INIReader.cpp)
+ endif(BUILD_SHARED_LIBS)
+ 
+-install(TARGETS inih inihcpp DESTINATION lib)
++install(TARGETS inih inihcpp DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ 
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
index 48271f721c..9bcb8c8800 100644
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -8,8 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dae28cbf28207425e0d0b3eb835f4bde"
 PR = "r3"
 
 # The github repository provides a cmake and pkg-config integration
-SRCREV = "25078f7156eb8647b3b35dd25f9ae6f8c4ee0589"
-SRC_URI = "git://github.com/OSSystems/inih.git"
+SRCREV = "ccfdd188894d01814d6e5e09cd97d3ff41521f43"
+SRC_URI = "git://github.com/OSSystems/inih.git \
+           file://0001-Use-GNUInstallDirs-to-specify-multilib-specific-dirs.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.24.1


