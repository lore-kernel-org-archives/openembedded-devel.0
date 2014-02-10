Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id CB6806EBB3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 21:17:24 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0S00NR6TSD29E0@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	10 Feb 2014 15:17:01 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CD1082064D; Mon,
	10 Feb 2014 16:17:00 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Feb 2014 16:16:55 -0500
Message-id: <1392067015-16328-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1392067015-16328-1-git-send-email-denis@denix.org>
References: <1392067015-16328-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH 3/3] meta-toolchain-qt5: add Qt5 SDK standalone meta recipe
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
X-List-Received-Date: Mon, 10 Feb 2014 21:17:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-core/meta/meta-toolchain-qt5.bb | 55 +++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 recipes-core/meta/meta-toolchain-qt5.bb

diff --git a/recipes-core/meta/meta-toolchain-qt5.bb b/recipes-core/meta/meta-toolchain-qt5.bb
new file mode 100644
index 0000000..e4b70a4
--- /dev/null
+++ b/recipes-core/meta/meta-toolchain-qt5.bb
@@ -0,0 +1,55 @@
+SUMMARY = "Meta package for building an installable Qt5 toolchain and SDK"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-qt5-toolchain-host"
+TOOLCHAIN_TARGET_TASK ?= "packagegroup-qt5-toolchain-target"
+
+inherit populate_sdk
+
+QT_DIR_NAME = "qt5"
+QT_BIN_PREFIX = "${QT_DIR_NAME}/"
+QT_MKSPECS_LOCATION = "${libdir}"
+
+toolchain_create_sdk_env_script_append() {
+	echo 'export PATH=$${SDKPATHNATIVE}${bindir_nativesdk}/${QT_DIR_NAME}:$PATH' >> $script
+	echo 'export OE_QMAKE_CFLAGS="${CFLAGS}"' >> $script
+	echo 'export OE_QMAKE_CXXFLAGS="${CXXFLAGS}"' >> $script
+	echo 'export OE_QMAKE_LDFLAGS="${LDFLAGS}"' >> $script
+	echo 'export OE_QMAKE_CC=${CC}' >> $script
+	echo 'export OE_QMAKE_CXX=${CXX}' >> $script
+	echo 'export OE_QMAKE_LINK=${CXX}' >> $script
+	echo 'export OE_QMAKE_AR=${AR}' >> $script
+	echo 'export OE_QMAKE_LIBDIR_QT=$SDKTARGETSYSROOT${libdir}' >> $script
+	echo 'export OE_QMAKE_INCDIR_QT=$SDKTARGETSYSROOT${includedir}/${QT_DIR_NAME}' >> $script
+	echo 'export OE_QMAKE_HOST_BINDIR_QT=$${SDKPATHNATIVE}${bindir_nativesdk}/${QT_BIN_PREFIX}' >> $script
+	echo 'export OE_QMAKE_MOC=$${SDKPATHNATIVE}${bindir_nativesdk}/${QT_BIN_PREFIX}moc' >> $script
+	echo 'export OE_QMAKE_UIC=$${SDKPATHNATIVE}${bindir_nativesdk}/${QT_BIN_PREFIX}uic' >> $script
+	echo 'export OE_QMAKE_UIC3=$${SDKPATHNATIVE}${bindir_nativesdk}/${QT_BIN_PREFIX}uic3' >> $script
+	echo 'export OE_QMAKE_RCC=$${SDKPATHNATIVE}${bindir_nativesdk}/${QT_BIN_PREFIX}rcc' >> $script
+	echo 'export OE_QMAKE_QDBUSCPP2XML=$${SDKPATHNATIVE}${bindir_nativesdk}/${QT_BIN_PREFIX}qdbuscpp2xml' >> $script
+	echo 'export OE_QMAKE_QDBUSXML2CPP=$${SDKPATHNATIVE}${bindir_nativesdk}/${QT_BIN_PREFIX}qdbusxml2cpp' >> $script
+	echo 'export OE_QMAKE_QT_CONFIG=$SDKTARGETSYSROOT${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
+	echo 'export OE_QMAKE_STRIP="echo"' >> $script
+	echo 'export QMAKESPEC=$SDKTARGETSYSROOT${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs/linux-gnueabi-oe-g++' >> $script
+	echo 'export QMAKE_DEFAULT_LIBDIRS=${QT_QMAKE_LIBDIR_QT}' >> $script
+	echo 'export QMAKE_DEFAULT_INCDIRS=${QT_QMAKE_INCDIR_QT}' >> $script
+
+	#Adds qt.conf file that points qmake to properly locate Qt library and header files.
+	#This enables Qt Creator to work properly
+
+	qt_conf="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/${QT_BIN_PREFIX}qt.conf"
+	touch $qt_conf
+	echo '[Paths]' >> $qt_conf
+	echo 'Prefix = $(SDKTARGETSYSROOT)' >> $qt_conf
+	echo 'Libraries = $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
+	echo 'Headers = $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
+	echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qt_conf
+	echo 'HostBinaries = $(OE_QMAKE_HOST_BINDIR_QT)' >> $qt_conf
+
+	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
+	# and QTCreator
+	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf .${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
+}
-- 
1.8.3.2


