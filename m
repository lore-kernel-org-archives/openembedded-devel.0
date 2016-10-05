Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 03DF071A20
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Oct 2016 16:32:44 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b201so20215658wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Oct 2016 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qxL+16hL0G9siP6FRlJsjj8p7N5WrgQ15xj9u+0+7j4=;
	b=tezSiM5YIVLo/2IWTGHibuHR46DCWJ9/T/NJLak+tLe9pI7SgviAyqkQcZaAnVVprz
	R61rcJChe89BEy/NjzUsmfuDbqf4pZMr0hI8Z8ozkAcB2M3uksepBthIjQRwMx0yhHxU
	5UKDoc9Eva57aQFzE19DiNE4SCOsFbYfiTqNIpIPAHT6Ux26IgjEmzaxogcKmDfhBWWS
	eheyK6PDNfe148aGx/glvgeo+DSyWCEfr59MHfd/pAAbio0OEyEtY/YLcxsc8/Pko38F
	6euElNYA/pq1le+mpsOwnsbVHvZkK0B5EsthTyfWyud/dJpaCjQ0oSFIQr60a60qdOnz
	3A0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qxL+16hL0G9siP6FRlJsjj8p7N5WrgQ15xj9u+0+7j4=;
	b=UiGQqAtiSBEvaKgqp5eISQJeOx2GdfKvMXruEuLH1nxDCs26ajyh8z4+VzqW4tXzGI
	FXeCCHOAEfn3lKEGC8aLT700ZxBYdckwIlhtNzSM8cGvpIJrF7lP3lPIRWRYz1cz4ZqW
	0tuOqxoU6dFs9aNcyAljdjxoeSSY6Kl+aA5qpco51ZdomVFMgN7lznNSQSjRotg+a15T
	jf0X4GsziOJelLHHWhCpp7ZK//B2sGqkosNPQMRGXR0NsCZUAwIDczMF/JVfpZnUEW4K
	UlW8t4o2wG7Q2/ERjSBQZoSPDjyS+sYCt4k9yuZcC4RtgIxR9+FGx+MseRCuA19iSvew
	lnXQ==
X-Gm-Message-State: AA6/9RlRpVc254p/6jtoVIH1659oTmYORvnQuxjYpwZSWnJouBCcR1F+WoG0uuRXcxw3fw==
X-Received: by 10.194.80.74 with SMTP id p10mr514976wjx.121.1475685165686;
	Wed, 05 Oct 2016 09:32:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	f142sm10379971wmf.19.2016.10.05.09.32.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Oct 2016 09:32:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Oct 2016 18:32:47 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161005163247.GC2926@jama>
References: <1474634029-22896-1-git-send-email-mike.looijmans@topic.nl>
	<CAMKF1srhhYfYO69noEU30+66yDX8cLNbEB7tpJhkubKwjPoevw@mail.gmail.com>
	<57E69552.9040209@topic.nl>
	<CAMKF1so4gZ9zYqS17E-xRq0U-bu27aiv6v_EiR2zc3OqCgDSYg@mail.gmail.com>
	<CA+chaQcftFerFC0S9_+XwsZqZ6EAMtdfOjGj5yjoy2mut9wO0Q@mail.gmail.com>
	<1475660078-12664-1-git-send-email-mike.looijmans@topic.nl>
	<CAMKF1sqTt+xuBTo4JyBDMUaHoygpuVUgcjQWyGfM9DAobaioyQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqTt+xuBTo4JyBDMUaHoygpuVUgcjQWyGfM9DAobaioyQ@mail.gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-networking][PATCH v2] phytool: Add recipe
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
X-List-Received-Date: Wed, 05 Oct 2016 16:32:46 -0000
X-Groupsio-MsgNum: 63381
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline

--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2016 at 08:38:07AM -0700, Khem Raj wrote:
> On Wed, Oct 5, 2016 at 2:34 AM, Mike Looijmans <mike.looijmans@topic.nl> =
wrote:
> > A nice tool to directly read, write and interpret ethernet PHY data.
> > Very useful when debugging PHY or MDIO problems, which ethtool does
> > not do.
> >
> > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> > ---
> > v2: Fix LICENSE filename and checksum
> >     Honor LDFLAGS value (patch accepted upstream)
> >
> >  meta-networking/recipes-support/phytool/phytool.bb | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/phytool/phytool.bb
> >
> > diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-=
networking/recipes-support/phytool/phytool.bb
> > new file mode 100644
> > index 0000000..d451aa9
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/phytool/phytool.bb
> > @@ -0,0 +1,14 @@
> > +SUMMARY =3D "PHY interface tool for Linux"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39bba7d2cf0ba1036f2a6e2be52=
fe3f0"
> > +
> > +PV =3D "1.0.1"
>=20
> perhaps its better to include SRCPV in PV above since the SRCREV
> below is really 1.0.1+some more commits. moreover we get srcrev
> accounted for task hashes
>=20
> > +SRCREV =3D "3149bfdb4f513e2f0da0a7d0bc5d0873578696f2"
> > +SRC_URI =3D "git://github.com/wkz/phytool.git"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_install() {
> > +       install -d ${D}${prefix}/bin
> > +       oe_runmake 'DESTDIR=3D${D}' 'PREFIX=3D${prefix}' install

We're not using tabs for indentation.
see http://www.openembedded.org/wiki/Styleguide

> > +}
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf1Ky4ACgkQN1Ujt2V2gBwNFACfWjLQY3Eg8LT+MQGSWORpgtAN
PcQAn17lsPARjzwOJoZ3xpomZReY6KRd
=OXOU
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
