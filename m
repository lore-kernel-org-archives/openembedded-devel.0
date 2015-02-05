Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2765472DE2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:35:17 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so8593558wgg.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Bqs598GaF6bc3+p6ZnvtLOLh72LpuYremTN4vuhsMRo=;
	b=e5J+OL37aye+ld6qqCggJRev4FDVab0saPsNC5+DFYMwBitnDZklpdVAzmseCQuBrU
	shA84kCJUrqBIWFEHu4ZoSzIhn6TWYmsMEyyPcvaF0ueZTw9tlb+qBnREE0h3Gy/XRw8
	ujjcPO6GjzABV77N+H9dKVxMO1FYpvJU0zROosyq0ZW+em8hoJWw0Zmc8xCo7APLdHDW
	EUfjcx7yQT1A312hFM8tMwNfAU9bytZD8NzSfo1hEZGh+x6cP9/Z7lijjMyGNkjZuU7J
	ZcnlPV7AqcH+MDoZcnq0mZR41Lz03qFkujZUx3EJMD3Z+7ctqOxroezY4MKWh76gFe7d
	OJ2w==
X-Received: by 10.194.78.72 with SMTP id z8mr3835444wjw.0.1423154118390;
	Thu, 05 Feb 2015 08:35:18 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ej10sm2490685wib.1.2015.02.05.08.35.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Feb 2015 08:35:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Feb 2015 17:35:34 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150205163534.GA2444@jama>
References: <1423075209-24723-1-git-send-email-danismostlikely@gmail.com>
	<1423153384-25662-1-git-send-email-danismostlikely@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1423153384-25662-1-git-send-email-danismostlikely@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2 3/5] emacs: Un-blacklist, seems to work fine with new qemu
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
X-List-Received-Date: Thu, 05 Feb 2015 16:35:26 -0000
X-Groupsio-MsgNum: 54112
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 05, 2015 at 10:23:04AM -0600, Dan McGregor wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>=20
> I've only tested the build with armv7 and x86, but the build
> doesn't segfault anymore. The last time this was tested was
> with qemu 1.5, we're now using 2.1.
>=20
> While here, don't copy stuff from the sysroot into the qemu tree
> just use the sysroot itself.
>=20
> Also disable X11 support by default. There is still an issue
> seen by multiple people where an emacs built with X11 support
> will hang when run outside of X.
>=20
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta-oe/recipes-support/emacs/emacs.inc     | 91 +----------------------=
------
>  meta-oe/recipes-support/emacs/emacs_23.4.bb |  2 -
>  2 files changed, 3 insertions(+), 90 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-su=
pport/emacs/emacs.inc
> index a1a4965..c1d50f2 100644
> --- a/meta-oe/recipes-support/emacs/emacs.inc
> +++ b/meta-oe/recipes-support/emacs/emacs.inc
> @@ -14,14 +14,13 @@ X11DEPENDS =3D " \
>      libx11 libxau libxcomposite libxcursor libxdamage libxdmcp libxext l=
ibxfixes \
>      libxft libxpm libxrandr libxrender \
>      gdk-pixbuf glib-2.0 gtk+ pango libxcb harfbuzz icu \
> -"=20
> +"
> =20
>  EXTRA_OECONF =3D  "--without-sound --with-crt-dir=3D${STAGING_LIBDIR} "
> =20
> -PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '=
', d)}"
> +PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[x11] =3D "--with-x-toolkit=3Dgtk,--without-x --without-dbu=
s,${X11DEPENDS}"
> =20
> -
>  inherit autotools
> =20
>  PACKAGES =3D+ "${PN}-el"
> @@ -33,15 +32,13 @@ FILES_${PN} +=3D "${datadir}/emacs ${datadir}/icons"
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
>  # Large stack is required at least on x86_64 host, otherwise random segf=
aults appear:
> -QEMU =3D "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${TREEDIR} "
> +QEMU =3D "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_H=
OST} "

We were using STAGING_DIR_HOST before, but it was causing some issues:
see oe-classic commit which introduced TREEDIR:
http://git.openembedded.org/openembedded/commit/?h=3Dcbf539f8e7431241e28b77=
394d33b764f7b0463b

Are you sure that this issue won't re-appear?

>  export LOGNAME =3D "$(whoami)"
> =20
> @@ -52,88 +49,6 @@ do_compile_prepend() {
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
> index a324828..36e8f0c 100644
> --- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
> +++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
> @@ -2,8 +2,6 @@ require emacs.inc
> =20
>  PR =3D "r4"
> =20
> -PNBLACKLIST[emacs] ?=3D "qemu: uncaught target signal 11 (Segmentation f=
ault) - core dumped"
> -
>  SRC_URI =3D "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=3Dtarball \
>             file://use-qemu.patch \
>             file://nostdlib-unwind.patch \
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTTm9YACgkQN1Ujt2V2gBwnMQCguHs14E2iCLB2+cnWM4i2Imi7
wfoAoJpf7oSuP2QxSRv576GyQYI5r6SM
=rjlE
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
