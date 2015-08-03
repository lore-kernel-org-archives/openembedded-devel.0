Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF1773231
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2015 19:04:59 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so127068612wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Aug 2015 12:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+1gycVottEOoAu53MeEgjIkYmXehNoGErPJtksFUFC0=;
	b=DQOfMxfjN7erTHN2akMACpiw0i7Z4STudbwjt2vrTTzz+EeDHVBFVb0UHX9GGU8dzh
	KdOEO5tpSrnFIcg+hqio4naJ3JjY6k2geGUQ7k0KwF2Eok0ArFg8NTHmGf+KFlLT2pXm
	mysqk4LIRSoniJxGTmH3KcFZo6qDy93pONNYs1zOwFkMGkU50AQ1kWF3fTdQyjUZNz/M
	oltCBfOCFj+kfliM8rAanj176on33MHb6E0mJt9s81yQaga05grQVHJhlYTLYICG9597
	X1WoCX/TRJySSNQAIf3wdtRVYC93JUladd/i7EhdHiZCgNJ2bNO0mhBT2tY2JW9holby
	ABrA==
X-Received: by 10.194.23.167 with SMTP id n7mr35359188wjf.112.1438628699718;
	Mon, 03 Aug 2015 12:04:59 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	go5sm14963413wib.5.2015.08.03.12.04.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 12:04:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 3 Aug 2015 21:05:03 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150803190503.GD2465@jama>
References: <1429280204-27191-3-git-send-email-Martin.Jansa@gmail.com>
	<1438628438-9452-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1438628438-9452-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 1/2] recipes-git: upgrade to 5.5
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
X-List-Received-Date: Mon, 03 Aug 2015 19:05:02 -0000
X-Groupsio-MsgNum: 56519
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Content-Disposition: inline

--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2015 at 09:00:37PM +0200, Martin Jansa wrote:
> * based on my WIP patch + fixes from John Mullen
> * I was trying to get rhid of 0003-Add-external-hostbindir-option.patch
>   and 0010-Add-external-hostbindir-option-for-native-sdk.patch by using
>   upstream configure parameter added in some previous version, but I've
>   failed, so now good-old -external-hostbindir parameter is back

There is one know issue (or maybe just change of behavior)..

qtwayland tries to link against qtfreetype (when qtbase is configured to
use bundled freetype) and fails to find it, in builds where qtbase
PACKAGECONFIG contains freetype and fontconfig it builds OK.

Please test in our environment and report issues you see (patches very
welcome).

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-qt/qt5/nativesdk-qtbase_git.bb             |   25 +-
>  recipes-qt/qt5/nativesdk-qttools_git.bb            |   11 +-
>  recipes-qt/qt5/qt3d_git.bb                         |   14 +-
>  recipes-qt/qt5/qt5-git.inc                         |   10 +-
>  recipes-qt/qt5/qtbase-native_git.bb                |   23 +-
>  .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |   39 +-
>  ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   16 +-
>  .../0003-Add-external-hostbindir-option.patch      |   42 +-
>  ...le-Fix-pkgconfig-and-libtool-replacements.patch |   34 +-
>  ...lfs-Print-the-chosen-config-in-debug-mode.patch |   97 -
>  ...mintegration-Undefine-CursorShape-from-X..patch |   30 +
>  ...ump-path-length-from-256-to-512-character.patch |   29 +
>  ...mintegration-Undefine-CursorShape-from-X..patch |   30 -
>  ...ump-path-length-from-256-to-512-character.patch |   29 -
>  ...gl-error-for-platforms-only-supporting-on.patch |   72 +
>  .../0008-QOpenGLPaintDevice-sub-area-support.patch |  157 ++
>  ...gl-error-for-platforms-only-supporting-on.patch |   72 -
>  recipes-qt/qt5/qtbase/0009-Always-build-uic.patch  |   31 +
>  .../0009-QOpenGLPaintDevice-sub-area-support.patch |  157 --
>  ...reserve-built-qmake-and-swap-with-native-.patch |   29 +
>  ...-build-it-in-configure-but-allow-to-build.patch |   68 +
>  ...external-hostbindir-option-for-native-sdk.patch |  130 ++
>  ...ConfigExtras.cmake-find-gl-es-include-dir.patch |   42 -
>  recipes-qt/qt5/qtbase/0011-Always-build-uic.patch  |   31 -
>  ...-build-it-in-configure-but-allow-to-build.patch |   68 -
>  ...external-hostbindir-option-for-native-sdk.patch |  108 -
>  ...reserve-built-qmake-and-swap-with-native-.patch |   30 -
>  recipes-qt/qt5/qtbase_git.bb                       |   29 +-
>  recipes-qt/qt5/qtconnectivity_git.bb               |   10 +-
>  .../0001-qmltestexample-fix-link.patch             |    4 +-
>  recipes-qt/qt5/qtdeclarative_git.bb                |   13 +-
>  recipes-qt/qt5/qtenginio_git.bb                    |   10 +-
>  recipes-qt/qt5/qtgraphicaleffects_git.bb           |   10 +-
>  ...ats.pro-Make-the-dependencies-determinist.patch |    2 +-
>  recipes-qt/qt5/qtimageformats_git.bb               |    8 +-
>  recipes-qt/qt5/qtlocation_git.bb                   |   10 +-
>  ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 2377 +-------------=
------
>  recipes-qt/qt5/qtmultimedia_git.bb                 |   12 +-
>  recipes-qt/qt5/qtquick1_git.bb                     |   10 +-
>  recipes-qt/qt5/qtquickcontrols_git.bb              |    8 +-
>  recipes-qt/qt5/qtscript_git.bb                     |    8 +-
>  recipes-qt/qt5/qtsensors_git.bb                    |   10 +-
>  .../0001-Unix-Clear-serial_struct-instances.patch  |   42 -
>  recipes-qt/qt5/qtserialport_git.bb                 |   14 +-
>  recipes-qt/qt5/qtsvg_git.bb                        |    8 +-
>  recipes-qt/qt5/qtsystems_git.bb                    |    4 +-
>  recipes-qt/qt5/qttools-native_git.bb               |   10 +-
>  ...w-to-build-only-lrelease-lupdate-lconvert.patch |   32 +-
>  ...t-help-fix-linking-of-dependent-libraries.patch |    2 +-
>  .../0003-add-noqtwebkit-configuration.patch        |   20 +-
>  recipes-qt/qt5/qttools_git.bb                      |    8 +-
>  recipes-qt/qt5/qttranslations_git.bb               |    8 +-
>  recipes-qt/qt5/qtwayland-native_git.bb             |    8 +-
>  ...-qtwaylandscanner-tool-to-the-native-side.patch |    2 +-
>  ...yland-include-server-buffer-only-when-bui.patch |    6 +-
>  recipes-qt/qt5/qtwayland_git.bb                    |   10 +-
>  recipes-qt/qt5/qtwebchannel_git.bb                 |    8 +-
>  ...se.gypi-include-atomicops_internals_x86_g.patch |    6 +-
>  ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |   19 +-
>  ...rf-Make-sure-we-only-use-the-file-name-to.patch |   12 +-
>  ...s.prf-allow-build-for-linux-oe-g-platform.patch |    8 +-
>  recipes-qt/qt5/qtwebengine_git.bb                  |   10 +-
>  ...amples-enable-building-examples-by-defaul.patch |    2 +-
>  recipes-qt/qt5/qtwebkit-examples_git.bb            |   12 +-
>  .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |    2 +-
>  .../qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch  |    2 +-
>  recipes-qt/qt5/qtwebkit_git.bb                     |    4 +-
>  recipes-qt/qt5/qtwebsockets_git.bb                 |    9 +-
>  recipes-qt/qt5/qtx11extras_git.bb                  |   10 +-
>  recipes-qt/qt5/qtxmlpatterns_git.bb                |    8 +-
>  70 files changed, 869 insertions(+), 3362 deletions(-)
>  delete mode 100644 recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-cho=
sen-config-in-debug-mode.patch
>  create mode 100644 recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Un=
define-CursorShape-from-X..patch
>  create mode 100644 recipes-qt/qt5/qtbase/0006-configure-bump-path-length=
-from-256-to-512-character.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Un=
define-CursorShape-from-X..patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0007-configure-bump-path-length=
-from-256-to-512-character.patch
>  create mode 100644 recipes-qt/qt5/qtbase/0007-eglfs-fix-egl-error-for-pl=
atforms-only-supporting-on.patch
>  create mode 100644 recipes-qt/qt5/qtbase/0008-QOpenGLPaintDevice-sub-are=
a-support.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-pl=
atforms-only-supporting-on.patch
>  create mode 100644 recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-are=
a-support.patch
>  create mode 100644 recipes-qt/qt5/qtbase/0009-configure-preserve-built-q=
make-and-swap-with-native-.patch
>  create mode 100644 recipes-qt/qt5/qtbase/0009-qmake-don-t-build-it-in-co=
nfigure-but-allow-to-build.patch
>  create mode 100644 recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-op=
tion-for-native-sdk.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cm=
ake-find-gl-es-include-dir.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-co=
nfigure-but-allow-to-build.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-op=
tion-for-native-sdk.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0013-configure-preserve-built-q=
make-and-swap-with-native-.patch
>  delete mode 100644 recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_st=
ruct-instances.patch
>=20
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nati=
vesdk-qtbase_git.bb
> index ce5e97f..c32e48e 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -5,9 +5,9 @@ HOMEPAGE =3D "http://qt-project.org"
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dd87ae0d200af76dca730d911474cbe5b \
> -    file://LICENSE.LGPLv3;md5=3Dffcfac38a32c9ebdb8ff768fa1702478 \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> @@ -25,23 +25,21 @@ SRC_URI +=3D "\
>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.pat=
ch \
>      file://0003-Add-external-hostbindir-option.patch \
>      file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
> -    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch=
 \
> -    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..pat=
ch \
> -    file://0007-configure-bump-path-length-from-256-to-512-character.pat=
ch \
> -    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.pat=
ch \
> -    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
> -    file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.pat=
ch \
> +    file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..pat=
ch \
> +    file://0006-configure-bump-path-length-from-256-to-512-character.pat=
ch \
> +    file://0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.pat=
ch \
> +    file://0008-QOpenGLPaintDevice-sub-area-support.patch \
>  "
> =20
>  # common for qtbase-native and nativesdk-qtbase
>  SRC_URI +=3D " \
> -    file://0011-Always-build-uic.patch \
> -    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
> +    file://0009-Always-build-uic.patch \
> +    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
>  "
> =20
>  # specific for nativesdk-qtbase
>  SRC_URI +=3D " \
> -    file://0013-configure-preserve-built-qmake-and-swap-with-native-.pat=
ch \
> +    file://0009-configure-preserve-built-qmake-and-swap-with-native-.pat=
ch \
>  "
> =20
>  # CMake's toolchain configuration of nativesdk-qtbase
> @@ -193,7 +191,6 @@ do_configure() {
>          -testsdir ${OE_QMAKE_PATH_TESTS} \
>          -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
>          -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
> -        -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
>          -no-glib \
>          -no-iconv \
>          -silent \
> @@ -280,4 +277,4 @@ do_generate_qt_environment_file() {
> =20
>  addtask generate_qt_environment_file after do_install before do_package
> =20
> -SRCREV =3D "2cb17c1fb903434274e58692c9f0df619affdab0"
> +SRCREV =3D "2fde9f59eeab68ede92324e7613daf8be3eaf498"
> diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nat=
ivesdk-qttools_git.bb
> index 73e5d22..b217da1 100644
> --- a/recipes-qt/qt5/nativesdk-qttools_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
> @@ -1,8 +1,8 @@
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dd87ae0d200af76dca730d911474cbe5b \
> -    file://LICENSE.LGPLv3;md5=3Dffcfac38a32c9ebdb8ff768fa1702478 \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> @@ -13,9 +13,6 @@ DEPENDS =3D "nativesdk-qtbase qtbase-native"
>  require nativesdk-qt5.inc
>  require qt5-git.inc
> =20
> -# it's already included with newer oe-core, but include it here for dylan
> -FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qttools:"
> -
>  SRC_URI +=3D "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.=
patch"
> =20
>  PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
> @@ -42,4 +39,4 @@ do_install() {
>      rm -rf ${D}${libdir}
>  }
> =20
> -SRCREV =3D "a6ed9b418d1b4464f088b378e5bdb96ec420db6c"
> +SRCREV =3D "33c65366a7c3901d2aecfde3dbc485e1eac5c10c"
> diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
> index 62f17e1..7f61271 100644
> --- a/recipes-qt/qt5/qt3d_git.bb
> +++ b/recipes-qt/qt5/qt3d_git.bb
> @@ -1,13 +1,10 @@
>  require qt5.inc
>  require qt5-git.inc
> =20
> -LICENSE =3D "GFDL-1.3 & LGPL-2.1 & DIGIA-TPLA-2.4 | GPL-3.0"
> +LICENSE =3D "GFDL-1.3 & LGPL-3.0 & DIGIA-TPLA-2.4 | GPL-2.0"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPL;md5=3D4193e7f1d47a858f6b7c0f1ee66161de \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> -    file://LICENSE.PREVIEW.COMMERCIAL;md5=3D9d94dadfab8b246782ffea02082e=
e13a \
> -    file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.GPL;md5=3Dd32239bcb673463ab874e80d47fae504 \
> +    file://LICENSE.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> +    file://LICENSE.GPL;md5=3D05832301944453ec79e40ba3c3cfceec\
>  "
> =20
>  DEPENDS =3D "qtdeclarative"
> @@ -17,7 +14,4 @@ FILES_${PN}-qmlplugins +=3D " \
>      ${OE_QMAKE_PATH_QML}/*/*/*.obj \
>  "
> =20
> -QT_MODULE_BRANCH =3D "dev"
> -
> -# last tag before this SRCREV is 5.0.0-beta1, but version says 5.3.0 alr=
eady
> -SRCREV =3D "8a9723d7420829a2ba0141a9f7d8dc8cd11d8331"
> +SRCREV =3D "a3b99941751598fb734b189333d5020666df2b2c"
> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> index b0571bf..ea37b55 100644
> --- a/recipes-qt/qt5/qt5-git.inc
> +++ b/recipes-qt/qt5/qt5-git.inc
> @@ -1,7 +1,7 @@
>  # Copyright (C) 2012 O.S. Systems Software LTDA.
>  # Copyright (C) 2013-2014 Martin Jansa <martin.jansa@gmail.com>
> =20
> -QT_MODULE_BRANCH ?=3D "5.4"
> +QT_MODULE_BRANCH ?=3D "5.5"
> =20
>  # each module needs to define valid SRCREV
>  SRC_URI =3D " \
> @@ -10,4 +10,10 @@ SRC_URI =3D " \
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -PV =3D "5.4.2+git${SRCPV}"
> +PV =3D "5.5.0+git${SRCPV}"
> +
> +#LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Except=
ion-1.1 | LGPL-3.0)"
> +#LIC_FILES_CHKSUM =3D "file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f=
782b3a485c29 \
> +#                    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e9=
0ed62e962 \
> +#                    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d=
63651a9d97654 \
> +#                    file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b=
6aaf7e"
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-=
native_git.bb
> index f84f38e..5470519 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -4,9 +4,9 @@ SECTION =3D "libs"
>  HOMEPAGE =3D "http://qt-project.org"
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dd87ae0d200af76dca730d911474cbe5b \
> -    file://LICENSE.LGPLv3;md5=3Dffcfac38a32c9ebdb8ff768fa1702478 \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> @@ -21,21 +21,18 @@ SRC_URI +=3D "\
>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.pat=
ch \
>      file://0003-Add-external-hostbindir-option.patch \
>      file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
> -    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch=
 \
> -    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..pat=
ch \
> -    file://0007-configure-bump-path-length-from-256-to-512-character.pat=
ch \
> -    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.pat=
ch \
> -    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
> -    file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.pat=
ch \
> +    file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..pat=
ch \
> +    file://0006-configure-bump-path-length-from-256-to-512-character.pat=
ch \
> +    file://0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.pat=
ch \
> +    file://0008-QOpenGLPaintDevice-sub-area-support.patch \
>  "
> =20
>  # common for qtbase-native and nativesdk-qtbase
>  SRC_URI +=3D " \
> -    file://0011-Always-build-uic.patch \
> -    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
> +    file://0009-Always-build-uic.patch \
> +    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
>  "
> =20
> -
>  CLEANBROKEN =3D "1"
> =20
>  QT_CONF_PATH =3D "${B}/qt.conf"
> @@ -121,4 +118,4 @@ do_install() {
>      ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
>  }
> =20
> -SRCREV =3D "2cb17c1fb903434274e58692c9f0df619affdab0"
> +SRCREV =3D "2fde9f59eeab68ede92324e7613daf8be3eaf498"
> diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/r=
ecipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> index 0f6bcbe..1997d0d 100644
> --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> @@ -1,7 +1,7 @@
> -From ec414ca0df1ec459b5abd753cf0d730572715e17 Mon Sep 17 00:00:00 2001
> +From b8b9732948ede2b27304eed7f1d78aed16a4eeb7 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Mon, 15 Apr 2013 04:29:32 +0200
> -Subject: [PATCH 01/12] Add linux-oe-g++ platform
> +Subject: [PATCH 1/7] Add linux-oe-g++ platform
> =20
>  * This qmake.conf unlike other platforms reads most variables from
>    shell environment, because it's easier for qt recipes to export
> @@ -43,19 +43,19 @@ Upstream-Status: Inappropriate [embedded specific]
>  Change-Id: I0591ed5da0d61d7cf1509d420e6b293582f1863c
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  ---
> - configure                            |  66 ++++++++++++++++-------
> + configure                            |  70 +++++++++++++++---------
>   mkspecs/features/configure.prf       |   4 +-
>   mkspecs/linux-oe-g++/qmake.conf      |  40 ++++++++++++++
>   mkspecs/linux-oe-g++/qplatformdefs.h | 100 ++++++++++++++++++++++++++++=
+++++++
> - 4 files changed, 188 insertions(+), 22 deletions(-)
> + 4 files changed, 186 insertions(+), 28 deletions(-)
>   create mode 100644 mkspecs/linux-oe-g++/qmake.conf
>   create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
> =20
>  diff --git a/configure b/configure
> -index 6ce6753..0a00d6d 100755
> +index 7251e8e..8093782 100755
>  --- a/configure
>  +++ b/configure
> -@@ -316,6 +316,16 @@ getQMakeConf()
> +@@ -342,6 +342,16 @@ getQMakeConf()
>       getSingleQMakeVariable "$1" "$specvals"
>   }
>  =20
> @@ -72,7 +72,7 @@ index 6ce6753..0a00d6d 100755
>   getXQMakeConf()
>   {
>       if [ -z "$xspecvals" ]; then
> -@@ -325,6 +335,16 @@ getXQMakeConf()
> +@@ -351,6 +361,16 @@ getXQMakeConf()
>       getSingleQMakeVariable "$1" "$xspecvals"
>   }
>  =20
> @@ -89,37 +89,38 @@ index 6ce6753..0a00d6d 100755
>   compilerSupportsFlag()
>   {
>       cat >conftest.cpp <<EOF
> -@@ -541,21 +561,19 @@ fi
> +@@ -564,24 +584,14 @@ fi
>   # initalize variables
>   #----------------------------------------------------------------------=
---------
>  =20
> --SYSTEM_VARIABLES=3D"RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFL=
AGS"
> +-SYSTEM_VARIABLES=3D"AR RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS L=
DFLAGS"
>  -for varname in $SYSTEM_VARIABLES; do
>  +# Export all OE variables for qmake.conf from shell env to QMakeVars
>  +OE_VARIABLES=3D"AR CC CFLAGS COMPILER CXX CXXFLAGS LDFLAGS LINK QT_CONF=
IG STRIP"
>  +for varname in $OE_VARIABLES; do
>       qmakevarname=3D"${varname}"
> +-    qmakecmdargs=3D""
>  -    # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
>  -    if [ "${varname}" =3D "LDFLAGS" ]; then
>  -        qmakevarname=3D"LFLAGS"
>  -    elif [ "${varname}" =3D "LD" ]; then
>  -        qmakevarname=3D"LINK"
> +-    elif [ "${varname}" =3D "AR" ]; then
> +-        # QMAKE_AR needs to be set to "/path/to/ar cqs" but the
> +-        # environment variable will be set to the command only so we
> +-        # need to append " cqs" for autoconf compatibility
> +-        qmakecmdargs=3D" cqs"
>  -    fi
>       cmd=3D`echo \
>  -'if [ -n "\$'${varname}'" ]; then
> --    QMakeVar set QMAKE_'${qmakevarname}' "\$'${varname}'"
> +-    QMakeVar set QMAKE_'${qmakevarname}' "\$'${varname}${qmakecmdargs}'"
>  +'if [ -n "\$OE_QMAKE_'${varname}'" ]; then
>  +    QMakeVar set OE_QMAKE_'${qmakevarname}' "\$OE_QMAKE_'${varname}'"
>  +#    echo "Exporting OE_QMAKE_'${qmakevarname}' value=3D\"\$OE_QMAKE_'$=
{varname}'\"" >&2
>   fi'`
>       eval "$cmd"
>   done
> -+
> -+SYSTEM_VARIABLES=3D"RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFL=
AGS"
> - # Use CC/CXX to run config.tests
> - mkdir -p "$outpath/config.tests"
> - rm -f "$outpath/config.tests/.qmake.cache"
> -@@ -3178,7 +3196,7 @@ if [ "$XPLATFORM_MAC" =3D "yes" ]; then
> +@@ -3335,7 +3345,7 @@ if [ "$XPLATFORM_MAC" =3D "yes" ]; then
>       [ "$CFG_QGTKSTYLE" =3D "auto" ] && CFG_QGTKSTYLE=3Dno
>   fi
>  =20
> @@ -128,7 +129,7 @@ index 6ce6753..0a00d6d 100755
>  =20
>   TEST_COMPILER=3D$QMAKE_CONF_COMPILER
>  =20
> -@@ -3216,7 +3234,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" =3D "no" ]; then
> +@@ -3392,7 +3402,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" =3D "no" ]; then
>           exit 1
>       fi
>   fi
> @@ -137,7 +138,7 @@ index 6ce6753..0a00d6d 100755
>  =20
>   GCC_MACHINE_DUMP=3D
>   case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=3D$($TEST_COMPILER -dum=
pmachine);; esac
> -@@ -3687,6 +3705,14 @@ setBootstrapVariable()
> +@@ -3894,6 +3904,14 @@ setBootstrapVariable()
>       getQMakeConf "$1" | echo ${2-$1} =3D `if [ -n "$3" ]; then sed "$3"=
; else cat; fi` >> "$mkfile"
>   }
>  =20
> @@ -152,7 +153,7 @@ index 6ce6753..0a00d6d 100755
>   # build qmake
>   if true; then ###[ '!' -f "$outpath/bin/qmake" ];
>       echo "Creating qmake..."
> -@@ -3725,14 +3751,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
> +@@ -3932,14 +3950,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
>           fi
>  =20
>           [ "$CFG_SILENT" =3D "yes" ] && CC_TRANSFORM=3D's,^,\@,' || CC_T=
RANSFORM=3D
> diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf=
-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-t=
o-set-qt.conf-from-the-outside-u.patch
> index 69e3fdb..93571ab 100644
> --- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-t=
he-outside-u.patch
> +++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-t=
he-outside-u.patch
> @@ -1,8 +1,8 @@
> -From f681cc3a7cb36e2bcc5e26e767236e86a5d49841 Mon Sep 17 00:00:00 2001
> +From c8d9a59b03bf53838118f0ddf599d554a4fcf4c6 Mon Sep 17 00:00:00 2001
>  From: Holger Freyther <zecke@selfish.org>
>  Date: Wed, 26 Sep 2012 17:22:30 +0200
> -Subject: [PATCH 02/12] qlibraryinfo: allow to set qt.conf from the outsi=
de
> - using the environment
> +Subject: [PATCH 2/7] qlibraryinfo: allow to set qt.conf from the outside=
 using
> + the environment
> =20
>  Allow to set a qt.conf from the outside using the environment. This allo=
ws
>  to inject new prefixes and other paths into qmake. This is needed when u=
sing
> @@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>   1 file changed, 4 insertions(+), 1 deletion(-)
> =20
>  diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/ql=
ibraryinfo.cpp
> -index d66007b..91ca643 100644
> +index 2912e68..f663c88 100644
>  --- a/src/corelib/global/qlibraryinfo.cpp
>  +++ b/src/corelib/global/qlibraryinfo.cpp
> -@@ -138,7 +138,10 @@ QLibrarySettings::QLibrarySettings()
> +@@ -157,7 +157,10 @@ void QLibrarySettings::load()
>  =20
>   QSettings *QLibraryInfoPrivate::findConfiguration()
>   {
> @@ -31,9 +31,9 @@ index d66007b..91ca643 100644
>  +    QString qtconfig =3D QFile::decodeName(config);
>  +    if(!QFile::exists(qtconfig))
>  +        qtconfig =3D QStringLiteral(":/qt/etc/qt.conf");
> - #ifdef QT_BOOTSTRAPPED
> -     if(!QFile::exists(qtconfig))
> -         qtconfig =3D qt_libraryInfoFile();
> +     if (QFile::exists(qtconfig))
> +         return new QSettings(qtconfig, QSettings::IniFormat);
> + #ifdef QT_BUILD_QMAKE
>  --=20
>  2.4.2
> =20
> diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.pa=
tch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
> index af22406..4a8cdbb 100644
> --- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
> +++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
> @@ -1,7 +1,7 @@
> -From 47b88e13ed8f4bb3bd34ac24dcf4b908dcba6753 Mon Sep 17 00:00:00 2001
> +From d2212dd3c5acf7d3541f19470e688095a20d956c Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Sat, 6 Apr 2013 13:15:07 +0200
> -Subject: [PATCH 03/12] Add -external-hostbindir option
> +Subject: Add -external-hostbindir option
> =20
>  * when cross-compiling it's sometimes useful to use existing tools from =
machine
>    (or in OpenEmbedded built with separate native recipe) when building f=
or target
> @@ -23,21 +23,24 @@ Upstream-Status: Pending
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  Signed-off-by: Simon Busch <morphis@gravedo.de>
>  Signed-off-by: Jonathan Liu <net147@gmail.com>
> +
> +Conflicts:
> +        configure
>  ---
> - configure                                   | 15 +++++++++++++++
> + configure                                   | 14 ++++++++++++++
>   mkspecs/features/qt_functions.prf           |  6 +++++-
>   mkspecs/features/qt_tool.prf                |  4 ++--
>   qtbase.pro                                  | 13 ++++++++++---
>   src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
>   src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
>   src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
> - 7 files changed, 38 insertions(+), 12 deletions(-)
> + 7 files changed, 37 insertions(+), 12 deletions(-)
> =20
>  diff --git a/configure b/configure
> -index 0a00d6d..ad5f4cd 100755
> +index 43c4dab..ffb69df 100755
>  --- a/configure
>  +++ b/configure
> -@@ -770,6 +770,7 @@ QT_HOST_BINS=3D
> +@@ -806,6 +806,7 @@ QT_HOST_BINS=3D
>   QT_HOST_LIBS=3D
>   QT_HOST_DATA=3D
>   QT_EXT_PREFIX=3D
> @@ -45,7 +48,7 @@ index 0a00d6d..ad5f4cd 100755
>  =20
>   #flags for SQL drivers
>   QT_CFLAGS_PSQL=3D
> -@@ -889,6 +890,7 @@ while [ "$#" -gt 0 ]; do
> +@@ -925,6 +926,7 @@ while [ "$#" -gt 0 ]; do
>       -testsdir| \
>       -hostdatadir| \
>       -hostbindir| \
> @@ -53,7 +56,7 @@ index 0a00d6d..ad5f4cd 100755
>       -hostlibdir| \
>       -extprefix| \
>       -sysroot| \
> -@@ -1107,6 +1109,9 @@ while [ "$#" -gt 0 ]; do
> +@@ -1154,6 +1156,9 @@ while [ "$#" -gt 0 ]; do
>       extprefix)
>           QT_EXT_PREFIX=3D"$VAL"
>           ;;
> @@ -63,7 +66,7 @@ index 0a00d6d..ad5f4cd 100755
>       pkg-config)
>           if [ "$VAL" =3D "yes" ] || [ "$VAL" =3D "no" ]; then
>               CFG_PKGCONFIG=3D"$VAL"
> -@@ -2270,6 +2275,10 @@ Installation options:
> +@@ -2380,6 +2385,10 @@ Installation options:
>       -hostdatadir <dir> . Data used by qmake will be installed to <dir>
>                            (default HOSTPREFIX)
>  =20
> @@ -74,7 +77,7 @@ index 0a00d6d..ad5f4cd 100755
>   Configure options:
>  =20
>    The defaults (*) are usually acceptable. A plus (+) denotes a default =
value
> -@@ -2949,6 +2958,11 @@ fi
> +@@ -3095,6 +3104,11 @@ fi
>   # command line and environment validation
>   #----------------------------------------------------------------------=
---------
>  =20
> @@ -86,16 +89,8 @@ index 0a00d6d..ad5f4cd 100755
>   # update QT_CONFIG to show our current predefined configuration
>   CFG_QCONFIG_PATH=3D$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
>   case "$CFG_QCONFIG" in
> -@@ -3649,6 +3663,7 @@ static const char qt_configure_prefix_path_strs[][=
256 + 12] =3D {
> -     "qt_hbinpath=3D$QT_HOST_BINS",
> -     "qt_hlibpath=3D$QT_HOST_LIBS",
> -     "qt_hdatpath=3D$QT_HOST_DATA",
> -+    "qt_ebinpath=3D$QT_EXTERNAL_HOST_BINS",
> -     "qt_targspec=3D$shortxspec",
> -     "qt_hostspec=3D$shortspec",
> - #endif
>  diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_fun=
ctions.prf
> -index 79b4eab..8c6913e 100644
> +index a1c4996..fca679c 100644
>  --- a/mkspecs/features/qt_functions.prf
>  +++ b/mkspecs/features/qt_functions.prf
>  @@ -198,7 +198,11 @@ defineTest(qtAddRpathLink) {
> @@ -130,10 +125,10 @@ index 1d3e88c..9b26adf 100644
>  =20
>       !host_build|!force_bootstrap: MODULE_DEPENDS =3D $$replace(QT, -pri=
vate$, _private)
>  diff --git a/qtbase.pro b/qtbase.pro
> -index 6d0de44..ddf7478 100644
> +index 51e8fb8..9806769 100644
>  --- a/qtbase.pro
>  +++ b/qtbase.pro
> -@@ -69,18 +69,25 @@ CONFIG -=3D qt
> +@@ -37,12 +37,16 @@ CONFIG -=3D qt
>  =20
>   ### installations ####
>  =20
> @@ -153,6 +148,7 @@ index 6d0de44..ddf7478 100644
>   }
>   INSTALLS +=3D qmake
>  =20
> +@@ -54,6 +58,9 @@ exists($$licheck.files): INSTALLS +=3D licheck
>   #syncqt
>   syncqt.path =3D $$[QT_HOST_BINS]
>   syncqt.files =3D $$PWD/bin/syncqt.pl
> @@ -163,7 +159,7 @@ index 6d0de44..ddf7478 100644
>  =20
>   # If we are doing a prefix build, create a "module" pri which enables
>  diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5C=
oreConfigExtras.cmake.in
> -index 65fd1f9..457518b 100644
> +index 48d5f21..6482022 100644
>  --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
>  +++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
>  @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
> @@ -229,5 +225,5 @@ index 99d87e2..5621dc0 100644
>       _qt5_Widgets_check_file_exists(${imported_location})
>  =20
>  --=20
> -2.4.2
> +2.2.2
> =20
> diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libto=
ol-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-=
and-libtool-replacements.patch
> index 0cd6296..4bc6fdd 100644
> --- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-repl=
acements.patch
> +++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-repl=
acements.patch
> @@ -1,7 +1,7 @@
> -From 3f0f3ded0b4a85a04a0c492e33d8517e598ae08e Mon Sep 17 00:00:00 2001
> +From 3b289cf76a5ce78d94ee022af7d92152f5875372 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Sat, 27 Apr 2013 23:15:37 +0200
> -Subject: [PATCH 04/12] qt_module: Fix pkgconfig and libtool replacements
> +Subject: [PATCH 3/7] qt_module: Fix pkgconfig and libtool replacements
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> @@ -63,29 +63,29 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>  ---
>   mkspecs/features/qt_common.prf |  2 +-
> - mkspecs/features/qt_module.prf | 15 +++++++++++++++
> - 2 files changed, 16 insertions(+), 1 deletion(-)
> + mkspecs/features/qt_module.prf | 10 ++++++++++
> + 2 files changed, 11 insertions(+), 1 deletion(-)
> =20
>  diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common=
=2Eprf
> -index eb65e73..4db40d0 100644
> +index 5861941..474827c 100644
>  --- a/mkspecs/features/qt_common.prf
>  +++ b/mkspecs/features/qt_common.prf
> -@@ -33,7 +33,7 @@ contains(TEMPLATE, .*lib) {
> +@@ -36,7 +36,7 @@ contains(TEMPLATE, .*lib) {
>           lib_replace.replace =3D
>       } else {
>           lib_replace.match =3D $$rplbase/lib
> --        lib_replace.replace =3D $$qt_libdir
> +-        lib_replace.replace =3D $$qqt_libdir
>  +        lib_replace.replace =3D "\$$\\{libdir}"
>       }
>       lib_replace.CONFIG =3D path
>       QMAKE_PRL_INSTALL_REPLACE +=3D lib_replace
>  diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module=
=2Eprf
> -index 2437efe..2e1f014 100644
> +index 5412f37..5ab348a 100644
>  --- a/mkspecs/features/qt_module.prf
>  +++ b/mkspecs/features/qt_module.prf
> -@@ -192,10 +192,25 @@ unix|mingw {
> -         QMAKE_PKGCONFIG_DESCRIPTION =3D $$replace(TARGET, ^Qt, "Qt ") m=
odule
> -     QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D lib_replace
> +@@ -214,6 +214,11 @@ unix|mingw {
> +     pclib_replace.CONFIG =3D path
> +     QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D pclib_replace
>  =20
>  +    pkgconfig_include_replace.match =3D $$rplbase/include
>  +    pkgconfig_include_replace.replace =3D "\$$\\{includedir}"
> @@ -94,13 +94,11 @@ index 2437efe..2e1f014 100644
>  +
>       unix {
>           CONFIG +=3D create_libtool explicitlib
> -         QMAKE_LIBTOOL_LIBDIR =3D $$qt_libdir
> -         QMAKE_LIBTOOL_INSTALL_REPLACE +=3D lib_replace
> -+        # add '=3D' as sysroot in .la files
> -+        lafile_replace.match =3D "-L\$${libdir}"
> -+        lafile_replace.replace =3D "-L=3D\$$\\{libdir}"
> -+        lafile_replace.CONFIG =3D path
> -+        QMAKE_LIBTOOL_INSTALL_REPLACE +=3D lafile_replace
> +         host_build: \
> +@@ -225,6 +230,11 @@ unix|mingw {
> +             ltlib_replace.replace =3D $$QMAKE_LIBTOOL_LIBDIR
> +         ltlib_replace.CONFIG =3D path
> +         QMAKE_LIBTOOL_INSTALL_REPLACE +=3D ltlib_replace
>  +        # drop -L/usr/lib in .prl files
>  +        prl_replace.match =3D "-L\$${libdir}"
>  +        prl_replace.replace =3D ""
> diff --git a/recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-chosen-con=
fig-in-debug-mode.patch b/recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the=
-chosen-config-in-debug-mode.patch
> deleted file mode 100644
> index c373a7f..0000000
> --- a/recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-chosen-config-in-=
debug-mode.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -From 9c07ef1c5a56deda170a3946a7c285d534d59fda Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Mon, 21 Apr 2014 19:22:04 +0200
> -Subject: [PATCH 05/12] Revert "eglfs: Print the chosen config in debug m=
ode"
> -
> -With this change the build is failing with:
> -| In file included from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/=
usr/include/EGL/eglplatform.h:118:0,
> -|                  from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/=
usr/include/EGL/egl.h:36,
> -|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-lin=
ux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsuppo=
rt/eglconvenience/qeglplatformcontext_p.h:51,
> -|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-lin=
ux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsuppo=
rt/eglconvenience/qeglplatformcontext.cpp:34:
> -| ../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:10: =
error: expected identifier before 'int'
> -|      enum Status {
> -|           ^
> -| In file included from ../../include/QtCore/qtextstream.h:1:0,
> -|                  from ../../include/QtCore/../../../git/src/corelib/io=
/qdebug.h:42,
> -|                  from ../../include/QtCore/qdebug.h:1,
> -|                  from ../../include/QtCore/QDebug:1,
> -|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-lin=
ux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsuppo=
rt/eglconvenience/qeglplatformcontext.cpp:40:
> -| ../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:17: =
error: expected unqualified-id before '{' token
> -|      enum Status {
> -|                  ^
> -| Makefile:3896: recipe for target '.obj/qeglplatformcontext.o' failed
> -| make[2]: *** [.obj/qeglplatformcontext.o] Error 1
> -| make[2]: *** Waiting for unfinished jobs....
> -| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-=
alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qegl=
platformintegration.cpp:196:5: error: 'Display' redeclared as different kin=
d of symbol
> -|      Display
> -|      ^
> -| In file included from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/=
usr/include/EGL/eglplatform.h:118:0,
> -|                  from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/=
usr/include/EGL/egl.h:36,
> -|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-lin=
ux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsuppo=
rt/eglconvenience/qeglplatformintegration_p.h:51,
> -|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-lin=
ux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsuppo=
rt/eglconvenience/qeglplatformintegration.cpp:55:
> -| /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/X11/Xlib.h=
:499:26: note: previous declaration 'typedef struct _XDisplay Display'
> -|  typedef struct _XDisplay Display;
> -|                           ^
> -| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-=
alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qegl=
platformintegration.cpp: In member function 'virtual void* QEGLPlatformInte=
gration::nativeResourceForScreen(const QByteArray&, QScreen*)':
> -| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-=
alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qegl=
platformintegration.cpp:239:17: error: expected primary-expression before '=
:' token
> -|      case Display:
> -|                  ^
> -| Makefile:5486: recipe for target '.obj/qeglplatformintegration.o' fail=
ed
> -
> -This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
> -
> -Will be partially resolved in newer revision with:
> -https://codereview.qt-project.org/96220
> -
> -Change-Id: I7a6a926b7525d4f137824c71f2ec8cd089c21f13
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - src/platformsupport/eglconvenience/qeglconvenience.cpp     | 4 +++-
> - src/platformsupport/eglconvenience/qeglplatformcontext.cpp | 7 -------
> - 2 files changed, 3 insertions(+), 8 deletions(-)
> -
> -diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/sr=
c/platformsupport/eglconvenience/qeglconvenience.cpp
> -index c1a491c..7a0fc87 100644
> ---- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
> -+++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
> -@@ -443,9 +443,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig=
 config)
> -     for (index =3D 0; attrs[index].attr !=3D -1; ++index) {
> -         EGLint value;
> -         if (eglGetConfigAttrib(display, config, attrs[index].attr, &val=
ue)) {
> --            qDebug("\t%s: %d", attrs[index].name, (int)value);
> -+            qWarning("\t%s: %d\n", attrs[index].name, (int)value);
> -         }
> -     }
> -+
> -+    qWarning("\n");
> - }
> -=20
> - #ifdef Q_OS_UNIX
> -diff --git a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp =
b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
> -index 7cc3300..ccbd974a 100644
> ---- a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
> -+++ b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
> -@@ -37,7 +37,6 @@
> - #include <qpa/qplatformwindow.h>
> - #include <QOpenGLContext>
> - #include <QtPlatformHeaders/QEGLNativeContext>
> --#include <QDebug>
> -=20
> - QT_BEGIN_NAMESPACE
> -=20
> -@@ -181,12 +180,6 @@ void QEGLPlatformContext::init(const QSurfaceFormat=
 &format, QPlatformOpenGLCont
> -         return;
> -     }
> -=20
> --    static const bool printConfig =3D qgetenv("QT_QPA_EGLFS_DEBUG").toI=
nt();
> --    if (printConfig) {
> --        qDebug() << "Created context for format" << format << "with con=
fig:";
> --        q_printEglConfig(m_eglDisplay, m_eglConfig);
> --    }
> --
> -     updateFormatFromGL();
> - }
> -=20
> ---=20
> -2.4.2
> -
> diff --git a/recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-=
CursorShape-from-X..patch b/recipes-qt/qt5/qtbase/0005-qeglplatformintegrat=
ion-Undefine-CursorShape-from-X..patch
> new file mode 100644
> index 0000000..8d1ed4e
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorS=
hape-from-X..patch
> @@ -0,0 +1,30 @@
> +From 232e2913168fd150bab4071bd57f8fef8d431eb4 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Wed, 19 Mar 2014 18:32:28 +0100
> +Subject: [PATCH 4/7] qeglplatformintegration: Undefine CursorShape from =
X.h
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + src/platformsupport/eglconvenience/qeglplatformintegration_p.h | 6 ++++=
++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration_=
p.h b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
> +index 42fbf8c..8950f2d 100644
> +--- a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
> ++++ b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
> +@@ -50,6 +50,12 @@
> + #include <qpa/qplatformnativeinterface.h>
> + #include <EGL/egl.h>
> +=20
> ++// Undefine CursorShape from X.h, which is causing breakage in Qt::Curs=
orShape in platformsupport/eglconvenience/
> ++// /usr/include/X11/X.h:#define CursorShape           0       /* larges=
t size that can be displayed */
> ++#ifdef CursorShape
> ++#undef CursorShape
> ++#endif
> ++
> + QT_BEGIN_NAMESPACE
> +=20
> + class QEGLPlatformWindow;
> +--=20
> +2.4.2
> +
> diff --git a/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-2=
56-to-512-character.patch b/recipes-qt/qt5/qtbase/0006-configure-bump-path-=
length-from-256-to-512-character.patch
> new file mode 100644
> index 0000000..0a6b92d
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-5=
12-character.patch
> @@ -0,0 +1,29 @@
> +From 7b080f568fac5001f272a11f56968a3c65793077 Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Mon, 11 Nov 2013 20:27:30 -0500
> +Subject: [PATCH 5/7] configure: bump path length from 256 to 512 charact=
ers
> +
> +Increase the path length that gets hardcoded into generated config.cpp f=
ile
> +from 256 to 512 characters, as nativesdk path can be quite long.
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> +---
> + configure | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure b/configure
> +index 8093782..43c4dab 100755
> +--- a/configure
> ++++ b/configure
> +@@ -3834,7 +3834,7 @@ static const char qt_configure_licensed_products_s=
tr [256 + 12] =3D "qt_lcnsprod=3D$
> + static const char qt_configure_installation          [12+11]    =3D "qt=
_instdate=3D2012-12-20";
> +=20
> + /* Installation Info */
> +-static const char qt_configure_prefix_path_str       [256 + 12] =3D "qt=
_prfxpath=3D$QT_INSTALL_PREFIX";
> ++static const char qt_configure_prefix_path_str       [512 + 12] =3D "qt=
_prfxpath=3D$QT_INSTALL_PREFIX";
> + #ifdef QT_BUILD_QMAKE
> + static const char qt_configure_ext_prefix_path_str   [256 + 12] =3D "qt=
_epfxpath=3D$QT_EXT_PREFIX";
> + static const char qt_configure_host_prefix_path_str  [256 + 12] =3D "qt=
_hpfxpath=3D$QT_HOST_PREFIX";
> +--=20
> +2.4.2
> +
> diff --git a/recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Undefine-=
CursorShape-from-X..patch b/recipes-qt/qt5/qtbase/0006-qeglplatformintegrat=
ion-Undefine-CursorShape-from-X..patch
> deleted file mode 100644
> index 6a056df..0000000
> --- a/recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Undefine-CursorS=
hape-from-X..patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 4699b5b9af628e120db9ab26e25bc7069d35562a Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Wed, 19 Mar 2014 18:32:28 +0100
> -Subject: [PATCH 06/12] qeglplatformintegration: Undefine CursorShape fro=
m X.h
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - src/platformsupport/eglconvenience/qeglplatformintegration_p.h | 6 ++++=
++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration_=
p.h b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
> -index 2b5d5f5..a0aab03 100644
> ---- a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
> -+++ b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
> -@@ -50,6 +50,12 @@
> - #include <qpa/qplatformnativeinterface.h>
> - #include <EGL/egl.h>
> -=20
> -+// Undefine CursorShape from X.h, which is causing breakage in Qt::Curs=
orShape in platformsupport/eglconvenience/
> -+// /usr/include/X11/X.h:#define CursorShape           0       /* larges=
t size that can be displayed */
> -+#ifdef CursorShape
> -+#undef CursorShape
> -+#endif
> -+
> - QT_BEGIN_NAMESPACE
> -=20
> - class QEGLPlatformScreen;
> ---=20
> -2.4.2
> -
> diff --git a/recipes-qt/qt5/qtbase/0007-configure-bump-path-length-from-2=
56-to-512-character.patch b/recipes-qt/qt5/qtbase/0007-configure-bump-path-=
length-from-256-to-512-character.patch
> deleted file mode 100644
> index 4cdad00..0000000
> --- a/recipes-qt/qt5/qtbase/0007-configure-bump-path-length-from-256-to-5=
12-character.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 6ddd04ae7fc935b91384d99bf1c16532b91ac76b Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Mon, 11 Nov 2013 20:27:30 -0500
> -Subject: [PATCH 07/12] configure: bump path length from 256 to 512 chara=
cters
> -
> -Increase the path length that gets hardcoded into generated config.cpp f=
ile
> -from 256 to 512 characters, as nativesdk path can be quite long.
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ----
> - configure | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure b/configure
> -index ad5f4cd..c19ff6a 100755
> ---- a/configure
> -+++ b/configure
> -@@ -3627,7 +3627,7 @@ static const char qt_configure_licensed_products_s=
tr [256 + 12] =3D "qt_lcnsprod=3D$
> - static const char qt_configure_installation          [12+11]    =3D "qt=
_instdate=3D`date +%Y-%m-%d`";
> -=20
> - /* Installation Info */
> --static const char qt_configure_prefix_path_strs[][256 + 12] =3D {
> -+static const char qt_configure_prefix_path_strs[][512 + 12] =3D {
> - #ifndef QT_BUILD_QMAKE
> -     "qt_prfxpath=3D$QT_SYSROOT_PREFIX",
> -     "qt_docspath=3D$QT_SYSROOT_DOCS",
> ---=20
> -2.4.2
> -
> diff --git a/recipes-qt/qt5/qtbase/0007-eglfs-fix-egl-error-for-platforms=
-only-supporting-on.patch b/recipes-qt/qt5/qtbase/0007-eglfs-fix-egl-error-=
for-platforms-only-supporting-on.patch
> new file mode 100644
> index 0000000..dabbc1c
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0007-eglfs-fix-egl-error-for-platforms-only-s=
upporting-on.patch
> @@ -0,0 +1,72 @@
> +From 30d26b494bd5b77be6c4e4b41d8df7af5487ee4b Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Wed, 5 Feb 2014 18:35:08 +0100
> +Subject: [PATCH 6/7] eglfs: fix egl error for platforms only supporting =
one
> + window/surface
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +running qmlscene -platform eglfs <filename>.qml
> +
> +caused
> +
> +EGL Error : Could not create the egl surface: error =3D 0x3003
> +
> +Rebased version of [1-2]
> +
> +Upstream-Status: unknown
> +
> +[1] http://repository.timesys.com/buildsources/q/qt-everywhere-opensourc=
e/qt-everywhere-opensource-5.1.1/qt-everywhere-opensource-5.1.1-qeglfswindo=
w.cpp.patch
> +[2] https://github.com/prabindh/qt-configs/blob/master/qt5_1.0_Feb13/qeg=
lfswindow.cpp.patch
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + src/plugins/platforms/eglfs/qeglfswindow.cpp | 16 +++++++++++++++-
> + 1 file changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/=
platforms/eglfs/qeglfswindow.cpp
> +index c0d51c9..bb4dc00 100644
> +--- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
> ++++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
> +@@ -69,6 +69,15 @@ void QEglFSWindow::create()
> +=20
> +     m_flags =3D Created;
> +=20
> ++    static EGLSurface __singleWindowSurface;
> ++    if(QEglFSHooks::hooks() && ! QEglFSHooks::hooks()->hasCapability(QP=
latformIntegration::MultipleWindows) && (__singleWindowSurface)) {
> ++        m_surface =3D __singleWindowSurface;
> ++#ifdef QEGL_EXTRA_DEBUG
> ++        qWarning("Surface recreate request, re-using %x\n", m_surface);
> ++#endif
> ++        return;
> ++    }
> ++
> +     if (window()->type() =3D=3D Qt::Desktop)
> +         return;
> +=20
> +@@ -83,7 +92,7 @@ void QEglFSWindow::create()
> +             return;
> +         }
> +=20
> +-#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK)
> ++#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK) || defined(E=
GL_API_FB)
> +         // We can have either a single OpenGL window or multiple raster=
 windows.
> +         // Other combinations cannot work.
> +         qFatal("EGLFS: OpenGL windows cannot be mixed with others.");
> +@@ -103,6 +112,11 @@ void QEglFSWindow::create()
> +=20
> +     resetSurface();
> +=20
> ++    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPl=
atformIntegration::MultipleWindows))
> ++    {
> ++        __singleWindowSurface =3D m_surface;
> ++    }
> ++
> +     screen->setPrimarySurface(m_surface);
> +=20
> +     if (isRaster()) {
> +--=20
> +2.4.2
> +
> diff --git a/recipes-qt/qt5/qtbase/0008-QOpenGLPaintDevice-sub-area-suppo=
rt.patch b/recipes-qt/qt5/qtbase/0008-QOpenGLPaintDevice-sub-area-support.p=
atch
> new file mode 100644
> index 0000000..c6cbaf6
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0008-QOpenGLPaintDevice-sub-area-support.patch
> @@ -0,0 +1,157 @@
> +From fbcda470b5b64ab49a7a4c647e19bda623ce95b7 Mon Sep 17 00:00:00 2001
> +From: Jani Hautakangas <jani.hautakangas@ixonos.com>
> +Date: Thu, 16 May 2013 09:52:07 +0300
> +Subject: [PATCH 7/7] QOpenGLPaintDevice sub-area support
> +
> +Allows creating QOpenGLPaintDevice targetting sub-area
> +of binded framebuffer.
> +
> +Upstream-Status: Pending
> +
> +Change-Id: Ida2f079aa1ac0b87d36b54129e226399dbcdda80
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + src/gui/opengl/qopenglpaintdevice.cpp       | 11 +++++++++++
> + src/gui/opengl/qopenglpaintdevice.h         |  2 ++
> + src/gui/opengl/qopenglpaintdevice_p.h       |  1 +
> + src/gui/opengl/qopenglpaintengine.cpp       |  9 +++++++--
> + src/gui/opengl/qopenglpaintengine_p.h       |  1 +
> + src/gui/opengl/qopengltextureglyphcache.cpp |  2 +-
> + 6 files changed, 23 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qope=
nglpaintdevice.cpp
> +index c0657fe..395ec14 100644
> +--- a/src/gui/opengl/qopenglpaintdevice.cpp
> ++++ b/src/gui/opengl/qopenglpaintdevice.cpp
> +@@ -135,6 +135,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, i=
nt height)
> + {
> + }
> +=20
> ++QOpenGLPaintDevice::QOpenGLPaintDevice(int x, int y, int width, int hei=
ght)
> ++    : d_ptr(new QOpenGLPaintDevicePrivate(QSize(width, height)))
> ++{
> ++    d_ptr->offset =3D QPoint(x,y);
> ++}
> ++
> + /*!
> +     \internal
> +  */
> +@@ -212,6 +218,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
> +     return d_ptr->ctx;
> + }
> +=20
> ++QPoint QOpenGLPaintDevice::offset() const
> ++{
> ++    return d_ptr->offset;
> ++}
> ++
> + /*!
> +     Returns the pixel size of the paint device.
> +=20
> +diff --git a/src/gui/opengl/qopenglpaintdevice.h b/src/gui/opengl/qopeng=
lpaintdevice.h
> +index 804e485..88b481a 100644
> +--- a/src/gui/opengl/qopenglpaintdevice.h
> ++++ b/src/gui/opengl/qopenglpaintdevice.h
> +@@ -53,12 +53,14 @@ public:
> +     QOpenGLPaintDevice();
> +     explicit QOpenGLPaintDevice(const QSize &size);
> +     QOpenGLPaintDevice(int width, int height);
> ++    QOpenGLPaintDevice(int x, int y, int width, int height);
> +     virtual ~QOpenGLPaintDevice();
> +=20
> +     int devType() const { return QInternal::OpenGL; }
> +     QPaintEngine *paintEngine() const;
> +=20
> +     QOpenGLContext *context() const;
> ++    QPoint offset() const;
> +     QSize size() const;
> +     void setSize(const QSize &size);
> +     void setDevicePixelRatio(qreal devicePixelRatio);
> +diff --git a/src/gui/opengl/qopenglpaintdevice_p.h b/src/gui/opengl/qope=
nglpaintdevice_p.h
> +index 57d93ee..5b5c0d9 100644
> +--- a/src/gui/opengl/qopenglpaintdevice_p.h
> ++++ b/src/gui/opengl/qopenglpaintdevice_p.h
> +@@ -65,6 +65,7 @@ public:
> +=20
> + public:
> +     QSize size;
> ++    QPoint offset;
> +     QOpenGLContext *ctx;
> +=20
> +     qreal dpmx;
> +diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qope=
nglpaintengine.cpp
> +index a9a4ada..de3c518 100644
> +--- a/src/gui/opengl/qopenglpaintengine.cpp
> ++++ b/src/gui/opengl/qopenglpaintengine.cpp
> +@@ -2091,7 +2091,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *p=
dev)
> +     for (int i =3D 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
> +         d->vertexAttributeArraysEnabledState[i] =3D false;
> +=20
> ++    const QPoint offset =3D d->device->offset();
> +     const QSize sz =3D d->device->size();
> ++    d->x =3D offset.x();
> ++    d->y =3D offset.y();
> +     d->width =3D sz.width();
> +     d->height =3D sz.height();
> +     d->mode =3D BrushDrawingMode;
> +@@ -2178,7 +2181,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
> +         d->device->ensureActiveTarget();
> +=20
> +         d->transferMode(BrushDrawingMode);
> +-        d->funcs.glViewport(0, 0, d->width, d->height);
> ++        d->funcs.glViewport(d->x, d->y, d->width, d->height);
> +         d->needsSync =3D false;
> +         d->shaderManager->setDirty();
> +         d->syncGlState();
> +@@ -2220,6 +2223,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipSciss=
orTest()
> +     if (bounds =3D=3D QRect(0, 0, width, height)) {
> +         funcs.glDisable(GL_SCISSOR_TEST);
> +     } else {
> ++        bounds =3D QRect(bounds.x(), bounds.y(), bounds.width(), bounds=
=2Eheight());
> +         funcs.glEnable(GL_SCISSOR_TEST);
> +         setScissor(bounds);
> +     }
> +@@ -2228,12 +2232,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipSci=
ssorTest()
> +=20
> + void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
> + {
> +-    const int left =3D rect.left();
> ++    const int left =3D rect.left() + x;
> +     const int width =3D rect.width();
> +     int bottom =3D height - (rect.top() + rect.height());
> +     if (device->paintFlipped()) {
> +         bottom =3D rect.top();
> +     }
> ++    bottom +=3D y;
> +     const int height =3D rect.height();
> +=20
> +     funcs.glScissor(left, bottom, width, height);
> +diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qope=
nglpaintengine_p.h
> +index 17be72b..43e88f6 100644
> +--- a/src/gui/opengl/qopenglpaintengine_p.h
> ++++ b/src/gui/opengl/qopenglpaintengine_p.h
> +@@ -264,6 +264,7 @@ public:
> +     QOpenGL2PaintEngineEx* q;
> +     QOpenGLEngineShaderManager* shaderManager;
> +     QOpenGLPaintDevice* device;
> ++    int x, y;
> +     int width, height;
> +     QOpenGLContext *ctx;
> +     EngineMode mode;
> +diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/openg=
l/qopengltextureglyphcache.cpp
> +index c179143..fad68d5 100644
> +--- a/src/gui/opengl/qopengltextureglyphcache.cpp
> ++++ b/src/gui/opengl/qopengltextureglyphcache.cpp
> +@@ -310,7 +310,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int=
 width, int height)
> +     funcs->glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
> +=20
> +     if (pex !=3D 0) {
> +-        funcs->glViewport(0, 0, pex->width, pex->height);
> ++        funcs->glViewport(pex->x, pex->y, pex->width, pex->height);
> +         pex->updateClipScissorTest();
> +     } else {
> +         if (m_vao.isCreated()) {
> +--=20
> +2.4.2
> +
> diff --git a/recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-platforms=
-only-supporting-on.patch b/recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-=
for-platforms-only-supporting-on.patch
> deleted file mode 100644
> index 7f4171d..0000000
> --- a/recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-platforms-only-s=
upporting-on.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -From 5c0a8f073e7412d01e7f2ef05bbe06954fd39eaa Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Wed, 5 Feb 2014 18:35:08 +0100
> -Subject: [PATCH 08/12] eglfs: fix egl error for platforms only supportin=
g one
> - window/surface
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -running qmlscene -platform eglfs <filename>.qml
> -
> -caused
> -
> -EGL Error : Could not create the egl surface: error =3D 0x3003
> -
> -Rebased version of [1-2]
> -
> -Upstream-Status: unknown
> -
> -[1] http://repository.timesys.com/buildsources/q/qt-everywhere-opensourc=
e/qt-everywhere-opensource-5.1.1/qt-everywhere-opensource-5.1.1-qeglfswindo=
w.cpp.patch
> -[2] https://github.com/prabindh/qt-configs/blob/master/qt5_1.0_Feb13/qeg=
lfswindow.cpp.patch
> -
> -Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - src/plugins/platforms/eglfs/qeglfswindow.cpp | 16 +++++++++++++++-
> - 1 file changed, 15 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/=
platforms/eglfs/qeglfswindow.cpp
> -index 39a3ef9..2c05979 100644
> ---- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
> -+++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
> -@@ -68,6 +68,15 @@ void QEglFSWindow::create()
> -=20
> -     m_flags =3D Created;
> -=20
> -+    static EGLSurface __singleWindowSurface;
> -+    if(QEglFSHooks::hooks() && ! QEglFSHooks::hooks()->hasCapability(QP=
latformIntegration::MultipleWindows) && (__singleWindowSurface)) {
> -+        m_surface =3D __singleWindowSurface;
> -+#ifdef QEGL_EXTRA_DEBUG
> -+        qWarning("Surface recreate request, re-using %x\n", m_surface);
> -+#endif
> -+        return;
> -+    }
> -+
> -     if (window()->type() =3D=3D Qt::Desktop)
> -         return;
> -=20
> -@@ -81,7 +90,7 @@ void QEglFSWindow::create()
> -             return;
> -         }
> -=20
> --#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK)
> -+#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK) || defined(E=
GL_API_FB)
> -         // We can have either a single OpenGL window or multiple raster=
 windows.
> -         // Other combinations cannot work.
> -         qFatal("EGLFS: OpenGL windows cannot be mixed with others.");
> -@@ -101,6 +110,11 @@ void QEglFSWindow::create()
> -=20
> -     resetSurface();
> -=20
> -+    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPl=
atformIntegration::MultipleWindows))
> -+    {
> -+        __singleWindowSurface =3D m_surface;
> -+    }
> -+
> -     screen->setPrimarySurface(m_surface);
> -=20
> -     if (isRaster()) {
> ---=20
> -2.4.2
> -
> diff --git a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch b/recipes-=
qt/qt5/qtbase/0009-Always-build-uic.patch
> new file mode 100644
> index 0000000..dc802a7
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
> @@ -0,0 +1,31 @@
> +From 8fb793a4a8e715f0c418df9ab17e39d103d59d3d Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sat, 16 Nov 2013 00:32:30 +0100
> +Subject: [PATCH 8/9] Always build uic
> +
> +Even if we are not building gui or widgets. This tool is needed later
> +as a native tool when compiling the target.
> +
> +Change-Id: I257668ac28c22b192e7ec7736e6c23fa3be6bab6
> +Signed-off-by: Mikko Levonmaa <mikko.levonmaa@palm.com>
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + src/src.pro | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/src.pro b/src/src.pro
> +index b4d62aa..5e19215 100644
> +--- a/src/src.pro
> ++++ b/src/src.pro
> +@@ -182,7 +182,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS +=3D src_con=
current
> +         }
> +     }
> + }
> +-SUBDIRS +=3D src_plugins src_tools_qdoc
> ++SUBDIRS +=3D src_plugins src_tools_qdoc src_tools_uic
> +=20
> + nacl: SUBDIRS -=3D src_network src_testlib
> +=20
> +--=20
> +2.4.2
> +
> diff --git a/recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-suppo=
rt.patch b/recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.p=
atch
> deleted file mode 100644
> index 05110ea..0000000
> --- a/recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.patch
> +++ /dev/null
> @@ -1,157 +0,0 @@
> -From 3483a580cb9e5509cb59cd18b13a24c1a47a9224 Mon Sep 17 00:00:00 2001
> -From: Jani Hautakangas <jani.hautakangas@ixonos.com>
> -Date: Thu, 16 May 2013 09:52:07 +0300
> -Subject: [PATCH 09/12] QOpenGLPaintDevice sub-area support
> -
> -Allows creating QOpenGLPaintDevice targetting sub-area
> -of binded framebuffer.
> -
> -Upstream-Status: Pending
> -
> -Change-Id: Ida2f079aa1ac0b87d36b54129e226399dbcdda80
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - src/gui/opengl/qopenglpaintdevice.cpp       | 11 +++++++++++
> - src/gui/opengl/qopenglpaintdevice.h         |  2 ++
> - src/gui/opengl/qopenglpaintdevice_p.h       |  1 +
> - src/gui/opengl/qopenglpaintengine.cpp       |  9 +++++++--
> - src/gui/opengl/qopenglpaintengine_p.h       |  1 +
> - src/gui/opengl/qopengltextureglyphcache.cpp |  2 +-
> - 6 files changed, 23 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qope=
nglpaintdevice.cpp
> -index a08d26f..cff3155 100644
> ---- a/src/gui/opengl/qopenglpaintdevice.cpp
> -+++ b/src/gui/opengl/qopenglpaintdevice.cpp
> -@@ -135,6 +135,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, i=
nt height)
> - {
> - }
> -=20
> -+QOpenGLPaintDevice::QOpenGLPaintDevice(int x, int y, int width, int hei=
ght)
> -+    : d_ptr(new QOpenGLPaintDevicePrivate(QSize(width, height)))
> -+{
> -+    d_ptr->offset =3D QPoint(x,y);
> -+}
> -+
> - /*!
> -     \internal
> -  */
> -@@ -212,6 +218,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
> -     return d_ptr->ctx;
> - }
> -=20
> -+QPoint QOpenGLPaintDevice::offset() const
> -+{
> -+    return d_ptr->offset;
> -+}
> -+
> - /*!
> -     Returns the pixel size of the paint device.
> -=20
> -diff --git a/src/gui/opengl/qopenglpaintdevice.h b/src/gui/opengl/qopeng=
lpaintdevice.h
> -index 10cee84..a6683c5 100644
> ---- a/src/gui/opengl/qopenglpaintdevice.h
> -+++ b/src/gui/opengl/qopenglpaintdevice.h
> -@@ -53,12 +53,14 @@ public:
> -     QOpenGLPaintDevice();
> -     explicit QOpenGLPaintDevice(const QSize &size);
> -     QOpenGLPaintDevice(int width, int height);
> -+    QOpenGLPaintDevice(int x, int y, int width, int height);
> -     virtual ~QOpenGLPaintDevice();
> -=20
> -     int devType() const { return QInternal::OpenGL; }
> -     QPaintEngine *paintEngine() const;
> -=20
> -     QOpenGLContext *context() const;
> -+    QPoint offset() const;
> -     QSize size() const;
> -     void setSize(const QSize &size);
> -     void setDevicePixelRatio(qreal devicePixelRatio);
> -diff --git a/src/gui/opengl/qopenglpaintdevice_p.h b/src/gui/opengl/qope=
nglpaintdevice_p.h
> -index 0b01129..211f2f3 100644
> ---- a/src/gui/opengl/qopenglpaintdevice_p.h
> -+++ b/src/gui/opengl/qopenglpaintdevice_p.h
> -@@ -65,6 +65,7 @@ public:
> -=20
> - public:
> -     QSize size;
> -+    QPoint offset;
> -     QOpenGLContext *ctx;
> -=20
> -     qreal dpmx;
> -diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qope=
nglpaintengine.cpp
> -index 8eeaa31..e17520e 100644
> ---- a/src/gui/opengl/qopenglpaintengine.cpp
> -+++ b/src/gui/opengl/qopenglpaintengine.cpp
> -@@ -2080,7 +2080,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *p=
dev)
> -     for (int i =3D 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
> -         d->vertexAttributeArraysEnabledState[i] =3D false;
> -=20
> -+    const QPoint offset =3D d->device->offset();
> -     const QSize sz =3D d->device->size();
> -+    d->x =3D offset.x();
> -+    d->y =3D offset.y();
> -     d->width =3D sz.width();
> -     d->height =3D sz.height();
> -     d->mode =3D BrushDrawingMode;
> -@@ -2167,7 +2170,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
> -         d->device->ensureActiveTarget();
> -=20
> -         d->transferMode(BrushDrawingMode);
> --        d->funcs.glViewport(0, 0, d->width, d->height);
> -+        d->funcs.glViewport(d->x, d->y, d->width, d->height);
> -         d->needsSync =3D false;
> -         d->shaderManager->setDirty();
> -         d->syncGlState();
> -@@ -2209,6 +2212,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipSciss=
orTest()
> -     if (bounds =3D=3D QRect(0, 0, width, height)) {
> -         funcs.glDisable(GL_SCISSOR_TEST);
> -     } else {
> -+        bounds =3D QRect(bounds.x(), bounds.y(), bounds.width(), bounds=
=2Eheight());
> -         funcs.glEnable(GL_SCISSOR_TEST);
> -         setScissor(bounds);
> -     }
> -@@ -2217,12 +2221,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipSci=
ssorTest()
> -=20
> - void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
> - {
> --    const int left =3D rect.left();
> -+    const int left =3D rect.left() + x;
> -     const int width =3D rect.width();
> -     int bottom =3D height - (rect.top() + rect.height());
> -     if (device->paintFlipped()) {
> -         bottom =3D rect.top();
> -     }
> -+    bottom +=3D y;
> -     const int height =3D rect.height();
> -=20
> -     funcs.glScissor(left, bottom, width, height);
> -diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qope=
nglpaintengine_p.h
> -index 9722ea3..07e3163 100644
> ---- a/src/gui/opengl/qopenglpaintengine_p.h
> -+++ b/src/gui/opengl/qopenglpaintengine_p.h
> -@@ -264,6 +264,7 @@ public:
> -     QOpenGL2PaintEngineEx* q;
> -     QOpenGLEngineShaderManager* shaderManager;
> -     QOpenGLPaintDevice* device;
> -+    int x, y;
> -     int width, height;
> -     QOpenGLContext *ctx;
> -     EngineMode mode;
> -diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/openg=
l/qopengltextureglyphcache.cpp
> -index cd268cd..997bc35 100644
> ---- a/src/gui/opengl/qopengltextureglyphcache.cpp
> -+++ b/src/gui/opengl/qopengltextureglyphcache.cpp
> -@@ -310,7 +310,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int=
 width, int height)
> -     funcs->glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
> -=20
> -     if (pex !=3D 0) {
> --        funcs->glViewport(0, 0, pex->width, pex->height);
> -+        funcs->glViewport(pex->x, pex->y, pex->width, pex->height);
> -         pex->updateClipScissorTest();
> -     } else {
> -         if (m_vao.isCreated()) {
> ---=20
> -2.4.2
> -
> diff --git a/recipes-qt/qt5/qtbase/0009-configure-preserve-built-qmake-an=
d-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0009-configure-preserve-b=
uilt-qmake-and-swap-with-native-.patch
> new file mode 100644
> index 0000000..4cc9bf0
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0009-configure-preserve-built-qmake-and-swap-=
with-native-.patch
> @@ -0,0 +1,29 @@
> +From abbd6ce89977ff1854c7eb6a5864568ee81a6ccd Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Mon, 11 Nov 2013 20:22:34 -0500
> +Subject: [PATCH 9/9] configure: preserve built qmake and swap with nativ=
e one
> +
> +Let configure script build the real qmake, but right after it's built, s=
wap
> +it with a native qmake for further internal use, preserving the real one.
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> +---
> + configure | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/configure b/configure
> +index 43c4dab..69e6f46 100755
> +--- a/configure
> ++++ b/configure
> +@@ -4082,6 +4082,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
> +         echo "Done."
> +     fi
> + fi # Build qmake
> ++mv "$outpath/bin/qmake" "$outpath/bin/qmake-real"
> ++mv "$outpath/bin/qmake-native" "$outpath/bin/qmake"
> +=20
> + echo "Running configuration tests..."
> +=20
> +--=20
> +2.4.2
> +
> diff --git a/recipes-qt/qt5/qtbase/0009-qmake-don-t-build-it-in-configure=
-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0009-qmake-don-t-build-it=
-in-configure-but-allow-to-build.patch
> new file mode 100644
> index 0000000..f5f2a23
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0009-qmake-don-t-build-it-in-configure-but-al=
low-to-build.patch
> @@ -0,0 +1,68 @@
> +From 51e7ea78d15a590f42154f19486f10d2019401e3 Mon Sep 17 00:00:00 2001
> +From: Michael Krelin <hacker@klever.net>
> +Date: Mon, 29 Oct 2012 20:07:49 -0700
> +Subject: [PATCH 11/12] qmake: don't build it in configure, but allow to =
build
> + it separately
> +
> +* it is already built in qtbase-native, so we don't need it in configure
> +* allow building a separate qmake for the target
> +
> +Upstream-Status: Inappropriate [configuration]
> +  OE specific for native/target builds
> +
> +Signed-off-by: Yu Ke <ke.yu@intel.com>
> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> +Signed-off-by: Mikko Levonmaa <mikko.levonmaa@gmail.com>
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> + configure       | 2 +-
> + qmake/qmake.pri | 3 ++-
> + qmake/qmake.pro | 2 ++
> + 3 files changed, 5 insertions(+), 2 deletions(-)
> +---
> + configure       | 2 +-
> + qmake/qmake.pri | 3 ++-
> + qmake/qmake.pro | 1 +
> + 3 files changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure b/configure
> +index c19ff6a..7a34b11 100755
> +--- a/configure
> ++++ b/configure
> +@@ -3729,7 +3729,7 @@ setBootstrapEvalVariable()
> +=20
> +=20
> + # build qmake
> +-if true; then ###[ '!' -f "$outpath/bin/qmake" ];
> ++if false; then ###[ '!' -f "$outpath/bin/qmake" ];
> +     echo "Creating qmake..."
> +=20
> +     mkdir -p "$outpath/qmake" || exit
> +diff --git a/qmake/qmake.pri b/qmake/qmake.pri
> +index 4de41d6..69982b7 100644
> +--- a/qmake/qmake.pri
> ++++ b/qmake/qmake.pri
> +@@ -82,7 +82,8 @@ bootstrap { #Qt code
> +         qjsonparser.cpp \
> +         qjsonarray.cpp \
> +         qjsonobject.cpp \
> +-        qjsonvalue.cpp
> ++        qjsonvalue.cpp \
> ++        qdebug.cpp
> +=20
> +    HEADERS+=3D \
> +         qbitarray.h \
> +diff --git a/qmake/qmake.pro b/qmake/qmake.pro
> +index 89d6ea5..0ff4a96 100644
> +--- a/qmake/qmake.pro
> ++++ b/qmake/qmake.pro
> +@@ -8,6 +8,7 @@ CONFIG -=3D qt
> + DEFINES +=3D \
> +     QT_BUILD_QMAKE \
> +     PROEVALUATOR_FULL
> ++TARGET =3D qmake
> +=20
> + VPATH +=3D \
> +     ../src/corelib/global \
> +--=20
> +2.4.2
> +
> diff --git a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-fo=
r-native-sdk.patch b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-opt=
ion-for-native-sdk.patch
> new file mode 100644
> index 0000000..546e954
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-nativ=
e-sdk.patch
> @@ -0,0 +1,130 @@
> +From 45bdf5ff770fe17634f216c3f533645bfd450f04 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sat, 6 Apr 2013 13:15:07 +0200
> +Subject: [PATCH 9/9] Add -external-hostbindir option for native(sdk)
> +
> +* when cross-compiling it's sometimes useful to use existing tools from =
machine
> +  (or in OpenEmbedded built with separate native recipe) when building f=
or target
> +
> +* this way we can skip bootstraping tools we already have
> +
> +* qt_functions: temporary remove isEmpty check
> +* now we assume that every build will provide QT_EXTERNAL_HOST_BINS value
> +* isEmpty works correctly only with qmake variables (e.g. $$FOO -
> +  isEmpty(FOO)), but doesn't work with system properties like $$[FOO].
> +
> +* cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host =
binaries
> +
> +Upstream-Status: Pending
> +  is a lot better for upstreaming (and it was already sort of approved by
> +  Oswald) but in 5.2.0 I've noticed that he added something similar for
> +  android builds
> +
> +Change-Id: I4f6e634bf0b2cb96065ee5c38b9cd8a224c3bd37
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Signed-off-by: Simon Busch <morphis@gravedo.de>
> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +Conflicts:
> +        tools/configure/configureapp.cpp
> +---
> + qmake/property.cpp                  |  1 +
> + src/corelib/global/qlibraryinfo.cpp |  3 ++-
> + src/corelib/global/qlibraryinfo.h   |  1 +
> + tools/configure/configureapp.cpp    | 11 +++++++++++
> + 4 files changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure b/configure
> +index ffb69df..aa46774 100755
> +--- a/configure
> ++++ b/configure
> +@@ -3831,6 +3831,7 @@ addConfStr "$CFG_SYSROOT"
> + addConfStr "$QT_REL_HOST_BINS"
> + addConfStr "$QT_REL_HOST_LIBS"
> + addConfStr "$QT_REL_HOST_DATA"
> ++addConfStr "$QT_EXTERNAL_HOST_BINS"
> + addConfStr "$shortxspec"
> + addConfStr "$shortspec"
> +=20
> +diff --git a/qmake/property.cpp b/qmake/property.cpp
> +index 817ae95..c69539f 100644
> +--- a/qmake/property.cpp
> ++++ b/qmake/property.cpp
> +@@ -68,6 +68,7 @@ static const struct {
> +     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
> +     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
> +     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
> ++    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, =
true },
> +     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
> +     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
> + };
> +diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/ql=
ibraryinfo.cpp
> +index f663c88..675bd4c 100644
> +--- a/src/corelib/global/qlibraryinfo.cpp
> ++++ b/src/corelib/global/qlibraryinfo.cpp
> +@@ -373,7 +373,7 @@ QLibraryInfo::isDebugBuild()
> +  */
> +=20
> + static const struct {
> +-    char key[19], value[13];
> ++    char key[21], value[13];
> + } qtConfEntries[] =3D {
> +     { "Prefix", "." },
> +     { "Documentation", "doc" }, // should be ${Data}/doc
> +@@ -398,6 +398,7 @@ static const struct {
> +     { "HostBinaries", "bin" },
> +     { "HostLibraries", "lib" },
> +     { "HostData", "." },
> ++    { "ExternalHostBinaries", "" },
> +     { "TargetSpec", "" },
> +     { "HostSpec", "" },
> +     { "HostPrefix", "" },
> +diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlib=
raryinfo.h
> +index 1ad7637..5a8b127 100644
> +--- a/src/corelib/global/qlibraryinfo.h
> ++++ b/src/corelib/global/qlibraryinfo.h
> +@@ -81,6 +81,7 @@ public:
> +         HostBinariesPath,
> +         HostLibrariesPath,
> +         HostDataPath,
> ++        ExternalHostBinariesPath,
> +         TargetSpecPath,
> +         HostSpecPath,
> +         HostPrefixPath,
> +diff --git a/tools/configure/configureapp.cpp b/tools/configure/configur=
eapp.cpp
> +index 3bf0546..53bf146 100644
> +--- a/tools/configure/configureapp.cpp
> ++++ b/tools/configure/configureapp.cpp
> +@@ -1217,6 +1217,13 @@ void Configure::parseCmdLine()
> +             dictionary[ "QT_EXT_PREFIX" ] =3D configCmdLine.at(i);
> +         }
> +=20
> ++        else if (configCmdLine.at(i) =3D=3D "-external-hostbindir") {
> ++            ++i;
> ++            if (i =3D=3D argCount)
> ++                break;
> ++            dictionary[ "QT_EXTERNAL_HOST_BINS" ] =3D configCmdLine.at(=
i);
> ++        }
> ++
> +         else if (configCmdLine.at(i) =3D=3D "-make-tool") {
> +             ++i;
> +             if (i =3D=3D argCount)
> +@@ -4101,6 +4108,9 @@ void Configure::generateQConfigCpp()
> +=20
> +     if (dictionary["QT_REL_HOST_DATA"].isEmpty())
> +         dictionary["QT_REL_HOST_DATA"] =3D haveHpx ? "." : dictionary["=
QT_REL_INSTALL_ARCHDATA"];
> ++   =20
> ++    if (dictionary["QT_EXTERNAL_HOST_BINS"].isEmpty())
> ++        dictionary["QT_EXTERNAL_HOST_BINS"] =3D haveHpx ? "bin" : dicti=
onary["QT_REL_INSTALL_BINS"];
> +=20
> +     confStringOff =3D 0;
> +     addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
> +@@ -4120,6 +4130,7 @@ void Configure::generateQConfigCpp()
> +     addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
> +     addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
> +     addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
> ++    addConfStr(1, dictionary["QT_EXTERNAL_HOST_BINS"]);
> +     addConfStr(1, targSpec);
> +     addConfStr(1, hostSpec);
> +=20
> diff --git a/recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cmake-fin=
d-gl-es-include-dir.patch b/recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExt=
ras.cmake-find-gl-es-include-dir.patch
> deleted file mode 100644
> index 184b2d8..0000000
> --- a/recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es=
-include-dir.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From d5308f1a78e24402b16201846378917473d02873 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Thu, 18 Dec 2014 13:41:09 +0100
> -Subject: [PATCH 10/12] Make Qt5GuiConfigExtras.cmake find gl(es) include=
 dir
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -In configure QMAKE_INCDIR_OPENGL is set with pkg-config. Without
> -PKG_CONFIG_ALLOW_SYSTEM_CFLAGS set, pkg-config returns paths outside
> -/usr/include only (in my case /usr/include/libdrm). With NO_DEFAULT_PATH=
 set
> -gl(es) include directories cannot be found. Cmake builds depending on
> -Qt5Gui error out with
> -
> -| Failed to find "GLES2/gl2.h" in "/usr/include/libdrm"
> -
> -Upstream-Status: submitted [1]
> -
> -[1] https://bugreports.qt-project.org/browse/QTBUG-43445
> -
> -Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ----
> - src/gui/Qt5GuiConfigExtras.cmake.in | 3 ---
> - 1 file changed, 3 deletions(-)
> -
> -diff --git a/src/gui/Qt5GuiConfigExtras.cmake.in b/src/gui/Qt5GuiConfigE=
xtras.cmake.in
> -index 9a846d4..07869ef 100644
> ---- a/src/gui/Qt5GuiConfigExtras.cmake.in
> -+++ b/src/gui/Qt5GuiConfigExtras.cmake.in
> -@@ -57,9 +57,6 @@ set(Qt5Gui_OPENGL_LIBRARIES Qt5::Gui_GLESv2)
> - set(_GL_INCDIRS $$CMAKE_GL_INCDIRS)
> - find_path(_qt5gui_OPENGL_INCLUDE_DIR $$CMAKE_GL_HEADER_NAME
> -     PATHS ${_GL_INCDIRS}
> --!!IF !mac
> --    NO_DEFAULT_PATH
> --!!ENDIF
> - )
> - if (NOT _qt5gui_OPENGL_INCLUDE_DIR)
> -     message(FATAL_ERROR \"Failed to find \\\"$$CMAKE_GL_HEADER_NAME\\\"=
 in \\\"${_GL_INCDIRS}\\\".\")
> ---=20
> -2.4.2
> -
> diff --git a/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch b/recipes-=
qt/qt5/qtbase/0011-Always-build-uic.patch
> deleted file mode 100644
> index b9d4517..0000000
> --- a/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 14c4785ac0f01fa1d89d63601b9132add4ab1c2f Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sat, 16 Nov 2013 00:32:30 +0100
> -Subject: [PATCH 11/13] Always build uic
> -
> -Even if we are not building gui or widgets. This tool is needed later
> -as a native tool when compiling the target.
> -
> -Change-Id: I257668ac28c22b192e7ec7736e6c23fa3be6bab6
> -Signed-off-by: Mikko Levonmaa <mikko.levonmaa@palm.com>
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - src/src.pro | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/src.pro b/src/src.pro
> -index 83f7587..9dbcf70 100644
> ---- a/src/src.pro
> -+++ b/src/src.pro
> -@@ -163,7 +163,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS +=3D src_con=
current
> -         }
> -     }
> - }
> --SUBDIRS +=3D src_plugins src_tools_qdoc
> -+SUBDIRS +=3D src_plugins src_tools_qdoc src_tools_uic
> -=20
> - nacl: SUBDIRS -=3D src_network src_testlib
> -=20
> ---=20
> -2.4.2
> -
> diff --git a/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure=
-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it=
-in-configure-but-allow-to-build.patch
> deleted file mode 100644
> index f5f2a23..0000000
> --- a/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-al=
low-to-build.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From 51e7ea78d15a590f42154f19486f10d2019401e3 Mon Sep 17 00:00:00 2001
> -From: Michael Krelin <hacker@klever.net>
> -Date: Mon, 29 Oct 2012 20:07:49 -0700
> -Subject: [PATCH 11/12] qmake: don't build it in configure, but allow to =
build
> - it separately
> -
> -* it is already built in qtbase-native, so we don't need it in configure
> -* allow building a separate qmake for the target
> -
> -Upstream-Status: Inappropriate [configuration]
> -  OE specific for native/target builds
> -
> -Signed-off-by: Yu Ke <ke.yu@intel.com>
> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> -Signed-off-by: Mikko Levonmaa <mikko.levonmaa@gmail.com>
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> - configure       | 2 +-
> - qmake/qmake.pri | 3 ++-
> - qmake/qmake.pro | 2 ++
> - 3 files changed, 5 insertions(+), 2 deletions(-)
> ----
> - configure       | 2 +-
> - qmake/qmake.pri | 3 ++-
> - qmake/qmake.pro | 1 +
> - 3 files changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure b/configure
> -index c19ff6a..7a34b11 100755
> ---- a/configure
> -+++ b/configure
> -@@ -3729,7 +3729,7 @@ setBootstrapEvalVariable()
> -=20
> -=20
> - # build qmake
> --if true; then ###[ '!' -f "$outpath/bin/qmake" ];
> -+if false; then ###[ '!' -f "$outpath/bin/qmake" ];
> -     echo "Creating qmake..."
> -=20
> -     mkdir -p "$outpath/qmake" || exit
> -diff --git a/qmake/qmake.pri b/qmake/qmake.pri
> -index 4de41d6..69982b7 100644
> ---- a/qmake/qmake.pri
> -+++ b/qmake/qmake.pri
> -@@ -82,7 +82,8 @@ bootstrap { #Qt code
> -         qjsonparser.cpp \
> -         qjsonarray.cpp \
> -         qjsonobject.cpp \
> --        qjsonvalue.cpp
> -+        qjsonvalue.cpp \
> -+        qdebug.cpp
> -=20
> -    HEADERS+=3D \
> -         qbitarray.h \
> -diff --git a/qmake/qmake.pro b/qmake/qmake.pro
> -index 89d6ea5..0ff4a96 100644
> ---- a/qmake/qmake.pro
> -+++ b/qmake/qmake.pro
> -@@ -8,6 +8,7 @@ CONFIG -=3D qt
> - DEFINES +=3D \
> -     QT_BUILD_QMAKE \
> -     PROEVALUATOR_FULL
> -+TARGET =3D qmake
> -=20
> - VPATH +=3D \
> -     ../src/corelib/global \
> ---=20
> -2.4.2
> -
> diff --git a/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-fo=
r-native-sdk.patch b/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-opt=
ion-for-native-sdk.patch
> deleted file mode 100644
> index 383b788..0000000
> --- a/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-nativ=
e-sdk.patch
> +++ /dev/null
> @@ -1,108 +0,0 @@
> -From d56aef32b8c9d1be04c047a16a55e84af71e25dd Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sat, 6 Apr 2013 13:15:07 +0200
> -Subject: [PATCH 12/13] Add -external-hostbindir option for native(sdk)
> -
> -* when cross-compiling it's sometimes useful to use existing tools from =
machine
> -  (or in OpenEmbedded built with separate native recipe) when building f=
or target
> -
> -* this way we can skip bootstraping tools we already have
> -
> -* qt_functions: temporary remove isEmpty check
> -* now we assume that every build will provide QT_EXTERNAL_HOST_BINS value
> -* isEmpty works correctly only with qmake variables (e.g. $$FOO -
> -  isEmpty(FOO)), but doesn't work with system properties like $$[FOO].
> -
> -* cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host =
binaries
> -
> -Upstream-Status: Pending
> -  is a lot better for upstreaming (and it was already sort of approved by
> -  Oswald) but in 5.2.0 I've noticed that he added something similar for
> -  android builds
> -
> -Change-Id: I4f6e634bf0b2cb96065ee5c38b9cd8a224c3bd37
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -Signed-off-by: Simon Busch <morphis@gravedo.de>
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - qmake/property.cpp                  | 1 +
> - src/corelib/global/qlibraryinfo.cpp | 3 ++-
> - src/corelib/global/qlibraryinfo.h   | 1 +
> - tools/configure/configureapp.cpp    | 8 ++++++++
> - 4 files changed, 12 insertions(+), 1 deletion(-)
> -
> -diff --git a/qmake/property.cpp b/qmake/property.cpp
> -index 051e056..50da6ed 100644
> ---- a/qmake/property.cpp
> -+++ b/qmake/property.cpp
> -@@ -67,6 +67,7 @@ static const struct {
> -     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
> -     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
> -     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
> -+    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, =
true },
> -     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
> -     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
> - };
> -diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/ql=
ibraryinfo.cpp
> -index 91ca643..7a567fa 100644
> ---- a/src/corelib/global/qlibraryinfo.cpp
> -+++ b/src/corelib/global/qlibraryinfo.cpp
> -@@ -348,7 +348,7 @@ QLibraryInfo::isDebugBuild()
> -  */
> -=20
> - static const struct {
> --    char key[19], value[13];
> -+    char key[21], value[13];
> - } qtConfEntries[] =3D {
> -     { "Prefix", "." },
> -     { "Documentation", "doc" }, // should be ${Data}/doc
> -@@ -374,6 +374,7 @@ static const struct {
> -     { "HostBinaries", "bin" },
> -     { "HostLibraries", "lib" },
> -     { "HostData", "." },
> -+    { "ExternalHostBinaries", "" },
> -     { "TargetSpec", "" },
> -     { "HostSpec", "" },
> - #endif
> -diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlib=
raryinfo.h
> -index 543c4b3..a02e03a 100644
> ---- a/src/corelib/global/qlibraryinfo.h
> -+++ b/src/corelib/global/qlibraryinfo.h
> -@@ -80,6 +80,7 @@ public:
> -         HostBinariesPath,
> -         HostLibrariesPath,
> -         HostDataPath,
> -+        ExternalHostBinariesPath,
> -         TargetSpecPath,
> -         HostSpecPath,
> -         LastHostPath =3D HostSpecPath,
> -diff --git a/tools/configure/configureapp.cpp b/tools/configure/configur=
eapp.cpp
> -index 6e9d4aa..0ca4daf 100644
> ---- a/tools/configure/configureapp.cpp
> -+++ b/tools/configure/configureapp.cpp
> -@@ -1191,6 +1191,13 @@ void Configure::parseCmdLine()
> -             dictionary[ "QT_EXT_PREFIX" ] =3D configCmdLine.at(i);
> -         }
> -=20
> -+        else if (configCmdLine.at(i) =3D=3D "-external-hostbindir") {
> -+            ++i;
> -+            if (i =3D=3D argCount)
> -+                break;
> -+            dictionary[ "QT_EXTERNAL_HOST_BINS" ] =3D configCmdLine.at(=
i);
> -+        }
> -+
> -         else if (configCmdLine.at(i) =3D=3D "-make-tool") {
> -             ++i;
> -             if (i =3D=3D argCount)
> -@@ -4004,6 +4011,7 @@ void Configure::generateQConfigCpp()
> -                   << "    \"qt_hbinpath=3D" << formatPath(dictionary["Q=
T_HOST_BINS"]) << "\"," << endl
> -                   << "    \"qt_hlibpath=3D" << formatPath(dictionary["Q=
T_HOST_LIBS"]) << "\"," << endl
> -                   << "    \"qt_hdatpath=3D" << formatPath(dictionary["Q=
T_HOST_DATA"]) << "\"," << endl
> -+                  << "    \"qt_ebinpath=3D" << formatPath(dictionary["Q=
T_EXTERNAL_HOST_BINS"]) << "\"," << endl
> -                   << "    \"qt_targspec=3D" << targSpec << "\"," << endl
> -                   << "    \"qt_hostspec=3D" << hostSpec << "\"," << endl
> -                   << "#endif" << endl
> ---=20
> -2.4.2
> -
> diff --git a/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-an=
d-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0013-configure-preserve-b=
uilt-qmake-and-swap-with-native-.patch
> deleted file mode 100644
> index ea90305..0000000
> --- a/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-=
with-native-.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From d34774dc7447ff0d566b3281407c0998173a85e0 Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Mon, 11 Nov 2013 20:22:34 -0500
> -Subject: [PATCH 13/13] configure: preserve built qmake and swap with nat=
ive
> - one
> -
> -Let configure script build the real qmake, but right after it's built, s=
wap
> -it with a native qmake for further internal use, preserving the real one.
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ----
> - configure | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/configure b/configure
> -index c19ff6a..2d920e3 100755
> ---- a/configure
> -+++ b/configure
> -@@ -3879,6 +3879,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
> -=20
> -     (cd "$outpath/qmake"; "$MAKE") || exit 2
> - fi # Build qmake
> -+mv "$outpath/bin/qmake" "$outpath/bin/qmake-real"
> -+mv "$outpath/bin/qmake-native" "$outpath/bin/qmake"
> -=20
> - echo "Running configuration tests..."
> -=20
> ---=20
> -2.4.2
> -
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 33620cb..d3dd695 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -3,9 +3,9 @@ require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dd87ae0d200af76dca730d911474cbe5b \
> -    file://LICENSE.LGPLv3;md5=3Dffcfac38a32c9ebdb8ff768fa1702478 \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> @@ -15,19 +15,16 @@ SRC_URI +=3D "\
>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.pat=
ch \
>      file://0003-Add-external-hostbindir-option.patch \
>      file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
> -    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch=
 \
> -    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..pat=
ch \
> -    file://0007-configure-bump-path-length-from-256-to-512-character.pat=
ch \
> -    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.pat=
ch \
> -    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
> -    file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.pat=
ch \
> -    file://0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.pat=
ch \
> +    file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..pat=
ch \
> +    file://0006-configure-bump-path-length-from-256-to-512-character.pat=
ch \
> +    file://0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.pat=
ch \
> +    file://0008-QOpenGLPaintDevice-sub-area-support.patch \
>  "
> -=20
> -# specific for qtbase
> +
> +# specific for target qtbase
>  SRC_URI +=3D "\
> -    file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.pat=
ch \
> -    file://0012-Set-paths-for-target-properly.patch \
> +    file://0009-qmake-don-t-build-it-in-configure-but-allow-to-build.pat=
ch \
> +    file://0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.pat=
ch \
>  "
> =20
>  DEPENDS +=3D "qtbase-native"
> @@ -197,8 +194,8 @@ do_configure() {
>          -testsdir ${OE_QMAKE_PATH_TESTS} \
>          -examplesdir ${OE_QMAKE_PATH_EXAMPLES} \
>          -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
> -        -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
>          -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
> +        -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
>          -platform ${OE_QMAKESPEC} \
>          -xplatform linux-oe-g++ \
>          ${QT_CONFIG_FLAGS}
> @@ -270,4 +267,4 @@ sysroot_stage_dirs_append() {
>      rm -rf $to${OE_QMAKE_PATH_LIBS}/fonts
>  }
> =20
> -SRCREV =3D "2cb17c1fb903434274e58692c9f0df619affdab0"
> +SRCREV =3D "2fde9f59eeab68ede92324e7613daf8be3eaf498"
> diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconn=
ectivity_git.bb
> index c758d04..0cb724e 100644
> --- a/recipes-qt/qt5/qtconnectivity_git.bb
> +++ b/recipes-qt/qt5/qtconnectivity_git.bb
> @@ -3,11 +3,11 @@ require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0) | GPL-2.0"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c330f12cc8ed \
> +    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
>  "
> =20
>  DEPENDS +=3D "qtbase qtdeclarative"
> @@ -21,4 +21,4 @@ do_configure_prepend() {
>      sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez=
)/g' ${S}/qtconnectivity.pro
>  }
> =20
> -SRCREV =3D "aa00047183008edd739df472cf0490e9fffbe655"
> +SRCREV =3D "e4a5dc7dbe62c32032e5e683ac1fdb57663a14b3"
> diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.pa=
tch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
> index 793aa84..3c34977 100644
> --- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
> +++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
> @@ -1,7 +1,7 @@
> -From 0aa4fc1dd4369c50c310e20bbe86cef5a1efb21f Mon Sep 17 00:00:00 2001
> +From 47b3408b8aeed4795dcfebcd81b6b7b4185712de Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Eric=3D20B=3DC3=3DA9nard?=3D <eric@eukrea.com>
>  Date: Sun, 26 May 2013 14:26:19 +0200
> -Subject: [PATCH 1/2] qmltestexample: fix link
> +Subject: [PATCH] qmltestexample: fix link
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdecla=
rative_git.bb
> index 9333016..421c482 100644
> --- a/recipes-qt/qt5/qtdeclarative_git.bb
> +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> @@ -4,9 +4,9 @@ require qt5-git.inc
>  # There are no LGPLv3-only licensed files in this component.
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> @@ -16,6 +16,8 @@ SRC_URI +=3D " \
>      file://0001-qmltestexample-fix-link.patch \
>  "
> =20
> +EXTRA_OEMAKE +=3D "QMAKE_SYNCQT=3D${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME=
}/syncqt"
> +
>  PACKAGECONFIG ??=3D "qtxmlpatterns"
>  PACKAGECONFIG[qtxmlpatterns] =3D ",,qtxmlpatterns"
> =20
> @@ -23,8 +25,11 @@ do_configure_prepend() {
>      # disable qtxmlpatterns test if it isn't enabled by PACKAGECONFIG
>      sed -e 's/^\(qtHaveModule(xmlpatterns)\)/OE_QTXMLPATTERNS_ENABLED:\1=
/' -i ${S}/src/imports/imports.pro
>      sed -e 's/^\(!qtHaveModule(xmlpatterns)\)/!OE_QTXMLPATTERNS_ENABLED|=
\1/' -i ${S}/tests/auto/quick/quick.pro
> +
> +    #set the path for syncqt properly
> +    echo "QT_TOOL.syncqt.binary =3D \"${STAGING_BINDIR_NATIVE}/${QT_DIR_=
NAME}/syncqt\"" > ${B}/.qmake.cache
>  }
> =20
>  EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'qtxmlpatter=
ns', 'CONFIG+=3DOE_QTXMLPATTERNS_ENABLED', '', d)}"
> =20
> -SRCREV =3D "2fdb6eba0a58b629db32f9eefec2f26df08d3d2e"
> +SRCREV =3D "cc0df64bb0e1dea2fe37950816095802f527a241"
> diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_g=
it.bb
> index a0aff8f..f80e42e 100644
> --- a/recipes-qt/qt5/qtenginio_git.bb
> +++ b/recipes-qt/qt5/qtenginio_git.bb
> @@ -3,12 +3,12 @@ require qt5-git.inc
> =20
>  LICENSE =3D "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>  "
> =20
>  DEPENDS +=3D "qtbase qtdeclarative qtxmlpatterns"
> =20
> -QT_MODULE_BRANCH =3D "1.1"
> -SRCREV =3D "134dc76b7ff5152364f830b577e223b350560839"
> +QT_MODULE_BRANCH =3D "1.2"
> +SRCREV =3D "749bcec16b89269026a2048c7394df74f08935c4"
> diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qt=
graphicaleffects_git.bb
> index 9da5c94..64c9a10 100644
> --- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
> +++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
> @@ -5,15 +5,15 @@ require qt5-git.inc
>  # There are no GPLv2 licensed files in this component.
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c330f12cc8ed \
> +    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
>  "
> =20
>  DEPENDS +=3D "qtdeclarative"
> =20
>  RDEPENDS_${PN}-dev =3D ""
> =20
> -SRCREV =3D "c7ed28bece292e2745e02663ef519c76d16ec762"
> +SRCREV =3D "73357afbbe46e660b3497f621505f351b43c5efa"
> diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-t=
he-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtim=
ageformats.pro-Make-the-dependencies-determinist.patch
> index 6085f01..66b24e5 100644
> --- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-depe=
ndencies-determinist.patch
> +++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-depe=
ndencies-determinist.patch
> @@ -1,4 +1,4 @@
> -From 85f45e1d9fc833c914cebb102840337193590356 Mon Sep 17 00:00:00 2001
> +From f2e3dfd496a79a993ae4a03c2239b757131a9a68 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Mon, 4 Aug 2014 19:19:05 +0200
>  Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
> diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimag=
eformats_git.bb
> index 31d4fb0..f3726da 100644
> --- a/recipes-qt/qt5/qtimageformats_git.bb
> +++ b/recipes-qt/qt5/qtimageformats_git.bb
> @@ -3,11 +3,11 @@ require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0) | GPL-2.0"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
>      file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c330f12cc8ed \
> +    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
>  "
> =20
>  DEPENDS +=3D "qtbase"
> @@ -27,4 +27,4 @@ EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONF=
IG', 'jasper', 'CONFIG+=3DOE_
>  EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'libtiff', '=
CONFIG+=3DOE_LIBTIFF_ENABLED', '', d)}"
>  EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'libwebp', '=
CONFIG+=3DOE_LIBWEBP_ENABLED', '', d)}"
> =20
> -SRCREV =3D "ec301681e4e2f5b293435ec7cf295350ee5acb18"
> +SRCREV =3D "e76fd83774f2e2ba552700e02e974fd4608bb001"
> diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation=
_git.bb
> index 12416bb..963c576 100644
> --- a/recipes-qt/qt5/qtlocation_git.bb
> +++ b/recipes-qt/qt5/qtlocation_git.bb
> @@ -3,11 +3,11 @@ require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0) | GPL-2.0"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c330f12cc8ed \
> +    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
>  "
> =20
>  DEPENDS +=3D "qtbase qt3d"
> @@ -29,4 +29,4 @@ do_configure_prepend() {
>  EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'geoclue', '=
CONFIG+=3DOE_GEOCLUE_ENABLED', '', d)}"
>  EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'gypsy', 'CO=
NFIG+=3DOE_GYPSY_ENABLED', '', d)}"
> =20
> -SRCREV =3D "3678bc8b3e128bf244ae263a44576a40b72e5876"
> +SRCREV =3D "d2d08b4f04a40c9760d73da36ed7c61881d99326"
> diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-G=
Streamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effor=
t-to-GStreamer-1.0.patch
> index e2a46df..59a5282 100644
> --- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreame=
r-1.0.patch
> +++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreame=
r-1.0.patch
> @@ -1,2369 +1,58 @@
> -From 8b306a5a70d431b8e142b3a7efb32d897cb79ab5 Mon Sep 17 00:00:00 2001
> +From fe90d2bb5dcfd1cb75ed5414a4acdb9dfc9d4367 Mon Sep 17 00:00:00 2001
>  From: Yoann Lopes <yoann.lopes@digia.com>
>  Date: Thu, 31 Oct 2013 15:06:30 +0100
>  Subject: [PATCH] Initial porting effort to GStreamer 1.0.
> =20
> -Imported from git@github.com:jhodapp/qtmultimedia.git
> +* It's already included in 5.5 with this commit:
> +  commit 108dda7a90bd0f0337358b0db47ae55acd16dea6
> +  Author: Yoann Lopes <yoann.lopes@theqtcompany.com>
> +  Date:   Thu Nov 20 17:54:18 2014 +0100
> +  GStreamer: port to 1.0.
> +* here we restore only the done_config_gstreamer variable
> +  to explicitly disable it from OE build
> =20
> -Contributions from:
> -Ilya Smelykh <ilya@videoexpertsgroup.com>
> -Jim Hodapp <jim.hodapp@canonical.com>
> -Sergio Schvezov <sergio.schvezov@canonical.com>
> -
> -Change-Id: I10fa5e5078efa4564ce833befd417008e26a90a9
> -Reviewed-by: Yoann Lopes <yoann.lopes@digia.com>
> -(cherry picked from commit d91dac090d92fdbc3a3425e8d969c62e5c79eff9)
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> -Conflicts:
> -	src/gsttools/qgstreamervideorenderer.cpp
> -	src/gsttools/qgstreamervideowidget.cpp
> -	src/gsttools/qgstreamervideowindow.cpp
> -	src/plugins/gstreamer/camerabin/camerabinsession.cpp
> -	src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
> -	src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
>  ---
> - config.tests/gstreamer/gstreamer.pro               |  11 +-
> - config.tests/gstreamer_appsrc/gstreamer_appsrc.pro |  13 +-
> - .../gstreamer_encodingprofiles.pro                 |  13 +-
> - .../gstreamer_photography.pro                      |  15 +-
> - qtmultimedia.pro                                   |  25 ++-
> - src/gsttools/gsttools.pro                          |  22 +--
> - src/gsttools/gstvideoconnector.c                   | 199 ++++++++++++++=
+++++--
> - src/gsttools/qgstappsrc.cpp                        |  29 ++-
> - src/gsttools/qgstreameraudioprobecontrol.cpp       |  19 +-
> - src/gsttools/qgstreamerbushelper.cpp               |   8 +
> - src/gsttools/qgstreamervideoprobecontrol.cpp       |   9 +
> - src/gsttools/qgstreamervideorenderer.cpp           |   3 +-
> - src/gsttools/qgstreamervideowidget.cpp             |  29 ++-
> - src/gsttools/qgstreamervideowindow.cpp             |  79 +++++++-
> - src/gsttools/qgstutils.cpp                         |  27 ++-
> - src/gsttools/qgstvideobuffer.cpp                   |  18 +-
> - src/gsttools/qvideosurfacegstsink.cpp              | 136 +++++++++++++-
> - src/multimedia/gsttools_headers/qgstappsrc_p.h     |   3 +
> - .../qgstreameraudioprobecontrol_p.h                |   5 +-
> - .../qgstreamervideoprobecontrol_p.h                |   4 +
> - .../gsttools_headers/qgstreamervideowindow_p.h     |   4 +
> - src/multimedia/gsttools_headers/qgstutils_p.h      |   4 +
> - .../gsttools_headers/qgstvideobuffer_p.h           |   3 +
> - .../gsttools_headers/qvideosurfacegstsink_p.h      |   6 +-
> - .../qgstreameraudiodecoderserviceplugin.cpp        |  27 ++-
> - .../audiodecoder/qgstreameraudiodecodersession.cpp |  33 +++-
> - .../gstreamer/camerabin/camerabinsession.cpp       |  25 +++
> - src/plugins/gstreamer/common.pri                   |  21 ++-
> - src/plugins/gstreamer/gstreamer.pro                |   3 +-
> - .../mediacapture/qgstreamercapturesession.cpp      |   5 +
> - src/plugins/gstreamer/mediaplayer/mediaplayer.pro  |   1 -
> - .../mediaplayer/qgstreamerplayercontrol.cpp        |   2 +
> - .../mediaplayer/qgstreamerplayerservice.cpp        |   9 +-
> - .../mediaplayer/qgstreamerplayerserviceplugin.cpp  |  27 ++-
> - .../mediaplayer/qgstreamerplayersession.cpp        | 154 ++++++++++++++=
--
> - .../mediaplayer/qgstreamerplayersession.h          |   9 +
> - 36 files changed, 871 insertions(+), 129 deletions(-)
> + qtmultimedia.pro | 25 +++++++++++++------------
> + 1 file changed, 13 insertions(+), 12 deletions(-)
> =20
> -diff --git a/config.tests/gstreamer/gstreamer.pro b/config.tests/gstream=
er/gstreamer.pro
> -index 02a7e34..6b9843a 100644
> ---- a/config.tests/gstreamer/gstreamer.pro
> -+++ b/config.tests/gstreamer/gstreamer.pro
> -@@ -3,11 +3,10 @@ SOURCES +=3D main.cpp
> - CONFIG +=3D link_pkgconfig
> -=20
> - PKGCONFIG +=3D \
> --    gstreamer-0.10 \
> --    gstreamer-base-0.10 \
> --    gstreamer-interfaces-0.10 \
> --    gstreamer-audio-0.10 \
> --    gstreamer-video-0.10 \
> --    gstreamer-pbutils-0.10
> -+    gstreamer-$$GST_VERSION \
> -+    gstreamer-base-$$GST_VERSION \
> -+    gstreamer-audio-$$GST_VERSION \
> -+    gstreamer-video-$$GST_VERSION \
> -+    gstreamer-pbutils-$$GST_VERSION
> -=20
> -=20
> -diff --git a/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro b/config=
=2Etests/gstreamer_appsrc/gstreamer_appsrc.pro
> -index 9f61703..0f3ca2b 100644
> ---- a/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro
> -+++ b/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro
> -@@ -3,11 +3,8 @@ SOURCES +=3D main.cpp
> - CONFIG +=3D link_pkgconfig
> -=20
> - PKGCONFIG +=3D \
> --    gstreamer-0.10 \
> --    gstreamer-base-0.10 \
> --    gstreamer-interfaces-0.10 \
> --    gstreamer-audio-0.10 \
> --    gstreamer-video-0.10 \
> --    gstreamer-app-0.10
> --
> --
> -+    gstreamer-$$GST_VERSION \
> -+    gstreamer-base-$$GST_VERSION \
> -+    gstreamer-audio-$$GST_VERSION \
> -+    gstreamer-video-$$GST_VERSION \
> -+    gstreamer-pbutils-$$GST_VERSION
> -diff --git a/config.tests/gstreamer_encodingprofiles/gstreamer_encodingp=
rofiles.pro b/config.tests/gstreamer_encodingprofiles/gstreamer_encodingpro=
files.pro
> -index 7e8a9e7..fad40b0 100644
> ---- a/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles=
=2Epro
> -+++ b/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles=
=2Epro
> -@@ -2,11 +2,10 @@ SOURCES +=3D main.cpp
> -=20
> - CONFIG +=3D link_pkgconfig
> -=20
> --PKGCONFIG +=3D \
> --    gstreamer-0.10 \
> --    gstreamer-base-0.10 \
> --    gstreamer-interfaces-0.10 \
> --    gstreamer-audio-0.10 \
> --    gstreamer-video-0.10 \
> --    gstreamer-pbutils-0.10
> -=20
> -+PKGCONFIG +=3D \
> -+    gstreamer-$$GST_VERSION \
> -+    gstreamer-base-$$GST_VERSION \
> -+    gstreamer-audio-$$GST_VERSION \
> -+    gstreamer-video-$$GST_VERSION \
> -+    gstreamer-pbutils-$$GST_VERSION
> -diff --git a/config.tests/gstreamer_photography/gstreamer_photography.pr=
o b/config.tests/gstreamer_photography/gstreamer_photography.pro
> -index 6b530cb..975991f 100644
> ---- a/config.tests/gstreamer_photography/gstreamer_photography.pro
> -+++ b/config.tests/gstreamer_photography/gstreamer_photography.pro
> -@@ -3,12 +3,11 @@ SOURCES +=3D main.cpp
> - CONFIG +=3D link_pkgconfig
> -=20
> - PKGCONFIG +=3D \
> --    gstreamer-0.10 \
> --    gstreamer-base-0.10 \
> --    gstreamer-interfaces-0.10 \
> --    gstreamer-audio-0.10 \
> --    gstreamer-video-0.10 \
> --    gstreamer-pbutils-0.10
> --
> --LIBS +=3D -lgstphotography-0.10
> -+    gstreamer-$$GST_VERSION \
> -+    gstreamer-base-$$GST_VERSION \
> -+    gstreamer-audio-$$GST_VERSION \
> -+    gstreamer-video-$$GST_VERSION \
> -+    gstreamer-pbutils-$$GST_VERSION
> -+
> -+LIBS +=3D -lgstphotography-$$GST_VERSION
> -=20
>  diff --git a/qtmultimedia.pro b/qtmultimedia.pro
> -index cf97e64..d94d6a2 100644
> +index 1225ffb..a60b1fc 100644
>  --- a/qtmultimedia.pro
>  +++ b/qtmultimedia.pro
> -@@ -17,11 +17,26 @@ win32 {
> - } else {
> +@@ -18,19 +18,20 @@ win32 {
>       contains(QT_CONFIG, alsa):qtCompileTest(alsa)
>       contains(QT_CONFIG, pulseaudio):qtCompileTest(pulseaudio)
> --    qtCompileTest(gstreamer) {
> +=20
> +-    isEmpty(GST_VERSION) {
> +-        contains(QT_CONFIG, gstreamer-0.10) {
> +-            GST_VERSION =3D 0.10
> +-        } else: contains(QT_CONFIG, gstreamer-1.0) {
> +-            GST_VERSION =3D 1.0
> ++    !done_config_gstreamer {
> ++        isEmpty(GST_VERSION) {
> ++            contains(QT_CONFIG, gstreamer-0.10) {
> ++                GST_VERSION =3D 0.10
> ++            } else: contains(QT_CONFIG, gstreamer-1.0) {
> ++                GST_VERSION =3D 1.0
> ++            }
> +         }
> +-    }
> +-    cache(GST_VERSION, set)
> +-    !isEmpty(GST_VERSION):qtCompileTest(gstreamer) {
>  -        qtCompileTest(gstreamer_photography)
>  -        qtCompileTest(gstreamer_encodingprofiles)
>  -        qtCompileTest(gstreamer_appsrc)
>  -        qtCompileTest(linux_v4l)
> -+    !done_config_gstreamer {
> -+        gstver=3D1.0
> -+        cache(GST_VERSION, set, gstver);
> -+        qtCompileTest(gstreamer) {
> ++        cache(GST_VERSION, set)
> ++        !isEmpty(GST_VERSION):qtCompileTest(gstreamer) {
>  +            qtCompileTest(gstreamer_photography)
>  +            qtCompileTest(gstreamer_encodingprofiles)
>  +            qtCompileTest(gstreamer_appsrc)
>  +            qtCompileTest(linux_v4l)
> -+        } else {
> -+            gstver=3D0.10
> -+            cache(GST_VERSION, set, gstver);
> -+            # Force a re-run of the test
> -+            CONFIG -=3D done_config_gstreamer
> -+            qtCompileTest(gstreamer) {
> -+                qtCompileTest(gstreamer_photography)
> -+                qtCompileTest(gstreamer_encodingprofiles)
> -+                qtCompileTest(gstreamer_appsrc)
> -+                qtCompileTest(linux_v4l)
> -+            }
> -+        }
> -     }
> -     qtCompileTest(resourcepolicy)
> -     qtCompileTest(gpu_vivante)
> -diff --git a/src/gsttools/gsttools.pro b/src/gsttools/gsttools.pro
> -index 7c809a7..6b9bf5d 100644
> ---- a/src/gsttools/gsttools.pro
> -+++ b/src/gsttools/gsttools.pro
> -@@ -2,7 +2,7 @@ TEMPLATE =3D lib
> -=20
> - TARGET =3D qgsttools_p
> - QPRO_PWD =3D $$PWD
> --QT =3D core-private multimedia-private gui-private
> -+QT =3D core-private multimedia-private gui-private opengl
> -=20
> - !static:DEFINES +=3D QT_MAKEDLL
> - DEFINES +=3D GLIB_VERSION_MIN_REQUIRED=3DGLIB_VERSION_2_26
> -@@ -15,13 +15,14 @@ LIBS_PRIVATE +=3D \
> -=20
> - CONFIG +=3D link_pkgconfig
> -=20
> --PKGCONFIG_PRIVATE +=3D \
> --    gstreamer-0.10 \
> --    gstreamer-base-0.10 \
> --    gstreamer-interfaces-0.10 \
> --    gstreamer-audio-0.10 \
> --    gstreamer-video-0.10 \
> --    gstreamer-pbutils-0.10
> -+PKGCONFIG +=3D \
> -+    gstreamer-$$GST_VERSION \
> -+    gstreamer-base-$$GST_VERSION \
> -+    gstreamer-audio-$$GST_VERSION \
> -+    gstreamer-video-$$GST_VERSION \
> -+    gstreamer-pbutils-$$GST_VERSION
> -+
> -+equals(GST_VERSION,"0.10"): PKGCONFIG_PRIVATE +=3D gstreamer-interfaces=
-$$GST_VERSION
> -=20
> - maemo*: PKGCONFIG_PRIVATE +=3Dgstreamer-plugins-bad-0.10
> -=20
> -@@ -33,6 +34,7 @@ config_resourcepolicy {
> - # Header files must go inside source directory of a module
> - # to be installed by syncqt.
> - INCLUDEPATH +=3D ../multimedia/gsttools_headers/
> -+INCLUDEPATH +=3D ../plugins/gstreamer/mediaplayer/
> - VPATH +=3D ../multimedia/gsttools_headers/
> -=20
> - PRIVATE_HEADERS +=3D \
> -@@ -91,13 +93,13 @@ maemo6 {
> - }
> -=20
> - config_gstreamer_appsrc {
> --    PKGCONFIG_PRIVATE +=3D gstreamer-app-0.10
> -+    PKGCONFIG_PRIVATE +=3D gstreamer-app-$$GST_VERSION
> -     PRIVATE_HEADERS +=3D qgstappsrc_p.h
> -     SOURCES +=3D qgstappsrc.cpp
> -=20
> -     DEFINES +=3D HAVE_GST_APPSRC
> -=20
> --    LIBS_PRIVATE +=3D -lgstapp-0.10
> -+    LIBS_PRIVATE +=3D -lgstapp-$$GST_VERSION
> - }
> -=20
> - config_linux_v4l: DEFINES +=3D USE_V4L
> -diff --git a/src/gsttools/gstvideoconnector.c b/src/gsttools/gstvideocon=
nector.c
> -index 3ed539e..ed0ed3c 100644
> ---- a/src/gsttools/gstvideoconnector.c
> -+++ b/src/gsttools/gstvideoconnector.c
> -@@ -59,26 +59,93 @@ GST_STATIC_PAD_TEMPLATE ("src",
> -                          GST_PAD_ALWAYS,
> -                          GST_STATIC_CAPS_ANY);
> -=20
> -+
> -+#if GST_CHECK_VERSION(1,0,0)
> -+
> -+G_DEFINE_TYPE(GstVideoConnector, gst_video_connector, GST_TYPE_ELEMENT);
> -+#else
> - #define _do_init(bla) \
> -     GST_DEBUG_CATEGORY_INIT (video_connector_debug, \
> -     "video-connector", 0, "An identity like element for reconnecting vi=
deo stream");
> -=20
> - GST_BOILERPLATE_FULL (GstVideoConnector, gst_video_connector, GstElemen=
t,
> -                       GST_TYPE_ELEMENT, _do_init);
> -+#endif
> -=20
> - static void gst_video_connector_dispose (GObject * object);
> -+
> -+#if GST_CHECK_VERSION(1,0,0)
> -+static GstFlowReturn gst_video_connector_chain (GstPad * pad, GstObject=
* parent, GstBuffer * buf);
> -+#else
> - static GstFlowReturn gst_video_connector_chain (GstPad * pad, GstBuffer=
 * buf);
> - static GstFlowReturn gst_video_connector_buffer_alloc (GstPad * pad,
> -                                                        guint64 offset, =
guint size, GstCaps * caps, GstBuffer ** buf);
> -+#endif
> -+
> - static GstStateChangeReturn gst_video_connector_change_state (GstElemen=
t *
> -                                                               element, =
GstStateChange transition);
> -+
> -+#if GST_CHECK_VERSION(1,0,0)
> -+static gboolean gst_video_connector_handle_sink_event (GstPad * pad, Gs=
tObject* parent,
> -+                                                       GstEvent * event=
);
> -+#else
> - static gboolean gst_video_connector_handle_sink_event (GstPad * pad,
> -                                                        GstEvent * event=
);
> -+#endif
> -+
> -+#if GST_CHECK_VERSION(1,0,0)
> -+static GstPadProbeReturn gst_video_connector_new_buffer_probe(GstPad *p=
ad, GstPadProbeInfo *info, gpointer object);
> -+static GstPadProbeReturn gst_video_connector_new_event_probe(GstPad *pa=
d, GstPadProbeInfo *info, gpointer object);
> -+static GstPadProbeReturn gst_video_connector_new_query_probe(GstPad *pa=
d, GstPadProbeInfo *info, gpointer object);
> -+#else
> - static gboolean gst_video_connector_new_buffer_probe(GstObject *pad, Gs=
tBuffer *buffer, guint * object);
> --static void gst_video_connector_resend_new_segment(GstElement * element=
, gboolean emitFailedSignal);
> - static gboolean gst_video_connector_setcaps (GstPad  *pad, GstCaps *cap=
s);
> - static GstCaps *gst_video_connector_getcaps (GstPad * pad);
> - static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps *=
 caps);
> -+#endif
> -+
> -+static void gst_video_connector_resend_new_segment(GstElement * element=
, gboolean emitFailedSignal);
> -+
> -+#if GST_CHECK_VERSION(1,0,0)
> -+static void
> -+gst_video_connector_class_init (GstVideoConnectorClass * klass)
> -+{
> -+    GObjectClass *gobject_class =3D G_OBJECT_CLASS (klass);
> -+    GstElementClass *gstelement_class =3D GST_ELEMENT_CLASS (klass);
> -+
> -+    gst_element_class_set_details_simple (gstelement_class, "Video Conn=
ector",
> -+                                          "Generic",
> -+                                          "An identity like element use=
d for reconnecting video stream",
> -+                                          "Dmytro Poplavskiy <dmytro.po=
plavskiy@nokia.com>");
> -+    gst_element_class_add_pad_template (gstelement_class,
> -+                                        gst_static_pad_template_get (&g=
st_video_connector_sink_factory));
> -+    gst_element_class_add_pad_template (gstelement_class,
> -+                                        gst_static_pad_template_get (&g=
st_video_connector_src_factory));
> -+
> -+    gst_video_connector_parent_class =3D g_type_class_peek_parent (klas=
s);
> -+
> -+    gobject_class->dispose =3D gst_video_connector_dispose;
> -+    gstelement_class->change_state =3D gst_video_connector_change_state;
> -+    klass->resend_new_segment =3D gst_video_connector_resend_new_segmen=
t;
> -+
> -+    gst_video_connector_signals[SIGNAL_RESEND_NEW_SEGMENT] =3D
> -+            g_signal_new ("resend-new-segment", G_TYPE_FROM_CLASS (klas=
s),
> -+                          G_SIGNAL_RUN_LAST | G_SIGNAL_ACTION,
> -+                          G_STRUCT_OFFSET (GstVideoConnectorClass, rese=
nd_new_segment), NULL, NULL,
> -+                          g_cclosure_marshal_VOID__BOOLEAN, G_TYPE_NONE=
, 1, G_TYPE_BOOLEAN);
> -+
> -+    gst_video_connector_signals[SIGNAL_CONNECTION_FAILED] =3D
> -+            g_signal_new ("connection-failed", G_TYPE_FROM_CLASS (klass=
),
> -+                          G_SIGNAL_RUN_LAST,
> -+                          0, NULL, NULL,
> -+                          g_cclosure_marshal_VOID__VOID, G_TYPE_NONE, 0=
);
> -+
> -+    GST_DEBUG_CATEGORY_INIT(video_connector_debug, "video-connector", 0,
> -+                            "An identity like element for reconnecting =
video stream");
> -+
> -+}
> -+
> -+#else
> -=20
> - static void
> - gst_video_connector_base_init (gpointer g_class)
> -@@ -120,18 +187,33 @@ gst_video_connector_class_init (GstVideoConnectorC=
lass * klass)
> -                           g_cclosure_marshal_VOID__VOID, G_TYPE_NONE, 0=
);
> - }
> -=20
> -+#endif
> -+
> - static void
> --gst_video_connector_init (GstVideoConnector *element,
> --                          GstVideoConnectorClass *g_class)
> -+gst_video_connector_init (GstVideoConnector *element
> -+#if GST_CHECK_VERSION(1,0,0)
> -+#else
> -+                          ,GstVideoConnectorClass *g_class
> -+#endif
> -+                          )
> - {
> -+#if GST_CHECK_VERSION(1,0,0)
> -+#else
> -     (void) g_class;
> -+#endif
> -     element->sinkpad =3D
> -             gst_pad_new_from_static_template (&gst_video_connector_sink=
_factory,
> -                                               "sink");
> -     gst_pad_set_chain_function(element->sinkpad,
> -                                GST_DEBUG_FUNCPTR (gst_video_connector_c=
hain));
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    /* gstreamer 1.x uses QUERIES and EVENTS for allocation and caps ha=
ndiling purposes */
> -+    GST_OBJECT_FLAG_SET (element->sinkpad, GST_PAD_FLAG_PROXY_CAPS);
> -+    GST_OBJECT_FLAG_SET (element->sinkpad, GST_PAD_FLAG_PROXY_ALLOCATIO=
N);
> -+#else
> -     gst_pad_set_event_function(element->sinkpad,
> -                                GST_DEBUG_FUNCPTR (gst_video_connector_h=
andle_sink_event));
> -+
> -     gst_pad_set_bufferalloc_function(element->sinkpad,
> -                                      GST_DEBUG_FUNCPTR (gst_video_conne=
ctor_buffer_alloc));
> -     gst_pad_set_setcaps_function(element->sinkpad,
> -@@ -140,14 +222,23 @@ gst_video_connector_init (GstVideoConnector *eleme=
nt,
> -                                GST_DEBUG_FUNCPTR(gst_video_connector_ge=
tcaps));
> -     gst_pad_set_acceptcaps_function(element->sinkpad,
> -                                GST_DEBUG_FUNCPTR(gst_video_connector_ac=
ceptcaps));
> --
> -+#endif
> -     gst_element_add_pad (GST_ELEMENT (element), element->sinkpad);
> -=20
> -     element->srcpad =3D
> -             gst_pad_new_from_static_template (&gst_video_connector_src_=
factory,
> -                                               "src");
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    gst_pad_add_probe(element->srcpad, GST_PAD_PROBE_TYPE_BUFFER,
> -+                             gst_video_connector_new_buffer_probe, elem=
ent, NULL);
> -+    gst_pad_add_probe(element->srcpad, GST_PAD_PROBE_TYPE_QUERY_DOWNSTR=
EAM,
> -+                             gst_video_connector_new_query_probe, eleme=
nt, NULL);
> -+    gst_pad_add_probe(element->sinkpad, GST_PAD_PROBE_TYPE_EVENT_DOWNST=
REAM,
> -+                             gst_video_connector_new_event_probe, eleme=
nt, NULL);
> -+#else
> -     gst_pad_add_buffer_probe(element->srcpad,
> -                              G_CALLBACK(gst_video_connector_new_buffer_=
probe), element);
> -+#endif
> -     gst_element_add_pad (GST_ELEMENT (element), element->srcpad);
> -=20
> -     element->relinked =3D FALSE;
> -@@ -175,9 +266,16 @@ gst_video_connector_dispose (GObject * object)
> -=20
> -     gst_video_connector_reset (element);
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    G_OBJECT_CLASS (gst_video_connector_parent_class)->dispose (object);
> -+#else
> -     G_OBJECT_CLASS (parent_class)->dispose (object);
> -+#endif
> - }
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+/* For gstreamer 1.x we handle it in ALLOCATION Query */
> -+#else
> - // "When this function returns anything else than GST_FLOW_OK,
> - // the buffer allocation failed and buf does not contain valid data."
> - static GstFlowReturn
> -@@ -221,6 +319,7 @@ gst_video_connector_buffer_alloc (GstPad * pad, guin=
t64 offset, guint size,
> -                 if (state =3D=3D GST_STATE_NULL) {
> -                     GST_DEBUG_OBJECT (element, "Downstream element is i=
n NULL state");
> -                     // Downstream filter seems to be in the wrong state
> -+
> -                     return GST_FLOW_UNEXPECTED;
> -                 }
> -             }
> -@@ -293,6 +392,7 @@ static GstCaps *gst_video_connector_getcaps (GstPad =
* pad)
> -     return caps;
> - }
> -=20
> -+
> - static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps *=
 caps)
> - {
> -     GstVideoConnector *element;
> -@@ -300,6 +400,7 @@ static gboolean gst_video_connector_acceptcaps (GstP=
ad * pad, GstCaps * caps)
> -=20
> -     return gst_pad_peer_accept_caps(element->srcpad, caps);
> - }
> -+#endif
> -=20
> - static void
> - gst_video_connector_resend_new_segment(GstElement * element, gboolean e=
mitFailedSignal)
> -@@ -311,11 +412,39 @@ gst_video_connector_resend_new_segment(GstElement =
* element, gboolean emitFailed
> -         connector->failedSignalEmited =3D FALSE;
> - }
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+static GstPadProbeReturn gst_video_connector_new_event_probe(GstPad *pa=
d, GstPadProbeInfo *info, gpointer object)
> -+{
> -+    GstVideoConnector *connector =3D GST_VIDEO_CONNECTOR (object);
> -+    GstEvent *event =3D gst_pad_probe_info_get_event(info);
> -+
> -+    GST_DEBUG_OBJECT(connector, "Event %"GST_PTR_FORMAT" received\n", e=
vent);
> -+
> -+    return GST_PAD_PROBE_OK;
> -+}
> -+
> -+static GstPadProbeReturn gst_video_connector_new_query_probe(GstPad *pa=
d, GstPadProbeInfo *info, gpointer object)
> -+{
> -+    GstVideoConnector *connector =3D GST_VIDEO_CONNECTOR (object);
> -+    GstQuery *query =3D gst_pad_probe_info_get_query(info);
> -+
> -+    GST_DEBUG_OBJECT(connector, "Query %"GST_PTR_FORMAT" received\n", q=
uery);
> -+
> -+    return GST_PAD_PROBE_OK;
> -+}
> -+#endif
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+static GstPadProbeReturn gst_video_connector_new_buffer_probe(GstPad *p=
ad, GstPadProbeInfo *info, gpointer object)
> -+{
> -+    (void) info;
> -+#else
> - static gboolean gst_video_connector_new_buffer_probe(GstObject *pad, Gs=
tBuffer *buffer, guint * object)
> - {
> --    (void) pad;
> -     (void) buffer;
> -+#endif
> -+    (void) pad;
> -+
> -=20
> -     GstVideoConnector *element =3D GST_VIDEO_CONNECTOR (object);
> -=20
> -@@ -327,16 +456,23 @@ static gboolean gst_video_connector_new_buffer_pro=
be(GstObject *pad, GstBuffer *
> -     if (element->relinked)
> -         GST_LOG_OBJECT(element, "rejected buffer because of new segment=
 request");
> -=20
> --    return !element->relinked;
> -+    return element->relinked ? GST_PAD_PROBE_DROP : GST_PAD_PROBE_OK;
> - }
> -=20
> --
> - static GstFlowReturn
> -+#if GST_CHECK_VERSION(1,0,0)
> -+gst_video_connector_chain (GstPad * pad, GstObject* parent, GstBuffer *=
 buf)
> -+#else
> - gst_video_connector_chain (GstPad * pad, GstBuffer * buf)
> -+#endif
> - {
> -     GstFlowReturn res;
> -     GstVideoConnector *element;
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    (void)parent;
> -+#endif
> -+
> -     element =3D GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
> -=20
> -     do {
> -@@ -348,20 +484,29 @@ gst_video_connector_chain (GstPad * pad, GstBuffer=
 * buf)
> -         */
> -         while (element->relinked) {
> -             element->relinked =3D FALSE;
> --
> -+#if GST_CHECK_VERSION(1,0,0)
> -+            if (element->latest_buffer && GST_BUFFER_TIMESTAMP_IS_VALID=
(element->latest_buffer)) {
> -+                element->segment.position =3D GST_BUFFER_TIMESTAMP (ele=
ment->latest_buffer);
> -+            }
> -+#else
> -             gint64 pos =3D element->segment.last_stop;
> --
> -             if (element->latest_buffer && GST_BUFFER_TIMESTAMP_IS_VALID=
(element->latest_buffer)) {
> -                 pos =3D GST_BUFFER_TIMESTAMP (element->latest_buffer);
> -             }
> -+#endif
> -=20
> -             //push a new segment and last buffer
> -+#if GST_CHECK_VERSION(1,0,0)
> -+            GstEvent *ev =3D gst_event_new_segment (&element->segment);
> -+
> -+#else
> -             GstEvent *ev =3D gst_event_new_new_segment (TRUE,
> -                                                       element->segment.=
rate,
> -                                                       element->segment.=
format,
> -                                                       pos, //start
> -                                                       element->segment.=
stop,
> -                                                       pos);
> -+#endif
> -=20
> -             GST_DEBUG_OBJECT (element, "Pushing new segment event");
> -             if (!gst_pad_push_event (element->srcpad, ev)) {
> -@@ -424,8 +569,11 @@ gst_video_connector_change_state (GstElement * elem=
ent,
> -     GstStateChangeReturn result;
> -=20
> -     connector =3D GST_VIDEO_CONNECTOR(element);
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    result =3D GST_ELEMENT_CLASS (gst_video_connector_parent_class)->ch=
ange_state(element, transition);
> -+#else
> -     result =3D GST_ELEMENT_CLASS (parent_class)->change_state(element, =
transition);
> --
> -+#endif
> -     switch (transition) {
> -     case GST_STATE_CHANGE_PAUSED_TO_READY:
> -         gst_video_connector_reset (connector);
> -@@ -440,9 +588,32 @@ gst_video_connector_change_state (GstElement * elem=
ent,
> -     return result;
> - }
> -=20
> --static gboolean
> --gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
> -+#if GST_CHECK_VERSION(1,0,0)
> -+static gboolean gst_video_connector_handle_sink_event (GstPad * pad, Gs=
tObject* parent,
> -+                                                       GstEvent * event)
> -+{
> -+    GstVideoConnector *element =3D GST_VIDEO_CONNECTOR (gst_pad_get_par=
ent (pad));
> -+
> -+    switch (GST_EVENT_TYPE (event)) {
> -+      case GST_EVENT_SEGMENT:
> -+      break;
> -+      case GST_EVENT_CAPS:
> -+      break;
> -+    default:
> -+      break;
> -+    }
> -+
> -+    gst_object_unref (element);
> -+    return gst_pad_event_default (pad, parent, event);
> -+}
> -+
> -+#else
> -+
> -+static gboolean gst_video_connector_handle_sink_event (GstPad * pad,
> -+                                                       GstEvent * event)
> - {
> -+    (void)parent;
> -+
> -     if (GST_EVENT_TYPE (event) =3D=3D GST_EVENT_NEWSEGMENT) {
> -         GstVideoConnector *element =3D GST_VIDEO_CONNECTOR (gst_pad_get=
_parent (pad));
> -=20
> -@@ -453,7 +624,6 @@ gst_video_connector_handle_sink_event (GstPad * pad,=
 GstEvent * event)
> -=20
> -         gst_event_parse_new_segment_full (event, &update, &rate, &arate=
, &format,
> -                                           &start, &stop, &time);
> --
> -         GST_LOG_OBJECT (element,
> -                           "NEWSEGMENT update %d, rate %lf, applied rate=
 %lf, "
> -                           "format %d, " "%" G_GINT64_FORMAT " -- %" G_G=
INT64_FORMAT ", time %"
> -@@ -461,9 +631,10 @@ gst_video_connector_handle_sink_event (GstPad * pad=
, GstEvent * event)
> -=20
> -         gst_segment_set_newsegment_full (&element->segment, update,
> -                                          rate, arate, format, start, st=
op, time);
> --
> -         gst_object_unref (element);
> -     }
> -=20
> -     return gst_pad_event_default (pad, event);
> - }
> -+
> -+#endif
> -diff --git a/src/gsttools/qgstappsrc.cpp b/src/gsttools/qgstappsrc.cpp
> -index 561a96f..d5e106f 100644
> ---- a/src/gsttools/qgstappsrc.cpp
> -+++ b/src/gsttools/qgstappsrc.cpp
> -@@ -147,23 +147,44 @@ void QGstAppSrc::pushDataToAppSrc()
> -             size =3D qMin(m_stream->bytesAvailable(), (qint64)m_dataReq=
uestSize);
> -=20
> -         if (size) {
> --            void *data =3D g_malloc(size);
> --            GstBuffer* buffer =3D gst_app_buffer_new(data, size, g_free=
, data);
> -+            GstBuffer* buffer =3D gst_buffer_new_and_alloc(size);
> -+
> -+#if GST_CHECK_VERSION(1,0,0)
> -+            GstMapInfo mapInfo;
> -+            gst_buffer_map(buffer, &mapInfo, GST_MAP_WRITE);
> -+            void* bufferData =3D mapInfo.data;
> -+#else
> -+            void* bufferData =3D GST_BUFFER_DATA(buffer);
> -+#endif
> -+           =20
> -             buffer->offset =3D m_stream->pos();
> --            qint64 bytesRead =3D m_stream->read((char*)GST_BUFFER_DATA(=
buffer), size);
> -+            qint64 bytesRead =3D m_stream->read((char*)bufferData, size=
);
> -             buffer->offset_end =3D  buffer->offset + bytesRead - 1;
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+            gst_buffer_unmap(buffer, &mapInfo);
> -+#endif
> -+           =20
> -             if (bytesRead > 0) {
> -                 m_dataRequested =3D false;
> -                 m_enoughData =3D false;
> -                 GstFlowReturn ret =3D gst_app_src_push_buffer (GST_APP_=
SRC (element()), buffer);
> -                 if (ret =3D=3D GST_FLOW_ERROR) {
> -                     qWarning()<<"appsrc: push buffer error";
> -+#if GST_CHECK_VERSION(1,0,0)
> -+                } else if (ret =3D=3D GST_FLOW_FLUSHING) {
> -+                    qWarning()<<"appsrc: push buffer wrong state";
> -+                }
> -+#else
> -                 } else if (ret =3D=3D GST_FLOW_WRONG_STATE) {
> -                     qWarning()<<"appsrc: push buffer wrong state";
> --                } else if (ret =3D=3D GST_FLOW_RESEND) {
> -+                }
> -+#endif
> -+#if GST_VERSION_MAJOR < 1
> -+                else if (ret =3D=3D GST_FLOW_RESEND) {
> -                     qWarning()<<"appsrc: push buffer resend";
> -                 }
> -+#endif
> -             }
> -         } else {
> -             sendEOS();
> -diff --git a/src/gsttools/qgstreameraudioprobecontrol.cpp b/src/gsttools=
/qgstreameraudioprobecontrol.cpp
> -index 3baca53..be3de3f 100644
> ---- a/src/gsttools/qgstreameraudioprobecontrol.cpp
> -+++ b/src/gsttools/qgstreameraudioprobecontrol.cpp
> -@@ -45,9 +45,14 @@ QGstreamerAudioProbeControl::~QGstreamerAudioProbeCon=
trol()
> -=20
> - }
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer, GstCa=
ps* caps)
> -+{
> -+#else
> - void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
> - {
> --    GstCaps* caps =3D gst_buffer_get_caps(buffer);
> -+    gst_buffer_get_caps(buffer);
> -+#endif
> -     if (!caps)
> -         return;
> -=20
> -@@ -56,8 +61,20 @@ void QGstreamerAudioProbeControl::bufferProbed(GstBuf=
fer* buffer)
> -     if (!format.isValid())
> -         return;
> -=20
> -+    #if GST_CHECK_VERSION(1,0,0)
> -+
> -+    GstMapInfo info;
> -+
> -+    gst_buffer_map (buffer, &info, GST_MAP_READ);
> -+    QAudioBuffer audioBuffer =3D QAudioBuffer(QByteArray((const char*)i=
nfo.data, info.size), format);
> -+    gst_buffer_unmap(buffer, &info);
> -+
> -+    #else
> -+
> -     QAudioBuffer audioBuffer =3D QAudioBuffer(QByteArray((const char*)b=
uffer->data, buffer->size), format);
> -=20
> -+    #endif
> -+
> -     {
> -         QMutexLocker locker(&m_bufferMutex);
> -         m_pendingBuffer =3D audioBuffer;
> -diff --git a/src/gsttools/qgstreamerbushelper.cpp b/src/gsttools/qgstrea=
merbushelper.cpp
> -index 84eda46..eb1fc36 100644
> ---- a/src/gsttools/qgstreamerbushelper.cpp
> -+++ b/src/gsttools/qgstreamerbushelper.cpp
> -@@ -154,13 +154,21 @@ QGstreamerBusHelper::QGstreamerBusHelper(GstBus* b=
us, QObject* parent):
> -     QObject(parent)
> - {
> -     d =3D new QGstreamerBusHelperPrivate(this, bus);
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    gst_bus_set_sync_handler(bus, (GstBusSyncHandler)syncGstBusFilter, =
d, 0);
> -+#else
> -     gst_bus_set_sync_handler(bus, (GstBusSyncHandler)syncGstBusFilter, =
d);
> -+#endif
> -     gst_object_ref(GST_OBJECT(bus));
> - }
> -=20
> - QGstreamerBusHelper::~QGstreamerBusHelper()
> - {
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    gst_bus_set_sync_handler(d->bus(), 0, 0, 0);
> -+#else
> -     gst_bus_set_sync_handler(d->bus(),0,0);
> -+#endif
> -     gst_object_unref(GST_OBJECT(d->bus()));
> - }
> -=20
> -diff --git a/src/gsttools/qgstreamervideoprobecontrol.cpp b/src/gsttools=
/qgstreamervideoprobecontrol.cpp
> -index a78a9da..9c31140 100644
> ---- a/src/gsttools/qgstreamervideoprobecontrol.cpp
> -+++ b/src/gsttools/qgstreamervideoprobecontrol.cpp
> -@@ -67,12 +67,21 @@ void QGstreamerVideoProbeControl::stopFlushing()
> -     m_flushing =3D false;
> - }
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+void QGstreamerVideoProbeControl::bufferProbed(GstBuffer* buffer, GstCa=
ps* caps)
> -+#else
> - void QGstreamerVideoProbeControl::bufferProbed(GstBuffer* buffer)
> -+#endif
> - {
> -     if (m_flushing)
> -         return;
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    // FIXME:
> -+   // GstCaps* caps =3D NULL;//gst_buffer_get_caps(buffer);
> -+#else
> -     GstCaps* caps =3D gst_buffer_get_caps(buffer);
> -+#endif
> -     if (!caps)
> -         return;
> -=20
> -diff --git a/src/gsttools/qgstreamervideorenderer.cpp b/src/gsttools/qgs=
treamervideorenderer.cpp
> -index 2b66f76..804dce9 100644
> ---- a/src/gsttools/qgstreamervideorenderer.cpp
> -+++ b/src/gsttools/qgstreamervideorenderer.cpp
> -@@ -35,8 +35,7 @@
> - #include <private/qvideosurfacegstsink_p.h>
> - #include <private/qgstutils_p.h>
> - #include <qabstractvideosurface.h>
> --
> --#include <QDebug>
> -+#include <QtCore/qdebug.h>
> -=20
> - #include <gst/gst.h>
> -=20
> -diff --git a/src/gsttools/qgstreamervideowidget.cpp b/src/gsttools/qgstr=
eamervideowidget.cpp
> -index b26369a..23674bb 100644
> ---- a/src/gsttools/qgstreamervideowidget.cpp
> -+++ b/src/gsttools/qgstreamervideowidget.cpp
> -@@ -40,8 +40,13 @@
> - #include <QtGui/qpainter.h>
> -=20
> - #include <gst/gst.h>
> -+
> -+#if !GST_CHECK_VERSION(1,0,0)
> - #include <gst/interfaces/xoverlay.h>
> - #include <gst/interfaces/propertyprobe.h>
> -+#else
> -+#include <gst/video/videooverlay.h>
> -+#endif
> -=20
> - QT_BEGIN_NAMESPACE
> -=20
> -@@ -161,9 +166,13 @@ bool QGstreamerVideoWidgetControl::processSyncMessa=
ge(const QGstreamerMessage &m
> - {
> -     GstMessage* gm =3D message.rawMessage();
> -=20
> -+#if !GST_CHECK_VERSION(1,0,0)
> -     if (gm && (GST_MESSAGE_TYPE(gm) =3D=3D GST_MESSAGE_ELEMENT) &&
> -             gst_structure_has_name(gm->structure, "prepare-xwindow-id")=
) {
> --
> -+#else
> -+      if (gm && (GST_MESSAGE_TYPE(gm) =3D=3D GST_MESSAGE_ELEMENT) &&
> -+              gst_structure_has_name(gst_message_get_structure(gm), "pr=
epare-window-handle")) {
> -+#endif
> -         setOverlay();
> -         QMetaObject::invokeMethod(this, "updateNativeVideoSize", Qt::Qu=
euedConnection);
> -         return true;
> -@@ -191,18 +200,29 @@ bool QGstreamerVideoWidgetControl::processBusMessa=
ge(const QGstreamerMessage &me
> -=20
> - void QGstreamerVideoWidgetControl::setOverlay()
> - {
> -+#if !GST_CHECK_VERSION(1,0,0)
> -     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
> -         gst_x_overlay_set_xwindow_id(GST_X_OVERLAY(m_videoSink), m_wind=
owId);
> -     }
> -+#else
> -+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
> -+        gst_video_overlay_set_window_handle(GST_VIDEO_OVERLAY(m_videoSi=
nk), m_windowId);
> -+    }
> -+#endif
> - }
> -=20
> - void QGstreamerVideoWidgetControl::updateNativeVideoSize()
> - {
> -     if (m_videoSink) {
> -         //find video native size to update video widget size hint
> --        GstPad *pad =3D gst_element_get_static_pad(m_videoSink,"sink");
> -+        GstPad *pad =3D gst_element_get_static_pad(m_videoSink, "sink");
> -+#if !GST_CHECK_VERSION(1,0,0)
> -         GstCaps *caps =3D gst_pad_get_negotiated_caps(pad);
> -         gst_object_unref(GST_OBJECT(pad));
> -+#else
> -+        GstCaps *caps =3D gst_pad_get_current_caps(pad);
> -+        gst_object_unref(GST_OBJECT(pad));
> -+#endif
> -=20
> -         if (caps) {
> -             m_widget->setNativeSize(QGstUtils::capsCorrectedResolution(=
caps));
> -@@ -217,8 +237,13 @@ void QGstreamerVideoWidgetControl::updateNativeVide=
oSize()
> -=20
> - void QGstreamerVideoWidgetControl::windowExposed()
> - {
> -+#if !GST_CHECK_VERSION(1,0,0)
> -     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink))
> -         gst_x_overlay_expose(GST_X_OVERLAY(m_videoSink));
> -+#else
> -+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink))
> -+        gst_video_overlay_expose(GST_VIDEO_OVERLAY(m_videoSink));
> -+#endif
> - }
> -=20
> - QWidget *QGstreamerVideoWidgetControl::videoWidget()
> -diff --git a/src/gsttools/qgstreamervideowindow.cpp b/src/gsttools/qgstr=
eamervideowindow.cpp
> -index a373dcc..587b010 100644
> ---- a/src/gsttools/qgstreamervideowindow.cpp
> -+++ b/src/gsttools/qgstreamervideowindow.cpp
> -@@ -37,8 +37,12 @@
> - #include <QtCore/qdebug.h>
> -=20
> - #include <gst/gst.h>
> -+#include <gst/video/videooverlay.h>
> -+
> -+#if !GST_CHECK_VERSION(1,0,0)
> - #include <gst/interfaces/xoverlay.h>
> - #include <gst/interfaces/propertyprobe.h>
> -+#endif
> -=20
> -=20
> - QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent, const cha=
r *elementName)
> -@@ -49,18 +53,25 @@ QGstreamerVideoWindow::QGstreamerVideoWindow(QObject=
 *parent, const char *elemen
> -     , m_fullScreen(false)
> -     , m_colorKey(QColor::Invalid)
> - {
> --    if (elementName)
> -+    if (elementName) {
> -         m_videoSink =3D gst_element_factory_make(elementName, NULL);
> --    else
> -+    } else {
> -         m_videoSink =3D gst_element_factory_make("xvimagesink", NULL);
> -+    }
> -=20
> -     if (m_videoSink) {
> -         qt_gst_object_ref_sink(GST_OBJECT(m_videoSink)); //Take ownersh=
ip
> -=20
> -         GstPad *pad =3D gst_element_get_static_pad(m_videoSink,"sink");
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        m_bufferProbeId =3D gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_B=
UFFER, padBufferProbe, this, NULL);
> -+#else
> -         m_bufferProbeId =3D gst_pad_add_buffer_probe(pad, G_CALLBACK(pa=
dBufferProbe), this);
> -+#endif
> -         gst_object_unref(GST_OBJECT(pad));
> -     }
> -+    else
> -+        qDebug() << "No m_videoSink available!";
> - }
> -=20
> - QGstreamerVideoWindow::~QGstreamerVideoWindow()
> -@@ -82,11 +93,15 @@ void QGstreamerVideoWindow::setWinId(WId id)
> -     WId oldId =3D m_windowId;
> -=20
> -     m_windowId =3D id;
> --
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
> -+        gst_video_overlay_set_window_handle(GST_VIDEO_OVERLAY(m_videoSi=
nk), m_windowId);
> -+    }
> -+#else
> -     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
> -         gst_x_overlay_set_xwindow_id(GST_X_OVERLAY(m_videoSink), m_wind=
owId);
> -     }
> --
> -+#endif
> -     if (!oldId)
> -         emit readyChanged(true);
> -=20
> -@@ -97,7 +112,20 @@ void QGstreamerVideoWindow::setWinId(WId id)
> - bool QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage =
&message)
> - {
> -     GstMessage* gm =3D message.rawMessage();
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    const GstStructure *s =3D gst_message_get_structure(gm);
> -+    if ((GST_MESSAGE_TYPE(gm) =3D=3D GST_MESSAGE_ELEMENT) &&
> -+            gst_structure_has_name(s, "prepare-window-handle") &&
> -+            m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
> -+
> -+        gst_video_overlay_set_window_handle(GST_VIDEO_OVERLAY(m_videoSi=
nk), m_windowId);
> -=20
> -+        GstPad *pad =3D gst_element_get_static_pad(m_videoSink,"sink");
> -+        m_bufferProbeId =3D gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_B=
UFFER, padBufferProbe, this, NULL);
> -+
> -+        return true;
> -+    }
> -+#else
> -     if ((GST_MESSAGE_TYPE(gm) =3D=3D GST_MESSAGE_ELEMENT) &&
> -             gst_structure_has_name(gm->structure, "prepare-xwindow-id")=
 &&
> -             m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
> -@@ -110,7 +138,7 @@ bool QGstreamerVideoWindow::processSyncMessage(const=
 QGstreamerMessage &message)
> -=20
> -         return true;
> -     }
> --
> -+#endif
> -     return false;
> - }
> -=20
> -@@ -122,7 +150,19 @@ QRect QGstreamerVideoWindow::displayRect() const
> - void QGstreamerVideoWindow::setDisplayRect(const QRect &rect)
> - {
> -     m_displayRect =3D rect;
> --
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
> -+        if (m_displayRect.isEmpty())
> -+            gst_video_overlay_set_render_rectangle(GST_VIDEO_OVERLAY(m_=
videoSink), -1, -1, -1, -1);
> -+        else
> -+            gst_video_overlay_set_render_rectangle(GST_VIDEO_OVERLAY(m_=
videoSink),
> -+                                               m_displayRect.x(),
> -+                                               m_displayRect.y(),
> -+                                               m_displayRect.width(),
> -+                                               m_displayRect.height());
> -+        repaint();
> -+    }
> -+#else
> -     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
> - #if GST_VERSION_MICRO >=3D 29
> -         if (m_displayRect.isEmpty())
> -@@ -136,6 +176,7 @@ void QGstreamerVideoWindow::setDisplayRect(const QRe=
ct &rect)
> -         repaint();
> - #endif
> -     }
> -+#endif
> - }
> -=20
> - Qt::AspectRatioMode QGstreamerVideoWindow::aspectRatioMode() const
> -@@ -157,6 +198,16 @@ void QGstreamerVideoWindow::setAspectRatioMode(Qt::=
AspectRatioMode mode)
> -=20
> - void QGstreamerVideoWindow::repaint()
> - {
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
> -+        //don't call gst_x_overlay_expose if the sink is in null state
> -+        GstState state =3D GST_STATE_NULL;
> -+        GstStateChangeReturn res =3D gst_element_get_state(m_videoSink,=
 &state, NULL, 1000000);
> -+        if (res !=3D GST_STATE_CHANGE_FAILURE && state !=3D GST_STATE_N=
ULL) {
> -+            gst_video_overlay_expose(GST_VIDEO_OVERLAY(m_videoSink));
> -+        }
> -+    }
> -+#else
> -     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
> -         //don't call gst_x_overlay_expose if the sink is in null state
> -         GstState state =3D GST_STATE_NULL;
> -@@ -165,6 +216,7 @@ void QGstreamerVideoWindow::repaint()
> -             gst_x_overlay_expose(GST_X_OVERLAY(m_videoSink));
> -         }
> -     }
> -+#endif
> - }
> -=20
> - QColor QGstreamerVideoWindow::colorKey() const
> -@@ -296,11 +348,22 @@ QSize QGstreamerVideoWindow::nativeSize() const
> -     return m_nativeSize;
> - }
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+GstPadProbeReturn QGstreamerVideoWindow::padBufferProbe(GstPad *pad, Gs=
tPadProbeInfo *info, gpointer user_data)
> -+#else
> - void QGstreamerVideoWindow::padBufferProbe(GstPad *pad, GstBuffer * /* =
buffer */, gpointer user_data)
> -+#endif
> - {
> -     QGstreamerVideoWindow *control =3D reinterpret_cast<QGstreamerVideo=
Window*>(user_data);
> -     QMetaObject::invokeMethod(control, "updateNativeVideoSize", Qt::Que=
uedConnection);
> -+
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    Q_UNUSED(pad);
> -+    Q_UNUSED(info);
> -+    return GST_PAD_PROBE_REMOVE;
> -+#else
> -     gst_pad_remove_buffer_probe(pad, control->m_bufferProbeId);
> -+#endif
> - }
> -=20
> - void QGstreamerVideoWindow::updateNativeVideoSize()
> -@@ -311,7 +374,11 @@ void QGstreamerVideoWindow::updateNativeVideoSize()
> -     if (m_videoSink) {
> -         //find video native size to update video widget size hint
> -         GstPad *pad =3D gst_element_get_static_pad(m_videoSink,"sink");
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        GstCaps *caps =3D gst_pad_get_current_caps(pad);
> -+#else
> -         GstCaps *caps =3D gst_pad_get_negotiated_caps(pad);
> -+#endif
> -         gst_object_unref(GST_OBJECT(pad));
> -=20
> -         if (caps) {
> -diff --git a/src/gsttools/qgstutils.cpp b/src/gsttools/qgstutils.cpp
> -index 465f439..cb26137 100644
> ---- a/src/gsttools/qgstutils.cpp
> -+++ b/src/gsttools/qgstutils.cpp
> -@@ -90,8 +90,13 @@ static void addTagToMap(const GstTagList *list,
> -             break;
> -         default:
> -             // GST_TYPE_DATE is a function, not a constant, so pull it =
out of the switch
> -+#if GST_CHECK_VERSION(1,0,0)
> -+            if (G_VALUE_TYPE(&val) =3D=3D G_TYPE_DATE) {
> -+                const GDate *date =3D (const GDate *)g_value_get_boxed(=
&val);
> -+#else
> -             if (G_VALUE_TYPE(&val) =3D=3D GST_TYPE_DATE) {
> -                 const GDate *date =3D gst_value_get_date(&val);
> -+#endif
> -                 if (g_date_valid(date)) {
> -                     int year =3D g_date_get_year(date);
> -                     int month =3D g_date_get_month(date);
> -@@ -255,6 +260,24 @@ QAudioFormat QGstUtils::audioFormatForCaps(const Gs=
tCaps *caps)
> - }
> -=20
> -=20
> -+
> -+#if GST_CHECK_VERSION(1,0,0)
> -+/*!
> -+  Returns audio format for a buffer.
> -+  If the buffer doesn't have a valid audio format, an empty QAudioForma=
t is returned.
> -+*/
> -+
> -+QAudioFormat QGstUtils::audioFormatForSample(GstSample *sample)
> -+{
> -+    GstCaps* caps =3D gst_sample_get_caps(sample);
> -+    if (!caps)
> -+        return QAudioFormat();
> -+
> -+    QAudioFormat format =3D QGstUtils::audioFormatForCaps(caps);
> -+    gst_caps_unref(caps);
> -+    return format;
> -+}
> -+#else
> - /*!
> -   Returns audio format for a buffer.
> -   If the buffer doesn't have a valid audio format, an empty QAudioForma=
t is returned.
> -@@ -270,7 +293,7 @@ QAudioFormat QGstUtils::audioFormatForBuffer(GstBuff=
er *buffer)
> -     gst_caps_unref(caps);
> -     return format;
> - }
> --
> -+#endif
> -=20
> - /*!
> -   Builds GstCaps for an audio format.
> -@@ -588,7 +611,7 @@ QByteArray QGstUtils::cameraDriver(const QString &de=
vice, GstElementFactory *fac
> -=20
> - void qt_gst_object_ref_sink(gpointer object)
> - {
> --#if (GST_VERSION_MAJOR >=3D 0) && (GST_VERSION_MINOR >=3D 10) && (GST_V=
ERSION_MICRO >=3D 24)
> -+#if (GST_VERSION_MAJOR >=3D 0) && (GST_VERSION_MINOR >=3D 10) && (GST_V=
ERSION_MICRO >=3D 24) || GST_CHECK_VERSION(1,0,0)
> -     gst_object_ref_sink(object);
> - #else
> -     g_return_if_fail (GST_IS_OBJECT(object));
> -diff --git a/src/gsttools/qgstvideobuffer.cpp b/src/gsttools/qgstvideobu=
ffer.cpp
> -index 18702ec..93f22f5 100644
> ---- a/src/gsttools/qgstvideobuffer.cpp
> -+++ b/src/gsttools/qgstvideobuffer.cpp
> -@@ -70,21 +70,33 @@ QAbstractVideoBuffer::MapMode QGstVideoBuffer::mapMo=
de() const
> - uchar *QGstVideoBuffer::map(MapMode mode, int *numBytes, int *bytesPerL=
ine)
> - {
> -     if (mode !=3D NotMapped && m_mode =3D=3D NotMapped) {
> --        if (numBytes)
> --            *numBytes =3D m_buffer->size;
> -+        m_mode =3D mode;
> -=20
> -         if (bytesPerLine)
> -             *bytesPerLine =3D m_bytesPerLine;
> -=20
> --        m_mode =3D mode;
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        gst_buffer_map(m_buffer, &m_mapInfo, GST_MAP_READ);
> -+        if (numBytes)
> -+            *numBytes =3D m_mapInfo.size;
> -+
> -+        return m_mapInfo.data;
> -+#else
> -+        if (numBytes)
> -+            *numBytes =3D m_buffer->size;
> -=20
> -         return m_buffer->data;
> -+#endif
> -     } else {
> -         return 0;
> -     }
> - }
> - void QGstVideoBuffer::unmap()
> - {
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    if (m_mode !=3D NotMapped)
> -+        gst_buffer_unmap(m_buffer, &m_mapInfo);
> -+#endif
> -     m_mode =3D NotMapped;
> - }
> -=20
> -diff --git a/src/gsttools/qvideosurfacegstsink.cpp b/src/gsttools/qvideo=
surfacegstsink.cpp
> -index f3e2d88..94aaee7 100644
> ---- a/src/gsttools/qvideosurfacegstsink.cpp
> -+++ b/src/gsttools/qvideosurfacegstsink.cpp
> -@@ -43,7 +43,11 @@
> -=20
> - #include "qvideosurfacegstsink_p.h"
> -=20
> --//#define DEBUG_VIDEO_SURFACE_SINK
> -+#if GST_VERSION_MAJOR >=3D1
> -+#include <gst/video/video.h>
> -+#endif
> -+
> -+#define DEBUG_VIDEO_SURFACE_SINK
> -=20
> - QT_BEGIN_NAMESPACE
> -=20
> -@@ -62,10 +66,12 @@ QVideoSurfaceGstDelegate::QVideoSurfaceGstDelegate(
> -     if (m_surface) {
> -         foreach (QObject *instance, bufferPoolLoader()->instances(QGstB=
ufferPoolPluginKey)) {
> -             QGstBufferPoolInterface* plugin =3D qobject_cast<QGstBuffer=
PoolInterface*>(instance);
> -+
> -             if (plugin) {
> -                 m_pools.append(plugin);
> -             }
> -         }
> -+
> -         updateSupportedFormats();
> -         connect(m_surface, SIGNAL(supportedFormatsChanged()), this, SLO=
T(updateSupportedFormats()));
> -     }
> -@@ -198,6 +204,8 @@ GstFlowReturn QVideoSurfaceGstDelegate::render(GstBu=
ffer *buffer)
> -     if (QThread::currentThread() =3D=3D thread()) {
> -         if (!m_surface.isNull())
> -             m_surface->present(m_frame);
> -+        else
> -+            qWarning() << "m_surface.isNull().";
> -     } else {
> -         QMetaObject::invokeMethod(this, "queuedRender", Qt::QueuedConne=
ction);
> -         m_renderCondition.wait(&m_mutex, 300);
> -@@ -283,6 +291,27 @@ void QVideoSurfaceGstDelegate::updateSupportedForma=
ts()
> -     }
> - }
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+struct YuvFormat
> -+{
> -+    QVideoFrame::PixelFormat pixelFormat;
> -+    GstVideoFormat vfmt;
> -+    guint32 fourcc;
> -+    int bitsPerPixel;
> -+};
> -+
> -+static const YuvFormat qt_yuvColorLookup[] =3D
> -+{
> -+    { QVideoFrame::Format_YUV420P, GST_VIDEO_FORMAT_I420, GST_MAKE_FOUR=
CC('I','4','2','0'), 8  },
> -+    { QVideoFrame::Format_YV12,    GST_VIDEO_FORMAT_YV12, GST_MAKE_FOUR=
CC('Y','V','1','2'), 8  },
> -+    { QVideoFrame::Format_UYVY,    GST_VIDEO_FORMAT_UYVY, GST_MAKE_FOUR=
CC('U','Y','V','Y'), 16 },
> -+    { QVideoFrame::Format_YUYV,    GST_VIDEO_FORMAT_YUY2, GST_MAKE_FOUR=
CC('Y','U','Y','2'), 16 },
> -+    { QVideoFrame::Format_NV12,    GST_VIDEO_FORMAT_NV12, GST_MAKE_FOUR=
CC('N','V','1','2'), 8 },
> -+    { QVideoFrame::Format_NV21,    GST_VIDEO_FORMAT_NV21, GST_MAKE_FOUR=
CC('N','V','2','1'), 8 },
> -+    { QVideoFrame::Format_AYUV444, GST_VIDEO_FORMAT_AYUV, GST_MAKE_FOUR=
CC('A','Y','U','V'), 32 },
> -+};
> -+
> -+#else
> - struct YuvFormat
> - {
> -     QVideoFrame::PixelFormat pixelFormat;
> -@@ -300,6 +329,7 @@ static const YuvFormat qt_yuvColorLookup[] =3D
> -     { QVideoFrame::Format_NV21,    GST_MAKE_FOURCC('N','V','2','1'), 8 =
},
> -     { QVideoFrame::Format_AYUV444, GST_MAKE_FOURCC('A','Y','U','V'), 32=
 }
> - };
> -+#endif
> -=20
> - static int indexOfYuvColor(QVideoFrame::PixelFormat format)
> - {
> -@@ -312,12 +342,20 @@ static int indexOfYuvColor(QVideoFrame::PixelForma=
t format)
> -     return -1;
> - }
> -=20
> -+#if GST_VERSION_MAJOR >=3D1
> -+static int indexOfYuvColor(GstVideoFormat vfmt)
> -+#else
> - static int indexOfYuvColor(guint32 fourcc)
> -+#endif
> - {
> -     const int count =3D sizeof(qt_yuvColorLookup) / sizeof(YuvFormat);
> -=20
> -     for (int i =3D 0; i < count; ++i)
> -+#if GST_VERSION_MAJOR >=3D1
> -+        if (qt_yuvColorLookup[i].vfmt =3D=3D vfmt)
> -+#else
> -         if (qt_yuvColorLookup[i].fourcc =3D=3D fourcc)
> -+#endif
> -             return i;
> -=20
> -     return -1;
> -@@ -388,13 +426,13 @@ GType QVideoSurfaceGstSink::get_type()
> -     if (type =3D=3D 0) {
> -         static const GTypeInfo info =3D
> -         {
> --            sizeof(QVideoSurfaceGstSinkClass),                    // cl=
ass_size
> -+            sizeof(QVideoSurfaceGstSinkClass),                 // class=
_size
> -             base_init,                                         // base_=
init
> -             NULL,                                              // base_=
finalize
> -             class_init,                                        // class=
_init
> -             NULL,                                              // class=
_finalize
> -             NULL,                                              // class=
_data
> --            sizeof(QVideoSurfaceGstSink),                         // in=
stance_size
> -+            sizeof(QVideoSurfaceGstSink),                      // insta=
nce_size
> -             0,                                                 // n_pre=
allocs
> -             instance_init,                                     // insta=
nce_init
> -             0                                                  // value=
_table
> -@@ -419,7 +457,11 @@ void QVideoSurfaceGstSink::class_init(gpointer g_cl=
ass, gpointer class_data)
> -     GstBaseSinkClass *base_sink_class =3D reinterpret_cast<GstBaseSinkC=
lass *>(g_class);
> -     base_sink_class->get_caps =3D QVideoSurfaceGstSink::get_caps;
> -     base_sink_class->set_caps =3D QVideoSurfaceGstSink::set_caps;
> -+// FIXME:
> -+#if GST_CHECK_VERSION(1,0,0)
> -+#else
> -     base_sink_class->buffer_alloc =3D QVideoSurfaceGstSink::buffer_allo=
c;
> -+#endif
> -     base_sink_class->start =3D QVideoSurfaceGstSink::start;
> -     base_sink_class->stop =3D QVideoSurfaceGstSink::stop;
> -=20
> -@@ -434,6 +476,18 @@ void QVideoSurfaceGstSink::base_init(gpointer g_cla=
ss)
> - {
> -     static GstStaticPadTemplate sink_pad_template =3D GST_STATIC_PAD_TE=
MPLATE(
> -             "sink", GST_PAD_SINK, GST_PAD_ALWAYS, GST_STATIC_CAPS(
> -+#if GST_CHECK_VERSION(1,0,0)
> -+                    "video/x-raw, "
> -+                    "format =3D (string) RGBA,"
> -+                    "framerate =3D (fraction) [ 0, MAX ], "
> -+                    "width =3D (int) [ 1, MAX ], "
> -+                    "height =3D (int) [ 1, MAX ]; "
> -+                    "video/x-raw, "
> -+                    "format =3D (string) I420,"
> -+                    "framerate =3D (fraction) [ 0, MAX ], "
> -+                    "width =3D (int) [ 1, MAX ], "
> -+                    "height =3D (int) [ 1, MAX ]"));
> -+#else
> -                     "video/x-raw-rgb, "
> -                     "framerate =3D (fraction) [ 0, MAX ], "
> -                     "width =3D (int) [ 1, MAX ], "
> -@@ -442,6 +496,7 @@ void QVideoSurfaceGstSink::base_init(gpointer g_clas=
s)
> -                     "framerate =3D (fraction) [ 0, MAX ], "
> -                     "width =3D (int) [ 1, MAX ], "
> -                     "height =3D (int) [ 1, MAX ]"));
> -+#endif
> -=20
> -     gst_element_class_add_pad_template(
> -             GST_ELEMENT_CLASS(g_class), gst_static_pad_template_get(&si=
nk_pad_template));
> -@@ -490,7 +545,11 @@ GstStateChangeReturn QVideoSurfaceGstSink::change_s=
tate(
> -             element, transition);
> - }
> -=20
> --GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
> -+GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base
> -+#if GST_CHECK_VERSION(1,0,0)
> -+                                        , GstCaps* /*filterCaps*/
> -+#endif
> -+)
> - {
> -     VO_SINK(base);
> -=20
> -@@ -503,6 +562,7 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink =
*base)
> -     QList<QVideoFrame::PixelFormat> poolHandleFormats;
> -     sink->delegate->poolMutex()->lock();
> -     QGstBufferPoolInterface *pool =3D sink->delegate->pool();
> -+
> -     if (pool)
> -         poolHandleFormats =3D sink->delegate->supportedPixelFormats(poo=
l->handleType());
> -     sink->delegate->poolMutex()->unlock();
> -@@ -518,11 +578,19 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSin=
k *base)
> -=20
> -         if (index !=3D -1) {
> -             gst_caps_append_structure(caps, gst_structure_new(
> -+#if GST_CHECK_VERSION(1,0,0)
> -+                    "video/x-raw",
> -+#else
> -                     "video/x-raw-yuv",
> -+#endif
> -                     "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, INT_MAX=
, 1,
> -                     "width"    , GST_TYPE_INT_RANGE, 1, INT_MAX,
> -                     "height"   , GST_TYPE_INT_RANGE, 1, INT_MAX,
> -+#if GST_CHECK_VERSION(1,0,0)
> -+                    "format"   , G_TYPE_STRING, gst_video_format_to_str=
ing(qt_yuvColorLookup[index].vfmt),
> -+#else
> -                     "format"   , GST_TYPE_FOURCC, qt_yuvColorLookup[ind=
ex].fourcc,
> -+#endif
> -                     NULL));
> -             continue;
> -         }
> -@@ -532,7 +600,18 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink=
 *base)
> -         for (int i =3D 0; i < count; ++i) {
> -             if (qt_rgbColorLookup[i].pixelFormat =3D=3D format) {
> -                 GstStructure *structure =3D gst_structure_new(
> -+#if GST_CHECK_VERSION(1,0,0)
> -+                        "video/x-raw",
> -+                        "format"    , G_TYPE_STRING, gst_video_format_t=
o_string(gst_video_format_from_masks(qt_rgbColorLookup[i].depth,
> -+                                                                       =
          qt_rgbColorLookup[i].bitsPerPixel,
> -+                                                                       =
          qt_rgbColorLookup[i].endianness,
> -+                                                                       =
          qt_rgbColorLookup[i].red,
> -+                                                                       =
          qt_rgbColorLookup[i].green,
> -+                                                                       =
          qt_rgbColorLookup[i].blue,
> -+                                                                       =
          qt_rgbColorLookup[i].alpha)),
> -+#else
> -                         "video/x-raw-rgb",
> -+#endif
> -                         "framerate" , GST_TYPE_FRACTION_RANGE, 0, 1, IN=
T_MAX, 1,
> -                         "width"     , GST_TYPE_INT_RANGE, 1, INT_MAX,
> -                         "height"    , GST_TYPE_INT_RANGE, 1, INT_MAX,
> -@@ -553,6 +632,7 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink =
*base)
> -         }
> -     }
> -=20
> -+//    printf("get Caps %"GST_PTR_FORMAT"\n", caps);
> -     return caps;
> - }
> -=20
> -@@ -592,7 +672,7 @@ gboolean QVideoSurfaceGstSink::set_caps(GstBaseSink =
*base, GstCaps *caps)
> -         sink->lastRequestedCaps =3D 0;
> -=20
> - #ifdef DEBUG_VIDEO_SURFACE_SINK
> --        qDebug() << "Staring video surface, format:";
> -+        qDebug() << "Starting video surface, format:";
> -         qDebug() << format;
> -         qDebug() << "bytesPerLine:" << bytesPerLine;
> - #endif
> -@@ -617,11 +697,49 @@ QVideoSurfaceFormat QVideoSurfaceGstSink::formatFo=
rCaps(GstCaps *caps, int *byte
> -     gst_structure_get_int(structure, "width", &size.rwidth());
> -     gst_structure_get_int(structure, "height", &size.rheight());
> -=20
> -+#if GST_CHECK_VERSION(1, 0, 0)
> -+    GstVideoInfo info;
> -+    gst_video_info_from_caps(&info, caps);
> -+
> -+    if (info.finfo->format =3D=3D GST_VIDEO_FORMAT_I420) {
> -+        int index =3D indexOfYuvColor(GST_VIDEO_FORMAT_I420);
> -+
> -+        if (index !=3D -1) {
> -+            pixelFormat =3D qt_yuvColorLookup[index].pixelFormat;
> -+            bitsPerPixel =3D qt_yuvColorLookup[index].bitsPerPixel;
> -+        }
> -+    } else if (info.finfo->format =3D=3D GST_VIDEO_FORMAT_RGBx) {
> -+        int depth =3D 0;
> -+        int endianness =3D 0;
> -+        int red =3D 0;
> -+        int green =3D 0;
> -+        int blue =3D 0;
> -+        int alpha =3D 0;
> -+
> -+        gst_structure_get_int(structure, "bpp", &bitsPerPixel);
> -+        gst_structure_get_int(structure, "depth", &depth);
> -+        gst_structure_get_int(structure, "endianness", &endianness);
> -+        gst_structure_get_int(structure, "red_mask", &red);
> -+        gst_structure_get_int(structure, "green_mask", &green);
> -+        gst_structure_get_int(structure, "blue_mask", &blue);
> -+        gst_structure_get_int(structure, "alpha_mask", &alpha);
> -+
> -+        int index =3D indexOfRgbColor(bitsPerPixel, depth, endianness, =
red, green, blue, alpha);
> -+        printf("INDEX %x\n", index);
> -+        if (index !=3D -1)
> -+            pixelFormat =3D qt_rgbColorLookup[index].pixelFormat;
> -+    }
> -+#else
> -+
> -     if (qstrcmp(gst_structure_get_name(structure), "video/x-raw-yuv") =
=3D=3D 0) {
> -         guint32 fourcc =3D 0;
> -+#if GST_CHECK_VERSION(1, 0, 0)
> -+        int index =3D indexOfYuvColor(gst_video_format_from_string(gst_=
structure_get_string(structure, "format")));
> -+#else
> -         gst_structure_get_fourcc(structure, "format", &fourcc);
> -=20
> -         int index =3D indexOfYuvColor(fourcc);
> -+#endif
> -         if (index !=3D -1) {
> -             pixelFormat =3D qt_yuvColorLookup[index].pixelFormat;
> -             bitsPerPixel =3D qt_yuvColorLookup[index].bitsPerPixel;
> -@@ -647,6 +765,7 @@ QVideoSurfaceFormat QVideoSurfaceGstSink::formatForC=
aps(GstCaps *caps, int *byte
> -         if (index !=3D -1)
> -             pixelFormat =3D qt_rgbColorLookup[index].pixelFormat;
> -     }
> -+#endif
> -=20
> -     if (pixelFormat !=3D QVideoFrame::Format_Invalid) {
> -         QVideoSurfaceFormat format(size, pixelFormat, handleType);
> -@@ -722,7 +841,11 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
> -=20
> -     poolLock.unlock();
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    GstCaps *intersection =3D gst_caps_intersect(get_caps(GST_BASE_SINK=
(sink), NULL), caps);
> -+#else
> -     GstCaps *intersection =3D gst_caps_intersect(get_caps(GST_BASE_SINK=
(sink)), caps);
> -+#endif
> -=20
> -     if (gst_caps_is_empty (intersection)) {
> -         gst_caps_unref(intersection);
> -@@ -763,7 +886,7 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
> -     QVideoSurfaceFormat surfaceFormat =3D sink->delegate->surfaceFormat=
();
> -=20
> -     if (!pool->isFormatSupported(surfaceFormat)) {
> --        //qDebug() << "sink doesn't support native pool format, skip cu=
stom buffers allocation";
> -+        qDebug() << "sink doesn't support native pool format, skip cust=
om buffers allocation";
> -         return GST_FLOW_OK;
> -     }
> -=20
> -@@ -787,7 +910,6 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
> - gboolean QVideoSurfaceGstSink::start(GstBaseSink *base)
> - {
> -     Q_UNUSED(base);
> --
> -     return TRUE;
> - }
> -=20
> -diff --git a/src/multimedia/gsttools_headers/qgstappsrc_p.h b/src/multim=
edia/gsttools_headers/qgstappsrc_p.h
> -index 4af9252..0e0fc0a 100644
> ---- a/src/multimedia/gsttools_headers/qgstappsrc_p.h
> -+++ b/src/multimedia/gsttools_headers/qgstappsrc_p.h
> -@@ -39,7 +39,10 @@
> -=20
> - #include <gst/gst.h>
> - #include <gst/app/gstappsrc.h>
> -+
> -+#if GST_VERSION_MAJOR < 1
> - #include <gst/app/gstappbuffer.h>
> -+#endif
> -=20
> - QT_BEGIN_NAMESPACE
> -=20
> -diff --git a/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol=
_p.h b/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
> -index 34669b8..0f3b165 100644
> ---- a/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
> -+++ b/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
> -@@ -47,8 +47,11 @@ class QGstreamerAudioProbeControl : public QMediaAudi=
oProbeControl
> - public:
> -     explicit QGstreamerAudioProbeControl(QObject *parent);
> -     virtual ~QGstreamerAudioProbeControl();
> --
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    void bufferProbed(GstBuffer* buffer, GstCaps* caps);
> -+#else
> -     void bufferProbed(GstBuffer* buffer);
> -+#endif
> -=20
> - private slots:
> -     void bufferProbed();
> -diff --git a/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol=
_p.h b/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
> -index 49064f9..fce6309 100644
> ---- a/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
> -+++ b/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
> -@@ -48,7 +48,11 @@ public:
> -     explicit QGstreamerVideoProbeControl(QObject *parent);
> -     virtual ~QGstreamerVideoProbeControl();
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    void bufferProbed(GstBuffer* buffer, GstCaps*);
> -+#else
> -     void bufferProbed(GstBuffer* buffer);
> -+#endif
> -     void startFlushing();
> -     void stopFlushing();
> -=20
> -diff --git a/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h b=
/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
> -index 81e5764..c9fdb5c 100644
> ---- a/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
> -+++ b/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
> -@@ -104,7 +104,11 @@ private slots:
> -     void updateNativeVideoSize();
> -=20
> - private:
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    static GstPadProbeReturn padBufferProbe(GstPad *pad, GstPadProbeInf=
o *info, gpointer user_data);
> -+#else
> -     static void padBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer=
 user_data);
> -+#endif
> -=20
> -     GstElement *m_videoSink;
> -     WId m_windowId;
> -diff --git a/src/multimedia/gsttools_headers/qgstutils_p.h b/src/multime=
dia/gsttools_headers/qgstutils_p.h
> -index 65ff759..6015980 100644
> ---- a/src/multimedia/gsttools_headers/qgstutils_p.h
> -+++ b/src/multimedia/gsttools_headers/qgstutils_p.h
> -@@ -73,7 +73,11 @@ namespace QGstUtils {
> -     QSize capsResolution(const GstCaps *caps);
> -     QSize capsCorrectedResolution(const GstCaps *caps);
> -     QAudioFormat audioFormatForCaps(const GstCaps *caps);
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    QAudioFormat audioFormatForSample(GstSample *sample);
> -+#else
> -     QAudioFormat audioFormatForBuffer(GstBuffer *buffer);
> -+#endif
> -     GstCaps *capsForAudioFormat(QAudioFormat format);
> -     void initializeGst();
> -     QMultimedia::SupportEstimate hasSupport(const QString &mimeType,
> -diff --git a/src/multimedia/gsttools_headers/qgstvideobuffer_p.h b/src/m=
ultimedia/gsttools_headers/qgstvideobuffer_p.h
> -index 1e0fda8..be48820 100644
> ---- a/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
> -+++ b/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
> -@@ -71,6 +71,9 @@ private:
> -     int m_bytesPerLine;
> -     MapMode m_mode;
> -     QVariant m_handle;
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    GstMapInfo m_mapInfo;
> -+#endif
> - };
> -=20
> - QT_END_NAMESPACE
> -diff --git a/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h b/=
src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
> -index 11b305d..01935f7 100644
> ---- a/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
> -+++ b/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
> -@@ -131,7 +131,11 @@ private:
> -=20
> -     static GstStateChangeReturn change_state(GstElement *element, GstSt=
ateChange transition);
> -=20
> --    static GstCaps *get_caps(GstBaseSink *sink);
> -+    static GstCaps *get_caps(GstBaseSink *sink
> -+#if GST_CHECK_VERSION(1,0,0)
> -+                             , GstCaps* /*filterCaps*/
> -+#endif
> -+                            );
> -     static gboolean set_caps(GstBaseSink *sink, GstCaps *caps);
> -=20
> -     static GstFlowReturn buffer_alloc(
> -diff --git a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderse=
rviceplugin.cpp b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoder=
serviceplugin.cpp
> -index 3098aab..9c54663 100644
> ---- a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderservicepl=
ugin.cpp
> -+++ b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderservicepl=
ugin.cpp
> -@@ -74,29 +74,42 @@ void QGstreamerAudioDecoderServicePlugin::updateSupp=
ortedMimeTypes() const
> -     gst_init(NULL, NULL);
> -=20
> -     GList *plugins, *orig_plugins;
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    orig_plugins =3D plugins =3D gst_registry_get_plugin_list (gst_regi=
stry_get());
> -+#else
> -     orig_plugins =3D plugins =3D gst_default_registry_get_plugin_list (=
);
> --
> -+#endif
> -     while (plugins) {
> -         GList *features, *orig_features;
> -=20
> -         GstPlugin *plugin =3D (GstPlugin *) (plugins->data);
> -         plugins =3D g_list_next (plugins);
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
> -+            continue;
> -+#else
> -         if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
> -             continue;
> --
> --        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(gst_registry_get_default (),
> --                                                                       =
 plugin->desc.name);
> -+#endif
> -+        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(gst_registry_get (),
> -+                                                                       =
  gst_plugin_get_name(plugin));
> -         while (features) {
> -             if (!G_UNLIKELY(features->data =3D=3D NULL)) {
> -                 GstPluginFeature *feature =3D GST_PLUGIN_FEATURE(featur=
es->data);
> -                 if (GST_IS_ELEMENT_FACTORY (feature)) {
> -                     GstElementFactory *factory =3D GST_ELEMENT_FACTORY(=
gst_plugin_feature_load(feature));
> -                     if (factory
> --                       && factory->numpadtemplates > 0
> -+                       && gst_element_factory_get_num_pad_templates(fac=
tory) > 0
> -+#if GST_CHECK_VERSION(1,0,0)
> -+                       && (qstrcmp(gst_element_factory_get_metadata(fac=
tory, GST_ELEMENT_METADATA_KLASS), "Codec/Decoder/Audio") =3D=3D 0
> -+                          || qstrcmp(gst_element_factory_get_metadata(f=
actory, GST_ELEMENT_METADATA_KLASS), "Codec/Demux") =3D=3D 0 )
> -+#else
> -                        && (qstrcmp(factory->details.klass, "Codec/Decod=
er/Audio") =3D=3D 0
> --                          || qstrcmp(factory->details.klass, "Codec/Dem=
ux") =3D=3D 0 )) {
> --                        const GList *pads =3D factory->staticpadtemplat=
es;
> -+                           || qstrcmp(factory->details.klass, "Codec/De=
mux") =3D=3D 0 )
> -+#endif
> -+                        ) {
> -+                        const GList *pads =3D gst_element_factory_get_s=
tatic_pad_templates(factory);
> -                         while (pads) {
> -                             GstStaticPadTemplate *padtemplate =3D (GstS=
taticPadTemplate*)(pads->data);
> -                             pads =3D g_list_next (pads);
> -diff --git a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderse=
ssion.cpp b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersessio=
n.cpp
> -index f944a60..72d1cf1 100644
> ---- a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.c=
pp
> -+++ b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.c=
pp
> -@@ -446,21 +446,40 @@ QAudioBuffer QGstreamerAudioDecoderSession::read()
> -         if (buffersAvailable =3D=3D 1)
> -             emit bufferAvailableChanged(false);
> -=20
> -+        const char* bufferData =3D 0;
> -+        int bufferSize =3D 0;
> -+
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        GstSample *sample =3D gst_app_sink_pull_sample(m_appSink);
> -+        GstBuffer *buffer =3D gst_sample_get_buffer(sample);
> -+        GstMapInfo mapInfo;
> -+        gst_buffer_map(buffer, &mapInfo, GST_MAP_READ);
> -+        bufferData =3D (const char*)mapInfo.data;
> -+        bufferSize =3D mapInfo.size;
> -+        QAudioFormat format =3D QGstUtils::audioFormatForSample(sample);
> -+#else
> -         GstBuffer *buffer =3D gst_app_sink_pull_buffer(m_appSink);
> --
> -+        bufferData =3D (const char*)buffer->data;
> -+        bufferSize =3D buffer->size;
> -         QAudioFormat format =3D QGstUtils::audioFormatForBuffer(buffer);
> -+#endif
> -+
> -         if (format.isValid()) {
> -             // XXX At the moment we have to copy data from GstBuffer in=
to QAudioBuffer.
> -             // We could improve performance by implementing QAbstractAu=
dioBuffer for GstBuffer.
> -             qint64 position =3D getPositionFromBuffer(buffer);
> --            audioBuffer =3D QAudioBuffer(QByteArray((const char*)buffer=
->data, buffer->size), format, position);
> -+            audioBuffer =3D QAudioBuffer(QByteArray((const char*)buffer=
Data, bufferSize), format, position);
> -             position /=3D 1000; // convert to milliseconds
> -             if (position !=3D m_position) {
> -                 m_position =3D position;
> -                 emit positionChanged(m_position);
> -             }
> -         }
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        gst_sample_unref(sample);
> -+#else
> -         gst_buffer_unref(buffer);
> -+#endif
> -     }
> -=20
> -     return audioBuffer;
> -@@ -531,7 +550,12 @@ void QGstreamerAudioDecoderSession::addAppSink()
> -=20
> -     GstAppSinkCallbacks callbacks;
> -     memset(&callbacks, 0, sizeof(callbacks));
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    // ### Should perhaps also rename new_buffer to new_sample.
> -+    callbacks.new_sample =3D &new_buffer;
> -+#else
> -     callbacks.new_buffer =3D &new_buffer;
> -+#endif
> -     gst_app_sink_set_callbacks(m_appSink, &callbacks, this, NULL);
> -     gst_app_sink_set_max_buffers(m_appSink, MAX_BUFFERS_IN_QUEUE);
> -     gst_base_sink_set_sync(GST_BASE_SINK(m_appSink), FALSE);
> -@@ -557,8 +581,13 @@ void QGstreamerAudioDecoderSession::updateDuration()
> -     gint64 gstDuration =3D 0;
> -     int duration =3D -1;
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    if (m_playbin && gst_element_query_duration(m_playbin, format, &gst=
Duration))
> -+        duration =3D gstDuration / 1000000;
> -+#else
> -     if (m_playbin && gst_element_query_duration(m_playbin, &format, &gs=
tDuration))
> -         duration =3D gstDuration / 1000000;
> -+#endif
> -=20
> -     if (m_duration !=3D duration) {
> -         m_duration =3D duration;
> -diff --git a/src/plugins/gstreamer/camerabin/camerabinsession.cpp b/src/=
plugins/gstreamer/camerabin/camerabinsession.cpp
> -index 1ed663b..e0c6b50 100644
> ---- a/src/plugins/gstreamer/camerabin/camerabinsession.cpp
> -+++ b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
> -@@ -796,7 +796,11 @@ qint64 CameraBinSession::duration() const
> -         if (fileSink) {
> -             GstFormat format =3D GST_FORMAT_TIME;
> -             gint64 duration =3D 0;
> -+#if GST_CHECK_VERSION(1,0,0)
> -+            bool ret =3D gst_element_query_duration(fileSink, format, &=
duration);
> -+#else
> -             bool ret =3D gst_element_query_position(fileSink, &format, =
&duration);
> -+#endif
> -             gst_object_unref(GST_OBJECT(fileSink));
> -             if (ret)
> -                 return duration / 1000000;
> -@@ -833,8 +837,13 @@ void CameraBinSession::setMetaData(const QMap<QByte=
Array, QVariant> &data)
> -=20
> -     if (m_camerabin) {
> -         GstIterator *elements =3D gst_bin_iterate_all_by_interface(GST_=
BIN(m_camerabin), GST_TYPE_TAG_SETTER);
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        GValue *element =3D 0;
> -+        while (gst_iterator_next(elements, element) =3D=3D GST_ITERATOR=
_OK) {
> -+#else
> -         GstElement *element =3D 0;
> -         while (gst_iterator_next(elements, (void**)&element) =3D=3D GST=
_ITERATOR_OK) {
> -+#endif
> -             gst_tag_setter_reset_tags(GST_TAG_SETTER(element));
> -=20
> -             QMapIterator<QByteArray, QVariant> it(data);
> -@@ -895,7 +904,11 @@ bool CameraBinSession::processSyncMessage(const QGs=
treamerMessage &message)
> -=20
> -     if (gm && GST_MESSAGE_TYPE(gm) =3D=3D GST_MESSAGE_ELEMENT) {
> -         if (m_captureMode =3D=3D QCamera::CaptureStillImage &&
> -+#if GST_CHECK_VERSION(1,0,0)
> -+            gst_message_has_name (gm, "preview-image")) {
> -+#else
> -             gst_structure_has_name(gm->structure, "preview-image")) {
> -+#endif
> -             st =3D gst_message_get_structure(gm);
> -=20
> -             if (gst_structure_has_field_typed(st, "buffer", GST_TYPE_BU=
FFER)) {
> -@@ -905,7 +918,11 @@ bool CameraBinSession::processSyncMessage(const QGs=
treamerMessage &message)
> -=20
> -                     QImage img;
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -                     GstCaps *caps =3D gst_buffer_get_caps(buffer);
> -+#else
> -+                    GstCaps *caps =3D gst_buffer_get_caps(buffer);
> -+#endif
> -                     if (caps) {
> -                         GstStructure *structure =3D gst_caps_get_struct=
ure(caps, 0);
> -                         gint width =3D 0;
> -@@ -1178,7 +1195,11 @@ QList< QPair<int,int> > CameraBinSession::support=
edFrameRates(const QSize &frame
> -         gst_structure_remove_all_fields(structure);
> -         gst_structure_set_value(structure, "framerate", &rate);
> -     }
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    caps =3D gst_caps_simplify(caps);
> -+#else
> -     gst_caps_do_simplify(caps);
> -+#endif
> -=20
> -=20
> -     for (uint i=3D0; i<gst_caps_get_size(caps); i++) {
> -@@ -1298,7 +1319,11 @@ QList<QSize> CameraBinSession::supportedResolutio=
ns(QPair<int,int> rate,
> -         gst_structure_set_value(structure, "width", &w);
> -         gst_structure_set_value(structure, "height", &h);
> -     }
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    caps =3D gst_caps_simplify(caps);
> -+#else
> -     gst_caps_do_simplify(caps);
> -+#endif
> -=20
> -     for (uint i=3D0; i<gst_caps_get_size(caps); i++) {
> -         GstStructure *structure =3D gst_caps_get_structure(caps, i);
> -diff --git a/src/plugins/gstreamer/common.pri b/src/plugins/gstreamer/co=
mmon.pri
> -index 8b421b8..2e7f746 100644
> ---- a/src/plugins/gstreamer/common.pri
> -+++ b/src/plugins/gstreamer/common.pri
> -@@ -12,14 +12,17 @@ LIBS +=3D -lqgsttools_p
> - CONFIG +=3D link_pkgconfig
> -=20
> - PKGCONFIG +=3D \
> --    gstreamer-0.10 \
> --    gstreamer-base-0.10 \
> --    gstreamer-interfaces-0.10 \
> --    gstreamer-audio-0.10 \
> --    gstreamer-video-0.10 \
> --    gstreamer-pbutils-0.10
> -+    gstreamer-$$GST_VERSION \
> -+    gstreamer-base-$$GST_VERSION \
> -+    gstreamer-audio-$$GST_VERSION \
> -+    gstreamer-video-$$GST_VERSION \
> -+    gstreamer-pbutils-$$GST_VERSION
> -=20
> --maemo*:PKGCONFIG +=3Dgstreamer-plugins-bad-0.10
> -+maemo*:PKGCONFIG +=3Dgstreamer-plugins-bad-$$GST_VERSION
> -+
> -+mir: {
> -+    DEFINES +=3D HAVE_MIR
> -+}
> -=20
> - config_resourcepolicy {
> -     DEFINES +=3D HAVE_RESOURCE_POLICY
> -@@ -27,8 +30,8 @@ config_resourcepolicy {
> - }
> -=20
> - config_gstreamer_appsrc {
> --    PKGCONFIG +=3D gstreamer-app-0.10
> -+    PKGCONFIG +=3D gstreamer-app-$$GST_VERSION
> -     DEFINES +=3D HAVE_GST_APPSRC
> --    LIBS +=3D -lgstapp-0.10
> -+    LIBS +=3D -lgstapp-$$GST_VERSION
> - }
> -=20
> -diff --git a/src/plugins/gstreamer/gstreamer.pro b/src/plugins/gstreamer=
/gstreamer.pro
> -index 7649010..fce55ac 100644
> ---- a/src/plugins/gstreamer/gstreamer.pro
> -+++ b/src/plugins/gstreamer/gstreamer.pro
> -@@ -2,11 +2,10 @@ TEMPLATE =3D subdirs
> -=20
> - SUBDIRS +=3D \
> -     audiodecoder \
> --    mediacapture \
> -     mediaplayer
> -=20
> - config_gstreamer_encodingprofiles {
> --    SUBDIRS +=3D camerabin
> -+#    SUBDIRS +=3D camerabin
> - }
> -=20
> - OTHER_FILES +=3D \
> -diff --git a/src/plugins/gstreamer/mediacapture/qgstreamercapturesession=
=2Ecpp b/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
> -index a2bd80d..d12e9a5 100644
> ---- a/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
> -+++ b/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
> -@@ -498,6 +498,11 @@ GstElement *QGstreamerCaptureSession::buildImageCap=
ture()
> -     gst_pad_add_buffer_probe(pad, G_CALLBACK(passImageFilter), this);
> -     gst_object_unref(GST_OBJECT(pad));
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, passImageFilter, =
this);
> -+#else
> -+    gst_pad_add_buffer_probe(pad, G_CALLBACK(passImageFilter), this);
> -+#endif
> -     g_object_set(G_OBJECT(sink), "signal-handoffs", TRUE, NULL);
> -     g_signal_connect(G_OBJECT(sink), "handoff",
> -                      G_CALLBACK(saveImageFilter), this);
> -diff --git a/src/plugins/gstreamer/mediaplayer/mediaplayer.pro b/src/plu=
gins/gstreamer/mediaplayer/mediaplayer.pro
> -index 2ca9377..b986fc7 100644
> ---- a/src/plugins/gstreamer/mediaplayer/mediaplayer.pro
> -+++ b/src/plugins/gstreamer/mediaplayer/mediaplayer.pro
> -@@ -28,4 +28,3 @@ SOURCES +=3D \
> -=20
> - OTHER_FILES +=3D \
> -     mediaplayer.json
> --
> -diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.c=
pp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
> -index fed756a..8239710 100644
> ---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
> -+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
> -@@ -537,6 +537,8 @@ void QGstreamerPlayerControl::processEOS()
> -         m_session->showPrerollFrames(false); // stop showing prerolled =
frames in stop state
> -     }
> -=20
> -+    qWarning() << "Processing EOS!";
> -+
> -     popAndNotifyState();
> - }
> -=20
> -diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.c=
pp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
> -index ddc828e..00bee36 100644
> ---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
> -+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
> -@@ -51,7 +51,11 @@
> - #include <private/qgstreamervideorenderer_p.h>
> -=20
> - #if defined(Q_WS_MAEMO_6) && defined(__arm__)
> --#include "qgstreamergltexturerenderer.h"
> -+#include "private/qgstreamergltexturerenderer.h"
> -+#endif
> -+
> -+#if defined(HAVE_MIR) && defined (__arm__)
> -+#include "private/qgstreamermirtexturerenderer_p.h"
> - #endif
> -=20
> - #include "qgstreamerstreamscontrol.h"
> -@@ -82,6 +86,9 @@ QGstreamerPlayerService::QGstreamerPlayerService(QObje=
ct *parent):
> -=20
> - #if defined(Q_WS_MAEMO_6) && defined(__arm__)
> -     m_videoRenderer =3D new QGstreamerGLTextureRenderer(this);
> -+#elif defined(HAVE_MIR) && defined (__arm__)
> -+    //m_videoRenderer =3D new QGstreamerVideoRenderer(this);
> -+    m_videoRenderer =3D new QGstreamerMirTextureRenderer(this, m_sessio=
n);
> - #else
> -     m_videoRenderer =3D new QGstreamerVideoRenderer(this);
> - #endif
> -diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservicepl=
ugin.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.=
cpp
> -index 7d20b6d..bf2f9f8 100644
> ---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
> -+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
> -@@ -87,7 +87,11 @@ void QGstreamerPlayerServicePlugin::updateSupportedMi=
meTypes() const
> -     gst_init(NULL, NULL);
> -=20
> -     GList *plugins, *orig_plugins;
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    orig_plugins =3D plugins =3D gst_registry_get_plugin_list (gst_regi=
stry_get());
> -+#else
> -     orig_plugins =3D plugins =3D gst_default_registry_get_plugin_list (=
);
> -+#endif
> -=20
> -     while (plugins) {
> -         GList *features, *orig_features;
> -@@ -95,22 +99,33 @@ void QGstreamerPlayerServicePlugin::updateSupportedM=
imeTypes() const
> -         GstPlugin *plugin =3D (GstPlugin *) (plugins->data);
> -         plugins =3D g_list_next (plugins);
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
> -+            continue;
> -+#else
> -         if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
> -             continue;
> -+#endif
> -=20
> --        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(gst_registry_get_default (),
> --                                                                       =
 plugin->desc.name);
> -+        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(gst_registry_get(),
> -+                                                                       =
    gst_plugin_get_name(plugin));
> -         while (features) {
> -             if (!G_UNLIKELY(features->data =3D=3D NULL)) {
> -                 GstPluginFeature *feature =3D GST_PLUGIN_FEATURE(featur=
es->data);
> -                 if (GST_IS_ELEMENT_FACTORY (feature)) {
> -                     GstElementFactory *factory =3D GST_ELEMENT_FACTORY(=
gst_plugin_feature_load(feature));
> -                     if (factory
> --                       && factory->numpadtemplates > 0
> --                       && (qstrcmp(factory->details.klass, "Codec/Decod=
er/Audio") =3D=3D 0
> -+#if GST_CHECK_VERSION(1,0,0)
> -+                        && (qstrcmp(gst_element_factory_get_metadata(fa=
ctory, GST_ELEMENT_METADATA_KLASS), "Codec/Decoder/Audio") =3D=3D 0
> -+                          || qstrcmp(gst_element_factory_get_metadata(f=
actory, GST_ELEMENT_METADATA_KLASS),"Codec/Decoder/Video") =3D=3D 0
> -+                          || qstrcmp(gst_element_factory_get_metadata(f=
actory, GST_ELEMENT_METADATA_KLASS), "Codec/Demux") =3D=3D 0 )
> -+#else
> -+                        && (qstrcmp(factory->details.klass, "Codec/Deco=
der/Audio") =3D=3D 0
> -                           || qstrcmp(factory->details.klass, "Codec/Dec=
oder/Video") =3D=3D 0
> --                          || qstrcmp(factory->details.klass, "Codec/Dem=
ux") =3D=3D 0 )) {
> --                        const GList *pads =3D factory->staticpadtemplat=
es;
> -+                          || qstrcmp(factory->details.klass, "Codec/Dem=
ux") =3D=3D 0 )
> -+#endif
> -+                        ) {
> -+                        const GList *pads =3D gst_element_factory_get_s=
tatic_pad_templates(factory);
> -                         while (pads) {
> -                             GstStaticPadTemplate *padtemplate =3D (GstS=
taticPadTemplate*)(pads->data);
> -                             pads =3D g_list_next (pads);
> -diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.c=
pp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
> -index 15924a6..8013d0d 100644
> ---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
> -+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
> -@@ -85,6 +85,16 @@ typedef enum {
> -     GST_PLAY_FLAG_BUFFERING     =3D 0x000000100
> - } GstPlayFlags;
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+#define DEFAULT_RAW_CAPS \
> -+    "video/x-surface; " \
> -+    "text/plain; " \
> -+    "text/x-pango-markup; " \
> -+    "video/x-dvd-subpicture; " \
> -+    "subpicture/x-pgs" \
> -+    "video/x-raw" \
> -+    "audio/x-raw"
> -+#else
> - #define DEFAULT_RAW_CAPS \
> -     "video/x-raw-yuv; " \
> -     "video/x-raw-rgb; " \
> -@@ -97,6 +107,8 @@ typedef enum {
> -     "text/x-pango-markup; " \
> -     "video/x-dvd-subpicture; " \
> -     "subpicture/x-pgs"
> -+#endif
> -+
> - static GstStaticCaps static_RawCaps =3D GST_STATIC_CAPS(DEFAULT_RAW_CAP=
S);
> -=20
> - QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
> -@@ -137,8 +149,11 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QO=
bject *parent)
> -     gboolean result =3D gst_type_find_register(0, "playlist", GST_RANK_=
MARGINAL, playlistTypeFindFunction, 0, 0, this, 0);
> -     Q_ASSERT(result =3D=3D TRUE);
> -     Q_UNUSED(result);
> --
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    m_playbin =3D gst_element_factory_make("playbin", NULL);
> -+#else
> -     m_playbin =3D gst_element_factory_make("playbin2", NULL);
> -+#endif
> -=20
> -     if (m_playbin) {
> -         //GST_PLAY_FLAG_NATIVE_VIDEO omits configuration of ffmpegcolor=
space and videoscale,
> -@@ -188,7 +203,11 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QO=
bject *parent)
> -     m_videoIdentity =3D GST_ELEMENT(g_object_new(gst_video_connector_ge=
t_type(), 0)); // floating ref
> -     g_signal_connect(G_OBJECT(m_videoIdentity), "connection-failed", G_=
CALLBACK(insertColorSpaceElement), (gpointer)this);
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    m_colorSpace =3D gst_element_factory_make("videoconvert", "ffmpegco=
lorspace-vo");
> -+#else
> -     m_colorSpace =3D gst_element_factory_make("ffmpegcolorspace", "ffmp=
egcolorspace-vo");
> -+#endif
> -     // might not get a parent, take ownership to avoid leak
> -     qt_gst_object_ref_sink(GST_OBJECT(m_colorSpace));
> -=20
> -@@ -206,7 +225,7 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QOb=
ject *parent)
> -=20
> -     // add ghostpads
> -     GstPad *pad =3D gst_element_get_static_pad(m_videoIdentity,"sink");
> --    gst_element_add_pad(GST_ELEMENT(m_videoOutputBin), gst_ghost_pad_ne=
w("videosink", pad));
> -+    gst_element_add_pad(GST_ELEMENT(m_videoOutputBin), gst_ghost_pad_ne=
w("sink", pad));
> -     gst_object_unref(GST_OBJECT(pad));
> -=20
> -     if (m_playbin !=3D 0) {
> -@@ -218,7 +237,7 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QOb=
ject *parent)
> -         g_object_set(G_OBJECT(m_playbin), "video-sink", m_videoOutputBi=
n, NULL);
> -=20
> -         g_signal_connect(G_OBJECT(m_playbin), "notify::source", G_CALLB=
ACK(playbinNotifySource), this);
> --        g_signal_connect(G_OBJECT(m_playbin), "element-added",  G_CALLB=
ACK(handleElementAdded), this);
> -+        //g_signal_connect(G_OBJECT(m_playbin), "element-added",  G_CAL=
LBACK(handleElementAdded), this);
> -=20
> -         if (usePlaybinVolume()) {
> -             updateVolume();
> -@@ -342,9 +361,13 @@ qint64 QGstreamerPlayerSession::position() const
> -     GstFormat   format =3D GST_FORMAT_TIME;
> -     gint64      position =3D 0;
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    if ( m_playbin && gst_element_query_position(m_playbin, format, &po=
sition))
> -+        m_lastPosition =3D position / 1000000;
> -+#else
> -     if ( m_playbin && gst_element_query_position(m_playbin, &format, &p=
osition))
> -         m_lastPosition =3D position / 1000000;
> --
> -+#endif
> -     return m_lastPosition;
> - }
> -=20
> -@@ -474,9 +497,18 @@ bool QGstreamerPlayerSession::isAudioAvailable() co=
nst
> -     return m_audioAvailable;
> - }
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+static GstPadProbeReturn block_pad_cb(GstPad *pad, GstPadProbeInfo *inf=
o, gpointer user_data)
> -+#else
> - static void block_pad_cb(GstPad *pad, gboolean blocked, gpointer user_d=
ata)
> -+#endif
> - {
> -     Q_UNUSED(pad);
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    Q_UNUSED(info);
> -+    Q_UNUSED(user_data);
> -+    return GST_PAD_PROBE_OK;
> -+#else
> - #ifdef DEBUG_PLAYBIN
> -     qDebug() << "block_pad_cb, blocked:" << blocked;
> - #endif
> -@@ -485,6 +517,7 @@ static void block_pad_cb(GstPad *pad, gboolean block=
ed, gpointer user_data)
> -         QGstreamerPlayerSession *session =3D reinterpret_cast<QGstreame=
rPlayerSession*>(user_data);
> -         QMetaObject::invokeMethod(session, "finishVideoOutputChange", Q=
t::QueuedConnection);
> -     }
> -+#endif
> - }
> -=20
> - void QGstreamerPlayerSession::updateVideoRenderer()
> -@@ -529,7 +562,7 @@ void QGstreamerPlayerSession::setVideoRenderer(QObje=
ct *videoOutput)
> -     m_renderer =3D renderer;
> -=20
> - #ifdef DEBUG_VO_BIN_DUMP
> --    _gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
> -+    gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
> -                                   GstDebugGraphDetails(GST_DEBUG_GRAPH_=
SHOW_ALL /* GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE | GST_DEBUG_GRAPH_SHOW_NON_DEFA=
ULT_PARAMS | GST_DEBUG_GRAPH_SHOW_STATES*/),
> -                                   "playbin_set");
> - #endif
> -@@ -633,7 +666,11 @@ void QGstreamerPlayerSession::setVideoRenderer(QObj=
ect *videoOutput)
> -=20
> -         //block pads, async to avoid locking in paused state
> -         GstPad *srcPad =3D gst_element_get_static_pad(m_videoIdentity, =
"src");
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        this->pad_probe_id =3D gst_pad_add_probe(srcPad, (GstPadProbeTy=
pe)(GST_PAD_PROBE_TYPE_BUFFER | GST_PAD_PROBE_TYPE_BLOCK), block_pad_cb, th=
is, NULL);
> -+#else
> -         gst_pad_set_blocked_async(srcPad, true, &block_pad_cb, this);
> -+#endif
> -         gst_object_unref(GST_OBJECT(srcPad));
> -=20
> -         //Unpause the sink to avoid waiting until the buffer is process=
ed
> -@@ -674,7 +711,11 @@ void QGstreamerPlayerSession::finishVideoOutputChan=
ge()
> -         //video output was change back to the current one,
> -         //no need to torment the pipeline, just unblock the pad
> -         if (gst_pad_is_blocked(srcPad))
> -+#if GST_CHECK_VERSION(1,0,0)
> -+            gst_pad_remove_probe(srcPad, this->pad_probe_id);
> -+#else
> -             gst_pad_set_blocked_async(srcPad, false, &block_pad_cb, 0);
> -+#endif
> -=20
> -         m_pendingVideoSink =3D 0;
> -         gst_object_unref(GST_OBJECT(srcPad));
> -@@ -760,12 +801,17 @@ void QGstreamerPlayerSession::finishVideoOutputCha=
nge()
> -=20
> -     //don't have to wait here, it will unblock eventually
> -     if (gst_pad_is_blocked(srcPad))
> --        gst_pad_set_blocked_async(srcPad, false, &block_pad_cb, 0);
> -+#if GST_CHECK_VERSION(1,0,0)
> -+            gst_pad_remove_probe(srcPad, this->pad_probe_id);
> -+#else
> -+            gst_pad_set_blocked_async(srcPad, false, &block_pad_cb, 0);
> -+#endif
> -+
> -     gst_object_unref(GST_OBJECT(srcPad));
> -=20
> - #ifdef DEBUG_VO_BIN_DUMP
> --    _gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
> --                                  GstDebugGraphDetails(GST_DEBUG_GRAPH_=
SHOW_ALL /* GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE | GST_DEBUG_GRAPH_SHOW_NON_DEFA=
ULT_PARAMS | GST_DEBUG_GRAPH_SHOW_STATES*/),
> -+    gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
> -+                                  GstDebugGraphDetails(GST_DEBUG_GRAPH_=
SHOW_ALL /* | GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE | GST_DEBUG_GRAPH_SHOW_NON_DE=
FAULT_PARAMS | GST_DEBUG_GRAPH_SHOW_STATES */),
> -                                   "playbin_finish");
> - #endif
> - }
> -@@ -830,6 +876,7 @@ bool QGstreamerPlayerSession::play()
> - #ifdef DEBUG_PLAYBIN
> -     qDebug() << Q_FUNC_INFO;
> - #endif
> -+
> -     m_everPlayed =3D false;
> -     if (m_playbin) {
> -         m_pendingState =3D QMediaPlayer::PlayingState;
> -@@ -1327,8 +1374,11 @@ void QGstreamerPlayerSession::getStreamsInfo()
> -         default:
> -             break;
> -         }
> --
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        if (tags && GST_IS_TAG_LIST(tags)) {
> -+#else
> -         if (tags && gst_is_tag_list(tags)) {
> -+#endif
> -             gchar *languageCode =3D 0;
> -             if (gst_tag_list_get_string(tags, GST_TAG_LANGUAGE_CODE, &l=
anguageCode))
> -                 streamProperties[QMediaMetaData::Language] =3D QString:=
:fromUtf8(languageCode);
> -@@ -1367,7 +1417,11 @@ void QGstreamerPlayerSession::updateVideoResoluti=
onTag()
> -     QSize aspectRatio;
> -=20
> -     GstPad *pad =3D gst_element_get_static_pad(m_videoIdentity, "src");
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    GstCaps *caps =3D gst_pad_get_current_caps(pad);
> -+#else
> -     GstCaps *caps =3D gst_pad_get_negotiated_caps(pad);
> -+#endif
> -=20
> -     if (caps) {
> -         const GstStructure *structure =3D gst_caps_get_structure(caps, =
0);
> -@@ -1411,7 +1465,11 @@ void QGstreamerPlayerSession::updateDuration()
> -     gint64 gstDuration =3D 0;
> -     int duration =3D -1;
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    if (m_playbin && gst_element_query_duration(m_playbin, format, &gst=
Duration))
> -+#else
> -     if (m_playbin && gst_element_query_duration(m_playbin, &format, &gs=
tDuration))
> -+#endif
> -         duration =3D gstDuration / 1000000;
> -=20
> -     if (m_duration !=3D duration) {
> -@@ -1467,7 +1525,11 @@ void QGstreamerPlayerSession::playbinNotifySource=
(GObject *o, GParamSpec *p, gpo
> -=20
> -     // The rest
> -     if (g_object_class_find_property(G_OBJECT_GET_CLASS(source), "extra=
-headers") !=3D 0) {
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        GstStructure *extras =3D gst_structure_new_empty("extras");
> -+#else
> -         GstStructure *extras =3D gst_structure_empty_new("extras");
> -+#endif
> -=20
> -         foreach (const QByteArray &rawHeader, self->m_request.rawHeader=
List()) {
> -             if (rawHeader =3D=3D userAgentString) // Filter User-Agent
> -@@ -1623,7 +1685,11 @@ GstAutoplugSelectResult QGstreamerPlayerSession::=
handleAutoplugSelect(GstBin *bi
> -     const gchar *factoryName =3D gst_plugin_feature_get_name(GST_PLUGIN=
_FEATURE(factory));
> -     if (g_str_has_prefix(factoryName, "vaapi")) {
> -         GstPad *sinkPad =3D gst_element_get_static_pad(session->m_video=
Sink, "sink");
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        GstCaps *sinkCaps =3D gst_pad_query_caps(sinkPad, NULL);
> -+#else
> -         GstCaps *sinkCaps =3D gst_pad_get_caps(sinkPad);
> -+#endif
> -=20
> - #if (GST_VERSION_MAJOR =3D=3D 0) && ((GST_VERSION_MINOR < 10) || (GST_V=
ERSION_MICRO < 33))
> -         if (!factory_can_src_any_caps(factory, sinkCaps))
> -@@ -1652,14 +1718,19 @@ void QGstreamerPlayerSession::handleElementAdded=
(GstBin *bin, GstElement *elemen
> -         // Disable on-disk buffering.
> -         g_object_set(G_OBJECT(element), "temp-template", NULL, NULL);
> -     } else if (g_str_has_prefix(elementName, "uridecodebin") ||
> --               g_str_has_prefix(elementName, "decodebin2")) {
> --
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        g_str_has_prefix(elementName, "decodebin")) {
> -+#else
> -+        g_str_has_prefix(elementName, "decodebin2")) {
> -+#endif
> -         if (g_str_has_prefix(elementName, "uridecodebin")) {
> -             // Add video/x-surface (VAAPI) to default raw formats
> -             g_object_set(G_OBJECT(element), "caps", gst_static_caps_get=
(&static_RawCaps), NULL);
> -             // listen for uridecodebin autoplug-select to skip VAAPI us=
age when the current
> -             // video sink doesn't support it
> -+#if !(GST_CHECK_VERSION(1,0,0))
> -             g_signal_connect(element, "autoplug-select", G_CALLBACK(han=
dleAutoplugSelect), session);
> -+#endif
> -         }
> -=20
> -         //listen for queue2 element added to uridecodebin/decodebin2 as=
 well.
> -@@ -1727,7 +1798,27 @@ void QGstreamerPlayerSession::removeProbe(QGstrea=
merVideoProbeControl* probe)
> -     // Assume user releases any outstanding references to video frames.
> - }
> -=20
> --gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstB=
uffer *buffer, gpointer user_data)
> -+#if GST_CHECK_VERSION(1,0,0)
> -+GstPadProbeReturn QGstreamerPlayerSession::padVideoBufferProbe(GstPad *=
pad, GstPadProbeInfo *info, gpointer user_data)
> -+{
> -+    Q_UNUSED(pad);
> -+    GstBuffer* buffer =3D GST_PAD_PROBE_INFO_BUFFER(info);
> -+
> -+    QGstreamerPlayerSession *session =3D reinterpret_cast<QGstreamerPla=
yerSession*>(user_data);
> -+    QMutexLocker locker(&session->m_videoProbeMutex);
> -+
> -+    if (session->m_videoProbes.isEmpty())
> -+        return GST_PAD_PROBE_OK;
> -+
> -+    foreach (QGstreamerVideoProbeControl* probe, session->m_videoProbes)
> -+        probe->bufferProbed(buffer, gst_pad_get_current_caps(pad));
> -+
> -+    return GST_PAD_PROBE_OK;
> -+}
> -+
> -+#else
> -+
> -+static gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pa=
d, GstBuffer *buffer, gpointer user_data)
> - {
> -     Q_UNUSED(pad);
> -=20
> -@@ -1742,6 +1833,7 @@ gboolean QGstreamerPlayerSession::padVideoBufferPr=
obe(GstPad *pad, GstBuffer *bu
> -=20
> -     return TRUE;
> - }
> -+#endif
> -=20
> - void QGstreamerPlayerSession::addProbe(QGstreamerAudioProbeControl* pro=
be)
> - {
> -@@ -1759,6 +1851,24 @@ void QGstreamerPlayerSession::removeProbe(QGstrea=
merAudioProbeControl* probe)
> -     m_audioProbes.removeOne(probe);
> - }
> -=20
> -+#if GST_CHECK_VERSION(1,0,0)
> -+GstPadProbeReturn  QGstreamerPlayerSession::padAudioBufferProbe(GstPad =
*pad, GstPadProbeInfo* info, gpointer user_data)
> -+{
> -+    Q_UNUSED(pad);
> -+    GstBuffer* buffer =3D GST_PAD_PROBE_INFO_BUFFER(info);
> -+
> -+    QGstreamerPlayerSession *session =3D reinterpret_cast<QGstreamerPla=
yerSession*>(user_data);
> -+    QMutexLocker locker(&session->m_audioProbeMutex);
> -+
> -+    if (session->m_audioProbes.isEmpty())
> -+        return GST_PAD_PROBE_OK;
> -+
> -+    foreach (QGstreamerAudioProbeControl* probe, session->m_audioProbes)
> -+        probe->bufferProbed(buffer, gst_pad_get_current_caps(pad));
> -+
> -+    return GST_PAD_PROBE_OK;
> -+}
> -+#else
> - gboolean QGstreamerPlayerSession::padAudioBufferProbe(GstPad *pad, GstB=
uffer *buffer, gpointer user_data)
> - {
> -     Q_UNUSED(pad);
> -@@ -1774,7 +1884,7 @@ gboolean QGstreamerPlayerSession::padAudioBufferPr=
obe(GstPad *pad, GstBuffer *bu
> -=20
> -     return TRUE;
> - }
> --
> -+#endif
> - // This function is similar to stop(),
> - // but does not set m_everPlayed, m_lastPosition,
> - // and setSeekable() values.
> -@@ -1807,7 +1917,11 @@ void QGstreamerPlayerSession::removeVideoBufferPr=
obe()
> -=20
> -     GstPad *pad =3D gst_element_get_static_pad(m_videoSink, "sink");
> -     if (pad) {
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        gst_pad_remove_probe(pad, m_videoBufferProbeId);
> -+#else
> -         gst_pad_remove_buffer_probe(pad, m_videoBufferProbeId);
> -+#endif
> -         gst_object_unref(GST_OBJECT(pad));
> -     }
> -=20
> -@@ -1822,7 +1936,11 @@ void QGstreamerPlayerSession::addVideoBufferProbe=
()
> -=20
> -     GstPad *pad =3D gst_element_get_static_pad(m_videoSink, "sink");
> -     if (pad) {
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        m_videoBufferProbeId =3D gst_pad_add_probe(pad, GST_PAD_PROBE_T=
YPE_BUFFER, padVideoBufferProbe, this, NULL);
> -+#else
> -         m_videoBufferProbeId =3D gst_pad_add_buffer_probe(pad, G_CALLBA=
CK(padVideoBufferProbe), this);
> -+#endif
> -         gst_object_unref(GST_OBJECT(pad));
> -     }
> - }
> -@@ -1839,7 +1957,11 @@ void QGstreamerPlayerSession::removeAudioBufferPr=
obe()
> -=20
> -     GstPad *pad =3D gst_element_get_static_pad(m_audioSink, "sink");
> -     if (pad) {
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        gst_pad_remove_probe(pad, m_audioBufferProbeId);
> -+#else
> -         gst_pad_remove_buffer_probe(pad, m_audioBufferProbeId);
> -+#endif
> -         gst_object_unref(GST_OBJECT(pad));
> -     }
> -=20
> -@@ -1854,7 +1976,11 @@ void QGstreamerPlayerSession::addAudioBufferProbe=
()
> -=20
> -     GstPad *pad =3D gst_element_get_static_pad(m_audioSink, "sink");
> -     if (pad) {
> -+#if GST_CHECK_VERSION(1,0,0)
> -+        m_audioBufferProbeId =3D gst_pad_add_probe(pad, GST_PAD_PROBE_T=
YPE_BUFFER, padAudioBufferProbe, this, NULL);
> -+#else
> -         m_audioBufferProbeId =3D gst_pad_add_buffer_probe(pad, G_CALLBA=
CK(padAudioBufferProbe), this);
> -+#endif
> -         gst_object_unref(GST_OBJECT(pad));
>       }
> - }
> -@@ -1887,7 +2013,7 @@ void QGstreamerPlayerSession::playlistTypeFindFunc=
tion(GstTypeFind *find, gpoint
> -         length =3D qMin(length, guint64(1024));
> -=20
> -     while (length > 0) {
> --        guint8 *data =3D gst_type_find_peek(find, 0, length);
> -+        const guint8 *data =3D gst_type_find_peek(find, 0, length);
> -         if (data) {
> -             session->m_isPlaylist =3D (QPlaylistFileParser::findPlaylis=
tType(QString::fromUtf8(uri), 0, data, length) !=3D QPlaylistFileParser::UN=
KNOWN);
> -             return;
> -diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h=
 b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
> -index f2e760a..50bda3d 100644
> ---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
> -+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
> -@@ -119,11 +119,19 @@ public:
> -=20
> -     void addProbe(QGstreamerVideoProbeControl* probe);
> -     void removeProbe(QGstreamerVideoProbeControl* probe);
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    static GstPadProbeReturn padVideoBufferProbe(GstPad *pad, GstPadPro=
beInfo *info, gpointer user_data);
> -+#else
> -     static gboolean padVideoBufferProbe(GstPad *pad, GstBuffer *buffer,=
 gpointer user_data);
> -+#endif
> -=20
> -     void addProbe(QGstreamerAudioProbeControl* probe);
> -     void removeProbe(QGstreamerAudioProbeControl* probe);
> -+#if GST_CHECK_VERSION(1,0,0)
> -+    static GstPadProbeReturn padAudioBufferProbe(GstPad *pad, GstPadPro=
beInfo* info, gpointer user_data);
> -+#else
> -     static gboolean padAudioBufferProbe(GstPad *pad, GstBuffer *buffer,=
 gpointer user_data);
> -+#endif
>  =20
> -     void endOfMediaReset();
> -=20
> -@@ -252,6 +260,7 @@ private:
> -     bool m_isLiveSource;
> -=20
> -     bool m_isPlaylist;
> -+    gulong pad_probe_id;
> - };
> -=20
> - QT_END_NAMESPACE
> +     qtCompileTest(resourcepolicy)
>  --=20
> -2.3.5
> +2.4.2
> =20
> diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultim=
edia_git.bb
> index bab9bee..5c05145 100644
> --- a/recipes-qt/qt5/qtmultimedia_git.bb
> +++ b/recipes-qt/qt5/qtmultimedia_git.bb
> @@ -4,9 +4,9 @@ require qt5-git.inc
>  # There are no LGPLv3-only licensed files in this component.
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> @@ -30,8 +30,4 @@ EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGE=
CONFIG', 'gstreamer010', 'G
>  # Disable GStreamer if completely disabled
>  EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains_any('PACKAGECONFIG', 'gst=
reamer gstreamer010', '', 'CONFIG+=3Ddone_config_gstreamer', d)}"
> =20
> -SRC_URI +=3D "\
> -    file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
> -"
> -
> -SRCREV =3D "cc0569a038f6116df559508518b6dacb15be8520"
> +SRCREV =3D "3f15c1b17e55b5b118d11621f85fa74f7cc74ae6"
> diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git=
=2Ebb
> index 928963b..25e9260 100644
> --- a/recipes-qt/qt5/qtquick1_git.bb
> +++ b/recipes-qt/qt5/qtquick1_git.bb
> @@ -6,14 +6,14 @@ require qt5-git.inc
>  # Note that some files are LGPL-2.1 only without Digia-Qt-LGPL-Exception=
-1.1.
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c330f12cc8ed \
> +    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
>  "
> =20
>  DEPENDS +=3D "qtscript qtsvg qtxmlpatterns qtwebkit"
>  # qttools
> =20
> -SRCREV =3D "ba0708a75784a92aee9523b7ee925ece18c69812"
> +SRCREV =3D "eb3c45a5a6a84bd02cac2f5254ef56c3fe2536e8"
> diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtqui=
ckcontrols_git.bb
> index af11119..51db1ae 100644
> --- a/recipes-qt/qt5/qtquickcontrols_git.bb
> +++ b/recipes-qt/qt5/qtquickcontrols_git.bb
> @@ -3,15 +3,13 @@ require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0) | GPL-2.0"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c330f12cc8ed \
> +    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
>  "
> =20
>  DEPENDS +=3D "qtdeclarative"
> =20
>  RDEPENDS_${PN}-dev =3D ""
> =20
> -SRCREV =3D "093312f5f306db8fcb1028f62bd3061aa63ef732"
> +SRCREV =3D "32ac38930c7a5183d6ce7f88d7008c9c45b2c94b"
> diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git=
=2Ebb
> index 5751e20..a54deb8 100644
> --- a/recipes-qt/qt5/qtscript_git.bb
> +++ b/recipes-qt/qt5/qtscript_git.bb
> @@ -5,9 +5,9 @@ require qt5-git.inc
>  # Note that some files are LGPL-2.1 only without Digia-Qt-LGPL-Exception=
-1.1.
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> @@ -25,4 +25,4 @@ ARM_INSTRUCTION_SET =3D "arm"
> =20
>  DEPENDS +=3D "qtbase"
> =20
> -SRCREV =3D "eb08742e8f874b8dab209c1cfe840c534c68ca3b"
> +SRCREV =3D "2724355d3a1029168e19162e1d1b10dd3f98dc89"
> diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_g=
it.bb
> index ec33355..02688a6 100644
> --- a/recipes-qt/qt5/qtsensors_git.bb
> +++ b/recipes-qt/qt5/qtsensors_git.bb
> @@ -5,13 +5,13 @@ require qt5-git.inc
>  # There are no GPLv2 licensed files in this component.
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c330f12cc8ed \
> +    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
>  "
> =20
>  DEPENDS +=3D "qtbase qtdeclarative"
> =20
> -SRCREV =3D "40e5aff5318701b31e712cc352483b227f61a6a4"
> +SRCREV =3D "414c0a82944bcf1bd4763f343b85abb0d8eb2f2d"
> diff --git a/recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-in=
stances.patch b/recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-i=
nstances.patch
> deleted file mode 100644
> index e6b6194..0000000
> --- a/recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-instances=
=2Epatch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 6444a156db8b7d0ec367b8edc87c82acd0898698 Mon Sep 17 00:00:00 2001
> -From: Jonathan Liu <net147@gmail.com>
> -Date: Mon, 9 Mar 2015 22:35:56 +1100
> -Subject: [PATCH] Unix: Clear serial_struct instances
> -
> -Silences the following Valgrind warning:
> -Conditional jump or move depends on uninitialised value(s)
> -
> -Upstream-Status: Backport from 5.5 branch
> -
> -Change-Id: I8fd8cfd6aa6f75ed515e6151cfc282faca508bdc
> -Reviewed-by: Denis Shienkov <denis.shienkov@gmail.com>
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> ----
> - src/serialport/qserialport_unix.cpp | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/serialport/qserialport_unix.cpp b/src/serialport/qseria=
lport_unix.cpp
> -index cda73b2..62c454c 100644
> ---- a/src/serialport/qserialport_unix.cpp
> -+++ b/src/serialport/qserialport_unix.cpp
> -@@ -451,6 +451,8 @@ QSerialPortPrivate::setStandardBaudRate(qint32 baudR=
ate, QSerialPort::Directions
> - {
> -     struct serial_struct currentSerialInfo;
> -=20
> -+    ::memset(&currentSerialInfo, 0, sizeof(currentSerialInfo));
> -+
> -     if ((::ioctl(descriptor, TIOCGSERIAL, &currentSerialInfo) !=3D -1)
> -             && (currentSerialInfo.flags & ASYNC_SPD_CUST)) {
> -         currentSerialInfo.flags &=3D ~ASYNC_SPD_CUST;
> -@@ -481,6 +483,8 @@ QSerialPortPrivate::setCustomBaudRate(qint32 baudRat=
e, QSerialPort::Directions d
> -=20
> -     struct serial_struct currentSerialInfo;
> -=20
> -+    ::memset(&currentSerialInfo, 0, sizeof(currentSerialInfo));
> -+
> -     if (::ioctl(descriptor, TIOCGSERIAL, &currentSerialInfo) =3D=3D -1)
> -         return decodeSystemError();
> -=20
> ---=20
> -2.4.2
> -
> diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserial=
port_git.bb
> index c59eef6..5f41974 100644
> --- a/recipes-qt/qt5/qtserialport_git.bb
> +++ b/recipes-qt/qt5/qtserialport_git.bb
> @@ -5,17 +5,13 @@ require qt5-git.inc
>  # other qt* components use :/
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c330f12cc8ed \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3Deb6c371255e1262c55ae9b652a90b528 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3Dbb426f3367c4805d1e12fad05bd0b750 \
>      file://LICENSE.FDL;md5=3D3801d7932fdc07fd9efe89f9854a6caa \
> -"
> -
> -SRC_URI +=3D " \
> -    file://0001-Unix-Clear-serial_struct-instances.patch \
> +    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
>  "
> =20
>  DEPENDS +=3D "qtbase"
> =20
> -SRCREV =3D "e257bdc9aae5583b187bafb5e69e4a6143e3bf4e"
> +SRCREV =3D "d9ab9258ca81650a914357d53e7f92f293d4ef81"
> diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
> index 1dce8c6..6350e97 100644
> --- a/recipes-qt/qt5/qtsvg_git.bb
> +++ b/recipes-qt/qt5/qtsvg_git.bb
> @@ -4,12 +4,12 @@ require qt5-git.inc
>  # There are no LGPLv3-only licensed files in this component.
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
>  DEPENDS +=3D "qtbase"
> =20
> -SRCREV =3D "ccae23961e65b81b3c16a45d4e186e1e5657a2f6"
> +SRCREV =3D "ae3990fbf41039c78066c8440c654936365d9404"
> diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_g=
it.bb
> index edc0360..781cd38 100644
> --- a/recipes-qt/qt5/qtsystems_git.bb
> +++ b/recipes-qt/qt5/qtsystems_git.bb
> @@ -28,6 +28,6 @@ do_install_append() {
>  QT_MODULE_BRANCH =3D "dev"
> =20
>  # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-be=
ta1
> -# qt5-git PV is only to indicate that this recipe is compatible with qt5=
 5.4
> +# qt5-git PV is only to indicate that this recipe is compatible with qt5=
 5.5
> =20
> -SRCREV =3D "37b614abbfb35d06a57e5b0824249c3abd5640e3"
> +SRCREV =3D "4e3a7ed3ef5226256ae6aee1a73e264768aac8f4"
> diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttool=
s-native_git.bb
> index 13e1b79..cb78697 100644
> --- a/recipes-qt/qt5/qttools-native_git.bb
> +++ b/recipes-qt/qt5/qttools-native_git.bb
> @@ -2,9 +2,9 @@ DEPENDS =3D "qtbase-native"
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dd87ae0d200af76dca730d911474cbe5b \
> -    file://LICENSE.LGPLv3;md5=3Dffcfac38a32c9ebdb8ff768fa1702478 \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> @@ -13,8 +13,6 @@ QT_MODULE =3D "qttools"
>  require qt5-native.inc
>  require qt5-git.inc
> =20
> -SRC_URI +=3D "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.=
patch"
> -
>  do_configure() {
>      ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=3Dlinguis=
tonly
>  }
> @@ -23,4 +21,4 @@ do_install() {
>      oe_runmake install INSTALL_ROOT=3D${D}
>  }
> =20
> -SRCREV =3D "a6ed9b418d1b4464f088b378e5bdb96ec420db6c"
> +SRCREV =3D "33c65366a7c3901d2aecfde3dbc485e1eac5c10c"
> diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lup=
date-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrele=
ase-lupdate-lconvert.patch
> index 285ae85..ab08fc0 100644
> --- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lc=
onvert.patch
> +++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lc=
onvert.patch
> @@ -1,4 +1,4 @@
> -From b19c4a2f723525b995ef5b47db0e725a2bb9ab20 Mon Sep 17 00:00:00 2001
> +From 5d1c8cdf5d448d5b3f719447dae3a59340348d2e Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.jansa@gmail.com>
>  Date: Wed, 11 Sep 2013 18:30:08 +0200
>  Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
> @@ -12,10 +12,10 @@ Upstream-Status: Pending
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  ---
>   examples/examples.pro     |  3 ++-
> - src/designer/src/src.pro  | 16 +++++++++-------
> + src/designer/src/src.pro  | 18 ++++++++++--------
>   src/linguist/linguist.pro |  2 +-
>   src/src.pro               | 14 ++++++++------
> - tests/auto/auto.pro       | 24 +++++++++++++-----------
> + tests/auto/auto.pro       | 22 ++++++++++++----------
>   5 files changed, 33 insertions(+), 26 deletions(-)
> =20
>  diff --git a/examples/examples.pro b/examples/examples.pro
> @@ -30,19 +30,21 @@ index 69365d1..da7b38b 100644
>  =20
>   winrt: SUBDIRS -=3D assistant designer
>  diff --git a/src/designer/src/src.pro b/src/designer/src/src.pro
> -index e02ca8e..49527c5 100644
> +index 6915e34..3ff2eca 100644
>  --- a/src/designer/src/src.pro
>  +++ b/src/designer/src/src.pro
> -@@ -1,18 +1,20 @@
> +@@ -1,13 +1,15 @@
>   TEMPLATE =3D subdirs
>  =20
>  -SUBDIRS =3D \
> +-    uiplugin \
>  -    uitools \
>  -    lib \
>  -    components \
>  -    designer
>  +!linguistonly {
>  +    SUBDIRS =3D \
> ++        uiplugin \
>  +        lib \
>  +        components \
>  +        designer
> @@ -52,7 +54,9 @@ index e02ca8e..49527c5 100644
>  -contains(QT_CONFIG, shared): SUBDIRS +=3D plugins
>  +!linguistonly:contains(QT_CONFIG, shared): SUBDIRS +=3D plugins
>  =20
> - components.depends =3D lib
> + uitools.depends =3D uiplugin
> + lib.depends =3D uiplugin
> +@@ -15,7 +17,7 @@ components.depends =3D lib
>   designer.depends =3D components
>   plugins.depends =3D lib
>  =20
> @@ -75,7 +79,7 @@ index 3a70580..a977878 100644
>   qtNomakeTools( \
>       linguist \
>  diff --git a/src/src.pro b/src/src.pro
> -index 722b32e..9453152 100644
> +index 494898f..c02848d 100644
>  --- a/src/src.pro
>  +++ b/src/src.pro
>  @@ -4,10 +4,12 @@ qtHaveModule(widgets) {
> @@ -91,15 +95,15 @@ index 722b32e..9453152 100644
>  +                  qtestlib
>  +        }
>  +        SUBDIRS +=3D designer
> - #    unix:!mac:!embedded:!qpa:SUBDIRS +=3D qtconfig
>  =20
>           linguist.depends =3D designer
> +     }
>  @@ -15,7 +17,7 @@ qtHaveModule(widgets) {
> - }
>  =20
> - SUBDIRS +=3D linguist
> + SUBDIRS +=3D linguist \
> +     qtplugininfo
>  -if(!android|android_app):!ios: SUBDIRS +=3D qtpaths
> -+if(!android|android_app):!linguistonly:!ios: SUBDIRS +=3D qtpaths
> ++if(!android|android_app):!ios:!linguistonly: SUBDIRS +=3D qtpaths
>  =20
>   mac {
>       SUBDIRS +=3D macdeployqt
> @@ -118,14 +122,13 @@ index 722b32e..9453152 100644
>   qtNomakeTools( \
>       pixeltool \
>  diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
> -index df240e3..27ee687 100644
> +index a703a06..44bae18 100644
>  --- a/tests/auto/auto.pro
>  +++ b/tests/auto/auto.pro
> -@@ -1,15 +1,17 @@
> +@@ -1,14 +1,16 @@
>   TEMPLATE=3Dsubdirs
>  -SUBDIRS=3D\
>  -    linguist \
> --    host.pro \
>  -    qhelpcontentmodel \
>  -    qhelpenginecore \
>  -    qhelpgenerator \
> @@ -137,7 +140,6 @@ index df240e3..27ee687 100644
>  +!linguistonly {
>  +    SUBDIRS=3D\
>  +        linguist \
> -+        host.pro \
>  +        qhelpcontentmodel \
>  +        qhelpenginecore \
>  +        qhelpgenerator \
> diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-de=
pendent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-li=
nking-of-dependent-libraries.patch
> index 0f016c2..7177652 100644
> --- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent=
-libraries.patch
> +++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent=
-libraries.patch
> @@ -1,4 +1,4 @@
> -From 0805ac8c2c9f81643df211970666c15eac80cfb8 Mon Sep 17 00:00:00 2001
> +From b0f96a829a7a04400f6a8b6cb14756db175c8e03 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
>  Date: Fri, 17 Jan 2014 14:33:19 +0100
>  Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
> diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.pat=
ch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
> index bbd338a..0c3842e 100644
> --- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
> +++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
> @@ -1,4 +1,4 @@
> -From 594d23ecc0f62e6a0ebfcb7b9cb879435211420a Mon Sep 17 00:00:00 2001
> +From a4438a8c93e9846f1057dd7a21cbb41183440ec1 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
>  Date: Wed, 4 Jun 2014 11:28:16 +0200
>  Subject: [PATCH 3/3] add noqtwebkit configuration
> @@ -16,24 +16,24 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>   2 files changed, 3 insertions(+), 3 deletions(-)
> =20
>  diff --git a/src/assistant/assistant/assistant.pro b/src/assistant/assis=
tant/assistant.pro
> -index 6e82b07..56df78c 100644
> +index ef5c595..9c2dc1c 100644
>  --- a/src/assistant/assistant/assistant.pro
>  +++ b/src/assistant/assistant/assistant.pro
>  @@ -1,4 +1,4 @@
>  -qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
>  +qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONF=
IG, noqtwebkit) {
> -     QT +=3D webkitwidgets
> +     BROWSER =3D qtwebkit
>   } else {
> -     DEFINES +=3D QT_NO_WEBKIT
> -@@ -71,7 +71,7 @@ SOURCES +=3D aboutdialog.cpp \
> -     openpageswidget.cpp \
> +     BROWSER =3D qtextbrowser
> +@@ -75,7 +75,7 @@ SOURCES +=3D aboutdialog.cpp \
>       openpagesmanager.cpp \
>       openpagesswitcher.cpp
> --qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
> -+qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONF=
IG, noqtwebkit) {
> +=20
> +-equals(BROWSER, "qtwebkit") {
> ++equals(BROWSER, "qtwebkit"):!contains(CONFIG, noqtwebkit) {
> +     DEFINES +=3D BROWSER_QTWEBKIT
> +     QT +=3D webkitwidgets
>       SOURCES +=3D helpviewer_qwv.cpp
> - } else {
> -     SOURCES +=3D helpviewer_qtb.cpp
>  diff --git a/src/designer/src/plugins/plugins.pro b/src/designer/src/plu=
gins/plugins.pro
>  index 500a153..b60fa2d 100644
>  --- a/src/designer/src/plugins/plugins.pro
> diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
> index a4f63c7..afc8984 100644
> --- a/recipes-qt/qt5/qttools_git.bb
> +++ b/recipes-qt/qt5/qttools_git.bb
> @@ -3,9 +3,9 @@ require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dd87ae0d200af76dca730d911474cbe5b \
> -    file://LICENSE.LGPLv3;md5=3Dffcfac38a32c9ebdb8ff768fa1702478 \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> @@ -24,4 +24,4 @@ PACKAGECONFIG[qtwebkit] =3D ",,qtwebkit"
> =20
>  EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'qtwebkit', =
'', 'CONFIG+=3Dnoqtwebkit', d)}"
> =20
> -SRCREV =3D "a6ed9b418d1b4464f088b378e5bdb96ec420db6c"
> +SRCREV =3D "33c65366a7c3901d2aecfde3dbc485e1eac5c10c"
> diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttran=
slations_git.bb
> index 9341453..10ec1aa 100644
> --- a/recipes-qt/qt5/qttranslations_git.bb
> +++ b/recipes-qt/qt5/qttranslations_git.bb
> @@ -3,9 +3,9 @@ require qt5-git.inc
> =20
>  LICENSE =3D "(LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>  "
> =20
>  DEPENDS +=3D "qtbase qttools-native"
> @@ -93,4 +93,4 @@ FILES_${PN}-qt =3D " \
>      ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
>  "
> =20
> -SRCREV =3D "f76e5c98b0c426ffed95443e45041c3c0deab0c6"
> +SRCREV =3D "5e65c6fcdbbc75040426c8239c686f7b1ea689fd"
> diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwa=
yland-native_git.bb
> index d03fb48..330473e 100644
> --- a/recipes-qt/qt5/qtwayland-native_git.bb
> +++ b/recipes-qt/qt5/qtwayland-native_git.bb
> @@ -4,9 +4,9 @@ require qt5-git.inc
>  # There are no LGPLv3-only licensed files in this component.
>  LICENSE =3D "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPL;md5=3D4193e7f1d47a858f6b7c0f1ee66161de \
> -    file://LICENSE.GPL;md5=3Dd32239bcb673463ab874e80d47fae504 \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> @@ -26,4 +26,4 @@ do_install() {
>      oe_runmake install INSTALL_ROOT=3D${D}
>  }
> =20
> -SRCREV =3D "182488129c3f6a67a7e781fdb7c0147777191991"
> +SRCREV =3D "0e4e0a7c6be2928cc4300c8ef41d10ed8b3b316c"
> diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-t=
ool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qt=
waylandscanner-tool-to-the-native-side.patch
> index c1bf3bd..97326d3 100644
> --- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-=
the-native-side.patch
> +++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-=
the-native-side.patch
> @@ -1,4 +1,4 @@
> -From be0881386edac8c39b5362d4efc4a05acb3e76c1 Mon Sep 17 00:00:00 2001
> +From 5d3dbd14e72724f4cbffe79b82d5055d19094437 Mon Sep 17 00:00:00 2001
>  From: Simon Busch <morphis@gravedo.de>
>  Date: Fri, 19 Jul 2013 13:35:14 +0000
>  Subject: [PATCH] Install the qtwaylandscanner tool to the native side
> diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-serve=
r-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayla=
nd-include-server-buffer-only-when-bui.patch
> index 7588b2f..714e100 100644
> --- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffe=
r-only-when-bui.patch
> +++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffe=
r-only-when-bui.patch
> @@ -1,8 +1,8 @@
> -From b7520d76235cea2e546e217052baf1c9324a261d Mon Sep 17 00:00:00 2001
> +From f47f46bb3ea3a01967f0a4beab72e16e5e603fdf Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Sat, 22 Feb 2014 17:47:44 +0100
> -Subject: [PATCH 1/2] examples/wayland: include server-buffer only when
> - building with opengles2
> +Subject: [PATCH] examples/wayland: include server-buffer only when build=
ing
> + with opengles2
> =20
>  * it's using glBindBuffer in
>    server-buffer/client/serverbufferrenderer.cpp
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_g=
it.bb
> index 0be7afe..361b54a 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -4,9 +4,9 @@ require qt5-git.inc
>  # There are no LGPLv3-only licensed files in this component.
>  LICENSE =3D "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPL;md5=3D4193e7f1d47a858f6b7c0f1ee66161de \
> -    file://LICENSE.GPL;md5=3Dd32239bcb673463ab874e80d47fae504 \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> @@ -37,7 +37,7 @@ SRC_URI +=3D " \
>      file://0001-examples-wayland-include-server-buffer-only-when-bui.pat=
ch \
>  "
> =20
> -QT_VERSION ?=3D "5.4.3"
> +QT_VERSION ?=3D "5.5.0"
> =20
>  do_install_append() {
>      # do install files created by qtwaylandscanner
> @@ -45,4 +45,4 @@ do_install_append() {
>      install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private=
/*protocol*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/Qt=
Compositor/private
>  }
> =20
> -SRCREV =3D "182488129c3f6a67a7e781fdb7c0147777191991"
> +SRCREV =3D "0e4e0a7c6be2928cc4300c8ef41d10ed8b3b316c"
> diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebcha=
nnel_git.bb
> index 8433652..236eb47 100644
> --- a/recipes-qt/qt5/qtwebchannel_git.bb
> +++ b/recipes-qt/qt5/qtwebchannel_git.bb
> @@ -5,12 +5,12 @@ require qt5-git.inc
>  # There are no GPLv2 licensed files in this component.
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c330f12cc8ed \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
>  "
> =20
>  DEPENDS +=3D "qtdeclarative qtwebsockets"
> =20
> -SRCREV =3D "7b5da1d3dd561bc871e7ab4bf8644d33f60d5793"
> +SRCREV =3D "b0fb9dcb63e21c197417164e6067086426f1d4c6"
> diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-a=
tomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-b=
ase.gypi-include-atomicops_internals_x86_g.patch
> index 64670f0..32e8f87 100644
> --- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicop=
s_internals_x86_g.patch
> +++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicop=
s_internals_x86_g.patch
> @@ -1,4 +1,4 @@
> -From 59e305219cdaeac6d143cb0466a2f518b4050688 Mon Sep 17 00:00:00 2001
> +From d1dfff21428643488790926bde3d699d64746f19 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Fri, 3 Oct 2014 03:52:11 +0200
>  Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_g=
cc.cc
> @@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/src/3rdparty/chromium/base/base.gypi b/src/3rdparty/chromiu=
m/base/base.gypi
> -index a5a990a..af30cfa 100644
> +index a5a285a..f1cad86 100644
>  --- a/src/3rdparty/chromium/base/base.gypi
>  +++ b/src/3rdparty/chromium/base/base.gypi
> -@@ -745,7 +745,7 @@
> +@@ -759,7 +759,7 @@
>                   ['include', '^nix/'],
>                 ],
>             }],
> diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QM=
AKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.=
prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
> index 447552e..e8a2bab 100644
> --- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT=
_CPP-or-QMAKE_EXT.patch
> +++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT=
_CPP-or-QMAKE_EXT.patch
> @@ -1,7 +1,7 @@
> -From 6e468c814087bac6ff88a1d7d02549e6cf8a152c Mon Sep 17 00:00:00 2001
> +From 42b7e38e8d6fd36976a984edb40f947923d78d2c Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Mon, 30 Jun 2014 20:08:17 +0200
> -Subject: [PATCH 1/4] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_E=
XT_H
> +Subject: [PATCH 1/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_E=
XT_H
>   anywhere in path, but at the end
> =20
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> @@ -10,17 +10,18 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>   1 file changed, 2 insertions(+), 2 deletions(-)
> =20
>  diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mk=
specs/features/functions.prf
> -index 4c2547d..64c08ad 100644
> +index ef0320d..98cff24 100644
>  --- a/tools/qmake/mkspecs/features/functions.prf
>  +++ b/tools/qmake/mkspecs/features/functions.prf
> -@@ -87,8 +87,8 @@ defineReplace(findIncludedMocFiles) {
> - defineReplace(mocOutput) {
> +@@ -98,9 +98,9 @@ defineReplace(mocOutput) {
>     out =3D $$1
>     # The order is important, since the output of the second replace woul=
d end up accidentaly transformed by the first one
> --  out =3D $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|)), $${QMAKE_CPP_M=
OD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
> --  out =3D $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|)), $${QMAKE_H_MOD_M=
OC}\\1$${first(QMAKE_EXT_CPP)})
> -+  out =3D $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_=
MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
> -+  out =3D $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_=
MOC}\\1$${first(QMAKE_EXT_CPP)})
> +   for(ext, $$list($${QMAKE_EXT_CPP})): \
> +-      out =3D $$replace(out, ^(.*)($$re_escape($${ext})), $${QMAKE_CPP_=
MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
> ++      out =3D $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_CPP=
_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
> +   for(ext, $$list($${QMAKE_EXT_H})): \
> +-      out =3D $$replace(out, ^(.*)($$re_escape($${ext})), $${QMAKE_H_MO=
D_MOC}\\1$${first(QMAKE_EXT_CPP)})
> ++      out =3D $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_H_M=
OD_MOC}\\1$${first(QMAKE_EXT_CPP)})
>     return($$out)
>   }
>  =20
> diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-o=
nly-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.=
prf-Make-sure-we-only-use-the-file-name-to.patch
> index e7f4f7f..9df1c04 100644
> --- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use=
-the-file-name-to.patch
> +++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use=
-the-file-name-to.patch
> @@ -1,7 +1,7 @@
> -From 7a4a82af04fb228526dfd72a1d42b53b402952d1 Mon Sep 17 00:00:00 2001
> +From 4b5d3c736714b2712d7f3a77ea5a8a76fea0fc1f Mon Sep 17 00:00:00 2001
>  From: Simon Busch <morphis@gravedo.de>
>  Date: Tue, 18 Nov 2014 10:38:18 +0100
> -Subject: [PATCH 2/4] functions.prf: Make sure we only use the file name =
to
> +Subject: [PATCH 2/3] functions.prf: Make sure we only use the file name =
to
>   generate it's moc'ed abbreviation
> =20
>  Signed-off-by: Simon Busch <morphis@gravedo.de>
> @@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>   1 file changed, 2 insertions(+), 1 deletion(-)
> =20
>  diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mk=
specs/features/functions.prf
> -index 64c08ad..b46478b 100644
> +index 98cff24..aec54ea 100644
>  --- a/tools/qmake/mkspecs/features/functions.prf
>  +++ b/tools/qmake/mkspecs/features/functions.prf
> -@@ -85,7 +85,8 @@ defineReplace(findIncludedMocFiles) {
> +@@ -95,7 +95,8 @@ defineReplace(findIncludedMocFiles) {
>   }
>  =20
>   defineReplace(mocOutput) {
> @@ -22,8 +22,8 @@ index 64c08ad..b46478b 100644
>  +  in =3D $$1
>  +  out =3D $$basename(in)
>     # The order is important, since the output of the second replace woul=
d end up accidentaly transformed by the first one
> -   out =3D $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_=
MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
> -   out =3D $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_=
MOC}\\1$${first(QMAKE_EXT_CPP)})
> +   for(ext, $$list($${QMAKE_EXT_CPP})): \
> +       out =3D $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_CPP=
_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
>  --=20
>  2.4.2
> =20
> diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-fo=
r-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf=
-allow-build-for-linux-oe-g-platform.patch
> index a932aef..a533eea 100644
> --- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux=
-oe-g-platform.patch
> +++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux=
-oe-g-platform.patch
> @@ -1,7 +1,7 @@
> -From 87f1a22e6a1a6b40712eb131ba128d4f1e2da9b8 Mon Sep 17 00:00:00 2001
> +From 399990aa9b68437be7f3d6fa16556bf091645c34 Mon Sep 17 00:00:00 2001
>  From: Frieder Schrempf <frieder.schrempf@online.de>
>  Date: Mon, 1 Dec 2014 14:34:40 +0000
> -Subject: [PATCH 3/4] functions.prf: allow build for linux-oe-g++ platform
> +Subject: [PATCH 3/3] functions.prf: allow build for linux-oe-g++ platform
> =20
>  Upstream-Status: Inappropriate [OE specific]
> =20
> @@ -12,10 +12,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mk=
specs/features/functions.prf
> -index b46478b..6205bf4 100644
> +index aec54ea..6a4b01f 100644
>  --- a/tools/qmake/mkspecs/features/functions.prf
>  +++ b/tools/qmake/mkspecs/features/functions.prf
> -@@ -10,7 +10,7 @@ defineTest(isPlatformSupported) {
> +@@ -14,7 +14,7 @@ defineTest(isPlatformSupported) {
>  =20
>     linux-g++*:!isGCCVersionSupported(): return(false)
>     !isPythonVersionSupported(): return(false)
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengi=
ne_git.bb
> index 4b89ddd..2933bf7 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -2,13 +2,14 @@ SUMMARY =3D "QtWebEngine combines the power of Chromium=
 and Qt"
> =20
>  LICENSE =3D "LGPL-3.0 & BSD"
>  LIC_FILES_CHKSUM =3D " \
> -    file://src/core/browser_context_qt.cpp;md5=3D91895ac1852e1b07202d971=
6194e8dd8;beginline=3D1;endline=3D35 \
> +    file://src/core/browser_context_qt.cpp;md5=3D5fe719c44250955a5d5f8fb=
15fc8b1da;beginline=3D1;endline=3D35 \
>      file://src/3rdparty/chromium/LICENSE;md5=3D537e0b52077bf0a616d0a0c8a=
79bc9d5 \
>      file://LICENSE.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
>  "
> =20
>  DEPENDS +=3D " \
>      ninja-native \
> +    qtwebchannel \
>      qtbase qtdeclarative qtxmlpatterns qtquickcontrols \
>      libdrm fontconfig pixman openssl pango cairo icu pciutils \
>      libcap \
> @@ -71,8 +72,7 @@ RDEPENDS_${PN}-examples +=3D " \
>      qtdeclarative-qmlplugins \
>  "
> =20
> -QT_MODULE_BRANCH =3D "5.4"
> -QT_MODULE_BRANCH_CHROMIUM =3D "37.0.2062-based"
> +QT_MODULE_BRANCH_CHROMIUM =3D "40.0.2214-based"
> =20
>  SRC_URI +=3D " \
>      ${QT_GIT}/qt/qtwebengine-chromium.git;name=3Dchromium;branch=3D${QT_=
MODULE_BRANCH_CHROMIUM};destsuffix=3Dgit/src/3rdparty \
> @@ -81,8 +81,8 @@ SRC_URI +=3D " \
>      file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
>      file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.pat=
ch \
>  "
> -SRCREV_qtwebengine =3D "55a7fc7651136510032166ff24eb5e7e49635145"
> -SRCREV_chromium =3D "140893bef70011645c686f5fabe45018dd2e392a"
> +SRCREV_qtwebengine =3D "c6573119006014ff7bc0efb2da16ea35d302a1ec"
> +SRCREV_chromium =3D "41a1a031cd69e187a9608359ffe56652dcaaa6c5"
>  SRCREV =3D "${SRCREV_qtwebengine}"
> =20
>  SRCREV_FORMAT =3D "qtwebengine"
> diff --git a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enab=
le-building-examples-by-defaul.patch b/recipes-qt/qt5/qtwebkit-examples/000=
1-qtwebkit-examples-enable-building-examples-by-defaul.patch
> index 3186e13..05b8f29 100644
> --- a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-buil=
ding-examples-by-defaul.patch
> +++ b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-buil=
ding-examples-by-defaul.patch
> @@ -1,4 +1,4 @@
> -From f1367fc72dad78fb5625c6cd4b08914b34583d0f Mon Sep 17 00:00:00 2001
> +From a3c5765b9ef6e45db847c79ed333ed5e124dbecb Mon Sep 17 00:00:00 2001
>  From: Denys Dmytriyenko <denys@ti.com>
>  Date: Tue, 8 Oct 2013 00:18:10 -0400
>  Subject: [PATCH] qtwebkit-examples: enable building examples by default
> diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtw=
ebkit-examples_git.bb
> index 5fd6436..62e9612 100644
> --- a/recipes-qt/qt5/qtwebkit-examples_git.bb
> +++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
> @@ -5,11 +5,11 @@ require qt5-git.inc
>  # There are no GPLv2 licensed files in this component.
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c330f12cc8ed \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://examples/webkitwidgets/scroller/wheel/main.cpp;endline=3D112;=
md5=3D6f92d041824c63426993c8ce3ae0eb77 \
> -    file://examples/webkitwidgets/imageanalyzer/imageanalyzer.cpp;endlin=
e=3D223;md5=3D13ffb472fefe4bdf6464954a22251f35 \
> +    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://examples/webkitwidgets/scroller/wheel/main.cpp;endline=3D39;m=
d5=3Db0739af76072fbe303dc04b6941e054f \
> +    file://examples/webkitwidgets/imageanalyzer/imageanalyzer.cpp;endlin=
e=3D39;md5=3Db0739af76072fbe303dc04b6941e054f \
>  "
> =20
>  SRC_URI +=3D " \
> @@ -20,4 +20,4 @@ DEPENDS +=3D "qtwebkit qtxmlpatterns"
>  RDEPENDS_${PN}-examples +=3D "qtwebkit-qmlplugins"
>  RDEPENDS_${PN}-examples +=3D "${@base_contains('PACKAGECONFIG_OPENSSL', =
'openssl', 'ca-certificates', '', d)}"
> =20
> -SRCREV =3D "9f20ed0b48f4e5adcc9558b2cc4171eb17f243dd"
> +SRCREV =3D "b7c95dc2ada1171f06183ce8608990732791aa3f"
> diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH=
=2Epatch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.pat=
ch
> index 09876db..9163468 100644
> --- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
> +++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
> @@ -1,4 +1,4 @@
> -From 5a9e19d69e4443ab6272aeca6d707e39fe1943ef Mon Sep 17 00:00:00 2001
> +From 6b1704fcbe24d78c546a45c882db817634192058 Mon Sep 17 00:00:00 2001
>  From: Trevor Woerner <trevor.woerner@linaro.org>
>  Date: Fri, 7 Feb 2014 04:07:17 +0100
>  Subject: [PATCH 1/2] qtwebkit: fix QA issue (bad RPATH)
> diff --git a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch=
 b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
> index e384282..34aedbd 100644
> --- a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
> +++ b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
> @@ -1,4 +1,4 @@
> -From 22cad8ae3c1b8601ebf785ef5dfda4516056ee53 Mon Sep 17 00:00:00 2001
> +From 8239c912d045d04d4944650dde397473a8eb4462 Mon Sep 17 00:00:00 2001
>  From: Magnus Granberg <zorry@gentoo.org>
>  Date: Fri, 27 Feb 2015 11:55:09 +0100
>  Subject: [PATCH 2/2] Remove TEXTREL tag in x86
> diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git=
=2Ebb
> index db1a098..74f98a7 100644
> --- a/recipes-qt/qt5/qtwebkit_git.bb
> +++ b/recipes-qt/qt5/qtwebkit_git.bb
> @@ -3,7 +3,7 @@ require qt5-git.inc
> =20
>  LICENSE =3D "BSD & LGPLv2+ | GPL-2.0"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c330f12cc8ed \
> +    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
>      file://Source/WebCore/rendering/RenderApplet.h;endline=3D22;md5=3Dfb=
9694013ad71b78f8913af7a5959680 \
>      file://Source/WebKit/gtk/webkit/webkit.h;endline=3D21;md5=3Db4fbe9f4=
a944f1d071dba1d2c76b3351 \
>      file://Source/JavaScriptCore/parser/Parser.h;endline=3D21;md5=3Dbd69=
f72183a7af673863f057576e21ee \
> @@ -64,4 +64,4 @@ PACKAGES =3D "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}=
-doc ${PN}-locale ${PACKAGE
>  RUBY_SYS =3D "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586',=
 'i386').replace('i686', 'i386') }"
>  export RUBYLIB=3D"${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NA=
TIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
> =20
> -SRCREV =3D "ea590d74eae21dd70b189e0b8ba4bfb6a9bddb94"
> +SRCREV =3D "3f0fbb46e2e4e3d0d9ac9f0731b3f8435a504b4b"
> diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsoc=
kets_git.bb
> index 85e9156..b1e2951 100644
> --- a/recipes-qt/qt5/qtwebsockets_git.bb
> +++ b/recipes-qt/qt5/qtwebsockets_git.bb
> @@ -3,12 +3,11 @@ require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3=
=2E0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE;md5=3D4fbd65380cdd255951079008b364516c \
> -    file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c330f12cc8ed \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3Dbb426f3367c4805d1e12fad05bd0b750 \
>  "
> =20
>  DEPENDS +=3D "qtbase qtdeclarative"
> =20
> -SRCREV =3D "0002e934391ace7b77665a227068c3e06d576772"
> +SRCREV =3D "158ec0ca22f8f6713eb80f737eb8d0ef84f515ac"
> diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extr=
as_git.bb
> index 6f60f2b..e73feb7 100644
> --- a/recipes-qt/qt5/qtx11extras_git.bb
> +++ b/recipes-qt/qt5/qtx11extras_git.bb
> @@ -3,13 +3,13 @@ require qt5-git.inc
> =20
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0) | GPL-2.0"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c330f12cc8ed \
> +    file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
>  "
> =20
>  DEPENDS +=3D "qtbase"
> =20
> -SRCREV =3D "32b1ce9e1b1542f6779abcbcd78613b15149aaaa"
> +SRCREV =3D "f2da28b77cf3256d98e00ff7435938ebee44cb01"
> diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpa=
tterns_git.bb
> index 1be6853..cb6bf9d 100644
> --- a/recipes-qt/qt5/qtxmlpatterns_git.bb
> +++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
> @@ -4,12 +4,12 @@ require qt5-git.inc
>  # There are no LGPLv3-only licensed files in this component.
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2c17a64252e7 \
> -    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> +    file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> +    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
>  DEPENDS +=3D "qtbase"
> =20
> -SRCREV =3D "c21924d67a8ef39282afdf3ae6fef798dfca7135"
> +SRCREV =3D "ae6504efc85adf754d60a02f81413e5949282d78"
> --=20
> 2.5.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW/u18ACgkQN1Ujt2V2gBz1KQCfc9T4K9v5Q9WV7XSKgFfhw3Fe
Dq4AnR/1/gV7IA+So4MENWBjwo19+bOz
=XvpC
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--
