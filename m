Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id BCA8271826
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Oct 2014 21:54:26 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so1096993ykb.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Oct 2014 14:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=T0QpOCBOLMzd676dpk3iKgzd/zgiEnG/l/b9gBKpHBQ=;
	b=sDhc5+ITcAPo2usQuixshI4+SE5SlEKbnS67eVMs39qlz/r28lMNAhVy6tFm3tK4HY
	xkRCFfuwpLnXK8dobns2YMYLQdelTKwDaYISpG8jJAZqiU9b6nbS0JXSBX7ZTl4iwdK3
	lAE1f1OkE4r393JgKRiPH3c8IT5RGcZcXlhY5ihSkN8S0X8MrBVBqMC/7C7rzXTyUW0J
	BWOqKsDhfCtp6i/jvLZsv1eYuNOQAqwEHb/KRBqtTm1DRjAMfV0nzh7PLj7ZQ56L33vX
	LKcK1lngJnlCWv57WrpQtIyoJUk1nhYzy/Z3LyU1vYsNOkmue4qFF3m4T2ny/Dwr7Ugm
	bEWg==
X-Received: by 10.236.54.101 with SMTP id h65mr1195584yhc.47.1412891667614;
	Thu, 09 Oct 2014 14:54:27 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id o38sm2042306yhp.34.2014.10.09.14.54.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Oct 2014 14:54:26 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu,  9 Oct 2014 18:54:13 -0300
Message-Id: <1412891653-9678-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH] Fix SDK environment setting
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
X-List-Received-Date: Thu, 09 Oct 2014 21:54:27 -0000

Since the change to use a meta-environment canadian package in the
OE-Core, the SDK environment setting has been broken. This uses the
new subscript environment to fix it and also move the environment
generation to the nativesdk-qtbase recipe.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/populate_sdk_qt5.bbclass    |   21 +--------------------
 recipes-qt/qt5/nativesdk-qtbase.inc |   30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
index 7b31bbb..79df489 100644
--- a/classes/populate_sdk_qt5.bbclass
+++ b/classes/populate_sdk_qt5.bbclass
@@ -6,26 +6,7 @@ TOOLCHAIN_TARGET_TASK += "packagegroup-qt5-toolchain-target"
 # This allow reuse of Qt paths
 inherit qmake5_paths
 
-toolchain_create_sdk_env_script_append () {
-    echo 'export PATH=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}:$PATH' >> $script
-    echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
-    echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
-    echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
-    echo 'export OE_QMAKE_CC=$CC' >> $script
-    echo 'export OE_QMAKE_CXX=$CXX' >> $script
-    echo 'export OE_QMAKE_LINK=$CXX' >> $script
-    echo 'export OE_QMAKE_AR=$AR' >> $script
-    echo 'export OE_QMAKE_LIBDIR_QT=${SDKTARGETSYSROOT}${OE_QMAKE_PATH_LIBS}' >> $script
-    echo 'export OE_QMAKE_INCDIR_QT=${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_HEADERS}' >> $script
-    echo 'export OE_QMAKE_MOC=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/moc' >> $script
-    echo 'export OE_QMAKE_UIC=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/uic' >> $script
-    echo 'export OE_QMAKE_RCC=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/rcc' >> $script
-    echo 'export OE_QMAKE_QDBUSCPP2XML=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qdbuscpp2xml' >> $script
-    echo 'export OE_QMAKE_QDBUSXML2CPP=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qdbusxml2cpp' >> $script
-    echo 'export OE_QMAKE_QT_CONFIG=${SDKTARGETSYSROOT}${OE_QMAKE_PATH_LIBS}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
-    echo 'export QMAKESPEC=${SDKTARGETSYSROOT}${OE_QMAKE_PATH_LIBS}/${QT_DIR_NAME}/mkspecs/linux-oe-g++' >> $script
-    echo 'export QT_CONF_PATH=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf' >> $script
-
+create_sdk_files_prepend () {
     # make a symbolic link to mkspecs for compatibility with QTCreator
     (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; \
          ln -sf ${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs mkspecs;)
diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index e3b2863..889c3a9 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -43,6 +43,7 @@ FILES_${PN}-tools-dev = " \
     ${includedir} \
     ${FILES_SOLIBSDEV} ${libdir}/*.la \
     ${OE_QMAKE_PATH_ARCHDATA}/mkspecs \
+    ${SDKPATHNATIVE}/environment-setup.d \
 "
 
 FILES_${PN}-tools-staticdev = " \
@@ -219,3 +220,32 @@ do_install() {
                                    -not -name 'libQt5Bootstrap.a' \
                                    -exec rm '{}' ';'
 }
+
+do_generate_qt_environment_file() {
+    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d/
+    script=${D}${SDKPATHNATIVE}/environment-setup.d/qt5.sh
+
+    echo 'export PATH=${OE_QMAKE_PATH_HOST_BINS}:$PATH' > $script
+    echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
+    echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
+    echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
+    echo 'export OE_QMAKE_CC=$CC' >> $script
+    echo 'export OE_QMAKE_CXX=$CXX' >> $script
+    echo 'export OE_QMAKE_LINK=$CXX' >> $script
+    echo 'export OE_QMAKE_AR=$AR' >> $script
+    echo 'export QT_CONF_PATH=${OE_QMAKE_PATH_HOST_BINS}/qt.conf' >> $script
+    echo 'export OE_QMAKE_LIBDIR_QT=`qmake -query QT_INSTALL_LIBS`' >> $script
+    echo 'export OE_QMAKE_INCDIR_QT=`qmake -query QT_INSTALL_HEADERS`' >> $script
+    echo 'export OE_QMAKE_MOC=${OE_QMAKE_PATH_HOST_BINS}/moc' >> $script
+    echo 'export OE_QMAKE_UIC=${OE_QMAKE_PATH_HOST_BINS}/uic' >> $script
+    echo 'export OE_QMAKE_RCC=${OE_QMAKE_PATH_HOST_BINS}/rcc' >> $script
+    echo 'export OE_QMAKE_QDBUSCPP2XML=${OE_QMAKE_PATH_HOST_BINS}/qdbuscpp2xml' >> $script
+    echo 'export OE_QMAKE_QDBUSXML2CPP=${OE_QMAKE_PATH_HOST_BINS}/qdbusxml2cpp' >> $script
+    echo 'export OE_QMAKE_QT_CONFIG=${OE_QMAKE_PATH_TARGET_LIBS}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
+    echo 'export QMAKESPEC=`qmake -query QT_INSTALL_LIBS`/mkspecs/linux-oe-g++' >> $script
+
+    # Use relocable sysroot
+    sed -i -e 's:${SDKPATHNATIVE}:$OECORE_NATIVE_SYSROOT:g' $script
+}
+
+addtask generate_qt_environment_file after do_install before do_package
-- 
1.7.10.4


