Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4F27975D76
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 10:43:06 +0000 (UTC)
Received: by wifm2 with SMTP id m2so85297749wif.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jul 2015 03:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rpWYtjPRr86lv4ilG34EXmQhFXTKZC4tdxTYvdhP4P8=;
	b=gNm3OoiemTZ9ru/fwSm7ttZ3eOzrujnakA1c/5SVnLyU9ufo0QEZAkoonzhcraywAt
	QKDxvGG5QPJWIr6xlDVHLnw89XEDluBoDxnFGbQXmojEbDhroIjh/S6hW7SkLB36V6nP
	qGFYIugeLUXljTGojqfbZinsr0LIMU3oRVTnTqh18K2MBBvFq3HnAvTbyMwDS7BzP9Gb
	MFEbdxFGK4aHRQH4Hc7hAQoYD0IcipFNJFiQ/wKuPiG3XsPmG8Lszx6voTbiU5Yckdvb
	8XpawUHgaBHNaWZKemHOA5eJdKZp7zxfrkHCgoebiI5uBGlg7thP0L0F0uK5GNZ6AjKH
	Sz+Q==
X-Received: by 10.194.5.4 with SMTP id o4mr19595883wjo.51.1436352186898;
	Wed, 08 Jul 2015 03:43:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id lu5sm2782888wjb.9.2015.07.08.03.43.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jul 2015 03:43:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Jul 2015 12:43:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150708104316.GC2398@jama>
References: <1436341215-1648-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1436341215-1648-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libssh2: upgrade 1.4.3 -> 1.6.0
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
X-List-Received-Date: Wed, 08 Jul 2015 10:43:07 -0000
X-Groupsio-MsgNum: 56187
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline

--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2015 at 03:40:15PM +0800, Li xin wrote:
> Update the checksum of COPYING,since the date in it has been changed,
> but the LICENSE has not been changed.

There already is patch for this on ML and in master-next.

> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../recipes-support/libssh2/{libssh2_1.4.3.bb =3D> libssh2_1.6.0.bb}  | =
6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/libssh2/{libssh2_1.4.3.bb =3D> libssh2_1.=
6.0.bb} (60%)
>=20
> diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb b/meta-oe/r=
ecipes-support/libssh2/libssh2_1.6.0.bb
> similarity index 60%
> rename from meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
> rename to meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
> index b537663..022482c 100644
> --- a/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
> +++ b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
> @@ -5,11 +5,11 @@ SECTION =3D "libs"
>  DEPENDS =3D "zlib openssl"
> =20
>  LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd00afe44f336a79a2ca7e1681ce14=
509"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc5cf34fc0acb44b082ef50ef5e435=
4ca"
> =20
>  SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz"
> -SRC_URI[md5sum] =3D "071004c60c5d6f90354ad1b701013a0b"
> -SRC_URI[sha256sum] =3D "eac6f85f9df9db2e6386906a6227eb2cd7b3245739561cad=
7d6dc1d5d021b96d"
> +SRC_URI[md5sum] =3D "00aabd6e714a5f42a4fb82ace20db1dd"
> +SRC_URI[sha256sum] =3D "5a202943a34a1d82a1c31f74094f2453c207bf9936093867=
f41414968c8e8215"
> =20
>  inherit autotools pkgconfig
> =20
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWc/sMACgkQN1Ujt2V2gBwUEACfXU4Uq0SNYGl0xnnQXJ31i202
2h0AoIYOwC39QDk6jA8aWFwWPVboYG0p
=idOG
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
