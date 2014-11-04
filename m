Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2A24270A8B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Nov 2014 21:31:31 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1XllhM-0002BO-Id from Joe_MacDonald@mentor.com ;
	Tue, 04 Nov 2014 13:31:32 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.181.6; Tue, 4 Nov 2014
	13:31:32 -0800
Received: by burninator (Postfix, from userid 1000)	id 88AA1581737; Tue,  4
	Nov 2014 16:31:31 -0500 (EST)
Date: Tue, 4 Nov 2014 16:31:31 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Chong Lu <Chong.Lu@windriver.com>
Message-ID: <20141104213131.GC11534@mentor.com>
References: <1414653948-23213-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1414653948-23213-1-git-send-email-Chong.Lu@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] polarssl: set LIB_INSTALL_DIR to baselib
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
X-List-Received-Date: Tue, 04 Nov 2014 21:31:32 -0000
X-Groupsio-MsgNum: 52734
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Content-Disposition: inline

--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Also merged.  I didn't dig into why, but I got a patch failure when I
added it, so I re-created it and preserved your header.  You should have
a quick look-see, just to be sure, though.

Thanks,
-J.

[[oe] [meta-networking][PATCH] polarssl: set LIB_INSTALL_DIR to baselib] On=
 14.10.30 (Thu 15:25) Chong Lu wrote:

> This solves the following warning:
>=20
> polarssl-1.3.8: polarssl: Files/directories were installed but not shipped
>   /usr/lib
>   /usr/lib/libpolarssl.so.1.3.8
>   /usr/lib/libpolarssl.so.7
>   /usr/lib/libpolarssl.so
>   /usr/lib/libpolarssl.a
>   /usr/lib/.debug
>   /usr/lib/.debug/libpolarssl.so.1.3.8 [installed-vs-shipped]
> polarssl-1.3.8: polarssl requires libpolarssl.so.7()(64bit), but no provi=
ders
> in its RDEPENDS [file-rdeps]
>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  recipes-connectivity/polarssl/polarssl_1.3.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8=
=2Ebb b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> index 3f9ba18..fa89631 100644
> --- a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> +++ b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> @@ -18,6 +18,6 @@ SRC_URI[sha256sum] =3D "318171db41335cacbb5b0047c94f1fa=
f91442ab70a223b5223436703c9
> =20
>  DEPENDS =3D "openssl"
>  RDEPENDS_${PN} +=3D "libcrypto"
> -EXTRA_OECMAKE =3D "-DUSE_SHARED_POLARSSL_LIBRARY=3Don"
> +EXTRA_OECMAKE =3D "-DUSE_SHARED_POLARSSL_LIBRARY=3Don -DLIB_INSTALL_DIR=
=3D${baselib}"
> =20
>  inherit cmake
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUWUWzAAoJEEn8ffcsOfaWSAwH/1SW3khHAhiLcs6VUL2jKKVP
G+juDWBMlLdhlnILkc9JAqLXD9DoHyu+LCi9B3+O7hBh91NoZFMOEVn6B8KGzdLx
Pz/jm4+aTSO7emsMUOXiShfK12ywwpMnBXwfaFmvRRbNhUCtd2oQzQB5iEQZS6gf
hg7sk76NpHUz2t7SZJwyrYUulbXCQP31XB+L0BuB8gytz3RRE/SOYZmdQjjNP8j2
m4vDIuNEfYZ+v5mrVwwxGi6sK2Tn4KqkpHB70poLxV/VHPQ73l/hQO3YD3oFXiW+
FKjbzJcf6CQGRGW/p9/IVV3C+NjkXZVbOO7g2hHfPZZRF8f7gg6gZFs9hjeCRQM=
=tA10
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--
