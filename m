Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC8E70100
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 10:35:56 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id l69so3355074lfg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ef7JCH/yvGIVAEZML/B+0o5e2IGjrDAMwQ8O8LqziIE=;
	b=DMiO5TAuf+BhSf1Gochb0pQdkxojdcxtMkO/sp0aecXt115pSbjl/HphMDKUoi9WH1
	o9YBtdWdGWmcTZQadAqvcBho9Lz/AiluqIgnDbz5xlK7tiAaS27HfqDccRZQFrrjUzUv
	Ge00vbXvA5GC+4+NMYmoZVu3KDXGDjxOOlyiFOXlbXxw3+f55veQHk2a1R6omnFfp8CP
	yHkh354ni7QdqyxnYQG4HAA8DiQruYvkLGBuOOIw3/Fjx0eXrjfR47m1+zjRIitBO1RK
	ksqlcH6o3CusO/LOf1ctat5Gj83Q2VJrxKKUrnFu6TCJnZQ1qKPb3eMZ8ffbeqb0q0n6
	Y0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ef7JCH/yvGIVAEZML/B+0o5e2IGjrDAMwQ8O8LqziIE=;
	b=bm97tK7caq7mJQdrMmRt3P/kq3mQv1hTjxuBdAvoiAmgYokTlSCk6AZkag79vyHhks
	lNPbQXAu5ImGWtzZW3CQWA4qbghqc77JWcsqoi58tNRn7RrQbCGeKKLzjP1iFkcJCXBM
	JYfsQiyZrko52wrPzUHktibEBq9LFXD3kwitj8GYPmXpMH4XuZQ+SCY22TfBxUQUCeNk
	hzD4YkzagXckfW6uBb/RsfhXkhsR+7aFXvxkvKO83kkpUpVShAbdrCZNmoHwkwgkUJxL
	IMdGyMKhitDFvVwnQFazcXDgfvcDziIf3g6VAYdfAJkjyp3tiy9AEXlPOxPkz84feITu
	qItA==
X-Gm-Message-State: ALyK8tLijoIPeXh3XU+PDEQOWl3lVcJuPjm8W88VGgfwF2WOO3OFHvgJ6qiYML0wue8fjwC2oMmQ5VnulTgI1w==
X-Received: by 10.25.215.82 with SMTP id o79mr4799945lfg.132.1469010956420;
	Wed, 20 Jul 2016 03:35:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Wed, 20 Jul 2016 03:35:55 -0700 (PDT)
In-Reply-To: <1469010648-25671-1-git-send-email-gordan.markus@pelagicore.com>
References: <1469010648-25671-1-git-send-email-gordan.markus@pelagicore.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Jul 2016 12:35:55 +0200
Message-ID: <CA+chaQcPZx9AHzQfCy3N7pUZ-URR=owOjGyZY6DE6BrjPNrVzQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: =?UTF-8?Q?Gordan_Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: Re: [meta-qt5][PATCH] qt5: update the recipes to the latest LTS stable Qt 5.6.1-1
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
X-List-Received-Date: Wed, 20 Jul 2016 10:35:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Sorry, but no tag names in SRCREV - that causes bitbake parsing to reach
git repositories every time to convert them to git SHA.

On Wed, Jul 20, 2016 at 12:30 PM, Gordan Marku=C5=A1 <
gordan.markus@pelagicore.com> wrote:

> * The Qt 5.6 release featured a severe bug where the
> Qt Quick applications would crash after some time (QTBUG-53761)
>
> * qtdeclarative: Fix crashes when incubating objects asynchronously
> with initial properties
> * qtdeclarative: QML: Only release types if they aren't referenced anymor=
e
> ---
>  recipes-qt/qt5/nativesdk-qtbase_git.bb   | 2 +-
>  recipes-qt/qt5/qt5-git.inc               | 2 +-
>  recipes-qt/qt5/qtbase-native_git.bb      | 2 +-
>  recipes-qt/qt5/qtbase_git.bb             | 2 +-
>  recipes-qt/qt5/qtcanvas3d_git.bb         | 2 +-
>  recipes-qt/qt5/qtconnectivity_git.bb     | 2 +-
>  recipes-qt/qt5/qtdeclarative_git.bb      | 2 +-
>  recipes-qt/qt5/qtenginio_git.bb          | 2 +-
>  recipes-qt/qt5/qtgraphicaleffects_git.bb | 2 +-
>  recipes-qt/qt5/qtimageformats_git.bb     | 2 +-
>  recipes-qt/qt5/qtlocation_git.bb         | 2 +-
>  recipes-qt/qt5/qtmultimedia_git.bb       | 2 +-
>  recipes-qt/qt5/qtquick1_git.bb           | 2 +-
>  recipes-qt/qt5/qtquickcontrols2_git.bb   | 2 +-
>  recipes-qt/qt5/qtquickcontrols_git.bb    | 6 +-----
>  recipes-qt/qt5/qtscript_git.bb           | 2 +-
>  recipes-qt/qt5/qtsensors_git.bb          | 2 +-
>  recipes-qt/qt5/qtserialport_git.bb       | 2 +-
>  recipes-qt/qt5/qtsvg_git.bb              | 2 +-
>  recipes-qt/qt5/qttools_git.bb            | 2 +-
>  recipes-qt/qt5/qttranslations_git.bb     | 2 +-
>  recipes-qt/qt5/qtwayland-native_git.bb   | 2 +-
>  recipes-qt/qt5/qtwayland_git.bb          | 2 +-
>  recipes-qt/qt5/qtwebchannel_git.bb       | 2 +-
>  recipes-qt/qt5/qtwebengine_git.bb        | 2 +-
>  recipes-qt/qt5/qtwebsockets_git.bb       | 2 +-
>  recipes-qt/qt5/qtx11extras_git.bb        | 2 +-
>  recipes-qt/qt5/qtxmlpatterns_git.bb      | 2 +-
>  28 files changed, 28 insertions(+), 32 deletions(-)
>
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/
> nativesdk-qtbase_git.bb
> index 4e55141..87c5b9e 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -257,4 +257,4 @@ fakeroot do_generate_qt_environment_file() {
>
>  addtask generate_qt_environment_file after do_install before do_package
>
> -SRCREV =3D "cec15a89d058424794978910cc8da65b43d71606"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> index 8a6d93e..77d6241 100644
> --- a/recipes-qt/qt5/qt5-git.inc
> +++ b/recipes-qt/qt5/qt5-git.inc
> @@ -11,4 +11,4 @@ SRC_URI =3D " \
>
>  S =3D "${WORKDIR}/git"
>
> -PV =3D "5.6.0+git${SRCPV}"
> +PV =3D "5.6.1-1+git${SRCPV}"
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/
> qtbase-native_git.bb
> index 73900af..1bf4a13 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -117,4 +117,4 @@ do_install() {
>      ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
>  }
>
> -SRCREV =3D "cec15a89d058424794978910cc8da65b43d71606"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index b85c563..a2fb041 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -261,4 +261,4 @@ sysroot_stage_dirs_append() {
>      rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
>  }
>
> -SRCREV =3D "cec15a89d058424794978910cc8da65b43d71606"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/
> qtcanvas3d_git.bb
> index 5b12d1a..0b91e8d 100644
> --- a/recipes-qt/qt5/qtcanvas3d_git.bb
> +++ b/recipes-qt/qt5/qtcanvas3d_git.bb
> @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS =3D "qtdeclarative"
>
> -SRCREV =3D "791ddce7d41b126ba4744a6701597f49dbf99f3b"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/
> qtconnectivity_git.bb
> index 03990d8..488e82f 100644
> --- a/recipes-qt/qt5/qtconnectivity_git.bb
> +++ b/recipes-qt/qt5/qtconnectivity_git.bb
> @@ -25,4 +25,4 @@ do_configure_prepend() {
>      sed -i
> 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/
> qtconnectivity.pro
>  }
>
> -SRCREV =3D "dedff12a896d51c469d2af82664b86a10f8fa7fe"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/
> qtdeclarative_git.bb
> index 72b3d7b..a5bc166 100644
> --- a/recipes-qt/qt5/qtdeclarative_git.bb
> +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> @@ -34,6 +34,6 @@ do_configure_prepend() {
>
>  EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'qtxmlpatterns', 'CONFIG+=3DOE_QTXMLPATTERNS_ENABLED', '', d)}"
>
> -SRCREV =3D "26ff8f9029107877bfbfdc2f099f9b11861183ed"
> +SRCREV =3D "v5.6.1-1"
>
>  BBCLASSEXTEND =3D+ "native nativesdk"
> diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/
> qtenginio_git.bb
> index 04f5a79..327899d 100644
> --- a/recipes-qt/qt5/qtenginio_git.bb
> +++ b/recipes-qt/qt5/qtenginio_git.bb
> @@ -11,4 +11,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase qtdeclarative qtxmlpatterns"
>
> -SRCREV =3D "cf717b99fdb1b7221dd556bf3be32feba0ed8afe"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/
> qtgraphicaleffects_git.bb
> index 606b873..c82c35d 100644
> --- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
> +++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
> @@ -17,4 +17,4 @@ DEPENDS +=3D "qtdeclarative"
>
>  RDEPENDS_${PN}-dev =3D ""
>
> -SRCREV =3D "6523d7c4843e1d4176035c46e1514c39bdcfc3bf"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/
> qtimageformats_git.bb
> index 573b330..7207d8a 100644
> --- a/recipes-qt/qt5/qtimageformats_git.bb
> +++ b/recipes-qt/qt5/qtimageformats_git.bb
> @@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE +=3D
> "${@bb.utils.contains('PACKAGECONFIG', 'jasper', 'CONFIG+
>  EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'libtiff=
',
> 'CONFIG+=3DOE_LIBTIFF_ENABLED', '', d)}"
>  EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'libwebp=
',
> 'CONFIG+=3DOE_LIBWEBP_ENABLED', '', d)}"
>
> -SRCREV =3D "bf5b49878d75d316f31225f76152e8381a3d5f0f"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/
> qtlocation_git.bb
> index 8a41551..f8e6f25 100644
> --- a/recipes-qt/qt5/qtlocation_git.bb
> +++ b/recipes-qt/qt5/qtlocation_git.bb
> @@ -29,4 +29,4 @@ do_configure_prepend() {
>  EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'geoclue=
',
> 'CONFIG+=3DOE_GEOCLUE_ENABLED', '', d)}"
>  EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'gypsy',
> 'CONFIG+=3DOE_GYPSY_ENABLED', '', d)}"
>
> -SRCREV =3D "d1f66746ab0b77b4f3300cbeeaafe61d25d78e98"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/
> qtmultimedia_git.bb
> index 328fdd7..1626a8e 100644
> --- a/recipes-qt/qt5/qtmultimedia_git.bb
> +++ b/recipes-qt/qt5/qtmultimedia_git.bb
> @@ -35,4 +35,4 @@ SRC_URI +=3D "\
>       file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
>  "
>
> -SRCREV =3D "2170a3b0fcda613daf76a337fa45cb97e0714cdf"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/
> qtquick1_git.bb
> index 61b02a1..c23852e 100644
> --- a/recipes-qt/qt5/qtquick1_git.bb
> +++ b/recipes-qt/qt5/qtquick1_git.bb
> @@ -23,4 +23,4 @@ do_configure_prepend() {
>      sed -i
> 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets=
):#g'
> ${S}/src/imports/imports.pro
>  }
>
> -SRCREV =3D "563ce3888f3c04abcc96ba236b20c7a822bc88e2"
> +SRCREV =3D "dbc9131ebb300e715d5ebd815dc3ef9aa77ebf56"
> diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/
> qtquickcontrols2_git.bb
> index e3c580f..513fa42 100644
> --- a/recipes-qt/qt5/qtquickcontrols2_git.bb
> +++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
> @@ -12,4 +12,4 @@ DEPENDS +=3D "qtdeclarative"
>
>  FILES_${PN}-qmlplugins +=3D "${libdir}/qt5/qml/Qt"
>
> -SRCREV =3D "ac152bfcd37f94453e9705b57ca6520ad30bade0"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/
> qtquickcontrols_git.bb
> index 7a5ca23..0147535 100644
> --- a/recipes-qt/qt5/qtquickcontrols_git.bb
> +++ b/recipes-qt/qt5/qtquickcontrols_git.bb
> @@ -13,8 +13,4 @@ DEPENDS +=3D "qtdeclarative"
>
>  RDEPENDS_${PN}-dev =3D ""
>
> -SRC_URI +=3D " \
> -
> file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
> -"
> -
> -SRCREV =3D "01e52200e2a76ec51c3bb9710617ac0c249a78bc"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/
> qtscript_git.bb
> index 565ca84..dc132e3 100644
> --- a/recipes-qt/qt5/qtscript_git.bb
> +++ b/recipes-qt/qt5/qtscript_git.bb
> @@ -27,4 +27,4 @@ ARM_INSTRUCTION_SET_armv5 =3D "arm"
>
>  DEPENDS +=3D "qtbase"
>
> -SRCREV =3D "b16873afea798d08799d7a0b255b8d200337f35b"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/
> qtsensors_git.bb
> index 16c2095..fb953ee 100644
> --- a/recipes-qt/qt5/qtsensors_git.bb
> +++ b/recipes-qt/qt5/qtsensors_git.bb
> @@ -15,4 +15,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase qtdeclarative"
>
> -SRCREV =3D "0b00ee6f6c311a7f5c0b4f2441dad97a454d172e"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/
> qtserialport_git.bb
> index 4139db1..e38fc5a 100644
> --- a/recipes-qt/qt5/qtserialport_git.bb
> +++ b/recipes-qt/qt5/qtserialport_git.bb
> @@ -15,4 +15,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase"
>
> -SRCREV =3D "9a70ee2389d3302f6a4262325f8a76e4d867b478"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
> index 6c300e5..d5723e4 100644
> --- a/recipes-qt/qt5/qtsvg_git.bb
> +++ b/recipes-qt/qt5/qtsvg_git.bb
> @@ -13,4 +13,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase"
>
> -SRCREV =3D "e02df9c098b4d304b34c0ff65806a0576e45ed1a"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.b=
b
> index e0b23b4..03d07f0 100644
> --- a/recipes-qt/qt5/qttools_git.bb
> +++ b/recipes-qt/qt5/qttools_git.bb
> @@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] =3D ",,qtwebkit"
>  EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'qtwebki=
t',
> '', 'CONFIG+=3Dnoqtwebkit', d)}"
>  EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'linguistonly', 'CONFIG+=3Dlinguistonly', '', d)}"
>
> -SRCREV =3D "e33532e048fa12ee32429ca83ee31aa8f065147d"
> +SRCREV =3D "v5.6.1-1"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/
> qttranslations_git.bb
> index 93b147d..f932d43 100644
> --- a/recipes-qt/qt5/qttranslations_git.bb
> +++ b/recipes-qt/qt5/qttranslations_git.bb
> @@ -114,4 +114,4 @@ FILES_${PN}-qt =3D " \
>      ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
>  "
>
> -SRCREV =3D "13f1f2f12ddfc9b84535361d77a5f0f0ec8c3e0f"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/
> qtwayland-native_git.bb
> index ca47da8..4597ff5 100644
> --- a/recipes-qt/qt5/qtwayland-native_git.bb
> +++ b/recipes-qt/qt5/qtwayland-native_git.bb
> @@ -25,4 +25,4 @@ do_install() {
>      oe_runmake install INSTALL_ROOT=3D${D}
>  }
>
> -SRCREV =3D "26e27845a43319d0ecad0c6392f05d1ed50da2a2"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/
> qtwayland_git.bb
> index a1cee86..162a489 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -36,4 +36,4 @@ SRC_URI +=3D " \
>
>  file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
>  "
>
> -SRCREV =3D "26e27845a43319d0ecad0c6392f05d1ed50da2a2"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/
> qtwebchannel_git.bb
> index 79c6b23..d3e94c4 100644
> --- a/recipes-qt/qt5/qtwebchannel_git.bb
> +++ b/recipes-qt/qt5/qtwebchannel_git.bb
> @@ -15,4 +15,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtdeclarative qtwebsockets"
>
> -SRCREV =3D "64a106da72796377bbff5cce0ecc5a379b105498"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/
> qtwebengine_git.bb
> index 427cd95..5729024 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -119,7 +119,7 @@ SRC_URI +=3D " \
>
>  file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
>  "
>
> -SRCREV_qtwebengine =3D "643aa579fc94933eefa8eb20af6729e2140cf480"
> +SRCREV_qtwebengine =3D "v5.6.1-1"
>  SRCREV_chromium =3D "8252b18aa3efa52138e91f9756945afb142a1c8c"
>  SRCREV =3D "${SRCREV_qtwebengine}"
>
> diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/
> qtwebsockets_git.bb
> index 66d9d74..43b13d7 100644
> --- a/recipes-qt/qt5/qtwebsockets_git.bb
> +++ b/recipes-qt/qt5/qtwebsockets_git.bb
> @@ -11,4 +11,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase qtdeclarative"
>
> -SRCREV =3D "ba9306ec5a1271275d79b2f48ceb227f79352f33"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/
> qtx11extras_git.bb
> index d8beb50..1a45465 100644
> --- a/recipes-qt/qt5/qtx11extras_git.bb
> +++ b/recipes-qt/qt5/qtx11extras_git.bb
> @@ -13,4 +13,4 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase"
>
> -SRCREV =3D "f27489d66cc6d8263130451c26c7e4ae40acc6b4"
> +SRCREV =3D "v5.6.1-1"
> diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/
> qtxmlpatterns_git.bb
> index d78df14..f2397db 100644
> --- a/recipes-qt/qt5/qtxmlpatterns_git.bb
> +++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
> @@ -13,6 +13,6 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS +=3D "qtbase"
>
> -SRCREV =3D "5e6acdb2ea92add793835561e7a2d6b0ed8890f8"
> +SRCREV =3D "v5.6.1-1"
>
>  BBCLASSEXTEND =3D+ "native nativesdk"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

