Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B224F78292
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 07:14:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="31754557"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Dec 2017 15:14:22 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5A774486A76E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 15:14:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.76) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 19 Dec 2017 15:14:17 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Dec 2017 00:13:52 +0800
Message-ID: <1513700032-7807-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.76]
X-yoursite-MailScanner-ID: 5A774486A76E.A81FC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] dnfdragora: new add
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
X-List-Received-Date: Tue, 19 Dec 2017 07:14:24 -0000
Content-Type: text/plain

Add a new recipe dnfdragora.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...-set-PYTHON_INSTALL_DIR-by-running-python.patch | 26 ++++++++++++++++++
 .../0001-Run-python-scripts-using-env.patch        | 25 +++++++++++++++++
 .../0001-To-fix-error-when-do_package.patch        | 31 ++++++++++++++++++++++
 .../dnfdragora/0001-disable-build-manpages.patch   | 25 +++++++++++++++++
 .../recipes-graphics/dnfdragora/dnfdragora_git.bb  | 30 +++++++++++++++++++++
 5 files changed, 137 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
 create mode 100644 meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Run-python-scripts-using-env.patch
 create mode 100644 meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-fix-error-when-do_package.patch
 create mode 100644 meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-disable-build-manpages.patch
 create mode 100644 meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb

diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
new file mode 100644
index 0000000..46d4dbd
--- /dev/null
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -0,0 +1,26 @@
+From 80179c297abb9de2829bd02356257241dd414d70 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Mon, 18 Dec 2017 16:25:54 +0900
+Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python.
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7c66b39..1489ef6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -19,7 +19,7 @@ else(NOT SPHINX_EXECUTABLE-NOTFOUND)
+ 	message(STATUS "Could NOT find sphinx-build.")
+ endif(NOT SPHINX_EXECUTABLE-NOTFOUND)
+ 
+-execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "from distutils.sysconfig import get_python_lib; print(get_python_lib(), end='')" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++#execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "from distutils.sysconfig import get_python_lib; print(get_python_lib(), end='')" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
+ string(REGEX REPLACE "\n$" "" ${PYTHON_INSTALL_DIR} "${PYTHON_INSTALL_DIR}")
+ execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import sys; sys.stdout.write('%s.%s' % (sys.version_info.major, sys.version_info.minor))" OUTPUT_VARIABLE PYTHON_MAJOR_DOT_MINOR_VERSION)
+ message(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Run-python-scripts-using-env.patch b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Run-python-scripts-using-env.patch
new file mode 100644
index 0000000..75b6b8f
--- /dev/null
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Run-python-scripts-using-env.patch
@@ -0,0 +1,25 @@
+From 15d0afcfa4868b7b072b3434bac0064617d61f99 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Tue, 19 Dec 2017 14:53:14 +0900
+Subject: [PATCH] Run python scripts using env
+
+Otherwise the build tools hardcode the python path into them.
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ bin/dnfdragora | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bin/dnfdragora b/bin/dnfdragora
+index b8e0550..cd80f7f 100755
+--- a/bin/dnfdragora
++++ b/bin/dnfdragora
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ # vim: set et ts=4 sw=4:
+ #    Copyright 2016-2017 Angelo Naselli <anaselli@linux.it>
+ #
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-fix-error-when-do_package.patch b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-fix-error-when-do_package.patch
new file mode 100644
index 0000000..90ce1d0
--- /dev/null
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-fix-error-when-do_package.patch
@@ -0,0 +1,31 @@
+From 56d9b838b3475729d7ed9c6c156d72c28943c2b6 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Tue, 19 Dec 2017 11:15:29 +0900
+Subject: [PATCH] To fix error when do_package
+
+QA Issue: nativesdk-dnfdragora: Files/directories were installed but not shipped in any package:
+  /etc
+  /etc/dnfdragora
+  /etc/dnfdragora/dnfdragora.yaml
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7c66b39..a5659f7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -52,7 +52,7 @@ endif(ENABLE_COMPS)
+ set(CMAKE_INSTALL_BINDIR "${CMAKE_INSTALL_PREFIX}/bin")
+ set(CMAKE_INSTALL_DATAROOTDIR "${CMAKE_INSTALL_PREFIX}/share")
+ set(CMAKE_INSTALL_LOCALEDIR "${CMAKE_INSTALL_DATAROOTDIR}/locale")
+-set(CMAKE_INSTALL_FULL_SYSCONFDIR "/etc")
++set(CMAKE_INSTALL_FULL_SYSCONFDIR "${CMAKE_INSTALL_PREFIX}/../etc")
+ 
+ # Configure files
+ configure_file(${CMAKE_SOURCE_DIR}/etc/dnfdragora.yaml.in ${CMAKE_BINARY_DIR}/etc/dnfdragora.yaml @ONLY)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-disable-build-manpages.patch b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-disable-build-manpages.patch
new file mode 100644
index 0000000..88bb634
--- /dev/null
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-disable-build-manpages.patch
@@ -0,0 +1,25 @@
+From 2e6a0db24be373a5b7741dc5a0d322a28389fbf0 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Thu, 23 Nov 2017 16:35:44 +0900
+Subject: [PATCH] disable build manpages.
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7c66b39..fc32750 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -65,7 +65,6 @@ endif(GETTEXT_FOUND)
+ 
+ # Build and install the man-pages
+ if(NOT SPHINX_EXECUTABLE-NOTFOUND)
+-	add_subdirectory(man)
+ endif(NOT SPHINX_EXECUTABLE-NOTFOUND)
+ 
+ # Installing application code
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
new file mode 100644
index 0000000..5678f73
--- /dev/null
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
@@ -0,0 +1,30 @@
+SUMMARY = "dnfdragora is a DNF frontend, based on rpmdragora from Mageia (originally rpmdrake) Perl code."
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504 \
+                   "
+
+SRC_URI = "git://github.com/manatools/dnfdragora.git \
+           file://0001-disable-build-manpages.patch \
+           file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
+           file://0001-To-fix-error-when-do_package.patch \
+           file://0001-Run-python-scripts-using-env.patch \
+           "
+
+PV = "1.0.1+git"
+SRCREV = "4fef4ce889b8e4fa03191d414f63bfd50796152a"
+
+S = "${WORKDIR}/git"
+
+inherit cmake gettext pkgconfig python3-dir python3native distutils3-base
+
+DEPENDS += "dnf python3 "
+#DEPENDS_class-nativesdk += "nativesdk-python3"
+
+RDEPENDS_${PN}_class-target = " python3-core libyui libyui-ncurses "
+
+# manpages generation requires http://www.sphinx-doc.org/
+EXTRA_OECMAKE = " -DWITH_MAN=OFF -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
+
+BBCLASSEXTEND = "nativesdk"
+
+FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/ ${datadir}/ ${bindir}/ ${sysconfdir}/dnfdragora "
-- 
2.7.4




