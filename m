Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3176E744
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 17:27:34 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0U008RKDTNRO40@vms173023.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	11 Feb 2014 11:27:23 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F41A720018; Tue,
	11 Feb 2014 12:27:22 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Feb 2014 12:27:22 -0500
Message-id: <1392139642-5871-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5/ossystems/nativesdk][PATCH] populate_sdk_qt5: update with few additional vars and fix typos
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
X-List-Received-Date: Tue, 11 Feb 2014 17:27:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Since qt5 binaries are in separate subdir, add that to PATH
* Fix rcc binary name
* Fix qdbusxml2cpp name
* Fix tabs vs. spaces indentation
* Gracefully handle qt.conf creation/addition, in case it's already there
* Set HostPrefix in qt.conf just to be safe

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 classes/populate_sdk_qt5.bbclass | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
index 81a18af..3b849e9 100644
--- a/classes/populate_sdk_qt5.bbclass
+++ b/classes/populate_sdk_qt5.bbclass
@@ -7,6 +7,7 @@ TOOLCHAIN_TARGET_TASK += "packagegroup-qt5-toolchain-target"
 inherit qmake5_paths
 
 toolchain_create_sdk_env_script_append () {
+    echo 'export PATH=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}:$PATH' >> $script
     echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
     echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
     echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
@@ -18,20 +19,21 @@ toolchain_create_sdk_env_script_append () {
     echo 'export OE_QMAKE_INCDIR_QT=${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_HEADERS}' >> $script
     echo 'export OE_QMAKE_MOC=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/moc' >> $script
     echo 'export OE_QMAKE_UIC=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/uic' >> $script
-    echo 'export OE_QMAKE_RCC=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/rcc4' >> $script
+    echo 'export OE_QMAKE_RCC=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/rcc' >> $script
     echo 'export OE_QMAKE_QDBUSCPP2XML=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qdbuscpp2xml' >> $script
-    echo 'export OE_QMAKE_QDBUSXML2CPP=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/dbusxml2cpp' >> $script
+    echo 'export OE_QMAKE_QDBUSXML2CPP=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qdbusxml2cpp' >> $script
     echo 'export OE_QMAKE_QT_CONFIG=${SDKTARGETSYSROOT}${OE_QMAKE_PATH_LIBS}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
     echo 'export QMAKESPEC=${SDKTARGETSYSROOT}${OE_QMAKE_PATH_LIBS}/${QT_DIR_NAME}/mkspecs/linux-oe-g++' >> $script
     echo 'export QT_CONF_PATH=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf' >> $script
 
-	# make a symbolic link to mkspecs for compatibility with QTCreator
+    # make a symbolic link to mkspecs for compatibility with QTCreator
     (cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; \
          ln -sf ${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs mkspecs;)
 
-	# Generate a qt.conf file to be deployed with the SDK
-	qtconf=${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf
-	echo '[Paths]' > $qtconf
+    # Generate a qt.conf file to be deployed with the SDK
+    qtconf=${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf
+    touch $qtconf
+    echo '[Paths]' >> $qtconf
     echo 'Prefix = ${SDKTARGETSYSROOT}' >> $qtconf
     echo 'Headers = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_HEADERS}' >> $qtconf
     echo 'Libraries = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_LIBS}' >> $qtconf
@@ -47,5 +49,6 @@ toolchain_create_sdk_env_script_append () {
     echo 'Settings = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_SETTINGS}' >> $qtconf
     echo 'Examples = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_EXAMPLES}' >> $qtconf
     echo 'Tests = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_TESTS}' >> $qtconf
+    echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
     echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >> $qtconf
 }
-- 
1.8.3.2


