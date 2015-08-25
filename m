Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A94AF73DF0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 13:45:56 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ZUEXz-0004Df-29 from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2015 06:45:55 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 25 Aug 2015 06:45:54 -0700
Received: by burninator (Postfix, from userid 1000)	id 846B558347A; Tue, 25
	Aug 2015 09:45:01 -0400 (EDT)
Date: Tue, 25 Aug 2015 09:45:01 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150825134501.GB7593@mentor.com>
References: <1440436986-30016-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1440436986-30016-1-git-send-email-Martin.Jansa@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] tcpdump: add PACKAGECONFIG for smi
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
X-List-Received-Date: Tue, 25 Aug 2015 13:46:00 -0000
X-Groupsio-MsgNum: 57020
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline

--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Acked-by: Joe MacDonald <Joe_MacDonald@mentor.com>

[[oe] [meta-networking][PATCH] tcpdump: add PACKAGECONFIG for smi] On 15.08=
=2E24 (Mon 19:23) Martin Jansa wrote:

> * libsmi is autodetected in configure, but in most cases disabled because=
 of
>   cross-compilation so keep it explicitly disabled
> * resolves following difference in builds with and without libsmi built
>   before tcpdump:
>   4.7.4-r0-with/temp/log.do_configure:checking smi.h usability... yes
>   4.7.4-r0-with/temp/log.do_configure:checking smi.h presence... yes
>   4.7.4-r0-with/temp/log.do_configure:checking for smi.h... yes
>   4.7.4-r0-with/temp/log.do_configure:checking for smiInit in -lsmi... yes
>   4.7.4-r0-with/temp/log.do_configure:checking whether to enable libsmi..=
=2E not when cross-compiling
>=20
>   4.7.4-r0-without/temp/log.do_configure:checking smi.h usability... no
>   4.7.4-r0-without/temp/log.do_configure:checking smi.h presence... no
>   4.7.4-r0-without/temp/log.do_configure:checking for smi.h... no
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb b/m=
eta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> index b0b8e9d..0ffe589 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> @@ -22,6 +22,7 @@ CACHED_CONFIGUREVARS =3D "ac_cv_linux_vers=3D${ac_cv_li=
nux_vers=3D2}"
>  PACKAGECONFIG ??=3D "openssl ipv6"
>  PACKAGECONFIG[openssl] =3D "--with-crypto=3Dyes, --without-openssl --wit=
hout-crypto, openssl"
>  PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6,"
> +PACKAGECONFIG[smi] =3D "--with-smi, --without-smi,libsmi"
> =20
>  EXTRA_AUTORECONF +=3D " -I m4"
> =20
> --=20
> 2.5.0
>=20
--=20
-Joe MacDonald.
:wq

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV3HFdAAoJEEn8ffcsOfaW9xkIALZWyhZfPOh2rHid5RKLrm62
YWx/+mToZK45pUIuFt65BYQYAPq6bnzAmY3GsDVg+jYplY469Kk+nh9TGqJ5b1mZ
3WZur86Xb67esMi40E+n9M181ApsnaEvwDjBUBovW4flEBfuvAPomkVf9DglXtlx
VNxIMw59PWqydCcRoV/YNsItGVb+9Hz3oXLUyFZuP+nTjqsV59LlIsJyxpkRFgZA
BGiS4qMItRVjhCqhUFv7Z1+mXWKSsVsM1C/TB9pCUK0gr4dtFR8xo+PPM4hIiGEQ
Yfm4VF/w/e5hUHLZfqWwNVUJcn+IGoR0i+K/kS6Hdp6rOviixMRQksA/H7Um3JY=
=mIt0
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
