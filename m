Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2B44162134
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2016 10:31:04 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id kp2so29657038wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 02:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dZLgXgtLGicA+sthx7e6zdgcGBM2Nbo4j2xISCoUcq0=;
	b=oxtiDEEN3+3Q5UQ4lUEpeWBNNLYSG3sfJXvSfZYP0f0Kn0NUzk2APdp58QlrfxqGdk
	d42PCxHOKmdQukTxJjunk45LuUAFYZaQB/LOYfG5vWNtaxFlvcsHUXIjZQ2DGvzkp6lk
	lJ9Ka/H0TXGLxspZpgatCnmiMml+XUhPP7kNtrOW995RDZMm3BAtmFMgBU/5GcimTpKR
	IAohmA60EtEshk3hgSDvMmHIyYPL6YHcjcUNqvAR/COadqX/PluQFZh3gmlKdHsXjOop
	J6TFkzBKjNobW20sRob16WaNFzDKuFnLM4xhApOi4c6OIjp/2XNv59Dat/HhlaK8x49V
	dnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dZLgXgtLGicA+sthx7e6zdgcGBM2Nbo4j2xISCoUcq0=;
	b=FQ1sJJJEZLyE8jIPcGgnuXJfGkcm8nLU3NzmQarZtMKzh9JNmDGkqAcFcu5WHPb1+p
	FodCZcxQUbFB4MTEC3PIuf1alK6LPk4JW/lgvnJe4QqjkCxdvpVklPDYujgbd4rVWdZc
	oi2pIkqlBfb97w/fy7gJfSE0E5hffr4/CSNxJM40pn56I7e/7QVMYAlSoAN7Kztc3Mo7
	hsLebObvQMZkPk1uaUYTkBF0DZY8wO/4MnxeYICZEJu90LhgaQbnjiSD2R/Mt/nh6YC7
	AidDQ4pSZeeWVZBIeaJ1aUlRxQwOi9cEXU0j39tOkshWmDvassBXiqwgojAi8Wh+SlTm
	icxA==
X-Gm-Message-State: AKaTC01TkHEjEMC+vpBrHZ5M9snM8nvb4hjQWQwIyGPTg5VH7xT20iT+K+eC5uMJFZEG1A==
X-Received: by 10.194.157.41 with SMTP id wj9mr36362208wjb.160.1480674665903; 
	Fri, 02 Dec 2016 02:31:05 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id r7sm4798359wjp.43.2016.12.02.02.31.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Dec 2016 02:31:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 2 Dec 2016 11:31:05 +0100
To: Gordan =?utf-8?Q?Marku=C5=A1?= <gordan.markus@pelagicore.com>
Message-ID: <20161202103105.GE3721@jama>
References: <20161202092012.12438-1-gordan.markus@pelagicore.com>
	<20161202095419.GD3721@jama>
	<1480674073.22967.3.camel@pelagicore.com>
MIME-Version: 1.0
In-Reply-To: <1480674073.22967.3.camel@pelagicore.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] gdb: Fix QA Warning
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
X-List-Received-Date: Fri, 02 Dec 2016 10:31:05 -0000
X-Groupsio-MsgNum: 64207
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7LkOrbQMr4cezO2T"
Content-Disposition: inline

--7LkOrbQMr4cezO2T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2016 at 11:21:13AM +0100, Gordan Marku=C5=A1 wrote:
> On Fri, 2016-12-02 at 10:54 +0100, Martin Jansa wrote:
> > On Fri, Dec 02, 2016 at 10:20:11AM +0100, Gordan Marku=C5=A1 wrote:
> > > WARNING: QA Issue: gdb: invalid PACKAGECONFIG: readline [invalid-
> > > packageconfig]
> > >=20
> > > Signed-off-by: Gordan Marku=C5=A1 <gordan.markus@pelagicore.com>
> > > ---
> > > =C2=A0recipes-devtools/gdb/gdb_%.bbappend | 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/recipes-devtools/gdb/gdb_%.bbappend b/recipes-
> > > devtools/gdb/gdb_%.bbappend
> > > index 3e663e7..41592c4 100644
> > > --- a/recipes-devtools/gdb/gdb_%.bbappend
> > > +++ b/recipes-devtools/gdb/gdb_%.bbappend
> > > @@ -1 +1 @@
> > > -PACKAGECONFIG ??=3D "readline python"
> > > +PACKAGECONFIG ??=3D "python"
> >=20
> > What gdb are you using? The version in oe-core has readline
> > PACKAGECONFIG
> >=20
> > meta/recipes-devtools/gdb/gdb-common.inc:PACKAGECONFIG ??=3D "readline"
> > meta/recipes-devtools/gdb/gdb-common.inc:# Use --without-system-
> > readline to compile with readline 5.
> > meta/recipes-devtools/gdb/gdb-common.inc:PACKAGECONFIG[readline] =3D "-
> > -with-system-readline,--without-system-readline,readline"
> >=20
> We are using the gdb from poky and it's a similar case there. Though,=20
> the gdb itself doesn't have the readline PACKAGECONFIG. It is enabled
> by default in the *.inc files.=20

No, it isn't, read:
https://patchwork.openembedded.org/patch/116843/
discussion.

> gdb-cross-canadian.inc:PACKAGECONFIG ??=3D "python readline"
> gdb-cross-canadian.inc:PACKAGECONFIG[readline] =3D "--with-system-
> readline,--without-system-readline,nativesdk-readline"
> gdb-common.inc:PACKAGECONFIG ??=3D "readline"
> gdb-common.inc:PACKAGECONFIG[readline] =3D "--with-system-readline,
> --without-system-readline,readline"
> gdb-cross.inc:PACKAGECONFIG ??=3D "python readline"
> gdb-cross.inc:PACKAGECONFIG[readline] =3D "--with-system-readline,
> --without-system-readline,readline-native"
>=20
> > > --=C2=A0
> > > 2.9.3
> > >=20
> > > --=C2=A0
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> >=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7LkOrbQMr4cezO2T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWEFNaAAKCRA3VSO3ZXaA
HEr2AKC5PsJPlWa/8crjEBVV8UOU3IIXLgCfb8pvtt58B8nsDOKrVsKThwhE7+4=
=qfKP
-----END PGP SIGNATURE-----

--7LkOrbQMr4cezO2T--
