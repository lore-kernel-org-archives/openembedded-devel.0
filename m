Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id AFA6F616C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:24:38 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p18so12521431wre.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4TipYaRxB6Cj8gcoXRh/u260jWmgc3URPfvn0GqFLRI=;
	b=iLUbrXakCnOH5uNBEiJEUQ8pPGNNvBgFf91Rg+kcbphCka/2BdF+dbN0BWa+e9E5/b
	sh2LxZLdr4I5fgVnchqf3RuwR36jBdiDJbnATSl3Mt+u5ePi01C8TK70KXmJLc0KwI7c
	lvJaY9t5hLCz9LbwBS3vg/IVMwA/I7TQUtmXgeDD9XnEQT9S9X1JIc/MUsyF0rlS3bxk
	ogQQAaHalH/Tui0u5Rrck60N6VESjsgb5VYOpxiPj5xaTzViwAeE6mBm9NueRGZufcCO
	1xqweP4eJesMq1CJHitwAKOo7WHk60+AVDu5YqHuvXa1thYWCY7fiHXwpef7VUOLe842
	yKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4TipYaRxB6Cj8gcoXRh/u260jWmgc3URPfvn0GqFLRI=;
	b=I6wCFn7skc1TXqtbsFlOGwDBvwvbmddnvEYELCb+W6eImOhOgwwm4vRP3pvfTkznY5
	AFER5xMB0jix3ScOXl69i+vieoUrpMDwNx3OmgyViBaZQvUFp58cjfoto3aBPOyCUGKi
	fOv6x/0jVBilfCTeH7LWkT+ztMyNa+G+lLu+UM8zE3H9mw3q6/UsxES9o6Pb3tqfB/hJ
	D+08T1kEJws9O6SYGFxdVpWHN33+KfbbrvLNL5thiXk/zwAZzULA5TLJ3yTi7zqRfZhD
	TumpGAtqpSW9jkJeXJBGqZT8b4heL65HGYDbfaOKZUv7DEkOtblip4i3kC87Dg5JAHQb
	AxSA==
X-Gm-Message-State: APjAAAW/I7cD0sjvfH/UvcUxRGYIchLAG1yiqurApCLfnrvRgrrTbJQ/
	MDxh/Kh9xDgg3BdzebpJFNA=
X-Google-Smtp-Source: APXvYqwcdBBnDBjgqZ0FIVrPzS0CVF6Knf/EjXOIBwHzARS8C+Owp+xu1q2SEn9g9Fc+QmunckH8hA==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr686530wru.57.1582658679379;
	Tue, 25 Feb 2020 11:24:39 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	j16sm3461226wru.68.2020.02.25.11.24.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 11:24:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Feb 2020 20:24:37 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200225192437.dmcrr4pnxbn3xugx@jama>
References: <20200225190710.3928-1-Martin.Jansa@gmail.com>
	<CAMKF1spuk9oPW-9e6OVW0=O-MUWHM_0tOc35ZT4P5_qneXo8Aw@mail.gmail.com>
	<20200225192202.fjc5mxecs6c6oruj@jama>
MIME-Version: 1.0
In-Reply-To: <20200225192202.fjc5mxecs6c6oruj@jama>
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
X-List-Received-Date: Tue, 25 Feb 2020 19:24:39 -0000
X-Groupsio-MsgNum: 83035
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r2x4ijkxbfdmd2vy"
Content-Disposition: inline

--r2x4ijkxbfdmd2vy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 08:22:02PM +0100, Martin Jansa wrote:
> On Tue, Feb 25, 2020 at 11:13:42AM -0800, Khem Raj wrote:
> > On Tue, Feb 25, 2020 at 11:07 AM Martin Jansa <martin.jansa@gmail.com> =
wrote:
> > >
> > > * c-ares is in meta-networking and meta-oe doesn't depend on meta-net=
working
> > > * fixes:
> > >   ERROR: Nothing PROVIDES 'c-ares' (but meta-oe/recipes-devtools/node=
js/nodejs_12.14.1.bb DEPENDS on or otherwise requires it)
> > >   in builds without meta-networking
> > >
> >=20
> > this patch makes me thing if c-ares is better suites for meta-networking
>=20
> ?
>=20
> This patch exists, because c-ares _is_ in meta-networking, while nodejs
> which depends on it is in meta-oe.

It got enabled in default PACKAGECONFIG in:

commit 76dd3dac1f1e67a5c44ad732b8e827cc36ded641
Author: Andr=E9 Draszik <git@andred.net>
Date:   Tue Oct 29 16:42:24 2019 +0000

    nodejs: allow use of system c-ares (and make default)
   =20
    Use system c-ares via PACKAGECONFIG by default. So far,
    nodejs had been built using its embedded copy of c-ares,
    which we generally try to avoid, for the known reasons
    (independent updates, cve & license checks, etc).
   =20
    Notes:
    * otherwise nodejs uses its bundled version of c-ares
    * the PACKAGECONFIG variable is 'ares' so as to be in
      line with other uses of this (wget & curl recipes in
      OE core)
   =20
    Signed-off-by: Andr=E9 Draszik <git@andred.net>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>

So unless you actually meant to move c-ares from meta-networking to
meta-oe..

> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta=
-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> > > index 6eb52c209a..9f91a3f4dd 100644
> > > --- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> > > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> > > @@ -51,7 +51,7 @@ ARCHFLAGS_arm =3D "${@bb.utils.contains('TUNE_FEATU=
RES', 'callconvention-hard', '-
> > >  GYP_DEFINES_append_mipsel =3D " mips_arch_variant=3D'r1' "
> > >  ARCHFLAGS ?=3D ""
> > >
> > > -PACKAGECONFIG ??=3D "ares icu libuv zlib"
> > > +PACKAGECONFIG ??=3D "icu libuv zlib"
> > >  PACKAGECONFIG[ares] =3D "--shared-cares,,c-ares"
> > >  PACKAGECONFIG[gyp] =3D ",,gyp-py2-native"
> > >  PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu"
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel



--r2x4ijkxbfdmd2vy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXlV0dAAKCRA3VSO3ZXaA
HGa1AJ9PRrcV4xR91FTOnHzFHs506yHVzgCfU+OZ3Hryu7Ln/m3ZFoV+kF4mx/A=
=e6cW
-----END PGP SIGNATURE-----

--r2x4ijkxbfdmd2vy--
