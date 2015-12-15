Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2A30A7317D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 11:32:56 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id o67so1483415iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 03:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=O5cP4wnE4GnMhyDkVG21XUtRiyNtSoFQ80cWeG7iKDw=;
	b=iqGvsiSCgxY4YhtmFkTumDHiJx2CW70Iio3rwkO8441rs8txt2XpOS09O6AdSI6xhY
	PDl6mObg1Pb8wRzZPc9DKJr9pOCfwKUvMK15FBceO2lLc3Ys54q+UbFC4r3ikNkChvxF
	y869OHpYnuMGNmS/l0mhDkuu601lJ/Thf4al4aWFJXv9AY0aio3gAoHzH4INSbWYIOVa
	4QudHgRO5z7ze2T8qm01m/UtcJaHUwHb58xEEXxWBNcXwMMeaIzBHuGhHG67slewpdAG
	aaOPhJ6OviDvvs3hOoMDtYZQW3dt4j9guCeGhO4HqDXqD6SlcR4tcXxSwEmMlQ4+0qTo
	774w==
MIME-Version: 1.0
X-Received: by 10.107.154.131 with SMTP id c125mr12047705ioe.148.1450179177470;
	Tue, 15 Dec 2015 03:32:57 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Tue, 15 Dec 2015 03:32:57 -0800 (PST)
In-Reply-To: <1448525199-27504-3-git-send-email-schnitzeltony@googlemail.com>
References: <1448525199-27504-1-git-send-email-schnitzeltony@googlemail.com>
	<1448525199-27504-3-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 15 Dec 2015 12:32:57 +0100
Message-ID: <CALbNGRRa8dVGhY_OUvk0v+wS2YiNq+wYASpr0B87R+WGXioTRg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-qt5][master 2/2] align target qmake paths/mkspec
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
X-List-Received-Date: Tue, 15 Dec 2015 11:32:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2015 at 9:06 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  recipes-qt/qt5/nativesdk-qtbase_git.bb             |  4 +-
>  recipes-qt/qt5/qtbase-native_git.bb                |  5 +-
>  ...configure-paths-for-target-qmake-properly.patch | 76 ++++++++++++++++=
++++++
>  ...build-uic.patch =3D> 0009-Always-build-uic.patch} |  0
>  ...xternal-hostbindir-option-for-native-sdk.patch} |  0
>  recipes-qt/qt5/qtbase_git.bb                       |  1 +
>  6 files changed, 82 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-qt/qt5/qtbase/0008-configure-paths-for-target=
-qmake-properly.patch
>  rename recipes-qt/qt5/qtbase/{0008-Always-build-uic.patch =3D> 0009-Alwa=
ys-build-uic.patch} (100%)
>  rename recipes-qt/qt5/qtbase/{0009-Add-external-hostbindir-option-for-na=
tive-sdk.patch =3D> 0010-Add-external-hostbindir-option-for-native-sdk.patc=
h} (100%)
>
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nati=
vesdk-qtbase_git.bb
> index f712af7..3d4900e 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -33,8 +33,8 @@ SRC_URI +=3D "\
>
>  # common for qtbase-native and nativesdk-qtbase
>  SRC_URI +=3D " \
> -    file://0008-Always-build-uic.patch \
> -    file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
> +    file://0009-Always-build-uic.patch \
> +    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
>  "
>
>  # CMake's toolchain configuration of nativesdk-qtbase
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-=
native_git.bb
> index e27d34b..14e8516 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -23,12 +23,13 @@ SRC_URI +=3D "\
>      file://0005-configure-bump-path-length-from-256-to-512-character.pat=
ch \
>      file://0006-QOpenGLPaintDevice-sub-area-support.patch \
>      file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.pat=
ch \
> +    file://0008-configure-paths-for-target-qmake-properly.patch \
>  "
>
>  # common for qtbase-native and nativesdk-qtbase
>  SRC_URI +=3D " \
> -    file://0008-Always-build-uic.patch \
> -    file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
> +    file://0009-Always-build-uic.patch \
> +    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
>  "
>
>  CLEANBROKEN =3D "1"
> diff --git a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-=
properly.patch b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmak=
e-properly.patch
> new file mode 100644
> index 0000000..efd27a5
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properl=
y.patch
> @@ -0,0 +1,76 @@
> +From fb519b08f564a8a640b1b2f2b6a3bd54a83e19e8 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Fri, 13 Nov 2015 12:36:11 +0100
> +Subject: [PATCH] configure paths/mkspecs for target qmake properly
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +to use this patch in all qtbase/qtbase-native(sdk) changes ore made
> +conditionally based on QT_CROSS_COMPILE
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> +---
> + configure | 23 +++++++++++++++++++----
> + 1 file changed, 19 insertions(+), 4 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 6edfffd..de74a29 100755
> +--- a/configure
> ++++ b/configure
> +@@ -3857,8 +3857,13 @@ if [ "$CFG_COMPILE_EXAMPLES" =3D "yes" ]; then
> +     QMAKE_CONFIG=3D"$QMAKE_CONFIG compile_examples"
> + fi
> +
> +-shortxspec=3D`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
> +-shortspec=3D`echo $QMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
> ++if [ "$QT_CROSS_COMPILE" =3D "yes" ] ; then
> ++    shortxspec=3Dlinux-g++
> ++    shortspec=3Dlinux-g++
> ++else
> ++    shortxspec=3D`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
> ++    shortspec=3D`echo $QMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
> ++fi
> +
> + QT_CONFIGURE_STR_OFF=3D0
> +
> +@@ -3891,7 +3896,11 @@ QT_CONFIGURE_STRS_ALL=3D$QT_CONFIGURE_STRS
> +
> + QT_CONFIGURE_STR_OFFSETS=3D
> + QT_CONFIGURE_STRS=3D
> +-addConfStr "$CFG_SYSROOT"
> ++if [ "$QT_CROSS_COMPILE" =3D "yes" ] ; then
> ++    addConfStr ""
> ++else
> ++    addConfStr "$CFG_SYSROOT"
> ++fi
> + addConfStr "$QT_REL_HOST_BINS"
> + addConfStr "$QT_REL_HOST_LIBS"
> + addConfStr "$QT_REL_HOST_DATA"
> +@@ -3903,6 +3912,12 @@ addConfStr "$shortspec"
> + #----------------------------------------------------------------------=
---------
> + [ -d "$outpath/src/corelib/global" ] || mkdir -p "$outpath/src/corelib/=
global"
> +
> ++if [ "$QT_CROSS_COMPILE" =3D "yes" ] ; then
> ++    QT_TARGET_PREFIX=3D$QT_EXT_PREFIX
> ++else
> ++    QT_TARGET_PREFIX=3D$QT_HOST_PREFIX
> ++fi
> ++
> + cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
> + /* License Info */
> + static const char qt_configure_licensee_str          [256 + 12] =3D "qt=
_lcnsuser=3D$Licensee";
> +@@ -3915,7 +3930,7 @@ static const char qt_configure_installation       =
   [12+11]    =3D "qt_instdate=3D2
> + static const char qt_configure_prefix_path_str       [512 + 12] =3D "qt=
_prfxpath=3D$QT_INSTALL_PREFIX";
> + #ifdef QT_BUILD_QMAKE
> + static const char qt_configure_ext_prefix_path_str   [512 + 12] =3D "qt=
_epfxpath=3D$QT_EXT_PREFIX";
> +-static const char qt_configure_host_prefix_path_str  [512 + 12] =3D "qt=
_hpfxpath=3D$QT_HOST_PREFIX";
> ++static const char qt_configure_host_prefix_path_str  [512 + 12] =3D "qt=
_hpfxpath=3D$QT_TARGET_PREFIX";
> + #endif
> +
> + static const short qt_configure_str_offsets[] =3D {
> +--
> +2.1.0
> +
> diff --git a/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch b/recipes-=
qt/qt5/qtbase/0009-Always-build-uic.patch
> similarity index 100%
> rename from recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
> rename to recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
> diff --git a/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-fo=
r-native-sdk.patch b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-opt=
ion-for-native-sdk.patch
> similarity index 100%
> rename from recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for=
-native-sdk.patch
> rename to recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-n=
ative-sdk.patch
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index fdc73e1..20627c8 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -19,6 +19,7 @@ SRC_URI +=3D "\
>      file://0005-configure-bump-path-length-from-256-to-512-character.pat=
ch \
>      file://0006-QOpenGLPaintDevice-sub-area-support.patch \
>      file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.pat=
ch \
> +    file://0008-configure-paths-for-target-qmake-properly.patch \
>  "
>
>  DEPENDS +=3D "qtbase-native"
> --
> 2.1.0
>
Ping

