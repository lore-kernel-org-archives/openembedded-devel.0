Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 76BAC77F90
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jun 2017 22:19:30 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id y64so10401703ywe.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jun 2017 15:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y+3dT1tHrYRSgb21/NSg6Z1lxuVkrbSTPjJIM+Rd5Ss=;
	b=mbciWmazNOBzEPVELD/RZqbV52NH2Cymok+IYJOWvverZaJkWe+T2eeEUy0cQ0UxDk
	sl7WO0872pS8/Wol2hIbExAzhuTo9TJ632Uw8uyizgUUH8+nh7E5XkUJjl+uPmL5u2Lw
	QSh/vah8PenGNf0OZEC6PwqvW94Tw+ylwzcFhRzMXTlTbxeKBNMJLHb3iVL0cZii1GFR
	5JSYRShEW8djKcE5VPZAT3BbQStFpR6B7VpQndv6yF6CC4Ovnm43uA4FUdOfxgL+JUZX
	NKXOtj2MBMQNNmRFm4dIBTvhHpwGHaoveLWl3IoEZdztUxAZSsyrgoVxO8QpbmYIDJuG
	sh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y+3dT1tHrYRSgb21/NSg6Z1lxuVkrbSTPjJIM+Rd5Ss=;
	b=iLusJY/5ZTSF+8Hs1cY5wNQQR08khWrWt/QvsqD77es1hoD1o7lcutAKq3CoIEj06l
	+NeNAGdN6dJ+Xs2/lA0zX0BtCdDq3hIoH12i4xqmb3+ntPGOKtMTX4CEeKK5PEbttw7l
	bFE9zzrnaB83lyDtHvWfJvarL7WQ2lqmJbV+D1U2W2U6kjIPFRJyHjsZqitlxXxi18oL
	/m6DMQzzPwXm8QHkxbcCblL4CxQcr+D1VClQg4CAdccbAVZZGeGaWrK8XMPIrAylCFAl
	ogDs/+Kbuz6F15rV52I10n2Q+B1QaI1Fg8PwBP3FnS0ouAijdrnKFVgg9s5MZ8sfNIHY
	hRzQ==
X-Gm-Message-State: AODbwcDOUKDdEdrUUzSti7fUogTe6d1LtzGbbjH4TJb42Xrg4/3ql11s
	a5tTyxs/XhohREGs/JedVlck3Vph8g==
X-Received: by 10.129.55.14 with SMTP id e14mr4524154ywa.33.1496787570733;
	Tue, 06 Jun 2017 15:19:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Tue, 6 Jun 2017 15:19:30 -0700 (PDT)
In-Reply-To: <1496399743-12096-1-git-send-email-samuli.piippo@qt.io>
References: <1496399743-12096-1-git-send-email-samuli.piippo@qt.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 7 Jun 2017 00:19:30 +0200
Message-ID: <CA+chaQd+hC8FD=jEAK1v_bHjpxRVwDPwg8oKK2Qup9PtL-cb9A@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@qt.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Tue, 06 Jun 2017 22:19:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll send full report later, but sofar qtlocation and qtremoteobjects fail
to build:
http://errors.yoctoproject.org/Errors/Details/143883/
http://errors.yoctoproject.org/Errors/Details/143885/

On Fri, Jun 2, 2017 at 12:35 PM, Samuli Piippo <samuli.piippo@qt.io> wrote:

> * adapt QtWebEngine recipe to use GN instead of GYP
> * add QtRemoteObjects and QtWebView as a new Qt modules
> * update available QtBase configure arguments
> * remove obsolete patches
> * patch all .pc files to remove build paths
> * include generated QML cache files in packages
> * the patch "configure paths for target qmake properly" could not
>   be applied anymore and support must be done differently
>
> * QtWebEngine now requires gcc-multilib to be installed
>   on the host system
>
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  classes/qmake5_base.bbclass                        |   6 +-
>  recipes-qt/qt5/nativesdk-qtbase_git.bb             |   7 +-
>  .../qt5/qt3d/0001-Allow-a-tools-only-build.patch   |  16 +++-
>  recipes-qt/qt5/qt3d_git.bb                         |   2 +-
>  recipes-qt/qt5/qt5-git.inc                         |   4 +-
>  recipes-qt/qt5/qt5.inc                             |  10 +-
>  recipes-qt/qt5/qtbase-native_git.bb                |   9 +-
>  ...ake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch} |   8 +-
>  ...le-Fix-pkgconfig-and-libtool-replacements.patch | 106
> ---------------------
>  ...ump-path-length-from-256-to-512-character.patch |  41 ++++----
>  ...configure-paths-for-target-qmake-properly.patch |  75 ---------------
>  recipes-qt/qt5/qtbase_git.bb                       |  13 +--
>  recipes-qt/qt5/qtcanvas3d_git.bb                   |   2 +-
>  recipes-qt/qt5/qtcharts_git.bb                     |   2 +-
>  recipes-qt/qt5/qtconnectivity_git.bb               |   6 +-
>  recipes-qt/qt5/qtdatavis3d_git.bb                  |   2 +-
>  .../qtdeclarative/0002-Fix-memory-leak-in-V4.patch |  44 ---------
>  ...leak-in-QQuickWindowPrivate-deliverTouchA.patch |  84 ---------------=
-
>  recipes-qt/qt5/qtdeclarative_git.bb                |   8 +-
>  recipes-qt/qt5/qtenginio_git.bb                    |   5 -
>  recipes-qt/qt5/qtgamepad_git.bb                    |   2 +-
>  recipes-qt/qt5/qtgraphicaleffects_git.bb           |   2 +-
>  recipes-qt/qt5/qtimageformats_git.bb               |   2 +-
>  recipes-qt/qt5/qtlocation_git.bb                   |   9 +-
>  recipes-qt/qt5/qtmultimedia_git.bb                 |   6 +-
>  recipes-qt/qt5/qtnetworkauth_git.bb                |   3 +-
>  recipes-qt/qt5/qtquick1_git.bb                     |   2 +-
>  recipes-qt/qt5/qtquickcontrols2_git.bb             |   6 +-
>  recipes-qt/qt5/qtquickcontrols_git.bb              |   7 +-
>  recipes-qt/qt5/qtremoteobjects_git.bb              |  14 +++
>  recipes-qt/qt5/qtscript_git.bb                     |   2 +-
>  recipes-qt/qt5/qtscxml_git.bb                      |   2 +-
>  recipes-qt/qt5/qtsensors_git.bb                    |   2 +-
>  recipes-qt/qt5/qtserialbus_git.bb                  |   2 +-
>  recipes-qt/qt5/qtserialport_git.bb                 |   2 +-
>  recipes-qt/qt5/qtsvg_git.bb                        |   2 +-
>  ...t-help-fix-linking-of-dependent-libraries.patch |  29 ------
>  recipes-qt/qt5/qttools_git.bb                      |   8 +-
>  recipes-qt/qt5/qttranslations_git.bb               |   2 +-
>  recipes-qt/qt5/qtvirtualkeyboard_git.bb            |   2 +-
>  recipes-qt/qt5/qtwayland_git.bb                    |   6 +-
>  recipes-qt/qt5/qtwebchannel_git.bb                 |   2 +-
>  .../0001-Force-host-toolchain-configuration.patch  |  69 ++++++++++++++
>  ...se.gypi-include-atomicops_internals_x86_g.patch |  24 -----
>  ...um-workaround-for-too-long-.rps-file-name.patch |  42 ++++++++
>  ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  27 ------
>  ...rf-Make-sure-we-only-use-the-file-name-to.patch |  26 -----
>  ...s.prf-allow-build-for-linux-oe-g-platform.patch |  30 ------
>  ...quickwebengineview_p_p.h-add-include-QCol.patch |  23 -----
>  ...-dependency-to-QCoreApplication-translate.patch |  23 -----
>  recipes-qt/qt5/qtwebengine_git.bb                  |  54 +++++------
>  recipes-qt/qt5/qtwebkit-examples_git.bb            |   2 +-
>  .../qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch  |  76 ---------------
>  recipes-qt/qt5/qtwebkit_git.bb                     |   3 +-
>  recipes-qt/qt5/qtwebsockets_git.bb                 |   2 +-
>  .../0001-Add-missing-include-for-qWarning.patch    |  22 +++++
>  recipes-qt/qt5/qtwebview_git.bb                    |  16 ++++
>  recipes-qt/qt5/qtx11extras_git.bb                  |   2 +-
>  recipes-qt/qt5/qtxmlpatterns_git.bb                |   2 +-
>  59 files changed, 296 insertions(+), 711 deletions(-)
>  rename recipes-qt/qt5/qtbase/{0003-Add-external-hostbindir-option.patch
> =3D> 0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch} (94%)
>  delete mode 100644 recipes-qt/qt5/qtbase/0004-qt_
> module-Fix-pkgconfig-and-libtool-replacements.patch
>  delete mode 100644 recipes-qt/qt5/qtbase/0008-configure-paths-for-target=
-
> qmake-properly.patch
>  delete mode 100644 recipes-qt/qt5/qtdeclarative/
> 0002-Fix-memory-leak-in-V4.patch
>  delete mode 100644 recipes-qt/qt5/qtdeclarative/0003-fix-memory-leak-in-
> QQuickWindowPrivate-deliverTouchA.patch
>  create mode 100644 recipes-qt/qt5/qtremoteobjects_git.bb
>  delete mode 100644 recipes-qt/qt5/qttools/0002-
> assistant-help-fix-linking-of-dependent-libraries.patch
>  create mode 100644 recipes-qt/qt5/qtwebengine/0001-Force-host-toolchain-
> configuration.patch
>  delete mode 100644 recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-
> include-atomicops_internals_x86_g.patch
>  create mode 100644 recipes-qt/qt5/qtwebengine/
> 0001-chromium-workaround-for-too-long-.rps-file-name.patch
>  delete mode 100644 recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-
> match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
>  delete mode 100644 recipes-qt/qt5/qtwebengine/
> 0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
>  delete mode 100644 recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-
> build-for-linux-oe-g-platform.patch
>  delete mode 100644 recipes-qt/qt5/qtwebengine/0004-WebEngine-
> qquickwebengineview_p_p.h-add-include-QCol.patch
>  delete mode 100644 recipes-qt/qt5/qtwebengine/0005-Include-dependency-to=
-
> QCoreApplication-translate.patch
>  delete mode 100644 recipes-qt/qt5/qtwebkit/0002-
> Remove-TEXTREL-tag-in-x86.patch
>  create mode 100644 recipes-qt/qt5/qtwebview/0001-Add-missing-include-for=
-
> qWarning.patch
>  create mode 100644 recipes-qt/qt5/qtwebview_git.bb
>
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index df8f624..a556f4f 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -214,7 +214,9 @@ qmake5_base_do_install() {
>      qmake5_base_fix_install ${STAGING_DIR_HOST}
>      qmake5_base_fix_install ${STAGING_DIR_NATIVE}
>
> -    if ls ${D}${libdir}/pkgconfig/Qt5*.pc >/dev/null 2>/dev/null; then
> -        sed -i "s@-L${STAGING_LIBDIR}@-L\${libdir}@g"
> ${D}${libdir}/pkgconfig/Qt5*.pc
> +    if ls ${D}${libdir}/pkgconfig/*.pc >/dev/null 2>/dev/null; then
> +        sed -i ${D}${libdir}/pkgconfig/*.pc \
> +            -e "s@-L${STAGING_LIBDIR}@-L\${libdir}@g" \
> +            -e "s@${STAGING_DIR_TARGET}@@g"
>      fi
>  }
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/
> nativesdk-qtbase_git.bb
> index f2ff5f7..fac5791 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -27,9 +27,8 @@ FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qtbase:"
>  # common for qtbase-native, qtbase-nativesdk and qtbase
>  SRC_URI +=3D "\
>      file://0001-Add-linux-oe-g-platform.patch \
> +    file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.pat=
ch
> \
> -    file://0003-Add-external-hostbindir-option.patch \
> -    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
>      file://0005-configure-bump-path-length-from-256-to-512-character.pat=
ch
> \
>      file://0009-Disable-all-unknown-features-instead-of-erroring-out.pat=
ch
> \
>      file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.pat=
ch
> \
> @@ -115,6 +114,7 @@ do_configure() {
>          -no-opengl \
>          -no-openssl \
>          -no-xcb \
> +        -no-feature-bearermanagement \
>          -no-icu \
>          -verbose \
>          -release \
> @@ -134,7 +134,6 @@ do_configure() {
>          -testsdir ${OE_QMAKE_PATH_TESTS} \
>          -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
>          -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
> -        -host-option CROSS_COMPILE=3D${HOST_PREFIX} \
>          -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
>          -no-glib \
>          -no-iconv \
> @@ -192,4 +191,4 @@ fakeroot do_generate_qt_environment_file() {
>
>  addtask generate_qt_environment_file after do_install before do_package
>
> -SRCREV =3D "49dc9aa409d727824f26b246054a22b5a7dd5980"
> +SRCREV =3D "f6b36eaafec24b4c67efff621d380a4ca4257d0b"
> diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> index b19f963..248fb47 100644
> --- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> +++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> @@ -1,12 +1,14 @@
> -From 64f46f5399627430f9ce1a888fb9212b33977231 Mon Sep 17 00:00:00 2001
> +From b3fbc6be8844cf2eb8a47d39b1b7ce8016ce5d52 Mon Sep 17 00:00:00 2001
>  From: Samuli Piippo <samuli.piippo@theqtcompany.com>
>  Date: Wed, 10 Feb 2016 09:02:09 +0200
>  Subject: [PATCH] Allow a tools-only build
>
> +Change-Id: I4de6b96ec51fe297a0eeb757cef56d8fb40bd6f0
>  ---
>   qt3d.pro                                  | 7 ++++++-
>   src/3rdparty/assimp/assimp_dependency.pri | 2 +-
> - 2 files changed, 7 insertions(+), 2 deletions(-)
> + tools/tools.pro                           | 2 +-
> + 3 files changed, 8 insertions(+), 3 deletions(-)
>
>  diff --git a/qt3d.pro b/qt3d.pro
>  index 2cc347a..81cdeef 100644
> @@ -38,3 +40,13 @@ index 8ba2d9a..e973d93 100644
>       QMAKE_USE_PRIVATE +=3D assimp
>   } else {
>       include(assimp.pri)
> +diff --git a/tools/tools.pro b/tools/tools.pro
> +index 8e973ae..ad51db5 100644
> +--- a/tools/tools.pro
> ++++ b/tools/tools.pro
> +@@ -1,4 +1,4 @@
> + TEMPLATE =3D subdirs
> + QT_FOR_CONFIG +=3D 3dcore-private
> +-!android:qtConfig(assimp):qtConfig(commandlineparser): \
> ++!android:tools-only|qtConfig(assimp):qtConfig(commandlineparser): \
> +     SUBDIRS +=3D qgltf
> diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
> index f39208a..f0f960a 100644
> --- a/recipes-qt/qt5/qt3d_git.bb
> +++ b/recipes-qt/qt5/qt3d_git.bb
> @@ -34,6 +34,6 @@ do_configure_prepend() {
>           ${S}/src/quick3d/imports/input/importsinput.pro
>  }
>
> -SRCREV =3D "440589a0747d9668fec3ff924b390d75be5c6733"
> +SRCREV =3D "f39d0a0c32cc489849a0cd5c2880f6e824223485"
>
>  BBCLASSEXTEND +=3D "native nativesdk"
> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> index f864953..b7fee9c 100644
> --- a/recipes-qt/qt5/qt5-git.inc
> +++ b/recipes-qt/qt5/qt5-git.inc
> @@ -2,7 +2,7 @@
>  # Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
>
>  QT_MODULE ?=3D "${BPN}"
> -QT_MODULE_BRANCH ?=3D "5.8"
> +QT_MODULE_BRANCH ?=3D "5.9"
>  QT_MODULE_BRANCH_PARAM ?=3D "branch=3D${QT_MODULE_BRANCH};nobranch=3D1"
>
>  # each module needs to define valid SRCREV
> @@ -12,4 +12,4 @@ SRC_URI =3D " \
>
>  S =3D "${WORKDIR}/git"
>
> -PV =3D "5.8.0+git${SRCPV}"
> +PV =3D "5.9.0+git${SRCPV}"
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index 90d7896..4b5fe8a 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -97,34 +97,42 @@ FILES_${PN}-qmldesigner +=3D " \
>      ${OE_QMAKE_PATH_QML}/*/*/*/designer \
>  "
>
> -# qmlplugins 1-4 levels of subdirs qmldir + *{.so,*.qmltypes,*.qml,*js}
> +# qmlplugins 1-4 levels of subdirs qmldir + *{.so,*.qmltypes,*.qml,*.qml=
c,
> *.js,*.jsc}
>  FILES_${PN}-qmlplugins =3D " \
>      ${OE_QMAKE_PATH_QML}/*.qmltypes \
>      ${OE_QMAKE_PATH_QML}/*/*${SOLIBSDEV} \
>      ${OE_QMAKE_PATH_QML}/*/qmldir \
>      ${OE_QMAKE_PATH_QML}/*/*.qmltypes \
>      ${OE_QMAKE_PATH_QML}/*/*.qml \
> +    ${OE_QMAKE_PATH_QML}/*/*.qmlc \
>      ${OE_QMAKE_PATH_QML}/*/*.js \
> +    ${OE_QMAKE_PATH_QML}/*/*.jsc \
>      ${OE_QMAKE_PATH_QML}/*/*.png \
>      ${OE_QMAKE_PATH_QML}/*/*/*${SOLIBSDEV} \
>      ${OE_QMAKE_PATH_QML}/*/*/qmldir \
>      ${OE_QMAKE_PATH_QML}/*/*/*.qmltypes \
>      ${OE_QMAKE_PATH_QML}/*/*/*.qml \
> +    ${OE_QMAKE_PATH_QML}/*/*/*.qmlc \
>      ${OE_QMAKE_PATH_QML}/*/*/*.js \
> +    ${OE_QMAKE_PATH_QML}/*/*/*.jsc \
>      ${OE_QMAKE_PATH_QML}/*/*/*.png \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*${SOLIBSDEV} \
>      ${OE_QMAKE_PATH_QML}/*/*/*/qmldir \
>      ${OE_QMAKE_PATH_QML}/*/*/*/images \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*.qmltypes \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*.qml \
> +    ${OE_QMAKE_PATH_QML}/*/*/*/*.qmlc \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*.js \
> +    ${OE_QMAKE_PATH_QML}/*/*/*/*.jsc \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*.png \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*.metainfo \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*/*${SOLIBSDEV} \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*/qmldir \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qmltypes \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qml \
> +    ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qmlc \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*/*.js \
> +    ${OE_QMAKE_PATH_QML}/*/*/*/*/*.jsc \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*/*/*.png \
>      ${OE_QMAKE_PATH_IMPORTS}/*.qmltypes \
>      ${OE_QMAKE_PATH_IMPORTS}/*/*${SOLIBSDEV} \
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-
> native_git.bb
> index da69812..66b43e0 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -22,9 +22,8 @@ require qt5-git.inc
>  # common for qtbase-native, qtbase-nativesdk and qtbase
>  SRC_URI +=3D "\
>      file://0001-Add-linux-oe-g-platform.patch \
> +    file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.pat=
ch
> \
> -    file://0003-Add-external-hostbindir-option.patch \
> -    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
>      file://0005-configure-bump-path-length-from-256-to-512-character.pat=
ch
> \
>      file://0009-Disable-all-unknown-features-instead-of-erroring-out.pat=
ch
> \
>      file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.pat=
ch
> \
> @@ -107,9 +106,7 @@ do_install() {
>          done
>      fi
>
> -    # for modules which are still using syncqt and call
> qtPrepareTool(QMAKE_SYNCQT, syncqt)
> -    # e.g. qt3d, qtwayland
> -    ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
> +    install -m 755 ${B}/bin/qfloat16-tables ${D}${OE_QMAKE_PATH_BINS}
>  }
>
> -SRCREV =3D "49dc9aa409d727824f26b246054a22b5a7dd5980"
> +SRCREV =3D "f6b36eaafec24b4c67efff621d380a4ca4257d0b"
> diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.pa=
tch
> b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_
> EXTERNAL_HOST_BINS.patch
> similarity index 94%
> rename from recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-
> option.patch
> rename to recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_
> EXTERNAL_HOST_BINS.patch
> index 8224171..4ab4724 100644
> --- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
> +++ b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_
> EXTERNAL_HOST_BINS.patch
> @@ -1,9 +1,9 @@
> -From 502b95b840a5f79e5a68e9bd5b10dbdc92485f1f Mon Sep 17 00:00:00 2001
> +From f49d55a883369dee488cc59feda29c770a803458 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Sat, 6 Apr 2013 13:15:07 +0200
> -Subject: [PATCH] Add -external-hostbindir option
> +Subject: [PATCH] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
>
> -* cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host
> binaries
> +... to determine path to host binaries
>
>  Upstream-Status: Inappropriate [OE specific]
>
> @@ -19,7 +19,7 @@ Change-Id: Iacaa1c5531cd6dcc094891610c351673db55d7b2
>   3 files changed, 6 insertions(+), 6 deletions(-)
>
>  diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/
> Qt5CoreConfigExtras.cmake.in
> -index a5ed8b2..0e11a1e 100644
> +index 545b9a3..c991a9b 100644
>  --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
>  +++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
>  @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
> diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libto=
ol-replacements.patch
> b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-
> libtool-replacements.patch
> deleted file mode 100644
> index c105488..0000000
> --- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-
> libtool-replacements.patch
> +++ /dev/null
> @@ -1,106 +0,0 @@
> -From bf1498618415e7b1e57b54881b1e56d74f2cdf6b Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sat, 27 Apr 2013 23:15:37 +0200
> -Subject: [PATCH] qt_module: Fix pkgconfig and libtool replacements
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -* in situation like this:
> -  QT_SYSROOT:/OE/oe-core/tmp-eglibc/sysroots/qemuarm
> -  QT_INSTALL_LIBS:/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/lib
> -  QT_INSTALL_LIBS/raw:/usr/lib
> -  QT_INSTALL_LIBS/get:/OE/oe-core/tmp-eglibc/work/armv5te-
> oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/lib
> -
> -  I don't want the replacement like this:
> -  sed
> -    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/
> qtbase/5.0.0-r0.0/build/include,/usr/include/qt5,g"
> -    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/
> qtbase/5.0.0-r0.0/build/lib,/usr/lib,g"
> -    "../../lib/pkgconfig/Qt5Core.pc"
> -    >"/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/
> qtbase/5.0.0-r0.0/image/OE/oe-core/tmp-eglibc/sysroots/
> qemuarm/usr/lib/pkgconfig/Qt5Core.pc"
> -  because that way I'll end with -L/usr/lib in .pc file which is
> -  cross-compile unfriendly, keeping ${libdir}/${includedir} works better
> -  in my case
> -
> -* qt_module: Fix paths in .prl files
> -* qmake does not prefix them with QT_SYSROOT when using them
> -  so e.g. when building qtdeclarative we get -L/usr/lib to LINKAGE
> -  variable, which is unsafe for cross-compilation
> -* writting QT_SYSROOT in .prl files is dangerous for sstate when
> -  builds are in different directories, so we need
> -  SSTATE_SCAN_FILES +=3D "*.pri *.prl"
> -  to make them relocateble
> -
> -* fix paths in packageconfig files
> -  This reverts parts of:
> -
> -  enable path replacement in installed prl files on all platforms
> -
> -  Task-number: QTBUG-33794
> -  Change-Id: Id0d38715673b8a1c0c034e9c15783eb255c4315b
> -  Reviewed-by: Joerg Bornemann <joerg.bornemann@digia.com>
> -
> -* to debug this, rebuild qtbase and read build/src/corelib/Makefile
> -* this is example of broken install_target rule (added line feeds):
> -  -$(SED) -e s,/OE/5.3.1-r0/build/lib,/usr/lib,g
> -          -e 's,/OE/5.3.1-r0/build/include,$$\{includedir},g'
> -          -e 's,/OE/5.3.1-r0/build/lib,$$\{libdir},g'
> -     "../../lib/pkgconfig/Qt5Core.pc"
> -     >"$(INSTALL_ROOT)/usr/lib/pkgconfig/Qt5Core.pc"
> -  change .prf files, create copy of WORKDIR, re-excecute only
> -  do_configure task and compare generated Makefile, repeat until
> -  replace in generated Makefile works ok, then refresh patch and
> -  try complete rebuild for qtbase
> -* if everything is ok, then try:
> -  image $ grep -R "\-L/usr" .
> -  image $ grep -R "\-I/usr" .
> -  and it should return only few cases of
> -  qmake.conf:QMAKE_LFLAGS_THREAD     =3D -L/usr/lib/threads
> -  for aix* platformas
> -
> -Change-Id: Ie1c94b15f2a4e736b65b4d0924d99eb2a7d92a6c
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> ----
> - mkspecs/features/qt.prf        | 13 +++++++++++++
> - mkspecs/features/qt_common.prf |  2 +-
> - 2 files changed, 14 insertions(+), 1 deletion(-)
> -
> -diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
> -index 0c5f080..a6e4f09 100644
> ---- a/mkspecs/features/qt.prf
> -+++ b/mkspecs/features/qt.prf
> -@@ -317,6 +317,19 @@ contains(TEMPLATE, .*app) {
> -     QTPLUGIN =3D $$manualplugs $$autoplugs
> - }
> -
> -+contains(TEMPLATE, .*lib) {
> -+    pkgconfig_prefix_replace.match =3D "prefix=3D$$[QT_SYSROOT]"
> -+    pkgconfig_prefix_replace.replace =3D "prefix=3D"
> -+    pkgconfig_prefix_replace.CONFIG =3D path
> -+    QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D pkgconfig_prefix_replace
> -+
> -+    # drop -L/usr/lib in .prl files
> -+    prl_replace.match =3D "-L\$${libdir}"
> -+    prl_replace.replace =3D ""
> -+    prl_replace.CONFIG =3D path
> -+    QMAKE_PRL_INSTALL_REPLACE +=3D prl_replace
> -+}
> -+
> - QT_PLUGIN_VERIFY =3D DEPLOYMENT_PLUGIN
> - qtConfig(static) {
> -     QT_PLUGIN_VERIFY +=3D QTPLUGIN
> -diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common=
.
> prf
> -index e754a17..4c1530e 100644
> ---- a/mkspecs/features/qt_common.prf
> -+++ b/mkspecs/features/qt_common.prf
> -@@ -37,7 +37,7 @@ contains(TEMPLATE, .*lib) {
> -         lib_replace.replace =3D
> -     } else {
> -         lib_replace.match =3D $$rplbase/lib
> --        lib_replace.replace =3D $$qqt_libdir
> -+        lib_replace.replace =3D "\$$\\{libdir}"
> -     }
> -     lib_replace.CONFIG =3D path
> -     QMAKE_PRL_INSTALL_REPLACE +=3D lib_replace
> diff --git a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-
> from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0005-
> configure-bump-path-length-from-256-to-512-character.patch
> index d455d2c..7c80c6b 100644
> --- a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-
> from-256-to-512-character.patch
> +++ b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-
> from-256-to-512-character.patch
> @@ -1,4 +1,4 @@
> -From 60f490b57faf979a912074506a75c74767a27d3b Mon Sep 17 00:00:00 2001
> +From c8f856115df0f5be64dfbeef0c1e9a4f02ba161a Mon Sep 17 00:00:00 2001
>  From: Denys Dmytriyenko <denys@ti.com>
>  Date: Tue, 25 Aug 2015 10:05:15 -0400
>  Subject: [PATCH] configure: bump path length from 256 to 512 characters
> @@ -8,26 +8,27 @@ from 256 to 512 characters, as nativesdk path can be
> quite long.
>
>  Also update length of EXT_PREFIX and HOST_PREFIX now.
>
> +Change-Id: If98dd57160efe9c98c36148cdf872f50b3d38118
>  Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>  ---
> - configure | 6 +++---
> + configure.pri | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> -diff --git a/configure b/configure
> -index 1fcbb3a..f49a674 100755
> ---- a/configure
> -+++ b/configure
> -@@ -3847,10 +3847,10 @@ static const char qt_configure_licensed_products=
_str
> [256 + 12] =3D "qt_lcnsprod=3D$
> - static const char qt_configure_installation          [12+11]    =3D
> "qt_instdate=3D2012-12-20";
> -
> - /* Installation Info */
> --static const char qt_configure_prefix_path_str       [256 + 12] =3D
> "qt_prfxpath=3D$QT_INSTALL_PREFIX";
> -+static const char qt_configure_prefix_path_str       [512 + 12] =3D
> "qt_prfxpath=3D$QT_INSTALL_PREFIX";
> - #ifdef QT_BUILD_QMAKE
> --static const char qt_configure_ext_prefix_path_str   [256 + 12] =3D
> "qt_epfxpath=3D$QT_EXT_PREFIX";
> --static const char qt_configure_host_prefix_path_str  [256 + 12] =3D
> "qt_hpfxpath=3D$QT_HOST_PREFIX";
> -+static const char qt_configure_ext_prefix_path_str   [512 + 12] =3D
> "qt_epfxpath=3D$QT_EXT_PREFIX";
> -+static const char qt_configure_host_prefix_path_str  [512 + 12] =3D
> "qt_hpfxpath=3D$QT_HOST_PREFIX";
> - #endif
> -
> - static const short qt_configure_str_offsets[] =3D {
> +diff --git a/configure.pri b/configure.pri
> +index efd0f81..5a027fe 100644
> +--- a/configure.pri
> ++++ b/configure.pri
> +@@ -837,10 +837,10 @@ defineTest(qtConfOutput_preparePaths) {
> +         "static const char qt_configure_installation     [12+11]  =3D
> \"qt_instdate=3D2012-12-20\";" \
> +         "" \
> +         "/* Installation Info */" \
> +-        "static const char qt_configure_prefix_path_str  [12+256] =3D
> \"qt_prfxpath=3D$$config.input.prefix\";" \
> ++        "static const char qt_configure_prefix_path_str  [12+512] =3D
> \"qt_prfxpath=3D$$config.input.prefix\";" \
> +         "$${LITERAL_HASH}ifdef QT_BUILD_QMAKE" \
> +-        "static const char qt_configure_ext_prefix_path_str   [12+256]
> =3D \"qt_epfxpath=3D$$config.input.extprefix\";" \
> +-        "static const char qt_configure_host_prefix_path_str  [12+256]
> =3D \"qt_hpfxpath=3D$$config.input.hostprefix\";" \
> ++        "static const char qt_configure_ext_prefix_path_str   [12+512]
> =3D \"qt_epfxpath=3D$$config.input.extprefix\";" \
> ++        "static const char qt_configure_host_prefix_path_str  [12+512]
> =3D \"qt_hpfxpath=3D$$config.input.hostprefix\";" \
> +         "$${LITERAL_HASH}endif" \
> +         "" \
> +         "static const short qt_configure_str_offsets[] =3D {" \
> diff --git a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-=
properly.patch
> b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-
> qmake-properly.patch
> deleted file mode 100644
> index 6d64e6b..0000000
> --- a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-
> qmake-properly.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -From cc926956758bf8170c4e49c66e1066524b43f65f Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Fri, 13 Nov 2015 12:36:11 +0100
> -Subject: [PATCH] configure paths for target qmake properly
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -to use this patch in all qtbase/qtbase-native(sdk) changes ore made
> -conditionally based on QT_CROSS_COMPILE
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Change-Id: I2b2f00c496216e98fbe14801f9e840ef5333c4b6
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - configure | 23 +++++++++++++++++++----
> - 1 file changed, 19 insertions(+), 4 deletions(-)
> -
> -diff --git a/configure b/configure
> -index 8b33c5b..1df248f 100755
> ---- a/configure
> -+++ b/configure
> -@@ -1545,8 +1545,13 @@ if [ -z "$QT_REL_HOST_DATA" ]; then
> -     fi
> - fi
> -
> --shortxspec=3D`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
> --shortspec=3D`echo $QMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
> -+if [ "$QT_CROSS_COMPILE" =3D "yes" ] ; then
> -+    shortxspec=3Dlinux-g++
> -+    shortspec=3Dlinux-g++
> -+else
> -+    shortxspec=3D`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
> -+    shortspec=3D`echo $QMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
> -+fi
> -
> - QT_CONFIGURE_STR_OFF=3D0
> -
> -@@ -1579,7 +1584,11 @@ QT_CONFIGURE_STRS_ALL=3D$QT_CONFIGURE_STRS
> -
> - QT_CONFIGURE_STR_OFFSETS=3D
> - QT_CONFIGURE_STRS=3D
> --addConfStr "$CFG_SYSROOT"
> -+if [ "$QT_CROSS_COMPILE" =3D "yes" ] ; then
> -+    addConfStr ""
> -+else
> -+    addConfStr "$CFG_SYSROOT"
> -+fi
> - addConfStr "$QT_REL_HOST_BINS"
> - addConfStr "$QT_REL_HOST_LIBS"
> - addConfStr "$QT_REL_HOST_DATA"
> -@@ -1591,6 +1600,12 @@ addConfStr "$shortspec"
> - #-----------------------------------------------------------
> --------------------
> - [ -d "$outpath/src/corelib/global" ] || mkdir -p
> "$outpath/src/corelib/global"
> -
> -+if [ "$QT_CROSS_COMPILE" =3D "yes" ] ; then
> -+    QT_TARGET_PREFIX=3D$QT_EXT_PREFIX
> -+else
> -+    QT_TARGET_PREFIX=3D$QT_HOST_PREFIX
> -+fi
> -+
> - cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
> - /* Installation date */
> - static const char qt_configure_installation          [12+11]    =3D
> "qt_instdate=3D2012-12-20";
> -@@ -1599,7 +1614,7 @@ static const char qt_configure_installation
>   [12+11]    =3D "qt_instdate=3D2
> - static const char qt_configure_prefix_path_str       [512 + 12] =3D
> "qt_prfxpath=3D$QT_INSTALL_PREFIX";
> - #ifdef QT_BUILD_QMAKE
> - static const char qt_configure_ext_prefix_path_str   [512 + 12] =3D
> "qt_epfxpath=3D$QT_EXT_PREFIX";
> --static const char qt_configure_host_prefix_path_str  [512 + 12] =3D
> "qt_hpfxpath=3D$QT_HOST_PREFIX";
> -+static const char qt_configure_host_prefix_path_str  [512 + 12] =3D
> "qt_hpfxpath=3D$QT_TARGET_PREFIX";
> - #endif
> -
> - static const short qt_configure_str_offsets[] =3D {
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 27d0de1..09d6cec 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -17,19 +17,13 @@ LIC_FILES_CHKSUM =3D " \
>  # common for qtbase-native, qtbase-nativesdk and qtbase
>  SRC_URI +=3D "\
>      file://0001-Add-linux-oe-g-platform.patch \
> +    file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.pat=
ch
> \
> -    file://0003-Add-external-hostbindir-option.patch \
> -    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
>      file://0005-configure-bump-path-length-from-256-to-512-character.pat=
ch
> \
>      file://0009-Disable-all-unknown-features-instead-of-erroring-out.pat=
ch
> \
>      file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.pat=
ch
> \
>  "
>
> -# only for target qtbase
> -SRC_URI +=3D "\
> -    file://0008-configure-paths-for-target-qmake-properly.patch \
> -"
> -
>  DEPENDS +=3D "qtbase-native"
>
>  # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
> @@ -40,7 +34,7 @@ RDEPENDS_${PN}-tools +=3D "perl"
>  # separate some parts of PACKAGECONFIG which are often changed
>  PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'gl', '', d)}"
>  PACKAGECONFIG_FB ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'directfb=
',
> 'directfb', '', d)}"
> -PACKAGECONFIG_X11 ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'xcb xrender xinput2 glib xkb xkbcommon-evdev', '', d)}"
> +PACKAGECONFIG_X11 ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'xcb xinput2 glib xkb xkbcommon-evdev', '', d)}"
>  PACKAGECONFIG_FONTS ?=3D ""
>  PACKAGECONFIG_SYSTEM ?=3D "jpeg libpng zlib"
>  PACKAGECONFIG_DISTRO ?=3D ""
> @@ -104,7 +98,6 @@ PACKAGECONFIG[sql-db2] =3D "-sql-db2,-no-sql-db2"
>  PACKAGECONFIG[sql-sqlite2] =3D "-sql-sqlite2,-no-sql-sqlite2,sqlite"
>  PACKAGECONFIG[sql-sqlite] =3D "-sql-sqlite -system-sqlite,-no-sql-sqlite=
,
> sqlite3"
>  PACKAGECONFIG[xinput2] =3D "-xinput2,-no-xinput2,libxi"
> -PACKAGECONFIG[xrender] =3D "-xrender,-no-xrender,libxrender"
>  PACKAGECONFIG[iconv] =3D "-iconv,-no-iconv,virtual/libiconv"
>  PACKAGECONFIG[xkb] =3D "-xkb,-no-xkb -no-xkbcommon,libxkbcommon"
>  PACKAGECONFIG[xkbcommon-evdev] =3D "-xkbcommon-evdev,-no-
> xkbcommon-evdev,libxkbcommon,xkeyboard-config"
> @@ -189,4 +182,4 @@ INSANE_SKIP_${PN}-mkspecs +=3D "file-rdeps"
>
>  RRECOMMENDS_${PN}-plugins +=3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'libx11-locale', '', d)}"
>
> -SRCREV =3D "49dc9aa409d727824f26b246054a22b5a7dd5980"
> +SRCREV =3D "f6b36eaafec24b4c67efff621d380a4ca4257d0b"
> diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d=
_
> git.bb
> index 3ca6647..b2a0724 100644
> --- a/recipes-qt/qt5/qtcanvas3d_git.bb
> +++ b/recipes-qt/qt5/qtcanvas3d_git.bb
> @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS =3D "qtdeclarative"
>
> -SRCREV =3D "5962967a3712ee711fd9ab58da664a3eb0acb24e"
> +SRCREV =3D "116737dc8fa244282dda95a8f13624b66fdb5521"
> diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git=
.
> bb
> index 1369dee..6b895aa 100644
> --- a/recipes-qt/qt5/qtcharts_git.bb
> +++ b/recipes-qt/qt5/qtcharts_git.bb
> @@ -8,4 +8,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase qtdeclarative qtmultimedia"
>
> -SRCREV =3D "057b3e2d6a96b42b890a0d007a8801d260c3de48"
> +SRCREV =3D "de7f741c428febfe3c81a28f955996d2314953fc"
> diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/
> qtconnectivity_git.bb
> index de7764d..0d13dc4 100644
> --- a/recipes-qt/qt5/qtconnectivity_git.bb
> +++ b/recipes-qt/qt5/qtconnectivity_git.bb
> @@ -4,13 +4,9 @@ require qt5-git.inc
>  LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1=
.0
> | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 |
> The-Qt-Company-Commercial )"
>  LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> -    file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
> -    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
>      file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>      file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
>      file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073 \
> -    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
> -    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
>
> @@ -23,4 +19,4 @@ PACKAGECONFIG[bluez] =3D "-feature-bluez,-no-feature-
> bluez,${BLUEZ}"
>
>  EXTRA_QMAKEVARS_CONFIGURE +=3D "${PACKAGECONFIG_CONFARGS}"
>
> -SRCREV =3D "1afb57ed92a25bbc000ea4c4d7662cb8b9e267ee"
> +SRCREV =3D "8dcbf68e4579e03ea6d2808ac0c670169b59d0df"
> diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/
> qtdatavis3d_git.bb
> index 7d6a51f..0cbd04e 100644
> --- a/recipes-qt/qt5/qtdatavis3d_git.bb
> +++ b/recipes-qt/qt5/qtdatavis3d_git.bb
> @@ -8,4 +8,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
>
> -SRCREV =3D "a78f8d6bef57dd4283094a52551705ee02909970"
> +SRCREV =3D "84490ff75be5acdaeb3fd93900e4ebf7ba8f539b"
> diff --git a/recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patc=
h
> b/recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch
> deleted file mode 100644
> index 423681e..0000000
> --- a/recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 80e63c5a2981473dd7ee3a4f382e54948bb99f75 Mon Sep 17 00:00:00 2001
> -From: Gunnar Sletta <gunnar@crimson.no>
> -Date: Thu, 19 Jan 2017 09:05:46 +0100
> -Subject: [PATCH 2/3] Fix memory leak in V4
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Transitions contain both an id and a set of flags, but the sorting
> -failed to take the flags into account in the operator<. As a result
> -we would some times end up with duplicate entries if the same id
> -was added multiple times with different flags.
> -
> -If the same id was added again and again with varying flags, this
> -could lead to an ever expanding list filled with duplicate entries.
> -
> -Fix this by also taking flags into account in operator< so that
> -operator< and operator=3D=3D are symetric and the list gets correctly
> -sorted.
> -
> -Change-Id: I762ec3f0c5b4ed9a1aecb9a883187a0445491591
> -Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
> -Reviewed-by: Robin Burchell <robin.burchell@crimson.no>
> -Signed-off-by: Gordan Marku=C5=A1 <gordan.markus@pelagicore.com>
> ----
> - src/qml/jsruntime/qv4internalclass_p.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/qml/jsruntime/qv4internalclass_p.h b/src/qml/jsruntime/
> qv4internalclass_p.h
> -index dcda949..1d8ef4b 100644
> ---- a/src/qml/jsruntime/qv4internalclass_p.h
> -+++ b/src/qml/jsruntime/qv4internalclass_p.h
> -@@ -234,7 +234,7 @@ struct InternalClassTransition
> -     { return id =3D=3D other.id && flags =3D=3D other.flags; }
> -
> -     bool operator<(const InternalClassTransition &other) const
> --    { return id < other.id; }
> -+    { return id < other.id || (id =3D=3D other.id && flags < other.flag=
s); }
> - };
> -
> - struct InternalClass : public QQmlJS::Managed {
> ---
> -2.9.3
> -
> diff --git a/recipes-qt/qt5/qtdeclarative/0003-fix-memory-
> leak-in-QQuickWindowPrivate-deliverTouchA.patch b/recipes-qt/qt5/
> qtdeclarative/0003-fix-memory-leak-in-QQuickWindowPrivate-
> deliverTouchA.patch
> deleted file mode 100644
> index 79a48f5..0000000
> --- a/recipes-qt/qt5/qtdeclarative/0003-fix-memory-
> leak-in-QQuickWindowPrivate-deliverTouchA.patch
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -From 6aa9001064c19e75e58c830eedc583e2342a7f20 Mon Sep 17 00:00:00 2001
> -From: Shawn Rutledge <shawn.rutledge@qt.io>
> -Date: Wed, 1 Feb 2017 12:06:26 +0100
> -Subject: [PATCH 3/3] fix memory leak in
> - QQuickWindowPrivate::deliverTouchAsMouse
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -A QTouchEvent is allocated with a reduced subset of TouchPoints for
> -each Item to which we attempt to deliver it, and thrown away afterwards.
> -(=CE=99t's not efficient to heap-allocate it, but we can't avoid doing i=
t
> -at all without changing behavior.)  So now it's stored in a
> QScopedPointer.
> -
> -Change-Id: I48badb493610d0a715e582a2eedae95e2006eb2b
> -Reviewed-by: Jan Arve S=C3=A6ther <jan-arve.saether@qt.io>
> -Signed-off-by: Gordan Marku=C5=A1 <gordan.markus@pelagicore.com>
> ----
> - src/quick/items/qquickwindow.cpp | 14 +++++++-------
> - 1 file changed, 7 insertions(+), 7 deletions(-)
> -
> -diff --git a/src/quick/items/qquickwindow.cpp b/src/quick/items/
> qquickwindow.cpp
> -index 1297dde..c130aec 100644
> ---- a/src/quick/items/qquickwindow.cpp
> -+++ b/src/quick/items/qquickwindow.cpp
> -@@ -629,8 +629,8 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuick=
Item
> *item, QQuickPointerEve
> -
> -     // FIXME: make this work for mouse events too and get rid of the
> asTouchEvent in here.
> -     Q_ASSERT(pointerEvent->asPointerTouchEvent());
> --    QTouchEvent *event =3D pointerEvent->asPointerTouchEvent()->
> touchEventForItem(item);
> --    if (!event)
> -+    QScopedPointer<QTouchEvent> event(pointerEvent->
> asPointerTouchEvent()->touchEventForItem(item));
> -+    if (event.isNull())
> -         return false;
> -
> -     // For each point, check if it is accepted, if not, try the next
> point.
> -@@ -647,7 +647,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuick=
Item
> *item, QQuickPointerEve
> -                 break;
> -
> -             qCDebug(DBG_TOUCH_TARGET) << "TP (mouse)" << p.id() << "->"
> << item;
> --            QScopedPointer<QMouseEvent> mousePress(touchToMouseEvent(QE=
vent::MouseButtonPress,
> p, event, item, false));
> -+            QScopedPointer<QMouseEvent> mousePress(touchToMouseEvent(QE=
vent::MouseButtonPress,
> p, event.data(), item, false));
> -
> -             // Send a single press and see if that's accepted
> -             QCoreApplication::sendEvent(item, mousePress.data());
> -@@ -661,7 +661,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuick=
Item
> *item, QQuickPointerEve
> -                 pointerEventPoint->setGrabber(item);
> -
> -                 if (checkIfDoubleClicked(event->timestamp())) {
> --                    QScopedPointer<QMouseEvent> mouseDoubleClick(
> touchToMouseEvent(QEvent::MouseButtonDblClick, p, event, item, false));
> -+                    QScopedPointer<QMouseEvent> mouseDoubleClick(
> touchToMouseEvent(QEvent::MouseButtonDblClick, p, event.data(), item,
> false));
> -                     QCoreApplication::sendEvent(item,
> mouseDoubleClick.data());
> -                     event->setAccepted(mouseDoubleClick->isAccepted());
> -                     if (!mouseDoubleClick->isAccepted()) {
> -@@ -678,7 +678,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuick=
Item
> *item, QQuickPointerEve
> -         } else if (touchMouseDevice =3D=3D device && p.id() =3D=3D
> touchMouseId) {
> -             if (p.state() & Qt::TouchPointMoved) {
> -                 if (QQuickItem *mouseGrabberItem =3D
> q->mouseGrabberItem()) {
> --                    QScopedPointer<QMouseEvent>
> me(touchToMouseEvent(QEvent::MouseMove, p, event, mouseGrabberItem,
> false));
> -+                    QScopedPointer<QMouseEvent>
> me(touchToMouseEvent(QEvent::MouseMove, p, event.data(),
> mouseGrabberItem, false));
> -                     QCoreApplication::sendEvent(item, me.data());
> -                     event->setAccepted(me->isAccepted());
> -                     if (me->isAccepted()) {
> -@@ -689,7 +689,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuick=
Item
> *item, QQuickPointerEve
> -                     // no grabber, check if we care about mouse hover
> -                     // FIXME: this should only happen once, not
> recursively... I'll ignore it just ignore hover now.
> -                     // hover for touch???
> --                    QScopedPointer<QMouseEvent>
> me(touchToMouseEvent(QEvent::MouseMove, p, event, item, false));
> -+                    QScopedPointer<QMouseEvent>
> me(touchToMouseEvent(QEvent::MouseMove, p, event.data(), item, false));
> -                     if (lastMousePosition.isNull())
> -                         lastMousePosition =3D me->windowPos();
> -                     QPointF last =3D lastMousePosition;
> -@@ -707,7 +707,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuick=
Item
> *item, QQuickPointerEve
> -             } else if (p.state() & Qt::TouchPointReleased) {
> -                 // currently handled point was released
> -                 if (QQuickItem *mouseGrabberItem =3D
> q->mouseGrabberItem()) {
> --                    QScopedPointer<QMouseEvent>
> me(touchToMouseEvent(QEvent::MouseButtonRelease, p, event,
> mouseGrabberItem, false));
> -+                    QScopedPointer<QMouseEvent>
> me(touchToMouseEvent(QEvent::MouseButtonRelease, p, event.data(),
> mouseGrabberItem, false));
> -                     QCoreApplication::sendEvent(item, me.data());
> -
> -                     if (item->acceptHoverEvents() && p.screenPos() !=3D
> QGuiApplicationPrivate::lastCursorPosition) {
> ---
> -2.9.3
> -
> diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/
> qtdeclarative_git.bb
> index c19bbd5..a578a06 100644
> --- a/recipes-qt/qt5/qtdeclarative_git.bb
> +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> @@ -4,20 +4,14 @@ require qt5-git.inc
>  LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1=
.0
> | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 |
> The-Qt-Company-Commercial )"
>  LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> -    file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
> -    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
>      file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>      file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
>      file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073 \
> -    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
> -    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
>
>  SRC_URI +=3D " \
>      file://0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch \
> -    file://0002-Fix-memory-leak-in-V4.patch \
> -    file://0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.pat=
ch
> \
>  "
>
>  DEPENDS +=3D "qtbase"
> @@ -38,6 +32,6 @@ do_install_append_class-nativesdk() {
>
>  EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'qtxmlpatterns', 'CONFIG+=3DOE_QTXMLPATTERNS_ENABLED', '', d)}"
>
> -SRCREV =3D "fffb997e192a72b4dcd66edc2fbad5473dd359f3"
> +SRCREV =3D "96f6ba5f562073f508cd8569ac354592fdd48f4a"
>
>  BBCLASSEXTEND =3D+ "native nativesdk"
> diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_
> git.bb
> index 2f32a88..8b4fb71 100644
> --- a/recipes-qt/qt5/qtenginio_git.bb
> +++ b/recipes-qt/qt5/qtenginio_git.bb
> @@ -15,8 +15,3 @@ DEPENDS +=3D "qtbase qtdeclarative qtxmlpatterns"
>  QT_MODULE_BRANCH =3D "dev"
>  SRCREV =3D "0555cf73c8b5abd41d8a4ff02457315c9e7c667d"
>
> -do_install_append() {
> -    if ls ${D}${libdir}/pkgconfig/Enginio.pc >/dev/null 2>/dev/null; the=
n
> -        sed -i "s@-L${STAGING_LIBDIR}@-L\${libdir}@g"
> ${D}${libdir}/pkgconfig/Enginio.pc
> -    fi
> -}
> diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_
> git.bb
> index 6abf8b7..94f04a4 100644
> --- a/recipes-qt/qt5/qtgamepad_git.bb
> +++ b/recipes-qt/qt5/qtgamepad_git.bb
> @@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] =3D "-feature-sdl2,-no-feature-
> sdl2,libsdl2"
>
>  EXTRA_QMAKEVARS_CONFIGURE +=3D "${PACKAGECONFIG_CONFARGS}"
>
> -SRCREV =3D "13bbe6ea378d127b9b1d70e2858e41e86e754dc7"
> +SRCREV =3D "ef8850fee38e2552d535379a8477c9abebdf8bb4"
> diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/
> qtgraphicaleffects_git.bb
> index f4b43e7..d98d77e 100644
> --- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
> +++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
> @@ -19,4 +19,4 @@ DEPENDS +=3D "qtdeclarative"
>
>  RDEPENDS_${PN}-dev =3D ""
>
> -SRCREV =3D "1583bb5569cfc50141d879107a46146d5ccccf28"
> +SRCREV =3D "db93af5b2bb49af74fbad6c9cd80bd7010434e78"
> diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/
> qtimageformats_git.bb
> index 3725441..4dd64df 100644
> --- a/recipes-qt/qt5/qtimageformats_git.bb
> +++ b/recipes-qt/qt5/qtimageformats_git.bb
> @@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] =3D ",CONFIG+=3Ddone_config_libw=
ebp,
> libwebp"
>
>  EXTRA_QMAKEVARS_PRE +=3D "${PACKAGECONFIG_CONFARGS}"
>
> -SRCREV =3D "cd2de115c6216ad747cf4803e65a4ce4af220795"
> +SRCREV =3D "71ccf0dff82835ce7b5aed74c37829afdef44cde"
> diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation=
_
> git.bb
> index f25d57e..af29576 100644
> --- a/recipes-qt/qt5/qtlocation_git.bb
> +++ b/recipes-qt/qt5/qtlocation_git.bb
> @@ -20,4 +20,11 @@ PACKAGECONFIG[gypsy] =3D "-feature-gypsy,-no-feature-g=
ypsy,gconf
> gypsy"
>
>  EXTRA_QMAKEVARS_CONFIGURE +=3D "${PACKAGECONFIG_CONFARGS}"
>
> -SRCREV =3D "41cc347040226d2c5c16b9df001d03f2724b87e5"
> +SRC_URI +=3D " \
> +    ${QT_GIT}/qtlocation-mapboxgl.git;name=3Dqtlocation-mapboxgl;
> branch=3Dupstream/qt-staging;protocol=3D${QT_GIT_PROTOCOL};
> destsuffix=3Dgit/src/3rdparty/mapbox-gl-native \
> +    "
> +
> +SRCREV_qtlocation =3D "888d351cb0c7fe6d05ab1efe8d4dbb4b6f06cd5f"
> +SRCREV_qtlocation-mapboxgl =3D "d45c177e8a23eefcc94930af9fa085e61136bb94=
"
> +
> +SRCREV_FORMAT =3D "qtlocation_qtlocation-mapboxgl"
> diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/
> qtmultimedia_git.bb
> index 7d3c3cc..c1ae786 100644
> --- a/recipes-qt/qt5/qtmultimedia_git.bb
> +++ b/recipes-qt/qt5/qtmultimedia_git.bb
> @@ -4,13 +4,9 @@ require qt5-git.inc
>  LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1=
.0
> | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 |
> The-Qt-Company-Commercial )"
>  LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> -    file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
> -    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
>      file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>      file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
>      file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073 \
> -    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
> -    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
>
> @@ -33,4 +29,4 @@ SRC_URI +=3D "\
>      file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
>  "
>
> -SRCREV =3D "544a8a4251ff9694780e563ddb6e4af1325e0115"
> +SRCREV =3D "559c305ded730e23505e8b29536a98dc59e2acfa"
> diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/
> qtnetworkauth_git.bb
> index 5657c86..eb5e4f6 100644
> --- a/recipes-qt/qt5/qtnetworkauth_git.bb
> +++ b/recipes-qt/qt5/qtnetworkauth_git.bb
> @@ -1,7 +1,6 @@
>  LICENSE =3D "BSD & GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 |
> The-Qt-Company-Commercial"
>  LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> -    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
>
> @@ -10,4 +9,4 @@ require qt5-git.inc
>
>  DEPENDS +=3D "qtbase"
>
> -SRCREV =3D "ec7663382bc6382323f3261ab199ec2edbeb5e37"
> +SRCREV =3D "86c5036848ad004208803d9d497cfcd08c9623d6"
> diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git=
.
> bb
> index e9b6185..2f16a36 100644
> --- a/recipes-qt/qt5/qtquick1_git.bb
> +++ b/recipes-qt/qt5/qtquick1_git.bb
> @@ -23,4 +23,4 @@ do_configure_prepend() {
>  }
>
>  QT_MODULE_BRANCH =3D "dev"
> -SRCREV =3D "64faeb0d8003e699a4d09e7dcee1ef6eb10302ad"
> +SRCREV =3D "695460401d9a89d2f156016d51601b2e59b64105"
> diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/
> qtquickcontrols2_git.bb
> index 42acb8a..a84cfb3 100644
> --- a/recipes-qt/qt5/qtquickcontrols2_git.bb
> +++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
> @@ -4,10 +4,10 @@ require qt5-git.inc
>  LICENSE =3D "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
>  LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -    file://LICENSE.LGPLv3;md5=3Da37e6cd7102174853307e03e6edc5f30 \
> -    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
> +    file://LICENSE.LGPLv3;md5=3D382747d0119037529ec2b98b24038eb0 \
> +    file://LICENSE.GPLv3;md5=3Ddce746aa5261707df6d6999ab9958d8b \
>  "
>
>  DEPENDS +=3D "qtdeclarative"
>
> -SRCREV =3D "6f7852a307c7ebbdb3b6efa00cbf7626b072bbc1"
> +SRCREV =3D "ef6b8d3081f0bf93d6d59e67c8e3f82c63c511c3"
> diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/
> qtquickcontrols_git.bb
> index 69f3d3b..83ed908 100644
> --- a/recipes-qt/qt5/qtquickcontrols_git.bb
> +++ b/recipes-qt/qt5/qtquickcontrols_git.bb
> @@ -17,8 +17,13 @@ DEPENDS +=3D "qtdeclarative"
>
>  RDEPENDS_${PN}-dev =3D ""
>
> +FILES_${PN}-qmlplugins +=3D " \
> +  ${OE_QMAKE_PATH_QML}/QtQuick/Controls/Shaders \
> +  ${OE_QMAKE_PATH_QML}/QtQuick/Dialogs/qml/icons.ttf \
> +"
> +
>  SRC_URI +=3D " \
>      file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.pat=
ch
> \
>  "
>
> -SRCREV =3D "201c86391c7ff78d570fdec6e0c0b71eb1e9aae4"
> +SRCREV =3D "dacb91916b202208681471ba764504c7c7d086f0"
> diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/
> qtremoteobjects_git.bb
> new file mode 100644
> index 0000000..550e030
> --- /dev/null
> +++ b/recipes-qt/qt5/qtremoteobjects_git.bb
> @@ -0,0 +1,14 @@
> +LICENSE =3D "BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 ) & (
> GPL-2.0+ | LGPL-3.0 ) | The-Qt-Company-Commercial"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> +    file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> +    file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073 \
> +    file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> +"
> +
> +require qt5.inc
> +require qt5-git.inc
> +
> +DEPENDS +=3D "qtbase qtdeclarative"
> +
> +SRCREV =3D "ae0b101884b05355e3a7bc06dbca722ad3d08d0f"
> diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git=
.
> bb
> index 3f8b64a..ae5e0da 100644
> --- a/recipes-qt/qt5/qtscript_git.bb
> +++ b/recipes-qt/qt5/qtscript_git.bb
> @@ -25,4 +25,4 @@ ARM_INSTRUCTION_SET_armv5 =3D "arm"
>
>  DEPENDS +=3D "qtbase"
>
> -SRCREV =3D "c35df2ec0ee05351912e768d298a7c627dbdd1ef"
> +SRCREV =3D "e00ca9b6bec2adf78fd14e02376ecf1b55a93b0c"
> diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.b=
b
> index d69d00f..c2c00e1 100644
> --- a/recipes-qt/qt5/qtscxml_git.bb
> +++ b/recipes-qt/qt5/qtscxml_git.bb
> @@ -10,7 +10,7 @@ require qt5-git.inc
>
>  DEPENDS +=3D "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
>
> -SRCREV =3D "4704292500b98143eee9b0fb0b6a34a858ed1253"
> +SRCREV =3D "eff82ac957e051f16f64c287f2dfaec9049bdfc1"
>
>  SRC_URI +=3D "file://0001-Use-external-host-bin-path-for-cmake-file.patc=
h"
>
> diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_
> git.bb
> index 93a0971..17d0639 100644
> --- a/recipes-qt/qt5/qtsensors_git.bb
> +++ b/recipes-qt/qt5/qtsensors_git.bb
> @@ -13,4 +13,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase qtdeclarative"
>
> -SRCREV =3D "1220a31e6c2f91b34b4a05773621dddab8c4315a"
> +SRCREV =3D "0c3c4d01ea34ed98a0d2928662f07b673f00535d"
> diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/
> qtserialbus_git.bb
> index 325d975..93a826b 100644
> --- a/recipes-qt/qt5/qtserialbus_git.bb
> +++ b/recipes-qt/qt5/qtserialbus_git.bb
> @@ -11,4 +11,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase qtserialport"
>
> -SRCREV =3D "c8fe92ef54b2d310e8c8c143962fd6f43bf46c27"
> +SRCREV =3D "20811e3b004af817e3f02982c755e8b1560b8c3d"
> diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/
> qtserialport_git.bb
> index edecc04..957000c 100644
> --- a/recipes-qt/qt5/qtserialport_git.bb
> +++ b/recipes-qt/qt5/qtserialport_git.bb
> @@ -15,4 +15,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase"
>
> -SRCREV =3D "74aad2578ecb6739007449a06a54dd7abd64c85b"
> +SRCREV =3D "687f5a9bd44a45a29d24925f29470c43d6729dee"
> diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
> index 24a0d91..fb8d44e 100644
> --- a/recipes-qt/qt5/qtsvg_git.bb
> +++ b/recipes-qt/qt5/qtsvg_git.bb
> @@ -12,4 +12,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase"
>
> -SRCREV =3D "1b3a7ae14d25f1caa3f6bedad3cfeb7d83b3904e"
> +SRCREV =3D "4fd787e90c70afbaa168abb3efdb8757ba77f3a4"
> diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-de=
pendent-libraries.patch
> b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-
> dependent-libraries.patch
> deleted file mode 100644
> index 17d5d51..0000000
> --- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-
> dependent-libraries.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 95a418157ce5f49052ec1c349581d1811a79c9eb Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Fri, 17 Jan 2014 14:33:19 +0100
> -Subject: [PATCH] assistant/help: fix linking of dependent libraries
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -else we get:
> -| ...ld: warning: libQt5CLucene.so.5, needed by ...libQt5Help.so, not
> found (try using -rpath or -rpath-link)
> -| ...undefined reference to `QCLucenePhraseQuery::getTerms() const'
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> - src/assistant/help/help.pro | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/assistant/help/help.pro b/src/assistant/help/help.pro
> -index 37d5ba4..8de8763 100644
> ---- a/src/assistant/help/help.pro
> -+++ b/src/assistant/help/help.pro
> -@@ -60,3 +60,5 @@ HEADERS +=3D qhelpsearchindexwriter_clucene_p.h \
> -     qhelpsearchindexreader_clucene_p.h
> -
> - load(qt_module)
> -+
> -+LIBS +=3D -lQt5CLucene
> diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.b=
b
> index 5c0f51c..9ca90a2 100644
> --- a/recipes-qt/qt5/qttools_git.bb
> +++ b/recipes-qt/qt5/qttools_git.bb
> @@ -4,13 +4,9 @@ require qt5-git.inc
>  LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1=
.0
> | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 |
> The-Qt-Company-Commercial )"
>  LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> -    file://LICENSE.LGPLv21;md5=3Dfb91571854638f10b2e5f36562661a5a \
> -    file://LICENSE.LGPLv3;md5=3Da909b94c1c9674b2aa15ff03a86f518a \
>      file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>      file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
>      file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073 \
> -    file://LICENSE.GPLv3;md5=3Dbfdd8aa675169432d6d9b63d056de148 \
> -    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
>
> @@ -20,8 +16,6 @@ DEPENDS +=3D "qtbase qtdeclarative qtxmlpatterns"
>
>  SRC_URI +=3D " \
>      file://run-ptest \
> -    file://0002-assistant-help-fix-linking-of-dependent-libraries.patch =
\
> -    file://0003-add-noqtwebkit-configuration.patch \
>      file://0004-linguist-tools-cmake-allow-overriding-the-location-f.pat=
ch
> \
>  "
>
> @@ -33,7 +27,7 @@ PACKAGECONFIG[qtwebkit] =3D ",,qtwebkit"
>
>  EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'qtwebkit', '', 'CONFIG+=3Dnoqtwebkit', d)}"
>
> -SRCREV =3D "30c10900adecca55faa1d59c2f0caac74b1f9df6"
> +SRCREV =3D "88e02bb0a9b97d68a4b270e4ddfb6d0847c702a9"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/
> qttranslations_git.bb
> index 53ab199..822517f 100644
> --- a/recipes-qt/qt5/qttranslations_git.bb
> +++ b/recipes-qt/qt5/qttranslations_git.bb
> @@ -114,4 +114,4 @@ FILES_${PN}-qt =3D " \
>      ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
>  "
>
> -SRCREV =3D "c0ae29b2328922f16cb2305f8579c2a869c871b0"
> +SRCREV =3D "3e727a890f7856978469ee38ef0619b1b59a8ca7"
> diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/
> qtvirtualkeyboard_git.bb
> index 08914b1..6d45a50 100644
> --- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
> +++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
> @@ -49,4 +49,4 @@ FILES_${PN} +=3D "${OE_QMAKE_PATH_DATA}/
> qtvirtualkeyboard/lipi_toolkit"
>
>  DEPENDS +=3D "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg
> qtxmlpatterns"
>
> -SRCREV =3D "cfa4ab4cbf13971d4b71ee920353822755a3bf31"
> +SRCREV =3D "bdf61afe76e94ef03da1332c4540646f18f5852f"
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_
> git.bb
> index bcddb32..26ef853 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -7,13 +7,9 @@ DEPENDS_append_class-target =3D " libxkbcommon"
>  LICENSE =3D "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1=
.0
> | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 |
> The-Qt-Company-Commercial )"
>  LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.LGPL3;md5=3De6a600fd5e1d9cbde2d983680233ad02 \
> -    file://LICENSE.LGPLv21;md5=3D4bfd28363f541b10d9f024181b8df516 \
> -    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
>      file://LICENSE.GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>      file://LICENSE.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
>      file://LICENSE.GPL3-EXCEPT;md5=3D763d8c535a234d9a3fb682c7ecb6c073 \
> -    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
> -    file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
>
> @@ -41,7 +37,7 @@ PACKAGECONFIG[libhybris-egl-server] =3D
> "-feature-libhybris-egl-server,-no-feature
>
>  EXTRA_QMAKEVARS_CONFIGURE +=3D "${PACKAGECONFIG_CONFARGS}"
>
> -SRCREV =3D "0e2a950895805457a45abe860bc91a7cc4ba405e"
> +SRCREV =3D "f1cf62fa8e9ffa2548c9968906848596f50dbc0b"
>
>  # From https://bugreports.qt.io/browse/QTBUG-57767
>  SRC_URI +=3D " \
> diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/
> qtwebchannel_git.bb
> index d5f8685..f1167a9 100644
> --- a/recipes-qt/qt5/qtwebchannel_git.bb
> +++ b/recipes-qt/qt5/qtwebchannel_git.bb
> @@ -17,4 +17,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtdeclarative qtwebsockets"
>
> -SRCREV =3D "e3ddde4b26a72d57beeeed4e2d3384896e3a399d"
> +SRCREV =3D "6383f0fc5eec4935697a6d2d2f87b511bbeb678e"
> diff --git a/recipes-qt/qt5/qtwebengine/0001-Force-host-toolchain-configu=
ration.patch
> b/recipes-qt/qt5/qtwebengine/0001-Force-host-toolchain-configuration.patc=
h
> new file mode 100644
> index 0000000..e10d3b8
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebengine/0001-Force-host-toolchain-
> configuration.patch
> @@ -0,0 +1,69 @@
> +From 5c879db32cde9bee9c9073842ecc281172f19453 Mon Sep 17 00:00:00 2001
> +From: Samuli Piippo <samuli.piippo@qt.io>
> +Date: Wed, 15 Mar 2017 13:53:28 +0200
> +Subject: [PATCH] Force host toolchain configuration
> +
> +Force gcc/g++ to be used for parts using host toolchain, since
> +the option(host_build) does not work in yocto builds.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> +---
> + src/buildtools/configure_host.pro | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/buildtools/configure_host.pro b/src/buildtools/
> configure_host.pro
> +index d8d731d..89dade4 100644
> +--- a/src/buildtools/configure_host.pro
> ++++ b/src/buildtools/configure_host.pro
> +@@ -16,9 +16,9 @@ GN_CONTENTS =3D \
> + "import(\"//build/config/sysroot.gni\")" \
> + "import(\"//build/toolchain/gcc_toolchain.gni\")" \
> + "gcc_toolchain(\"host\") {" \
> +-"  cc =3D \"$$which($$QMAKE_CC)\" " \
> +-"  cxx =3D \"$$which($$QMAKE_CXX)\" " \
> +-"  ld =3D \"$$which($$QMAKE_LINK)\" " \
> ++"  cc =3D \"$$which(gcc)\" " \
> ++"  cxx =3D \"$$which(g++)\" " \
> ++"  ld =3D \"$$which(g++)\" " \
> + "  ar =3D \"$$which(ar)\" " \
> + "  nm =3D \"$$which(nm)\" " \
> + "  toolchain_args =3D { " \
> +@@ -27,9 +27,9 @@ GN_CONTENTS =3D \
> + "  } " \
> + "}" \
> + "gcc_toolchain(\"v8_snapshot\") {" \
> +-"  cc =3D \"$$which($$QMAKE_CC)\" " \
> +-"  cxx =3D \"$$which($$QMAKE_CXX)\" " \
> +-"  ld =3D \"$$which($$QMAKE_LINK)\" " \
> ++"  cc =3D \"$$which(gcc)\" " \
> ++"  cxx =3D \"$$which(g++)\" " \
> ++"  ld =3D \"$$which(g++)\" " \
> + "  ar =3D \"$$which(ar)\" " \
> + "  nm =3D \"$$which(nm)\" " \
> + "  toolchain_args =3D { " \
> +diff --git a/src/3rdparty/chromium/tools/gn/bootstrap/bootstrap.py
> b/src/3rdparty/chromium/tools/gn/bootstrap/bootstrap.py
> +index 75b9690..601f688 100755
> +--- a/src/3rdparty/chromium/tools/gn/bootstrap/bootstrap.py
> ++++ b/src/3rdparty/chromium/tools/gn/bootstrap/bootstrap.py
> +@@ -298,14 +298,14 @@ def write_gn_ninja(path, root_gen_dir, options):
> +     ld =3D os.environ.get('LD', 'link.exe')
> +     ar =3D os.environ.get('AR', 'lib.exe')
> +   else:
> +-    cc =3D os.environ.get('CC', 'cc')
> +-    cxx =3D os.environ.get('CXX', 'c++')
> ++    cc =3D os.environ.get('CC_host', 'gcc')
> ++    cxx =3D os.environ.get('CXX_host', 'g++')
> +     ld =3D cxx
> +-    ar =3D os.environ.get('AR', 'ar')
> ++    ar =3D os.environ.get('AR_host', 'ar')
> +
> +-  cflags =3D os.environ.get('CFLAGS', '').split()
> +-  cflags_cc =3D os.environ.get('CXXFLAGS', '').split()
> +-  ldflags =3D os.environ.get('LDFLAGS', '').split()
> ++  cflags =3D os.environ.get('CFLAGS_host', '').split()
> ++  cflags_cc =3D os.environ.get('CXXFLAGS_host', '').split()
> ++  ldflags =3D os.environ.get('LDFLAGS_host', '').split()
> +   include_dirs =3D [root_gen_dir, SRC_ROOT]
> +   libs =3D []
> +
> diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-
> include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/
> 0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
> deleted file mode 100644
> index ccd43e2..0000000
> --- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-
> include-atomicops_internals_x86_g.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From db56cd0fd185a9f3858f5aa6e95b24e63dee119f Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Fri, 3 Oct 2014 03:52:11 +0200
> -Subject: [PATCH] <chromium> base.gypi: include
> atomicops_internals_x86_gcc.cc
> - when building for x64 arch
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - src/3rdparty/chromium/base/base.gypi | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/3rdparty/chromium/base/base.gypi
> b/src/3rdparty/chromium/base/base.gypi
> -index 63c3f76..331c975 100644
> ---- a/src/3rdparty/chromium/base/base.gypi
> -+++ b/src/3rdparty/chromium/base/base.gypi
> -@@ -801,7 +801,7 @@
> -                 ['include', '^nix/'],
> -               ],
> -           }],
> --          ['use_qt=3D=3D1 and target_arch=3D=3D"ia32"', {
> -+          ['use_qt=3D=3D1 and target_arch=3D=3D"ia32" or target_arch=3D=
=3D"x64"', {
> -               'sources/': [
> -                 ['include', 'atomicops_internals_x86_gcc.cc'],
> -               ],
> diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-workaround-for-too-=
long-.rps-file-name.patch
> b/recipes-qt/qt5/qtwebengine/0001-chromium-workaround-for-
> too-long-.rps-file-name.patch
> new file mode 100644
> index 0000000..42ceeac
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebengine/0001-chromium-workaround-for-
> too-long-.rps-file-name.patch
> @@ -0,0 +1,42 @@
> +From c72097e8790553771daf3231124c3fbe1a438379 Mon Sep 17 00:00:00 2001
> +From: Samuli Piippo <samuli.piippo@qt.io>
> +Date: Thu, 30 Mar 2017 11:37:24 +0300
> +Subject: [PATCH] chromium: workaround for too long .rps file name
> +
> +Ninja may fail when the build directory is too long:
> +
> +ninja: error: WriteFile(__third_party_WebKit_Source_bindings_modules_\
> +interfaces_info_individual_modules__home_qt_work_build_build-nitrogen\
> +6x_tmp_work_cortexa9hf-neon-mx6qdl-poky-linux-gnueabi_qtwebengine_5.9\
> +.0_gitAUTOINC_29afdb0a34_049134677a-r0_build_src_toolchain_target__ru\
> +le.rsp): Unable to create file. File name too long
> +
> +Task-number: QTBUG-59769
> +Change-Id: I73c5e64ae5174412be2a675e35b0b6047f2bf4c1
> +---
> + src/3rdparty/chromium/tools/gn/ninja_action_target_writer.cc | 9
> +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/src/3rdparty/chromium/tools/gn/ninja_action_target_writer.c=
c
> b/src/3rdparty/chromium/tools/gn/ninja_action_target_writer.cc
> +index a5bc6cd..5cefbfe 100644
> +--- a/src/3rdparty/chromium/tools/gn/ninja_action_target_writer.cc
> ++++ b/src/3rdparty/chromium/tools/gn/ninja_action_target_writer.cc
> +@@ -115,9 +115,18 @@ std::string NinjaActionTargetWriter::WriteRuleDefin=
ition()
> {
> +     // strictly necessary for regular one-shot actions, but it's easier
> to
> +     // just always define unique_name.
> +     std::string rspfile =3D custom_rule_name;
> ++
> ++    //quick workaround if filename length > 255 - ".rsp", just cut the
> dirs starting from the end
> ++    //please note ".$unique_name" is not used at the moment
> ++    int pos =3D 0;
> ++    std::string delimiter("_");
> ++    while (rspfile.length() > 251 && (pos =3D rspfile.find_last_of(deli=
miter))
> !=3D std::string::npos)
> ++        rspfile =3D rspfile.substr(0,pos);
> ++
> +     if (!target_->sources().empty())
> +       rspfile +=3D ".$unique_name";
> +     rspfile +=3D ".rsp";
> ++
> +     out_ << "  rspfile =3D " << rspfile << std::endl;
> +
> +     // Response file contents.
> diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-
> match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/
> 0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
> deleted file mode 100644
> index b7bd5a4..0000000
> --- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-
> match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 793db05d66b7a92ebe069dc76093487489dd8b69 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Mon, 30 Jun 2014 20:08:17 +0200
> -Subject: [PATCH] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
> - anywhere in path, but at the end
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - tools/qmake/mkspecs/features/functions.prf | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/tools/qmake/mkspecs/features/functions.prf
> b/tools/qmake/mkspecs/features/functions.prf
> -index 20fb278..7aa0b4a 100644
> ---- a/tools/qmake/mkspecs/features/functions.prf
> -+++ b/tools/qmake/mkspecs/features/functions.prf
> -@@ -168,9 +168,9 @@ defineReplace(mocOutput) {
> -   out =3D $$1
> -   # The order is important, since the output of the second replace woul=
d
> end up accidentaly transformed by the first one
> -   for(ext, $$list($${QMAKE_EXT_CPP})): \
> --      out =3D $$replace(out, ^(.*)($$re_escape($${ext})),
> $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
> -+      out =3D $$replace(out, ^(.*)($$re_escape($${ext}))$,
> $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
> -   for(ext, $$list($${QMAKE_EXT_H})): \
> --      out =3D $$replace(out, ^(.*)($$re_escape($${ext})),
> $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
> -+      out =3D $$replace(out, ^(.*)($$re_escape($${ext}))$,
> $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
> -   return($$out)
> - }
> -
> diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-
> we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/
> 0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
> deleted file mode 100644
> index e487c6a..0000000
> --- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-
> we-only-use-the-file-name-to.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From aa5bb11072bc0e441dc6533f53ed5359c5000088 Mon Sep 17 00:00:00 2001
> -From: Simon Busch <morphis@gravedo.de>
> -Date: Tue, 18 Nov 2014 10:38:18 +0100
> -Subject: [PATCH] functions.prf: Make sure we only use the file name to
> - generate it's moc'ed abbreviation
> -
> -Signed-off-by: Simon Busch <morphis@gravedo.de>
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - tools/qmake/mkspecs/features/functions.prf | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/tools/qmake/mkspecs/features/functions.prf
> b/tools/qmake/mkspecs/features/functions.prf
> -index 7aa0b4a..9b3a639 100644
> ---- a/tools/qmake/mkspecs/features/functions.prf
> -+++ b/tools/qmake/mkspecs/features/functions.prf
> -@@ -165,7 +165,8 @@ defineReplace(findIncludedMocFiles) {
> - }
> -
> - defineReplace(mocOutput) {
> --  out =3D $$1
> -+  in =3D $$1
> -+  out =3D $$basename(in)
> -   # The order is important, since the output of the second replace woul=
d
> end up accidentaly transformed by the first one
> -   for(ext, $$list($${QMAKE_EXT_CPP})): \
> -       out =3D $$replace(out, ^(.*)($$re_escape($${ext}))$,
> $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
> diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-
> build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/
> 0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
> deleted file mode 100644
> index 786a383..0000000
> --- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-
> build-for-linux-oe-g-platform.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 6918d25c54ec4bc17a9b612c0d24b0f01be3aca1 Mon Sep 17 00:00:00 2001
> -From: Frieder Schrempf <frieder.schrempf@online.de>
> -Date: Mon, 1 Dec 2014 14:34:40 +0000
> -Subject: [PATCH] functions.prf: allow build for linux-oe-g++ platform
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Frieder Schrempf <frieder.schrempf@online.de>
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - tools/qmake/mkspecs/features/functions.prf | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/tools/qmake/mkspecs/features/functions.prf
> b/tools/qmake/mkspecs/features/functions.prf
> -index 9b3a639..dc5ed1c 100644
> ---- a/tools/qmake/mkspecs/features/functions.prf
> -+++ b/tools/qmake/mkspecs/features/functions.prf
> -@@ -5,6 +5,12 @@ defineTest(isPlatformSupported) {
> -       return(false)
> -     }
> -     gcc:!clang:!isGCCVersionSupported(): return(false)
> -+  } else:linux-oe-g++* {
> -+    !gcc:!clang {
> -+      skipBuild("Qt WebEngine on Linux requires clang or GCC.")
> -+      return(false)
> -+    }
> -+    gcc:!clang:!isGCCVersionSupported(): return(false)
> -   } else:win32 {
> -     winrt {
> -       skipBuild("WinRT is not supported.")
> diff --git a/recipes-qt/qt5/qtwebengine/0004-WebEngine-
> qquickwebengineview_p_p.h-add-include-QCol.patch
> b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add=
-
> include-QCol.patch
> deleted file mode 100644
> index d10ddf7..0000000
> --- a/recipes-qt/qt5/qtwebengine/0004-WebEngine-
> qquickwebengineview_p_p.h-add-include-QCol.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From 6ed60f35761ab268004727be544e9ccf70594211 Mon Sep 17 00:00:00 2001
> -From: Cleiton Bueno <cleitonrbueno@gmail.com>
> -Date: Fri, 25 Dec 2015 18:16:05 -0200
> -Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
> -
> -Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
> ----
> - src/webengine/api/qquickwebengineview_p_p.h | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/webengine/api/qquickwebengineview_p_p.h
> b/src/webengine/api/qquickwebengineview_p_p.h
> -index f13bfd0..0e12244 100644
> ---- a/src/webengine/api/qquickwebengineview_p_p.h
> -+++ b/src/webengine/api/qquickwebengineview_p_p.h
> -@@ -60,6 +60,8 @@
> - #include <QString>
> - #include <QtCore/qcompilerdetection.h>
> - #include <QtGui/qaccessibleobject.h>
> -+#include <QColor>
> -+
> -
> - namespace QtWebEngineCore {
> - class WebContentsAdapter;
> diff --git a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-
> QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/
> 0005-Include-dependency-to-QCoreApplication-translate.patch
> deleted file mode 100644
> index 27bd141..0000000
> --- a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-
> QCoreApplication-translate.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From 4105c12d6f91171934f60b4dbb74b1ca7a9a3eb2 Mon Sep 17 00:00:00 2001
> -From: Cleiton Bueno <cleitonrbueno@gmail.com>
> -Date: Thu, 24 Dec 2015 15:59:51 -0200
> -Subject: [PATCH] Include dependency to QCoreApplication::translate()
> -
> -Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
> ----
> - src/core/media_capture_devices_dispatcher.h | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/core/media_capture_devices_dispatcher.h
> b/src/core/media_capture_devices_dispatcher.h
> -index b13a9da..8a54cce 100644
> ---- a/src/core/media_capture_devices_dispatcher.h
> -+++ b/src/core/media_capture_devices_dispatcher.h
> -@@ -46,6 +46,8 @@
> - #include <map>
> - #include <QtCore/qcompilerdetection.h>
> -
> -+#include <QCoreApplication>
> -+
> - #include "web_contents_adapter_client.h"
> -
> - #include "base/callback.h"
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/
> qtwebengine_git.bb
> index deb336f..26d2e28 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -14,6 +14,7 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D " \
>      ninja-native \
> +    yasm-native \
>      qtwebchannel \
>      qtbase qtdeclarative qtxmlpatterns qtquickcontrols \
>      qtlocation \
> @@ -23,12 +24,12 @@ DEPENDS +=3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} =
\
>  "
>
> -DEPENDS +=3D "yasm-native"
>  EXTRA_QMAKEVARS_PRE +=3D "GYP_CONFIG+=3Duse_system_yasm GYP_CONFIG+=3Dge=
nerate_
> character_data=3D0"
> +EXTRA_QMAKEVARS_CONFIGURE +=3D "-feature-system-ninja -no-feature-system=
-gn"
>
>  # To use system ffmpeg you need to enable also libwebp, opus, vpx
>  # Only depenedencies available in oe-core are enabled by default
> -PACKAGECONFIG ??=3D "libwebp flac libevent libxslt speex"
> +PACKAGECONFIG ??=3D "libwebp flac libevent libxslt speex nss"
>  PACKAGECONFIG[opus] =3D "WEBENGINE_CONFIG+=3Duse_system_opus,,libopus"
>  PACKAGECONFIG[icu] =3D "WEBENGINE_CONFIG+=3Duse_system_icu,,icu"
>  PACKAGECONFIG[ffmpeg] =3D "WEBENGINE_CONFIG+=3Duse_system_ffmpeg,,libav"
> @@ -38,6 +39,7 @@ PACKAGECONFIG[libevent] =3D "WEBENGINE_CONFIG+=3Duse_sy=
stem_
> libevent,,libevent"
>  PACKAGECONFIG[libxslt] =3D "WEBENGINE_CONFIG+=3Duse_system_libxslt,,libx=
slt"
>  PACKAGECONFIG[speex] =3D "WEBENGINE_CONFIG+=3Duse_system_speex,,speex"
>  PACKAGECONFIG[vpx] =3D "WEBENGINE_CONFIG+=3Duse_system_vpx,,libvpx"
> +PACKAGECONFIG[nss] =3D "WEBENGINE_CONFIG+=3Duse_nss,,nss"
>
>  EXTRA_QMAKEVARS_PRE +=3D "${PACKAGECONFIG_CONFARGS}"
>
> @@ -61,37 +63,35 @@ def gettext_oeconf(d):
>  require qt5.inc
>  require qt5-git.inc
>
> -export NINJA_PATH=3D"${STAGING_BINDIR_NATIVE}/ninja"
> -
>  do_configure() {
> -    # replace LD with CXX, to workaround a possible gyp inheritssue?
> -    export LD=3D"${CXX}"
> -    export CC=3D"${CC}"
> -    export CXX=3D"${CXX}"
> -    export CC_host=3D"gcc"
> -    export CXX_host=3D"g++"
> -    export QMAKE_MAKE_ARGS=3D"${EXTRA_OEMAKE}"
> -    export QMAKE_CACHE_EVAL=3D"${PACKAGECONFIG_CONFARGS}"
> -
>      # Disable autodetection from sysroot:
> -    sed -i 's/packagesExist([^)]*vpx[^)]*):/false:/g;
> s/config_libvpx:/false:/g; s/config_srtp:/false:/g;
> s/config_snappy:/false:/g; s/packagesExist(nss):/false:/g;
> s/packagesExist(minizip, zlib):/false:/g; s/packagesExist(libwebp,libwebp=
demux):/false:/g;
> s/packagesExist(libxml-2.0,libxslt):/false:/g; s/^
> *packagesExist($$package):/false:/g' ${S}/tools/qmake/mkspecs/
> features/configure.prf
> +    sed -e 's/packagesExist([^)]*vpx[^)]*):/false:/g'\
> +        -e 's/config_libvpx:/false:/g' \
> +        -e 's/config_srtp:/false:/g' \
> +        -e 's/config_snappy:/false:/g' \
> +        -e 's/packagesExist(nss):/false:/g' \
> +        -e 's/packagesExist(minizip, zlib):/false:/g' \
> +        -e 's/packagesExist(libwebp,libwebpdemux):/false:/g' \
> +        -e 's/packagesExist(libxml-2.0,libxslt):/false:/g'\
> +        -e 's/^ *packagesExist($$package):/false:/g' \
> +        -i ${S}/mkspecs/features/configure.prf
>
>      # qmake can't find the OE_QMAKE_* variables on it's own so directly
> passing them as
>      # arguments here
> -    ${OE_QMAKE_QMAKE} -r ${EXTRA_QMAKEVARS_PRE} ${S} \
> -        QMAKE_CXX=3D"${OE_QMAKE_CXX}" QMAKE_CC=3D"${OE_QMAKE_CC}" \
> +    ${OE_QMAKE_QMAKE} ${EXTRA_QMAKEVARS_PRE} ${S} \
> +        QMAKE_CXX=3D"${OE_QMAKE_CXX}" \
> +        QMAKE_CC=3D"${OE_QMAKE_CC}" \
>          QMAKE_LINK=3D"${OE_QMAKE_LINK}" \
>          QMAKE_CFLAGS=3D"${OE_QMAKE_CFLAGS}" \
>          QMAKE_CXXFLAGS=3D"${OE_QMAKE_CXXFLAGS}" \
> -        QMAKE_AR=3D"${OE_QMAKE_AR} cqs" \
> -        -after ${EXTRA_QMAKEVARS_POST}
> +        -after ${EXTRA_QMAKEVARS_POST} -- \
> +        ${EXTRA_QMAKEVARS_CONFIGURE}
>  }
>
>  do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
>
>  do_install_append() {
> -    rmdir ${D}${OE_QMAKE_PATH_PLUGINS}/${BPN}
> ${D}${OE_QMAKE_PATH_PLUGINS} || true
> -    sed -i 's@ -Wl,--start-group.*-Wl,--end-group@@g; s@-L${B}[^ ]* @
> @g' ${D}${libdir}/pkgconfig/Qt5WebEngineCore.pc
> +    sed -i 's@ -Wl,--start-group.*-Wl,--end-group@@g; s@[^ ]*${B}[^ ]*
> @@g' ${D}${libdir}/pkgconfig/Qt5WebEngineCore.pc
>  }
>  PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
>
> @@ -104,21 +104,17 @@ RDEPENDS_${PN}-examples +=3D " \
>      qtdeclarative-qmlplugins \
>  "
>
> -QT_MODULE_BRANCH_CHROMIUM =3D "53-based"
> +QT_MODULE_BRANCH_CHROMIUM =3D "56-based"
>
>  SRC_URI +=3D " \
>      ${QT_GIT}/qtwebengine-chromium.git;name=3Dchromium;
> branch=3D${QT_MODULE_BRANCH_CHROMIUM};protocol=3D${QT_GIT_
> PROTOCOL};destsuffix=3Dgit/src/3rdparty \
> -    file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.pat=
ch
> \
> -    file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.pat=
ch
> \
> -    file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch =
\
> -    file://0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.pat=
ch
> \
> -    file://0005-Include-dependency-to-QCoreApplication-translate.patch \
> -    file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.pat=
ch
> \
> +    file://0001-Force-host-toolchain-configuration.patch \
> +    file://0001-chromium-workaround-for-too-long-.rps-file-name.patch \
>      file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.pat=
ch
> \
>  "
>
> -SRCREV_qtwebengine =3D "d740d6a7dbfec387752c7bc8a8b06db0e757c9dc"
> -SRCREV_chromium =3D "15d257fd921f37b32ef643225f21df0ea24c8302"
> +SRCREV_qtwebengine =3D "73f7be5b2a95eab3dce11caede538eeb7beb71f2"
> +SRCREV_chromium =3D "aa2fdd6be3d465280d2a0c3aacdc738bb4ffec05"
>  SRCREV =3D "${SRCREV_qtwebengine}"
>
>  SRCREV_FORMAT =3D "qtwebengine_chromium"
> diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/
> qtwebkit-examples_git.bb
> index 84b4d0b..286aeca 100644
> --- a/recipes-qt/qt5/qtwebkit-examples_git.bb
> +++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
> @@ -17,4 +17,4 @@ DEPENDS +=3D "qtwebkit qtxmlpatterns"
>  RDEPENDS_${PN}-examples +=3D "qtwebkit-qmlplugins"
>  RDEPENDS_${PN}-examples +=3D "${@bb.utils.contains('PACKAGECONFIG_OPENSS=
L',
> 'openssl', 'ca-certificates', '', d)}"
>
> -SRCREV =3D "f0898f83abdcacc8bd3bca3479884376b0963398"
> +SRCREV =3D "822426abc77a74752b0ee0da4d0a1c106c4dac22"
> diff --git a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
> b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
> deleted file mode 100644
> index d7627ec..0000000
> --- a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -From f6989fec34f0bafdeda549d71751f236ef1f3b96 Mon Sep 17 00:00:00 2001
> -From: Magnus Granberg <zorry@gentoo.org>
> -Date: Fri, 27 Feb 2015 11:55:09 +0100
> -Subject: [PATCH] Remove TEXTREL tag in x86
> -
> -Fix textrel QA warnings when building qtwebkit for x86:
> -
> -  WARNING: QA Issue: ELF binary '/home/andre/rdk/rdk-master/
> build-vbox32/tmp/work/core2-32-rdk-linux/qtwebkit/5.4.0-
> r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations
> in .text [textrel]
> -
> -Patch from upstream webkit:
> -
> -  https://bugs.webkit.org/show_bug.cgi?id=3D70610
> -
> -Minor refresh required to apply cleanly to the older webkit sources used
> -by qtwebkit. Specifically, the patch needed to be modified to account
> -for PLATFORM(MAC) -> OS(DARWIN) renaming in recent webkit which is not
> -part of qtwebkit yet ( https://bugs.webkit.org/show_bug.cgi?id=3D99683 )=
.
> -
> -Upstream status [webkit] : backport
> -Upstream status [qtwebkit] : unclear
> -
> -Bug: https://bugs.webkit.org/show_bug.cgi?id=3D70610
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - Source/JavaScriptCore/jit/ThunkGenerators.cpp | 24
> ++++++++++++++++++++++++
> - Source/WTF/wtf/InlineASM.h                    |  2 ++
> - 2 files changed, 26 insertions(+)
> -
> -diff --git a/Source/JavaScriptCore/jit/ThunkGenerators.cpp
> b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
> -index 9684df2..8af82d8 100644
> ---- a/Source/JavaScriptCore/jit/ThunkGenerators.cpp
> -+++ b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
> -@@ -524,6 +524,30 @@ double jsRound(double d)
> -     } \
> -     static MathThunk UnaryDoubleOpWrapper(function) =3D &function##Thun=
k;
> -
> -+#elif CPU(X86) && COMPILER(GCC) && OS(LINUX) && defined(__PIC__)
> -+#define defineUnaryDoubleOpWrapper(function) \
> -+    asm( \
> -+        ".text\n" \
> -+        ".globl " SYMBOL_STRING(function##Thunk) "\n" \
> -+        HIDE_SYMBOL(function##Thunk) "\n" \
> -+        SYMBOL_STRING(function##Thunk) ":" "\n" \
> -+        "pushl %ebx\n" \
> -+        "subl $20, %esp\n" \
> -+        "movsd %xmm0, (%esp) \n" \
> -+        "call __x86.get_pc_thunk.bx\n" \
> -+        "addl $_GLOBAL_OFFSET_TABLE_, %ebx\n" \
> -+        "call " GLOBAL_REFERENCE(function) "\n" \
> -+        "fstpl (%esp) \n" \
> -+        "movsd (%esp), %xmm0 \n" \
> -+        "addl $20, %esp\n" \
> -+        "popl %ebx\n" \
> -+        "ret\n" \
> -+    );\
> -+    extern "C" { \
> -+        MathThunkCallingConvention function##Thunk(MathThunkCallingConv=
ention);
> \
> -+    } \
> -+    static MathThunk UnaryDoubleOpWrapper(function) =3D &function##Thun=
k;
> -+
> - #elif CPU(X86) && COMPILER(GCC) && (PLATFORM(MAC) || OS(LINUX))
> - #define defineUnaryDoubleOpWrapper(function) \
> -     asm( \
> -diff --git a/Source/WTF/wtf/InlineASM.h b/Source/WTF/wtf/InlineASM.h
> -index 0a2fe78..2dc40ef 100644
> ---- a/Source/WTF/wtf/InlineASM.h
> -+++ b/Source/WTF/wtf/InlineASM.h
> -@@ -46,6 +46,8 @@
> - #define GLOBAL_REFERENCE(name) #name "@plt"
> - #elif CPU(X86) && COMPILER(MINGW)
> - #define GLOBAL_REFERENCE(name) "@" #name "@4"
> -+#elif OS(LINUX) && CPU(X86) && defined(__PIC__)
> -+#define GLOBAL_REFERENCE(name) SYMBOL_STRING(name) "@plt"
> - #else
> - #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
> - #endif
> diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git=
.
> bb
> index 4845d0f..722af85 100644
> --- a/recipes-qt/qt5/qtwebkit_git.bb
> +++ b/recipes-qt/qt5/qtwebkit_git.bb
> @@ -20,7 +20,6 @@ ARM_INSTRUCTION_SET_armv5 =3D "arm"
>
>  SRC_URI +=3D "\
>      file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
> -    file://0002-Remove-TEXTREL-tag-in-x86.patch \
>      file://0003-Exclude-backtrace-API-for-non-glibc-libraries.patch \
>  "
>
> @@ -86,4 +85,4 @@ PACKAGES_remove =3D "${PN}-examples-dev
> ${PN}-examples-staticdev ${PN}-examples-db
>  RUBY_SYS =3D "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586',
> 'i386').replace('i686', 'i386') }"
>  export RUBYLIB=3D"${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_
> LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
>
> -SRCREV =3D "74ac5b0f3489f9a08d083b6c9607c9d5c2d4afd2"
> +SRCREV =3D "f27089657a207ef8c5c9d27d661d3d12c3af8df2"
> diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/
> qtwebsockets_git.bb
> index 043b394..41ec27f 100644
> --- a/recipes-qt/qt5/qtwebsockets_git.bb
> +++ b/recipes-qt/qt5/qtwebsockets_git.bb
> @@ -11,4 +11,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase qtdeclarative"
>
> -SRCREV =3D "afb3c58d035db1119666c8556c215187be4f64b8"
> +SRCREV =3D "1421c3e4ae4213ca18f2f51d5ddb38e223450222"
> diff --git a/recipes-qt/qt5/qtwebview/0001-Add-missing-include-for-qWarni=
ng.patch
> b/recipes-qt/qt5/qtwebview/0001-Add-missing-include-for-qWarning.patch
> new file mode 100644
> index 0000000..82087b9
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebview/0001-Add-missing-include-for-qWarning.patc=
h
> @@ -0,0 +1,22 @@
> +From b946b6ea4a2a30bd12ecd036e40c9ef671681ba8 Mon Sep 17 00:00:00 2001
> +From: Samuli Piippo <samuli.piippo@qt.io>
> +Date: Fri, 2 Jun 2017 13:12:18 +0300
> +Subject: [PATCH] Add missing include for qWarning
> +
> +Change-Id: I7c7699e7a2b7ce59e4f659d460ec835f59bba439
> +---
> + src/webview/qquickwebview.cpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/webview/qquickwebview.cpp b/src/webview/qquickwebview.
> cpp
> +index d760564..fbbbfd6 100644
> +--- a/src/webview/qquickwebview.cpp
> ++++ b/src/webview/qquickwebview.cpp
> +@@ -39,6 +39,7 @@
> + #include <QtWebView/private/qwebviewloadrequest_p.h>
> + #include <QtQml/qqmlengine.h>
> + #include <QtCore/qmutex.h>
> ++#include <QtCore/QDebug>
> +
> + namespace {
> +
> diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_
> git.bb
> new file mode 100644
> index 0000000..2229cb1
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebview_git.bb
> @@ -0,0 +1,16 @@
> +LICENSE =3D "GFDL-1.3 & BSD & ( GPL-2.0+ | LGPL-3.0 ) |
> The-Qt-Company-Commercial"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> +    file://LICENSE.GPLv2;md5=3Dc96076271561b0e3785dad260634eaa8 \
> +    file://LICENSE.GPLv3;md5=3D88e2b9117e6be406b5ed6ee4ca99a705 \
> +    file://LICENSE.LGPLv3;md5=3De0459b45c5c4840b353141a8bbed91f0 \
> +"
> +
> +require qt5.inc
> +require qt5-git.inc
> +
> +SRC_URI +=3D "file://0001-Add-missing-include-for-qWarning.patch"
> +
> +DEPENDS +=3D "qtbase qtwebengine"
> +
> +SRCREV =3D "6e55abf3b6a5f373cd4b649c2318a45c49b40589"
> diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/
> qtx11extras_git.bb
> index 81c72ec..bf03e9b 100644
> --- a/recipes-qt/qt5/qtx11extras_git.bb
> +++ b/recipes-qt/qt5/qtx11extras_git.bb
> @@ -13,4 +13,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase"
>
> -SRCREV =3D "54cc3158acfc75d12338df3b678e013909e66f60"
> +SRCREV =3D "9e83ff8713c1a3f69ce514bf3e31335194668da7"
> diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/
> qtxmlpatterns_git.bb
> index c7efaf3..8556386 100644
> --- a/recipes-qt/qt5/qtxmlpatterns_git.bb
> +++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
> @@ -16,6 +16,6 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase"
>
> -SRCREV =3D "9f7e01b582b1bd83cc6b8a854c510871335e2e74"
> +SRCREV =3D "c1c3af0ae456247c9bcd30161d51a94c9b38dc52"
>
>  BBCLASSEXTEND =3D+ "native nativesdk"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

