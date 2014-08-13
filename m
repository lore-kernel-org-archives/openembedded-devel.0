Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 15F0B60B05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 21:31:19 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id l4so283797lbv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 14:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t4k+d7zPn+sUtCs5qUq2FdgzlYNfHG0KhOiCMMyjW0Q=;
	b=Ot/FI1DCuDiA9tP6+aJMsve6DZ2pAZxuZWGcmgJWmO9729rB7AdEHd7tOM5IXMBXIp
	MqZ8x4jUMN+GVpzQLsJ063hi7+2WYocB8tHygingn7oy8tZ1C9pi/lIRPfLnn60lLPiE
	00vzkfrAodYk6DG57eSQqUDFt8A8R8qYPGM1oMloLcF1a8zRZ9ELIRpx9gjQmTKeLOxC
	zW7Z1vtHfXNYKX/AthNGUp1B1d1eci7z6V+9lml/t81CMAN+Rvx7e0BDJBcPbFt9wuQC
	tM70WjAp51L60hD/fc1+qEdxA2UqYLkgfpns4zm4cMqhQU2x5fw9pKuYVwwhomns42UC
	Oerw==
X-Received: by 10.152.19.135 with SMTP id f7mr592252lae.33.1407965479979;
	Wed, 13 Aug 2014 14:31:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bc17sm1873327lab.24.2014.08.13.14.31.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 14:31:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Aug 2014 23:31:51 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140813213151.GB14848@jama>
References: <BLU436-SMTP50D01295E957678D343638D6EB0@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU436-SMTP50D01295E957678D343638D6EB0@phx.gbl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v3] Add cyassl to meta-networking/recipes-connectivity
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
X-List-Received-Date: Wed, 13 Aug 2014 21:31:28 -0000
X-Groupsio-MsgNum: 51657
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QK8nhFMwR+o7J1de"
Content-Disposition: inline

--QK8nhFMwR+o7J1de
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2014 at 03:24:28PM -0600, lchristina26 wrote:
> Signed-off-by: Leah Thompson <lchristina26@hotmail.com>

This is just incremental patch again, please squash it with cyassl
addition.

> ---
>  meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb =
b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> index 441d321..0c0cac2 100644
> --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> @@ -9,13 +9,10 @@ SECTION =3D "libs/network"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> =20
> -SRC_URI =3D "http://www.yassl.com/cyassl-${PV}.zip"
> -
> +SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> =20
>  SRC_URI[md5sum] =3D "72477eb50697e759d309c49cb1aef18a"
>  SRC_URI[sha256sum] =3D "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2ad=
c16d2507b5d0b03e"
> =20
> -S =3D "${WORKDIR}/${PN}-${PV}"
> -
>  inherit autotools
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QK8nhFMwR+o7J1de
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPr2UcACgkQN1Ujt2V2gBzsnwCeKMWQcnuZ5eW//wCRp6BuQZNh
pEwAn2justeKkBTP6x7/Ie7jdIIet6AP
=RsXl
-----END PGP SIGNATURE-----

--QK8nhFMwR+o7J1de--
