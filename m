Received: from [128.178.224.219] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MHYQY-0003YH-Rk
	for openembedded-devel@openembedded.org; Fri, 19 Jun 2009 09:22:23 +0200
Received: (qmail 12916 invoked by uid 107); 19 Jun 2009 07:11:43 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Fri, 19 Jun 2009 09:11:43 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Jun 2009 09:11:39 +0200
Message-Id: <1245395499-27720-1-git-send-email-valentin.longchamp@epfl.ch>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1245344614-22213-2-git-send-email-valentin.longchamp@epfl.ch>
References: <1245344614-22213-2-git-send-email-valentin.longchamp@epfl.ch>
Subject: [PATCH] changed all needed recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Jun 2009 07:22:23 -0000


Signed-off-by: Valentin Longchamp <valentin.longchamp@epfl.ch>
---
 classes/qt4e.bbclass               |    2 +-
 classes/qt4x11.bbclass             |    2 +-
 recipes/mythtv/mythtv_0.18.1.bb    |    2 +-
 recipes/mythtv/mythtv_0.20.bb      |    2 +-
 recipes/mythtv/mythtv_svn.bb       |    2 +-
 recipes/qt4/qt4-tools-sdk_4.5.1.bb |    3 +--
 recipes/qt4/qt4.inc                |    6 +++---
 recipes/webkit/webkit.inc          |    6 +++---
 8 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/classes/qt4e.bbclass b/classes/qt4e.bbclass
index f72e06b..54fdb1d 100644
--- a/classes/qt4e.bbclass
+++ b/classes/qt4e.bbclass
@@ -1,5 +1,5 @@
 DEPENDS_prepend = "${@["qt4-embedded ", ""][(bb.data.getVar('PN', d, 1) == 'qt4-embedded')]}"
-inherit qmake2
+inherit qmake4
 
 QT_DIR_NAME = "qtopia"
 QT_LIBINFIX = "E"
diff --git a/classes/qt4x11.bbclass b/classes/qt4x11.bbclass
index 923717f..99069b2 100644
--- a/classes/qt4x11.bbclass
+++ b/classes/qt4x11.bbclass
@@ -1,6 +1,6 @@
 DEPENDS_prepend = "${@["qt4x11 ", ""][(bb.data.getVar('PN', d, 1) == 'qt4-x11-free')]}"
 
-inherit qmake2
+inherit qmake4
 
 # Qt4 uses atomic instructions not supported in thumb mode
 ARM_INSTRUCTION_SET = "arm"
diff --git a/recipes/mythtv/mythtv_0.18.1.bb b/recipes/mythtv/mythtv_0.18.1.bb
index 2d3f55c..7dfa60f 100644
--- a/recipes/mythtv/mythtv_0.18.1.bb
+++ b/recipes/mythtv/mythtv_0.18.1.bb
@@ -1,6 +1,6 @@
 require mythtv.inc
 
-inherit qmake2 qt3x11
+inherit qmake4 qt3x11
 
 PR = "r2"
 
diff --git a/recipes/mythtv/mythtv_0.20.bb b/recipes/mythtv/mythtv_0.20.bb
index 467ed51..758b9b5 100644
--- a/recipes/mythtv/mythtv_0.20.bb
+++ b/recipes/mythtv/mythtv_0.20.bb
@@ -1,6 +1,6 @@
 require mythtv.inc
 
-inherit qmake2 qt3x11
+inherit qmake4 qt3x11
 
 DEPENDS += "openchrome"
 PR = "r1"
diff --git a/recipes/mythtv/mythtv_svn.bb b/recipes/mythtv/mythtv_svn.bb
index 83ce825..b90293d 100644
--- a/recipes/mythtv/mythtv_svn.bb
+++ b/recipes/mythtv/mythtv_svn.bb
@@ -1,6 +1,6 @@
 require mythtv.inc
 
-inherit qmake2 qt4x11
+inherit qmake4 qt4x11
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/qt4/qt4-tools-sdk_4.5.1.bb b/recipes/qt4/qt4-tools-sdk_4.5.1.bb
index db919fd..7c7e077 100644
--- a/recipes/qt4/qt4-tools-sdk_4.5.1.bb
+++ b/recipes/qt4/qt4-tools-sdk_4.5.1.bb
@@ -63,8 +63,7 @@ do_compile() {
 
 do_stage() {
     install -d ${STAGING_BINDIR_NATIVE}/
-    install -m 0755 bin/qmake ${STAGING_BINDIR_NATIVE}/qmake2
-    for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
+    for i in qmake moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
         install -m 0755 bin/${i} ${STAGING_BINDIR_NATIVE}/${i}4
     done
 }
diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index f5da652..a7209e6 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -14,7 +14,7 @@ QT_CONFIG_FLAGS += "-release -no-cups -no-accessibility -reduce-relocations \
 
 EXTRA_OEMAKE = "-e"
 
-EXTRA_ENV = 'QMAKE="${STAGING_BINDIR_NATIVE}/qmake2 -after \
+EXTRA_ENV = 'QMAKE="${STAGING_BINDIR_NATIVE}/qmake4 -after \
              INCPATH+=${STAGING_INCDIR}/freetype2 LIBS+=-L${STAGING_LIBDIR}" \
              QMAKESPEC="${QMAKESPEC}" LINK="${CXX} -Wl,-rpath-link,${STAGING_LIBDIR}" \
              AR="${TARGET_PREFIX}ar cqs" \
@@ -105,7 +105,7 @@ FILES_${QT_BASE_NAME}-mkspecs              = "${datadir}/${QT_DIR_NAME}/mkspecs/
 do_configure() {
     unset QMAKESPEC
     unset QTDIR
-    ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
+    ln -sf ${STAGING_BINDIR_NATIVE}/qmake4 bin/qmake
     ln -sf linux-g++ mkspecs/${TARGET_OS}-oe-g++
     cp -f ${WORKDIR}/g++.conf ${WORKDIR}/linux.conf mkspecs/common/
 
@@ -280,7 +280,7 @@ do_stage() {
 
     # FIXME: install symlinks to tools?
     #install -d ${STAGING_DATADIR}/${QT_DIR_NAME}/bin
-    #ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 ${STAGING_DATADIR}/${QT_DIR_NAME}/bin/qmake
+    #ln -sf ${STAGING_BINDIR_NATIVE}/qmake4 ${STAGING_DATADIR}/${QT_DIR_NAME}/bin/qmake
     #for qttool in moc uic uic3 rcc lrelease lupdate; do
     #     ln -sf ${STAGING_BINDIR_NATIVE}/${qttool}4 ${STAGING_DATADIR}/${QT_DIR_NAME}/bin/${qttool}
     #done
diff --git a/recipes/webkit/webkit.inc b/recipes/webkit/webkit.inc
index 087115d..0fd0c4e 100644
--- a/recipes/webkit/webkit.inc
+++ b/recipes/webkit/webkit.inc
@@ -7,7 +7,7 @@ PACKAGES =+ "${PN}launcher-dbg ${PN}launcher"
 # Yes, this is wrong...
 PV = "0.1+svnr${SRCREV}"
 
-inherit qmake2 pkgconfig
+inherit qmake4 pkgconfig
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=JavaScriptCore;proto=http \
@@ -23,10 +23,10 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/"
 
-WEBKIT_QMAKE = "qmake2 -spec ${QMAKESPEC} -r OUTPUT_DIR=$PWD/ ${WEBKIT_EXTRA_OPTIONS} CONFIG+=${WEBKIT_PORT}"
+WEBKIT_QMAKE = "qmake4 -spec ${QMAKESPEC} -r OUTPUT_DIR=$PWD/ ${WEBKIT_EXTRA_OPTIONS} CONFIG+=${WEBKIT_PORT}"
 
 do_configure() {
-	qmake2 -spec ${QMAKESPEC} CONFIG+=${WEBKIT_PORT} ${WEBKIT_EXTRA_OPTIONS} CONFIG-=release CONFIG+=debug
+	qmake4 -spec ${QMAKESPEC} CONFIG+=${WEBKIT_PORT} ${WEBKIT_EXTRA_OPTIONS} CONFIG-=release CONFIG+=debug
 	mkdir -p WebKitBuilds/Debug
 	cd WebKitBuilds/Debug
 	PWD=`pwd` ${WEBKIT_QMAKE}  WEBKIT_INC_DIR=${prefix}/include WEBKIT_LIB_DIR=${libdir} $PWD/../../WebKit.pro
-- 
1.6.0.4



