Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0CFE379B65
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 22:13:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g15-v6so31382625wru.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 15:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zLAvHNgfk9ENi0CfDpTEsk6YeqF9eCqqlCZvHcX+VPI=;
	b=sqYhfpl3eOAG0jWl9Wx1ypeB8JTH13Qns8bmE6mc0zyAePKmrXmvwFtwUsdhhl14Fu
	oyEq+BuhBbKELX7ila6vKkg0Qf0+1EoZKM5pY6tGp1G1I3Xr+2/FFFY8GaCo6siZLZc+
	8wZTYv4E36ex24MTY/QTIMiA6YV97mvGSXAKQ5DgeNAQG9YXPtng60VI5rfKZOBadGAG
	60tXspVJxfJiP50SYnFb4ZbSREoNpFnh2/A5qgTnbOomRfndw+5axqB7t21Q0DLN9uOG
	5bR+zkCuArPhmC8yBHxD/iX9LN4aI5JoNb3yhXGPsAVYp40MXrtfo40CX/FcVlxwD3kl
	FQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zLAvHNgfk9ENi0CfDpTEsk6YeqF9eCqqlCZvHcX+VPI=;
	b=mE8ozXD7MK43doarsA737YMEstaWW4H1nE0EPOaWOeyOBcyd7sF9qEO5PvG7cNUFT/
	mvXegc0L4X5H/CxslY2d7yKnH1z3MD4WKCih4ZEPSJ5ss6gSYhX59hvVMaOyJmLXZzRs
	Rkxn+h6xFYxiWsq2qvRrevxc91ECXYclgZ4+yXTIFacYFrOmojZh/hGAoTO3f+gPL0zi
	DnI/msaM2Mmes9Sy7fVc04wGVa+qgjjnHN+34M0oS3yCj1NuWQslMQinWGVl04/sV0JR
	YxiWRX+FtgVzbU5wv6O7NkgDRZ44oxZi9PxLbSd7t6I5rdxd9Gr9AVmu54wCLf2M634v
	MDjQ==
X-Gm-Message-State: ABuFfogXC6Fy0eoD63I2ulRXsjkRsnQO5r+wdVUMw7Xw5MUFMHIj5bQI
	Y/jwUdcfrsFpmD4BkG2cEBc=
X-Google-Smtp-Source: ACcGV60MBx6lJZmzqtZqmdHU3zaX3ovkpXufvWIv05R04e5XcT3wFnJFCv3P2VXfzMpkYkpdmzAPiQ==
X-Received: by 2002:adf:fd4a:: with SMTP id
	h10-v6mr26539033wrs.280.1539814438471; 
	Wed, 17 Oct 2018 15:13:58 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u76-v6sm5086420wmd.10.2018.10.17.15.13.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Oct 2018 15:13:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Oct 2018 00:13:56 +0200
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20181017221356.GB1375@jama>
References: <20181017205647.25447-1-yann@blade-group.com>
	<58e27c81a75d4ffdb436ec577bbb7f9b@XBOX02.axis.com>
	<CA+chaQeqKrGu3=5HYA+qm8a2iV86vDQdhMELEYkhBKfM6yWYZA@mail.gmail.com>
	<71b4fe32a2dd4895938ba547944576df@XBOX02.axis.com>
MIME-Version: 1.0
In-Reply-To: <71b4fe32a2dd4895938ba547944576df@XBOX02.axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "yann@blade-group.com" <yann@blade-group.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v3] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 22:13:58 -0000
X-Groupsio-MsgNum: 75067
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline

--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2018 at 10:03:53PM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> > devel-bounces@lists.openembedded.org> On Behalf Of Martin Jansa
> > Sent: den 17 oktober 2018 23:34
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: yann@blade-group.com; openembedded-devel <openembedded-
> > devel@lists.openembedded.org>
> > Subject: Re: [oe] [PATCH v3] packagegroup-tools-bluetooth: work as
> > advertized on distro without bluez* support
> >=20
> > I wouldn't say that supporting bluez6 as BLUEZ value before
> > RDEPENDS_bluez6 is defined here is really better.
>=20
> Well, my point was that rewriting it according to my suggestion=20
> makes it agnostic to whatever value the ${BLUEZ} variable has.

And my point is that it doesn't make it better, because it will do
something useful only with RDEPENDS_bluez4 or RDEPENDS_bluez5, adding
dependency on undefined ${RDEPENDS_whatever} doesn't really help, does
it?

> > Whole bluez4 support here is a bit useless considering that all bluez4
> > related recipes were removed more than a year ago with:
> >=20
> > commit 007498ac72e26e9f7064de74f7fe96e91ae6c969
> > Author: Martin Jansa <Martin.Jansa@gmail.com>
> > Date:   Mon Jul 24 19:25:35 2017 +0200
> >=20
> >     bluez4: remove bluez4-only recipes
> >=20
> >=20
> > On Wed, Oct 17, 2018 at 11:20 PM Peter Kjellerstedt <
> > peter.kjellerstedt@axis.com> wrote:
> >=20
> > > > -----Original Message-----
> > > > From: openembedded-devel-bounces@lists.openembedded.org <
> > > openembedded-devel-bounces@lists.openembedded.org> On Behalf Of
> > > yann.dirson@blade-group.com
> > > > Sent: den 17 oktober 2018 22:57
> > > > To: openembedded-devel@lists.openembedded.org
> > > > Cc: Yann Dirson <yann@blade-group.com>
> > > > Subject: [oe] [PATCH v3] packagegroup-tools-bluetooth: work as
> > > advertized on distro without bluez* support
> > > >
> > > > From: Yann Dirson <yann@blade-group.com>
> > > >
> > > > Otherwise the build fails with:
> > > >
> > > >   NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
> > > >   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
> > > >
> > > > This restores some truth in the "Otherwise install nothing" comment
> > in
> > > > the recipe.
> > > >
> > > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > > ---
> > > >  .../packagegroups/packagegroup-tools-bluetooth.bb            | 5
> > ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-oe/recipes-connectivity/packagegroups/
> > > packagegroup-tools-bluetooth.bb
> > > b/meta-oe/recipes-connectivity/packagegroups/
> > > packagegroup-tools-bluetooth.bb
> > > > index 0ede5e57b..207c7c1ae 100644
> > > > --- a/meta-oe/recipes-connectivity/packagegroups/
> > > packagegroup-tools-bluetooth.bb
> > > > +++ b/meta-oe/recipes-connectivity/packagegroups/
> > > packagegroup-tools-bluetooth.bb
> > > > @@ -34,4 +34,7 @@ RDEPENDS_bluez5 =3D " \
> > > >
> > > >  # Install bluez4 tools or bluez5 tools depending on what is
> > specified
> > > in the distro.
> > > >  # Otherwise install nothing.
> > > > -RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
> > > > +RDEPENDS_${PN} =3D " \
> > > > +    ${@'${RDEPENDS_bluez5}' if d.getVar('BLUEZ', True) =3D=3D 'blu=
ez5'
> > else
> > > ''} \
> > > > +    ${@'${RDEPENDS_bluez4}' if d.getVar('BLUEZ', True) =3D=3D 'blu=
ez4'
> > else
> > > ''} \
> > > > +"
> > >
> > > You can simplify this (and support any value of ${BLUEZ} just in
> > > case someone decides to add bluez6):
> > >
> > > RDEPENDS_${PN} =3D "${@'${RDEPENDS_${BLUEZ}}' if d.getVar('BLUEZ') el=
se ''}"
> > >
> > > Also, the second argument to d.getVar() has defaulted to True for
> > > a long time, so no point in specifying it.
> > >
> > > > --
> > > > 2.19.1
> > >
> > > //Peter
>=20
> //Peter
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW8e0JAAKCRA3VSO3ZXaA
HBt1AJ4+3h6K5VyBPUkv0C2olfsRlT7OBQCfREgUg53wtyhUeTWWqmTBFdiwnEk=
=0wCb
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
