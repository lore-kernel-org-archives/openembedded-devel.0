Received: from 9.26.mail-out.ovh.net ([46.105.56.220] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QLxy3-0007ZY-1x
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 15:36:15 +0200
Received: (qmail 9757 invoked by uid 503); 16 May 2011 12:58:59 -0000
Received: from b6.ovh.net (HELO mail94.ha.ovh.net) (213.186.33.56)
	by 26.mail-out.ovh.net with SMTP; 16 May 2011 12:58:58 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 May 2011 15:32:32 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 May 2011 15:32:30 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 15:22:49 +0200
Message-Id: <1305552169-26917-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305552169-26917-1-git-send-email-eric@eukrea.com>
References: <1305552169-26917-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2841208416488107338
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Cc: mickey@vanille-media.de
Subject: [PATCH 2/2] python-pyqt: update to 4.8.4
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
X-List-Received-Date: Mon, 16 May 2011 13:36:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

4.8.3 is no more fetchable

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../python-pyqt-4.8.3/assistantclient-fix.patch    |   13 -
 .../debian_configure_changes.diff                  |   52 ----
 .../python/python-pyqt-4.8.3/fix_qthelp_ftbfs.diff |   15 --
 .../python-pyqt-4.8.3/fix_the_QAssitant_ftbfs.diff |   29 ---
 .../python-pyqt-4.8.3/fix_uiparser_buttonbox.diff  |   20 --
 .../python-pyqt-4.8.3/qreal_float_support.diff     |  248 --------------------
 .../python-pyqt-4.8.4/assistantclient-fix.patch    |   13 +
 .../debian_configure_changes.diff                  |   52 ++++
 .../python/python-pyqt-4.8.4/fix_qthelp_ftbfs.diff |   15 ++
 .../python-pyqt-4.8.4/fix_the_QAssitant_ftbfs.diff |   29 +++
 .../python-pyqt-4.8.4/fix_uiparser_buttonbox.diff  |   20 ++
 .../python-pyqt-4.8.4/qreal_float_support.diff     |  248 ++++++++++++++++++++
 recipes/python/python-pyqt_4.8.3.bb                |  108 ---------
 recipes/python/python-pyqt_4.8.4.bb                |  107 +++++++++
 14 files changed, 484 insertions(+), 485 deletions(-)
 delete mode 100644 recipes/python/python-pyqt-4.8.3/assistantclient-fix.patch
 delete mode 100644 recipes/python/python-pyqt-4.8.3/debian_configure_changes.diff
 delete mode 100644 recipes/python/python-pyqt-4.8.3/fix_qthelp_ftbfs.diff
 delete mode 100644 recipes/python/python-pyqt-4.8.3/fix_the_QAssitant_ftbfs.diff
 delete mode 100644 recipes/python/python-pyqt-4.8.3/fix_uiparser_buttonbox.diff
 delete mode 100644 recipes/python/python-pyqt-4.8.3/qreal_float_support.diff
 create mode 100644 recipes/python/python-pyqt-4.8.4/assistantclient-fix.patch
 create mode 100644 recipes/python/python-pyqt-4.8.4/debian_configure_changes.diff
 create mode 100644 recipes/python/python-pyqt-4.8.4/fix_qthelp_ftbfs.diff
 create mode 100644 recipes/python/python-pyqt-4.8.4/fix_the_QAssitant_ftbfs.diff
 create mode 100644 recipes/python/python-pyqt-4.8.4/fix_uiparser_buttonbox.diff
 create mode 100644 recipes/python/python-pyqt-4.8.4/qreal_float_support.diff
 delete mode 100644 recipes/python/python-pyqt_4.8.3.bb
 create mode 100644 recipes/python/python-pyqt_4.8.4.bb

diff --git a/recipes/python/python-pyqt-4.8.3/assistantclient-fix.patch b/recipes/python/python-pyqt-4.8.3/assistantclient-fix.patch
deleted file mode 100644
index 15f83d2..0000000
--- a/recipes/python/python-pyqt-4.8.3/assistantclient-fix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: PyQt-x11-gpl-4.8.3/sip/QtAssistant/qassistantclient.sip
-===================================================================
---- PyQt-x11-gpl-4.8.3.orig/sip/QtAssistant/qassistantclient.sip
-+++ PyQt-x11-gpl-4.8.3/sip/QtAssistant/qassistantclient.sip
-@@ -33,7 +33,7 @@
- class QAssistantClient : QObject
- {
- %TypeHeaderCode
--#include <qassistantclient.h>
-+#include <QtAssistant/qassistantclient.h>
- %End
- 
- %ConvertToSubClassCode
diff --git a/recipes/python/python-pyqt-4.8.3/debian_configure_changes.diff b/recipes/python/python-pyqt-4.8.3/debian_configure_changes.diff
deleted file mode 100644
index 8f065a2..0000000
--- a/recipes/python/python-pyqt-4.8.3/debian_configure_changes.diff
+++ /dev/null
@@ -1,52 +0,0 @@
-Index: python-qt4-4.8.3/configure.py
-===================================================================
---- python-qt4-4.8.3.org/configure.py	2011-01-25 22:28:37.000000000 +0100
-+++ python-qt4-4.8.3/configure.py	2011-01-26 00:04:40.174212637 +0100
-@@ -843,31 +843,6 @@
-             makefile.generate()
-             tool.append("dbus")
- 
--        # Only include ElementTree for older versions of Python.
--        if sipcfg.py_version < 0x020500:
--            sipconfig.inform("Creating elementtree Makefile...")
--
--            makefile = sipconfig.PythonModuleMakefile(
--                configuration=sipcfg,
--                dstdir=os.path.join(pyqt_modroot, "elementtree"),
--                dir="elementtree"
--            )
--
--            makefile.generate()
--            tool.append("elementtree")
--
--        # Create the pyuic4 wrapper.  Use the GUI version on MacOS (so that
--        # previews work properly and normal console use will work anyway), but
--        # not on Windows (so that normal console use will work).
--        sipconfig.inform("Creating pyuic4 wrapper...")
--
--        if sys.platform == 'darwin':
--            gui = True
--            use_arch = opts.use_arch
--        else:
--            gui = False
--            use_arch = ''
--
-         # The pyuic directory may not exist if we are building away from the
-         # source directory.
-         try:
-@@ -876,7 +851,6 @@
-             pass
- 
-         uicdir=os.path.join(pyqt_modroot, "uic")
--        wrapper = sipconfig.create_wrapper(os.path.join(uicdir, "pyuic.py"), os.path.join("pyuic", "pyuic4"), gui, use_arch)
- 
-         sipconfig.inform("Creating pyuic4 Makefile...")
- 
-@@ -885,7 +859,6 @@
-             dstdir=uicdir,
-             srcdir=os.path.join(src_dir, "pyuic", "uic"),
-             dir="pyuic",
--            installs=[[os.path.basename(wrapper), opts.pyqtbindir]]
-         )
- 
-         makefile.generate()
diff --git a/recipes/python/python-pyqt-4.8.3/fix_qthelp_ftbfs.diff b/recipes/python/python-pyqt-4.8.3/fix_qthelp_ftbfs.diff
deleted file mode 100644
index e7a6882..0000000
--- a/recipes/python/python-pyqt-4.8.3/fix_qthelp_ftbfs.diff
+++ /dev/null
@@ -1,15 +0,0 @@
-Description: Fix QtHelp FTBFS with ld --no-add-needed.
-Author: Felix Geyer <debfx-pkg@fobos.de>
-
---- python-qt4-4.8.1.orig/configure.py
-+++ python-qt4-4.8.1/configure.py
-@@ -364,7 +364,8 @@ class ConfigurePyQt4:
-         pyqt_modules.append("QtCore")
- 
-         check_module("QtGui", "qwidget.h", "new QWidget()")
--        check_module("QtHelp", "qhelpengine.h", "new QHelpEngine(\"foo\")")
-+        check_module("QtHelp", "qhelpengine.h", "new QHelpEngine(\"foo\")",
-+                extra_libs=["QtCore"])
-         check_module("QtMultimedia", "QAudioDeviceInfo",
-                 "new QAudioDeviceInfo()")
-         check_module("QtNetwork", "qhostaddress.h", "new QHostAddress()")
diff --git a/recipes/python/python-pyqt-4.8.3/fix_the_QAssitant_ftbfs.diff b/recipes/python/python-pyqt-4.8.3/fix_the_QAssitant_ftbfs.diff
deleted file mode 100644
index 96e3062..0000000
--- a/recipes/python/python-pyqt-4.8.3/fix_the_QAssitant_ftbfs.diff
+++ /dev/null
@@ -1,29 +0,0 @@
-From aa85ab2be6be7cb3c4df68139a8271fc4c8c11c8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Picca=20Fr=C3=A9d=C3=A9ric-Emmanuel?= <picca@synchrotron-soleil.fr>
-Date: Tue, 1 Mar 2011 21:49:23 +0100
-Subject: [PATCH] * fix the QAssitant ftbfs
-
----
- configure.py |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.py b/configure.py
-index 7ed9582..185ec9f 100644
---- a/configure.py
-+++ b/configure.py
-@@ -354,10 +354,10 @@ class ConfigurePyQt4:
- 
-         if opts.mwg_ssl_dir:
-             ass_lib_dirs = [os.path.join(opts.mwg_ssl_dir, "lib")]
--            ass_libs = ["ssleay32", "libeay32"]
-+            ass_libs = ["ssleay32", "libeay32", "QtCore"]
-         else:
-             ass_lib_dirs = None
--            ass_libs = None
-+            ass_libs = ["QtCore"]
- 
-         # Note that the order in which we check is important for the
-         # consolidated module - a module's dependencies must be checked first.
--- 
-1.7.4.1
-
diff --git a/recipes/python/python-pyqt-4.8.3/fix_uiparser_buttonbox.diff b/recipes/python/python-pyqt-4.8.3/fix_uiparser_buttonbox.diff
deleted file mode 100644
index 7bb6468..0000000
--- a/recipes/python/python-pyqt-4.8.3/fix_uiparser_buttonbox.diff
+++ /dev/null
@@ -1,20 +0,0 @@
-Index: python-qt4-4.8.3/pyuic/uic/uiparser.py
-===================================================================
---- python-qt4-4.8.3.orig/pyuic/uic/uiparser.py	2011-01-23 10:08:28.000000000 +0000
-+++ python-qt4-4.8.3/pyuic/uic/uiparser.py	2011-02-07 15:13:39.038141245 +0000
-@@ -228,7 +228,14 @@
-         elif isinstance(widget, QtGui.QAbstractButton):
-             bg_i18n = self.wprops.getAttribute(elem, "buttonGroup")
-             if bg_i18n is not None:
--                bg_name = bg_i18n.string
-+                # This should be handled properly in case the problem arises
-+                # elsewhere as well.
-+                try:
-+                    # We are compiling the .ui file.
-+                    bg_name = bg_i18n.string
-+                except AttributeError:
-+                    # We are loading the .ui file.
-+                    bg_name = bg_i18n
- 
-                 for bg in self.button_groups:
-                     if bg.objectName() == bg_name:
diff --git a/recipes/python/python-pyqt-4.8.3/qreal_float_support.diff b/recipes/python/python-pyqt-4.8.3/qreal_float_support.diff
deleted file mode 100644
index abdf70f..0000000
--- a/recipes/python/python-pyqt-4.8.3/qreal_float_support.diff
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
diff --git a/recipes/python/python-pyqt-4.8.4/assistantclient-fix.patch b/recipes/python/python-pyqt-4.8.4/assistantclient-fix.patch
new file mode 100644
index 0000000..15f83d2
--- /dev/null
+++ b/recipes/python/python-pyqt-4.8.4/assistantclient-fix.patch
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
diff --git a/recipes/python/python-pyqt-4.8.4/debian_configure_changes.diff b/recipes/python/python-pyqt-4.8.4/debian_configure_changes.diff
new file mode 100644
index 0000000..8f065a2
--- /dev/null
+++ b/recipes/python/python-pyqt-4.8.4/debian_configure_changes.diff
@@ -0,0 +1,52 @@
+Index: python-qt4-4.8.3/configure.py
+===================================================================
+--- python-qt4-4.8.3.org/configure.py	2011-01-25 22:28:37.000000000 +0100
++++ python-qt4-4.8.3/configure.py	2011-01-26 00:04:40.174212637 +0100
+@@ -843,31 +843,6 @@
+             makefile.generate()
+             tool.append("dbus")
+ 
+-        # Only include ElementTree for older versions of Python.
+-        if sipcfg.py_version < 0x020500:
+-            sipconfig.inform("Creating elementtree Makefile...")
+-
+-            makefile = sipconfig.PythonModuleMakefile(
+-                configuration=sipcfg,
+-                dstdir=os.path.join(pyqt_modroot, "elementtree"),
+-                dir="elementtree"
+-            )
+-
+-            makefile.generate()
+-            tool.append("elementtree")
+-
+-        # Create the pyuic4 wrapper.  Use the GUI version on MacOS (so that
+-        # previews work properly and normal console use will work anyway), but
+-        # not on Windows (so that normal console use will work).
+-        sipconfig.inform("Creating pyuic4 wrapper...")
+-
+-        if sys.platform == 'darwin':
+-            gui = True
+-            use_arch = opts.use_arch
+-        else:
+-            gui = False
+-            use_arch = ''
+-
+         # The pyuic directory may not exist if we are building away from the
+         # source directory.
+         try:
+@@ -876,7 +851,6 @@
+             pass
+ 
+         uicdir=os.path.join(pyqt_modroot, "uic")
+-        wrapper = sipconfig.create_wrapper(os.path.join(uicdir, "pyuic.py"), os.path.join("pyuic", "pyuic4"), gui, use_arch)
+ 
+         sipconfig.inform("Creating pyuic4 Makefile...")
+ 
+@@ -885,7 +859,6 @@
+             dstdir=uicdir,
+             srcdir=os.path.join(src_dir, "pyuic", "uic"),
+             dir="pyuic",
+-            installs=[[os.path.basename(wrapper), opts.pyqtbindir]]
+         )
+ 
+         makefile.generate()
diff --git a/recipes/python/python-pyqt-4.8.4/fix_qthelp_ftbfs.diff b/recipes/python/python-pyqt-4.8.4/fix_qthelp_ftbfs.diff
new file mode 100644
index 0000000..e7a6882
--- /dev/null
+++ b/recipes/python/python-pyqt-4.8.4/fix_qthelp_ftbfs.diff
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
diff --git a/recipes/python/python-pyqt-4.8.4/fix_the_QAssitant_ftbfs.diff b/recipes/python/python-pyqt-4.8.4/fix_the_QAssitant_ftbfs.diff
new file mode 100644
index 0000000..96e3062
--- /dev/null
+++ b/recipes/python/python-pyqt-4.8.4/fix_the_QAssitant_ftbfs.diff
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
diff --git a/recipes/python/python-pyqt-4.8.4/fix_uiparser_buttonbox.diff b/recipes/python/python-pyqt-4.8.4/fix_uiparser_buttonbox.diff
new file mode 100644
index 0000000..7bb6468
--- /dev/null
+++ b/recipes/python/python-pyqt-4.8.4/fix_uiparser_buttonbox.diff
@@ -0,0 +1,20 @@
+Index: python-qt4-4.8.3/pyuic/uic/uiparser.py
+===================================================================
+--- python-qt4-4.8.3.orig/pyuic/uic/uiparser.py	2011-01-23 10:08:28.000000000 +0000
++++ python-qt4-4.8.3/pyuic/uic/uiparser.py	2011-02-07 15:13:39.038141245 +0000
+@@ -228,7 +228,14 @@
+         elif isinstance(widget, QtGui.QAbstractButton):
+             bg_i18n = self.wprops.getAttribute(elem, "buttonGroup")
+             if bg_i18n is not None:
+-                bg_name = bg_i18n.string
++                # This should be handled properly in case the problem arises
++                # elsewhere as well.
++                try:
++                    # We are compiling the .ui file.
++                    bg_name = bg_i18n.string
++                except AttributeError:
++                    # We are loading the .ui file.
++                    bg_name = bg_i18n
+ 
+                 for bg in self.button_groups:
+                     if bg.objectName() == bg_name:
diff --git a/recipes/python/python-pyqt-4.8.4/qreal_float_support.diff b/recipes/python/python-pyqt-4.8.4/qreal_float_support.diff
new file mode 100644
index 0000000..abdf70f
--- /dev/null
+++ b/recipes/python/python-pyqt-4.8.4/qreal_float_support.diff
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
diff --git a/recipes/python/python-pyqt_4.8.3.bb b/recipes/python/python-pyqt_4.8.3.bb
deleted file mode 100644
index 3b593ff..0000000
--- a/recipes/python/python-pyqt_4.8.3.bb
+++ /dev/null
@@ -1,108 +0,0 @@
-DESCRIPTION = "Python Qt4 Bindings"
-HOMEPAGE = "http://riverbankcomputing.co.uk"
-AUTHOR = "Phil Thomson @ riverbank.co.uk"
-SECTION = "devel/python"
-PRIORITY = "optional"
-LICENSE = "GPL"
-DEPENDS = "sip-native python-sip"
-RDEPENDS_${PN} = "python-core"
-SRCNAME = "pyqt"
-PR = "r2"
-
-PYQT_OE_VERSION = "Qt_4_7_1"
-
-SRC_URI = "\
-  http://www.riverbankcomputing.co.uk/static/Downloads/PyQt4/PyQt-x11-gpl-${PV}.tar.gz \
-  \
-  file://fix_qthelp_ftbfs.diff;apply=yes \
-  file://fix_the_QAssitant_ftbfs.diff;apply=yes \
-  file://fix_uiparser_buttonbox.diff;apply=yes \
-  file://assistantclient-fix.patch;apply=yes \
-"
-SRC_URI[md5sum] = "d54fd1c37a74864faf42709c8102f254"
-SRC_URI[sha256sum] = "8a59fe9dbb4d7f441dfa2e9405ebbf016aa3da838aa7ccfd429a429457c3d664"
-S = "${WORKDIR}/PyQt-x11-gpl-${PV}"
-
-# arm and mips machines need some extra patches
-SRC_URI_append_arm = "\
-  file://qreal_float_support.diff;apply=yes \
-"
-
-SRC_URI_append_mipsel = "\
-  file://qreal_float_support.diff;apply=yes \
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
-  INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/Qt \
-  INCLUDEPATH+=${STAGING_INCDIR}/${PYTHON_DIR} \
-  INCLUDEPATH+=../qpy/QtCore \
-  INCLUDEPATH+=../qpy/QtGui \
-  INCLUDEPATH+=../qpy/QtDeclarative \
-  INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtCore \
-  INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtGui \
-  INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtDeclarative \
-  INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtWebKit \
-  INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtNetwork \
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
-}
-
-do_stage() {
-    install -d ${STAGING_SIPDIR}/qt/
-    install -d ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages
-    for module in ${SIP_MODULES}
-    do
-        install -m 0644 ${S}/sip/${module}/*.sip ${STAGING_SIPDIR}/qt/
-	install -m 0755 ${module}/lib${module}.so ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/${module}.so
-    done
-}
-
-do_install() {
-    install -d ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4
-    for module in ${SIP_MODULES}
-    do
-		echo "from PyQt4.${module} import *\n" >> ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/Qt.py
-		install -m 0755 ${module}/lib${module}.so ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/${module}.so
-    done
-	cp -pPR elementtree ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
-	cp __init__.py ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
-}
-
-FILES_${PN} = "${libdir}/${PYTHON_DIR}/site-packages"
-
diff --git a/recipes/python/python-pyqt_4.8.4.bb b/recipes/python/python-pyqt_4.8.4.bb
new file mode 100644
index 0000000..e0bdf0b
--- /dev/null
+++ b/recipes/python/python-pyqt_4.8.4.bb
@@ -0,0 +1,107 @@
+DESCRIPTION = "Python Qt4 Bindings"
+HOMEPAGE = "http://riverbankcomputing.co.uk"
+AUTHOR = "Phil Thomson @ riverbank.co.uk"
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "GPL"
+DEPENDS = "sip-native python-sip"
+RDEPENDS_${PN} = "python-core"
+SRCNAME = "pyqt"
+PR = "r0"
+
+PYQT_OE_VERSION = "Qt_4_7_1"
+
+SRC_URI = "\
+  http://www.riverbankcomputing.co.uk/static/Downloads/PyQt4/PyQt-x11-gpl-${PV}.tar.gz \
+  \
+  file://fix_qthelp_ftbfs.diff;apply=yes \
+  file://fix_the_QAssitant_ftbfs.diff;apply=yes \
+  file://assistantclient-fix.patch;apply=yes \
+"
+SRC_URI[md5sum] = "97c5dc1042feb5b3fe20baabad055af1"
+SRC_URI[sha256sum] = "fcfa3ecc0b4fad6d93227751b36a6f81ea104ee19dd26905f52de59f060b3e98"
+S = "${WORKDIR}/PyQt-x11-gpl-${PV}"
+
+# arm and mips machines need some extra patches
+SRC_URI_append_arm = "\
+  file://qreal_float_support.diff;apply=yes \
+"
+
+SRC_URI_append_mipsel = "\
+  file://qreal_float_support.diff;apply=yes \
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
+}
+
+do_stage() {
+    install -d ${STAGING_SIPDIR}/qt/
+    install -d ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages
+    for module in ${SIP_MODULES}
+    do
+        install -m 0644 ${S}/sip/${module}/*.sip ${STAGING_SIPDIR}/qt/
+	install -m 0755 ${module}/lib${module}.so ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/${module}.so
+    done
+}
+
+do_install() {
+    install -d ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4
+    for module in ${SIP_MODULES}
+    do
+		echo "from PyQt4.${module} import *\n" >> ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/Qt.py
+		install -m 0755 ${module}/lib${module}.so ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/${module}.so
+    done
+	cp -pPR elementtree ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
+	cp __init__.py ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
+}
+
+FILES_${PN} = "${libdir}/${PYTHON_DIR}/site-packages"
+
-- 
1.7.0.4



