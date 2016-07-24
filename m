Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F30373174
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jul 2016 12:02:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x83so12607199wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jul 2016 05:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zXdgW3PhfJjsrq8+VUDR2JGUlMDyQt8xbUhRV6s+eG0=;
	b=mqRBp9JPUItkqtqhch7OTd1HkVyu8pGlEjV2ExK3NDPCbXIVcQKKTzTxYb51mvdFKT
	VBS1ybDMT8YAWLs3P4V9xVzM5apwccktsi43f47fszLUWVnNbpJf8DtFs8MnYPyemvUt
	dmivP9TzwV8ijLGeio1A7qlB7kRxhAk8VjXTqk0LlJI2Xnx0a7w8q5y5YxrNHRNhiwZ+
	9aXS0VIicFHLx7xF/q0uZVoFvL/OtaaIr90yAY4drd6+2YiF/FR5th+01i5ZNJWxUvLo
	bOxnrIqR6vDTh50mzVCaosRwKBqN5qMYaaTZj2Lwi3s0iaSIIIUCwmq5S9twWy3LG0bc
	xwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zXdgW3PhfJjsrq8+VUDR2JGUlMDyQt8xbUhRV6s+eG0=;
	b=N6uIEjLLqW9EoRbAspgbXo9sz4LW66HMN4J6foSu1bUKimdrikSVxkNrVc669Ga3oI
	rGvg4L7lN5N9ErRQGWupub+SkM/EOVPEXqRfXQ8uId2Q2TrDYiGbUk1Dd77fK9PLQYWH
	LXFpvz/R2TawFvV9PVSzN13uW2DD37slKrAKobXyV+FCij79wwqavyFGpJq151gCSvHF
	7a8intiavS5sIj+udvbLj1iuoJs3q5yDjDD17lj2d38/EgjAw+E45UNAqbSkAgPavA+Y
	hNkJdlhnaO1dAEUgiGiWQSNRCkwM1L5QirO9Gy4wQ5t3edouxIhEUSWPKoH+XQRIxHhQ
	xkmg==
X-Gm-Message-State: AEkoous9FF4hZ1hZptBk2W59uHMeGQkrYBCaxphdgpLGhq6ZpFLk+j6IsggkjYKXpOzPnA==
X-Received: by 10.194.85.97 with SMTP id g1mr10289528wjz.72.1469361780133;
	Sun, 24 Jul 2016 05:03:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	hy3sm10402327wjb.8.2016.07.24.05.02.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 24 Jul 2016 05:02:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 24 Jul 2016 14:03:10 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160724120310.dkepnbam3767u4zu@jama>
References: <1464383975-25421-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1464383975-25421-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-gnome][master][krogoth][PATCH] gnome-menus: Fix QA warnings.
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
X-List-Received-Date: Sun, 24 Jul 2016 12:03:02 -0000
X-Groupsio-MsgNum: 62324
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a3bsm7ke45gkjb2s"
Content-Disposition: inline

--a3bsm7ke45gkjb2s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2016 at 02:19:35PM -0700, Armin Kuster wrote:
> WARNING: gnome-menus-2.30.5-r1 do_configure: Missing DEPENDS on intltool-=
native
> WARNING: gnome-menus-2.30.5-r1 do_package_qa: QA Issue: non -staticdev pa=
ckage contains static .a library: gnome-menus-python path 'work/i586-oe-lin=
ux/gnome-menus/2.30.5-r1/packages-split/gnome-menus-python/usr/lib/python2.=
7/site-packages/gmenu.a' [staticdev]
> WARNING: gnome-menus-2.30.5-r1 do_package_qa: QA Issue: /usr/bin/gmenu-si=
mple-editor contained in package gnome-menus requires /home/akuster/oss/mai=
nt/mylayers/openembedded-core/build/tmp-glibc/sysroots/x86_64-linux/usr/bin=
/python-native/python, but no providers found in RDEPENDS_gnome-menus? [fil=
e-rdeps]
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb       | 15 +++++++++=
+-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb b=
/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
> index 1b84a54..1e31b56 100644
> --- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
> +++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
>                      file://COPYING.LIB;md5=3D5f30f0716dfdd0d91eb439ebec5=
22ec2"
>  PR =3D "r1"
> =20
> -DEPENDS =3D "python libxml2 gconf popt gtk+"
> +DEPENDS =3D "python libxml2 gconf popt gtk+ intltool-native"
> =20
>  inherit gnomebase pkgconfig python-dir pythonnative gobject-introspection
> =20
> @@ -13,10 +13,15 @@ SRC_URI[archive.md5sum] =3D "caa6772e63ed5870cf43dc3d=
354e0624"
>  SRC_URI[archive.sha256sum] =3D "6dcc565006d6e8c2025ae83ab1f82edf6bd04d61=
c804c0dc9bf5ea50629c4caa"
>  GNOME_COMPRESS_TYPE=3D"bz2"
> =20
> -PACKAGES +=3D "${PN}-python"
> +do_configure_append () {
> +
> +    # this expands to native-pthon which we don't want.
> +    sed -i 's:\@PYTHON\@:/usr/bin/env python:' ${S}/simple-editor/gmenu-=
simple-editor.in
> +
> +}

Probably wasn't caused by this, but do you have some idea why it fails
now like this:

| ../arm-oe-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dlink
arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -mthumb
--sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm
-Wall -Wstrict-prototypes -Wnested-externs -Werror=3Dmissing-prototypes
-Werror=3Dimplicit-function-declaration -Werror=3Dpointer-arith
-Werror=3Dinit-self -Werror=3Dformat=3D2 -Werror=3Dmissing-include-dirs
-Werror=3Dreturn-type  -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te=
-oe-linux-gnueabi/gnome-menus/2.30.5-r1=3D/usr/src/debug/gnome-menus/2.30.5=
-r1
-fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86=
_64-linux=3D
-fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qem=
uarm=3D
-version-info 6:10:4 -no-undefined -export-symbols-regex gmenu_tree
-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o libgnome-menu.la -rpath
/usr/lib canonicalize.lo desktop-entries.lo entry-directories.lo
gmenu-tree.lo menu-layout.lo menu-monitor.lo menu-util.lo -lgio-2.0
-lgobject-2.0 -lglib-2.0 -L  -lpython3.5
| ERROR: oe_runmake failed
| arm-oe-linux-gnueabi-libtool:   error: require no space between '-L'
and '-lpython3.5'
| make[2]: *** [libgnome-menu.la] Error 1
| make[2]: Leaving directory
`/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/gn=
ome-menus/2.30.5-r1/build/libmenu'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/gn=
ome-menus/2.30.5-r1/build'
| make: *** [all] Error 2
| ERROR: Function failed: do_compile (log file is located at
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/gno=
me-menus/2.30.5-r1/temp/log.do_compile.31939)
NOTE: recipe gnome-menus-2.30.5-r1: task do_compile: Failed
NOTE: recipe libgnome-2.32.1-r2: task do_rm_work_all: Succeeded
ERROR: Task
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome/=
gnome-menus/gnome-menus_2.30.5.bb:do_compile
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome=
/gnome-menus/gnome-menus_2.30.5.bb:do_compile)
failed with exit code '1'

> +PACKAGES +=3D "${PN}-python ${PN}-python-staticdev"
>  FILES_${PN} +=3D "${datadir}/desktop-directories/"
> -FILES_${PN}-python =3D "${libdir}/python*"
> +FILES_${PN}-python-staticdev =3D "${PYTHON_SITEPACKAGES_DIR}/gmenu.a ${P=
YTHON_SITEPACKAGES_DIR}/gmenu.la"
> +FILES_${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}/gmenu.so ${PYTHON_SIT=
EPACKAGES_DIR}/GMenuSimpleEditor "
>  FILES_${PN}-dbg +=3D "${PYTHON_SITEPACKAGES_DIR}/*/.debug \
>                      ${PYTHON_SITEPACKAGES_DIR}/.debug"
> -
> -
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a3bsm7ke45gkjb2s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleUrn4ACgkQN1Ujt2V2gByrNwCglFKBfX7X6DWHf0uLbnJVWuox
dUIAn1x6q8xboI52Mc5NTQycuHl1iGmv
=vkZW
-----END PGP SIGNATURE-----

--a3bsm7ke45gkjb2s--
