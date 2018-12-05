Return-Path: <uvv.mail@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF3B6C455
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 12:14:20 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id d39so16777549edb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2018 04:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KDaUp5F1sSK62y4yYZ8NzR52G3di1D7z91BTnOwVzLs=;
	b=JoFsi+Iy8wlnisgyV1SfsdTGVI9xxc7XwZVyuWoz1bKH3+E29e/C2q+HLDjs8toLfW
	b29PVvxhr+bE0SUSm5kdni4Rk79gjs7asTGViZjwTS07mvPE5RyzdUG7lVusHA3CqRF2
	iFQHDZqpItrd8omG9aZTocIbzgJxljgwS8ymLXA+d20h/bBcxic3yovKgg9sOVatrV1k
	6vVAvCFv7GkA11c+nFemPUILvTXWsN1Otk8VbUGyIrTBKSz3WLvi7jEos6eqfEcGlwjY
	v1+KClGG8n2OwuSOH6W83vgZAEEVKgO9bIIiegaE3rQxh//y6Z0QM1UphI+6GkDcV/qJ
	VRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KDaUp5F1sSK62y4yYZ8NzR52G3di1D7z91BTnOwVzLs=;
	b=Y91i/TBZ0p5Msac7FgJ8c3NLEFxqCjtLT9sreHWNNoRnD7ML1zt/z+S/50DmWSQttN
	0mOIeA+ws2cBBkG+ymA9IiOLdo5q14RSj3iEuU1CJEPQ33YB8sYYuR+38hJZOemYJU4f
	LttHO1aW87bK7T3u+ZGUuKjQ46CoJxMzDywk/ZgjQ69QGSa611f/Jc9h1DWXEniJH3zQ
	R0MaZu0wRtpxVeIObu6H/nMg9i4hmKhHwjQ+AmlHk2pyyORHiI5bcEa+MsSSDnk9M2sl
	yHfxuLFQM6xo/Bs7TM0wKC80hb6yXfPblpWygwyA7EaD75iMruxpSwDacfXlMVcNZ+EZ
	HidQ==
X-Gm-Message-State: AA+aEWZJP6J071LszC6urr/YVcpYV6HdOXBmjy9FoUPKrtRWICAPJt2u
	jqAYncvO7ru/YoF9j4dJQ22y/sZEMtY=
X-Google-Smtp-Source: AFSGD/VUPGY11W8JVVoZiRw4F5bwAsllhkmLYZzSjVvgp3PyLuh8GJVonldTQQjKaSBjvqM/hoh8oQ==
X-Received: by 2002:a17:906:1001:: with SMTP id
	1-v6mr18555955ejm.91.1544012060743; 
	Wed, 05 Dec 2018 04:14:20 -0800 (PST)
Received: from localhost.localdomain (ip-109-42-0-94.web.vodafone.de.
	[109.42.0.94]) by smtp.gmail.com with ESMTPSA id
	gp22-v6sm3211234ejb.4.2018.12.05.04.14.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Dec 2018 04:14:20 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2018 13:13:57 +0100
Message-Id: <20181205121357.116604-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-oe][PATCH] glog: fix installation path
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
X-List-Received-Date: Wed, 05 Dec 2018 12:14:21 -0000
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

When glog is compiled with multilib support, it shouldn't use hardcoded paths.
Paths substitued by CMake should be used instead.

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Tested-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../glog/0003-installation-path-fix.patch     | 65 +++++++++++++++++++
 meta-oe/recipes-support/glog/glog_0.3.5.bb    |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/glog/glog/0003-installation-path-fix.patch

diff --git a/meta-oe/recipes-support/glog/glog/0003-installation-path-fix.patch b/meta-oe/recipes-support/glog/glog/0003-installation-path-fix.patch
new file mode 100644
index 000000000..641f70cb2
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
index 5e58450c2..3de01ef5b 100644
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
2.19.1


