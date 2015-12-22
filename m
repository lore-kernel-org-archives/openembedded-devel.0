Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC496AC37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 16:37:27 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p187so115062838wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 08:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m9Y4iEmvWMVP/5dG3UUHFMPXK9OG6HgtRfj8o5tvQYY=;
	b=PdFtaIp7eH2oAFIXWPnHOQRUic9KKiC0dkiVJ3+m4m8PcTxlO1y1oG1Tz+8rUOLiR1
	7y5miqToP7munlzs+xOg01jvFgBlZ5u/BOiEn6mcV47cgF4mFgOgeV/C5+cB6ioFfTjz
	7+QNwWNYfwb30kxQx7GgFjse6vfsgP8tfkwf2lI96uKZjyovVL/3NEDAP4ZAPpmAzIka
	nBuKFf26RfSScl0D01KpvM0xh5CugJQ3ol4rYAuo7zwgN4HUuLydopER95De0IjIzWbd
	nMLUzNES11oIR2E/udC43cv2Uv0ZIY8XyqR2dt4dp1WYzu80fijcqZnTBKwPz9oB6AO6
	QpTQ==
X-Received: by 10.194.243.103 with SMTP id wx7mr30904100wjc.136.1450802248430; 
	Tue, 22 Dec 2015 08:37:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w23sm12625980wmd.1.2015.12.22.08.37.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Dec 2015 08:37:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Dec 2015 17:40:32 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151222164032.GB2556@jama>
References: <1448525199-27504-1-git-send-email-schnitzeltony@googlemail.com>
	<1448525199-27504-2-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRReLcVR5J9sGtR2w2EXUiLpATdjFV9O--huGdhxz_Fb5g@mail.gmail.com>
	<CALbNGRSZL8kWXfk_2ZH0ceDFV5BS-vEwy1GOr0TAzgiHwRbfdA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSZL8kWXfk_2ZH0ceDFV5BS-vEwy1GOr0TAzgiHwRbfdA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Tue, 22 Dec 2015 16:37:29 -0000
X-Groupsio-MsgNum: 59142
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline

--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2015 at 05:14:23PM +0100, Andreas M=FCller wrote:
> On Tue, Dec 15, 2015 at 12:32 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > On Thu, Nov 26, 2015 at 9:06 AM, Andreas M=FCller
> > <schnitzeltony@googlemail.com> wrote:
> >> With this we can setup qt-creator to build/debug on target again.
> >>
> >> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >> ---
> >>  ...configure-paths-for-target-qmake-properly.patch | 76 +++++++++++++=
+++++++++
> >>  recipes-qt/qt5/qtbase_git.bb                       |  1 +
> >>  2 files changed, 77 insertions(+)
> >>  create mode 100644 recipes-qt/qt5/qtbase/0011-configure-paths-for-tar=
get-qmake-properly.patch
> >>
> >> diff --git a/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qma=
ke-properly.patch b/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-q=
make-properly.patch
> >> new file mode 100644
> >> index 0000000..efd27a5
> >> --- /dev/null
> >> +++ b/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-prop=
erly.patch
> >> @@ -0,0 +1,76 @@
> >> +From fb519b08f564a8a640b1b2f2b6a3bd54a83e19e8 Mon Sep 17 00:00:00 2001
> >> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@goog=
lemail.com>
> >> +Date: Fri, 13 Nov 2015 12:36:11 +0100
> >> +Subject: [PATCH] configure paths/mkspecs for target qmake properly
> >> +MIME-Version: 1.0
> >> +Content-Type: text/plain; charset=3DUTF-8
> >> +Content-Transfer-Encoding: 8bit
> >> +
> >> +to use this patch in all qtbase/qtbase-native(sdk) changes ore made
> >> +conditionally based on QT_CROSS_COMPILE
> >> +
> >> +Upstream-Status: Inappropriate [OE specific]
> >> +
> >> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >> +---
> >> + configure | 23 +++++++++++++++++++----
> >> + 1 file changed, 19 insertions(+), 4 deletions(-)
> >> +
> >> +diff --git a/configure b/configure
> >> +index 6edfffd..de74a29 100755
> >> +--- a/configure
> >> ++++ b/configure
> >> +@@ -3857,8 +3857,13 @@ if [ "$CFG_COMPILE_EXAMPLES" =3D "yes" ]; then
> >> +     QMAKE_CONFIG=3D"$QMAKE_CONFIG compile_examples"
> >> + fi
> >> +
> >> +-shortxspec=3D`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
> >> +-shortspec=3D`echo $QMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
> >> ++if [ "$QT_CROSS_COMPILE" =3D "yes" ] ; then
> >> ++    shortxspec=3Dlinux-g++
> >> ++    shortspec=3Dlinux-g++
> >> ++else
> >> ++    shortxspec=3D`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
> >> ++    shortspec=3D`echo $QMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
> >> ++fi
> >> +
> >> + QT_CONFIGURE_STR_OFF=3D0
> >> +
> >> +@@ -3891,7 +3896,11 @@ QT_CONFIGURE_STRS_ALL=3D$QT_CONFIGURE_STRS
> >> +
> >> + QT_CONFIGURE_STR_OFFSETS=3D
> >> + QT_CONFIGURE_STRS=3D
> >> +-addConfStr "$CFG_SYSROOT"
> >> ++if [ "$QT_CROSS_COMPILE" =3D "yes" ] ; then
> >> ++    addConfStr ""
> >> ++else
> >> ++    addConfStr "$CFG_SYSROOT"
> >> ++fi
> >> + addConfStr "$QT_REL_HOST_BINS"
> >> + addConfStr "$QT_REL_HOST_LIBS"
> >> + addConfStr "$QT_REL_HOST_DATA"
> >> +@@ -3903,6 +3912,12 @@ addConfStr "$shortspec"
> >> + #-------------------------------------------------------------------=
------------
> >> + [ -d "$outpath/src/corelib/global" ] || mkdir -p "$outpath/src/corel=
ib/global"
> >> +
> >> ++if [ "$QT_CROSS_COMPILE" =3D "yes" ] ; then
> >> ++    QT_TARGET_PREFIX=3D$QT_EXT_PREFIX
> >> ++else
> >> ++    QT_TARGET_PREFIX=3D$QT_HOST_PREFIX
> >> ++fi
> >> ++
> >> + cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
> >> + /* License Info */
> >> + static const char qt_configure_licensee_str          [256 + 12] =3D =
"qt_lcnsuser=3D$Licensee";
> >> +@@ -3915,7 +3930,7 @@ static const char qt_configure_installation    =
      [12+11]    =3D "qt_instdate=3D2
> >> + static const char qt_configure_prefix_path_str       [512 + 12] =3D =
"qt_prfxpath=3D$QT_INSTALL_PREFIX";
> >> + #ifdef QT_BUILD_QMAKE
> >> + static const char qt_configure_ext_prefix_path_str   [512 + 12] =3D =
"qt_epfxpath=3D$QT_EXT_PREFIX";
> >> +-static const char qt_configure_host_prefix_path_str  [512 + 12] =3D =
"qt_hpfxpath=3D$QT_HOST_PREFIX";
> >> ++static const char qt_configure_host_prefix_path_str  [512 + 12] =3D =
"qt_hpfxpath=3D$QT_TARGET_PREFIX";
> >> + #endif
> >> +
> >> + static const short qt_configure_str_offsets[] =3D {
> >> +--
> >> +2.1.0
> >> +
> >> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.=
bb
> >> index 0ba8ac8..3ef5923 100644
> >> --- a/recipes-qt/qt5/qtbase_git.bb
> >> +++ b/recipes-qt/qt5/qtbase_git.bb
> >> @@ -26,6 +26,7 @@ SRC_URI +=3D "\
> >>      file://0008-qmake-don-t-build-it-in-configure-but-allow-to-build.=
patch \
> >>      file://0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.=
patch \
> >>      file://0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.=
patch \
> >> +    file://0011-configure-paths-for-target-qmake-properly.patch \
> >>  "
> >>
> >>  DEPENDS +=3D "qtbase-native"
> >> --
> >> 2.1.0
> >>
> > Ping
> Ping for jethro

I wanted to keep it a bit longer in master, but I trust you, so pushed
to jethro as well.

Thanks

> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZ5fP8ACgkQN1Ujt2V2gBzPlwCdGVCnI2YAPSwiOs4U6yLCrk8d
Tb0An23vkY4wUN2CkJdsQIfwrcSDmAdr
=+S5n
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
