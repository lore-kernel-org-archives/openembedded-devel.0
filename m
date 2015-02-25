Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3E97771F1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 15:53:13 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1YQeGw-0005XT-Ih from Joe_MacDonald@mentor.com ;
	Wed, 25 Feb 2015 07:53:14 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Feb 2015 07:53:14 -0800
Received: by burninator (Postfix, from userid 1000)	id C358C580C40; Wed, 25
	Feb 2015 10:53:18 -0500 (EST)
Date: Wed, 25 Feb 2015 10:53:18 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <rongqing.li@windriver.com>
Message-ID: <20150225155318.GJ8949@mentor.com>
References: <1424853093-6107-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1424853093-6107-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] lksctp: adjust the shipping of the major version shared library files
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
X-List-Received-Date: Wed, 25 Feb 2015 15:53:14 -0000
X-Groupsio-MsgNum: 54493
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nywXBoy70X0GaB8B"
Content-Disposition: inline

--nywXBoy70X0GaB8B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] lksctp: adjust the shipping of the major ver=
sion shared library files] On 15.02.25 (Wed 16:31) rongqing.li@windriver.co=
m wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> not ship the major version shared library files in the dev packages,
> and ship it into a package which is shipping the full version shared
> library files.
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>

This is a pretty obvious change, so I went ahead and integrated it.  I
rewrote your commit log, though.

Thanks Roy.
-J.

> ---
>  meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb | 4 =
++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.=
0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.=
bb
> index 1651eb8..4cc955f 100644
> --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> @@ -43,17 +43,17 @@ SOLIBMAJORVERSION=3D"1"
>  PACKAGES =3D+ "${PN}-withsctp ${PN}-utils"
> =20
>  FILES_${PN} =3D " \
> +    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
>      ${libdir}/libsctp.so.${SOLIBVERSION} \
>  "
> =20
>  FILES_${PN}-withsctp =3D " \
> +    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
>      ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION} \
>  "
> =20
>  FILES_${PN}-dev +=3D " \
> -    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
>      ${libdir}/libsctp.so \
> -    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
>      ${libdir}/lksctp-tools/libwithsctp.so \
>      ${datadir}/lksctp-tools/*.c \
>      ${datadir}/lksctp-tools/*.h \
> --=20
> 2.1.0
>=20
--=20
-Joe MacDonald.
:wq

--nywXBoy70X0GaB8B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU7e/uAAoJEEn8ffcsOfaWfJUH/0IIYm4NfuhjYI2EJJqKO1Az
fcd104DOhu/tunH8uoJ3Lk9+2TYY+ejGmejCv/Jue49Xvocn85Z+UWcSVuCEqKbw
5SpTGbX5F4M4KO7Qf6VORi07BdWfaGq8fM/4tOTnBi7So/DF8fgn6bvl9TOKf0Qm
Su8njkJJ/tZ5eCWwOW/g2fY42tx9A1V3jFRy+Hln1X5v25XgSJkUWXDroYok9TFv
vXwxq9m/Gmc7pSahhGn2PT/n9rZnjWsabgoIL1GdOnYmuKTOvAmChIDJNOp29KPD
fAKaFFRnxhUII2F86Z+ZMbvjzAizOM7XQJR3h42DWBufmwhERDN28tCZJqLTCPo=
=WVUk
-----END PGP SIGNATURE-----

--nywXBoy70X0GaB8B--
