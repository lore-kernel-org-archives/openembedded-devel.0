Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D866370022
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 17:04:06 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i138so8455626wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nKGAra52/DYjjMxrMBfOIhPgsQHs6ITWoy+cdMi+yPE=;
	b=S+sSzMWqklsUCTnpTxxSeFTSCuRuG3CF7g+0tS/VYg39um2zdLatHFwd7dnSfXoLtW
	TRmyrDf2JrxiAE/W4DNPKzlEnrUNbF2NXf7BFDRavmoCm+VuvX97knH88EyYtDXZQRrm
	5oAkwGBMprJ6/Xwf+GXRtHKnde1E/VncivMaAnWRXua3plrL0fEphsF5q8SiIBOBeNhW
	FXvqZMf6x/rTzI+crNJtZ0fRPM/Y2SFnaEQASm8T8b2hizg+hBRsBPkJT7tJ4HeJaort
	wBNnLeFIwydV3UDRwdrdU6Cof5BWSuZWcoGmfqrxJygIBGsXKo3JaG1b3bIqFQGflOKo
	6EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nKGAra52/DYjjMxrMBfOIhPgsQHs6ITWoy+cdMi+yPE=;
	b=KigYqwDZnp5B9fL24Up/+H6h689vI2DdxBfpS/NEPpA5k1y5X59nUbvPLg85jsg8Ra
	LS1nNyG/ukQ8SheTDC08ynf3i3CPKO4aviB4hU92uDePqYjatgIHzuiK/li3vm6bR+GU
	ICUdlseiA3X8TUARNVCR++kBwbcHvT/b8GZ/FOOm7mKETF3dOnVwO4tM+cO0GSwfr9cJ
	ZYe+7X5Q3bBhMCVatxl0k80cV+ugYnBIPW1rzY2heF92VInirM3TnNTQw1zkJ2XsVezU
	dTlyaYDL3cSOcHvecupFB6oaaTE8XZ2yaz4bFhGK7l9Gsg5/akUF6Bd7gU1Vs9Z/GL2Q
	KKpw==
X-Gm-Message-State: AE9vXwOvg5XzOERKyNc7UT7UL8AVIgYIMn5FrZpdTIiBxqCbyZ2DPAaU6HLZlxg13NQSXA==
X-Received: by 10.194.139.236 with SMTP id rb12mr9893426wjb.101.1472663046600; 
	Wed, 31 Aug 2016 10:04:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	207sm24553495wmb.7.2016.08.31.10.04.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Aug 2016 10:04:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 31 Aug 2016 19:04:06 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160831170406.awhqhpy5rcf5ixqi@jama>
References: <1472062075-18352-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1472062075-18352-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH] qwt: Use ${libdir} to install libraries.
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
X-List-Received-Date: Wed, 31 Aug 2016 17:04:09 -0000
X-Groupsio-MsgNum: 62912
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rbysikttrpetriib"
Content-Disposition: inline

--rbysikttrpetriib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2016 at 02:07:55PM -0400, Philip Balister wrote:
> This lets qwt build and package for systems that use lib64.

Which branch you want to apply this?

It was removed 7 months ago!

commit 2bd11da4b50f401c9c49975aeedaaafa6a59d08b
Author:     Martin Jansa <Martin.Jansa@gmail.com>
AuthorDate: Thu Jan 7 15:57:45 2016 +0100
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Thu Jan 14 11:30:15 2016 +0100

    recipes: remove recipes using or depending on qt4 bbclasses or recipes


>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-oe/recipes-qt/qwt/qwt.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.=
inc
> index d3c4ed1..e1b260c 100644
> --- a/meta-oe/recipes-qt/qwt/qwt.inc
> +++ b/meta-oe/recipes-qt/qwt/qwt.inc
> @@ -16,6 +16,7 @@ do_configure_prepend() {
>      sed -i -e 's:qtAddLibrary(qwt:qtAddLibrary(qwt)${QT_LIBINFIX}:g' *.p=
rf
>      sed -e 's/# QWT_CONFIG     +=3D QwtExamples/QWT_CONFIG     +=3D QwtE=
xamples/g' -i qwtconfig.pri
>      sed -i -e 's:/usr/local/qwt-$$QWT_VERSION:${D}${prefix}:g' ${S}/*.pri
> +    sed -i -e 's:$${QWT_INSTALL_PREFIX}/lib:${D}${libdir}:g' ${S}/*.pri
>  }
> =20
>  do_install() {
> --=20
> 2.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rbysikttrpetriib
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfHDgUACgkQN1Ujt2V2gBw8sgCfcjWlHO8tQcVx84x1UQIiQeF6
85wAnA+otFycVzY4l0JahofV5T/nng/7
=zW7R
-----END PGP SIGNATURE-----

--rbysikttrpetriib--
