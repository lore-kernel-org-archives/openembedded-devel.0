Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id E47276E8FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 14:16:31 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2014 15:16:27 +0100
Message-Id: <1390918587-16260-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <20140122190949.GX4100@jama>
References: <20140122190949.GX4100@jama>
Subject: [meta-oe][PATCH v2] libconnman-qt: update to 1.0.46, add recipe for qte
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
X-List-Received-Date: Tue, 28 Jan 2014 14:16:33 -0000

* Use _git version suffix, because it really is a Git recipe.
* Create an inc file to be shared between qt4x11 and qt4e.
* Use CONFIG+=notests, because CONFIG+=notest has no effect now.
* Reorder some variables according to style guide.
* Remove unneeded PROVIDES for ${PN}-plugin, which is already listed
  in PACKAGES.
* Hardcode branch to master, because no other branch exists upstream.
* Simplify do_install.
* Don't overwrite EXTRA_QMAKEVARS_PRE (set by qt4e.bbclass).
* Generalize QT_IMPORTS_DIR.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
v2: Append to EXTRA_QMAKEVARS_PRE, fix QT_IMPORTS_DIR.

 .../{libconnman-qt_1.0.7.bb => libconnman-qt.inc}  | 61 +++++++++-------------
 .../recipes-qt/libconnman-qt/libconnman-qt_git.bb  |  3 ++
 .../recipes-qt/libconnman-qt/libconnman-qte_git.bb |  3 ++
 3 files changed, 30 insertions(+), 37 deletions(-)
 rename meta-oe/recipes-qt/libconnman-qt/{libconnman-qt_1.0.7.bb => libconnman-qt.inc} (62%)
 create mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qt_git.bb
 create mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qte_git.bb

diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
similarity index 62%
rename from meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
rename to meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
index 2288c4f..77e70e8 100644
--- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
+++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
@@ -1,66 +1,53 @@
 DESCRIPTION = "Qt Library for ConnMan"
 HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
+SECTION = "qt/lib"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
+SRCREV = "ddbeaf72b4d3c49285b0513b28948edacfc40b51"
+PV = "1.0.46+git${SRCPV}"
 
-SECTION = "qt/lib"
-
-
-inherit qt4x11 pkgconfig
-
-RDEPENDS_${PN} = "connman"
-RDEPENDS_${PN}-plugin = "${PN}"
-
-PROVIDES += "${PN}-plugin"
-
-PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
-RRECOMMENDS_${PN} = "${PN}-plugin"
-
-BRANCH = "master"
-SRCREV = "6a5e4f981112a90a8c19d82bd671da389d2af993"
-
-SRC_URI = " \
-    git://github.com/nemomobile/${PN}.git;branch=${BRANCH} \
-"
+SRC_URI = "git://github.com/nemomobile/libconnman-qt.git;branch=master"
 
 S = "${WORKDIR}/git"
 
-QT_IMPORTS_DIR = "${libdir}/qt4/imports"
-# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
-PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
+inherit pkgconfig
 
-EXTRA_QMAKEVARS_PRE = " \
-    CONFIG+=notest \
-"
+EXTRA_QMAKEVARS_PRE += "CONFIG+=notests"
 
 do_configure_prepend() {
     # Hack *.pro variables
     find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
 }
-
 do_install() {
-    export INSTALL_ROOT=${D}
-    oe_runmake install
+    oe_runmake install INSTALL_ROOT=${D}
 }
 
+PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
+
+RDEPENDS_${PN} = "connman"
+RDEPENDS_${PN}-plugin = "${PN}"
+
+RRECOMMENDS_${PN} = "${PN}-plugin"
+
 FILES_${PN} = " \
-    ${libdir}/libconnman-qt4${SOLIBS} \
+    ${libdir}/libconnman-qt*${SOLIBS} \
 "
-
 FILES_${PN}-dev = " \
-    ${includedir}/connman-qt/* \
-    ${libdir}/libconnman-qt4${SOLIBSDEV} \
-    ${libdir}/libconnman-qt4.prl \
-    ${libdir}/pkgconfig/connman-qt4.pc \
-    ${libdir}/connman-qt4.pc \
+    ${includedir}/connman-qt*/* \
+    ${libdir}/libconnman-qt*${SOLIBSDEV} \
+    ${libdir}/libconnman-qt*.prl \
+    ${libdir}/pkgconfig/connman-qt*.pc \
+    ${libdir}/connman-qt*.pc \
 "
-
 FILES_${PN}-plugin = " \
     ${PLUGINS_TARGET}/qmldir \
     ${PLUGINS_TARGET}/lib*.so \
 "
-
 FILES_${PN}-plugin-dbg = " \
     ${PLUGINS_TARGET}/.debug \
     ${PLUGINS_TARGET}/.debug/* \
 "
+
+QT_IMPORTS_DIR = "${libdir}/${QT_DIR_NAME}/imports"
+# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
+PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_git.bb b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_git.bb
new file mode 100644
index 0000000..8d8822c
--- /dev/null
+++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_git.bb
@@ -0,0 +1,3 @@
+inherit qt4x11
+
+require libconnman-qt.inc
diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qte_git.bb b/meta-oe/recipes-qt/libconnman-qt/libconnman-qte_git.bb
new file mode 100644
index 0000000..7ee4bdb
--- /dev/null
+++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qte_git.bb
@@ -0,0 +1,3 @@
+inherit qt4e
+
+require libconnman-qt.inc
-- 
1.8.3.2


