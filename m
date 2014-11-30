Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 54B027228D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 20:48:30 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1XvBPy-0002x0-MJ from Joe_MacDonald@mentor.com ;
	Sun, 30 Nov 2014 12:48:30 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.181.6;
	Sun, 30 Nov 2014 12:48:30 -0800
Received: by burninator (Postfix, from userid 1000)	id 6376F58044A; Sun, 30
	Nov 2014 15:48:29 -0500 (EST)
Date: Sun, 30 Nov 2014 15:48:29 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <wenzong.fan@windriver.com>
Message-ID: <20141130204829.GR3886@mentor.com>
References: <1416899468-28398-1-git-send-email-wenzong.fan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1416899468-28398-1-git-send-email-wenzong.fan@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] sethdlc: fix host contamination
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
X-List-Received-Date: Sun, 30 Nov 2014 20:48:31 -0000
X-Groupsio-MsgNum: 53093
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWOY2/vB4uO4FuME"
Content-Disposition: inline

--JWOY2/vB4uO4FuME
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks Wenzong.
-J.

[[oe] [PATCH][meta-networking] sethdlc: fix host contamination] On 14.11.25=
 (Tue 02:11) wenzong.fan@windriver.com wrote:

> From: Wenzong Fan <wenzong.fan@windriver.com>
>=20
> * Clean INCLUDES to fix the host contamination errors:
>=20
>   In file included from /usr/src/linux/include/linux/posix_types.h:47:0,
>   from /usr/src/linux/include/linux/types.h:17,
>   from /usr/src/linux/include/linux/if.h:22,
>   from sethdlc.c:23:
>   /usr/src/linux/include/asm-generic/posix_types.h:91:3: \
>     error: conflicting types for '__kernel_fsid_t'
>   } __kernel_fsid_t;
>   ^
>   .../tmp/sysroots/qemumips/usr/include/asm/posix_types.h:26:3: \
>     note: previous declaration of '__kernel_fsid_t' was here
>   } __kernel_fsid_t;
>   ^
>=20
> * Correct LIC_FILES_CHKSUM to checkout license infos from sethdl.c
>   instead of Makefile.
>=20
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  .../files/sethdlc-fix-host-contamination.patch     |   42 ++++++++++++++=
++++++
>  .../recipes-connectivity/sethdlc/sethdlc.bb        |    3 +-
>  2 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-connectivity/sethdlc/files/se=
thdlc-fix-host-contamination.patch
>=20
> diff --git a/meta-networking/recipes-connectivity/sethdlc/files/sethdlc-f=
ix-host-contamination.patch b/meta-networking/recipes-connectivity/sethdlc/=
files/sethdlc-fix-host-contamination.patch
> new file mode 100644
> index 0000000..f25a02c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/sethdlc/files/sethdlc-fix-host=
-contamination.patch
> @@ -0,0 +1,42 @@
> +From 9a9137c3df5309ac359737d6ebd67fb4ff5f3cf2 Mon Sep 17 00:00:00 2001
> +From: Wenzong Fan <wenzong.fan@windriver.com>
> +Date: Mon, 24 Nov 2014 22:05:18 -0500
> +Subject: [PATCH] sethdlc: fix host contamination
> +
> +Clean INCLUDES to fix the host contamination errors:
> +
> +  In file included from /usr/src/linux/include/linux/posix_types.h:47:0,
> +  from /usr/src/linux/include/linux/types.h:17,
> +  from /usr/src/linux/include/linux/if.h:22,
> +  from sethdlc.c:23:
> +  /usr/src/linux/include/asm-generic/posix_types.h:91:3: \
> +    error: conflicting types for '__kernel_fsid_t'
> +  } __kernel_fsid_t;
> +  ^
> +  .../tmp/sysroots/qemumips/usr/include/asm/posix_types.h:26:3: \
> +    note: previous declaration of '__kernel_fsid_t' was here
> +  } __kernel_fsid_t;
> +  ^
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> +---
> + Makefile |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 0492f2b..97dec22 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,6 +1,6 @@
> + CC =3D gcc
> + CFLAGS =3D -O2 -Wall -W -Wno-long-long -pipe
> +-INCLUDES =3D -I/usr/src/linux/include -I/usr/src/linux-2.6/include
> ++INCLUDES =3D
> +=20
> + all:		sethdlc
> +=20
> +--=20
> +1.7.9.5
> +
> diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/me=
ta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> index cf74827..5e8d9d9 100644
> --- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> +++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> @@ -1,10 +1,11 @@
>  DESCRIPTION =3D "set Linux HDLC packet radio modem driver port informati=
on"
>  HOMEPAGE =3D "https://www.kernel.org/pub/linux/utils/net/hdlc"
>  LICENSE =3D "GPLv2 & GPLv2+ "
> -LIC_FILES_CHKSUM =3D "file://Makefile;md5=3D19aada31930b2be84bf7138420d7=
7263"
> +LIC_FILES_CHKSUM =3D "file://sethdlc.c;endline=3D10;md5=3D90f936879e9f8b=
755a138aeb348782eb"
> =20
> =20
>  SRC_URI =3D "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-1.18=
=2Etar.gz \
> +           file://sethdlc-fix-host-contamination.patch \
>  "
>  SRC_URI[md5sum] =3D "9016878156a5eadb06c0bae71cc5c9ab"
>  SRC_URI[sha256sum] =3D "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706=
bd5b3d4f6ab6b04e"
> --=20
> 1.7.9.5
>=20
--=20
-Joe MacDonald.
:wq

--JWOY2/vB4uO4FuME
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUe4KdAAoJEEn8ffcsOfaWAzIH/jOWdjGnI4bSo/yWcepM7MA0
Sij2Md3Dt9qFldxdp12TK0VPH23jlUBS+93ofyYRVCs1lZHUxsIMDRMhU11aCoTf
x9uQakBzR9qfhXKNaqEQeVrIxJce6NZdE9t4tmQS7arixyjzJXdkLyC1Risyry4j
ePwKh6YFIKXJBYmI6/rRUGstz178oTeieTbx/aphqwh6QhpZQtXfTX4bLt3q6bTX
NnoeN/NzzjslrSm6BGdEXrBUDyYW1XNmPZPQhbNwZUsa5jfNJr49kElhZASRTyHs
MZn3r+hoFnebNrLACPMhWs6o8seiJxIMBWH2saKtrdh802eE0Y72nvkdmmeeM3c=
=8yij
-----END PGP SIGNATURE-----

--JWOY2/vB4uO4FuME--
