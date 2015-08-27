Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3570B73E11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 16:28:41 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so80180976wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DVxJcWk3aOkM/xqd3N3odjyKFeTFiulWt2byi6TqPnU=;
	b=M1igdetPLJ58wnJ+LGDAZy+9s0Eqw1V7uOg6Xu21sfrIzqEXMFv2HN1oTusDMw/BRe
	MgqtB9Z1avaWM/1VLt6j0txxVRLhiJhROdDPungiHIqb301e5/kPhK+WUWVNnvy7DEPb
	NipSbnyf3R+Wa/ZzDSwdxLphkTLTf5N14XLZBPRc5Z6zwZfhgoJwyzeT/2luv/CKZPYY
	dow7kq7UC85otSqmowXCWU92qEmYymOy93pNYmqa/u2hbXn+cS9oi8+W+Kf+iKMvzlU1
	WzrPj75Q6BEIxqvTVOks8aMejBQ2xQOfKPfgQjH86YOX9M4NzhhKu9FED6X2tfgGPgD2
	+r3g==
X-Received: by 10.194.185.180 with SMTP id fd20mr6056730wjc.16.1440692921843; 
	Thu, 27 Aug 2015 09:28:41 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id q8sm4324560wik.24.2015.08.27.09.28.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 09:28:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 27 Aug 2015 18:28:56 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150827162856.GC2443@jama>
References: <1440687931-19369-1-git-send-email-TicoTimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1440687931-19369-1-git-send-email-TicoTimo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-python][PATCH v2] python-pyparted: update to 3.10.5
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
X-List-Received-Date: Thu, 27 Aug 2015 16:28:46 -0000
X-Groupsio-MsgNum: 57085
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Content-Disposition: inline

--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2015 at 08:05:31AM -0700, Tim Orling wrote:
> Changes since v1:
>   * use git tag rather than discouraged github archives
>   * add patch to fix float cast error when version is x.y.z form
>   * add minimal parted version (>=3D 2.3) to RDEPENDS

Please put these review changes under --- separator, so that they aren't
part of final commit message.

>=20
> NOTE:
>   If your tree defaults to an earlier parted version (e.g. 1.8.6),
>   you will need to add PREFERRED_VERSION_parted =3D "3.%" to local.conf
>   or you will see a do_compile error (complaining about required
>   libparted version).
> ---
>  .../0001-fix-version-float-check.patch             | 26 ++++++++++++++++=
+++++
>  .../python-pyparted/python-pyparted_3.10.5.bb      | 27 ++++++++++++++++=
++++++
>  .../python-pyparted/python-pyparted_3.9.bb         | 23 ----------------=
--
>  3 files changed, 53 insertions(+), 23 deletions(-)
>  create mode 100644 meta-python/recipes-extended/python-pyparted/python-p=
yparted/0001-fix-version-float-check.patch
>  create mode 100644 meta-python/recipes-extended/python-pyparted/python-p=
yparted_3.10.5.bb
>  delete mode 100644 meta-python/recipes-extended/python-pyparted/python-p=
yparted_3.9.bb
>=20
> diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted=
/0001-fix-version-float-check.patch b/meta-python/recipes-extended/python-p=
yparted/python-pyparted/0001-fix-version-float-check.patch
> new file mode 100644
> index 0000000..db3ab9f
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-pyparted/python-pyparted/0001-f=
ix-version-float-check.patch
> @@ -0,0 +1,26 @@
> +check_mod_version breaks if module version is of x.y.z form
> +use a regex to help cast x.y.z version to a float
> +
> +Upstream-Status: Pending
> +
> +Index: git/setup.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/setup.py
> ++++ git/setup.py
> +@@ -25,6 +25,7 @@ import glob
> + import os
> + import platform
> + import sys
> ++import re
> + from distutils.ccompiler import new_compiler
> + from distutils.errors import CompileError
> + from distutils.errors import LinkError
> +@@ -51,6 +52,8 @@ def pkgconfig(*packages, **kwargs):
> +=20
> + def check_mod_version(module, version):
> +     modversion =3D subprocess.check_output(["pkg-config", "--modversion=
", module])
> ++    match =3D re.search('([0-9]+\.[0-9]+)', modversion)
> ++    modversion =3D match.group(0)
> +     if not float(modversion) >=3D float(version):
> +         sys.stderr.write("*** Minimum required %s version: %s, found: %=
s\n" % (module, version, modversion,))
> +         sys.exit(1)
> diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted=
_3.10.5.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3=
=2E10.5.bb
> new file mode 100644
> index 0000000..d5b8f9a
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.5=
=2Ebb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =3D "pyparted is a set of Python modules that provide Python=
 programmers \
> +an interface to libparted, the GNU parted library for disk partitioning =
and \
> +filesystem manipulation."
> +SUMMARY =3D "Python bindings for libparted"
> +HOMEPAGE =3D "https://github.com/rhinstaller/pyparted"
> +LICENSE =3D "GPL-2.0+"
> +LIC_FILES_CHKSUM =3D "\
> +    file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b \
> +    file://src/_pedmodule.c;startline=3D10;endline=3D22;md5=3Debcb25dde1=
ac9c46e986dec79b404e7e \
> +"
> +DEPENDS +=3D "parted python-re"
> +
> +PV =3D "3.10.5+git${SRCPV}"
> +
> +# upstream only publishes releases in github archives which are discoura=
ged
> +SRCREV =3D "75bba5a5c8b65b21979d69421f661f7708304191"
> +SRC_URI =3D "git://github.com/rhinstaller/pyparted.git;protocol=3Dhttps \
> +           file://0001-fix-version-float-check.patch \
> +"
> +S =3D "${WORKDIR}/git"
> +
> +inherit distutils
> +
> +RDEPENDS_${PN} +=3D "python-stringold python-codecs python-math parted (=
>=3D 2.3)"
> +RDEPENDS_${PN}_class-native =3D ""
> +
> +BBCLASSEXTEND +=3D "native"
> diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted=
_3.9.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.=
bb
> deleted file mode 100644
> index bfb4f6f..0000000
> --- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -DESCRIPTION =3D "pyparted is a set of Python modules that provide Python=
 programmers \
> -an interface to libparted, the GNU parted library for disk partitioning =
and \
> -filesystem manipulation."
> -SUMMARY =3D "Python bindings for libparted"
> -HOMEPAGE =3D "https://fedorahosted.org/pyparted/"
> -LICENSE =3D "GPL-2.0+"
> -LIC_FILES_CHKSUM =3D "\
> -    file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b \
> -    file://src/_pedmodule.c;startline=3D10;endline=3D22;md5=3D70c62bd737=
82a03f56a0571a9f08ea46 \
> -"
> -DEPENDS +=3D "parted"
> -
> -SRC_URI =3D "https://fedorahosted.org/releases/p/y/pyparted/pyparted-${P=
V}.tar.gz"
> -SRC_URI[md5sum] =3D "f16c7ef7f5fa4a43fcb2a4654b487e39"
> -SRC_URI[sha256sum] =3D "a56712e3d058ce3d859c158236dbbf45224018919efd3d88=
0ea80f9e0d0bebbb"
> -S =3D "${WORKDIR}/pyparted-${PV}"
> -
> -inherit distutils
> -
> -RDEPENDS_${PN} +=3D "python-stringold python-codecs python-math"
> -RDEPENDS_${PN}_class-native =3D ""
> -
> -BBCLASSEXTEND +=3D "native"
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

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXfOsgACgkQN1Ujt2V2gBwWrQCbBSNH/sTqMNpSCrhl9ZzuA7Rs
shsAoLbMkypUj8d3k74If4i1UmLWDt70
=epVL
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--
