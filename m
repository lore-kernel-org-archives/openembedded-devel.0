Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 965E0745BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2018 13:41:59 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w95Dg0F2016341
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Oct 2018 15:42:00 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.77.245])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w95Dg0uc018359;
	Fri, 5 Oct 2018 15:42:00 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id F1A36101B038;
	Fri,  5 Oct 2018 15:42:02 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2018 15:41:59 +0200
Message-Id: <20181005134159.1894-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] libcec: update to 4.0.2
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
X-List-Received-Date: Fri, 05 Oct 2018 13:42:01 -0000

This also removes a warning that /usr/bin/python is not provided by any package.

Further it moves all binaires to a separate package libcec-tools

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...001-Explicitly-use-python3-in-pyCecClient.patch | 24 +++++++++++++++++++
 .../libcec/files/python-install-location.patch     | 28 ----------------------
 meta-oe/recipes-extended/libcec/libcec_git.bb      | 16 +++++++++----
 3 files changed, 35 insertions(+), 33 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libcec/files/0001-Explicitly-use-python3-in-pyCecClient.patch
 delete mode 100644 meta-oe/recipes-extended/libcec/files/python-install-location.patch

diff --git a/meta-oe/recipes-extended/libcec/files/0001-Explicitly-use-python3-in-pyCecClient.patch b/meta-oe/recipes-extended/libcec/files/0001-Explicitly-use-python3-in-pyCecClient.patch
new file mode 100644
index 000000000..ec1f5d0d5
--- /dev/null
+++ b/meta-oe/recipes-extended/libcec/files/0001-Explicitly-use-python3-in-pyCecClient.patch
@@ -0,0 +1,24 @@
+From 16e8c072709572ccefa6c7f835136db01f031323 Mon Sep 17 00:00:00 2001
+From: Pascal Bach <pascal.bach@siemens.com>
+Date: Fri, 28 Sep 2018 16:56:14 +0200
+Subject: [PATCH] Explicitly use python3 in pyCecClient
+
+Upstream-Status: Submitted [https://github.com/Pulse-Eight/libcec/pull/433]
+
+---
+ src/pyCecClient/pyCecClient.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pyCecClient/pyCecClient.py b/src/pyCecClient/pyCecClient.py
+index 6d47857..d0504ac 100755
+--- a/src/pyCecClient/pyCecClient.py
++++ b/src/pyCecClient/pyCecClient.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#! /usr/bin/python3
+ ## demo of the python-libcec API
+ 
+ # This file is part of the libCEC(R) library.
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-extended/libcec/files/python-install-location.patch b/meta-oe/recipes-extended/libcec/files/python-install-location.patch
deleted file mode 100644
index b6be78dd4..000000000
--- a/meta-oe/recipes-extended/libcec/files/python-install-location.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 330fa6777d51d41eefacff8e98e4250d210fde35 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Javi=20Mart=C3=ADnez?= <javi@flamingalah.net>
-Date: Tue, 13 Dec 2016 22:31:13 +0100
-Subject: [PATCH] Improve/fix installation of Python bindings
-
-Upstream-Status: Backport
-
-dist-packages is a Debian-specific directory for distribution packages (and used in derivatives such as Ubuntu). Therefore changed to site-packages.
----
- src/libcec/cmake/CheckPlatformSupport.cmake | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/libcec/cmake/CheckPlatformSupport.cmake b/src/libcec/cmake/CheckPlatformSupport.cmake
-index fcd0ef7..7661107 100644
---- a/src/libcec/cmake/CheckPlatformSupport.cmake
-+++ b/src/libcec/cmake/CheckPlatformSupport.cmake
-@@ -195,9 +195,9 @@ else()
-               RENAME      __init__.py)
-     else()
-       install(TARGETS     ${SWIG_MODULE_cec_REAL_NAME}
--              DESTINATION lib/python${PYTHON_VERSION}/dist-packages/cec)
-+              DESTINATION lib/python${PYTHON_VERSION}/site-packages/cec)
-       install(FILES       ${CMAKE_BINARY_DIR}/src/libcec/cec.py
--              DESTINATION lib/python${PYTHON_VERSION}/dist-packages/cec
-+              DESTINATION lib/python${PYTHON_VERSION}/site-packages/cec
-               RENAME      __init__.py)
-     endif()
-   endif()
diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index cb65caad8..4ad49971a 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -4,24 +4,30 @@ HOMEPAGE = "http://libcec.pulse-eight.com/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e61fd86f9c947b430126181da2c6c715"
 
-DEPENDS = "p8platform udev lockdev ncurses swig-native python3"
+DEPENDS = "p8platform udev ncurses swig-native python3"
 
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11 libxrandr', '', d)}"
 DEPENDS_append_rpi = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', ' userland', d)}"
 
-PV = "4.0.1+gitr${SRCPV}"
+PV = "4.0.2+gitr${SRCPV}"
 
-SRCREV = "2fc92b5f02dca702da92ccc5ed7b805b240ef5df"
+SRCREV = "0a97062dd4b196ceeb003ec41841c7a7edc36dd1"
 SRC_URI = "git://github.com/Pulse-Eight/libcec.git \
-           file://python-install-location.patch"
+           file://0001-Explicitly-use-python3-in-pyCecClient.patch"
 
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
 
+# Put client tools into a separate package
+PACKAGE_BEFORE_PN += "${PN}-tools"
+FILES_${PN}-tools = "${bindir}"
+RDEPENDS_${PN}-tools = "python3-${BPN}"
+
 # Create the wrapper for python3
 PACKAGES += "python3-${BPN}"
-FILES_python3-${BPN} = "${libdir}/python3*"
+FILES_python3-${BPN} = "${libdir}/python3* ${bindir}/py*"
+RDEPENDS_${PN} = "python3-core"
 
 # cec-client and xbmc need the .so present to work :(
 FILES_${PN} += "${libdir}/*.so"
-- 
2.11.0


