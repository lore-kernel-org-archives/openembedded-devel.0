Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3287067D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:40:26 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so6848955wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ooq+gVDcxXM7k0m51ZUJkUuxEC90TddiwKk2IU2CJBk=;
	b=D86/fzROg3FOi7/r9JSYto5Eff/kTHa6e5rs4jJMP1gxbvgiOBUZ11lCW77OhTybUF
	vV1M7wijD2w9ba8kTayZ7dggwrQfCEa6VceI2Zlz/dU8rw7aWI/vBDVF8P7vEMMogfNA
	+26k1TMw/p8HbmZARdc24hp9/VkhCz3traRuFfbvx/z/g8RNqpsQi2kAetQGX6F1sCMm
	iMoaR+18S20x5CIwmIefN8A2EtsPeq8SXvv0uIj+/Gxz7ess1X1q39OsLqb9oaOD+06H
	G7OhL4Mo/TOBKMAs2QX5T2WvCLwn74Hbtgyrn+Vn4HxqGwfsf/hT434oJMY/dN8xxwJL
	SXDQ==
X-Received: by 10.180.12.33 with SMTP id v1mr23249326wib.0.1405608027455;
	Thu, 17 Jul 2014 07:40:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gq4sm21741163wib.8.2014.07.17.07.40.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jul 2014 07:40:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Jul 2014 16:40:38 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140717144038.GL2433@jama>
References: <cover.1405465524.git.TicoTimo@gmail.com>
	<20140716125007.GV2433@jama>
	<CANx9H-BSe-REicRzcAgcv5=dLx3S8w7ysqgiwhtrC4U0z8P4Pg@mail.gmail.com>
	<1546726.9iZKeAkyu0@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1546726.9iZKeAkyu0@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 2/2] meta-python: move recipes from meta-oe
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
X-List-Received-Date: Thu, 17 Jul 2014 14:40:27 -0000
X-Groupsio-MsgNum: 51047
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lGa3FpvTyf1CgKg0"
Content-Disposition: inline

--lGa3FpvTyf1CgKg0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2014 at 03:20:51PM +0100, Paul Eggleton wrote:
> On Thursday 17 July 2014 07:07:01 Tim Orling wrote:
> > Well, that's embarrassing. Thank you, Martin. Obviously, I forgot to pu=
sh a
> > local commit. I guess I'd better move to the back of the bus!
> >=20
> >=20
> > On Wed, Jul 16, 2014 at 5:50 AM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> > > On Tue, Jul 15, 2014 at 04:32:34PM -0700, Tim Orling wrote:
> > > >      * Move recipes from meta-openembedded/meta-oe that are not
> > > >     =20
> > > >        depended upon by recipes already in meta-oe (e.g. gateone,
> > > >        anki)
> > > >     =20
> > > >      * Recipes NOT moved:
> > > >        python-futures
> > > >        python-pyopenssl
> > > >        python-simplejson
> > > >        python-tornado
> > > >        python-pyqt
> > > >        python-sip
> > > >=20
> > > > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > > > ---
> > > >=20
> > > >  .../recipes-devtools/python =3D> meta-python/recipes-python}/pyrtm=
_0.2.bb
>=20
> I just noticed, this doesn't fit the normal pattern of=20
> recipes-xyz/something/*.bb - there's a missing directory level. It's enti=
rely=20
> cosmetic, but if we do want to fix it we ought to do so now.

I've fixed it already (in master-next) and it's not just cosmetic,
because without the directory it's not included in BBFILES pattern.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lGa3FpvTyf1CgKg0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPH4GYACgkQN1Ujt2V2gBzyYgCgoCdX9/W3CRh7yoXJe9qq8MWO
OVwAnjVUMf/6zxXPhOXZHYEbz5LFZoxy
=CDkU
-----END PGP SIGNATURE-----

--lGa3FpvTyf1CgKg0--
