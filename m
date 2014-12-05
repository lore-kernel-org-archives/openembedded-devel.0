Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id E9C5472304
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 07:53:05 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A18AED40811
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 08:52:59 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 36BDFD4080A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 08:52:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 08:52:56 +0100 (CET)
Date: Fri, 5 Dec 2014 08:52:51 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141205075250.GA26505@mail.itconsulting-heinold.de>
References: <1417729043-11288-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1417729043-11288-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-oe][PATCHv2] python-pyqt : Update to 4.11.3.
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
X-List-Received-Date: Fri, 05 Dec 2014 07:53:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 04, 2014 at 04:37:23PM -0500, Philip Balister wrote:
> The configure.py script now has support for cross compiling. This
> simplified the recipe substantially.
> 
> The recipe was tested with gnuradio-companion on the zedboard and
> ettus-e300. This is the first time we have been able to use grc with
> pyqt built with OpenEmbedded.
> 
> Build tested on armv7, x86, x86_64 and mips.
> 
> Dropped patches from previous versions.
> 
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  .../python/python-pyqt-4.9.6/pyqt-generated.patch  |  12 -
>  .../python-pyqt-4.9.6/qreal_float_support.diff     | 248 ---------------------
>  .../recipes-devtools/python/python-pyqt_4.11.3.bb  |  54 +++++
>  .../recipes-devtools/python/python-pyqt_4.9.6.bb   | 103 ---------
>  4 files changed, 54 insertions(+), 363 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.patch
>  delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_support.diff
>  create mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
>  delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
> 
> diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.patch b/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.patch
> deleted file mode 100644
> index 6579aa4..0000000
> --- a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -diff -uNr PyQt-x11-gpl-4.9.5.orig/QtGui/sipQtGuiQSystemTrayIcon.cpp PyQt-x11-gpl-4.9.5/QtGui/sipQtGuiQSystemTrayIcon.cpp
> ---- PyQt-x11-gpl-4.9.5.orig/QtGui/sipQtGuiQSystemTrayIcon.cpp	2012-10-01 16:48:16.496700577 +0200
> -+++ PyQt-x11-gpl-4.9.5/QtGui/sipQtGuiQSystemTrayIcon.cpp	2012-10-01 21:40:43.063130099 +0200
> -@@ -993,8 +993,6 @@
> -         qtgui_untrack(sipCpp);
> - #line 995 "QtGui/sipQtGuiQSystemTrayIcon.cpp"
> - 
> --    QSystemTrayIcon *sipCpp = reinterpret_cast<QSystemTrayIcon *>(sipCppV);
> --
> -     if (QThread::currentThread() == sipCpp->thread())
> -         delete sipCpp;
> -     else
> diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_support.diff b/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_support.diff
> deleted file mode 100644
> index abdf70f..0000000
> --- a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_support.diff
> +++ /dev/null
> @@ -1,248 +0,0 @@
> -## 03_qreal_float_support.dpatch by Michael Casadevall <sonicmctails@gmail.com>
> -Index: python-qt4-4.8.3/configure.py
> -===================================================================
> ---- python-qt4-4.8.3.orig/configure.py	2011-02-24 10:33:30.000000000 +0200
> -+++ python-qt4-4.8.3/configure.py	2011-02-24 10:33:18.000000000 +0200
> -@@ -2004,8 +2004,9 @@
> -     out << "PyQt_NoOpenGLES\\n";
> - #endif
> - 
> --    if (sizeof (qreal) != sizeof (double))
> -+#if defined(QT_NO_FPU) || defined(QT_ARCH_ARM) || defined(QT_ARCH_WINDOWSCE)
> -         out << "PyQt_qreal_double\\n";
> -+#endif
> - 
> -     return 0;
> - }
> -Index: python-qt4-4.8.3/sip/QtCore/qlist.sip
> -===================================================================
> ---- python-qt4-4.8.3.orig/sip/QtCore/qlist.sip	2011-02-24 10:33:27.000000000 +0200
> -+++ python-qt4-4.8.3/sip/QtCore/qlist.sip	2011-02-24 10:33:18.000000000 +0200
> -@@ -811,3 +811,227 @@
> -     return sipGetState(sipTransferObj);
> - %End
> - };
> -+
> -+// If we're on an architecture where qreal != double, then we need to also
> -+// explicately handle doubles. On architectures where qreal == double, they
> -+// will automaticially be cast upwards
> -+
> -+%If (!PyQt_qreal_double)
> -+
> -+%If (Qt_4_3_0 -)
> -+// QList<QPair<double, double> > is implemented as a Python list of 2-element tuples.
> -+%MappedType QList<QPair<double, double> >
> -+{
> -+%TypeHeaderCode
> -+#include <qlist.h>
> -+#include <qpair.h>
> -+%End
> -+
> -+%ConvertFromTypeCode
> -+    // Create the list.
> -+    PyObject *l;
> -+
> -+    if ((l = PyList_New(sipCpp->size())) == NULL)
> -+        return NULL;
> -+
> -+    // Set the list elements.
> -+    for (int i = 0; i < sipCpp->size(); ++i)
> -+    {
> -+        const QPair<double, double> &p = sipCpp->at(i);
> -+        PyObject *pobj;
> -+
> -+        if ((pobj = Py_BuildValue((char *)"dd", p.first, p.second)) == NULL)
> -+        {
> -+            Py_DECREF(l);
> -+
> -+            return NULL;
> -+        }
> -+
> -+        PyList_SET_ITEM(l, i, pobj);
> -+    }
> -+
> -+    return l;
> -+%End
> -+
> -+%ConvertToTypeCode
> -+    SIP_SSIZE_T len;
> -+
> -+    // Check the type if that is all that is required.
> -+    if (sipIsErr == NULL)
> -+    {
> -+        if (!PySequence_Check(sipPy) || (len = PySequence_Size(sipPy)) < 0)
> -+            return 0;
> -+
> -+        for (SIP_SSIZE_T i = 0; i < len; ++i)
> -+        {
> -+            PyObject *tup = PySequence_ITEM(sipPy, i);
> -+
> -+            if (!PySequence_Check(tup) || PySequence_Size(tup) != 2)
> -+                return 0;
> -+        }
> -+
> -+        return 1;
> -+    }
> -+
> -+    QList<QPair<double, double> > *ql = new QList<QPair<double, double> >;
> -+    len = PySequence_Size(sipPy);
> -+ 
> -+    for (SIP_SSIZE_T i = 0; i < len; ++i)
> -+    {
> -+        PyObject *tup = PySequence_ITEM(sipPy, i);
> -+
> -+        double first = PyFloat_AsDouble(PySequence_ITEM(tup, 0));
> -+        double second = PyFloat_AsDouble(PySequence_ITEM(tup, 1));
> -+ 
> -+        ql->append(QPair<double, double>(first, second));
> -+    }
> -+ 
> -+    *sipCppPtr = ql;
> -+ 
> -+    return sipGetState(sipTransferObj);
> -+%End
> -+};
> -+%End
> -+%If (Qt_4_3_0 -)
> -+// QList<QPair<double, TYPE> > is implemented as a Python list of 2-element tuples.
> -+template<double, TYPE>
> -+%MappedType QList<QPair<double, TYPE> >
> -+{
> -+%TypeHeaderCode
> -+#include <qlist.h>
> -+#include <qpair.h>
> -+%End
> -+
> -+%ConvertFromTypeCode
> -+    // Create the list.
> -+    PyObject *l;
> -+
> -+    if ((l = PyList_New(sipCpp->size())) == NULL)
> -+        return NULL;
> -+
> -+    // Set the list elements.
> -+    for (int i = 0; i < sipCpp->size(); ++i)
> -+    {
> -+        const QPair<double, TYPE> &p = sipCpp->at(i);
> -+        TYPE *t = new TYPE(p.second);
> -+        PyObject *pobj;
> -+
> -+        if ((pobj = sipBuildResult(NULL, "(dB)", p.first, t, sipClass_TYPE, sipTransferObj)) == NULL)
> -+        {
> -+            Py_DECREF(l);
> -+            delete t;
> -+
> -+            return NULL;
> -+        }
> -+
> -+        PyList_SET_ITEM(l, i, pobj);
> -+    }
> -+
> -+    return l;
> -+%End
> -+
> -+%ConvertToTypeCode
> -+    SIP_SSIZE_T len;
> -+
> -+    // Check the type if that is all that is required.
> -+    if (sipIsErr == NULL)
> -+    {
> -+        if (!PySequence_Check(sipPy) || (len = PySequence_Size(sipPy)) < 0)
> -+            return 0;
> -+
> -+        for (SIP_SSIZE_T i = 0; i < len; ++i)
> -+        {
> -+            PyObject *tup = PySequence_ITEM(sipPy, i);
> -+
> -+            if (!PySequence_Check(tup) || PySequence_Size(tup) != 2)
> -+                return 0;
> -+
> -+            if (!sipCanConvertToInstance(PySequence_ITEM(tup, 1), sipClass_TYPE, SIP_NOT_NONE))
> -+                return 0;
> -+        }
> -+
> -+        return 1;
> -+    }
> -+
> -+    QList<QPair<double, TYPE> > *ql = new QList<QPair<double, TYPE> >;
> -+    len = PySequence_Size(sipPy);
> -+ 
> -+    for (SIP_SSIZE_T i = 0; i < len; ++i)
> -+    {
> -+        PyObject *tup = PySequence_ITEM(sipPy, i);
> -+        double d;
> -+        int state;
> -+
> -+        d = PyFloat_AsDouble(PySequence_ITEM(tup, 0));
> -+        TYPE *t = reinterpret_cast<TYPE *>(sipConvertToInstance(PySequence_ITEM(tup, 1), sipClass_TYPE, sipTransferObj, SIP_NOT_NONE, &state, sipIsErr));
> -+ 
> -+        if (*sipIsErr)
> -+        {
> -+            sipReleaseInstance(t, sipClass_TYPE, state);
> -+
> -+            delete ql;
> -+            return 0;
> -+        }
> -+
> -+        ql->append(QPair<double, TYPE>(d, *t));
> -+
> -+        sipReleaseInstance(t, sipClass_TYPE, state);
> -+    }
> -+ 
> -+    *sipCppPtr = ql;
> -+ 
> -+    return sipGetState(sipTransferObj);
> -+%End
> -+};
> -+%End
> -+
> -+// QList<double> is implemented as a Python list of doubles.
> -+%MappedType QList<double>
> -+{
> -+%TypeHeaderCode
> -+#include <qlist.h>
> -+%End
> -+
> -+%ConvertFromTypeCode
> -+    // Create the list.
> -+    PyObject *l;
> -+
> -+    if ((l = PyList_New(sipCpp->size())) == NULL)
> -+        return NULL;
> -+
> -+    // Set the list elements.
> -+    for (int i = 0; i < sipCpp->size(); ++i)
> -+    {
> -+        PyObject *pobj;
> -+
> -+        if ((pobj = PyFloat_FromDouble(sipCpp->value(i))) == NULL)
> -+        {
> -+            Py_DECREF(l);
> -+
> -+            return NULL;
> -+        }
> -+
> -+        PyList_SET_ITEM(l, i, pobj);
> -+    }
> -+
> -+    return l;
> -+%End
> -+
> -+%ConvertToTypeCode
> -+    // Check the type if that is all that is required.
> -+    if (sipIsErr == NULL)
> -+        return (PySequence_Check(sipPy) && PySequence_Size(sipPy) >= 0);
> -+
> -+    QList<double> *ql = new QList<double>;
> -+    SIP_SSIZE_T len = PySequence_Size(sipPy);
> -+ 
> -+    for (SIP_SSIZE_T i = 0; i < len; ++i)
> -+        ql->append(PyFloat_AsDouble(PySequence_ITEM(sipPy, i)));
> -+ 
> -+    *sipCppPtr = ql;
> -+ 
> -+    return sipGetState(sipTransferObj);
> -+%End
> -+};
> -+
> -+%End
> diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
> new file mode 100644
> index 0000000..8d47068
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
> @@ -0,0 +1,54 @@
> +SUMMARY = "Python Qt4 Bindings"
> +AUTHOR = "Phil Thomson @ riverbank.co.uk"
> +HOMEPAGE = "http://riverbankcomputing.co.uk"
> +SECTION = "devel/python"
> +LICENSE = "GPLv2 & GPLv3 & GPL_EXCEPTION"
> +LIC_FILES_CHKSUM = "\
> +    file://GPL_EXCEPTION.TXT;md5=b73b0be471db679533dc94781c14af58 \
> +    file://GPL_EXCEPTION_ADDENDUM.TXT;md5=c1e04ec2aa0911061005a801abf81e40 \
> +    file://OPENSOURCE-NOTICE.TXT;md5=6ad9123620cc04a22c394753ad4767d7 \
> +    file://LICENSE.GPL2;md5=577ff65f6653562af318bfc3944b1f20 \
> +    file://LICENSE.GPL3;md5=feee51612c3c1191a1d5f41156fa2c75 \
> +"
> +DEPENDS = "sip sip-native qt4-x11-free"
> +
> +SRC_URI = "\
> +    ${SOURCEFORGE_MIRROR}/pyqt/PyQt-x11-gpl-${PV}.tar.gz \
> +"
> +SRC_URI[md5sum] = "997c3e443165a89a559e0d96b061bf70"
> +SRC_URI[sha256sum] = "853780dcdbe2e6ba785d703d059b096e1fc49369d3e8d41a060be874b8745686"
> +
> +S = "${WORKDIR}/PyQt-x11-gpl-${PV}"
> +
> +PARALLEL_MAKE = ""
> +
> +inherit qmake2 pythonnative python-dir
> +
> +DISABLED_FEATURES = "PyQt_Desktop_OpenGL PyQt_Accessibility PyQt_SessionManager"
> +
> +DISABLED_FEATURES_append_arm = " PyQt_qreal_double"
> +
> +do_configure() {
> +    echo "py_platform = linux" > pyqt.cfg
> +    echo "py_inc_dir = %(sysroot)/$includedir/python%(py_major).%(py_minor)" >> pyqt.cfg
> +    echo "py_pylib_dir = %(sysroot)/${libdir}/python%(py_major).%(py_minor)" >> pyqt.cfg
> +    echo "py_pylib_lib = python%(py_major).%(py_minor)mu" >> pyqt.cfg
> +    echo "pyqt_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> pyqt.cfg
> +    echo "pyqt_bin_dir = ${D}/${bindir}" >> pyqt.cfg
> +    echo "pyqt_sip_dir = ${D}/${datadir}/sip/PyQt4" >> pyqt.cfg
> +    echo "pyuic_interpreter = ${D}/${bindir}/python%(py_major).%(py_minor)" >> pyqt.cfg
> +    echo "pyqt_disabled_features = ${DISABLED_FEATURES}" >> pyqt.cfg
> +    echo "qt_shared = True" >> pyqt.cfg
> +    echo "[Qt 4.8]" >> pyqt.cfg
> +    echo "pyqt_modules = QtCore QtGui QtDeclarative QtNetwork QtSvg QtWebKit" >> pyqt.cfg
> +    echo yes | python configure-ng.py --verbose --qmake  ${STAGING_BINDIR_NATIVE}/qmake2 --configuration pyqt.cfg --sysroot ${STAGING_DIR_HOST}
> +}

Hi Phillip,

it is shell so is a here-script not the better approach instead of the many echos?

Bye Henning

