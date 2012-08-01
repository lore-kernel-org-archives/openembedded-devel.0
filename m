Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwhU9-00067E-9w
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 00:33:45 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so3911624wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2012 15:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=56RNRpOt1kiVyS6yzeGQabjS4QFpuTYy0Q1qbJDjGgo=;
	b=GiF3PUnvazyPveXxDvkb7xB6C2BuvcD0tDNJt/xijf9d5ytl4eXzgjCKFrNfJfYgn2
	ggsLX/Hh4ZML49L4tuwnwH7cudo8+/LWaXYgsSnVdSyeLB+d8X5DEbHFyp2BPaqcW0d+
	e4vudQkykwBYzQ75YcIjrVBnFgy/3tdVnJrxNEaPVgsnx/altxWt5SpiwHMSUDVVLAtP
	dr135guNAIGwG8+nR6y5jrAchKG3qHx/V/w4ViicWbmLSkQnwl/veabKA/eATIfP/HBE
	5IxrH+wRipa3VhMUA38ZTVSdpbaQW+mc34RjRmNkmPrKYAHk/MOVypRGJkIDEuSSfl+c
	agKw==
Received: by 10.216.30.136 with SMTP id k8mr331363wea.103.1343859728708;
	Wed, 01 Aug 2012 15:22:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm30243925wib.2.2012.08.01.15.22.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 15:22:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2012 00:21:04 +0200
Message-Id: <492fb799c89dd212f7bc01e9880a8f79843ffc97.1343859304.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 7/8] python-pyqt: import from oe-classic
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
X-List-Received-Date: Wed, 01 Aug 2012 22:33:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python-pyqt-4.8.4/assistantclient-fix.patch    |   13 +
 .../python/python-pyqt-4.8.4/fix_qthelp_ftbfs.diff |   15 ++
 .../python-pyqt-4.8.4/fix_the_QAssitant_ftbfs.diff |   29 +++
 .../python/python-pyqt-4.8.4/pyqt-generated.patch  |   24 ++
 .../python-pyqt-4.8.4/qreal_float_support.diff     |  248 ++++++++++++++++++++
 .../recipes-devtools/python/python-pyqt_4.8.4.bb   |  115 +++++++++
 6 files changed, 444 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.8.4/assistantclient-fix.patch
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.8.4/fix_qthelp_ftbfs.diff
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.8.4/fix_the_QAssitant_ftbfs.diff
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.8.4/pyqt-generated.patch
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.8.4/qreal_float_support.diff
 create mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.8.4.bb

diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/assistantclient-fix.patch b/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/assistantclient-fix.patch
new file mode 100644
index 0000000..15f83d2
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/assistantclient-fix.patch
@@ -0,0 +1,13 @@
+Index: PyQt-x11-gpl-4.8.3/sip/QtAssistant/qassistantclient.sip
+===================================================================
+--- PyQt-x11-gpl-4.8.3.orig/sip/QtAssistant/qassistantclient.sip
++++ PyQt-x11-gpl-4.8.3/sip/QtAssistant/qassistantclient.sip
+@@ -33,7 +33,7 @@
+ class QAssistantClient : QObject
+ {
+ %TypeHeaderCode
+-#include <qassistantclient.h>
++#include <QtAssistant/qassistantclient.h>
+ %End
+ 
+ %ConvertToSubClassCode
diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/fix_qthelp_ftbfs.diff b/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/fix_qthelp_ftbfs.diff
new file mode 100644
index 0000000..e7a6882
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/fix_qthelp_ftbfs.diff
@@ -0,0 +1,15 @@
+Description: Fix QtHelp FTBFS with ld --no-add-needed.
+Author: Felix Geyer <debfx-pkg@fobos.de>
+
+--- python-qt4-4.8.1.orig/configure.py
++++ python-qt4-4.8.1/configure.py
+@@ -364,7 +364,8 @@ class ConfigurePyQt4:
+         pyqt_modules.append("QtCore")
+ 
+         check_module("QtGui", "qwidget.h", "new QWidget()")
+-        check_module("QtHelp", "qhelpengine.h", "new QHelpEngine(\"foo\")")
++        check_module("QtHelp", "qhelpengine.h", "new QHelpEngine(\"foo\")",
++                extra_libs=["QtCore"])
+         check_module("QtMultimedia", "QAudioDeviceInfo",
+                 "new QAudioDeviceInfo()")
+         check_module("QtNetwork", "qhostaddress.h", "new QHostAddress()")
diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/fix_the_QAssitant_ftbfs.diff b/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/fix_the_QAssitant_ftbfs.diff
new file mode 100644
index 0000000..96e3062
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/fix_the_QAssitant_ftbfs.diff
@@ -0,0 +1,29 @@
+From aa85ab2be6be7cb3c4df68139a8271fc4c8c11c8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Picca=20Fr=C3=A9d=C3=A9ric-Emmanuel?= <picca@synchrotron-soleil.fr>
+Date: Tue, 1 Mar 2011 21:49:23 +0100
+Subject: [PATCH] * fix the QAssitant ftbfs
+
+---
+ configure.py |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.py b/configure.py
+index 7ed9582..185ec9f 100644
+--- a/configure.py
++++ b/configure.py
+@@ -354,10 +354,10 @@ class ConfigurePyQt4:
+ 
+         if opts.mwg_ssl_dir:
+             ass_lib_dirs = [os.path.join(opts.mwg_ssl_dir, "lib")]
+-            ass_libs = ["ssleay32", "libeay32"]
++            ass_libs = ["ssleay32", "libeay32", "QtCore"]
+         else:
+             ass_lib_dirs = None
+-            ass_libs = None
++            ass_libs = ["QtCore"]
+ 
+         # Note that the order in which we check is important for the
+         # consolidated module - a module's dependencies must be checked first.
+-- 
+1.7.4.1
+
diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/pyqt-generated.patch b/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/pyqt-generated.patch
new file mode 100644
index 0000000..0af5549
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/pyqt-generated.patch
@@ -0,0 +1,24 @@
+diff -uNr PyQt-x11-gpl-4.8.4.orig/QtGui/sipQtGuiQSystemTrayIcon.cpp PyQt-x11-gpl-4.8.4/QtGui/sipQtGuiQSystemTrayIcon.cpp
+--- PyQt-x11-gpl-4.8.4.orig/QtGui/sipQtGuiQSystemTrayIcon.cpp	2012-08-01 16:37:34.000000000 +0200
++++ PyQt-x11-gpl-4.8.4/QtGui/sipQtGuiQSystemTrayIcon.cpp	2012-08-01 17:05:45.000000000 +0200
+@@ -957,8 +957,6 @@
+         qtgui_untrack(sipCpp);
+ #line 959 "QtGui/sipQtGuiQSystemTrayIcon.cpp"
+ 
+-    QSystemTrayIcon *sipCpp = reinterpret_cast<QSystemTrayIcon *>(sipCppV);
+-
+     if (QThread::currentThread() == sipCpp->thread())
+         delete sipCpp;
+     else
+diff -uNr PyQt-x11-gpl-4.8.4.orig/QtGui/sipQtGuiQGraphicsScene.cpp PyQt-x11-gpl-4.8.4/QtGui/sipQtGuiQGraphicsScene.cpp
+--- PyQt-x11-gpl-4.8.4.orig/QtGui/sipQtGuiQGraphicsScene.cpp	2012-08-01 16:37:35.000000000 +0200
++++ PyQt-x11-gpl-4.8.4/QtGui/sipQtGuiQGraphicsScene.cpp	2012-08-01 17:26:58.000000000 +0200
+@@ -4016,8 +4016,6 @@
+         qtgui_untrack(sipCpp);
+ #line 4018 "QtGui/sipQtGuiQGraphicsScene.cpp"
+ 
+-    QGraphicsScene *sipCpp = reinterpret_cast<QGraphicsScene *>(sipCppV);
+-
+     if (QThread::currentThread() == sipCpp->thread())
+         delete sipCpp;
+     else
diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/qreal_float_support.diff b/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/qreal_float_support.diff
new file mode 100644
index 0000000..abdf70f
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pyqt-4.8.4/qreal_float_support.diff
@@ -0,0 +1,248 @@
+## 03_qreal_float_support.dpatch by Michael Casadevall <sonicmctails@gmail.com>
+Index: python-qt4-4.8.3/configure.py
+===================================================================
+--- python-qt4-4.8.3.orig/configure.py	2011-02-24 10:33:30.000000000 +0200
++++ python-qt4-4.8.3/configure.py	2011-02-24 10:33:18.000000000 +0200
+@@ -2004,8 +2004,9 @@
+     out << "PyQt_NoOpenGLES\\n";
+ #endif
+ 
+-    if (sizeof (qreal) != sizeof (double))
++#if defined(QT_NO_FPU) || defined(QT_ARCH_ARM) || defined(QT_ARCH_WINDOWSCE)
+         out << "PyQt_qreal_double\\n";
++#endif
+ 
+     return 0;
+ }
+Index: python-qt4-4.8.3/sip/QtCore/qlist.sip
+===================================================================
+--- python-qt4-4.8.3.orig/sip/QtCore/qlist.sip	2011-02-24 10:33:27.000000000 +0200
++++ python-qt4-4.8.3/sip/QtCore/qlist.sip	2011-02-24 10:33:18.000000000 +0200
+@@ -811,3 +811,227 @@
+     return sipGetState(sipTransferObj);
+ %End
+ };
++
++// If we're on an architecture where qreal != double, then we need to also
++// explicately handle doubles. On architectures where qreal == double, they
++// will automaticially be cast upwards
++
++%If (!PyQt_qreal_double)
++
++%If (Qt_4_3_0 -)
++// QList<QPair<double, double> > is implemented as a Python list of 2-element tuples.
++%MappedType QList<QPair<double, double> >
++{
++%TypeHeaderCode
++#include <qlist.h>
++#include <qpair.h>
++%End
++
++%ConvertFromTypeCode
++    // Create the list.
++    PyObject *l;
++
++    if ((l = PyList_New(sipCpp->size())) == NULL)
++        return NULL;
++
++    // Set the list elements.
++    for (int i = 0; i < sipCpp->size(); ++i)
++    {
++        const QPair<double, double> &p = sipCpp->at(i);
++        PyObject *pobj;
++
++        if ((pobj = Py_BuildValue((char *)"dd", p.first, p.second)) == NULL)
++        {
++            Py_DECREF(l);
++
++            return NULL;
++        }
++
++        PyList_SET_ITEM(l, i, pobj);
++    }
++
++    return l;
++%End
++
++%ConvertToTypeCode
++    SIP_SSIZE_T len;
++
++    // Check the type if that is all that is required.
++    if (sipIsErr == NULL)
++    {
++        if (!PySequence_Check(sipPy) || (len = PySequence_Size(sipPy)) < 0)
++            return 0;
++
++        for (SIP_SSIZE_T i = 0; i < len; ++i)
++        {
++            PyObject *tup = PySequence_ITEM(sipPy, i);
++
++            if (!PySequence_Check(tup) || PySequence_Size(tup) != 2)
++                return 0;
++        }
++
++        return 1;
++    }
++
++    QList<QPair<double, double> > *ql = new QList<QPair<double, double> >;
++    len = PySequence_Size(sipPy);
++ 
++    for (SIP_SSIZE_T i = 0; i < len; ++i)
++    {
++        PyObject *tup = PySequence_ITEM(sipPy, i);
++
++        double first = PyFloat_AsDouble(PySequence_ITEM(tup, 0));
++        double second = PyFloat_AsDouble(PySequence_ITEM(tup, 1));
++ 
++        ql->append(QPair<double, double>(first, second));
++    }
++ 
++    *sipCppPtr = ql;
++ 
++    return sipGetState(sipTransferObj);
++%End
++};
++%End
++%If (Qt_4_3_0 -)
++// QList<QPair<double, TYPE> > is implemented as a Python list of 2-element tuples.
++template<double, TYPE>
++%MappedType QList<QPair<double, TYPE> >
++{
++%TypeHeaderCode
++#include <qlist.h>
++#include <qpair.h>
++%End
++
++%ConvertFromTypeCode
++    // Create the list.
++    PyObject *l;
++
++    if ((l = PyList_New(sipCpp->size())) == NULL)
++        return NULL;
++
++    // Set the list elements.
++    for (int i = 0; i < sipCpp->size(); ++i)
++    {
++        const QPair<double, TYPE> &p = sipCpp->at(i);
++        TYPE *t = new TYPE(p.second);
++        PyObject *pobj;
++
++        if ((pobj = sipBuildResult(NULL, "(dB)", p.first, t, sipClass_TYPE, sipTransferObj)) == NULL)
++        {
++            Py_DECREF(l);
++            delete t;
++
++            return NULL;
++        }
++
++        PyList_SET_ITEM(l, i, pobj);
++    }
++
++    return l;
++%End
++
++%ConvertToTypeCode
++    SIP_SSIZE_T len;
++
++    // Check the type if that is all that is required.
++    if (sipIsErr == NULL)
++    {
++        if (!PySequence_Check(sipPy) || (len = PySequence_Size(sipPy)) < 0)
++            return 0;
++
++        for (SIP_SSIZE_T i = 0; i < len; ++i)
++        {
++            PyObject *tup = PySequence_ITEM(sipPy, i);
++
++            if (!PySequence_Check(tup) || PySequence_Size(tup) != 2)
++                return 0;
++
++            if (!sipCanConvertToInstance(PySequence_ITEM(tup, 1), sipClass_TYPE, SIP_NOT_NONE))
++                return 0;
++        }
++
++        return 1;
++    }
++
++    QList<QPair<double, TYPE> > *ql = new QList<QPair<double, TYPE> >;
++    len = PySequence_Size(sipPy);
++ 
++    for (SIP_SSIZE_T i = 0; i < len; ++i)
++    {
++        PyObject *tup = PySequence_ITEM(sipPy, i);
++        double d;
++        int state;
++
++        d = PyFloat_AsDouble(PySequence_ITEM(tup, 0));
++        TYPE *t = reinterpret_cast<TYPE *>(sipConvertToInstance(PySequence_ITEM(tup, 1), sipClass_TYPE, sipTransferObj, SIP_NOT_NONE, &state, sipIsErr));
++ 
++        if (*sipIsErr)
++        {
++            sipReleaseInstance(t, sipClass_TYPE, state);
++
++            delete ql;
++            return 0;
++        }
++
++        ql->append(QPair<double, TYPE>(d, *t));
++
++        sipReleaseInstance(t, sipClass_TYPE, state);
++    }
++ 
++    *sipCppPtr = ql;
++ 
++    return sipGetState(sipTransferObj);
++%End
++};
++%End
++
++// QList<double> is implemented as a Python list of doubles.
++%MappedType QList<double>
++{
++%TypeHeaderCode
++#include <qlist.h>
++%End
++
++%ConvertFromTypeCode
++    // Create the list.
++    PyObject *l;
++
++    if ((l = PyList_New(sipCpp->size())) == NULL)
++        return NULL;
++
++    // Set the list elements.
++    for (int i = 0; i < sipCpp->size(); ++i)
++    {
++        PyObject *pobj;
++
++        if ((pobj = PyFloat_FromDouble(sipCpp->value(i))) == NULL)
++        {
++            Py_DECREF(l);
++
++            return NULL;
++        }
++
++        PyList_SET_ITEM(l, i, pobj);
++    }
++
++    return l;
++%End
++
++%ConvertToTypeCode
++    // Check the type if that is all that is required.
++    if (sipIsErr == NULL)
++        return (PySequence_Check(sipPy) && PySequence_Size(sipPy) >= 0);
++
++    QList<double> *ql = new QList<double>;
++    SIP_SSIZE_T len = PySequence_Size(sipPy);
++ 
++    for (SIP_SSIZE_T i = 0; i < len; ++i)
++        ql->append(PyFloat_AsDouble(PySequence_ITEM(sipPy, i)));
++ 
++    *sipCppPtr = ql;
++ 
++    return sipGetState(sipTransferObj);
++%End
++};
++
++%End
diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.8.4.bb b/meta-oe/recipes-devtools/python/python-pyqt_4.8.4.bb
new file mode 100644
index 0000000..8bae09e
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pyqt_4.8.4.bb
@@ -0,0 +1,115 @@
+DESCRIPTION = "Python Qt4 Bindings"
+HOMEPAGE = "http://riverbankcomputing.co.uk"
+AUTHOR = "Phil Thomson @ riverbank.co.uk"
+SECTION = "devel/python"
+LICENSE = "GPLv2 & GPLv3 & GPL_EXCEPTION"
+LIC_FILES_CHKSUM = "\
+  file://GPL_EXCEPTION.TXT;md5=b73b0be471db679533dc94781c14af58 \
+  file://GPL_EXCEPTION_ADDENDUM.TXT;md5=c1e04ec2aa0911061005a801abf81e40 \
+  file://OPENSOURCE-NOTICE.TXT;md5=6ad9123620cc04a22c394753ad4767d7 \
+  file://LICENSE-MERGED-GPL2-GPL3;md5=53ced8933428255115039368cdca0aef \
+  file://LICENSE.GPL2;md5=59bccd9d4dcaae9e668798337b91a022 \
+  file://LICENSE.GPL3;md5=da83bb3624af9ff4808aa9ffc49fc582 \
+"
+
+DEPENDS = "sip-native python-sip"
+RDEPENDS_${PN} = "python-core"
+SRCNAME = "pyqt"
+
+PYQT_OE_VERSION = "Qt_4_7_1"
+
+SRC_URI = "\
+  http://www.riverbankcomputing.co.uk/static/Downloads/PyQt4/PyQt-x11-gpl-${PV}.tar.gz \
+  \
+  file://fix_qthelp_ftbfs.diff \
+  file://fix_the_QAssitant_ftbfs.diff \
+  file://assistantclient-fix.patch \
+  file://pyqt-generated.patch;apply=no \
+"
+SRC_URI[md5sum] = "97c5dc1042feb5b3fe20baabad055af1"
+SRC_URI[sha256sum] = "fcfa3ecc0b4fad6d93227751b36a6f81ea104ee19dd26905f52de59f060b3e98"
+S = "${WORKDIR}/PyQt-x11-gpl-${PV}"
+
+# arm and mips machines need some extra patches
+SRC_URI_append_arm = "\
+  file://qreal_float_support.diff \
+"
+
+SRC_URI_append_mipsel = "\
+  file://qreal_float_support.diff \
+"
+
+inherit qt4x11 sip distutils-base
+
+PARALLEL_MAKE = ""
+
+QMAKE_PROFILES = "pyqt.pro"
+# NOTE: has to match with MIN(qt version we have in OE, last known Qt version by SIP/PyQt)
+EXTRA_SIPTAGS = "-tWS_X11 -t${PYQT_OE_VERSION} -xVendorID -xPyQt_SessionManager -xPyQt_Accessibility"
+EXTRA_OEMAKE = " MAKEFLAGS= "
+
+# arm and mips need extra params for the qreal issue
+EXTRA_SIPTAGS_append_arm = " -x PyQt_qreal_double"
+EXTRA_SIPTAGS_append_mipsel = " -x PyQt_qreal_double" 
+
+SIP_MODULES = "QtCore QtDeclarative QtGui QtNetwork QtSql QtSvg QtXml QtWebKit"
+MAKE_MODULES = "qpy ${SIP_MODULES}"
+
+EXTRA_QMAKEVARS_POST += "\
+  INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/Qt \
+  INCLUDEPATH+=${STAGING_INCDIR}/${PYTHON_DIR} \
+  INCLUDEPATH+=../qpy/QtCore \
+  INCLUDEPATH+=../qpy/QtGui \
+  INCLUDEPATH+=../qpy/QtDeclarative \
+  INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtCore \
+  INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtGui \
+  INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtDeclarative \
+  INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtWebKit \
+  INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtNetwork \
+"
+FIX_QREAL = "\
+"
+
+do_generate_prepend() {
+    for i in ${FIX_QREAL}; do
+        sed -i -e s,qreal,float,g sip/$i
+    done
+}
+
+do_configure_prepend() {
+    printf "TEMPLATE=subdirs\nSUBDIRS=${MAKE_MODULES}\n" >pyqt.pro
+    printf "TEMPLATE=subdirs\nSUBDIRS=QtCore QtDeclarative QtGui\n" >qpy/qpy.pro
+    ln -sf ./qpycore.pro qpy/QtCore/QtCore.pro
+    ln -sf ./qpydeclarative.pro qpy/QtDeclarative/QtDeclarative.pro
+    ln -sf ./qpygui.pro qpy/QtGui/QtGui.pro
+    echo "INCLUDEPATH+=${S}/QtCore" >>qpy/QtCore/QtCore.pro
+    echo "INCLUDEPATH+=${S}/QtGui" >>qpy/QtGui/QtGui.pro
+    echo "INCLUDEPATH+=${S}/QtDeclarative" >>qpy/QtDeclarative/QtDeclarative.pro
+    echo "LIBS+=-L../qpy/QtGui/ -lqpygui" >>QtGui/QtGui.pro
+    echo "LIBS+=-L../qpy/QtCore/ -lqpycore" >>QtCore/QtCore.pro
+    echo "LIBS+=-L../qpy/QtDeclarative/ -lqpydeclarative" >>QtDeclarative/QtDeclarative.pro
+    # hack for broken generated code (duplicated sipCpp declaration).
+    patch -p1 < ${WORKDIR}/pyqt-generated.patch
+}
+
+do_install() {
+    install -d ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4
+    for module in ${SIP_MODULES}
+    do
+        echo "from PyQt4.${module} import *\n" >> ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/Qt.py
+        install -m 0755 ${module}/lib${module}.so ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/${module}.so
+    done
+    cp -pPR elementtree ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
+    cp __init__.py ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
+
+    install -d ${STAGING_SIPDIR}/qt/
+    install -d ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages
+    for module in ${SIP_MODULES}
+    do
+        install -m 0644 ${S}/sip/${module}/*.sip ${STAGING_SIPDIR}/qt/
+        install -m 0755 ${module}/lib${module}.so ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/${module}.so
+    done
+}
+
+FILES_${PN} = "${libdir}/${PYTHON_DIR}/site-packages"
+
-- 
1.7.8.6



