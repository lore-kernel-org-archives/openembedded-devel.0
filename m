Return-Path: <philip.balister@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 65843728A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 18:40:52 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 200so776788ykr.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 10:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=51IuNmHXs99+5gJ/cD1gEy1p/1kBIldQzWuRXCvbQC0=;
	b=LXAzLvqGFeSBro4wQuolbGIUhI7WW8NMhLgOO/hrwSTYmQEeLhwqndgGfO6IhxZjK6
	BZNleYKUbGW3OrfC01+MfjIhwsDa95gywWNWca0HJosWEq4CVqVnoYoyXQuKZG8t2SVs
	HF+yClUtDsAiumELlwnKFTJSK0e/cTxRQzycWZlnmdEI5QLSNBkP2CuTh8KUvejsOWBE
	9vCl/grw7TogYtrZEuOfK14AxwoFxV/DKtgF3IYCYYPEFJoKlUm1cka5ghkT+uDNdeJS
	zYrsE+VY/W0ALNSCPnlL3Bs/wdplvmxoMVR+FRGeRoNvdF0VQy3m56z/1Q+haihy+bRs
	Y8bQ==
X-Received: by 10.236.231.2 with SMTP id k2mr2927698yhq.161.1418928053385;
	Thu, 18 Dec 2014 10:40:53 -0800 (PST)
Received: from thuvia.localdomain (pool-71-171-45-99.ronkva.east.verizon.net.
	[71.171.45.99])
	by mx.google.com with ESMTPSA id o30sm4395036yha.37.2014.12.18.10.40.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 10:40:52 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 13:40:45 -0500
Message-Id: <1418928046-29624-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1418928046-29624-1-git-send-email-philip@balister.org>
References: <1418928046-29624-1-git-send-email-philip@balister.org>
Subject: [meta-oe][PATCHv3 2/3] python-pyqt : Update to 4.11.3.
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
X-List-Received-Date: Thu, 18 Dec 2014 18:41:00 -0000

The configure.py script now has support for cross compiling. This
simplified the recipe substantially.

The recipe was tested with gnuradio-companion on the zedboard and
ettus-e300. This is the first time we have been able to use grc with
pyqt built with OpenEmbedded.

Build tested on armv7, x86, x86_64 and mips.

Dropped patches from previous versions.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../python/python-pyqt-4.9.6/pyqt-generated.patch  |  12 -
 .../python-pyqt-4.9.6/qreal_float_support.diff     | 248 ---------------------
 .../recipes-devtools/python/python-pyqt_4.11.3.bb  |  54 +++++
 .../recipes-devtools/python/python-pyqt_4.9.6.bb   | 103 ---------
 4 files changed, 54 insertions(+), 363 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.patch
 delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_support.diff
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
 delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb

diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.patch b/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.patch
deleted file mode 100644
index 6579aa4..0000000
--- a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -uNr PyQt-x11-gpl-4.9.5.orig/QtGui/sipQtGuiQSystemTrayIcon.cpp PyQt-x11-gpl-4.9.5/QtGui/sipQtGuiQSystemTrayIcon.cpp
---- PyQt-x11-gpl-4.9.5.orig/QtGui/sipQtGuiQSystemTrayIcon.cpp	2012-10-01 16:48:16.496700577 +0200
-+++ PyQt-x11-gpl-4.9.5/QtGui/sipQtGuiQSystemTrayIcon.cpp	2012-10-01 21:40:43.063130099 +0200
-@@ -993,8 +993,6 @@
-         qtgui_untrack(sipCpp);
- #line 995 "QtGui/sipQtGuiQSystemTrayIcon.cpp"
- 
--    QSystemTrayIcon *sipCpp = reinterpret_cast<QSystemTrayIcon *>(sipCppV);
--
-     if (QThread::currentThread() == sipCpp->thread())
-         delete sipCpp;
-     else
diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_support.diff b/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_support.diff
deleted file mode 100644
index abdf70f..0000000
--- a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_support.diff
+++ /dev/null
@@ -1,248 +0,0 @@
-## 03_qreal_float_support.dpatch by Michael Casadevall <sonicmctails@gmail.com>
-Index: python-qt4-4.8.3/configure.py
-===================================================================
---- python-qt4-4.8.3.orig/configure.py	2011-02-24 10:33:30.000000000 +0200
-+++ python-qt4-4.8.3/configure.py	2011-02-24 10:33:18.000000000 +0200
-@@ -2004,8 +2004,9 @@
-     out << "PyQt_NoOpenGLES\\n";
- #endif
- 
--    if (sizeof (qreal) != sizeof (double))
-+#if defined(QT_NO_FPU) || defined(QT_ARCH_ARM) || defined(QT_ARCH_WINDOWSCE)
-         out << "PyQt_qreal_double\\n";
-+#endif
- 
-     return 0;
- }
-Index: python-qt4-4.8.3/sip/QtCore/qlist.sip
-===================================================================
---- python-qt4-4.8.3.orig/sip/QtCore/qlist.sip	2011-02-24 10:33:27.000000000 +0200
-+++ python-qt4-4.8.3/sip/QtCore/qlist.sip	2011-02-24 10:33:18.000000000 +0200
-@@ -811,3 +811,227 @@
-     return sipGetState(sipTransferObj);
- %End
- };
-+
-+// If we're on an architecture where qreal != double, then we need to also
-+// explicately handle doubles. On architectures where qreal == double, they
-+// will automaticially be cast upwards
-+
-+%If (!PyQt_qreal_double)
-+
-+%If (Qt_4_3_0 -)
-+// QList<QPair<double, double> > is implemented as a Python list of 2-element tuples.
-+%MappedType QList<QPair<double, double> >
-+{
-+%TypeHeaderCode
-+#include <qlist.h>
-+#include <qpair.h>
-+%End
-+
-+%ConvertFromTypeCode
-+    // Create the list.
-+    PyObject *l;
-+
-+    if ((l = PyList_New(sipCpp->size())) == NULL)
-+        return NULL;
-+
-+    // Set the list elements.
-+    for (int i = 0; i < sipCpp->size(); ++i)
-+    {
-+        const QPair<double, double> &p = sipCpp->at(i);
-+        PyObject *pobj;
-+
-+        if ((pobj = Py_BuildValue((char *)"dd", p.first, p.second)) == NULL)
-+        {
-+            Py_DECREF(l);
-+
-+            return NULL;
-+        }
-+
-+        PyList_SET_ITEM(l, i, pobj);
-+    }
-+
-+    return l;
-+%End
-+
-+%ConvertToTypeCode
-+    SIP_SSIZE_T len;
-+
-+    // Check the type if that is all that is required.
-+    if (sipIsErr == NULL)
-+    {
-+        if (!PySequence_Check(sipPy) || (len = PySequence_Size(sipPy)) < 0)
-+            return 0;
-+
-+        for (SIP_SSIZE_T i = 0; i < len; ++i)
-+        {
-+            PyObject *tup = PySequence_ITEM(sipPy, i);
-+
-+            if (!PySequence_Check(tup) || PySequence_Size(tup) != 2)
-+                return 0;
-+        }
-+
-+        return 1;
-+    }
-+
-+    QList<QPair<double, double> > *ql = new QList<QPair<double, double> >;
-+    len = PySequence_Size(sipPy);
-+ 
-+    for (SIP_SSIZE_T i = 0; i < len; ++i)
-+    {
-+        PyObject *tup = PySequence_ITEM(sipPy, i);
-+
-+        double first = PyFloat_AsDouble(PySequence_ITEM(tup, 0));
-+        double second = PyFloat_AsDouble(PySequence_ITEM(tup, 1));
-+ 
-+        ql->append(QPair<double, double>(first, second));
-+    }
-+ 
-+    *sipCppPtr = ql;
-+ 
-+    return sipGetState(sipTransferObj);
-+%End
-+};
-+%End
-+%If (Qt_4_3_0 -)
-+// QList<QPair<double, TYPE> > is implemented as a Python list of 2-element tuples.
-+template<double, TYPE>
-+%MappedType QList<QPair<double, TYPE> >
-+{
-+%TypeHeaderCode
-+#include <qlist.h>
-+#include <qpair.h>
-+%End
-+
-+%ConvertFromTypeCode
-+    // Create the list.
-+    PyObject *l;
-+
-+    if ((l = PyList_New(sipCpp->size())) == NULL)
-+        return NULL;
-+
-+    // Set the list elements.
-+    for (int i = 0; i < sipCpp->size(); ++i)
-+    {
-+        const QPair<double, TYPE> &p = sipCpp->at(i);
-+        TYPE *t = new TYPE(p.second);
-+        PyObject *pobj;
-+
-+        if ((pobj = sipBuildResult(NULL, "(dB)", p.first, t, sipClass_TYPE, sipTransferObj)) == NULL)
-+        {
-+            Py_DECREF(l);
-+            delete t;
-+
-+            return NULL;
-+        }
-+
-+        PyList_SET_ITEM(l, i, pobj);
-+    }
-+
-+    return l;
-+%End
-+
-+%ConvertToTypeCode
-+    SIP_SSIZE_T len;
-+
-+    // Check the type if that is all that is required.
-+    if (sipIsErr == NULL)
-+    {
-+        if (!PySequence_Check(sipPy) || (len = PySequence_Size(sipPy)) < 0)
-+            return 0;
-+
-+        for (SIP_SSIZE_T i = 0; i < len; ++i)
-+        {
-+            PyObject *tup = PySequence_ITEM(sipPy, i);
-+
-+            if (!PySequence_Check(tup) || PySequence_Size(tup) != 2)
-+                return 0;
-+
-+            if (!sipCanConvertToInstance(PySequence_ITEM(tup, 1), sipClass_TYPE, SIP_NOT_NONE))
-+                return 0;
-+        }
-+
-+        return 1;
-+    }
-+
-+    QList<QPair<double, TYPE> > *ql = new QList<QPair<double, TYPE> >;
-+    len = PySequence_Size(sipPy);
-+ 
-+    for (SIP_SSIZE_T i = 0; i < len; ++i)
-+    {
-+        PyObject *tup = PySequence_ITEM(sipPy, i);
-+        double d;
-+        int state;
-+
-+        d = PyFloat_AsDouble(PySequence_ITEM(tup, 0));
-+        TYPE *t = reinterpret_cast<TYPE *>(sipConvertToInstance(PySequence_ITEM(tup, 1), sipClass_TYPE, sipTransferObj, SIP_NOT_NONE, &state, sipIsErr));
-+ 
-+        if (*sipIsErr)
-+        {
-+            sipReleaseInstance(t, sipClass_TYPE, state);
-+
-+            delete ql;
-+            return 0;
-+        }
-+
-+        ql->append(QPair<double, TYPE>(d, *t));
-+
-+        sipReleaseInstance(t, sipClass_TYPE, state);
-+    }
-+ 
-+    *sipCppPtr = ql;
-+ 
-+    return sipGetState(sipTransferObj);
-+%End
-+};
-+%End
-+
-+// QList<double> is implemented as a Python list of doubles.
-+%MappedType QList<double>
-+{
-+%TypeHeaderCode
-+#include <qlist.h>
-+%End
-+
-+%ConvertFromTypeCode
-+    // Create the list.
-+    PyObject *l;
-+
-+    if ((l = PyList_New(sipCpp->size())) == NULL)
-+        return NULL;
-+
-+    // Set the list elements.
-+    for (int i = 0; i < sipCpp->size(); ++i)
-+    {
-+        PyObject *pobj;
-+
-+        if ((pobj = PyFloat_FromDouble(sipCpp->value(i))) == NULL)
-+        {
-+            Py_DECREF(l);
-+
-+            return NULL;
-+        }
-+
-+        PyList_SET_ITEM(l, i, pobj);
-+    }
-+
-+    return l;
-+%End
-+
-+%ConvertToTypeCode
-+    // Check the type if that is all that is required.
-+    if (sipIsErr == NULL)
-+        return (PySequence_Check(sipPy) && PySequence_Size(sipPy) >= 0);
-+
-+    QList<double> *ql = new QList<double>;
-+    SIP_SSIZE_T len = PySequence_Size(sipPy);
-+ 
-+    for (SIP_SSIZE_T i = 0; i < len; ++i)
-+        ql->append(PyFloat_AsDouble(PySequence_ITEM(sipPy, i)));
-+ 
-+    *sipCppPtr = ql;
-+ 
-+    return sipGetState(sipTransferObj);
-+%End
-+};
-+
-+%End
diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
new file mode 100644
index 0000000..140456e
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
@@ -0,0 +1,54 @@
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
+DEPENDS = "sip sip-native qt4-x11-free python"
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
+DISABLED_FEATURES = "PyQt_Desktop_OpenGL PyQt_Accessibility PyQt_SessionManager"
+
+DISABLED_FEATURES_append_arm = " PyQt_qreal_double"
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
+    echo "pyqt_disabled_features = ${DISABLED_FEATURES}" >> pyqt.cfg
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
2.1.0


