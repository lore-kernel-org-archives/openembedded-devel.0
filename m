Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3850065CC3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Apr 2016 14:57:04 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id f74so53799317qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Apr 2016 07:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=0al7JCEvZUyuW0fPVZ6KQ2xx6lisjo3eycSiKlxtmeU=;
	b=q4fMUQU0CkT/r6U3ByD+8Z89+1+Tl19ksaHRcq+9ayE9TBeNoQc8XgDkmfi97iNMVM
	3VhoxIM7yrbH3b9f4F173HV5CbbLK9OL6Z1uDjL9Koqw99IAPGcX8b79qfXAKOypPpDA
	Nv1R4t36wzo1x3XbGA3cAC3kChzEbxfiPBP1um2n51Fv0A7TG2ce55o89gXGPC5MCsAg
	OU3b2Hx8GpMHzVlExdmaEjX82l1X6kgw+7GC+XMX5ZWveo+64ilx9vm5avNCg3R/+NgA
	98gWWh1ws20Qhajq51027iqqyXHG/lBdIXDwXBUKIq/xCWTkff15TfolS7Lrtb35zAO5
	iuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=0al7JCEvZUyuW0fPVZ6KQ2xx6lisjo3eycSiKlxtmeU=;
	b=TZWtsOl/ZoGuIUzGaIXGQwaXW6cb7aGUQ9QWCjDCkzlwPjBPZYFn+aBLQ9IcZVNOa5
	DaXPvzM93JdqTHUE4Zrfo44OA/PthyjWwm/+7aYSLE7EiralbyHTK/1qM42V/5DydzvG
	o7V4oqlW7rG2YIK2P3X0kgZuvTEBhcP+Sxmp+zQ8dcmrR6VXE/nxtiiDOD08Th2SfQA/
	EwTOO+m4FyB/OhKSSmsqsOPCigWITOISOVovtyqAx5JabKfjkZCNUhM6PR7mCAQ1d8c3
	Wvj7vQDjFDfYrt5CHvmE/+OMQAw36+fLd8Llw6Tas47R0Ekvy/83BgBYAagWd+hyHKgV
	A4+Q==
X-Gm-Message-State: AOPr4FWoGNFb3ZVEWv4iFd//1w0MTg1V9KrkLu/BByI5psrt7+l+XomwIWelFlCubla/KN07r8618N9r6/YuZQ==
X-Received: by 10.140.199.8 with SMTP id u8mr24936568qha.5.1462028225643; Sat,
	30 Apr 2016 07:57:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sat, 30 Apr 2016 07:56:36 -0700 (PDT)
In-Reply-To: <1462017429-26604-1-git-send-email-schnitzeltony@googlemail.com>
References: <1462017429-26604-1-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Apr 2016 07:56:36 -0700
Message-ID: <CAMKF1sq-NCWbg6d_p-F8N5fn7p+CBn5bQ_1fWAfUmG6p0o4vSw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] replace base_contains by bb.utils.contains
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
X-List-Received-Date: Sat, 30 Apr 2016 14:57:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

are you doing it from meta-openembedded too :)

On Sat, Apr 30, 2016 at 4:57 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../packagegroup-qt5-toolchain-target.bb           | 34 +++++++++++-----=
------
>  recipes-qt/qt5/qt5.inc                             |  2 +-
>  recipes-qt/qt5/qtbase_git.bb                       | 10 +++----
>  recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
>  recipes-qt/qt5/qtimageformats_git.bb               |  8 ++---
>  recipes-qt/qt5/qtlocation_git.bb                   |  4 +--
>  recipes-qt/qt5/qttools_git.bb                      |  4 +--
>  recipes-qt/qt5/qtwebengine_git.bb                  |  2 +-
>  recipes-qt/qt5/qtwebkit-examples_git.bb            |  2 +-
>  9 files changed, 34 insertions(+), 34 deletions(-)
>
> diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.b=
b b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> index cc4d4b5..f64db8f 100644
> --- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> +++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
> @@ -12,11 +12,11 @@ USE_RUBY =3D " \
>      qtquick1-dev \
>      qtquick1-mkspecs \
>      qtquick1-plugins \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtquick1-qmlplugins',=
 '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtquick1-qmlplugi=
ns', '', d)} \
>      qttranslations-qtquick1 \
>      qtwebkit-dev \
>      qtwebkit-mkspecs \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtwebkit-qmlplugins',=
 '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtwebkit-qmlplugi=
ns', '', d)} \
>  "
>
>  # Requires Wayland to work
> @@ -36,9 +36,9 @@ USE_X11 =3D " \
>  RDEPENDS_${PN} +=3D " \
>      packagegroup-core-standalone-sdk-target \
>      libsqlite3-dev \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-dev', '', d)} \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-mkspecs', '', d)=
} \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-qmlplugins', '',=
 d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qt3d-dev', '', d)=
} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qt3d-mkspecs', ''=
, d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qt3d-qmlplugins',=
 '', d)} \
>      qtbase-dev \
>      qtbase-fonts \
>      qtbase-mkspecs \
> @@ -50,30 +50,30 @@ RDEPENDS_${PN} +=3D " \
>      qttranslations-qthelp \
>      qtconnectivity-dev \
>      qtconnectivity-mkspecs \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtconnectivity-qmlplu=
gins', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtconnectivity-qm=
lplugins', '', d)} \
>      qttranslations-qtconnectivity \
>      qtdeclarative-dev \
>      qtdeclarative-mkspecs \
>      qtdeclarative-plugins \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtdeclarative-qmlplug=
ins', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtdeclarative-qml=
plugins', '', d)} \
>      qtdeclarative-staticdev \
>      qttranslations-qmlviewer \
>      qttranslations-qtdeclarative \
>      qtenginio-dev \
>      qtenginio-mkspecs \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtenginio-qmlplugins'=
, '', d)} \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtgraphicaleffects-qm=
lplugins', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtenginio-qmlplug=
ins', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtgraphicaleffect=
s-qmlplugins', '', d)} \
>      qtimageformats-dev \
>      qtimageformats-plugins \
>      qtlocation-dev \
>      qtlocation-mkspecs \
>      qtlocation-plugins \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtlocation-qmlplugins=
', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtlocation-qmlplu=
gins', '', d)} \
>      qttranslations-qtlocation \
>      qtmultimedia-dev \
>      qtmultimedia-mkspecs \
>      qtmultimedia-plugins \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtmultimedia-qmlplugi=
ns', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtmultimedia-qmlp=
lugins', '', d)} \
>      qttranslations-qtmultimedia \
>      qtscript-dev \
>      qtscript-mkspecs \
> @@ -81,7 +81,7 @@ RDEPENDS_${PN} +=3D " \
>      qtsensors-dev \
>      qtsensors-mkspecs \
>      qtsensors-plugins \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtsensors-qmlplugins'=
, '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtsensors-qmlplug=
ins', '', d)} \
>      qtserialport-dev \
>      qtserialport-mkspecs \
>      qtsvg-dev \
> @@ -89,21 +89,21 @@ RDEPENDS_${PN} +=3D " \
>      qtsvg-plugins \
>      qtsystems-dev \
>      qtsystems-mkspecs \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtsystems-qmlplugins'=
, '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtsystems-qmlplug=
ins', '', d)} \
>      qttools-dev \
>      qttools-mkspecs \
>      qttools-staticdev \
>      qttools-tools \
> -    ${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '',=
 d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}',=
 '', d)} \
>      ${USE_RUBY} \
> -    ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)}=
 \
>      qtwebsockets-dev \
>      qtwebsockets-mkspecs \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtwebsockets-qmlplugi=
ns', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtwebsockets-qmlp=
lugins', '', d)} \
>      qttranslations-qtwebsockets \
>      qtwebchannel-dev \
>      qtwebchannel-mkspecs \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtwebchannel-qmlplugi=
ns', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtwebchannel-qmlp=
lugins', '', d)} \
>      qtxmlpatterns-dev \
>      qtxmlpatterns-mkspecs \
>      qttranslations-qtxmlpatterns \
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index 85d7d89..f9cb2b4 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -6,7 +6,7 @@ inherit qmake5
>  PACKAGECONFIG_OPENSSL ?=3D "openssl"
>
>  PACKAGECONFIG[examples] =3D ""
> -EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'examples', =
'QT_BUILD_PARTS+=3Dexamples', '', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'example=
s', 'QT_BUILD_PARTS+=3Dexamples', '', d)}"
>
>  # we don't want conflicts with qt4
>  OE_QMAKE_PATH_HEADERS =3D "${OE_QMAKE_PATH_QT_HEADERS}"
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 09f8ebd..b85c563 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -34,12 +34,12 @@ RDEPENDS_${PN}-tools +=3D "perl"
>  # PACKAGECONFIG is kept rather minimal for people who don't need
>  # stuff like webkit (and it's easier to add options than remove)
>
> -PACKAGECONFIG_GL ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl=
', '', d)}"
> -PACKAGECONFIG_FB ?=3D "${@base_contains('DISTRO_FEATURES', 'directfb', '=
directfb', '', d)}"
> -PACKAGECONFIG_X11 ?=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb =
xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcursor g=
lib gtkstyle xkb', '', d)}"
> +PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl',=
 'gl', '', d)}"
> +PACKAGECONFIG_FB ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'directfb=
', 'directfb', '', d)}"
> +PACKAGECONFIG_X11 ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '=
xcb xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcurs=
or glib gtkstyle xkb', '', d)}"
>  PACKAGECONFIG_FONTS ?=3D ""
>  PACKAGECONFIG_SYSTEM ?=3D "jpeg libpng zlib"
> -PACKAGECONFIG_MULTIMEDIA ?=3D "${@base_contains('DISTRO_FEATURES', 'puls=
eaudio', 'pulseaudio', '', d)}"
> +PACKAGECONFIG_MULTIMEDIA ?=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
pulseaudio', 'pulseaudio', '', d)}"
>  PACKAGECONFIG_DISTRO ?=3D ""
>  # Either release or debug, can be overridden in bbappends
>  PACKAGECONFIG_RELEASE ?=3D "release"
> @@ -254,7 +254,7 @@ FILES_${PN}-fonts-qpf            =3D "${OE_QMAKE_PATH=
_QT_FONTS}/*.qpf*"
>  FILES_${PN}-fonts                =3D "${OE_QMAKE_PATH_QT_FONTS}/README \
>                                      ${OE_QMAKE_PATH_QT_FONTS}/fontdir"
>
> -RRECOMMENDS_${PN}-plugins +=3D "${@base_contains('DISTRO_FEATURES', 'x11=
', 'libx11-locale', '', d)}"
> +RRECOMMENDS_${PN}-plugins +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'x11', 'libx11-locale', '', d)}"
>
>  sysroot_stage_dirs_append() {
>      # $to is 2nd parameter passed to sysroot_stage_dir, e.g. ${SYSROOT_D=
ESTDIR} passed from sysroot_stage_all
> diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdecla=
rative_git.bb
> index bf3a108..72b3d7b 100644
> --- a/recipes-qt/qt5/qtdeclarative_git.bb
> +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> @@ -32,7 +32,7 @@ do_configure_prepend() {
>      echo "QT_TOOL.syncqt.binary =3D \"${STAGING_BINDIR_NATIVE}${QT_DIR_N=
AME}/syncqt\"" > ${B}/.qmake.cache
>  }
>
> -EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'qtxmlpatter=
ns', 'CONFIG+=3DOE_QTXMLPATTERNS_ENABLED', '', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpa=
tterns', 'CONFIG+=3DOE_QTXMLPATTERNS_ENABLED', '', d)}"
>
>  SRCREV =3D "26ff8f9029107877bfbfdc2f099f9b11861183ed"
>
> diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimag=
eformats_git.bb
> index 4c4431d..573b330 100644
> --- a/recipes-qt/qt5/qtimageformats_git.bb
> +++ b/recipes-qt/qt5/qtimageformats_git.bb
> @@ -23,9 +23,9 @@ PACKAGECONFIG[libmng] =3D ",,libmng"
>  PACKAGECONFIG[libtiff] =3D ",,tiff"
>  PACKAGECONFIG[libwebp] =3D ",,libwebp"
>
> -EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'libmng', 'C=
ONFIG+=3DOE_LIBMNG_ENABLED', '', d)}"
> -EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'jasper', 'C=
ONFIG+=3DOE_JASPER_ENABLED', '', d)}"
> -EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'libtiff', '=
CONFIG+=3DOE_LIBTIFF_ENABLED', '', d)}"
> -EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'libwebp', '=
CONFIG+=3DOE_LIBWEBP_ENABLED', '', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'libmng'=
, 'CONFIG+=3DOE_LIBMNG_ENABLED', '', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'jasper'=
, 'CONFIG+=3DOE_JASPER_ENABLED', '', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'libtiff=
', 'CONFIG+=3DOE_LIBTIFF_ENABLED', '', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'libwebp=
', 'CONFIG+=3DOE_LIBWEBP_ENABLED', '', d)}"
>
>  SRCREV =3D "bf5b49878d75d316f31225f76152e8381a3d5f0f"
> diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation=
_git.bb
> index d573b6b..8a41551 100644
> --- a/recipes-qt/qt5/qtlocation_git.bb
> +++ b/recipes-qt/qt5/qtlocation_git.bb
> @@ -26,7 +26,7 @@ do_configure_prepend() {
>      sed -i -e 's/^\(qtCompileTest(gypsy)\)/OE_GYPSY_ENABLED:\1/' ${S}/qt=
location.pro
>  }
>
> -EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'geoclue', '=
CONFIG+=3DOE_GEOCLUE_ENABLED', '', d)}"
> -EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'gypsy', 'CO=
NFIG+=3DOE_GYPSY_ENABLED', '', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'geoclue=
', 'CONFIG+=3DOE_GEOCLUE_ENABLED', '', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'gypsy',=
 'CONFIG+=3DOE_GYPSY_ENABLED', '', d)}"
>
>  SRCREV =3D "d1f66746ab0b77b4f3300cbeeaafe61d25d78e98"
> diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.b=
b
> index 3a27bbd..e0b23b4 100644
> --- a/recipes-qt/qt5/qttools_git.bb
> +++ b/recipes-qt/qt5/qttools_git.bb
> @@ -28,8 +28,8 @@ PACKAGECONFIG_class-nativesdk ??=3D "linguistonly"
>  PACKAGECONFIG[linguistonly] =3D ""
>  PACKAGECONFIG[qtwebkit] =3D ",,qtwebkit"
>
> -EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'qtwebkit', =
'', 'CONFIG+=3Dnoqtwebkit', d)}"
> -EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'linguistonl=
y', 'CONFIG+=3Dlinguistonly', '', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'qtwebki=
t', '', 'CONFIG+=3Dnoqtwebkit', d)}"
> +EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'linguis=
tonly', 'CONFIG+=3Dlinguistonly', '', d)}"
>
>  SRCREV =3D "e33532e048fa12ee32429ca83ee31aa8f065147d"
>
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengi=
ne_git.bb
> index 98b4bab..427cd95 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -22,7 +22,7 @@ DEPENDS +=3D " \
>  # qtwebengine will have additional dependencies:
>  # contains(QT_CONFIG, xcb): REQUIRED_PACKAGES +=3D libdrm xcomposite xcu=
rsor xi xrandr xscrnsaver xtst
>  # xscreensaver isn't covered in qtbase DEPENDS
> -DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'libxscrnsaver'=
, '', d)}"
> +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxscrnsa=
ver', '', d)}"
>
>  DEPENDS +=3D "yasm-native"
>  EXTRA_QMAKEVARS_PRE +=3D "GYP_CONFIG+=3Duse_system_yasm"
> diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtw=
ebkit-examples_git.bb
> index 63d02fa..933220d 100644
> --- a/recipes-qt/qt5/qtwebkit-examples_git.bb
> +++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
> @@ -17,6 +17,6 @@ PACKAGECONFIG ?=3D "examples"
>
>  DEPENDS +=3D "qtwebkit qtxmlpatterns"
>  RDEPENDS_${PN}-examples +=3D "qtwebkit-qmlplugins"
> -RDEPENDS_${PN}-examples +=3D "${@base_contains('PACKAGECONFIG_OPENSSL', =
'openssl', 'ca-certificates', '', d)}"
> +RDEPENDS_${PN}-examples +=3D "${@bb.utils.contains('PACKAGECONFIG_OPENSS=
L', 'openssl', 'ca-certificates', '', d)}"
>
>  SRCREV =3D "1b9a0fc9d1ded4f4f11b04eb0bb7d1de82d6eb34"
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

