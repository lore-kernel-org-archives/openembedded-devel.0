Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 845836B24F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 20:01:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6HK1lJx008871
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 13:01:47 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 17 Jul 2013 13:01:45 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id E75867FE6;
	Wed, 17 Jul 2013 16:01:44 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id D2D6E410F8; Wed,
	17 Jul 2013 15:55:32 -0400 (EDT)
Date: Wed, 17 Jul 2013 15:55:32 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <rongqing.li@windriver.com>
Message-ID: <20130717195532.GF31259@windriver.com>
References: <1373956693-24572-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1373956693-24572-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] ipsec-tools: fix dependencies and enable two configuration
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
X-List-Received-Date: Wed, 17 Jul 2013 20:01:47 -0000
X-Groupsio-MsgNum: 45400
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ahP6B03r4gLOj5uD"
Content-Disposition: inline

--ahP6B03r4gLOj5uD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[meta-networking][PATCH] ipsec-tools: fix dependencies and enable two conf=
iguration] On 13.07.16 (Tue 14:38) rongqing.li@windriver.com wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> ipsec-tools depends on bison-native
> enable ipv6 support by DISTRO_FEATURE, and enable shared library support.
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb |    6 =
++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.=
1.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> index ef753c0..c44d374 100644
> --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> @@ -5,7 +5,7 @@ SECTION =3D "console/network"
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://src/libipsec/pfkey.c;beginline=3D6;endline=
=3D31;md5=3Dbc9b7ff40beff19fe6bc6aef26bd2b24"
> =20
> -DEPENDS =3D "virtual/kernel openssl readline flex"
> +DEPENDS =3D "virtual/kernel openssl readline flex bison-native"
> =20
>  SRC_URI =3D "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-=
tools-${PV}.tar.bz2 \
>             file://0001-Fix-warning-with-gcc-4.8.patch \
> @@ -46,7 +46,9 @@ EXTRA_OECONF =3D "--with-kernel-headers=3D${STAGING_INC=
DIR} \
>                  --without-libradius \
>                  --without-gssapi \
>                  --without-libpam \
> -                --disable-security-context"
> +                --disable-security-context \
> +                --enable-shared \
> +                ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ip=
v6=3Dyes', '', d)}"
> =20
>  # See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D530527
>  CFLAGS +=3D "-fno-strict-aliasing"
--=20
-Joe MacDonald.
:wq

--ahP6B03r4gLOj5uD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHm9rQACgkQPN8S4W6ZZnfmDgCfRBt6cuz/hTQc2dkRci1HhZnN
3OkAmwSCoqCPXc1Y97/KV7LNyrBbqhVG
=L6ta
-----END PGP SIGNATURE-----

--ahP6B03r4gLOj5uD--
