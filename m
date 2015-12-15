Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 953DB73184
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 11:32:35 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id rx7so1452926igc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 03:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=G15pUIjQuoA8eNsYBvGC5/bzvo88jeUZl3cY1s1/nfM=;
	b=05wURCbMnRic0gb4LIoEVw65MUx91Lw9BQdhaXaCmq8ScrpoNTjVvzUX0M26vL0u4m
	6meEUyCF3IG/z83pgFCFEEJd2GfxkpygIhk7eGA79v1BCHQE9qfdeMO0qnCqo0L8SoII
	YJDXvpRxu5sz8j1HR6Flf8spTZjllerJS3ADVjiJJw11SND1lcs8h80E3ZK3gpGy7Z7R
	6YhFjfkdBHjls+BmXxfUGfjeK0rnRqbOLn1QmBggBUrgD/U9omCxexY/5O/caIjey/2h
	kMTHX5K5WTLoDwy51YUGc+glc/vPFGTG6UAk7tgtRVG0nppx7qfrBlTYlqSKJYknQ+m8
	9/pg==
MIME-Version: 1.0
X-Received: by 10.50.155.33 with SMTP id vt1mr3266202igb.64.1450179155806;
	Tue, 15 Dec 2015 03:32:35 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Tue, 15 Dec 2015 03:32:35 -0800 (PST)
In-Reply-To: <1448525199-27504-2-git-send-email-schnitzeltony@googlemail.com>
References: <1448525199-27504-1-git-send-email-schnitzeltony@googlemail.com>
	<1448525199-27504-2-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 15 Dec 2015 12:32:35 +0100
Message-ID: <CALbNGRReLcVR5J9sGtR2w2EXUiLpATdjFV9O--huGdhxz_Fb5g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-qt5][jethro] qtbase: align target qmake paths/mkspec
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
X-List-Received-Date: Tue, 15 Dec 2015 11:32:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2015 at 9:06 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> With this we can setup qt-creator to build/debug on target again.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  ...configure-paths-for-target-qmake-properly.patch | 76 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qtbase_git.bb                       |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtbase/0011-configure-paths-for-target=
-qmake-properly.patch
>
> diff --git a/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-=
properly.patch b/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmak=
e-properly.patch
> new file mode 100644
> index 0000000..efd27a5
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properl=
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
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 0ba8ac8..3ef5923 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -26,6 +26,7 @@ SRC_URI +=3D "\
>      file://0008-qmake-don-t-build-it-in-configure-but-allow-to-build.pat=
ch \
>      file://0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.pat=
ch \
>      file://0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.pat=
ch \
> +    file://0011-configure-paths-for-target-qmake-properly.patch \
>  "
>
>  DEPENDS +=3D "qtbase-native"
> --
> 2.1.0
>
Ping

