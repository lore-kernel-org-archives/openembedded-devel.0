Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 1678 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Mar 2017 17:58:19 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id E5C67776F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Mar 2017 17:58:19 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v2AHUIcj001990
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 10 Mar 2017 18:30:18 +0100
Received: from dev.sbt.siemens.com ([139.16.24.178])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v2AHUIIC025355;
	Fri, 10 Mar 2017 18:30:18 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Mar 2017 18:30:11 +0100
Message-Id: <1489167012-5648-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] libcec: update to version 4.0.1 and provide package for python3 wrapper
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
X-List-Received-Date: Fri, 10 Mar 2017 17:58:20 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 .../libcec/files/python-install-location.patch     | 28 ++++++++++++++++++++++
 meta-oe/recipes-extended/libcec/libcec_git.bb      | 15 ++++++------
 2 files changed, 36 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libcec/files/python-install-location.patch

diff --git a/meta-oe/recipes-extended/libcec/files/python-install-location.patch b/meta-oe/recipes-extended/libcec/files/python-install-location.patch
new file mode 100644
index 0000000..b6be78d
--- /dev/null
+++ b/meta-oe/recipes-extended/libcec/files/python-install-location.patch
@@ -0,0 +1,28 @@
+From 330fa6777d51d41eefacff8e98e4250d210fde35 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Javi=20Mart=C3=ADnez?= <javi@flamingalah.net>
+Date: Tue, 13 Dec 2016 22:31:13 +0100
+Subject: [PATCH] Improve/fix installation of Python bindings
+
+Upstream-Status: Backport
+
+dist-packages is a Debian-specific directory for distribution packages (and used in derivatives such as Ubuntu). Therefore changed to site-packages.
+---
+ src/libcec/cmake/CheckPlatformSupport.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libcec/cmake/CheckPlatformSupport.cmake b/src/libcec/cmake/CheckPlatformSupport.cmake
+index fcd0ef7..7661107 100644
+--- a/src/libcec/cmake/CheckPlatformSupport.cmake
++++ b/src/libcec/cmake/CheckPlatformSupport.cmake
+@@ -195,9 +195,9 @@ else()
+               RENAME      __init__.py)
+     else()
+       install(TARGETS     ${SWIG_MODULE_cec_REAL_NAME}
+-              DESTINATION lib/python${PYTHON_VERSION}/dist-packages/cec)
++              DESTINATION lib/python${PYTHON_VERSION}/site-packages/cec)
+       install(FILES       ${CMAKE_BINARY_DIR}/src/libcec/cec.py
+-              DESTINATION lib/python${PYTHON_VERSION}/dist-packages/cec
++              DESTINATION lib/python${PYTHON_VERSION}/site-packages/cec
+               RENAME      __init__.py)
+     endif()
+   endif()
diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index 0ce7ea1..cb65caa 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -4,23 +4,24 @@ HOMEPAGE = "http://libcec.pulse-eight.com/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e61fd86f9c947b430126181da2c6c715"
 
-DEPENDS = "p8platform udev lockdev ncurses"
+DEPENDS = "p8platform udev lockdev ncurses swig-native python3"
 
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11 libxrandr', '', d)}"
 DEPENDS_append_rpi = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', ' userland', d)}"
 
-PV = "3.1.0+gitr${SRCPV}"
+PV = "4.0.1+gitr${SRCPV}"
 
-SRCREV = "6d68d21243aa92862592435e8396b4280ea46c3f"
-SRC_URI = "git://github.com/Pulse-Eight/libcec.git"
+SRCREV = "2fc92b5f02dca702da92ccc5ed7b805b240ef5df"
+SRC_URI = "git://github.com/Pulse-Eight/libcec.git \
+           file://python-install-location.patch"
 
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
 
-# Disable python wrapper, it doesn't have crosscompiles
-EXTRA_OECMAKE = "-DCMAKE_INSTALL_LIBDIR=${libdir} -DCMAKE_INSTALL_LIBDIR_NOARCH=${libdir} \
-                 -DSKIP_PYTHON_WRAPPER=1"
+# Create the wrapper for python3
+PACKAGES += "python3-${BPN}"
+FILES_python3-${BPN} = "${libdir}/python3*"
 
 # cec-client and xbmc need the .so present to work :(
 FILES_${PN} += "${libdir}/*.so"
-- 
2.1.4


