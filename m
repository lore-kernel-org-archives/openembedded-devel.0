Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C0C606194E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 05:26:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,510,1574092800"; d="scan'208";a="85488723"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Mar 2020 13:26:11 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 444C250A997F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:16:17 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 3 Mar 2020 13:26:04 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020 13:26:13 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Mar 2020 03:51:52 -0800
Message-ID: <1583236320-114088-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 444C250A997F.A19CA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] dnfdragora: upgrade 1.0.1 -> 1.1.2
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
X-List-Received-Date: Tue, 03 Mar 2020 05:26:11 -0000
Content-Type: text/plain

refresh the following paches:
0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
0001-To-fix-error-when-do_package.patch
0001-disable-build-manpages.patch

0001-Run-python-scripts-using-env.patch
removed since it is included in 1.1.2

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...PYTHON_INSTALL_DIR-by-running-python.patch | 10 ++++----
 .../0001-Run-python-scripts-using-env.patch   | 25 -------------------
 .../0001-To-fix-error-when-do_package.patch   | 13 +++++-----
 .../0001-disable-build-manpages.patch         | 10 ++++----
 .../dnfdragora/dnfdragora_git.bb              |  7 +++---
 5 files changed, 20 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Run-python-scripts-using-env.patch

diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 46d4dbde4..6a7b1bf31 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -9,12 +9,12 @@ Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7c66b39..1489ef6 100644
+index 230c87b..e699e83 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -19,7 +19,7 @@ else(NOT SPHINX_EXECUTABLE-NOTFOUND)
- 	message(STATUS "Could NOT find sphinx-build.")
- endif(NOT SPHINX_EXECUTABLE-NOTFOUND)
+@@ -19,7 +19,7 @@ else(SPHINX_EXECUTABLE STREQUAL "SPHINX_EXECUTABLE-NOTFOUND")
+ 	message(STATUS "Found sphinx-build: ${SPHINX_EXECUTABLE}")
+ endif(SPHINX_EXECUTABLE STREQUAL "SPHINX_EXECUTABLE-NOTFOUND")
  
 -execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "from distutils.sysconfig import get_python_lib; print(get_python_lib(), end='')" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
 +#execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "from distutils.sysconfig import get_python_lib; print(get_python_lib(), end='')" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
@@ -22,5 +22,5 @@ index 7c66b39..1489ef6 100644
  execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import sys; sys.stdout.write('%s.%s' % (sys.version_info.major, sys.version_info.minor))" OUTPUT_VARIABLE PYTHON_MAJOR_DOT_MINOR_VERSION)
  message(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Run-python-scripts-using-env.patch b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Run-python-scripts-using-env.patch
deleted file mode 100644
index 75b6b8fd9..000000000
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Run-python-scripts-using-env.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 15d0afcfa4868b7b072b3434bac0064617d61f99 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Tue, 19 Dec 2017 14:53:14 +0900
-Subject: [PATCH] Run python scripts using env
-
-Otherwise the build tools hardcode the python path into them.
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
----
- bin/dnfdragora | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bin/dnfdragora b/bin/dnfdragora
-index b8e0550..cd80f7f 100755
---- a/bin/dnfdragora
-+++ b/bin/dnfdragora
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- # vim: set et ts=4 sw=4:
- #    Copyright 2016-2017 Angelo Naselli <anaselli@linux.it>
- #
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-fix-error-when-do_package.patch b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-fix-error-when-do_package.patch
index 90ce1d0ac..bef471189 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-fix-error-when-do_package.patch
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-fix-error-when-do_package.patch
@@ -3,7 +3,8 @@ From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Tue, 19 Dec 2017 11:15:29 +0900
 Subject: [PATCH] To fix error when do_package
 
-QA Issue: nativesdk-dnfdragora: Files/directories were installed but not shipped in any package:
+QA Issue: nativesdk-dnfdragora: Files/directories were installed but not
+shipped in any package:
   /etc
   /etc/dnfdragora
   /etc/dnfdragora/dnfdragora.yaml
@@ -14,18 +15,18 @@ Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7c66b39..a5659f7 100644
+index 230c87b..1b8d800 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -52,7 +52,7 @@ endif(ENABLE_COMPS)
+@@ -68,7 +68,7 @@ endif(ENABLE_COMPS)
  set(CMAKE_INSTALL_BINDIR "${CMAKE_INSTALL_PREFIX}/bin")
  set(CMAKE_INSTALL_DATAROOTDIR "${CMAKE_INSTALL_PREFIX}/share")
  set(CMAKE_INSTALL_LOCALEDIR "${CMAKE_INSTALL_DATAROOTDIR}/locale")
--set(CMAKE_INSTALL_FULL_SYSCONFDIR "/etc")
-+set(CMAKE_INSTALL_FULL_SYSCONFDIR "${CMAKE_INSTALL_PREFIX}/../etc")
+-set(CMAKE_INSTALL_FULL_SYSCONFDIR "/etc" CACHE PATH "sysconfig directory (default /etc)")
++set(CMAKE_INSTALL_FULL_SYSCONFDIR "${CMAKE_INSTALL_PREFIX}/../etc" CACHE PATH "sysconfig directory (default /etc)")
  
  # Configure files
  configure_file(${CMAKE_SOURCE_DIR}/etc/dnfdragora.yaml.in ${CMAKE_BINARY_DIR}/etc/dnfdragora.yaml @ONLY)
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-disable-build-manpages.patch b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-disable-build-manpages.patch
index 88bb63416..c8b105ea3 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-disable-build-manpages.patch
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-disable-build-manpages.patch
@@ -9,17 +9,17 @@ Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7c66b39..fc32750 100644
+index 230c87b..1624998 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -65,7 +65,6 @@ endif(GETTEXT_FOUND)
+@@ -81,7 +81,6 @@ endif(GETTEXT_FOUND)
  
  # Build and install the man-pages
- if(NOT SPHINX_EXECUTABLE-NOTFOUND)
+ if(NOT SPHINX_EXECUTABLE STREQUAL "SPHINX_EXECUTABLE-NOTFOUND")
 -	add_subdirectory(man)
- endif(NOT SPHINX_EXECUTABLE-NOTFOUND)
+ endif(NOT SPHINX_EXECUTABLE STREQUAL "SPHINX_EXECUTABLE-NOTFOUND")
  
  # Installing application code
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
index 7a51a4a25..007385101 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
@@ -7,11 +7,10 @@ SRC_URI = "git://github.com/manatools/dnfdragora.git \
            file://0001-disable-build-manpages.patch \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-To-fix-error-when-do_package.patch \
-           file://0001-Run-python-scripts-using-env.patch \
            "
 
-PV = "1.0.1+git${SRCPV}"
-SRCREV = "4fef4ce889b8e4fa03191d414f63bfd50796152a"
+PV = "1.1.2+git${SRCPV}"
+SRCREV = "19e123132cfd4efd860e5204261c3c228bfe80a8"
 
 S = "${WORKDIR}/git"
 
@@ -27,7 +26,7 @@ EXTRA_OECMAKE = " -DWITH_MAN=OFF -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}
 
 BBCLASSEXTEND = "nativesdk"
 
-FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/ ${datadir}/ ${bindir}/ ${sysconfdir}/dnfdragora "
+FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/ ${datadir}/ ${bindir}/ ${sysconfdir}/dnfdragora ${sysconfdir}/xdg"
 
 PNBLACKLIST[dnfdragora] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
 
-- 
2.17.1




