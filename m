Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4064F727A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 11:52:35 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so1525511wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 03:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=d2iVEqDSFgQipXxmbR8kJYNxhxVJ5oDPsf3Fje8mgo0=;
	b=hWM+CZuubRQGcLpdcb9RcSENFcBVYIIIbGsolO2tODrtfvaghQVIy+DEG2yWFKbVgg
	sIIvzQFD/8CbeAUpE0deCbR05D5uvkU6yz2+voSvpBuP4PTLY04o+JtL1m8oS8x8DJPw
	tW8UVgrHgI8JsjFLmf/usywgk/UKrPvJD1Z+00hdnIBMWYN8bIKPm5NbqBRO8nXnzrnX
	i64saQnF2Iw8r1DwuEY3XHjxAVzfjlMH5AJn4RclWJy99u/ERZNlgW8aqdtLmreMPZaU
	7kdH6bLrmsdhGHvPsCGf1ST0XnF0CjX3oIe4VRnSpdnL/OJn4vqBGT5bgCOP49C9QoL+
	nbMw==
X-Received: by 10.194.57.84 with SMTP id g20mr3680179wjq.122.1418903555253;
	Thu, 18 Dec 2014 03:52:35 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wb9sm9678018wic.20.2014.12.18.03.52.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 03:52:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Dec 2014 12:52:38 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141218115238.GB2462@jama>
References: <1417729043-11288-1-git-send-email-philip@balister.org>
	<20141209175330.GR2470@jama>
MIME-Version: 1.0
In-Reply-To: <20141209175330.GR2470@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Thu, 18 Dec 2014 11:52:37 -0000
X-Groupsio-MsgNum: 53373
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline

--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2014 at 06:53:30PM +0100, Martin Jansa wrote:
> On Thu, Dec 04, 2014 at 04:37:23PM -0500, Philip Balister wrote:
> > The configure.py script now has support for cross compiling. This
> > simplified the recipe substantially.
> >=20
> > The recipe was tested with gnuradio-companion on the zedboard and
> > ettus-e300. This is the first time we have been able to use grc with
> > pyqt built with OpenEmbedded.
> >=20
> > Build tested on armv7, x86, x86_64 and mips.
> >=20
> > Dropped patches from previous versions.
>=20
> Now it failed in qemuarm build already:
> | cd QtCore/ && make -f Makefile
> | make[1]: Entering directory `/home/jenkins/oe/world/shr-core/tmp-glibc/=
work/armv5te-oe-linux-gnueabi/python-pyqt/4.11.3-r0/PyQt-x11-gpl-4.11.3/QtC=
ore'
> | arm-oe-linux-gnueabi-g++  -march=3Darmv5te -marm -mthumb-interwork --sy=
sroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -c -pipe=
  -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -=
fno-exceptions -O2 -Wall -W -D_REENTRANT -fPIC -DSIP_PROTECTED_IS_PUBLIC -D=
protected=3Dpublic -DQT_NO_DEBUG -DQT_PLUGIN -DQT_CORE_LIB -DQT_SHARED -I/h=
ome/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/share/qt4/mksp=
ecs/linux-g++ -I. -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemu=
arm/usr/include/qt4/QtCore -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysr=
oots/qemuarm/usr/include/qt4 -I. -I/home/jenkins/oe/world/shr-core/tmp-glib=
c/sysroots/qemuarm/usr/include/python2.7 -I../qpy/QtCore -I. -o qpycore_pos=
t_init.o qpycore_post_init.cpp
> | In file included from ../qpy/QtCore/qpycore_sip.h:32:0,
> |                  from ../qpy/QtCore/qpycore_chimera.h:38,
> |                  from ../qpy/QtCore/qpycore_pyqtsignal.h:32,
> |                  from ../qpy/QtCore/qpycore_pyqtboundsignal.h:32,
> |                  from qpycore_post_init.cpp:31:
> | ./sipAPIQtCore.h:33:17: fatal error: sip.h: No such file or directory
> |  #include <sip.h>
> |                  ^
> | compilation terminated.
> | make[1]: *** [qpycore_post_init.o] Error 1
> | make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/w=
ork/armv5te-oe-linux-gnueabi/python-pyqt/4.11.3-r0/PyQt-x11-gpl-4.11.3/QtCo=
re'
> | make: *** [sub-QtCore-make_default-ordered] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/python-pyqt/4.1=
1.3-r0/temp/log.do_compile.23996)
> NOTE: recipe python-pyqt-4.11.3-r0: task do_compile: Failed
> ERROR: Task 20206 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta=
-oe/recipes-devtools/python/python-pyqt_4.11.3.bb, do_compile) failed with =
exit code '1'

sstate-sysroot-cruft script reports that it's bypassing sstate when
starging sip.h

ERROR: Following files are installed in sysroot, but not tracked by
sstate:
qemuarm/usr/include/python2.7/sip.h

So it fails like this when it is reused from sstate.

Regards,

> > Signed-off-by: Philip Balister <philip@balister.org>
> > ---
> >  .../python/python-pyqt-4.9.6/pyqt-generated.patch  |  12 -
> >  .../python-pyqt-4.9.6/qreal_float_support.diff     | 248 -------------=
--------
> >  .../recipes-devtools/python/python-pyqt_4.11.3.bb  |  54 +++++
> >  .../recipes-devtools/python/python-pyqt_4.9.6.bb   | 103 ---------
> >  4 files changed, 54 insertions(+), 363 deletions(-)
> >  delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6/p=
yqt-generated.patch
> >  delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6/q=
real_float_support.diff
> >  create mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.11.3.=
bb
> >  delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
> >=20
> > diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-gen=
erated.patch b/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-gener=
ated.patch
> > deleted file mode 100644
> > index 6579aa4..0000000
> > --- a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.=
patch
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -diff -uNr PyQt-x11-gpl-4.9.5.orig/QtGui/sipQtGuiQSystemTrayIcon.cpp Py=
Qt-x11-gpl-4.9.5/QtGui/sipQtGuiQSystemTrayIcon.cpp
> > ---- PyQt-x11-gpl-4.9.5.orig/QtGui/sipQtGuiQSystemTrayIcon.cpp	2012-10-=
01 16:48:16.496700577 +0200
> > -+++ PyQt-x11-gpl-4.9.5/QtGui/sipQtGuiQSystemTrayIcon.cpp	2012-10-01 21=
:40:43.063130099 +0200
> > -@@ -993,8 +993,6 @@
> > -         qtgui_untrack(sipCpp);
> > - #line 995 "QtGui/sipQtGuiQSystemTrayIcon.cpp"
> > -=20
> > --    QSystemTrayIcon *sipCpp =3D reinterpret_cast<QSystemTrayIcon *>(s=
ipCppV);
> > --
> > -     if (QThread::currentThread() =3D=3D sipCpp->thread())
> > -         delete sipCpp;
> > -     else
> > diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_fl=
oat_support.diff b/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_=
float_support.diff
> > deleted file mode 100644
> > index abdf70f..0000000
> > --- a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_sup=
port.diff
> > +++ /dev/null
> > @@ -1,248 +0,0 @@
> > -## 03_qreal_float_support.dpatch by Michael Casadevall <sonicmctails@g=
mail.com>
> > -Index: python-qt4-4.8.3/configure.py
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- python-qt4-4.8.3.orig/configure.py	2011-02-24 10:33:30.000000000 +=
0200
> > -+++ python-qt4-4.8.3/configure.py	2011-02-24 10:33:18.000000000 +0200
> > -@@ -2004,8 +2004,9 @@
> > -     out << "PyQt_NoOpenGLES\\n";
> > - #endif
> > -=20
> > --    if (sizeof (qreal) !=3D sizeof (double))
> > -+#if defined(QT_NO_FPU) || defined(QT_ARCH_ARM) || defined(QT_ARCH_WIN=
DOWSCE)
> > -         out << "PyQt_qreal_double\\n";
> > -+#endif
> > -=20
> > -     return 0;
> > - }
> > -Index: python-qt4-4.8.3/sip/QtCore/qlist.sip
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- python-qt4-4.8.3.orig/sip/QtCore/qlist.sip	2011-02-24 10:33:27.000=
000000 +0200
> > -+++ python-qt4-4.8.3/sip/QtCore/qlist.sip	2011-02-24 10:33:18.00000000=
0 +0200
> > -@@ -811,3 +811,227 @@
> > -     return sipGetState(sipTransferObj);
> > - %End
> > - };
> > -+
> > -+// If we're on an architecture where qreal !=3D double, then we need =
to also
> > -+// explicately handle doubles. On architectures where qreal =3D=3D do=
uble, they
> > -+// will automaticially be cast upwards
> > -+
> > -+%If (!PyQt_qreal_double)
> > -+
> > -+%If (Qt_4_3_0 -)
> > -+// QList<QPair<double, double> > is implemented as a Python list of 2=
-element tuples.
> > -+%MappedType QList<QPair<double, double> >
> > -+{
> > -+%TypeHeaderCode
> > -+#include <qlist.h>
> > -+#include <qpair.h>
> > -+%End
> > -+
> > -+%ConvertFromTypeCode
> > -+    // Create the list.
> > -+    PyObject *l;
> > -+
> > -+    if ((l =3D PyList_New(sipCpp->size())) =3D=3D NULL)
> > -+        return NULL;
> > -+
> > -+    // Set the list elements.
> > -+    for (int i =3D 0; i < sipCpp->size(); ++i)
> > -+    {
> > -+        const QPair<double, double> &p =3D sipCpp->at(i);
> > -+        PyObject *pobj;
> > -+
> > -+        if ((pobj =3D Py_BuildValue((char *)"dd", p.first, p.second))=
 =3D=3D NULL)
> > -+        {
> > -+            Py_DECREF(l);
> > -+
> > -+            return NULL;
> > -+        }
> > -+
> > -+        PyList_SET_ITEM(l, i, pobj);
> > -+    }
> > -+
> > -+    return l;
> > -+%End
> > -+
> > -+%ConvertToTypeCode
> > -+    SIP_SSIZE_T len;
> > -+
> > -+    // Check the type if that is all that is required.
> > -+    if (sipIsErr =3D=3D NULL)
> > -+    {
> > -+        if (!PySequence_Check(sipPy) || (len =3D PySequence_Size(sipP=
y)) < 0)
> > -+            return 0;
> > -+
> > -+        for (SIP_SSIZE_T i =3D 0; i < len; ++i)
> > -+        {
> > -+            PyObject *tup =3D PySequence_ITEM(sipPy, i);
> > -+
> > -+            if (!PySequence_Check(tup) || PySequence_Size(tup) !=3D 2)
> > -+                return 0;
> > -+        }
> > -+
> > -+        return 1;
> > -+    }
> > -+
> > -+    QList<QPair<double, double> > *ql =3D new QList<QPair<double, dou=
ble> >;
> > -+    len =3D PySequence_Size(sipPy);
> > -+=20
> > -+    for (SIP_SSIZE_T i =3D 0; i < len; ++i)
> > -+    {
> > -+        PyObject *tup =3D PySequence_ITEM(sipPy, i);
> > -+
> > -+        double first =3D PyFloat_AsDouble(PySequence_ITEM(tup, 0));
> > -+        double second =3D PyFloat_AsDouble(PySequence_ITEM(tup, 1));
> > -+=20
> > -+        ql->append(QPair<double, double>(first, second));
> > -+    }
> > -+=20
> > -+    *sipCppPtr =3D ql;
> > -+=20
> > -+    return sipGetState(sipTransferObj);
> > -+%End
> > -+};
> > -+%End
> > -+%If (Qt_4_3_0 -)
> > -+// QList<QPair<double, TYPE> > is implemented as a Python list of 2-e=
lement tuples.
> > -+template<double, TYPE>
> > -+%MappedType QList<QPair<double, TYPE> >
> > -+{
> > -+%TypeHeaderCode
> > -+#include <qlist.h>
> > -+#include <qpair.h>
> > -+%End
> > -+
> > -+%ConvertFromTypeCode
> > -+    // Create the list.
> > -+    PyObject *l;
> > -+
> > -+    if ((l =3D PyList_New(sipCpp->size())) =3D=3D NULL)
> > -+        return NULL;
> > -+
> > -+    // Set the list elements.
> > -+    for (int i =3D 0; i < sipCpp->size(); ++i)
> > -+    {
> > -+        const QPair<double, TYPE> &p =3D sipCpp->at(i);
> > -+        TYPE *t =3D new TYPE(p.second);
> > -+        PyObject *pobj;
> > -+
> > -+        if ((pobj =3D sipBuildResult(NULL, "(dB)", p.first, t, sipCla=
ss_TYPE, sipTransferObj)) =3D=3D NULL)
> > -+        {
> > -+            Py_DECREF(l);
> > -+            delete t;
> > -+
> > -+            return NULL;
> > -+        }
> > -+
> > -+        PyList_SET_ITEM(l, i, pobj);
> > -+    }
> > -+
> > -+    return l;
> > -+%End
> > -+
> > -+%ConvertToTypeCode
> > -+    SIP_SSIZE_T len;
> > -+
> > -+    // Check the type if that is all that is required.
> > -+    if (sipIsErr =3D=3D NULL)
> > -+    {
> > -+        if (!PySequence_Check(sipPy) || (len =3D PySequence_Size(sipP=
y)) < 0)
> > -+            return 0;
> > -+
> > -+        for (SIP_SSIZE_T i =3D 0; i < len; ++i)
> > -+        {
> > -+            PyObject *tup =3D PySequence_ITEM(sipPy, i);
> > -+
> > -+            if (!PySequence_Check(tup) || PySequence_Size(tup) !=3D 2)
> > -+                return 0;
> > -+
> > -+            if (!sipCanConvertToInstance(PySequence_ITEM(tup, 1), sip=
Class_TYPE, SIP_NOT_NONE))
> > -+                return 0;
> > -+        }
> > -+
> > -+        return 1;
> > -+    }
> > -+
> > -+    QList<QPair<double, TYPE> > *ql =3D new QList<QPair<double, TYPE>=
 >;
> > -+    len =3D PySequence_Size(sipPy);
> > -+=20
> > -+    for (SIP_SSIZE_T i =3D 0; i < len; ++i)
> > -+    {
> > -+        PyObject *tup =3D PySequence_ITEM(sipPy, i);
> > -+        double d;
> > -+        int state;
> > -+
> > -+        d =3D PyFloat_AsDouble(PySequence_ITEM(tup, 0));
> > -+        TYPE *t =3D reinterpret_cast<TYPE *>(sipConvertToInstance(PyS=
equence_ITEM(tup, 1), sipClass_TYPE, sipTransferObj, SIP_NOT_NONE, &state, =
sipIsErr));
> > -+=20
> > -+        if (*sipIsErr)
> > -+        {
> > -+            sipReleaseInstance(t, sipClass_TYPE, state);
> > -+
> > -+            delete ql;
> > -+            return 0;
> > -+        }
> > -+
> > -+        ql->append(QPair<double, TYPE>(d, *t));
> > -+
> > -+        sipReleaseInstance(t, sipClass_TYPE, state);
> > -+    }
> > -+=20
> > -+    *sipCppPtr =3D ql;
> > -+=20
> > -+    return sipGetState(sipTransferObj);
> > -+%End
> > -+};
> > -+%End
> > -+
> > -+// QList<double> is implemented as a Python list of doubles.
> > -+%MappedType QList<double>
> > -+{
> > -+%TypeHeaderCode
> > -+#include <qlist.h>
> > -+%End
> > -+
> > -+%ConvertFromTypeCode
> > -+    // Create the list.
> > -+    PyObject *l;
> > -+
> > -+    if ((l =3D PyList_New(sipCpp->size())) =3D=3D NULL)
> > -+        return NULL;
> > -+
> > -+    // Set the list elements.
> > -+    for (int i =3D 0; i < sipCpp->size(); ++i)
> > -+    {
> > -+        PyObject *pobj;
> > -+
> > -+        if ((pobj =3D PyFloat_FromDouble(sipCpp->value(i))) =3D=3D NU=
LL)
> > -+        {
> > -+            Py_DECREF(l);
> > -+
> > -+            return NULL;
> > -+        }
> > -+
> > -+        PyList_SET_ITEM(l, i, pobj);
> > -+    }
> > -+
> > -+    return l;
> > -+%End
> > -+
> > -+%ConvertToTypeCode
> > -+    // Check the type if that is all that is required.
> > -+    if (sipIsErr =3D=3D NULL)
> > -+        return (PySequence_Check(sipPy) && PySequence_Size(sipPy) >=
=3D 0);
> > -+
> > -+    QList<double> *ql =3D new QList<double>;
> > -+    SIP_SSIZE_T len =3D PySequence_Size(sipPy);
> > -+=20
> > -+    for (SIP_SSIZE_T i =3D 0; i < len; ++i)
> > -+        ql->append(PyFloat_AsDouble(PySequence_ITEM(sipPy, i)));
> > -+=20
> > -+    *sipCppPtr =3D ql;
> > -+=20
> > -+    return sipGetState(sipTransferObj);
> > -+%End
> > -+};
> > -+
> > -+%End
> > diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb b/me=
ta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
> > new file mode 100644
> > index 0000000..8d47068
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
> > @@ -0,0 +1,54 @@
> > +SUMMARY =3D "Python Qt4 Bindings"
> > +AUTHOR =3D "Phil Thomson @ riverbank.co.uk"
> > +HOMEPAGE =3D "http://riverbankcomputing.co.uk"
> > +SECTION =3D "devel/python"
> > +LICENSE =3D "GPLv2 & GPLv3 & GPL_EXCEPTION"
> > +LIC_FILES_CHKSUM =3D "\
> > +    file://GPL_EXCEPTION.TXT;md5=3Db73b0be471db679533dc94781c14af58 \
> > +    file://GPL_EXCEPTION_ADDENDUM.TXT;md5=3Dc1e04ec2aa0911061005a801ab=
f81e40 \
> > +    file://OPENSOURCE-NOTICE.TXT;md5=3D6ad9123620cc04a22c394753ad4767d=
7 \
> > +    file://LICENSE.GPL2;md5=3D577ff65f6653562af318bfc3944b1f20 \
> > +    file://LICENSE.GPL3;md5=3Dfeee51612c3c1191a1d5f41156fa2c75 \
> > +"
> > +DEPENDS =3D "sip sip-native qt4-x11-free"
> > +
> > +SRC_URI =3D "\
> > +    ${SOURCEFORGE_MIRROR}/pyqt/PyQt-x11-gpl-${PV}.tar.gz \
> > +"
> > +SRC_URI[md5sum] =3D "997c3e443165a89a559e0d96b061bf70"
> > +SRC_URI[sha256sum] =3D "853780dcdbe2e6ba785d703d059b096e1fc49369d3e8d4=
1a060be874b8745686"
> > +
> > +S =3D "${WORKDIR}/PyQt-x11-gpl-${PV}"
> > +
> > +PARALLEL_MAKE =3D ""
> > +
> > +inherit qmake2 pythonnative python-dir
> > +
> > +DISABLED_FEATURES =3D "PyQt_Desktop_OpenGL PyQt_Accessibility PyQt_Ses=
sionManager"
> > +
> > +DISABLED_FEATURES_append_arm =3D " PyQt_qreal_double"
> > +
> > +do_configure() {
> > +    echo "py_platform =3D linux" > pyqt.cfg
> > +    echo "py_inc_dir =3D %(sysroot)/$includedir/python%(py_major).%(py=
_minor)" >> pyqt.cfg
> > +    echo "py_pylib_dir =3D %(sysroot)/${libdir}/python%(py_major).%(py=
_minor)" >> pyqt.cfg
> > +    echo "py_pylib_lib =3D python%(py_major).%(py_minor)mu" >> pyqt.cfg
> > +    echo "pyqt_module_dir =3D ${D}/${libdir}/python%(py_major).%(py_mi=
nor)/site-packages" >> pyqt.cfg
> > +    echo "pyqt_bin_dir =3D ${D}/${bindir}" >> pyqt.cfg
> > +    echo "pyqt_sip_dir =3D ${D}/${datadir}/sip/PyQt4" >> pyqt.cfg
> > +    echo "pyuic_interpreter =3D ${D}/${bindir}/python%(py_major).%(py_=
minor)" >> pyqt.cfg
> > +    echo "pyqt_disabled_features =3D ${DISABLED_FEATURES}" >> pyqt.cfg
> > +    echo "qt_shared =3D True" >> pyqt.cfg
> > +    echo "[Qt 4.8]" >> pyqt.cfg
> > +    echo "pyqt_modules =3D QtCore QtGui QtDeclarative QtNetwork QtSvg =
QtWebKit" >> pyqt.cfg
> > +    echo yes | python configure-ng.py --verbose --qmake  ${STAGING_BIN=
DIR_NATIVE}/qmake2 --configuration pyqt.cfg --sysroot ${STAGING_DIR_HOST}
> > +}
> > +do_install() {
> > +     oe_runmake install
> > +}
> > +
> > +RDEPENDS_${PN} =3D "python-core"
> > +
> > +FILES_${PN} +=3D "${libdir}/${PYTHON_DIR}/site-packages ${datadir}/sip=
/PyQt4/"
> > +FILES_${PN}-dbg +=3D "${libdir}/${PYTHON_DIR}/site-packages/*/.debug/"
> > +
> > diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb b/met=
a-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
> > deleted file mode 100644
> > index 2f0e189..0000000
> > --- a/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
> > +++ /dev/null
> > @@ -1,103 +0,0 @@
> > -SUMMARY =3D "Python Qt4 Bindings"
> > -HOMEPAGE =3D "http://riverbankcomputing.co.uk"
> > -AUTHOR =3D "Phil Thomson @ riverbank.co.uk"
> > -SECTION =3D "devel/python"
> > -LICENSE =3D "GPLv2 & GPLv3 & GPL_EXCEPTION"
> > -LIC_FILES_CHKSUM =3D "\
> > -    file://GPL_EXCEPTION.TXT;md5=3Db73b0be471db679533dc94781c14af58 \
> > -    file://GPL_EXCEPTION_ADDENDUM.TXT;md5=3Dc1e04ec2aa0911061005a801ab=
f81e40 \
> > -    file://OPENSOURCE-NOTICE.TXT;md5=3D6ad9123620cc04a22c394753ad4767d=
7 \
> > -    file://LICENSE.GPL2;md5=3D276c6b9cad5f85a3af3534299825feff \
> > -    file://LICENSE.GPL3;md5=3Deda942b9c6ba7eb0f40fee79e94950d5 \
> > -"
> > -
> > -DEPENDS =3D "sip-native python-sip"
> > -RDEPENDS_${PN} =3D "python-core"
> > -
> > -PYQT_OE_VERSION =3D "Qt_4_8_3"
> > -PR =3D "r1"
> > -
> > -SRC_URI =3D "\
> > -    ${SOURCEFORGE_MIRROR}/pyqt/PyQt-x11-gpl-${PV}.tar.gz \
> > -    file://pyqt-generated.patch;apply=3Dno \
> > -"
> > -SRC_URI[md5sum] =3D "514e1f9597771dc732ba75ba9fa5c6b6"
> > -SRC_URI[sha256sum] =3D "a350f9e5c6d8062671c0f29bf1a70824719b18175ce837=
2c29bf7c1eda44b18d"
> > -S =3D "${WORKDIR}/PyQt-x11-gpl-${PV}"
> > -
> > -# arm and mips machines need some extra patches
> > -SRC_URI_append_arm =3D "\
> > -    file://qreal_float_support.diff \
> > -"
> > -
> > -SRC_URI_append_mipsel =3D "\
> > -    file://qreal_float_support.diff \
> > -"
> > -
> > -inherit qt4x11 sip distutils-base
> > -
> > -PARALLEL_MAKE =3D ""
> > -
> > -QMAKE_PROFILES =3D "pyqt.pro"
> > -# NOTE: has to match with MIN(qt version we have in OE, last known Qt =
version by SIP/PyQt)
> > -EXTRA_SIPTAGS =3D "-tWS_X11 -t${PYQT_OE_VERSION} -xVendorID -xPyQt_Ses=
sionManager -xPyQt_Accessibility"
> > -EXTRA_OEMAKE =3D " MAKEFLAGS=3D "
> > -
> > -# arm and mips need extra params for the qreal issue
> > -EXTRA_SIPTAGS_append_arm =3D " -x PyQt_qreal_double"
> > -EXTRA_SIPTAGS_append_mipsel =3D " -x PyQt_qreal_double"=20
> > -
> > -SIP_MODULES =3D "QtCore QtDeclarative QtGui QtNetwork QtSql QtSvg QtXm=
l QtWebKit"
> > -MAKE_MODULES =3D "qpy ${SIP_MODULES}"
> > -
> > -EXTRA_QMAKEVARS_POST +=3D "\
> > -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/Qt \
> > -    INCLUDEPATH+=3D${STAGING_INCDIR}/${PYTHON_DIR} \
> > -    INCLUDEPATH+=3D../qpy/QtCore \
> > -    INCLUDEPATH+=3D../qpy/QtGui \
> > -    INCLUDEPATH+=3D../qpy/QtDeclarative \
> > -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtCore \
> > -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtGui \
> > -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtDeclarative \
> > -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtWebKit \
> > -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtNetwork \
> > -"
> > -FIX_QREAL =3D "\
> > -"
> > -
> > -do_generate_prepend() {
> > -    for i in ${FIX_QREAL}; do
> > -        sed -i -e s,qreal,float,g sip/$i
> > -    done
> > -}
> > -
> > -do_configure_prepend() {
> > -    printf "TEMPLATE=3Dsubdirs\nSUBDIRS=3D${MAKE_MODULES}\n" >pyqt.pro
> > -    printf "TEMPLATE=3Dsubdirs\nSUBDIRS=3DQtCore QtDeclarative QtGui\n=
" >qpy/qpy.pro
> > -    ln -sf ./qpycore.pro qpy/QtCore/QtCore.pro
> > -    ln -sf ./qpydeclarative.pro qpy/QtDeclarative/QtDeclarative.pro
> > -    ln -sf ./qpygui.pro qpy/QtGui/QtGui.pro
> > -    echo "INCLUDEPATH+=3D${S}/QtCore" >>qpy/QtCore/QtCore.pro
> > -    echo "INCLUDEPATH+=3D${S}/QtGui" >>qpy/QtGui/QtGui.pro
> > -    echo "INCLUDEPATH+=3D${S}/QtDeclarative" >>qpy/QtDeclarative/QtDec=
larative.pro
> > -    echo "LIBS+=3D-L../qpy/QtGui/ -lqpygui" >>QtGui/QtGui.pro
> > -    echo "LIBS+=3D-L../qpy/QtCore/ -lqpycore" >>QtCore/QtCore.pro
> > -    echo "LIBS+=3D-L../qpy/QtDeclarative/ -lqpydeclarative" >>QtDeclar=
ative/QtDeclarative.pro
> > -    # hack for broken generated code (duplicated sipCpp declaration).
> > -    patch -p1 < ${WORKDIR}/pyqt-generated.patch || echo "pyqt-generate=
d.patch failed to apply, probably reexecuting do_configure, ignoring that"
> > -}
> > -
> > -do_install() {
> > -    install -d ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4
> > -    install -d ${D}${datadir}/sip/qt/
> > -    for module in ${SIP_MODULES}
> > -    do
> > -        install -m 0644 ${S}/sip/${module}/*.sip ${D}${datadir}/sip/qt/
> > -        echo "from PyQt4.${module} import *\n" >> ${D}${libdir}/${PYTH=
ON_DIR}/site-packages/PyQt4/Qt.py
> > -        install -m 0755 ${module}/lib${module}.so ${D}${libdir}/${PYTH=
ON_DIR}/site-packages/PyQt4/${module}.so
> > -    done
> > -    cp -pPR elementtree ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt=
4/
> > -    cp __init__.py ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
> > -}
> > -
> > -FILES_${PN} =3D "${libdir}/${PYTHON_DIR}/site-packages ${datadir}/sip/=
qt/"
> > --=20
> > 1.8.3.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSSwAYACgkQN1Ujt2V2gByzrACfXFPyBBhK71HFRTtf0L8Xa8PW
930AnREuJH6is78/RJCBOww+rVl6k1Kr
=XDwM
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
