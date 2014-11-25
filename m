Return-Path: <philip.balister@gmail.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id B7060714D7
	for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2014 16:09:40 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id c9so655118qcz.5
	for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2014 08:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=edy5jM2ITeUMq9zt7CqqMpWnYxW7aOreCmMOH4r5T8M=;
	b=pgiIqoKlbs5sPvpciEvurDHbgTzwYR14hBSjfBSK4yxoqDWN6iA5HGEn36VuTml+11
	RNT5ZLWQZFaCTIH68Jszmzwtn2kEWj5NGmA7bZhN2sLsN1IJC2j2vMQY5FO3Yg4q5y4e
	m957X7QVVvgA7aD3bnAepWDXBHoM7kqm5QT2Nqj+CmReCFGImgmLC65jEuZ7YYVDP+4w
	y2vGCMM8dXWiTJGNNvaz91d5/ncNlqCIvj/hGy5EhBhayHFwSWpDYkAlWxEoD/EMjrLw
	HnkCIImQMucCfG1aGkgz8YbMOgx7GmbiM6mvmPdcUyrfOuajU0mQZG7ymSEGD+9oaoGG
	ycSw==
X-Received: by 10.229.79.132 with SMTP id p4mr38016161qck.14.1416931781452;
	Tue, 25 Nov 2014 08:09:41 -0800 (PST)
Received: from localhost.localdomain
	(pool-71-171-45-99.ronkva.east.verizon.net. [71.171.45.99])
	by mx.google.com with ESMTPSA id i1sm1421828qaz.28.2014.11.25.08.09.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Nov 2014 08:09:40 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@openembedded.org
Date: Tue, 25 Nov 2014 11:09:35 -0500
Message-Id: <1416931776-13600-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1416931776-13600-1-git-send-email-philip@balister.org>
References: <1416931776-13600-1-git-send-email-philip@balister.org>
Subject: [meta-oe][PATCH 2/3] python-pyqt : Update to 4.11.3.
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
X-List-Received-Date: Tue, 25 Nov 2014 16:09:46 -0000

The configure.py script now has support for cross compiling. This
simplified the recipe substantially.

The recipe was tested with gnuradio-companion on the zedboard and
ettus-e300. This is the first time we have been able to use grc with
pyqt built with OpenEmbedded.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../recipes-devtools/python/python-pyqt_4.11.3.bb  |  50 ++++++++++
 .../recipes-devtools/python/python-pyqt_4.9.6.bb   | 103 ---------------------
 2 files changed, 50 insertions(+), 103 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
 delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb

diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
new file mode 100644
index 0000000..5ced2ad
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
@@ -0,0 +1,50 @@
+SUMMARY = "Python Qt4 Bindings"
+AUTHOR = "Phil Thomson @ riverbank.co.uk"
+HOMEPAGE = "http://riverbankcomputing.co.uk"
+SECTION = "devel/python"
+LICENSE = "GPLv2 & GPLv3 & GPL_EXCEPTION"
+LIC_FILES_CHKSUM = "\
+    file://GPL_EXCEPTION.TXT;md5=b73b0be471db679533dc94781c14af58 \
+    file://GPL_EXCEPTION_ADDENDUM.TXT;md5=c1e04ec2aa0911061005a801abf81e40 \
+    file://OPENSOURCE-NOTICE.TXT;md5=6ad9123620cc04a22c394753ad4767d7 \
+    file://LICENSE.GPL2;md5=577ff65f6653562af318bfc3944b1f20 \
+    file://LICENSE.GPL3;md5=feee51612c3c1191a1d5f41156fa2c75 \
+"
+DEPENDS = "sip sip-native qt4-x11-free"
+
+SRC_URI = "\
+    ${SOURCEFORGE_MIRROR}/pyqt/PyQt-x11-gpl-${PV}.tar.gz \
+"
+SRC_URI[md5sum] = "997c3e443165a89a559e0d96b061bf70"
+SRC_URI[sha256sum] = "853780dcdbe2e6ba785d703d059b096e1fc49369d3e8d41a060be874b8745686"
+
+S = "${WORKDIR}/PyQt-x11-gpl-${PV}"
+
+PARALLEL_MAKE = ""
+
+inherit qmake2 pythonnative python-dir
+
+do_configure() {
+    echo "py_platform = linux" > pyqt.cfg
+    echo "py_inc_dir = %(sysroot)/$includedir/python%(py_major).%(py_minor)" >> pyqt.cfg
+    echo "py_pylib_dir = %(sysroot)/${libdir}/python%(py_major).%(py_minor)" >> pyqt.cfg
+    echo "py_pylib_lib = python%(py_major).%(py_minor)mu" >> pyqt.cfg
+    echo "pyqt_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> pyqt.cfg
+    echo "pyqt_bin_dir = ${D}/${bindir}" >> pyqt.cfg
+    echo "pyqt_sip_dir = ${D}/${datadir}/sip/PyQt4" >> pyqt.cfg
+    echo "pyuic_interpreter = ${D}/${bindir}/python%(py_major).%(py_minor)" >> pyqt.cfg
+    echo "pyqt_disabled_features = PyQt_Desktop_OpenGL PyQt_qreal_double PyQt_Accessibility PyQt_SessionManager" >> pyqt.cfg
+    echo "qt_shared = True" >> pyqt.cfg
+    echo "[Qt 4.8]" >> pyqt.cfg
+    echo "pyqt_modules = QtCore QtGui QtDeclarative QtNetwork QtSvg QtWebKit" >> pyqt.cfg
+    echo yes | python configure-ng.py --verbose --qmake  ${STAGING_BINDIR_NATIVE}/qmake2 --configuration pyqt.cfg --sysroot ${STAGING_DIR_HOST}
+}
+do_install() {
+     oe_runmake install
+}
+
+RDEPENDS_${PN} = "python-core"
+
+FILES_${PN} += "${libdir}/${PYTHON_DIR}/site-packages ${datadir}/sip/PyQt4/"
+FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/*/.debug/"
+
diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb b/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
deleted file mode 100644
index 2f0e189..0000000
--- a/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
+++ /dev/null
@@ -1,103 +0,0 @@
-SUMMARY = "Python Qt4 Bindings"
-HOMEPAGE = "http://riverbankcomputing.co.uk"
-AUTHOR = "Phil Thomson @ riverbank.co.uk"
-SECTION = "devel/python"
-LICENSE = "GPLv2 & GPLv3 & GPL_EXCEPTION"
-LIC_FILES_CHKSUM = "\
-    file://GPL_EXCEPTION.TXT;md5=b73b0be471db679533dc94781c14af58 \
-    file://GPL_EXCEPTION_ADDENDUM.TXT;md5=c1e04ec2aa0911061005a801abf81e40 \
-    file://OPENSOURCE-NOTICE.TXT;md5=6ad9123620cc04a22c394753ad4767d7 \
-    file://LICENSE.GPL2;md5=276c6b9cad5f85a3af3534299825feff \
-    file://LICENSE.GPL3;md5=eda942b9c6ba7eb0f40fee79e94950d5 \
-"
-
-DEPENDS = "sip-native python-sip"
-RDEPENDS_${PN} = "python-core"
-
-PYQT_OE_VERSION = "Qt_4_8_3"
-PR = "r1"
-
-SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/pyqt/PyQt-x11-gpl-${PV}.tar.gz \
-    file://pyqt-generated.patch;apply=no \
-"
-SRC_URI[md5sum] = "514e1f9597771dc732ba75ba9fa5c6b6"
-SRC_URI[sha256sum] = "a350f9e5c6d8062671c0f29bf1a70824719b18175ce8372c29bf7c1eda44b18d"
-S = "${WORKDIR}/PyQt-x11-gpl-${PV}"
-
-# arm and mips machines need some extra patches
-SRC_URI_append_arm = "\
-    file://qreal_float_support.diff \
-"
-
-SRC_URI_append_mipsel = "\
-    file://qreal_float_support.diff \
-"
-
-inherit qt4x11 sip distutils-base
-
-PARALLEL_MAKE = ""
-
-QMAKE_PROFILES = "pyqt.pro"
-# NOTE: has to match with MIN(qt version we have in OE, last known Qt version by SIP/PyQt)
-EXTRA_SIPTAGS = "-tWS_X11 -t${PYQT_OE_VERSION} -xVendorID -xPyQt_SessionManager -xPyQt_Accessibility"
-EXTRA_OEMAKE = " MAKEFLAGS= "
-
-# arm and mips need extra params for the qreal issue
-EXTRA_SIPTAGS_append_arm = " -x PyQt_qreal_double"
-EXTRA_SIPTAGS_append_mipsel = " -x PyQt_qreal_double" 
-
-SIP_MODULES = "QtCore QtDeclarative QtGui QtNetwork QtSql QtSvg QtXml QtWebKit"
-MAKE_MODULES = "qpy ${SIP_MODULES}"
-
-EXTRA_QMAKEVARS_POST += "\
-    INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/Qt \
-    INCLUDEPATH+=${STAGING_INCDIR}/${PYTHON_DIR} \
-    INCLUDEPATH+=../qpy/QtCore \
-    INCLUDEPATH+=../qpy/QtGui \
-    INCLUDEPATH+=../qpy/QtDeclarative \
-    INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtCore \
-    INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtGui \
-    INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtDeclarative \
-    INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtWebKit \
-    INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtNetwork \
-"
-FIX_QREAL = "\
-"
-
-do_generate_prepend() {
-    for i in ${FIX_QREAL}; do
-        sed -i -e s,qreal,float,g sip/$i
-    done
-}
-
-do_configure_prepend() {
-    printf "TEMPLATE=subdirs\nSUBDIRS=${MAKE_MODULES}\n" >pyqt.pro
-    printf "TEMPLATE=subdirs\nSUBDIRS=QtCore QtDeclarative QtGui\n" >qpy/qpy.pro
-    ln -sf ./qpycore.pro qpy/QtCore/QtCore.pro
-    ln -sf ./qpydeclarative.pro qpy/QtDeclarative/QtDeclarative.pro
-    ln -sf ./qpygui.pro qpy/QtGui/QtGui.pro
-    echo "INCLUDEPATH+=${S}/QtCore" >>qpy/QtCore/QtCore.pro
-    echo "INCLUDEPATH+=${S}/QtGui" >>qpy/QtGui/QtGui.pro
-    echo "INCLUDEPATH+=${S}/QtDeclarative" >>qpy/QtDeclarative/QtDeclarative.pro
-    echo "LIBS+=-L../qpy/QtGui/ -lqpygui" >>QtGui/QtGui.pro
-    echo "LIBS+=-L../qpy/QtCore/ -lqpycore" >>QtCore/QtCore.pro
-    echo "LIBS+=-L../qpy/QtDeclarative/ -lqpydeclarative" >>QtDeclarative/QtDeclarative.pro
-    # hack for broken generated code (duplicated sipCpp declaration).
-    patch -p1 < ${WORKDIR}/pyqt-generated.patch || echo "pyqt-generated.patch failed to apply, probably reexecuting do_configure, ignoring that"
-}
-
-do_install() {
-    install -d ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4
-    install -d ${D}${datadir}/sip/qt/
-    for module in ${SIP_MODULES}
-    do
-        install -m 0644 ${S}/sip/${module}/*.sip ${D}${datadir}/sip/qt/
-        echo "from PyQt4.${module} import *\n" >> ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/Qt.py
-        install -m 0755 ${module}/lib${module}.so ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/${module}.so
-    done
-    cp -pPR elementtree ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
-    cp __init__.py ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
-}
-
-FILES_${PN} = "${libdir}/${PYTHON_DIR}/site-packages ${datadir}/sip/qt/"
-- 
1.8.3.1


