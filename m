Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B1DAA7554E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 10:36:48 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e16-v6so5188623wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 03:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+Jco+Zih7WkxAU4F/+wXiT03+DORQ4IgplwaI5M5qzA=;
	b=KApVf6opvWMyFY34QHp4SC/72cw8Sw68mu7wy8Ap3mQ3bSsr7uUcpi/8fMndfLj5yM
	KjUqGuvzqGCIzp3BWREC9Zyjghq0uodOe32uuwsKcDNPQ7mTGORtsKCCagp7tO1Zfu6l
	Wa+GlRzbfIdBX0Nn+HocGOznRr8hGQWTItpyDXwlqz3FpLFnSUDOrUNib7GEnD7Yqkov
	gutaLkd0oaABDtH7e2ZSzUsHIahOdExy7PDSBROUU7oZu64EnMzvdlfnXkKxhrBvETz+
	pFjQcCYYprq1V9O469uBUiIKM4KqhszsmrLHN3E1gJth9aUoVwRl3nXQCymofd/Td5Mk
	HKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+Jco+Zih7WkxAU4F/+wXiT03+DORQ4IgplwaI5M5qzA=;
	b=c02nqurl6EB0KPMSMakocXQ3w8z27DOSXzcYTX7wDF76vO9sni7q5yiwmZtn4eraCO
	vNQXrVg7DtH6kBGsWTqojyFDLzsN6dKH7PvtOxzXzwmADledH4cluPT84k8fmczXZ6dZ
	hx1Q0BKplUfoSiPh489aN9ttaFMh0xyd9NtaRGrltctkmcwh7DZwfdQ0IMgpkfas3zXq
	RC1m+PjUKiPnlbFy1Cdt+sH6251oDDiHRH5kE3cxCPDxHjY+UIxf0tHzPLdIBzNDD4mM
	G0MBbloLH/4a1C53lsf6s22exFqbWCCxRf9veQtVpo6Qi2Sa+BrgLtRSnoj9wr6c0r7H
	g2Tw==
X-Gm-Message-State: APt69E0LxjIOe+4tEGDW9Fl4cJe+ChwPY+RK1Tv+PhGOE9NfStweERb6
	QX04J45NJIvTYyDzbuXnS+CB8gYM/HM2H/RNYXA=
X-Google-Smtp-Source: ADUXVKLkmrGMe9vSicrCw9TzmPG+rIzMEyomsdxyKeUjhV4wLLzbU9fkpyA7EdmIoWO/UOQhv7BsxgKgNw85H11RUJE=
X-Received: by 2002:a1c:6dd3:: with SMTP id
	b80-v6mr1225176wmi.32.1529491009231; 
	Wed, 20 Jun 2018 03:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20180529092556.25053-1-samuli.piippo@qt.io>
	<69a631ae-09ec-a7c0-5965-f5372ef463c7@zonque.org>
In-Reply-To: <69a631ae-09ec-a7c0-5965-f5372ef463c7@zonque.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Jun 2018 12:36:40 +0200
Message-ID: <CA+chaQfXaWZvyUqWSE-Zq=nSW13Jwt=GVPhXTj0dVbzVGpebww@mail.gmail.com>
To: Daniel Mack <daniel@zonque.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: Update to Qt 5.11.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2018 10:36:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's already in meta-qt5/master with couple fixes on top of that.

On Wed, Jun 20, 2018 at 12:12 PM Daniel Mack <daniel@zonque.org> wrote:

> Hi Samuli,
>
> I tried to give this patch a try but failed to find a base to apply it
> against. Is there a public git tree that has these commits?
>
>
> Thanks,
> Daniel
>
> On Tuesday, May 29, 2018 11:25 AM, Samuli Piippo wrote:
> > Add recipes for Qt OPC UA and Qt WebGL platform plugin.
> > ---
> >   recipes-qt/qt5/nativesdk-qtbase_git.bb        |  7 +-
> >   recipes-qt/qt5/qt3d_git.bb                    |  2 +-
> >   recipes-qt/qt5/qt5-git.inc                    |  2 +-
> >   recipes-qt/qt5/qtbase-native_git.bb           |  3 +-
> >   recipes-qt/qt5/qtbase_git.bb                  |  7 +-
> >   recipes-qt/qt5/qtcanvas3d_git.bb              |  2 +-
> >   recipes-qt/qt5/qtcharts_git.bb                |  2 +-
> >   recipes-qt/qt5/qtconnectivity_git.bb          |  2 +-
> >   recipes-qt/qt5/qtdeclarative_git.bb           |  6 +-
> >   recipes-qt/qt5/qtgamepad_git.bb               |  2 +-
> >   recipes-qt/qt5/qtgraphicaleffects_git.bb      |  2 +-
> >   recipes-qt/qt5/qtimageformats_git.bb          |  2 +-
> >   recipes-qt/qt5/qtknx_git.bb                   |  2 +-
> >   recipes-qt/qt5/qtlocation_git.bb              | 10 +--
> >   recipes-qt/qt5/qtmultimedia_git.bb            |  2 +-
> >   recipes-qt/qt5/qtopcua_git.bb                 | 13 ++++
> >   recipes-qt/qt5/qtpurchasing_git.bb            |  2 +-
> >   recipes-qt/qt5/qtquickcontrols2_git.bb        |  2 +-
> >   recipes-qt/qt5/qtquickcontrols_git.bb         |  2 +-
> >   recipes-qt/qt5/qtremoteobjects_git.bb         |  2 +-
> >   recipes-qt/qt5/qtscript_git.bb                |  2 +-
> >   recipes-qt/qt5/qtscxml_git.bb                 |  2 +-
> >   recipes-qt/qt5/qtsensors_git.bb               |  2 +-
> >   recipes-qt/qt5/qtserialbus_git.bb             |  2 +-
> >   recipes-qt/qt5/qtserialport_git.bb            |  7 +-
> >   recipes-qt/qt5/qtsvg_git.bb                   |  2 +-
> >   recipes-qt/qt5/qttools_git.bb                 |  2 +-
> >   recipes-qt/qt5/qtvirtualkeyboard_git.bb       |  2 +-
> >   ...01-fix-build-without-xkbcommon-evdev.patch | 68 ------------------=
-
> >   recipes-qt/qt5/qtwayland_git.bb               |  9 +--
> >   recipes-qt/qt5/qtwebchannel_git.bb            |  2 +-
> >   recipes-qt/qt5/qtwebengine_git.bb             |  4 +-
> >   recipes-qt/qt5/qtwebglplugin_git.bb           | 21 ++++++
> >   recipes-qt/qt5/qtwebsockets_git.bb            |  2 +-
> >   recipes-qt/qt5/qtwebview_git.bb               |  2 +-
> >   recipes-qt/qt5/qtx11extras_git.bb             |  2 +-
> >   recipes-qt/qt5/qtxmlpatterns_git.bb           |  2 +-
> >   37 files changed, 84 insertions(+), 123 deletions(-)
> >   create mode 100644 recipes-qt/qt5/qtopcua_git.bb
> >   delete mode 100644
> recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
> >   create mode 100644 recipes-qt/qt5/qtwebglplugin_git.bb
> >
> > diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/
> nativesdk-qtbase_git.bb
> > index 27bd563..5971eeb 100644
> > --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> > +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> > @@ -6,7 +6,6 @@ HOMEPAGE =3D "http://qt-project.org"
> >   LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 &
> The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.=
0+
> | LGPL-3.0 | The-Qt-Company-Commercial )"
> >   LIC_FILES_CHKSUM =3D " \
> >       file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> > -    file://LICENSE.LGPLv3;md5=3D86d02ed8764e77c1c0b194fde895a51b \
> >       file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> >       file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> >       file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073=
 \
> > @@ -174,8 +173,8 @@ do_install() {
> >       install -m 644 ${WORKDIR}/OEQt5Toolchain.cmake
> ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
> >
> >       # Fix up absolute paths in scripts
> > -    grep -lr /usr/bin/python ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/ | \
> > -        xargs -r sed -i -e '1s,#!.*python,#! ${USRBINPATH}/env python,=
'
> > +    sed -i -e '1s,#!/usr/bin/python,#! ${USRBINPATH}/env python,' \
> > +
> ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/features/uikit/devices.py
> >   }
> >
> >   fakeroot do_generate_qt_environment_file() {
> > @@ -210,4 +209,4 @@ fakeroot do_generate_qt_environment_file() {
> >   do_generate_qt_environment_file[umask] =3D "022"
> >   addtask generate_qt_environment_file after do_install before do_packa=
ge
> >
> > -SRCREV =3D "2b5587d901a0cc23749bf27a923d50bf0e5860d3"
> > +SRCREV =3D "6eef81ee1c82f934e14d47047d8b6103b8755321"
> > diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
> > index 6b5ddeb..07b28ac 100644
> > --- a/recipes-qt/qt5/qt3d_git.bb
> > +++ b/recipes-qt/qt5/qt3d_git.bb
> > @@ -36,6 +36,6 @@ do_configure_prepend() {
> >            ${S}/src/quick3d/imports/input/importsinput.pro
> >   }
> >
> > -SRCREV =3D "6d73c51d44d10925a05804cd8e70978f155643df"
> > +SRCREV =3D "15e863517ea37ca7ba6bcb75b078272eddbc5d37"
> >
> >   BBCLASSEXTEND +=3D "native nativesdk"
> > diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> > index ae7394c..41ad280 100644
> > --- a/recipes-qt/qt5/qt5-git.inc
> > +++ b/recipes-qt/qt5/qt5-git.inc
> > @@ -14,4 +14,4 @@ CVE_PRODUCT =3D "qt"
> >
> >   S =3D "${WORKDIR}/git"
> >
> > -PV =3D "5.10.1+5.11-beta3+git${SRCPV}"
> > +PV =3D "5.11.0+git${SRCPV}"
> > diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/
> qtbase-native_git.bb
> > index d6c53ad..0d7e598 100644
> > --- a/recipes-qt/qt5/qtbase-native_git.bb
> > +++ b/recipes-qt/qt5/qtbase-native_git.bb
> > @@ -6,7 +6,6 @@ HOMEPAGE =3D "http://qt-project.org"
> >   LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 &
> The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.=
0+
> | LGPL-3.0 | The-Qt-Company-Commercial )"
> >   LIC_FILES_CHKSUM =3D " \
> >       file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> > -    file://LICENSE.LGPLv3;md5=3D86d02ed8764e77c1c0b194fde895a51b \
> >       file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> >       file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> >       file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073=
 \
> > @@ -135,4 +134,4 @@ do_install() {
> >       echo 'set(_qt5_corelib_extra_includes
> "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' >
> ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
> >   }
> >
> > -SRCREV =3D "2b5587d901a0cc23749bf27a923d50bf0e5860d3"
> > +SRCREV =3D "6eef81ee1c82f934e14d47047d8b6103b8755321"
> > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.b=
b
> > index a599fc9..cc002b3 100644
> > --- a/recipes-qt/qt5/qtbase_git.bb
> > +++ b/recipes-qt/qt5/qtbase_git.bb
> > @@ -5,7 +5,6 @@ require qt5-ptest.inc
> >   LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 &
> The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.=
0+
> | LGPL-3.0 | The-Qt-Company-Commercial )"
> >   LIC_FILES_CHKSUM =3D " \
> >       file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> > -    file://LICENSE.LGPLv3;md5=3D86d02ed8764e77c1c0b194fde895a51b \
> >       file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> >       file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> >       file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073=
 \
> > @@ -233,6 +232,10 @@ do_install_append() {
> >       echo "isEmpty(QMAKE_STRIP): QMAKE_STRIP =3D ${TARGET_PREFIX}strip=
"
> >> $conf
> >
> >       generate_target_qt_config_file ${D}${OE_QMAKE_PATH_BINS}/qt.conf
> > +
> > +    # Fix up absolute paths in scripts
> > +    sed -i -e '1s,#!/usr/bin/python,#! ${USRBINPATH}/env python,' \
> > +
> ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/features/uikit/devices.py
> >   }
> >
> >   # mkspecs have mac specific scripts that depend on perl and bash
> > @@ -240,4 +243,4 @@ INSANE_SKIP_${PN}-mkspecs +=3D "file-rdeps"
> >
> >   RRECOMMENDS_${PN}-plugins +=3D "${@bb.utils.contains('DISTRO_FEATURES=
',
> 'x11', 'libx11-locale', '', d)}"
> >
> > -SRCREV =3D "2b5587d901a0cc23749bf27a923d50bf0e5860d3"
> > +SRCREV =3D "6eef81ee1c82f934e14d47047d8b6103b8755321"
> > diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/
> qtcanvas3d_git.bb
> > index 57e79be..8757967 100644
> > --- a/recipes-qt/qt5/qtcanvas3d_git.bb
> > +++ b/recipes-qt/qt5/qtcanvas3d_git.bb
> > @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM =3D " \
> >
> >   DEPENDS =3D "qtdeclarative"
> >
> > -SRCREV =3D "ff771b7d57eb3654f6321eb105129a594ec2841e"
> > +SRCREV =3D "9d555f6d21d013c990793aaaa23a5085529631a5"
> > diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/
> qtcharts_git.bb
> > index c360ecf..a6ec17f 100644
> > --- a/recipes-qt/qt5/qtcharts_git.bb
> > +++ b/recipes-qt/qt5/qtcharts_git.bb
> > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D " \
> >
> >   DEPENDS +=3D "qtbase qtdeclarative qtmultimedia"
> >
> > -SRCREV =3D "d3f9275cbaa6a6059298ec248dd28dd6ef065e51"
> > +SRCREV =3D "4f66d1ffeecd95b4bf6666b71536c42dea7450ed"
> >
> >   # The same issue as in qtbase:
> >   # http://errors.yoctoproject.org/Errors/Details/152641/
> > diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/
> qtconnectivity_git.bb
> > index 6f1f7d3..e23f632 100644
> > --- a/recipes-qt/qt5/qtconnectivity_git.bb
> > +++ b/recipes-qt/qt5/qtconnectivity_git.bb
> > @@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] =3D
> "-feature-bluez,-no-feature-bluez,${BLUEZ}"
> >
> >   EXTRA_QMAKEVARS_CONFIGURE +=3D "${PACKAGECONFIG_CONFARGS}"
> >
> > -SRCREV =3D "e68b5e17b071ca11974474546be04c7d564eae3a"
> > +SRCREV =3D "43f063427a3ffc62bd85237801b28c9f9826d562"
> > diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/
> qtdeclarative_git.bb
> > index 33f15dd..510fd45 100644
> > --- a/recipes-qt/qt5/qtdeclarative_git.bb
> > +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> > @@ -14,8 +14,10 @@ LIC_FILES_CHKSUM =3D " \
> >
> >   DEPENDS +=3D "qtbase"
> >
> > -PACKAGECONFIG ??=3D "qtxmlpatterns"
> > +PACKAGECONFIG ??=3D "qtxmlpatterns qml-debug qml-network"
> >   PACKAGECONFIG[qtxmlpatterns] =3D ",,qtxmlpatterns"
> > +PACKAGECONFIG[qml-debug] =3D "-qml-debug,-no-qml-debug"
> > +PACKAGECONFIG[qml-network] =3D "-qml-network, -no-qml-network"
> >
> >   do_configure_prepend() {
> >       # disable qtxmlpatterns test if it isn't enabled by PACKAGECONFIG
> > @@ -30,6 +32,6 @@ do_install_append_class-nativesdk() {
> >
> >   EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'qtxmlpatterns', 'CONFIG+=3DOE_QTXMLPATTERNS_ENABLED', '', d)}"
> >
> > -SRCREV =3D "6069cc1cd1a6309cdffeb8bdd9c4035f33742228"
> > +SRCREV =3D "1e82f11629e5572783e5bfc36f24ad10c235ca53"
> >
> >   BBCLASSEXTEND =3D+ "native nativesdk"
> > diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/
> qtgamepad_git.bb
> > index 485a6d9..3981bd1 100644
> > --- a/recipes-qt/qt5/qtgamepad_git.bb
> > +++ b/recipes-qt/qt5/qtgamepad_git.bb
> > @@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] =3D
> "-feature-sdl2,-no-feature-sdl2,libsdl2"
> >
> >   EXTRA_QMAKEVARS_CONFIGURE +=3D "${PACKAGECONFIG_CONFARGS}"
> >
> > -SRCREV =3D "313f221381507eee36c8e3bd0069b3e7962da140"
> > +SRCREV =3D "e175347926b2aa8be045aed485e09b99ae72f51c"
> > diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/
> qtgraphicaleffects_git.bb
> > index 5f820a5..12f60b4 100644
> > --- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
> > +++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
> > @@ -18,4 +18,4 @@ RDEPENDS_${PN}-dev =3D ""
> >   # http://errors.yoctoproject.org/Errors/Build/44912/
> >   LDFLAGS_append_x86 =3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
> >
> > -SRCREV =3D "df80153bf07b08e5d2ae8ba18f85a9ec15dbaef8"
> > +SRCREV =3D "80b9da7ac42468453b7d130bd0a322a1312ad0e3"
> > diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/
> qtimageformats_git.bb
> > index 05384b1..5afa44d 100644
> > --- a/recipes-qt/qt5/qtimageformats_git.bb
> > +++ b/recipes-qt/qt5/qtimageformats_git.bb
> > @@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] =3D
> ",CONFIG+=3Ddone_config_libwebp,libwebp"
> >
> >   EXTRA_QMAKEVARS_PRE +=3D "${PACKAGECONFIG_CONFARGS}"
> >
> > -SRCREV =3D "b83a0a9460432abb82218da247710a1aaf321336"
> > +SRCREV =3D "92e49329edfb98c8b3f9cdcbaf116f0c601c7739"
> > diff --git a/recipes-qt/qt5/qtknx_git.bb b/recipes-qt/qt5/qtknx_git.bb
> > index 9f15a57..bbcabc1 100644
> > --- a/recipes-qt/qt5/qtknx_git.bb
> > +++ b/recipes-qt/qt5/qtknx_git.bb
> > @@ -9,4 +9,4 @@ LIC_FILES_CHKSUM =3D " \
> >
> >   DEPENDS +=3D "qtbase"
> >
> > -SRCREV =3D "8a8a343446146f51056b6f530ce341f34199c811"
> > +SRCREV =3D "4640a41071ff153c01ef2c518675dded257f6de5"
> > diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/
> qtlocation_git.bb
> > index e197dfb..1a79093 100644
> > --- a/recipes-qt/qt5/qtlocation_git.bb
> > +++ b/recipes-qt/qt5/qtlocation_git.bb
> > @@ -4,10 +4,8 @@ require qt5-git.inc
> >   LICENSE =3D "Apache-2.0 & MIT & openssl & BSL-1.0 & GFDL-1.3 & BSD & =
(
> GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) =
&
> ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
> >   LIC_FILES_CHKSUM =3D " \
> >       file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> > -    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
> >       file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> >       file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> > -    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
> >       file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073=
 \
> >       file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> >
>  file://src/3rdparty/mapbox-gl-native/LICENSE.md;md5=3D0ab9025299bcee1685=
8021d557f09449
> \
> > @@ -27,11 +25,13 @@ EXTRA_QMAKEVARS_CONFIGURE +=3D
> "${PACKAGECONFIG_CONFARGS}"
> >   # http://errors.yoctoproject.org/Errors/Details/152640/
> >   LDFLAGS_append_x86 =3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
> >
> > +QT_MODULE_BRANCH_MAPBOXGL =3D "upstream/qt-staging-5.11.0"
> > +
> >   SRC_URI +=3D " \
> > -
> ${QT_GIT}/qtlocation-mapboxgl.git;name=3Dqtlocation-mapboxgl;branch=3Dups=
tream/qt-staging;protocol=3D${QT_GIT_PROTOCOL};destsuffix=3Dgit/src/3rdpart=
y/mapbox-gl-native
> \
> > +
> ${QT_GIT}/qtlocation-mapboxgl.git;name=3Dqtlocation-mapboxgl;branch=3D${Q=
T_MODULE_BRANCH_MAPBOXGL};protocol=3D${QT_GIT_PROTOCOL};destsuffix=3Dgit/sr=
c/3rdparty/mapbox-gl-native
> \
> >   "
> >
> > -SRCREV_qtlocation =3D "3d2281ccf7400a782f69b7b74cb45d0889708bcc"
> > -SRCREV_qtlocation-mapboxgl =3D "8c1be4ec01ef46bf453856531ebf53b48ce3db=
e7"
> > +SRCREV_qtlocation =3D "139414573ab27bd1df1b491aeb6003a6fc0d3d5d"
> > +SRCREV_qtlocation-mapboxgl =3D "74df5203628b47931b4edcb5e8fe352f40fe7d=
f4"
> >
> >   SRCREV_FORMAT =3D "qtlocation_qtlocation-mapboxgl"
> > diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/
> qtmultimedia_git.bb
> > index 7ae9a24..0f272e5 100644
> > --- a/recipes-qt/qt5/qtmultimedia_git.bb
> > +++ b/recipes-qt/qt5/qtmultimedia_git.bb
> > @@ -37,4 +37,4 @@ SRC_URI +=3D "\
> >   # http://errors.yoctoproject.org/Errors/Build/44914/
> >   LDFLAGS_append_x86 =3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
> >
> > -SRCREV =3D "bb7ffc4d847bb2b558693a4ca5d7f3a45c9b9231"
> > +SRCREV =3D "b39c391853245f8293d19431541eab20d78b8678"
> > diff --git a/recipes-qt/qt5/qtopcua_git.bb b/recipes-qt/qt5/
> qtopcua_git.bb
> > new file mode 100644
> > index 0000000..7abe028
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtopcua_git.bb
> > @@ -0,0 +1,13 @@
> > +require qt5.inc
> > +require qt5-git.inc
> > +
> > +LICENSE =3D "GFDL-1.3 & ( GPL-2.0+ | LGPL-3.0 ) |
> The-Qt-Company-Commercial"
> > +LIC_FILES_CHKSUM =3D " \
> > +    file://LICENSE.FDL;md5=3Df70ee9a6c44ae8917586fea34dff0ab5 \
> > +    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
> > +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> > +"
> > +
> > +DEPENDS +=3D "qtbase"
> > +
> > +SRCREV =3D "78d016e79ed8bc3d2d3f1c2dac90a4c75392d35b"
> > diff --git a/recipes-qt/qt5/qtpurchasing_git.bb b/recipes-qt/qt5/
> qtpurchasing_git.bb
> > index df4a6e0..cb6b9eb 100644
> > --- a/recipes-qt/qt5/qtpurchasing_git.bb
> > +++ b/recipes-qt/qt5/qtpurchasing_git.bb
> > @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM =3D " \
> >
> >   DEPENDS +=3D "qtbase qtdeclarative"
> >
> > -SRCREV =3D "02246cd68ca14345d95cbd8893fd24ff60faa73f"
> > +SRCREV =3D "607617cacc1c6ced9fa3bbfb0cd24e115b623daa"
> > diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/
> qtquickcontrols2_git.bb
> > index a8fc2c2..ee5e926 100644
> > --- a/recipes-qt/qt5/qtquickcontrols2_git.bb
> > +++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
> > @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM =3D " \
> >
> >   DEPENDS +=3D "qtdeclarative qtdeclarative-native"
> >
> > -SRCREV =3D "c0232099a9fac03ef0f5287b6a26dbbd46669c06"
> > +SRCREV =3D "60f3106b3fe537f1f26230bf0b59525cf98d6789"
> > diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/
> qtquickcontrols_git.bb
> > index 372ed0c..f23e96d 100644
> > --- a/recipes-qt/qt5/qtquickcontrols_git.bb
> > +++ b/recipes-qt/qt5/qtquickcontrols_git.bb
> > @@ -17,4 +17,4 @@ FILES_${PN}-qmlplugins +=3D " \
> >     ${OE_QMAKE_PATH_QML}/QtQuick/Dialogs/qml/icons.ttf \
> >   "
> >
> > -SRCREV =3D "0689a8256c0a21087c01fff3998fd3b606a5ac4c"
> > +SRCREV =3D "88ff352d5145b5761179ee42164a0bfcd4f1d54a"
> > diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/
> qtremoteobjects_git.bb
> > index 1efac5c..ff61321 100644
> > --- a/recipes-qt/qt5/qtremoteobjects_git.bb
> > +++ b/recipes-qt/qt5/qtremoteobjects_git.bb
> > @@ -24,6 +24,6 @@ PACKAGECONFIG[tools-only] =3D "CONFIG+=3Dtools-only"
> >
> >   EXTRA_QMAKEVARS_PRE +=3D "${PACKAGECONFIG_CONFARGS}"
> >
> > -SRCREV =3D "556539365ab1eeaab339fc527c4c2130c2f804ff"
> > +SRCREV =3D "24fade01e0e38acbf5ffdb9ffab712e8b7e86e30"
> >
> >   BBCLASSEXTEND +=3D "native nativesdk"
> > diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/
> qtscript_git.bb
> > index 9982877..fe4612d 100644
> > --- a/recipes-qt/qt5/qtscript_git.bb
> > +++ b/recipes-qt/qt5/qtscript_git.bb
> > @@ -30,4 +30,4 @@ DEPENDS +=3D "qtbase"
> >   # http://errors.yoctoproject.org/Errors/Build/44915/
> >   LDFLAGS_append_x86 =3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
> >
> > -SRCREV =3D "c2657d346455a5a7821fbfbe3b1107d7cf9b0949"
> > +SRCREV =3D "693f0320e92cb1ab93f6261c72702432abdcb11d"
> > diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/
> qtscxml_git.bb
> > index 1a81beb..dae2cde 100644
> > --- a/recipes-qt/qt5/qtscxml_git.bb
> > +++ b/recipes-qt/qt5/qtscxml_git.bb
> > @@ -10,7 +10,7 @@ require qt5-git.inc
> >
> >   DEPENDS +=3D "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
> >
> > -SRCREV =3D "67d48807b44735a2385b88db7ada01f7cd7eacfd"
> > +SRCREV =3D "71a101b5cbdbe9e32053ce61a5b6417a6990d780"
> >
> >   # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.11
> >   # 5.11.meta-qt5.2
> > diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/
> qtsensors_git.bb
> > index 5c6a83d..a9885f7 100644
> > --- a/recipes-qt/qt5/qtsensors_git.bb
> > +++ b/recipes-qt/qt5/qtsensors_git.bb
> > @@ -12,4 +12,4 @@ LIC_FILES_CHKSUM =3D " \
> >
> >   DEPENDS +=3D "qtbase qtdeclarative"
> >
> > -SRCREV =3D "29f2041f4da53815491affbf19ec008820c76e29"
> > +SRCREV =3D "b4e80891f3d51b3d6a7ead74c8650b84e0f070ea"
> > diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/
> qtserialbus_git.bb
> > index 5c196ec..effe91b 100644
> > --- a/recipes-qt/qt5/qtserialbus_git.bb
> > +++ b/recipes-qt/qt5/qtserialbus_git.bb
> > @@ -11,4 +11,4 @@ LIC_FILES_CHKSUM =3D " \
> >
> >   DEPENDS +=3D "qtbase qtserialport"
> >
> > -SRCREV =3D "fb561e9aa52d24b0156dc2c3987216954ad52107"
> > +SRCREV =3D "c66a364cf34b4945208f07362deabe0020e5b596"
> > diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/
> qtserialport_git.bb
> > index 9bac24e..79d9394 100644
> > --- a/recipes-qt/qt5/qtserialport_git.bb
> > +++ b/recipes-qt/qt5/qtserialport_git.bb
> > @@ -5,14 +5,13 @@ require qt5-git.inc
> >   # other qt* components use :/
> >   LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 &
> The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.=
0+
> | LGPL-3.0 | The-Qt-Company-Commercial )"
> >   LIC_FILES_CHKSUM =3D " \
> > -    file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> > +    file://LICENSE.FDL;md5=3D3801d7932fdc07fd9efe89f9854a6caa \
> >       file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> >       file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> >       file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073=
 \
> > -    file://LGPL_EXCEPTION.txt;md5=3Dbb426f3367c4805d1e12fad05bd0b750 \
> > -    file://LICENSE.FDL;md5=3D3801d7932fdc07fd9efe89f9854a6caa \
> > +    file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> >   "
> >
> >   DEPENDS +=3D "qtbase"
> >
> > -SRCREV =3D "b5f0519e8e6f8f125f711d61832072649d841dfe"
> > +SRCREV =3D "a9ada995489b899cb938602308ffa1a8814acd2a"
> > diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
> > index c15a9e3..dae0e7d 100644
> > --- a/recipes-qt/qt5/qtsvg_git.bb
> > +++ b/recipes-qt/qt5/qtsvg_git.bb
> > @@ -13,4 +13,4 @@ LIC_FILES_CHKSUM =3D " \
> >
> >   DEPENDS +=3D "qtbase"
> >
> > -SRCREV =3D "1fd6226d52b8d3d201b117902ff1ecd84cc1a1e5"
> > +SRCREV =3D "b1ca1bb725fd8768782d8105b782932f95b70908"
> > diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/
> qttools_git.bb
> > index 7fbf4ee..447164c 100644
> > --- a/recipes-qt/qt5/qttools_git.bb
> > +++ b/recipes-qt/qt5/qttools_git.bb
> > @@ -29,7 +29,7 @@ PACKAGECONFIG[qtwebkit] =3D ",,qtwebkit"
> >
> >   EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'qtwebkit', '', 'CONFIG+=3Dnoqtwebkit', d)}"
> >
> > -SRCREV =3D "38b62511970b048b4a0edc5c8bcdea8c37fa76c7"
> > +SRCREV =3D "a42d3f2ac4b910ecc910ff144191cb729a745c9a"
> >
> >   BBCLASSEXTEND =3D "native nativesdk"
> >
> > diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/
> qtvirtualkeyboard_git.bb
> > index fbacf93..4154b2a 100644
> > --- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
> > +++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
> > @@ -49,4 +49,4 @@ FILES_${PN} +=3D
> "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
> >
> >   DEPENDS +=3D "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg
> qtxmlpatterns qtdeclarative-native"
> >
> > -SRCREV =3D "14f4ea59491e40e7f95df9d7307433ef2c249ab5"
> > +SRCREV =3D "b92f0da2f8725ab529ec81c4e1b4b538e66258d2"
> > diff --git
> a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
> b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
> > deleted file mode 100644
> > index 2842807..0000000
> > ---
> a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
> > +++ /dev/null
> > @@ -1,68 +0,0 @@
> > -From ca13ad2d1a5c119fb3f45c805d2f3caaede95a7d Mon Sep 17 00:00:00 2001
> > -From: Raphael Freudiger <laser_b@gmx.ch>
> > -Date: Tue, 10 Jan 2017 15:49:55 +0100
> > -Subject: [PATCH] fix build without xkbcommon-evdev
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -Change-Id: I4f52c4ad741fdd7063a18b67f5777b52f03726fe
> > -Signed-off-by: Raphael Freudiger <laser_b@gmx.ch>
> > -Signed-off-by: Gordan Marku=C5=A1 <gordan.markus@pelagicore.com>
> > ----
> > - src/client/client.pro                              |  2 ++
> > - src/compositor/compositor.pro                      |  2 ++
> > - src/compositor/compositor_api/qwaylandkeyboard.cpp | 13 +++++++------
> > - 3 files changed, 11 insertions(+), 6 deletions(-)
> > -
> > -diff --git a/src/client/client.pro b/src/client/client.pro
> > -index eae7ad5..0bb7b18 100644
> > ---- a/src/client/client.pro
> > -+++ b/src/client/client.pro
> > -@@ -147,3 +147,5 @@ MODULE_PLUGIN_TYPES =3D \
> > -             wayland-decoration-client \
> > -             wayland-shell-integration
> > - load(qt_module)
> > -+
> > -+LIBS +=3D -lxkbcommon
> > -diff --git a/src/compositor/compositor.pro b/src/compositor/
> compositor.pro
> > -index 47be591..805c81e 100644
> > ---- a/src/compositor/compositor.pro
> > -+++ b/src/compositor/compositor.pro
> > -@@ -34,3 +34,5 @@ MODULE_PLUGIN_TYPES =3D \
> > -     wayland-hardware-layer-integration \
> > -
> > - load(qt_module)
> > -+
> > -+LIBS +=3D -lxkbcommon
> > -diff --git a/src/compositor/compositor_api/qwaylandkeyboard.cpp
> b/src/compositor/compositor_api/qwaylandkeyboard.cpp
> > -index 7ab8bff..8c36774 100644
> > ---- a/src/compositor/compositor_api/qwaylandkeyboard.cpp
> > -+++ b/src/compositor/compositor_api/qwaylandkeyboard.cpp
> > -@@ -334,12 +334,6 @@ void
> QWaylandKeyboardPrivate::createXKBState(xkb_keymap *keymap)
> > -     xkb_state =3D xkb_state_new(keymap);
> > - }
> > -
> > --uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint
> nativeScanCode)
> > --{
> > --    const uint offset =3D 8;
> > --    Q_ASSERT(nativeScanCode >=3D offset);
> > --    return nativeScanCode - offset;
> > --}
> > -
> > - void QWaylandKeyboardPrivate::createXKBKeymap()
> > - {
> > -@@ -369,6 +363,13 @@ void QWaylandKeyboardPrivate::createXKBKeymap()
> > - }
> > - #endif
> > -
> > -+uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint
> nativeScanCode)
> > -+{
> > -+    const uint offset =3D 8;
> > -+    Q_ASSERT(nativeScanCode >=3D offset);
> > -+    return nativeScanCode - offset;
> > -+}
> > -+
> > - void QWaylandKeyboardPrivate::sendRepeatInfo()
> > - {
> > -     Q_FOREACH (Resource *resource, resourceMap()) {
> > diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/
> qtwayland_git.bb
> > index 762e612..d6cb114 100644
> > --- a/recipes-qt/qt5/qtwayland_git.bb
> > +++ b/recipes-qt/qt5/qtwayland_git.bb
> > @@ -37,14 +37,7 @@ PACKAGECONFIG[libhybris-egl-server] =3D
> "-feature-libhybris-egl-server,-no-feature
> >
> >   EXTRA_QMAKEVARS_CONFIGURE +=3D "${PACKAGECONFIG_CONFARGS}"
> >
> > -SRCREV =3D "434f3e9a952b5858abc1f0ed1179ea5d2fca6a19"
> > -
> > -# Patches from https://github.com/meta-qt5/qtwayland/commits/b5.11
> > -# 5.11.meta-qt5.2
> > -# From https://bugreports.qt.io/browse/QTBUG-57767
> > -#SRC_URI +=3D " \
> > -#    file://0001-fix-build-without-xkbcommon-evdev.patch \
> > -#"
> > +SRCREV =3D "87621266ec66df5fc98cce165e5c80b7721983aa"
> >
> >   BBCLASSEXTEND =3D+ "native nativesdk"
> >
> > diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/
> qtwebchannel_git.bb
> > index 0bcbf56..efad58c 100644
> > --- a/recipes-qt/qt5/qtwebchannel_git.bb
> > +++ b/recipes-qt/qt5/qtwebchannel_git.bb
> > @@ -12,4 +12,4 @@ LIC_FILES_CHKSUM =3D " \
> >
> >   DEPENDS +=3D "qtdeclarative qtwebsockets"
> >
> > -SRCREV =3D "01241eb3704af785e8d98fb2f6e223ca62a64175"
> > +SRCREV =3D "9800f7d13e770e6409113e83f663ac4a419908a0"
> > diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/
> qtwebengine_git.bb
> > index 80928a4..1b8f933 100644
> > --- a/recipes-qt/qt5/qtwebengine_git.bb
> > +++ b/recipes-qt/qt5/qtwebengine_git.bb
> > @@ -158,8 +158,8 @@ SRC_URI_append_libc-musl =3D "\
> >
>  file://0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;p=
atchdir=3Dsrc/3rdparty
> \
> >   "
> >
> > -SRCREV_qtwebengine =3D "b7e5722cce95730004ef6cb9f4aabde5bbd5685d"
> > -SRCREV_chromium =3D "e173cb17d97aa3c2065189275c85db79eb7d1748"
> > +SRCREV_qtwebengine =3D "28e0320235d33f00c6c141a549dc0553ee0043a5"
> > +SRCREV_chromium =3D "1785e2c1eb5a3b9a9a97ef3125c8f444d9b62afb"
> >   SRCREV =3D "${SRCREV_qtwebengine}"
> >
> >   SRCREV_FORMAT =3D "qtwebengine_chromium"
> > diff --git a/recipes-qt/qt5/qtwebglplugin_git.bb b/recipes-qt/qt5/
> qtwebglplugin_git.bb
> > new file mode 100644
> > index 0000000..62601bb
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtwebglplugin_git.bb
> > @@ -0,0 +1,21 @@
> > +require qt5.inc
> > +require qt5-git.inc
> > +
> > +LICENSE =3D "GPL-3.0 | The-Qt-Company-Commercial"
> > +LIC_FILES_CHKSUM =3D " \
> > +    file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> > +"
> > +
> > +DEPENDS +=3D "qtbase qtwebsockets"
> > +
> > +PACKAGECONFIG ?=3D "qtdeclarative"
> > +PACKAGECONFIG[qtdeclarative] =3D ",,qtdeclarative"
> > +
> > +do_configure_prepend() {
> > +    # disable qtdeclarative test if it isn't enabled by PACKAGECONFIG
> > +    sed -e 's/^\(qtHaveModule(quick)\)/OE_QTDECLARATIVE_ENABLED:\1/' -=
i
> ${S}/src/plugins/platforms/webgl/webgl.pro
> > +}
> > +
> > +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'qtdeclarative', 'CONFIG+=3DOE_QTDECLARATIVE_ENABLED', '', d)}"
> > +
> > +SRCREV =3D "62a5226c6147ee45f488a2e2c65870c1f836a5be"
> > diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/
> qtwebsockets_git.bb
> > index cd55bdd..a95b162 100644
> > --- a/recipes-qt/qt5/qtwebsockets_git.bb
> > +++ b/recipes-qt/qt5/qtwebsockets_git.bb
> > @@ -11,4 +11,4 @@ LIC_FILES_CHKSUM =3D " \
> >
> >   DEPENDS +=3D "qtbase qtdeclarative"
> >
> > -SRCREV =3D "34ce4b65ba35a487bdb8afa5e59b57cfa3f9b0e0"
> > +SRCREV =3D "91bb60bba33a8c7df49835bfacfe9a8dc7381a1e"
> > diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/
> qtwebview_git.bb
> > index f8c2425..61b7409 100644
> > --- a/recipes-qt/qt5/qtwebview_git.bb
> > +++ b/recipes-qt/qt5/qtwebview_git.bb
> > @@ -19,4 +19,4 @@ COMPATIBLE_MACHINE_armv7a =3D "(.*)"
> >   COMPATIBLE_MACHINE_armv7ve =3D "(.*)"
> >   COMPATIBLE_MACHINE_aarch64 =3D "(.*)"
> >
> > -SRCREV =3D "bb7dda99936b97cc262f07b25fcb500f8a552c8a"
> > +SRCREV =3D "87c9572897daf98f3c4177f6d6acd00bafcc70fd"
> > diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/
> qtx11extras_git.bb
> > index b3ce945..d56d185 100644
> > --- a/recipes-qt/qt5/qtx11extras_git.bb
> > +++ b/recipes-qt/qt5/qtx11extras_git.bb
> > @@ -13,4 +13,4 @@ LIC_FILES_CHKSUM =3D " \
> >
> >   DEPENDS +=3D "qtbase"
> >
> > -SRCREV =3D "d80236f50559f4fe785fba598a03aaa7f05d37ac"
> > +SRCREV =3D "e239c7919f31798ef567498104bfeeae108b872d"
> > diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/
> qtxmlpatterns_git.bb
> > index 399adc3..72478df 100644
> > --- a/recipes-qt/qt5/qtxmlpatterns_git.bb
> > +++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
> > @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D " \
> >
> >   DEPENDS +=3D "qtbase"
> >
> > -SRCREV =3D "e4abf2c6e3de158d3a6eb3c46b5158f741136c9d"
> > +SRCREV =3D "17c45f3235f0bcb224379b0d1059c7669eb91487"
> >
> >   BBCLASSEXTEND =3D+ "native nativesdk"
> >
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

