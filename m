Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id A39DF6C46D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Dec 2018 09:24:03 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j10so7576937wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Dec 2018 01:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=urGC13MTpiW/osOmqbowdpycxgMiVHyfJfw0999FhMs=;
	b=s1kB11s+NZAxGFNjqE+1k4Aqcv3kQ9T3wspaZMeYdguRDMFPzim1ALNzL25Kzr5GqC
	d6NmKFMaWp+hZXrhrIZqZ+HLc4QYytZHEDklJUikGN1E2DpUYo+FE8bzPml3lPti2dsx
	MMBh390nExgSPjIw4MJfTmiM8hM6Fe0kvDgHUH8WRbH8hDcQ5aOSSEM3PcHQew0XTBwS
	vITh77FnQHNGemdTPCHXdSzKDNShEhwH24ya0NqXgZgaTyCS+e5KWYG2nBKDWZLwiUk+
	lnkgw0dbrOgqNaLk0AahNplJyM6Kit0RqAkWY9Bw8f372J69kz9LUmeEvGUraPDNE1nP
	E70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=urGC13MTpiW/osOmqbowdpycxgMiVHyfJfw0999FhMs=;
	b=U8gBdOGQD6+F2BktxQ0PlP1hkgBP+FbMxI9Ypgv9THPZ5zF3ANoOSi5vZzNwHWfbM2
	l8oaX+Gjp+GaQw8wc8P74xB7bFeVEg6k6FWxErPJPMD62mL0wKqkuN2npszyaMpxtgxe
	PxlAU5nVUZKcPUo4gGnT6FilgPXEoq1YgRV15OdujkYf9qonpieMy6R7O1LVdNS/G5uO
	o7kmHBCd+dB1Wq1umlyFD7VNBfTNnLs5DfHLRZAVLaFQ/Tbf63NuDmZAIbXnIqd9ybBx
	TUAW6XV577RFPeCoa4/sjVDPt/vxYhFGAkj9hADL5YIz4/uQW7X/yn1+QFG4oyS7b71I
	QQpQ==
X-Gm-Message-State: AA+aEWYfUwUyA8IDvrgULzHc2crpuUgXsoGy3R7e22PhvH+zxcKExyHV
	JaJ+xu9eueB+P0cSc1SBCqRg0EL7
X-Google-Smtp-Source: AFSGD/WIjiieLA/Z4I6zmsLPk2AkkqGMGwmz/b2zYKYdkZyzhJzfB6OoYId0CuUegfFzTypk6EMZhQ==
X-Received: by 2002:adf:92c7:: with SMTP id 65mr6093725wrn.228.1544347444079; 
	Sun, 09 Dec 2018 01:24:04 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l37sm19633025wre.69.2018.12.09.01.24.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 09 Dec 2018 01:24:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Dec 2018 09:24:02 +0000
Message-Id: <20181209092402.10939-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181209092402.10939-1-Martin.Jansa@gmail.com>
References: <20181209092402.10939-1-Martin.Jansa@gmail.com>
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [PATCH][thud][meta-oe 2/2] glog: fix installation path
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
X-List-Received-Date: Sun, 09 Dec 2018 09:24:03 -0000

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

When glog is compiled with multilib support, it shouldn't use hardcoded paths.
Paths substitued by CMake should be used instead.

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Tested-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glog/0003-installation-path-fix.patch     | 65 +++++++++++++++++++
 meta-oe/recipes-support/glog/glog_0.3.5.bb    |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/glog/glog/0003-installation-path-fix.patch

diff --git a/meta-oe/recipes-support/glog/glog/0003-installation-path-fix.patch b/meta-oe/recipes-support/glog/glog/0003-installation-path-fix.patch
new file mode 100644
index 0000000000..641f70cb24
--- /dev/null
+++ b/meta-oe/recipes-support/glog/glog/0003-installation-path-fix.patch
@@ -0,0 +1,65 @@
+diff -uNr a/CMakeLists.txt b/CMakeLists.txt
+--- a/CMakeLists.txt	2018-12-05 12:55:59.630792054 +0100
++++ b/CMakeLists.txt	2018-12-05 13:00:22.922269200 +0100
+@@ -403,10 +403,15 @@
+ 
+ set_target_properties (glog PROPERTIES PUBLIC_HEADER "${GLOG_PUBLIC_H}")
+ 
++set (_glog_CMake_BINDIR ${CMAKE_INSTALL_BINDIR})
++set (_glog_CMake_INCLUDE_DIR ${CMAKE_INSTALL_INCLUDEDIR})
++set (_glog_CMake_LIBDIR ${CMAKE_INSTALL_LIBDIR})
++set (_glog_CMake_INSTALLDIR ${_glog_CMake_LIBDIR}/cmake/glog)
++
+ target_include_directories (glog BEFORE PUBLIC
+   "$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>"
+   "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>"
+-  "$<INSTALL_INTERFACE:include>"
++  "$<INSTALL_INTERFACE:${_glog_CMake_INCLUDE_DIR}>"
+   PRIVATE ${CMAKE_CURRENT_BINARY_DIR}
+   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src)
+ 
+@@ -543,10 +548,10 @@
+ 
+ install (TARGETS glog
+   EXPORT glog-targets
+-  RUNTIME DESTINATION bin
+-  PUBLIC_HEADER DESTINATION include/glog
+-  LIBRARY DESTINATION lib
+-  ARCHIVE DESTINATION lib)
++  RUNTIME DESTINATION ${_glog_CMake_BINDIR}
++  PUBLIC_HEADER DESTINATION ${_glog_CMake_INCLUDE_DIR}/glog
++  LIBRARY DESTINATION ${_glog_CMake_LIBDIR}
++  ARCHIVE DESTINATION ${_glog_CMake_LIBDIR})
+ 
+ if (gflags_FOUND)
+   set (gflags_DEPENDENCY "find_dependency (gflags ${gflags_VERSION})")
+@@ -554,7 +559,7 @@
+ 
+ configure_package_config_file (glog-config.cmake.in
+   ${CMAKE_CURRENT_BINARY_DIR}/glog-config.cmake
+-  INSTALL_DESTINATION lib/cmake/glog
++  INSTALL_DESTINATION ${_glog_CMake_INSTALLDIR}
+   NO_CHECK_REQUIRED_COMPONENTS_MACRO)
+ 
+ write_basic_package_version_file (glog-config-version.cmake VERSION
+@@ -567,6 +572,7 @@
+   ${CMAKE_CURRENT_BINARY_DIR}/glog-config.cmake
+   ${CMAKE_CURRENT_BINARY_DIR}/glog-config-version.cmake
+   ${CMAKE_CURRENT_SOURCE_DIR}/cmake/FindLibunwind.cmake
+-  DESTINATION lib/cmake/glog)
++  DESTINATION ${_glog_CMake_INSTALLDIR})
+ 
+-install (EXPORT glog-targets NAMESPACE glog:: DESTINATION lib/cmake/glog)
++install (EXPORT glog-targets NAMESPACE glog:: DESTINATION
++  ${_glog_CMake_INSTALLDIR})
+diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
+--- a/glog-config.cmake.in	2018-12-05 12:55:59.630792054 +0100
++++ b/glog-config.cmake.in	2018-12-05 13:05:19.547196843 +0100
+@@ -4,6 +4,7 @@
+ 
+ @gflags_DEPENDENCY@
+ 
++list (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
+ find_dependency (Libunwind)
+ 
+ include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
diff --git a/meta-oe/recipes-support/glog/glog_0.3.5.bb b/meta-oe/recipes-support/glog/glog_0.3.5.bb
index 5e58450c24..3de01ef5b6 100644
--- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
+++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     git://github.com/google/glog.git;branch=v035 \
     file://0001-Rework-CMake-glog-VERSION-management.patch \
     file://0002-Find-Libunwind-during-configure.patch \
+    file://0003-installation-path-fix.patch \
 "
 
 SRCREV = "a6a166db069520dbbd653c97c2e5b12e08a8bb26"
-- 
2.17.1


