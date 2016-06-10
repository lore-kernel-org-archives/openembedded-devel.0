Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0070560621
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 12:32:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m124so17574232wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 05:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=tCJLepkQpMZcNKVz2iO1wpU9bLET/b0R7i2G93BsZp8=;
	b=J3Iq9VIi6E7V2Pa8in6FGKT6EqO4T19p0S2/n46nYebwrWy8QRF2CxiZ21L8E1fws9
	WDaIsp/dTBziUM2yetNvpKl3CbHfwh+ImHnchL/aLbFz1AdGsLUaYq+lEEY+0xZfwRzH
	VtnXAFnwLdslVRkwIqCpRVUkFlDpXqJ2WQ/TbMVHT39nv50uCqUUNk5b3yllEjH2ub4+
	PX5xZZSWkGr+MoYIO0JLMc7k7Ckq0iWGLCWz0/sBD4iysvFIR0Qn67kGg2ne6M7TKioy
	mZHwmW8QQWd0SGWkHsPvDWzXPOi+IuYWSZUszCiOteEKD1J6/xE2Vb1+ZPmckUyFyemj
	kypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=tCJLepkQpMZcNKVz2iO1wpU9bLET/b0R7i2G93BsZp8=;
	b=CndoQLfoSdvd6aQ/rdAznUCgoCpSOiLsENa2x9kQaMaidrv5KtzygI+YPc4Lf74i25
	91pwOWacEFLQh1BFI4SIT0TTGoD222BCt8s1YpkEckVyj7RyRg3KPu+IV9t1C5HxLZY6
	hWAtXkI4JCozeNRGd0rQPPgiRTlJEeDpAmRJP9uUMQlYHgGgeUqnZUKE0mU12wcMrwiW
	CT0l1lz0vIYs6UHk17DWwsa4Mpt0/Jfoe5gtH/tg60g2eNbgyNcO/Ds0y8NADfR8pM1+
	k/KSyOTlJicdvZY9AqBA3hGY5jQXU8KYQSm7iGD3nvURV4kKwgOWfjFOYaHE2dlk9Pxz
	FBiw==
X-Gm-Message-State: ALyK8tIDlJDverfhKGTHZpEDFrSTQ51DA4J1Ilo3upGUjJxjM27ykbIfbv1d2D4Yow0a0g==
X-Received: by 10.28.21.202 with SMTP id 193mr2439764wmv.92.1465561976787;
	Fri, 10 Jun 2016 05:32:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	j4sm11502935wjg.20.2016.06.10.05.32.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 Jun 2016 05:32:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Jun 2016 14:33:29 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160610123329.GA2582@jama>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
	<9b8c1ff28b105001b94ea2b45063c40e3038938b.1464090710.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <9b8c1ff28b105001b94ea2b45063c40e3038938b.1464090710.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [PATCH 6/8] python-pygobject: add a recipe
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
X-List-Received-Date: Fri, 10 Jun 2016 12:32:58 -0000
X-Groupsio-MsgNum: 61789
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline

--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2016 at 02:56:59PM +0300, Alexander Kanavin wrote:
> oe-core provides only python3-pygobject now, and a few recipes in meta-oe
> still need the version built against Python 2.

I've merged this but now it started to fail:

| checking whether python2.7 version >=3D 2.7... yes
| checking for python2.7 version... 2.7
| checking for python2.7 platform... linux2
| checking for python2.7 script directory... ${prefix}/lib64/python2.7/site=
-packages
| checking for python2.7 extension module directory... ${exec_prefix}/lib64=
/python2.7/site-packages
| checking for python version... (cached) 2.7
| checking for python platform... (cached) linux2
| checking for python script directory... (cached) ${prefix}/lib64/python2.=
7/site-packages
| checking for python extension module directory... (cached) ${exec_prefix}=
/lib64/python2.7/site-packages
| checking for headers required to compile python extensions... not found
| configure: error: Python headers not found
| WARNING: python-pygobject/3.18.2-r0/temp/run.do_configure.32140:1 exit 1 =
=66rom 'exit 1'
| ERROR: Function failed: do_configure (log file is located at python-pygob=
ject/3.18.2-r0/temp/log.do_configure.32140)
NOTE: recipe python-pygobject-3.18.2-r0: task do_configure: Failed


>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  ...c-add-sysroot-path-to-GI_DATADIR-don-t-se.patch | 41 ++++++++++++++++=
++++++
>  .../python/python-pygobject_3.18.2.bb              | 31 ++++++++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/python/python-pygobject/0001=
-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
>  create mode 100644 meta-oe/recipes-devtools/python/python-pygobject_3.18=
=2E2.bb
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-pygobject/0001-config=
ure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch b/meta-oe/recipes-devt=
ools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATAD=
IR-don-t-se.patch
> new file mode 100644
> index 0000000..a391f7e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-=
add-sysroot-path-to-GI_DATADIR-don-t-se.patch
> @@ -0,0 +1,41 @@
> +From 5e5350d730f85957a42c6d846d347d080e7dd996 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 23 Oct 2015 12:40:34 +0300
> +Subject: [PATCH] configure.ac: add sysroot path to GI_DATADIR; don't set
> + introspection scanner and compiler paths
> +
> +Upstream-Status: Pending [review on oe-core maillist]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + configure.ac | 8 +-------
> + 1 file changed, 1 insertion(+), 7 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 2c0cfbd..cfcb3bf 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -194,7 +194,7 @@ PKG_CHECK_MODULES(GI,
> +     gobject-introspection-1.0 >=3D introspection_required_version
> + )
> +=20
> +-GI_DATADIR=3D$($PKG_CONFIG --variable=3Dgidatadir gobject-introspection=
-1.0)
> ++GI_DATADIR=3D$PKG_CONFIG_SYSROOT_DIR$($PKG_CONFIG --variable=3Dgidatadi=
r gobject-introspection-1.0)
> + AC_SUBST(GI_DATADIR)
> +=20
> + if test "$enable_cairo" !=3D no; then
> +@@ -219,12 +219,6 @@ AC_ARG_WITH(common,
> +     with_common=3Dyes)
> + AM_CONDITIONAL(WITH_COMMON, test "$with_common" =3D "yes")
> +=20
> +-INTROSPECTION_SCANNER=3D`$PKG_CONFIG --variable=3Dg_ir_scanner gobject-=
introspection-1.0`
> +-INTROSPECTION_COMPILER=3D`$PKG_CONFIG --variable=3Dg_ir_compiler gobjec=
t-introspection-1.0`
> +-
> +-AC_SUBST(INTROSPECTION_SCANNER)
> +-AC_SUBST(INTROSPECTION_COMPILER)
> +-
> + # compiler warnings, errors, required cflags, and code coverage support
> + GNOME_COMPILE_WARNINGS([maximum])
> + AC_MSG_CHECKING(for Gnome code coverage support)
> +--=20
> +2.1.4
> +
> diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb b=
/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
> new file mode 100644
> index 0000000..e4eeafb
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
> @@ -0,0 +1,31 @@
> +SUMMARY =3D "Python GObject bindings"
> +SECTION =3D "devel/python"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb742476=
9c7"
> +
> +inherit autotools pkgconfig gnomebase distutils-base gobject-introspecti=
on
> +
> +DEPENDS +=3D "python glib-2.0"
> +
> +SRCNAME=3D"pygobject"
> +SRC_URI =3D " \
> +    http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("$=
{PV}")}/${SRCNAME}-${PV}.tar.xz \
> +    file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.pat=
ch \
> +"
> +
> +SRC_URI[md5sum] =3D "0a956f3e785e23b0f136832f2e57a862"
> +SRC_URI[sha256sum] =3D "2a3cad1517916b74e131e6002c3824361aee0671ffb0d55d=
ed119477fc1c2c5f"
> +
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +EXTRA_OECONF =3D "--disable-cairo --with-python=3Dpython2.7"
> +
> +RDEPENDS_${PN} +=3D "python-setuptools python-importlib"
> +
> +do_install_append() {
> +    # Remove files that clash with python3-pygobject; their content is s=
ame
> +    rm ${D}${includedir}/pygobject-3.0/pygobject.h ${D}${libdir}/pkgconf=
ig/pygobject-3.0.pc
> +}
> +
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldasZIACgkQN1Ujt2V2gBzcWwCdEQXNsYU32vRbizFKOMnQYLKG
Ls8AoLgOIqYvdghW/g/5M+ee2kSRSGXi
=RRNo
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
