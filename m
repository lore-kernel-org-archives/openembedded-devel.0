Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1US6dw-00087J-ES
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 16:13:56 +0200
Received: by mail-da0-f53.google.com with SMTP id n34so261803dal.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 06:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=6nsXhbpcjU9xnI8G9ixWWfhBv8cwYcg/F0qLHcSxAtI=;
	b=YtgG2Ky02jt3saI30Ey2U9kYRG1DkL9ghoJTlNPRiydJVO4gF6XRvHC1BpnU1JeYS2
	/TTlkefknt5dQm4ps8M37bp2QtZlzKkQgUrvkB1gwA4Y7yUt66eHvATiNG5QHOJYNS7K
	qSkWd1ePXIMqJIlv0j8Y/KR0Dw6gAKNO5NIR7JjLZbmFpbrXjRJw21NzfuSFoIl5lkvA
	9V5pZQbJR1Khmfm4J0SoYVbm0HSK+PTID2uDFR+UbD7H1G9zpOwRKTlfF2W+vrDrcjvt
	rxAh2zpx2DNNTLQ7YJVAiaPoOlafqI11j010f/4HyT4E2B5EsZD9jM1EkP3SWzMe966D
	AWFQ==
X-Received: by 10.68.228.134 with SMTP id si6mr3428569pbc.24.1366120585198;
	Tue, 16 Apr 2013 06:56:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bs3sm2156206pbb.36.2013.04.16.06.56.22
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 06:56:24 -0700 (PDT)
Date: Tue, 16 Apr 2013 15:56:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130416135622.GN10628@jama.dyndns-home.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
	<1561352.OujRcMfYWi@helios>
	<5C3F1A93-CC39-45E6-AF2B-FF29F50C67CD@dominion.thruhere.net>
	<2803066.5t2BvEp21p@helios>
MIME-Version: 1.0
In-Reply-To: <2803066.5t2BvEp21p@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-networking, meta-oe][PATCH 0/9] Move networking recipes to meta-networking
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 14:13:57 -0000
X-Groupsio-MsgNum: 44248
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N/GrjenRD+RJfyz+"
Content-Disposition: inline

--N/GrjenRD+RJfyz+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 02:22:52PM +0100, Paul Eggleton wrote:
> On Tuesday 16 April 2013 13:30:29 Koen Kooi wrote:
> > Op 16 apr. 2013, om 13:19 heeft Paul Eggleton=20
> <paul.eggleton@linux.intel.com> het volgende geschreven:
> > > On Tuesday 16 April 2013 13:09:46 Koen Kooi wrote:
> > >> These look good to me, but
> > >>=20
> > >>> iw: move to meta-networking and update
> > >>=20
> > >> This is receferenced by a packagegroup in meta-oe:
> > >> 	meta-oe/recipes-core/packagegroups/packagegroup-basic.bb:
> > >> ${@base_contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "",=
 d)}
> > >> \
> > >>=20
> > >>=20
> > >> With the 'meta-oe shall only depend on oe-core' rule,
> > >=20
> > > Are you sure nothing in meta-oe depends on anything in other layers w=
ithin
> > > meta-openembedded already?
> >=20
> > I can't say for certain, but Martin and I have been very strict about i=
t in
> > the past. If there are such external dependencies they should be looked=
 at
> > and fixed.
>=20
> At some point I don't think this is going to be realistic - what happens =
if=20
> you have something in meta-oe that's too generic to be put elsewhere and =
yet=20
> has a dependency on something in meta-multimedia or meta-networking? It w=
ill=20
> come up at some point fairly soon.

then it should be in meta-multimedia or meta-networking even when
it's too generic or the required recipe in meta-multimedia or meta-networki=
ng=20
has to be moved back to meta-oe.

> I can drop the iw patch from this set for the sake of the rest of the pat=
ches=20
> if you object to moving it, but we do need to do something about this in =
the=20
> near future.
>=20
> For now, I did check and at the moment according to "bitbake-layers show-
> cross-depends" (thank you Robert) we have only vlc depending on fluidsynt=
h=20
> which is in meta-multimedia, but vlc ought to be moved to meta-multimedia=
=20
> itself anyway.

Ah, my fault I've added fluidsynth because it was autodetected, but
maybe I should have disabled it explicitly or move vlc to meta-multimedia w=
ith it.

commit 0d1d39da74e6b73c5b070f551373d21e2a15f98a
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Tue Dec 11 00:54:46 2012 +0100

    vlc: add fluidsynth and alsa-lib to DEPENDS for reproducible builds


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--N/GrjenRD+RJfyz+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFtWIYACgkQN1Ujt2V2gBxaSgCfXF4+ZP+AOcSaB6qhTx+DU9nI
ImAAoJOmWyKiXYYHVyR+Z/9tu0ljpEp0
=AHpy
-----END PGP SIGNATURE-----

--N/GrjenRD+RJfyz+--
