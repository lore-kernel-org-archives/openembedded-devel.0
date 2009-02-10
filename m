Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LWimm-0003uU-NB
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Feb 2009 03:55:44 +0100
Received: (qmail invoked by alias); 10 Feb 2009 02:54:47 -0000
Received: from e178099075.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.99.75]
	by mail.gmx.net (mp051) with SMTP; 10 Feb 2009 03:54:47 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX189ar9cArw9Ds6tP8u879k30BRKX9jb536H0dYHFs
	rKMbOIwLBnxewl
Message-ID: <4990ECF8.2090605@gmx.net>
Date: Tue, 10 Feb 2009 03:56:56 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <59e7e6f90902091528o73d594c0y132770d49b1c9b61@mail.gmail.com>
In-Reply-To: <59e7e6f90902091528o73d594c0y132770d49b1c9b61@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6899999999999999
Subject: Re: debian packaging
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
X-List-Received-Date: Tue, 10 Feb 2009 02:55:44 -0000
X-Groupsio-MsgNum: 7584
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig22A36FEC1C4C104047BF143F"

--------------enig22A36FEC1C4C104047BF143F
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Mike Turquette schrieb:
> Hi all,
>=20
> I'm trying to understand more about debian packaging in OE.  I know
> that OE can churn out dpkg's as a result, but does OE have a way to
> intelligently make use of source code that has a 'debian' directory
> complete with rules and all of that?
OE's debian packaging has nothing to do with the 'debian' directory.

> By 'intelligently' I mean can OE determine what DEPENDS and RDEPENDS
> should be, based on the dpkg control info and can it figure out what
> needs to go into staging?  I'm hoping for something analogous to
> autotools.bbclass which uses stuff in the source (instead of the
> recipe) to figure out much of the configuration and decision-making.
It is the other way round: By declaring you want .deb as output it will
take a package's RDEPENDS and many other information to create a deb's
control file.

The mamona project has some support for creating debian source packages,
too.

Regards
Robert


--------------enig22A36FEC1C4C104047BF143F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkmQ7P0ACgkQG9cfwmwwEto2lgCfd2hS/CCompG8A063TqXX+QHM
yCkAn2atn7fBncO//bNPYU71P9um6Wox
=q/Iy
-----END PGP SIGNATURE-----

--------------enig22A36FEC1C4C104047BF143F--
