Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id ECBD3737A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:43:47 +0000 (UTC)
Received: by wevl61 with SMTP id l61so18423301wev.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 00:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9n6yV5RO7UYZp0gjdBMPY7e26lXUavMl7A1LoGGkmFI=;
	b=n/ineHFYtvvj1Lyfavu5TMSri7GEw45fqwklQxPmCktT55KAfT/aSknBlsfI3/sZdl
	tZRkVYYLmlOdFJ307Tfeq7kyBUNFclMevxDO0pyMiU4auPbRaVdG3VTolHSN6teowCxQ
	hM8OD8vtve0Beb6X65JYbgTZJGc/igAfQSwMVL+yLAsMQp/MSpvHTpzbZ7yL8CCgtVY4
	yWL96bHg3HdB83iPCJm2KVaqDnSROKDR0Gtcv4EUZvyo4AJo9g4d03rl1SqaBiLCDvVn
	vT4+wm8UO+Cg0PuF6Dd8ZZdUF1/jDDpbMVTTUnL3EkF6bWcm+rrsf467xRBImi7ia756
	ROVQ==
X-Received: by 10.180.83.195 with SMTP id s3mr4328287wiy.54.1425026628389;
	Fri, 27 Feb 2015 00:43:48 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m4sm4920969wjb.25.2015.02.27.00.43.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 00:43:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Feb 2015 09:44:06 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150227084406.GJ2309@jama>
References: <1424370934-9288-1-git-send-email-danismostlikely@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1424370934-9288-1-git-send-email-danismostlikely@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v3] emacs: Un-blacklist, seems to work fine with new qemu
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
X-List-Received-Date: Fri, 27 Feb 2015 08:43:48 -0000
X-Groupsio-MsgNum: 54527
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YPJ8CVbwFUtL7OFW"
Content-Disposition: inline

--YPJ8CVbwFUtL7OFW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2015 at 12:35:34PM -0600, Dan McGregor wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>=20
> I've only tested the build with armv7 and x86, but the build
> doesn't segfault anymore. The last time this was tested was
> with qemu 1.5, we're now using 2.1.
>=20
> While here, don't copy stuff from the sysroot into the qemu tree
> just use the sysroot itself.

v3 looks the same as v2 and v2 was failing for qemux-x86* builds with qemu
segfault as reported in bitbake world status.

>=20
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  .../emacs/emacs-23.4/emacs-xgselect.patch          | 26 ++++++
>  meta-oe/recipes-support/emacs/emacs.inc            | 98 ++--------------=
------
>  meta-oe/recipes-support/emacs/emacs_23.4.bb        |  3 +-
>  3 files changed, 36 insertions(+), 91 deletions(-)
>  create mode 100644 meta-oe/recipes-support/emacs/emacs-23.4/emacs-xgsele=
ct.patch
>=20
> diff --git a/meta-oe/recipes-support/emacs/emacs-23.4/emacs-xgselect.patc=
h b/meta-oe/recipes-support/emacs/emacs-23.4/emacs-xgselect.patch
> new file mode 100644
> index 0000000..c103dfa
> --- /dev/null
> +++ b/meta-oe/recipes-support/emacs/emacs-23.4/emacs-xgselect.patch
> @@ -0,0 +1,26 @@
> +diff -up emacs-23.4/src/xgselect.c.xgselect emacs-23.4/src/xgselect.c
> +--- emacs-23.4/src/xgselect.c.xgselect	2011-11-25 14:05:03.963372281 +01=
00
> ++++ emacs-23.4/src/xgselect.c	2011-11-25 14:06:49.798049160 +0100
> +@@ -53,12 +53,17 @@ xg_select (max_fds, rfds, wfds, efds, ti
> +   g_main_context_pending (context);
> +=20
> +   do {
> +-    if (n_gfds > gfds_size)=20
> ++    if (n_gfds > gfds_size)
> +       {
> +-        while (n_gfds > gfds_size)=20
> +-          gfds_size *=3D 2;
> +-        xfree (gfds);
> +-        gfds =3D xmalloc (sizeof (*gfds) * gfds_size);
> ++	if (gfds_size =3D=3D 0)
> ++	  xgselect_initialize ();
> ++	else
> ++	  {
> ++	    while (n_gfds > gfds_size)
> ++	      gfds_size *=3D 2;
> ++	    xfree (gfds);
> ++	    gfds =3D xmalloc (sizeof (*gfds) * gfds_size);
> ++	  }
> +       }
> +=20
> +     n_gfds =3D g_main_context_query (context,
> diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-su=
pport/emacs/emacs.inc
> index a1a4965..694e3c5 100644
> --- a/meta-oe/recipes-support/emacs/emacs.inc
> +++ b/meta-oe/recipes-support/emacs/emacs.inc
> @@ -6,7 +6,7 @@ SECTION =3D "editor"
>  # and it needs to run some generated binaries..
>  DEPENDS +=3D "qemu-native"
> =20
> -DEPENDS +=3D" liblockfile"
> +DEPENDS +=3D" liblockfile ncurses"
> =20
>  X11DEPENDS =3D " \
>      libice libsm atk cairo dbus expat libffi fontconfig freetype gconf g=
iflib \
> @@ -14,17 +14,19 @@ X11DEPENDS =3D " \
>      libx11 libxau libxcomposite libxcursor libxdamage libxdmcp libxext l=
ibxfixes \
>      libxft libxpm libxrandr libxrender \
>      gdk-pixbuf glib-2.0 gtk+ pango libxcb harfbuzz icu \
> -"=20
> +"
> =20
>  EXTRA_OECONF =3D  "--without-sound --with-crt-dir=3D${STAGING_LIBDIR} "
> =20
>  PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '=
', d)}"
>  PACKAGECONFIG[x11] =3D "--with-x-toolkit=3Dgtk,--without-x --without-dbu=
s,${X11DEPENDS}"
> =20
> -
>  inherit autotools
> =20
> -PACKAGES =3D+ "${PN}-el"
> +PACKAGES =3D+ "${PN}-el ${PN}-grep-changelog"
> +
> +RDEPENDS_${PN}-grep-changelog +=3D "perl"
> +FILES_${PN}-grep-changelog +=3D "${bindir}/grep-changelog"
> =20
>  FILES_${PN}-el =3D "${datadir}/emacs/*/*/*.el.gz \
>                    ${datadir}/emacs/*/*/*/*.el.gz"
> @@ -33,15 +35,15 @@ FILES_${PN} +=3D "${datadir}/emacs ${datadir}/icons"
> =20
>  FILES_${PN}-dbg +=3D "${libexecdir}/emacs/*/*/.debug ${datadir}/emacs/*/=
*/.debug"
> =20
> -TREEDIR =3D "${WORKDIR}/qemu-treedir"
> -
>  QEMUARCH=3D "${TARGET_ARCH}"
>  QEMUARCH_i486 =3D "i386"
>  QEMUARCH_i586 =3D "i386"
>  QEMUARCH_i686 =3D "i386"
> =20
> +QEMU_OPTIONS ?=3D ""
> +
>  # Large stack is required at least on x86_64 host, otherwise random segf=
aults appear:
> -QEMU =3D "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${TREEDIR} "
> +QEMU =3D "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_H=
OST} "
> =20
>  export LOGNAME =3D "$(whoami)"
> =20
> @@ -52,88 +54,6 @@ do_compile_prepend() {
>      ln -sf ../src/emacs lisp/emacs
>      ln -sf ../src/emacs lib-src/emacs
>      ln -sf ../src/emacs leim/emacs
> -#copy STAGING_DIR_TARGET and libgcc_s.so* to WORKDIR/qemu-treedir #copie=
d code from glibc-package.bbclass
> -    treedir=3D${TREEDIR}
> -    if [ -e $treedir ];then
> -        rm -rf $treedir
> -    fi
> -   =20
> -    mkdir -p $treedir/${base_libdir}
> -
> -    if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so ]=
; then
> -        cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.=
so $treedir/${base_libdir}
> -    fi
> -    if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.*=
 ]; then
> -        cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.=
so.* $treedir/${base_libdir}
> -    fi
> -    # stupid hack, but without it, it tries to use /usr/lib/libc.so from=
 host and fails
> -    # temacs: error while loading shared libraries: /usr/lib/libc.so: EL=
F file version does not match current one
> -    if [ ! -f $treedir/${base_libdir}/libc.so ]; then
> -        ln -s libc.so.6 $treedir/${base_libdir}/libc.so
> -    fi
> -
> -    # copy only as much stuff as we need
> -    # before: 5.5G   ../../qemu-treedir/
> -    # after:   17M   ../../qemu-treedir/
> -    cp -pPR \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/ld-* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libc.* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libc-* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libm-* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libm.* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libtinfo.so.* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libresolv* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libdl* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/librt* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libgcc_s.so.* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libpthread* $treedir/${base_lib=
dir}/
> -
> -    if [ ! -z "${@base_contains('PACKAGECONFIG', 'x11', 'x11', '', d)}" =
] ; then
> -        echo "X11 build enabled"
> -        # copy only as much stuff as we need
> -        # before: 5.5G   ../../qemu-treedir/
> -        # after:   86M   ../../qemu-treedir/
> -        cp -pPR \
> -        ${STAGING_DIR_TARGET}/${base_libdir}/libuuid.so.* \
> -        ${STAGING_DIR_TARGET}/${base_libdir}/libz.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libICE.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libSM.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libatk-1.0.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libcairo.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libdbus-1.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libdbus-glib-1.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libexpat.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libffi.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libfontconfig.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libfreetype.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libgconf-2.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libgif.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libjpeg.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/liblzma.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libpixman-1.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libpng1*.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/librsvg-2.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libstdc++.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libtiff.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libxml2.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libcroco-0.6.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libharfbuzz.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libicule.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libicuuc.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libicudata.so.* $treedir/${base_=
libdir}/
> -
> -        # X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes Xft Xpm X=
randr Xrender
> -        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libX*.so.* $treedir/${ba=
se_libdir}/
> -
> -        # gdk-x11 gdk_pixbuf gio glib gmodule gobject gthread gtk-x11
> -        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libg*-2.0.so.* $treedir/=
${base_libdir}/
> -
> -        # pango pangocairo pangoft2
> -        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libpango*-1.0.so.* $tree=
dir/${base_libdir}/
> -
> -        # xcb-render xcb-shm xcb
> -        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libxcb*.so.* $treedir/${=
base_libdir}/
> -    fi
>  }
> =20
>  do_install_append() {
> diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipe=
s-support/emacs/emacs_23.4.bb
> index a324828..005fcf7 100644
> --- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
> +++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
> @@ -2,9 +2,8 @@ require emacs.inc
> =20
>  PR =3D "r4"
> =20
> -PNBLACKLIST[emacs] ?=3D "qemu: uncaught target signal 11 (Segmentation f=
ault) - core dumped"
> -
>  SRC_URI =3D "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=3Dtarball \
> +           file://emacs-xgselect.patch \
>             file://use-qemu.patch \
>             file://nostdlib-unwind.patch \
>  "
> --=20
> 2.3.0.dirty
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YPJ8CVbwFUtL7OFW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTwLlYACgkQN1Ujt2V2gByVcgCgk7+sS50BBIXacArUg9bJ2wkO
zp8AoJ7fYsrB2KLtJETwd1V1Wq9sBO0P
=XVN5
-----END PGP SIGNATURE-----

--YPJ8CVbwFUtL7OFW--
