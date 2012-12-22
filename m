Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TmRnz-0004Q5-1X; Sat, 22 Dec 2012 17:20:08 +0100
Received: by mail-ea0-f177.google.com with SMTP id c10so2305028eaa.22
	for <multiple recipients>; Sat, 22 Dec 2012 08:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=XL/w/bewAFiQwZWwngF+kDkEk804KB4D2qkK40fuVho=;
	b=OBoD654kZBx4eTTkoUX9l5jtG72NrbpmAxShO5tP2rBcNypEXoam88+0U8QiSQ2g8t
	rOBRDvT17LUVvNkFZOgpcX0bGFIGjxCyraYpSOA49sxLFAQLSnpUIgokO1TRSXL/0DwG
	Ze4T0tDlTgfPEKErbS+9by6Bxq2+3XgwJatgOp77hPxR6GNxEZJVPjXbkCD2zltDgDpK
	iczwtdXiLZ8WMjsWAFiB540ETeJTpyKEpVVMdndP4P+xGWhuw7y24dfhUcMxNh8wmijo
	EQerJjY7EYnCLSYlMGUh/23sJ0EstyyFB6niyx0BxMtIharHCp/kEA7j3jyJtqtgLEAu
	k9GA==
X-Received: by 10.14.2.196 with SMTP id 44mr41170818eef.25.1356192319383;
	Sat, 22 Dec 2012 08:05:19 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d3sm28992073eeo.13.2012.12.22.08.05.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Dec 2012 08:05:18 -0800 (PST)
Date: Sat, 22 Dec 2012 17:05:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121222160515.GA8988@jama.palm1.palmone.com>
References: <20121219175401.20C2610394@opal>
MIME-Version: 1.0
In-Reply-To: <20121219175401.20C2610394@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Marko Lindqvist : libpng: update to upstream version 1.5.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Dec 2012 16:20:23 -0000
X-Groupsio-MsgNum: 42322
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 19, 2012 at 05:54:00PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 317cbe5f5d4bf9366657a0d5383108c1b3340a8a
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D317cbe5f5d4bf9366657a0d5383108c1b3340a8a
>=20
> Author: Marko Lindqvist <cazfi74-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date:   Thu Dec 13 19:48:14 2012 +0200
>=20
> libpng: update to upstream version 1.5.13
>=20
> Updating from 1.2.x means also change in actual library name
> from libpng12 to libpng15, and slight changes in API.

Why isn't this handled by debian.bbclass like in other libs?

PN-dev and PN-dbg are broken, because they depend on nonexistent libpng
and main libpng package is named libpng15-15

Package: libpng15-15
Version: 1.5.13-r0
Depends: libz1 (>=3D 1.2.7), libc6 (>=3D 2.16)

Package: libpng-dev
Version: 1.5.13-r0
Depends: libpng (=3D 1.5.13-r0), libpng15-15

Package: libpng-dbg
Version: 1.5.13-r0
Recommends: libpng (=3D 1.5.13-r0), libc6-dbg, libz-dbg

Cheers,

>=20
> License md5sums differ only because of license text formatting
> changes and because they contain version numbers and release dates.
>=20
> Signed-off-by: Marko Lindqvist <cazfi74-Re5JQEeQqe8AvxtiuMwx3w@public.gma=
ne.org>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-multimedia/libpng/libpng_1.2.50.bb |   23 -----------------=
-----
>  meta/recipes-multimedia/libpng/libpng_1.5.13.bb |   24 +++++++++++++++++=
++++++
>  2 files changed, 24 insertions(+), 23 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb b/meta/recip=
es-multimedia/libpng/libpng_1.2.50.bb
> deleted file mode 100644
> index 7015538..0000000
> --- a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY =3D "PNG Library"
> -DESCRIPTION =3D "PNG Library"
> -HOMEPAGE =3D "http://www.libpng.org/"
> -SECTION =3D "libs"
> -LICENSE =3D "Libpng"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc3d807a85c09ebdff087f18b4969f=
f96 \
> -                    file://png.h;beginline=3D310;endline=3D424;md5=3Db87=
b5e9252a3e14808a27b92912d268d"
> -DEPENDS =3D "zlib"
> -PR =3D "r0"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-=
${PV}.tar.xz"
> -
> -SRC_URI[md5sum] =3D "a3e00fccbfe356174ab515b5c00641c7"
> -SRC_URI[sha256sum] =3D "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9f=
baff07bfd9d8e8e7"
> -
> -inherit autotools binconfig pkgconfig
> -
> -PACKAGES =3D+ "${PN}12"
> -
> -FILES_${PN}12 =3D "${libdir}/libpng12${SOLIBS}"
> -RPROVIDES_${PN}-dev +=3D "${PN}12-dev"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.5.13.bb b/meta/recip=
es-multimedia/libpng/libpng_1.5.13.bb
> new file mode 100644
> index 0000000..28220ad
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "PNG Library"
> +DESCRIPTION =3D "PNG Library"
> +HOMEPAGE =3D "http://www.libpng.org/"
> +SECTION =3D "libs"
> +LICENSE =3D "Libpng"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D00b5b35853278d508806c2e5860e8=
2cb \
> +                    file://png.h;beginline=3D207;endline=3D321;md5=3D50e=
583fb60bb36f37ab5023b2a3715d1"
> +DEPENDS =3D "zlib"
> +PR =3D "r0"
> +LIBV =3D "15"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/li=
bpng-${PV}.tar.xz"
> +
> +SRC_URI[md5sum] =3D "0b607a685da977f1bfc96e1c47055183"
> +SRC_URI[sha256sum] =3D "b843f9cb01d10ae22acd9aaf58aceaa4a6aeb9cf78943b41=
588004b271257aee"
> +
> +inherit autotools binconfig pkgconfig
> +
> +PACKAGES =3D+ "${PN}${LIBV}"
> +
> +FILES_${PN}${LIBV} =3D "${libdir}/libpng${LIBV}${SOLIBS}"
> +RPROVIDES_${PN}-dev +=3D "${PN}${LIBV}-dev"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDV2jsACgkQN1Ujt2V2gByRTQCgouWSeomwLX7PKR+J73YypC6x
vrYAnjjetqcPnfAs/2bBNr4xYa/x5Mst
=xktI
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
