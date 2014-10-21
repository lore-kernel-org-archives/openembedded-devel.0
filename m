Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id E4788607A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 01:59:59 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id j5so185489qga.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 19:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=KJQ5+oRiuQWreqSAgqngIuakBuZrCfRQTeBeRGrUi60=;
	b=jXF8T7NJQw3Panl227j4+q/24/4k1rcmOmAjjGoU//Ko8jzvGXB2C/sCkbMJCzTPI8
	JPPv9fnJdZyOpG6p7VVPtS/n6xsIKOifsbGEtkjJzGRRgBAfPoixHdVNTlh82ejruoRz
	/8tuCD4o7lTS1o8WF75/dj/GPN9EemijpDK29bD/NKv4m8KxAefGgkbPyffGbLNsOtnH
	AYqFJv2EezYIZzqr6NjtFiOVcwWSa4zv8Qq7IuWa9POhGHOxa9aZhS182j4aSlshMZg+
	75f613mRf5OWiSAJbQ6vCWxwSmOJ2DuiLSB2/b5QJQqkBU99eZBCcCpu8JbLRfU+5XFc
	vgPA==
X-Received: by 10.224.80.193 with SMTP id u1mr32790490qak.86.1413856800014;
	Mon, 20 Oct 2014 19:00:00 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.195.2])
	by mx.google.com with ESMTPSA id p77sm9488793qgp.25.2014.10.20.18.59.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Oct 2014 18:59:59 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Oct 2014 23:59:50 -0200
Message-Id: <1413856790-4757-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1413856790-4757-1-git-send-email-otavio@ossystems.com.br>
References: <1413856790-4757-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] nativesdk-qtbase: Add CMake toolchain configuration
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Oct 2014 02:00:00 -0000

This allow out of box use of CMake in a SDK; this includes the
subscript to properly set the host binaries path.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/nativesdk-qtbase.inc            |   11 +++++++++++
 recipes-qt/qt5/qtbase-git/OEQt5Toolchain.cmake |    1 +
 recipes-qt/qt5/qtbase/OEQt5Toolchain.cmake     |    1 +
 3 files changed, 13 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase-git/OEQt5Toolchain.cmake
 create mode 100644 recipes-qt/qt5/qtbase/OEQt5Toolchain.cmake

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index 09f3d9a..ea55fa2 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -35,6 +35,11 @@ SRC_URI += " \
     file://0013-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
+# CMake's toolchain configuration of nativesdk-qtbase
+SRC_URI += " \
+    file://OEQt5Toolchain.cmake \
+"
+
 PACKAGES = "${PN}-tools-dbg ${PN}-tools-dev ${PN}-tools-staticdev ${PN}-tools"
 
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
@@ -58,6 +63,7 @@ FILES_${PN}-tools = " \
     ${libdir}/lib*${SOLIBS} \
     ${OE_QMAKE_PATH_BINS}/* \
     ${SDKPATHNATIVE}/environment-setup.d \
+    ${datadir}/cmake \
 "
 
 # qttools binaries are placed in a subdir of bin in order to avoid
@@ -218,6 +224,10 @@ do_install() {
                                    -not -name 'libQt5Core.so*' -and \
                                    -not -name 'libQt5Bootstrap.a' \
                                    -exec rm '{}' ';'
+
+    # Install CMake's toolchain configuration
+    mkdir -p ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
+    install -m 644 ${WORKDIR}/OEQt5Toolchain.cmake ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
 }
 
 do_generate_qt_environment_file() {
@@ -241,6 +251,7 @@ do_generate_qt_environment_file() {
     echo 'export OE_QMAKE_QDBUSCPP2XML=${OE_QMAKE_PATH_HOST_BINS}/qdbuscpp2xml' >> $script
     echo 'export OE_QMAKE_QDBUSXML2CPP=${OE_QMAKE_PATH_HOST_BINS}/qdbusxml2cpp' >> $script
     echo 'export OE_QMAKE_QT_CONFIG=`qmake -query QT_INSTALL_LIBS`/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
+    echo 'export OE_QMAKE_PATH_HOST_BINS=${OE_QMAKE_PATH_HOST_BINS}' >> $script
     echo 'export QMAKESPEC=`qmake -query QT_INSTALL_LIBS`/mkspecs/linux-oe-g++' >> $script
 
     # Use relocable sysroot
diff --git a/recipes-qt/qt5/qtbase-git/OEQt5Toolchain.cmake b/recipes-qt/qt5/qtbase-git/OEQt5Toolchain.cmake
new file mode 100644
index 0000000..6f0042b
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/OEQt5Toolchain.cmake
@@ -0,0 +1 @@
+set( OE_QMAKE_PATH_EXTERNAL_HOST_BINS $ENV{OE_QMAKE_PATH_HOST_BINS} )
diff --git a/recipes-qt/qt5/qtbase/OEQt5Toolchain.cmake b/recipes-qt/qt5/qtbase/OEQt5Toolchain.cmake
new file mode 100644
index 0000000..6f0042b
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/OEQt5Toolchain.cmake
@@ -0,0 +1 @@
+set( OE_QMAKE_PATH_EXTERNAL_HOST_BINS $ENV{OE_QMAKE_PATH_HOST_BINS} )
-- 
1.7.10.4


