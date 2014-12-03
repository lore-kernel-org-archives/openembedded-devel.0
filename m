Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7574C65CA7
	for <openembedded-devel@openembedded.org>;
	Wed,  3 Dec 2014 15:09:06 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so19985868wgh.30
	for <openembedded-devel@openembedded.org>;
	Wed, 03 Dec 2014 07:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5Fhg6xT8z05m6qat6X3VDyCydBKkYtSxkOVN6Ctj+DM=;
	b=TxW527kCN8y9A5ktSAJHkqVtVyFCFA01mDzn+ZkIc8q2Pm0sBZq6JDwPConq8Gkfyy
	XNWYWN+dSU1RDOA7934MVIxIyU4llB+FYkK4Wo7Gg2YhBQwQwLRl6LhH8l3+bjpqkdiL
	5HVjzJtitcI2hTkeodLbQKAmie1gaNM4nwhfDdGPRRFDOAew9/aZ/Qo72Jt4H+vGj8U6
	7JKltQTI90DEyVvN87gDd0H3vqUIE/mozcCB6jBZ5T68p2LdZRiqLNMZ0getMdQqc8oy
	ppwjP4QYi6s0X1v4j3sr0NVmibCjkEXdZaHAlOKYHoc+YA6bT1+BUGF4cmYPEYOwzVRB
	7bog==
X-Received: by 10.194.238.40 with SMTP id vh8mr8153776wjc.57.1417619346730;
	Wed, 03 Dec 2014 07:09:06 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t6sm25488514wjf.49.2014.12.03.07.09.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Dec 2014 07:09:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Dec 2014 16:09:07 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141203150907.GA2455@jama>
References: <1416931776-13600-1-git-send-email-philip@balister.org>
	<1416931776-13600-2-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1416931776-13600-2-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@openembedded.org
Subject: Re: [meta-oe][PATCH 2/3] python-pyqt : Update to 4.11.3.
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
X-List-Received-Date: Wed, 03 Dec 2014 15:09:09 -0000
X-Groupsio-MsgNum: 53167
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2014 at 11:09:35AM -0500, Philip Balister wrote:
> The configure.py script now has support for cross compiling. This
> simplified the recipe substantially.
>=20
> The recipe was tested with gnuradio-companion on the zedboard and
> ettus-e300. This is the first time we have been able to use grc with
> pyqt built with OpenEmbedded.

Fails to build for qemux86 in world builds:

| i586-oe-linux-g++  -m32 -march=3Di586 --sysroot=3D/home/jenkins/oe/world/=
shr-core/tmp-glibc/sysroots/qemux86 -c -pipe  -O2 -pipe -g -feliminate-unus=
ed-debug-types -fvisibility-inlines-hidden -fno-exceptions -O2 -Wall -W -D_=
REENTRANT -fPIC -DSIP_PROTECTED_IS_PUBLIC -Dprotected=3Dpublic -DQT_NO_DEBU=
G -DQT_PLUGIN -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED -I/home/jenkins/oe/wor=
ld/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qt4/mkspecs/linux-g++ -I. =
-I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/qt=
4/QtCore -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/i=
nclude/qt4/QtGui -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux=
86/usr/include/qt4 -I. -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots=
/qemux86/usr/include/python2.7 -I../qpy/QtGui -I. -o sipQtGuiQGraphicsLayou=
t.o sipQtGuiQGraphicsLayout.cpp
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python-pyqt/=
4.11.3-r0/PyQt-x11-gpl-4.11.3/QtGui/sipQtGuiQGraphicsLayout.cpp: In member =
function 'virtual void sipQGraphicsLayout::getContentsMargins(qreal*, qreal=
*, qreal*, qreal*) const':
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python-pyqt/=
4.11.3-r0/PyQt-x11-gpl-4.11.3/QtGui/sipQtGuiQGraphicsLayout.cpp:246:71: err=
or: cannot convert 'qreal* {aka double*}' to 'float*' for argument '5' to '=
void sipVH_QtGui_197(sip_gilstate_t, sipVirtErrorHandlerFunc, sipSimpleWrap=
per*, PyObject*, float*, float*, float*, float*)'
|      sipVH_QtGui_197(sipGILState, 0, sipPySelf, sipMeth, a0, a1, a2, a3);
|                                                                        ^
| make[1]: *** [sipQtGuiQGraphicsLayout.o] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/i586-oe-linux/python-pyqt/4.11.3-r0/PyQt-x11-gpl-4.11.3/QtGui'
| make: *** [sub-QtGui-make_default-ordered] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python-pyqt/4.11.3-r0/temp/l=
og.do_compile.19265)
NOTE: recipe python-pyqt-4.11.3-r0: task do_compile: Failed
ERROR: Task 20439 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-o=
e/recipes-devtools/python/python-pyqt_4.11.3.bb, do_compile) failed with ex=
it code '1'


>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  .../recipes-devtools/python/python-pyqt_4.11.3.bb  |  50 ++++++++++
>  .../recipes-devtools/python/python-pyqt_4.9.6.bb   | 103 ---------------=
------
>  2 files changed, 50 insertions(+), 103 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
>  delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb b/meta=
-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
> new file mode 100644
> index 0000000..5ced2ad
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
> @@ -0,0 +1,50 @@
> +SUMMARY =3D "Python Qt4 Bindings"
> +AUTHOR =3D "Phil Thomson @ riverbank.co.uk"
> +HOMEPAGE =3D "http://riverbankcomputing.co.uk"
> +SECTION =3D "devel/python"
> +LICENSE =3D "GPLv2 & GPLv3 & GPL_EXCEPTION"
> +LIC_FILES_CHKSUM =3D "\
> +    file://GPL_EXCEPTION.TXT;md5=3Db73b0be471db679533dc94781c14af58 \
> +    file://GPL_EXCEPTION_ADDENDUM.TXT;md5=3Dc1e04ec2aa0911061005a801abf8=
1e40 \
> +    file://OPENSOURCE-NOTICE.TXT;md5=3D6ad9123620cc04a22c394753ad4767d7 \
> +    file://LICENSE.GPL2;md5=3D577ff65f6653562af318bfc3944b1f20 \
> +    file://LICENSE.GPL3;md5=3Dfeee51612c3c1191a1d5f41156fa2c75 \
> +"
> +DEPENDS =3D "sip sip-native qt4-x11-free"
> +
> +SRC_URI =3D "\
> +    ${SOURCEFORGE_MIRROR}/pyqt/PyQt-x11-gpl-${PV}.tar.gz \
> +"
> +SRC_URI[md5sum] =3D "997c3e443165a89a559e0d96b061bf70"
> +SRC_URI[sha256sum] =3D "853780dcdbe2e6ba785d703d059b096e1fc49369d3e8d41a=
060be874b8745686"
> +
> +S =3D "${WORKDIR}/PyQt-x11-gpl-${PV}"
> +
> +PARALLEL_MAKE =3D ""
> +
> +inherit qmake2 pythonnative python-dir
> +
> +do_configure() {
> +    echo "py_platform =3D linux" > pyqt.cfg
> +    echo "py_inc_dir =3D %(sysroot)/$includedir/python%(py_major).%(py_m=
inor)" >> pyqt.cfg
> +    echo "py_pylib_dir =3D %(sysroot)/${libdir}/python%(py_major).%(py_m=
inor)" >> pyqt.cfg
> +    echo "py_pylib_lib =3D python%(py_major).%(py_minor)mu" >> pyqt.cfg
> +    echo "pyqt_module_dir =3D ${D}/${libdir}/python%(py_major).%(py_mino=
r)/site-packages" >> pyqt.cfg
> +    echo "pyqt_bin_dir =3D ${D}/${bindir}" >> pyqt.cfg
> +    echo "pyqt_sip_dir =3D ${D}/${datadir}/sip/PyQt4" >> pyqt.cfg
> +    echo "pyuic_interpreter =3D ${D}/${bindir}/python%(py_major).%(py_mi=
nor)" >> pyqt.cfg
> +    echo "pyqt_disabled_features =3D PyQt_Desktop_OpenGL PyQt_qreal_doub=
le PyQt_Accessibility PyQt_SessionManager" >> pyqt.cfg
> +    echo "qt_shared =3D True" >> pyqt.cfg
> +    echo "[Qt 4.8]" >> pyqt.cfg
> +    echo "pyqt_modules =3D QtCore QtGui QtDeclarative QtNetwork QtSvg Qt=
WebKit" >> pyqt.cfg
> +    echo yes | python configure-ng.py --verbose --qmake  ${STAGING_BINDI=
R_NATIVE}/qmake2 --configuration pyqt.cfg --sysroot ${STAGING_DIR_HOST}
> +}
> +do_install() {
> +     oe_runmake install
> +}
> +
> +RDEPENDS_${PN} =3D "python-core"
> +
> +FILES_${PN} +=3D "${libdir}/${PYTHON_DIR}/site-packages ${datadir}/sip/P=
yQt4/"
> +FILES_${PN}-dbg +=3D "${libdir}/${PYTHON_DIR}/site-packages/*/.debug/"
> +
> diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb b/meta-=
oe/recipes-devtools/python/python-pyqt_4.9.6.bb
> deleted file mode 100644
> index 2f0e189..0000000
> --- a/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -SUMMARY =3D "Python Qt4 Bindings"
> -HOMEPAGE =3D "http://riverbankcomputing.co.uk"
> -AUTHOR =3D "Phil Thomson @ riverbank.co.uk"
> -SECTION =3D "devel/python"
> -LICENSE =3D "GPLv2 & GPLv3 & GPL_EXCEPTION"
> -LIC_FILES_CHKSUM =3D "\
> -    file://GPL_EXCEPTION.TXT;md5=3Db73b0be471db679533dc94781c14af58 \
> -    file://GPL_EXCEPTION_ADDENDUM.TXT;md5=3Dc1e04ec2aa0911061005a801abf8=
1e40 \
> -    file://OPENSOURCE-NOTICE.TXT;md5=3D6ad9123620cc04a22c394753ad4767d7 \
> -    file://LICENSE.GPL2;md5=3D276c6b9cad5f85a3af3534299825feff \
> -    file://LICENSE.GPL3;md5=3Deda942b9c6ba7eb0f40fee79e94950d5 \
> -"
> -
> -DEPENDS =3D "sip-native python-sip"
> -RDEPENDS_${PN} =3D "python-core"
> -
> -PYQT_OE_VERSION =3D "Qt_4_8_3"
> -PR =3D "r1"
> -
> -SRC_URI =3D "\
> -    ${SOURCEFORGE_MIRROR}/pyqt/PyQt-x11-gpl-${PV}.tar.gz \
> -    file://pyqt-generated.patch;apply=3Dno \
> -"
> -SRC_URI[md5sum] =3D "514e1f9597771dc732ba75ba9fa5c6b6"
> -SRC_URI[sha256sum] =3D "a350f9e5c6d8062671c0f29bf1a70824719b18175ce8372c=
29bf7c1eda44b18d"
> -S =3D "${WORKDIR}/PyQt-x11-gpl-${PV}"
> -
> -# arm and mips machines need some extra patches
> -SRC_URI_append_arm =3D "\
> -    file://qreal_float_support.diff \
> -"
> -
> -SRC_URI_append_mipsel =3D "\
> -    file://qreal_float_support.diff \
> -"
> -
> -inherit qt4x11 sip distutils-base
> -
> -PARALLEL_MAKE =3D ""
> -
> -QMAKE_PROFILES =3D "pyqt.pro"
> -# NOTE: has to match with MIN(qt version we have in OE, last known Qt ve=
rsion by SIP/PyQt)
> -EXTRA_SIPTAGS =3D "-tWS_X11 -t${PYQT_OE_VERSION} -xVendorID -xPyQt_Sessi=
onManager -xPyQt_Accessibility"
> -EXTRA_OEMAKE =3D " MAKEFLAGS=3D "
> -
> -# arm and mips need extra params for the qreal issue
> -EXTRA_SIPTAGS_append_arm =3D " -x PyQt_qreal_double"
> -EXTRA_SIPTAGS_append_mipsel =3D " -x PyQt_qreal_double"=20
> -
> -SIP_MODULES =3D "QtCore QtDeclarative QtGui QtNetwork QtSql QtSvg QtXml =
QtWebKit"
> -MAKE_MODULES =3D "qpy ${SIP_MODULES}"
> -
> -EXTRA_QMAKEVARS_POST +=3D "\
> -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/Qt \
> -    INCLUDEPATH+=3D${STAGING_INCDIR}/${PYTHON_DIR} \
> -    INCLUDEPATH+=3D../qpy/QtCore \
> -    INCLUDEPATH+=3D../qpy/QtGui \
> -    INCLUDEPATH+=3D../qpy/QtDeclarative \
> -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtCore \
> -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtGui \
> -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtDeclarative \
> -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtWebKit \
> -    INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/QtNetwork \
> -"
> -FIX_QREAL =3D "\
> -"
> -
> -do_generate_prepend() {
> -    for i in ${FIX_QREAL}; do
> -        sed -i -e s,qreal,float,g sip/$i
> -    done
> -}
> -
> -do_configure_prepend() {
> -    printf "TEMPLATE=3Dsubdirs\nSUBDIRS=3D${MAKE_MODULES}\n" >pyqt.pro
> -    printf "TEMPLATE=3Dsubdirs\nSUBDIRS=3DQtCore QtDeclarative QtGui\n" =
>qpy/qpy.pro
> -    ln -sf ./qpycore.pro qpy/QtCore/QtCore.pro
> -    ln -sf ./qpydeclarative.pro qpy/QtDeclarative/QtDeclarative.pro
> -    ln -sf ./qpygui.pro qpy/QtGui/QtGui.pro
> -    echo "INCLUDEPATH+=3D${S}/QtCore" >>qpy/QtCore/QtCore.pro
> -    echo "INCLUDEPATH+=3D${S}/QtGui" >>qpy/QtGui/QtGui.pro
> -    echo "INCLUDEPATH+=3D${S}/QtDeclarative" >>qpy/QtDeclarative/QtDecla=
rative.pro
> -    echo "LIBS+=3D-L../qpy/QtGui/ -lqpygui" >>QtGui/QtGui.pro
> -    echo "LIBS+=3D-L../qpy/QtCore/ -lqpycore" >>QtCore/QtCore.pro
> -    echo "LIBS+=3D-L../qpy/QtDeclarative/ -lqpydeclarative" >>QtDeclarat=
ive/QtDeclarative.pro
> -    # hack for broken generated code (duplicated sipCpp declaration).
> -    patch -p1 < ${WORKDIR}/pyqt-generated.patch || echo "pyqt-generated.=
patch failed to apply, probably reexecuting do_configure, ignoring that"
> -}
> -
> -do_install() {
> -    install -d ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4
> -    install -d ${D}${datadir}/sip/qt/
> -    for module in ${SIP_MODULES}
> -    do
> -        install -m 0644 ${S}/sip/${module}/*.sip ${D}${datadir}/sip/qt/
> -        echo "from PyQt4.${module} import *\n" >> ${D}${libdir}/${PYTHON=
_DIR}/site-packages/PyQt4/Qt.py
> -        install -m 0755 ${module}/lib${module}.so ${D}${libdir}/${PYTHON=
_DIR}/site-packages/PyQt4/${module}.so
> -    done
> -    cp -pPR elementtree ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
> -    cp __init__.py ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
> -}
> -
> -FILES_${PN} =3D "${libdir}/${PYTHON_DIR}/site-packages ${datadir}/sip/qt=
/"
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlR/J5MACgkQN1Ujt2V2gBzZjwCcCv2ySGarQVlJNS9Bc7KbIFs7
Ok0An2njH/wXvy+I00DL3ZiENC20GrT9
=ESbA
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
