Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 88CB2728A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 17:34:55 +0000 (UTC)
Received: (qmail 12350 invoked by uid 1003); 18 Dec 2014 17:34:55 -0000
Received: from unknown (HELO ?192.168.1.109?) (philip@opensdr.com@71.171.45.99)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	18 Dec 2014 17:34:55 -0000
Message-ID: <5493103A.6030907@balister.org>
Date: Thu, 18 Dec 2014 12:34:50 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1417729043-11288-1-git-send-email-philip@balister.org>	<20141209175330.GR2470@jama>
	<20141218115238.GB2462@jama>
In-Reply-To: <20141218115238.GB2462@jama>
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
X-List-Received-Date: Thu, 18 Dec 2014 17:34:57 -0000
X-Groupsio-MsgNum: 53387
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="hIuElKL0gJHIcJnQLA2oEOSS4SxIlingg"

--hIuElKL0gJHIcJnQLA2oEOSS4SxIlingg
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/18/2014 06:52 AM, Martin Jansa wrote:
> On Tue, Dec 09, 2014 at 06:53:30PM +0100, Martin Jansa wrote:
>> On Thu, Dec 04, 2014 at 04:37:23PM -0500, Philip Balister wrote:
>>> The configure.py script now has support for cross compiling. This
>>> simplified the recipe substantially.
>>>
>>> The recipe was tested with gnuradio-companion on the zedboard and
>>> ettus-e300. This is the first time we have been able to use grc with
>>> pyqt built with OpenEmbedded.
>>>
>>> Build tested on armv7, x86, x86_64 and mips.
>>>
>>> Dropped patches from previous versions.
>>
>> Now it failed in qemuarm build already:
>> | cd QtCore/ && make -f Makefile
>> | make[1]: Entering directory `/home/jenkins/oe/world/shr-core/tmp-gli=
bc/work/armv5te-oe-linux-gnueabi/python-pyqt/4.11.3-r0/PyQt-x11-gpl-4.11.=
3/QtCore'
>> | arm-oe-linux-gnueabi-g++  -march=3Darmv5te -marm -mthumb-interwork -=
-sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -c =
-pipe  -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-h=
idden -fno-exceptions -O2 -Wall -W -D_REENTRANT -fPIC -DSIP_PROTECTED_IS_=
PUBLIC -Dprotected=3Dpublic -DQT_NO_DEBUG -DQT_PLUGIN -DQT_CORE_LIB -DQT_=
SHARED -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/s=
hare/qt4/mkspecs/linux-g++ -I. -I/home/jenkins/oe/world/shr-core/tmp-glib=
c/sysroots/qemuarm/usr/include/qt4/QtCore -I/home/jenkins/oe/world/shr-co=
re/tmp-glibc/sysroots/qemuarm/usr/include/qt4 -I. -I/home/jenkins/oe/worl=
d/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/python2.7 -I../qpy/QtCo=
re -I. -o qpycore_post_init.o qpycore_post_init.cpp
>> | In file included from ../qpy/QtCore/qpycore_sip.h:32:0,
>> |                  from ../qpy/QtCore/qpycore_chimera.h:38,
>> |                  from ../qpy/QtCore/qpycore_pyqtsignal.h:32,
>> |                  from ../qpy/QtCore/qpycore_pyqtboundsignal.h:32,
>> |                  from qpycore_post_init.cpp:31:
>> | ./sipAPIQtCore.h:33:17: fatal error: sip.h: No such file or director=
y
>> |  #include <sip.h>
>> |                  ^
>> | compilation terminated.
>> | make[1]: *** [qpycore_post_init.o] Error 1
>> | make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glib=
c/work/armv5te-oe-linux-gnueabi/python-pyqt/4.11.3-r0/PyQt-x11-gpl-4.11.3=
/QtCore'
>> | make: *** [sub-QtCore-make_default-ordered] Error 2
>> | ERROR: oe_runmake failed
>> | WARNING: exit code 1 from a shell command.
>> | ERROR: Function failed: do_compile (log file is located at /home/jen=
kins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/python-pyq=
t/4.11.3-r0/temp/log.do_compile.23996)
>> NOTE: recipe python-pyqt-4.11.3-r0: task do_compile: Failed
>> ERROR: Task 20206 (/home/jenkins/oe/world/shr-core/meta-openembedded/m=
eta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb, do_compile) failed =
with exit code '1'
>=20
> sstate-sysroot-cruft script reports that it's bypassing sstate when
> starging sip.h
>=20
> ERROR: Following files are installed in sysroot, but not tracked by
> sstate:
> qemuarm/usr/include/python2.7/sip.h
>=20
> So it fails like this when it is reused from sstate.

Thanks. I think I found the problem. A pox on people that make their own
build systems :)

Philip

>=20
> Regards,
>=20
>>> Signed-off-by: Philip Balister <philip@balister.org>
>>> ---
>>>  .../python/python-pyqt-4.9.6/pyqt-generated.patch  |  12 -
>>>  .../python-pyqt-4.9.6/qreal_float_support.diff     | 248 -----------=
----------
>>>  .../recipes-devtools/python/python-pyqt_4.11.3.bb  |  54 +++++
>>>  .../recipes-devtools/python/python-pyqt_4.9.6.bb   | 103 ---------
>>>  4 files changed, 54 insertions(+), 363 deletions(-)
>>>  delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6=
/pyqt-generated.patch
>>>  delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6=
/qreal_float_support.diff
>>>  create mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.11.=
3.bb
>>>  delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.9.6=
=2Ebb
>>>
>>> diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-g=
enerated.patch b/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-g=
enerated.patch
>>> deleted file mode 100644
>>> index 6579aa4..0000000
>>> --- a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generate=
d.patch
>>> +++ /dev/null
>>> @@ -1,12 +0,0 @@
>>> -diff -uNr PyQt-x11-gpl-4.9.5.orig/QtGui/sipQtGuiQSystemTrayIcon.cpp =
PyQt-x11-gpl-4.9.5/QtGui/sipQtGuiQSystemTrayIcon.cpp
>>> ---- PyQt-x11-gpl-4.9.5.orig/QtGui/sipQtGuiQSystemTrayIcon.cpp	2012-1=
0-01 16:48:16.496700577 +0200
>>> -+++ PyQt-x11-gpl-4.9.5/QtGui/sipQtGuiQSystemTrayIcon.cpp	2012-10-01 =
21:40:43.063130099 +0200
>>> -@@ -993,8 +993,6 @@
>>> -         qtgui_untrack(sipCpp);
>>> - #line 995 "QtGui/sipQtGuiQSystemTrayIcon.cpp"
>>> -=20
>>> --    QSystemTrayIcon *sipCpp =3D reinterpret_cast<QSystemTrayIcon *>=
(sipCppV);
>>> --
>>> -     if (QThread::currentThread() =3D=3D sipCpp->thread())
>>> -         delete sipCpp;
>>> -     else
>>> diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_=
float_support.diff b/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qr=
eal_float_support.diff
>>> deleted file mode 100644
>>> index abdf70f..0000000
>>> --- a/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_s=
upport.diff
>>> +++ /dev/null
>>> @@ -1,248 +0,0 @@
>>> -## 03_qreal_float_support.dpatch by Michael Casadevall <sonicmctails=
@gmail.com>
>>> -Index: python-qt4-4.8.3/configure.py
>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> ---- python-qt4-4.8.3.orig/configure.py	2011-02-24 10:33:30.000000000=
 +0200
>>> -+++ python-qt4-4.8.3/configure.py	2011-02-24 10:33:18.000000000 +020=
0
>>> -@@ -2004,8 +2004,9 @@
>>> -     out << "PyQt_NoOpenGLES\\n";
>>> - #endif
>>> -=20
>>> --    if (sizeof (qreal) !=3D sizeof (double))
>>> -+#if defined(QT_NO_FPU) || defined(QT_ARCH_ARM) || defined(QT_ARCH_W=
INDOWSCE)
>>> -         out << "PyQt_qreal_double\\n";
>>> -+#endif
>>> -=20
>>> -     return 0;
>>> - }
>>> -Index: python-qt4-4.8.3/sip/QtCore/qlist.sip
>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> ---- python-qt4-4.8.3.orig/sip/QtCore/qlist.sip	2011-02-24 10:33:27.0=
00000000 +0200
>>> -+++ python-qt4-4.8.3/sip/QtCore/qlist.sip	2011-02-24 10:33:18.000000=
000 +0200
>>> -@@ -811,3 +811,227 @@
>>> -     return sipGetState(sipTransferObj);
>>> - %End
>>> - };
>>> -+
>>> -+// If we're on an architecture where qreal !=3D double, then we nee=
d to also
>>> -+// explicately handle doubles. On architectures where qreal =3D=3D =
double, they
>>> -+// will automaticially be cast upwards
>>> -+
>>> -+%If (!PyQt_qreal_double)
>>> -+
>>> -+%If (Qt_4_3_0 -)
>>> -+// QList<QPair<double, double> > is implemented as a Python list of=
 2-element tuples.
>>> -+%MappedType QList<QPair<double, double> >
>>> -+{
>>> -+%TypeHeaderCode
>>> -+#include <qlist.h>
>>> -+#include <qpair.h>
>>> -+%End
>>> -+
>>> -+%ConvertFromTypeCode
>>> -+    // Create the list.
>>> -+    PyObject *l;
>>> -+
>>> -+    if ((l =3D PyList_New(sipCpp->size())) =3D=3D NULL)
>>> -+        return NULL;
>>> -+
>>> -+    // Set the list elements.
>>> -+    for (int i =3D 0; i < sipCpp->size(); ++i)
>>> -+    {
>>> -+        const QPair<double, double> &p =3D sipCpp->at(i);
>>> -+        PyObject *pobj;
>>> -+
>>> -+        if ((pobj =3D Py_BuildValue((char *)"dd", p.first, p.second=
)) =3D=3D NULL)
>>> -+        {
>>> -+            Py_DECREF(l);
>>> -+
>>> -+            return NULL;
>>> -+        }
>>> -+
>>> -+        PyList_SET_ITEM(l, i, pobj);
>>> -+    }
>>> -+
>>> -+    return l;
>>> -+%End
>>> -+
>>> -+%ConvertToTypeCode
>>> -+    SIP_SSIZE_T len;
>>> -+
>>> -+    // Check the type if that is all that is required.
>>> -+    if (sipIsErr =3D=3D NULL)
>>> -+    {
>>> -+        if (!PySequence_Check(sipPy) || (len =3D PySequence_Size(si=
pPy)) < 0)
>>> -+            return 0;
>>> -+
>>> -+        for (SIP_SSIZE_T i =3D 0; i < len; ++i)
>>> -+        {
>>> -+            PyObject *tup =3D PySequence_ITEM(sipPy, i);
>>> -+
>>> -+            if (!PySequence_Check(tup) || PySequence_Size(tup) !=3D=
 2)
>>> -+                return 0;
>>> -+        }
>>> -+
>>> -+        return 1;
>>> -+    }
>>> -+
>>> -+    QList<QPair<double, double> > *ql =3D new QList<QPair<double, d=
ouble> >;
>>> -+    len =3D PySequence_Size(sipPy);
>>> -+=20
>>> -+    for (SIP_SSIZE_T i =3D 0; i < len; ++i)
>>> -+    {
>>> -+        PyObject *tup =3D PySequence_ITEM(sipPy, i);
>>> -+
>>> -+        double first =3D PyFloat_AsDouble(PySequence_ITEM(tup, 0));=

>>> -+        double second =3D PyFloat_AsDouble(PySequence_ITEM(tup, 1))=
;
>>> -+=20
>>> -+        ql->append(QPair<double, double>(first, second));
>>> -+    }
>>> -+=20
>>> -+    *sipCppPtr =3D ql;
>>> -+=20
>>> -+    return sipGetState(sipTransferObj);
>>> -+%End
>>> -+};
>>> -+%End
>>> -+%If (Qt_4_3_0 -)
>>> -+// QList<QPair<double, TYPE> > is implemented as a Python list of 2=
-element tuples.
>>> -+template<double, TYPE>
>>> -+%MappedType QList<QPair<double, TYPE> >
>>> -+{
>>> -+%TypeHeaderCode
>>> -+#include <qlist.h>
>>> -+#include <qpair.h>
>>> -+%End
>>> -+
>>> -+%ConvertFromTypeCode
>>> -+    // Create the list.
>>> -+    PyObject *l;
>>> -+
>>> -+    if ((l =3D PyList_New(sipCpp->size())) =3D=3D NULL)
>>> -+        return NULL;
>>> -+
>>> -+    // Set the list elements.
>>> -+    for (int i =3D 0; i < sipCpp->size(); ++i)
>>> -+    {
>>> -+        const QPair<double, TYPE> &p =3D sipCpp->at(i);
>>> -+        TYPE *t =3D new TYPE(p.second);
>>> -+        PyObject *pobj;
>>> -+
>>> -+        if ((pobj =3D sipBuildResult(NULL, "(dB)", p.first, t, sipC=
lass_TYPE, sipTransferObj)) =3D=3D NULL)
>>> -+        {
>>> -+            Py_DECREF(l);
>>> -+            delete t;
>>> -+
>>> -+            return NULL;
>>> -+        }
>>> -+
>>> -+        PyList_SET_ITEM(l, i, pobj);
>>> -+    }
>>> -+
>>> -+    return l;
>>> -+%End
>>> -+
>>> -+%ConvertToTypeCode
>>> -+    SIP_SSIZE_T len;
>>> -+
>>> -+    // Check the type if that is all that is required.
>>> -+    if (sipIsErr =3D=3D NULL)
>>> -+    {
>>> -+        if (!PySequence_Check(sipPy) || (len =3D PySequence_Size(si=
pPy)) < 0)
>>> -+            return 0;
>>> -+
>>> -+        for (SIP_SSIZE_T i =3D 0; i < len; ++i)
>>> -+        {
>>> -+            PyObject *tup =3D PySequence_ITEM(sipPy, i);
>>> -+
>>> -+            if (!PySequence_Check(tup) || PySequence_Size(tup) !=3D=
 2)
>>> -+                return 0;
>>> -+
>>> -+            if (!sipCanConvertToInstance(PySequence_ITEM(tup, 1), s=
ipClass_TYPE, SIP_NOT_NONE))
>>> -+                return 0;
>>> -+        }
>>> -+
>>> -+        return 1;
>>> -+    }
>>> -+
>>> -+    QList<QPair<double, TYPE> > *ql =3D new QList<QPair<double, TYP=
E> >;
>>> -+    len =3D PySequence_Size(sipPy);
>>> -+=20
>>> -+    for (SIP_SSIZE_T i =3D 0; i < len; ++i)
>>> -+    {
>>> -+        PyObject *tup =3D PySequence_ITEM(sipPy, i);
>>> -+        double d;
>>> -+        int state;
>>> -+
>>> -+        d =3D PyFloat_AsDouble(PySequence_ITEM(tup, 0));
>>> -+        TYPE *t =3D reinterpret_cast<TYPE *>(sipConvertToInstance(P=
ySequence_ITEM(tup, 1), sipClass_TYPE, sipTransferObj, SIP_NOT_NONE, &sta=
te, sipIsErr));
>>> -+=20
>>> -+        if (*sipIsErr)
>>> -+        {
>>> -+            sipReleaseInstance(t, sipClass_TYPE, state);
>>> -+
>>> -+            delete ql;
>>> -+            return 0;
>>> -+        }
>>> -+
>>> -+        ql->append(QPair<double, TYPE>(d, *t));
>>> -+
>>> -+        sipReleaseInstance(t, sipClass_TYPE, state);
>>> -+    }
>>> -+=20
>>> -+    *sipCppPtr =3D ql;
>>> -+=20
>>> -+    return sipGetState(sipTransferObj);
>>> -+%End
>>> -+};
>>> -+%End
>>> -+
>>> -+// QList<double> is implemented as a Python list of doubles.
>>> -+%MappedType QList<double>
>>> -+{
>>> -+%TypeHeaderCode
>>> -+#include <qlist.h>
>>> -+%End
>>> -+
>>> -+%ConvertFromTypeCode
>>> -+    // Create the list.
>>> -+    PyObject *l;
>>> -+
>>> -+    if ((l =3D PyList_New(sipCpp->size())) =3D=3D NULL)
>>> -+        return NULL;
>>> -+
>>> -+    // Set the list elements.
>>> -+    for (int i =3D 0; i < sipCpp->size(); ++i)
>>> -+    {
>>> -+        PyObject *pobj;
>>> -+
>>> -+        if ((pobj =3D PyFloat_FromDouble(sipCpp->value(i))) =3D=3D =
NULL)
>>> -+        {
>>> -+            Py_DECREF(l);
>>> -+
>>> -+            return NULL;
>>> -+        }
>>> -+
>>> -+        PyList_SET_ITEM(l, i, pobj);
>>> -+    }
>>> -+
>>> -+    return l;
>>> -+%End
>>> -+
>>> -+%ConvertToTypeCode
>>> -+    // Check the type if that is all that is required.
>>> -+    if (sipIsErr =3D=3D NULL)
>>> -+        return (PySequence_Check(sipPy) && PySequence_Size(sipPy) >=
=3D 0);
>>> -+
>>> -+    QList<double> *ql =3D new QList<double>;
>>> -+    SIP_SSIZE_T len =3D PySequence_Size(sipPy);
>>> -+=20
>>> -+    for (SIP_SSIZE_T i =3D 0; i < len; ++i)
>>> -+        ql->append(PyFloat_AsDouble(PySequence_ITEM(sipPy, i)));
>>> -+=20
>>> -+    *sipCppPtr =3D ql;
>>> -+=20
>>> -+    return sipGetState(sipTransferObj);
>>> -+%End
>>> -+};
>>> -+
>>> -+%End
>>> diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb b/=
meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
>>> new file mode 100644
>>> index 0000000..8d47068
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
>>> @@ -0,0 +1,54 @@
>>> +SUMMARY =3D "Python Qt4 Bindings"
>>> +AUTHOR =3D "Phil Thomson @ riverbank.co.uk"
>>> +HOMEPAGE =3D "http://riverbankcomputing.co.uk"
>>> +SECTION =3D "devel/python"
>>> +LICENSE =3D "GPLv2 & GPLv3 & GPL_EXCEPTION"
>>> +LIC_FILES_CHKSUM =3D "\
>>> +    file://GPL_EXCEPTION.TXT;md5=3Db73b0be471db679533dc94781c14af58 =
\
>>> +    file://GPL_EXCEPTION_ADDENDUM.TXT;md5=3Dc1e04ec2aa0911061005a801=
abf81e40 \
>>> +    file://OPENSOURCE-NOTICE.TXT;md5=3D6ad9123620cc04a22c394753ad476=
7d7 \
>>> +    file://LICENSE.GPL2;md5=3D577ff65f6653562af318bfc3944b1f20 \
>>> +    file://LICENSE.GPL3;md5=3Dfeee51612c3c1191a1d5f41156fa2c75 \
>>> +"
>>> +DEPENDS =3D "sip sip-native qt4-x11-free"
>>> +
>>> +SRC_URI =3D "\
>>> +    ${SOURCEFORGE_MIRROR}/pyqt/PyQt-x11-gpl-${PV}.tar.gz \
>>> +"
>>> +SRC_URI[md5sum] =3D "997c3e443165a89a559e0d96b061bf70"
>>> +SRC_URI[sha256sum] =3D "853780dcdbe2e6ba785d703d059b096e1fc49369d3e8=
d41a060be874b8745686"
>>> +
>>> +S =3D "${WORKDIR}/PyQt-x11-gpl-${PV}"
>>> +
>>> +PARALLEL_MAKE =3D ""
>>> +
>>> +inherit qmake2 pythonnative python-dir
>>> +
>>> +DISABLED_FEATURES =3D "PyQt_Desktop_OpenGL PyQt_Accessibility PyQt_S=
essionManager"
>>> +
>>> +DISABLED_FEATURES_append_arm =3D " PyQt_qreal_double"
>>> +
>>> +do_configure() {
>>> +    echo "py_platform =3D linux" > pyqt.cfg
>>> +    echo "py_inc_dir =3D %(sysroot)/$includedir/python%(py_major).%(=
py_minor)" >> pyqt.cfg
>>> +    echo "py_pylib_dir =3D %(sysroot)/${libdir}/python%(py_major).%(=
py_minor)" >> pyqt.cfg
>>> +    echo "py_pylib_lib =3D python%(py_major).%(py_minor)mu" >> pyqt.=
cfg
>>> +    echo "pyqt_module_dir =3D ${D}/${libdir}/python%(py_major).%(py_=
minor)/site-packages" >> pyqt.cfg
>>> +    echo "pyqt_bin_dir =3D ${D}/${bindir}" >> pyqt.cfg
>>> +    echo "pyqt_sip_dir =3D ${D}/${datadir}/sip/PyQt4" >> pyqt.cfg
>>> +    echo "pyuic_interpreter =3D ${D}/${bindir}/python%(py_major).%(p=
y_minor)" >> pyqt.cfg
>>> +    echo "pyqt_disabled_features =3D ${DISABLED_FEATURES}" >> pyqt.c=
fg
>>> +    echo "qt_shared =3D True" >> pyqt.cfg
>>> +    echo "[Qt 4.8]" >> pyqt.cfg
>>> +    echo "pyqt_modules =3D QtCore QtGui QtDeclarative QtNetwork QtSv=
g QtWebKit" >> pyqt.cfg
>>> +    echo yes | python configure-ng.py --verbose --qmake  ${STAGING_B=
INDIR_NATIVE}/qmake2 --configuration pyqt.cfg --sysroot ${STAGING_DIR_HOS=
T}
>>> +}
>>> +do_install() {
>>> +     oe_runmake install
>>> +}
>>> +
>>> +RDEPENDS_${PN} =3D "python-core"
>>> +
>>> +FILES_${PN} +=3D "${libdir}/${PYTHON_DIR}/site-packages ${datadir}/s=
ip/PyQt4/"
>>> +FILES_${PN}-dbg +=3D "${libdir}/${PYTHON_DIR}/site-packages/*/.debug=
/"
>>> +
>>> diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb b/m=
eta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
>>> deleted file mode 100644
>>> index 2f0e189..0000000
>>> --- a/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
>>> +++ /dev/null
>>> @@ -1,103 +0,0 @@
>>> -SUMMARY =3D "Python Qt4 Bindings"
>>> -HOMEPAGE =3D "http://riverbankcomputing.co.uk"
>>> -AUTHOR =3D "Phil Thomson @ riverbank.co.uk"
>>> -SECTION =3D "devel/python"
>>> -LICENSE =3D "GPLv2 & GPLv3 & GPL_EXCEPTION"
>>> -LIC_FILES_CHKSUM =3D "\
>>> -    file://GPL_EXCEPTION.TXT;md5=3Db73b0be471db679533dc94781c14af58 =
\
>>> -    file://GPL_EXCEPTION_ADDENDUM.TXT;md5=3Dc1e04ec2aa0911061005a801=
abf81e40 \
>>> -    file://OPENSOURCE-NOTICE.TXT;md5=3D6ad9123620cc04a22c394753ad476=
7d7 \
>>> -    file://LICENSE.GPL2;md5=3D276c6b9cad5f85a3af3534299825feff \
>>> -    file://LICENSE.GPL3;md5=3Deda942b9c6ba7eb0f40fee79e94950d5 \
>>> -"
>>> -
>>> -DEPENDS =3D "sip-native python-sip"
>>> -RDEPENDS_${PN} =3D "python-core"
>>> -
>>> -PYQT_OE_VERSION =3D "Qt_4_8_3"
>>> -PR =3D "r1"
>>> -
>>> -SRC_URI =3D "\
>>> -    ${SOURCEFORGE_MIRROR}/pyqt/PyQt-x11-gpl-${PV}.tar.gz \
>>> -    file://pyqt-generated.patch;apply=3Dno \
>>> -"
>>> -SRC_URI[md5sum] =3D "514e1f9597771dc732ba75ba9fa5c6b6"
>>> -SRC_URI[sha256sum] =3D "a350f9e5c6d8062671c0f29bf1a70824719b18175ce8=
372c29bf7c1eda44b18d"
>>> -S =3D "${WORKDIR}/PyQt-x11-gpl-${PV}"
>>> -
>>> -# arm and mips machines need some extra patches
>>> -SRC_URI_append_arm =3D "\
>>> -    file://qreal_float_support.diff \
>>> -"
>>> -
>>> -SRC_URI_append_mipsel =3D "\
>>> -    file://qreal_float_support.diff \
>>> -"
>>> -
>>> -inherit qt4x11 sip distutils-base
>>> -
>>> -PARALLEL_MAKE =3D ""
>>> -
>>> -QMAKE_PROFILES =3D "pyqt.pro"
>>> -# NOTE: has to match with MIN(qt version we have in OE, last known Q=
t version by SIP/PyQt)
>>> -EXTRA_SIPTAGS =3D "-tWS_X11 -t${PYQT_OE_VERSION} -xVendorID -xPyQt_S=
essionManager -xPyQt_Accessibility"
>>> -EXTRA_OEMAKE =3D " MAKEFLAGS=3D "
>>> -
>>> -# arm and mips need extra params for the qreal issue
>>> -EXTRA_SIPTAGS_append_arm =3D " -x PyQt_qreal_double"
>>> -EXTRA_SIPTAGS_append_mipsel =3D " -x PyQt_qreal_double"=20
>>> -
>>> -SIP_MODULES =3D "QtCore QtDeclarative QtGui QtNetwork QtSql QtSvg Qt=
Xml QtWebKit"
>>> -MAKE_MODULES =3D "qpy ${SIP_MODULES}"
>>> -
>>> -EXTRA_QMAKEVARS_POST +=3D "\
>>> -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/Qt \
>>> -    INCLUDEPATH+=3D${STAGING_INCDIR}/${PYTHON_DIR} \
>>> -    INCLUDEPATH+=3D../qpy/QtCore \
>>> -    INCLUDEPATH+=3D../qpy/QtGui \
>>> -    INCLUDEPATH+=3D../qpy/QtDeclarative \
>>> -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtCore \
>>> -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtGui \
>>> -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtDeclarative \
>>> -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtWebKit \
>>> -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtNetwork \
>>> -"
>>> -FIX_QREAL =3D "\
>>> -"
>>> -
>>> -do_generate_prepend() {
>>> -    for i in ${FIX_QREAL}; do
>>> -        sed -i -e s,qreal,float,g sip/$i
>>> -    done
>>> -}
>>> -
>>> -do_configure_prepend() {
>>> -    printf "TEMPLATE=3Dsubdirs\nSUBDIRS=3D${MAKE_MODULES}\n" >pyqt.p=
ro
>>> -    printf "TEMPLATE=3Dsubdirs\nSUBDIRS=3DQtCore QtDeclarative QtGui=
\n" >qpy/qpy.pro
>>> -    ln -sf ./qpycore.pro qpy/QtCore/QtCore.pro
>>> -    ln -sf ./qpydeclarative.pro qpy/QtDeclarative/QtDeclarative.pro
>>> -    ln -sf ./qpygui.pro qpy/QtGui/QtGui.pro
>>> -    echo "INCLUDEPATH+=3D${S}/QtCore" >>qpy/QtCore/QtCore.pro
>>> -    echo "INCLUDEPATH+=3D${S}/QtGui" >>qpy/QtGui/QtGui.pro
>>> -    echo "INCLUDEPATH+=3D${S}/QtDeclarative" >>qpy/QtDeclarative/QtD=
eclarative.pro
>>> -    echo "LIBS+=3D-L../qpy/QtGui/ -lqpygui" >>QtGui/QtGui.pro
>>> -    echo "LIBS+=3D-L../qpy/QtCore/ -lqpycore" >>QtCore/QtCore.pro
>>> -    echo "LIBS+=3D-L../qpy/QtDeclarative/ -lqpydeclarative" >>QtDecl=
arative/QtDeclarative.pro
>>> -    # hack for broken generated code (duplicated sipCpp declaration)=
=2E
>>> -    patch -p1 < ${WORKDIR}/pyqt-generated.patch || echo "pyqt-genera=
ted.patch failed to apply, probably reexecuting do_configure, ignoring th=
at"
>>> -}
>>> -
>>> -do_install() {
>>> -    install -d ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4
>>> -    install -d ${D}${datadir}/sip/qt/
>>> -    for module in ${SIP_MODULES}
>>> -    do
>>> -        install -m 0644 ${S}/sip/${module}/*.sip ${D}${datadir}/sip/=
qt/
>>> -        echo "from PyQt4.${module} import *\n" >> ${D}${libdir}/${PY=
THON_DIR}/site-packages/PyQt4/Qt.py
>>> -        install -m 0755 ${module}/lib${module}.so ${D}${libdir}/${PY=
THON_DIR}/site-packages/PyQt4/${module}.so
>>> -    done
>>> -    cp -pPR elementtree ${D}${libdir}/${PYTHON_DIR}/site-packages/Py=
Qt4/
>>> -    cp __init__.py ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
>>> -}
>>> -
>>> -FILES_${PN} =3D "${libdir}/${PYTHON_DIR}/site-packages ${datadir}/si=
p/qt/"
>>> --=20
>>> 1.8.3.1
>>>
>>> --=20
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --=20
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
>=20
>=20


--hIuElKL0gJHIcJnQLA2oEOSS4SxIlingg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUkxA+AAoJEMDJd4rr0meraQ4H/2QaHACMIVAZCgrrxgOFIbHV
27Ei/rajyYNY6X36XIxNuAp3p75xeYkQfD8mpVwATVX5VqOlwsCkge4+pEPS1dBG
Rfx7MQTgx+x1oPDkHY5lgqcMSUYHaIjGblSy/VgVaOMK1H8P/ttMbdvmps4THLT6
1WwaqH2U+fNZ0Lg+GeuBP2NbI27xB+dGPNR+q4dzH25DPw0RzWHdKDsGfEpZgNrR
pqt98zB5ry5QO7fZRWMsZtAVLiLZfWYhiHsKAeJw3PQN1xdkOrLqfx52X/ZdG3PA
XcesXs+aRtuD9HajG3EnokHViVJAdVGd3YtM/xJvOI42oQGXSe6Dbt43nAvzgUk=
=pCGj
-----END PGP SIGNATURE-----

--hIuElKL0gJHIcJnQLA2oEOSS4SxIlingg--
