Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8789275E7D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:02:29 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so148692449wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qXWAyD0OB8LordHJMaMpYQtt/RI8oe/b+OQKmB9ccH8=;
	b=dfqe1/pLvFd1a6umEog6yso0Q8nd29ifHwzcmkqiwQDUJrVb0MWhZpXku0sS8QdDLP
	guucIPpsozz5/PNdykDi1DrVIhsB7LdAk1rxi77fuQz00cisFZVUj1bNsgkEOi1G6Tl+
	h5SBqFfTtGhLNNippiRF8gLsVg+ZgB0R2zmG7fje5agg2yfFVCZTr09LTQvY3XrDiLd5
	wmTmXsqxql7PjG8O0Z+pcg+3MffTv//18v1DYRHv3LsZpSkv3EkQxWxGGWXlLM7vbphV
	fOUdiNcRHWGtXKUXuRM5cgsPQ3RPJWvTI5kR4dYLY1BW8/2fGy45BZ8W0z4Pt/lCbIVF
	huig==
X-Received: by 10.180.73.229 with SMTP id o5mr62373026wiv.36.1440082949144;
	Thu, 20 Aug 2015 08:02:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pe1sm30922949wic.20.2015.08.20.08.02.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 08:02:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2015 17:02:55 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150820150255.GF2446@jama>
References: <1438352528-4758-1-git-send-email-TicoTimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1438352528-4758-1-git-send-email-TicoTimo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [=meta-oe][meta-perl][PATCH] libmodule-pluggable-perl: Update to 5.2
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
X-List-Received-Date: Thu, 20 Aug 2015 15:02:29 -0000
X-Groupsio-MsgNum: 56834
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xkXJwpr35CY/Lc3I"
Content-Disposition: inline

--xkXJwpr35CY/Lc3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2015 at 07:22:08AM -0700, Tim Orling wrote:
> * Convert from Module::Build to ExtUtils::MakeMaker
> * Temporarily use github repository until change is merged upstream
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  ...dule-pluggable-perl_5.1.bb =3D> libmodule-pluggable-perl_5.2.bb} | 8 =
++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-perl/recipes-perl/libmodule/{libmodule-pluggable-perl_5.1.bb=
 =3D> libmodule-pluggable-perl_5.2.bb} (82%)
>=20
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.=
1.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> similarity index 82%
> rename from meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.1=
=2Ebb
> rename to meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> index b916918..76cac50 100644
> --- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.1.bb
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> @@ -17,13 +17,13 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0+"
>  LIC_FILES_CHKSUM =3D "file://README;beginline=3D322;endline=3D325;md5=3D=
086450ce010f6fda25db0b38fcc41086"
> =20
>  SRCNAME =3D "Module-Pluggable"
> -SRC_URI =3D "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.tar.=
gz"
> -SRC_URI[md5sum] =3D "1b71ed7a67ad8c048d1499540bc892ba"
> -SRC_URI[sha256sum] =3D "e2dc354043bb16f1f3df8c4bb26070b26e594819f218cf8b=
8ac19e79c720916f"
> +SRC_URI =3D "https://github.com/moto-timo/${SRCNAME}/archive/${PV}.tar.g=
z"

Don't use github archives, they are regenerated from time to time with=20
different checksums and they have stupid filenames (prone to collision=20
with other recipes).

> +SRC_URI[md5sum] =3D "e32475d6ff5843f738cedacd3b7a2cdb"
> +SRC_URI[sha256sum] =3D "58c62292eea6d06959eba1b97598650813211265403242d5=
7efb2f605c96059f"
> =20
>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> =20
> -inherit cpan_build
> +inherit cpan
> =20
>  RDEPENDS_${PN} =3D " perl-module-base \
>  		   perl-module-deprecate \
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

--xkXJwpr35CY/Lc3I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXV7B8ACgkQN1Ujt2V2gBzwHQCgoNTw2Kizs7zCv3sU/GPg3/Yx
wisAn1ry2s0LOP0yhmXFdX2pJKbRC0l5
=zZtL
-----END PGP SIGNATURE-----

--xkXJwpr35CY/Lc3I--
