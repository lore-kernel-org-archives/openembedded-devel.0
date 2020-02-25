Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B51DC616C8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:22:03 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z3so14128wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mPOD/mFe5QFCF1e0fcMn/sR2LM4g5zTT3mSyAOo7RS0=;
	b=C8hLWiqZlCW/nXV0cPdDHK9dK+Ch7BLW28f7VrJp5U/X0VfQe7hYg6r5zAUw1eBZg0
	032PuvJghBgc/Q30VJyunsk12f3i8YXBZBbAPcvJOOzXAszWkQWtRB1et4gln0Xyl3rt
	fuHgbRYw0glvSDzQJEg3a+scUANfq9rYJYWYa7BYF+8mBK1fN7UVgXzILhTYa/elbc86
	Jor48RkUb8jt/jwePw5661wDmhfv2cYI9iWyUazB7RIMV8yp7Ej4x9VmMFA4Pmtlj9kf
	RcrcYqkMKpgK0NRUKLUsiKi14Mwqo6/fFQ2UarsdMI85MIMzJ2c8PHKlfAKNqNhP+Kaw
	ubWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mPOD/mFe5QFCF1e0fcMn/sR2LM4g5zTT3mSyAOo7RS0=;
	b=fKGN+sG4FP2pr4KY2b+3PzfPVRnUI0SmMomChkIobp93qvydaEHCscZPTLVwFI1i+t
	bzn+1lkjNxfvCpUB733zBHjfYEZFq3oPQqdnaKl6a4YQZ019sebZ/aKSZwi0P4F7hIVu
	f/yxepi5zwo1mIyWZp9ScIhhL4d+nhK2kP6aAtLdOuNQuym6hMuZUbHdYN9I2gTk6lIe
	mF35mV/vUjATkrkfB8cFxApUyzjcq/WgFQcGHykj3TCND3CL9pLmjeK/KwD2INlvwTQQ
	Tfz2xIkzRApbFsO8UGrPFe98MgwxywYYNBr/iJr4HKQjhcxW9wPEWOmMlOGTjJTa9KBB
	lnaQ==
X-Gm-Message-State: APjAAAXSvMwjOj0ppqLQFezq28HhvqK4kplJq3DjidNX9GUxLwmpb2pm
	ZUIH9gqK974uu1Vx4F6iMTM=
X-Google-Smtp-Source: APXvYqxaWHTdUNrmQJFAmzUtGhDSnHpgxBC3ZnaAisUN3+R9NHmhUywE1oecyexNn6/eRs6lWtnO0g==
X-Received: by 2002:adf:a411:: with SMTP id d17mr654152wra.126.1582658524381; 
	Tue, 25 Feb 2020 11:22:04 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	e16sm25371866wrs.73.2020.02.25.11.22.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 11:22:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Feb 2020 20:22:02 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200225192202.fjc5mxecs6c6oruj@jama>
References: <20200225190710.3928-1-Martin.Jansa@gmail.com>
	<CAMKF1spuk9oPW-9e6OVW0=O-MUWHM_0tOc35ZT4P5_qneXo8Aw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spuk9oPW-9e6OVW0=O-MUWHM_0tOc35ZT4P5_qneXo8Aw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] nodejs: don't enable ares support by default
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
X-List-Received-Date: Tue, 25 Feb 2020 19:22:04 -0000
X-Groupsio-MsgNum: 83033
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wrqq2y4kqueyqta7"
Content-Disposition: inline

--wrqq2y4kqueyqta7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 11:13:42AM -0800, Khem Raj wrote:
> On Tue, Feb 25, 2020 at 11:07 AM Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >
> > * c-ares is in meta-networking and meta-oe doesn't depend on meta-netwo=
rking
> > * fixes:
> >   ERROR: Nothing PROVIDES 'c-ares' (but meta-oe/recipes-devtools/nodejs=
/nodejs_12.14.1.bb DEPENDS on or otherwise requires it)
> >   in builds without meta-networking
> >
>=20
> this patch makes me thing if c-ares is better suites for meta-networking

?

This patch exists, because c-ares _is_ in meta-networking, while nodejs
which depends on it is in meta-oe.

>=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-o=
e/recipes-devtools/nodejs/nodejs_12.14.1.bb
> > index 6eb52c209a..9f91a3f4dd 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> > @@ -51,7 +51,7 @@ ARCHFLAGS_arm =3D "${@bb.utils.contains('TUNE_FEATURE=
S', 'callconvention-hard', '-
> >  GYP_DEFINES_append_mipsel =3D " mips_arch_variant=3D'r1' "
> >  ARCHFLAGS ?=3D ""
> >
> > -PACKAGECONFIG ??=3D "ares icu libuv zlib"
> > +PACKAGECONFIG ??=3D "icu libuv zlib"
> >  PACKAGECONFIG[ares] =3D "--shared-cares,,c-ares"
> >  PACKAGECONFIG[gyp] =3D ",,gyp-py2-native"
> >  PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--wrqq2y4kqueyqta7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXlVz2gAKCRA3VSO3ZXaA
HPCXAJ9yMEwh7nrH3ISld5gQrUJv5OuUUQCgggVWp4ESb2llm0UOrGLLuQYs3bk=
=PgMI
-----END PGP SIGNATURE-----

--wrqq2y4kqueyqta7--
