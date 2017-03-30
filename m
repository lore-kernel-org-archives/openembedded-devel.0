Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id D9B4B77BDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:39:53 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u18so10398861wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/COVkMaRWxtfMQ5B4U/D0OpwNKRK5uOtJEUDVL494kE=;
	b=i6K5ZET75jnzB0a0gi+vv+Deojfc+lCWzYZb0pamduIME5XH0JawdUFcVkv4J7VOJZ
	dL3qY444OD8L04spHhy0G/CO+nxhWCGGPwIAaROt3fDJNtywgZpN8/SckXIc/HVt+9BJ
	60g6GIkS6bwUkUm+toXt5Eu7JJqw1p90Uq8uTunGwrMNhRshU4VS0/0JPhi023tq1x8e
	Ht13bDmgN2H6g18YLoYyuBX/8klhBM5dtCUygGCgssh39rC/c0XF3UwsYQR+0z+GNVxj
	eRD3bD3GNHsrcY2/7kx73EaWa14Y7IQxFFelWS94FUiDxecexQUHJcteE3SBFF3BIp2b
	D5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/COVkMaRWxtfMQ5B4U/D0OpwNKRK5uOtJEUDVL494kE=;
	b=a4btJ9JzGwTXiICbNawgE9MvLEsHPxA1Rj/sSPhAikDZZJwtmq1764chxLR0U9nmGp
	6S0tSEteJhh1OgVBiNtF6BNofa+W4+Hw6+9dSJkt2B+sxic4bOrsE3vW2YfI4WIcnDpR
	7RJxEacBcL0FHj/c27wx+ivfFqJG1ANCaq+aPALrE7WOVofH/d7oEUhzQfNVYfZc9y8M
	vhzG9BjZ7ynk13iTzCidkbAII8ajOT1ikWe/VQIIGm0D49NYQmL8h6ExAEZRBdZNXfSF
	Tqg2aFaDKVjYzrIRczVLHANeBhedtZz9oDwK+Btt0/KGmv1UM6D0Iu7ZHEUv/oGZXKTd
	MKAw==
X-Gm-Message-State: AFeK/H35YH4RyRyA1ylFPkEtVYefxnXz8PKnCDlhAmSIbepcT8tGwAWVDS0p9E7xaUbdeg==
X-Received: by 10.223.139.196 with SMTP id w4mr4947280wra.172.1490866794751;
	Thu, 30 Mar 2017 02:39:54 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z40sm2039513wrz.67.2017.03.30.02.39.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 Mar 2017 02:39:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Mar 2017 11:39:53 +0200
To: Ismo Puustinen <ismo.puustinen@intel.com>
Message-ID: <20170330093953.GA3060@jama>
References: <20170323104816.22461-1-ismo.puustinen@intel.com>
MIME-Version: 1.0
In-Reply-To: <20170323104816.22461-1-ismo.puustinen@intel.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] opencv: do not depend on swig.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Mar 2017 09:39:54 -0000
X-Groupsio-MsgNum: 65979
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2017 at 12:48:16PM +0200, Ismo Puustinen wrote:
> Since swig is a code generator, just depend on swig-native.

Seems to cause following failure:
http://errors.yoctoproject.org/Errors/Details/138491/

>=20
> Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb b/meta-oe/recip=
es-support/opencv/opencv_3.2.bb
> index f47347a..cf77fe8 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b2f8752cc5edf=
504d283107d033f544"
>  ARM_INSTRUCTION_SET_armv4 =3D "arm"
>  ARM_INSTRUCTION_SET_armv5 =3D "arm"
> =20
> -DEPENDS =3D "libtool swig swig-native python bzip2 zlib glib-2.0 libwebp"
> +DEPENDS =3D "libtool swig-native python bzip2 zlib glib-2.0 libwebp"
> =20
>  SRCREV_opencv =3D "70bbf17b133496bd7d54d034b0f94bd869e0e810"
>  SRCREV_contrib =3D "86342522b0eb2b16fa851c020cc4e0fef4e010b7"
> --=20
> 2.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWNzSaAAKCRA3VSO3ZXaA
HGSvAKCt3VT1VcGsdM1SAnEo3Ckboaxf8wCeOku9m0UjL2QtkkhG188G5+ULsiI=
=bUqr
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
