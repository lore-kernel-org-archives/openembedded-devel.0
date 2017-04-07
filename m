Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id CDC9977E3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 17:42:48 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u18so13191408wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Apr 2017 10:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HRzF8dMPGgE5778IY6InNn8UM5rPMOaazZ/khOa/DdI=;
	b=dyjTFH29l9JPXgXuKGtEKl+GG6J7JngYed3JXvPjjeywMKNehRFKvz7m9mfc4UddX8
	2vgkJRp9WM8rRPozaJjCLOTWMkIBKDXupetNzE8RkXOKXVXlf3NHUv5LFR1bxu5fdBpa
	1RxKeT2N8JbslGEcIrZC+zqA85g0LOImqhmABRlU9ygjZN6Q7OR2Qn6Csh9S56W2Ep3m
	s3r25Y6V6ByLj9dQm4rvvyoFBUgu1F8q9a9UDqbpAqb/NF3TJG5GpJrpzUuv8WoUckCu
	2mN3C0r+hF0zVkTOD34kpSVf9paeKXABTy35A6VRWNyQufeqgkRHA9szBF+M3yenv5uT
	4SlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HRzF8dMPGgE5778IY6InNn8UM5rPMOaazZ/khOa/DdI=;
	b=C3EFEPnU1Y27R2Yxt3l1v8dFfcMuX+xg5b1HDeNdzz6SIYyjR5c2E3M452Jfdcxlck
	JglA1Bupmb8KsUE0WlHcDAhNc8/FtouljGPFIdrhoRxv5leqHR6rYLg9ax61XFqzxmpn
	zeFgLtP3C1DxNBmWlZrjEvM3PL8P7UFa5RpN6WAztvDjplZM4g55ddjwDqlYu6ojj0Xi
	CcBaSqA54y4amRdM7vFqlBFt/YuzEWlnDVkIzOYLSs+5TITDyJB9bqg6GCZWlOSdw9xb
	0OK5MuRxLzCwItodrPY2St2pdYBK3isLYBuVCee5s72bIRsIDucvmAa68IVWHAmF58Q5
	cdqQ==
X-Gm-Message-State: AFeK/H0du7qkFC1x7fRJOe6WrXJqNGckXhu8Uv3T4L1a5fDGqa9l5GMgYzVMemN0X6W8AA==
X-Received: by 10.223.130.197 with SMTP id 63mr13889630wrc.177.1491586969698; 
	Fri, 07 Apr 2017 10:42:49 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 75sm3850849wmp.2.2017.04.07.10.42.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 07 Apr 2017 10:42:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 7 Apr 2017 19:42:49 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170407174249.GC3022@jama>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-13-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170331164247.5052-13-raj.khem@gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 13/43] poco: Upgrade to 1.7.8
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
X-List-Received-Date: Fri, 07 Apr 2017 17:42:49 -0000
X-Groupsio-MsgNum: 66168
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline

--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2017 at 09:42:17AM -0700, Khem Raj wrote:
> Fixes build with musl

WARNING: poco-1.7.8-r0 do_package: poco-1.7.8 was registered as shlib
provider for libCppUnit.so.1, changing it to poco-cppunit-1.7.8 because
it was built later

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/poco/{poco_1.7.7.bb =3D> poco_1.7.8.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/poco/{poco_1.7.7.bb =3D> poco_1.7.8.bb} (=
97%)
>=20
> diff --git a/meta-oe/recipes-support/poco/poco_1.7.7.bb b/meta-oe/recipes=
-support/poco/poco_1.7.8.bb
> similarity index 97%
> rename from meta-oe/recipes-support/poco/poco_1.7.7.bb
> rename to meta-oe/recipes-support/poco/poco_1.7.8.bb
> index e2d3be885..0fd6a8b1c 100644
> --- a/meta-oe/recipes-support/poco/poco_1.7.7.bb
> +++ b/meta-oe/recipes-support/poco/poco_1.7.8.bb
> @@ -12,9 +12,9 @@ inherit cmake ptest
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> -SRCREV =3D "e98adba2c298b4179e77237873d3fbc53876c528"
> +SRCREV =3D "aae9c2e0f64caf019d31ba8f97635d5656b25ba5"
>  SRC_URI =3D " \
> -    git://github.com/pocoproject/poco.git \
> +    git://github.com/pocoproject/poco.git;branch=3Dpoco-${PV} \
>      file://run-ptest \
>     "
> =20
> --=20
> 2.12.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOfPmAAKCRA3VSO3ZXaA
HK42AJwJkegEwD40I7Hp4pRWdgNysKtmwQCgmvv1WFA5cIT5Ov1ZDbDNL4uo3bc=
=V/Qq
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
