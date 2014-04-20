Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 18C7565D49
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 08:54:30 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so2872500eei.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lcYYk38Eeb2iJuRbVTNaqEYiuzZxkCgdPNNy2KMgUmU=;
	b=FqZ9Ado1kYV8XVNPhHcruJjvVsV6zKoa5n0igkWpx8Zuq1eiR5yi0OTkFbEb0LXh06
	cqeUrLRo6o+KHHyLKZ9f6kDbIRKIYjnPME/k2r7ChHETnzNqyqUiwhG5gnCIKDYksn9b
	cAMKTysNqZsuOY+qDgMRLaoQ7xXH2LGcgy2o4tEfiJBIELwghdiD8aALeNY+AfNmAGj6
	lvxR3pcYNZOSMS8q0AEdfOAfODn0szPkWEdxi1hkocqSYvTihRSaPwNwjNQXyX9uGJrQ
	ygwkHlTs1q244+txWJVr5OR5WGAP9RHk7ojveS1cGAoZ5cJuxRBRLXryb1hxXsy+wJpX
	kPtA==
X-Received: by 10.14.87.201 with SMTP id y49mr36940396eee.62.1397984071041;
	Sun, 20 Apr 2014 01:54:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a4sm92774448eep.12.2014.04.20.01.54.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 01:54:30 -0700 (PDT)
Date: Sun, 20 Apr 2014 10:54:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420085435.GM2486@jama>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 01/46] efl: upgrade to 1.9.0
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
X-List-Received-Date: Sun, 20 Apr 2014 08:54:33 -0000
X-Groupsio-MsgNum: 49294
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cGfB/trNgB3WtPHu"
Content-Disposition: inline

--cGfB/trNgB3WtPHu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01, 2014 at 07:13:09PM +0200, Martin Jansa wrote:
> * announcement:
>   http://sourceforge.net/mailarchive/message.php?msg_id=3D32024303
> * emotion-generic-players and evas-generic-loaders LIC_FILES_CHKSUM
>   change is just copyright update

All merged with some commits (mousepad, gnome-backgrounds, libbonobo) squas=
hed with fixes sent later.

>   < Copyright (C) 2011-2011 Carsten Haitzler and various contributors (se=
e AUTHORS)
>   ---
>   > Copyright (C) 2011-2014 Carsten Haitzler and various contributors (se=
e AUTHORS)
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-efl/recipes-efl/efl/efl.inc                   | 18 +++++--
>  .../recipes-efl/efl/{efl_1.8.5.bb =3D> efl_1.9.0.bb} |  6 +--
>  meta-efl/recipes-efl/efl/elementary.inc            |  2 +-
>  ...e-elementary_codegen-defined-in-configure.patch | 29 ++++++++++
>  ...e-elm_prefs_cc-and-elementary_codegen-def.patch | 61 ----------------=
------
>  meta-efl/recipes-efl/efl/elementary_1.8.4.bb       | 12 -----
>  meta-efl/recipes-efl/efl/elementary_1.9.0.bb       | 12 +++++
>  .../recipes-efl/efl/emotion-generic-players.inc    |  4 +-
>  .../efl/emotion-generic-players_1.8.1.bb           |  8 ---
>  .../efl/emotion-generic-players_1.9.0.bb           |  8 +++
>  meta-efl/recipes-efl/efl/evas-generic-loaders.inc  |  2 +-
>  .../recipes-efl/efl/evas-generic-loaders_1.8.1.bb  |  8 ---
>  .../recipes-efl/efl/evas-generic-loaders_1.9.0.bb  |  8 +++
>  13 files changed, 80 insertions(+), 98 deletions(-)
>  rename meta-efl/recipes-efl/efl/{efl_1.8.5.bb =3D> efl_1.9.0.bb} (77%)
>  create mode 100644 meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use=
-elementary_codegen-defined-in-configure.patch
>  delete mode 100644 meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use=
-elm_prefs_cc-and-elementary_codegen-def.patch
>  delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.8.4.bb
>  create mode 100644 meta-efl/recipes-efl/efl/elementary_1.9.0.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.8.=
1.bb
>  create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.9.=
0.bb
>  delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb
>  create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.9.0.bb
>=20
> diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/=
efl.inc
> index 4e25389..56b3cd2 100644
> --- a/meta-efl/recipes-efl/efl/efl.inc
> +++ b/meta-efl/recipes-efl/efl/efl.inc
> @@ -3,7 +3,7 @@ LICENSE =3D "MIT BSD LGPL-2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da1809a807e39dd48ddcf7be98477d=
130"
> =20
>  DEPENDS_class-native =3D "lua5.1-native freetype-native libxext-native l=
ibpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus=
-native"
> -DEPENDS =3D "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib =
jpeg openssl libsndfile1 lua5.1 dbus libexif librsvg freetype libpng tiff l=
ibxext virtual/libx11 libxrender fontconfig libfribidi giflib udev libxcurs=
or libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native"
> +DEPENDS =3D "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib =
jpeg openssl libsndfile1 luajit dbus libexif librsvg freetype libpng tiff l=
ibxext virtual/libx11 libxrender fontconfig libfribidi giflib udev libxcurs=
or libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native"
> =20
>  inherit efl gettext pkgconfig
> =20
> @@ -12,8 +12,14 @@ BBCLASSEXTEND =3D "native"
>  PROVIDES +=3D "ecore edje eet eeze efreet eina eio embryo emotion ethumb=
 evas eldbus"
> =20
>  # we don't have bullet for physics
> +# You have chosen to disable physics support. This disables lots of
> +# core functionality and is effectively never tested. You are going
> +# to find features that suddenly don't work and as a result cause
> +# a series of breakages. This is simply not tested so you are on
> +# your own in terms of ensuring everything works if you do this
>  EXTRA_OECONF =3D " \
>      --disable-physics \
> +    --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-b=
reak-things-and-i-will-fix-them-myself-and-send-patches-aaa \
>  "
>  EXTRA_OECONF_append_class-target =3D " \
>      --with-bin-edje-cc=3D${STAGING_BINDIR_NATIVE}/edje_cc \
> @@ -36,16 +42,19 @@ EXTRA_OECONF_append_class-native =3D " \
>      --disable-image-loader-xpm \
>  "
> =20
> -PACKAGECONFIG ??=3D "opengl-es"
> +PACKAGECONFIG ?=3D "opengl-es gstreamer1 pulseaudio"
>  PACKAGECONFIG_class-native =3D ""
> =20
>  # sort of tri-state
>  PACKAGECONFIG[opengl-full] =3D "--with-opengl=3Dfull,,virtual/libgl"
>  PACKAGECONFIG[opengl-es] =3D "--with-opengl=3Des,,virtual/libgles2"
>  PACKAGECONFIG[opengl-none] =3D "--with-opengl=3Dnone,,"
> -# used only in ecore examples and supports only 0.10 now
>  PACKAGECONFIG[gstreamer] =3D "--enable-gstreamer,--disable-gstreamer,gst=
reamer"
> +PACKAGECONFIG[gstreamer1] =3D "--enable-gstreamer1,--disable-gstreamer1,=
gstreamer1.0 gstreamer1.0-plugins-base"
>  PACKAGECONFIG[pulseaudio] =3D "--enable-pulseaudio,--disable-pulseaudio,=
pulseaudio"
> +PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd"
> +# we don't have luajit-native now, so use old lua for -native
> +PACKAGECONFIG[luajit] =3D "--disable-lua-old,--enable-lua-old,luajit"
> =20
>  # new efl doesn't have option to disable eeze build and we don't want to=
 provide udev-native just to build eeze-native we don't need
>  do_configure_prepend_class-native() {
> @@ -175,6 +184,7 @@ FILES_eet =3D " \
>  "
>  FILES_emotion =3D " \
>      ${datadir}/emotion \
> +    ${libdir}/emotion/modules/gstreamer1/*/module.so \
>  "
>  FILES_embryo-tests =3D " \
>      ${datadir}/embryo/ \
> @@ -234,6 +244,7 @@ FILES_${PN}-dbg +=3D " \
>      ${libdir}/edje/utils/*/.debug \
>      ${libdir}/ethumb/*/*/*/.debug \
>      ${libdir}/ethumb_client/utils/*/.debug \
> +    ${libdir}/emotion/modules/gstreamer1/*/.debug \
>  "
>  FILES_${PN}-dev +=3D " \
>      ${libdir}/cmake \
> @@ -242,6 +253,7 @@ FILES_${PN}-dev +=3D " \
>      ${libdir}/ethumb*/*/*/*/module.la \
>      ${libdir}/eeze*/*/*/*/*/module.la \
>      ${libdir}/edje*/*/*/*/module.la \
> +    ${libdir}/emotion/modules/gstreamer1/*/module.la \
>      ${datadir}/gdb/auto-load \
>      ${datadir}/eo/gdb \
>      ${bindir}/eldbus-codegen \
> diff --git a/meta-efl/recipes-efl/efl/efl_1.8.5.bb b/meta-efl/recipes-efl=
/efl/efl_1.9.0.bb
> similarity index 77%
> rename from meta-efl/recipes-efl/efl/efl_1.8.5.bb
> rename to meta-efl/recipes-efl/efl/efl_1.9.0.bb
> index cacae5f..b6aa77f 100644
> --- a/meta-efl/recipes-efl/efl/efl_1.8.5.bb
> +++ b/meta-efl/recipes-efl/efl/efl_1.9.0.bb
> @@ -4,14 +4,14 @@ SRC_URI =3D "\
>      ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
>  "
> =20
> -SRC_URI[md5sum] =3D "3d2c3ca2ff1a072b72ffab40ff598dfb"
> -SRC_URI[sha256sum] =3D "7e514c0a972feea1c44c9074a4b58c14821d93dc91ff6f51=
066528f12ab42fe5"
> +SRC_URI[md5sum] =3D "f5d0c61db951cb6a5434a30672975dd1"
> +SRC_URI[sha256sum] =3D "fd4703edb56c01b713f92849fb15f6ca3d866227ce4abff2=
d90b08244cd99a99"
> =20
>  # Temporary disable until error like the one following are fixed
>  # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not =
recognized: File truncated
>  # collect2: error: ld returned 1 exit status
>  # x86_64-linux-libtool: install: error: relink `modules/evas/savers/tiff=
/module.la' with the above command before installing it
>  # Makefile:11031: recipe for target 'install-savertiffpkgLTLIBRARIES' fa=
iled
> -PARALLEL_MAKE =3D ""
> +PARALLEL_MAKE_class-native =3D ""
> =20
>  SRC_URI +=3D "file://0001-configure.ac-Don-t-check-for-Xprint-extension.=
patch"
> diff --git a/meta-efl/recipes-efl/efl/elementary.inc b/meta-efl/recipes-e=
fl/efl/elementary.inc
> index 8d95967..6de749a 100644
> --- a/meta-efl/recipes-efl/efl/elementary.inc
> +++ b/meta-efl/recipes-efl/efl/elementary.inc
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "EFL based widget set for mobile devices"
>  LICENSE =3D "LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dae1a906a61040d01df137a6b2c6ac=
b68"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da173054a93896e933df53e3382d47=
2c2"
>  DEPENDS =3D "eet-native edje-native elementary-native efreet evas ecore =
edje eet eldbus ethumb poppler eio"
>  DEPENDS_class-native =3D "efl-native"
> =20
> diff --git a/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elemen=
tary_codegen-defined-in-configure.patch b/meta-efl/recipes-efl/efl/elementa=
ry/0001-Makefile-Use-elementary_codegen-defined-in-configure.patch
> new file mode 100644
> index 0000000..9524c70
> --- /dev/null
> +++ b/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elementary_co=
degen-defined-in-configure.patch
> @@ -0,0 +1,29 @@
> +From 75d104d105aa03dd9d446fa7d84fa95e0f566cf9 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sat, 11 Jan 2014 12:55:59 +0100
> +Subject: [PATCH] Makefile: Use elementary_codegen defined in configure
> +
> +* using binaries from top_buildir doesn't work when cross-compiling elem=
entary
> +  where we need to pass native binaries in configure params
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + src/examples/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/examples/Makefile.am b/src/examples/Makefile.am
> +index fc35c75..1e10b0b 100644
> +--- a/src/examples/Makefile.am
> ++++ b/src/examples/Makefile.am
> +@@ -29,7 +29,7 @@ LDADD =3D \
> + @ELEMENTARY_X_LIBS@ \
> + $(top_builddir)/src/lib/libelementary.la
> +=20
> +-ELEMENTARY_CODEGEN =3D $(top_builddir)/src/bin/@ELEMENTARY_CODEGEN_PRG@
> ++ELEMENTARY_CODEGEN =3D @elementary_codegen@
> + ELEMENTARY_CODEGEN_FLAGS =3D --prefix=3Dcodegen_example
> +=20
> + SRCS =3D \
> +--=20
> +1.9.0
> +
> diff --git a/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elm_pr=
efs_cc-and-elementary_codegen-def.patch b/meta-efl/recipes-efl/efl/elementa=
ry/0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch
> deleted file mode 100644
> index e3fba9b..0000000
> --- a/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elm_prefs_cc-=
and-elementary_codegen-def.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 53c7046933d1b622a7f99e70a08a0bf46e38369f Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sat, 11 Jan 2014 12:55:59 +0100
> -Subject: [PATCH] Makefile: Use elm_prefs_cc and elementary_codegen defin=
ed in
> - configure
> -
> -* using binaries from top_buildir doesn't work when cross-compiling elem=
entary
> -  where we need to pass native binaries in configure params
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - data/objects/Makefile.am | 2 +-
> - doc/widgets/Makefile.am  | 2 +-
> - src/examples/Makefile.am | 4 ++--
> - 3 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/data/objects/Makefile.am b/data/objects/Makefile.am
> -index c6a775d..88c4f1a 100644
> ---- a/data/objects/Makefile.am
> -+++ b/data/objects/Makefile.am
> -@@ -11,7 +11,7 @@ filesdir =3D $(datadir)/elementary/objects
> -=20
> - files_DATA =3D test.edj test_external.edj multip.edj cursors.edj font_p=
review.edj postit_ent.edj multibuttonentry.edj test_prefs.edj test_prefs.ep=
b test_focus_custom.edj
> -=20
> --ELM_PREFS_CC =3D $(top_builddir)/src/bin/@ELM_PREFS_CC_PRG@
> -+ELM_PREFS_CC =3D @elm_prefs_cc@
> -=20
> - EXTRA_DIST =3D \
> - test.edc \
> -diff --git a/doc/widgets/Makefile.am b/doc/widgets/Makefile.am
> -index c1508b8..c0544f9 100644
> ---- a/doc/widgets/Makefile.am
> -+++ b/doc/widgets/Makefile.am
> -@@ -19,7 +19,7 @@ AM_CPPFLAGS =3D \
> - @ELEMENTARY_EWEATHER_CFLAGS@ \
> - @ELEMENTARY_EMAP_CFLAGS@
> -=20
> --ELM_PREFS_CC =3D $(top_builddir)/src/bin/@ELM_PREFS_CC_PRG@
> -+ELM_PREFS_CC =3D @elm_prefs_cc@
> -=20
> - noinst_DATA =3D widget_preview_prefs.epb
> -=20
> -diff --git a/src/examples/Makefile.am b/src/examples/Makefile.am
> -index 7184ca1..ce80a46 100644
> ---- a/src/examples/Makefile.am
> -+++ b/src/examples/Makefile.am
> -@@ -33,9 +33,9 @@ EDJE_FLAGS_VERBOSE_0 =3D
> - EDJE_FLAGS_VERBOSE_1 =3D -v
> - EDJE_FLAGS =3D $(EDJE_FLAGS_VERBOSE_$(V))
> -=20
> --ELM_PREFS_CC =3D $(top_builddir)/src/bin/@ELM_PREFS_CC_PRG@
> -+ELM_PREFS_CC =3D @elm_prefs_cc@
> -=20
> --ELEMENTARY_CODEGEN =3D $(top_builddir)/src/bin/@ELEMENTARY_CODEGEN_PRG@
> -+ELEMENTARY_CODEGEN =3D @elementary_codegen@
> - ELEMENTARY_CODEGEN_FLAGS =3D --prefix=3Dcodegen_example
> -=20
> - SRCS =3D \
> ---=20
> -1.8.5.2
> -
> diff --git a/meta-efl/recipes-efl/efl/elementary_1.8.4.bb b/meta-efl/reci=
pes-efl/efl/elementary_1.8.4.bb
> deleted file mode 100644
> index 7208210..0000000
> --- a/meta-efl/recipes-efl/efl/elementary_1.8.4.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require ${BPN}.inc
> -
> -SRC_URI =3D "\
> -    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
> -"
> -
> -# only for target, because configure doesn't default to sane default when
> -# these paths aren't passed in -native build
> -SRC_URI_append_class-target =3D " file://0001-Makefile-Use-elm_prefs_cc-=
and-elementary_codegen-def.patch"
> -
> -SRC_URI[md5sum] =3D "898d0ee0e18078640948fa5d04d56efe"
> -SRC_URI[sha256sum] =3D "129b8a015c34df3e8633b5b65aa3bcdd77ed101992948cb0=
96389fed3f3a4244"
> diff --git a/meta-efl/recipes-efl/efl/elementary_1.9.0.bb b/meta-efl/reci=
pes-efl/efl/elementary_1.9.0.bb
> new file mode 100644
> index 0000000..e7cbb5b
> --- /dev/null
> +++ b/meta-efl/recipes-efl/efl/elementary_1.9.0.bb
> @@ -0,0 +1,12 @@
> +require ${BPN}.inc
> +
> +SRC_URI =3D "\
> +    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
> +"
> +
> +# only for target, because configure doesn't default to sane default when
> +# these paths aren't passed in -native build
> +SRC_URI_append_class-target =3D " file://0001-Makefile-Use-elementary_co=
degen-defined-in-configure.patch"
> +
> +SRC_URI[md5sum] =3D "408b61a080f51731eeed81968d3cc7f5"
> +SRC_URI[sha256sum] =3D "95cb9ade6c1f135b673555d927d13b5e0698635304717812=
5346abdf6c2b4d82"
> diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players.inc b/meta-=
efl/recipes-efl/efl/emotion-generic-players.inc
> index 5c16802..4ab89ae 100644
> --- a/meta-efl/recipes-efl/efl/emotion-generic-players.inc
> +++ b/meta-efl/recipes-efl/efl/emotion-generic-players.inc
> @@ -1,6 +1,8 @@
>  DESCRIPTION =3D "Emotion generic players"
>  LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69f44058245ce5c596d56bb622d5d=
abd"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da0f11eedf8706bf6d4d6639fb67eb=
8ae"
> +
> +DEPENDS =3D "emotion"
> =20
>  inherit efl
> =20
> diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.8.1.bb b/=
meta-efl/recipes-efl/efl/emotion-generic-players_1.8.1.bb
> deleted file mode 100644
> index 9fc50a7..0000000
> --- a/meta-efl/recipes-efl/efl/emotion-generic-players_1.8.1.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require ${BPN}.inc
> -
> -SRC_URI =3D "\
> -    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
> -"
> -
> -SRC_URI[md5sum] =3D "895d8057fb5cdcadd9ed1f710a460b4e"
> -SRC_URI[sha256sum] =3D "d3221726df583b3d5d43192e4909c08ac4dbf7ff35b81568=
ac339d7dbaf84d36"
> diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.9.0.bb b/=
meta-efl/recipes-efl/efl/emotion-generic-players_1.9.0.bb
> new file mode 100644
> index 0000000..0337751
> --- /dev/null
> +++ b/meta-efl/recipes-efl/efl/emotion-generic-players_1.9.0.bb
> @@ -0,0 +1,8 @@
> +require ${BPN}.inc
> +
> +SRC_URI =3D "\
> +    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
> +"
> +
> +SRC_URI[md5sum] =3D "dc897ba540560fce0787bbff8455c022"
> +SRC_URI[sha256sum] =3D "d26546adf61db7521f9d46f2baedcb645af72497fc259e93=
907026970d42d794"
> diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc b/meta-efl=
/recipes-efl/efl/evas-generic-loaders.inc
> index 904527c..e64fa88 100644
> --- a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
> +++ b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Evas generic loaders"
>  LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df86abf15f4d911ae87092e90222d0=
ef3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df3877fbaaa46306051a5598144518=
83c"
>  DEPENDS =3D "eina poppler librsvg cairo"
> =20
>  inherit efl
> diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb b/met=
a-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb
> deleted file mode 100644
> index 21e57f9..0000000
> --- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require ${BPN}.inc
> -
> -SRC_URI =3D "\
> -    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
> -"
> -
> -SRC_URI[md5sum] =3D "2f39de031a236e53d251beefb4f6fcfd"
> -SRC_URI[sha256sum] =3D "fa5d40324367b2e126853ba70f6522552fff9e80f6dd9156=
6b2dacc4b0ffebc0"
> diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.9.0.bb b/met=
a-efl/recipes-efl/efl/evas-generic-loaders_1.9.0.bb
> new file mode 100644
> index 0000000..38d0518
> --- /dev/null
> +++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.9.0.bb
> @@ -0,0 +1,8 @@
> +require ${BPN}.inc
> +
> +SRC_URI =3D "\
> +    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
> +"
> +
> +SRC_URI[md5sum] =3D "bec6d27fc4afd2f5e4829da5aeccdc0b"
> +SRC_URI[sha256sum] =3D "9447839047b087b0293b2ed6c453249919f66e5c4f62e252=
a7b7e4f996c2ac5f"
> --=20
> 1.9.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cGfB/trNgB3WtPHu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTi0sACgkQN1Ujt2V2gBxU4gCgqAZC6Ot0arN4TZXj+NRng3d2
RzYAnRhWNu6AQ10JP/2UnA3myNLYAHPD
=LKx9
-----END PGP SIGNATURE-----

--cGfB/trNgB3WtPHu--
