Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 441A26A362
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 08:14:51 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hi2so8552330wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 01:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jRXtcxZrx2KG0a5muQ0KHz4iJ4N0t2JrVUgVltKkt24=;
	b=HZjxYNH+O6yr10IBpyscbkonqO1FEjkAHwZDHdtbgoR2YAewtdfxPqmh5i79hqwHI8
	Kqw8/Wfpi0YxxIUTkalBiDBn/EFBHVnHIrVgaAHrf8gZwC8G5e1acgtc8brQZFEd3Vcz
	fnRYi5tLCeZTLhJKsfmu0WLsw+PJQqBP8o7t3mluLV11hrCTSLcqdymQna5uc8YmqnSS
	2zbf7xqhUun45cbPzUCKvsYr8ipiHmGmgIgrGhifYTwAVHGOp+TbxM1CAq8Wjt6xyTUw
	6sB7PiXTlVNm4TuwQl910cOGf6cKhYWi1zdXnjGW5KeiG9RjnhWPH5WY/VxVzr+iHxoI
	EjSA==
X-Received: by 10.194.191.135 with SMTP id gy7mr19068249wjc.39.1413188092268; 
	Mon, 13 Oct 2014 01:14:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lf1sm15748918wjb.24.2014.10.13.01.14.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Oct 2014 01:14:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Oct 2014 10:16:38 +0200
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20141013081638.GF3000@jama>
References: <CANR6C54p6yC1FPviBpmX-qHiF198s3vK7UWEmmDj3hYs7mAovQ@mail.gmail.com>
	<CANR6C57416FmV0MHSKmKLvD=Xdf=Lds5OnrHu_6nCW8z3qB_jg@mail.gmail.com>
	<20141013071037.GA5099@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20141013071037.GA5099@ad.chargestorm.se>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5] What is needed to build a recipe with CMake?
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
X-List-Received-Date: Mon, 13 Oct 2014 08:14:54 -0000
X-Groupsio-MsgNum: 52475
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IbA9xpzOQlG26JSn"
Content-Disposition: inline

--IbA9xpzOQlG26JSn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2014 at 09:10:37AM +0200, Anders Darander wrote:
> Hi,
>=20
> * Nick D'Ademo <nickdademo@gmail.com> [141013 01:50]:
> > Has anyone had any success at all building a Qt5-based recipe with CMak=
e?
>=20
> Yes, I've at least got a local recipe here building KDSoap, which uses
> cmake.

See meta-webos-ports layer for more recipes using cmake + qt5.

>=20
>=20
>=20
> > On Wed, Oct 8, 2014 at 1:41 PM, Nick D'Ademo <nickdademo@gmail.com> wro=
te:
>=20
> > > Looks like the *qmake* binary cannot be found.
>=20
> > > The relevant parts of the recipe are as follows:
>=20
>=20
> > > *DEPENDS =3D "qtbase"*
>=20
> Just as you, I've got hte DEPENDS li=C5=84e above in my recipe. However, =
I've
> also the following line (situated after the DEPENDS +=3D...)
>=20
> inherit qmake5
>=20
> That line should set up all the necessary path's in order to find qmake.
>=20
> Let us know if this helps you.
>=20
> Cheers,
> Anders
>=20
> --=20
> Abstainer, n.:
> 	A weak person who yields to the temptation of denying himself a
> 	pleasure.
> 		-- Ambrose Bierce, "The Devil's Dictionary"
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IbA9xpzOQlG26JSn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ7imYACgkQN1Ujt2V2gBxqGwCghz/TQLCHjOMw6mCNhvvSVygH
RtkAoIQSjYoGJub1pyG+1yTuE1GXUhLG
=65Bf
-----END PGP SIGNATURE-----

--IbA9xpzOQlG26JSn--
