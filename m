Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f177.google.com (unknown [209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8C87260196
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 08:29:03 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id s7so4214lbd.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 01:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3MOpZCZ6To4RQVK/sfZTRuc04phE4QgcR2aQBNlzdPE=;
	b=ZsSX8H1DF2MTfxysf29A5mraYzoqc+JbxHFf4JwYRpRjOF0hBAhSQM9VMopWg7c9zp
	FgX8yGAkeelPSlqjCsj0+WhqxYRJO28BVLDLR/Z60Dbp5tVXEDwTAFryr+UD9h4nbunl
	qc180VImrlltzQK/RNXu7OlL4PFvD0pvcbCUx28k+E/JP0m6/UhbsDyWaO5JTWmRUkwv
	UAN/uKzlqKy0CunahlwRXG6/BYqZuB478cO4HFLlM8sdnv4h+uxIQuXdUxSrGTOvOzBl
	D7grw7OQyNXASxU9VtoDQzr2Y0nMQ7hkJgPmrbE/fXIVJ3Txj6Gbi4AdTE/1gATWKRgm
	uFhw==
X-Received: by 10.112.135.39 with SMTP id pp7mr27927989lbb.29.1399969744353;
	Tue, 13 May 2014 01:29:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u4sm14474023lal.8.2014.05.13.01.29.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 01:29:03 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 May 2014 10:29:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140513082931.GK22774@jama>
References: <cover.1399914295.git.ben.shelton@ni.com>
	<139978ea7125a5ffb15a583faef889b1409e3987.1399914295.git.ben.shelton@ni.com>
	<8672BB614B4CCA40A6B3BDD6FD82050BA112C7DD@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050BA112C7DD@COSNADEXC13.usr.ingenico.loc>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 1/7] bdftopcf: add recipe
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
X-List-Received-Date: Tue, 13 May 2014 08:29:05 -0000
X-Groupsio-MsgNum: 49892
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Aaj1jBvBEV7KRjLi"
Content-Disposition: inline

--Aaj1jBvBEV7KRjLi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2014 at 08:08:18AM +0000, Matthieu CRAPET wrote:
> Hi,
>=20
> Did you reused this recipe:
> https://www.mail-archive.com/openembedded-devel%40lists.openembedded.org/=
msg35721.html
> If so, you could give some credits to the original author.

But it doesn't seem to address the review comments in original patch.

> -----Message d'origine-----
> De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembe=
dded-devel-bounces@lists.openembedded.org] De la part de Ben Shelton
> Envoy=E9=A0: lundi 12 mai 2014 19:32
> =C0=A0: openembedded-devel@lists.openembedded.org
> Objet=A0: [oe] [meta-oe][PATCH 1/7] bdftopcf: add recipe
>=20
> The bdftopcf tool is necessary to build the core X fonts, which ship in B=
DF format.  Adapted from a recipe in OE-Classic and from an earlier mailing=
 list post by Trevor Woerner.
>=20
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb b/meta-o=
e/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
> new file mode 100644
> index 0000000..5009d54
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
> @@ -0,0 +1,13 @@
> +require recipes-graphics/xorg-app/xorg-app-common.inc
> +
> +SUMMARY =3D "bdftopcf is a tool to convert BDF fonts to PCF fonts"
> +HOMEPAGE =3D "http://cgit.freedesktop.org/xorg/app/bdftopcf/"
> +SECTION =3D "x11/app"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9a35333adf75edd1eaef84bca65a=
490"
> +DEPENDS =3D "libxfont"
> +
> +SRC_URI[md5sum] =3D "96a648a332160a7482885800f7a506fa"
> +SRC_URI[sha256sum] =3D "eaf59057ba3d7cffe29526562ce50868da7da823487a4cfb=
3e16946e5ffd2798"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 1.9.3
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Aaj1jBvBEV7KRjLi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNx1+sACgkQN1Ujt2V2gBxOigCfR/BplCs6wNlKwxQi+l3kI6fV
OIEAn1Vd0mLt69sO6ugkql3TWn41bDdW
=REUn
-----END PGP SIGNATURE-----

--Aaj1jBvBEV7KRjLi--
