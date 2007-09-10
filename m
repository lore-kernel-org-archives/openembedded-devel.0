Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <theBohemian@gmx.net>) id 1IUcvQ-0000NX-1D
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2007 08:39:12 +0200
Received: (qmail invoked by alias); 10 Sep 2007 06:36:16 -0000
Received: from e178088152.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.88.152]
	by mail.gmx.net (mp030) with SMTP; 10 Sep 2007 08:36:16 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18LHgcMPy8LHsIrAvUu10lbB7EGITSVAmRinuwcXq
	FjqeFGGnPS7NyO
Message-ID: <46E4E5DB.7050501@gmx.net>
Date: Mon, 10 Sep 2007 08:36:11 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: IceDove 1.5.0.12 (X11/20070730)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.94.2.0
X-Y-GMX-Trusted: 0
Subject: 3rd party feeds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2007 06:39:12 -0000
X-Groupsio-MsgNum: 2866
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig03D181AB31265CC8143A0B1E"

--------------enig03D181AB31265CC8143A0B1E
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,
suppose I am a 3rd party which develops and maintains packages for a
distribution (e.g. angstrom).

how can I provide those packages (say foo) and their dependendencies
(minus the ones that are already provided by angstrom itself) via a feed.=


To better explain what I mean here is an example. Suppose package foo is
not part of the Angstrom distribution nor is it in its feeds. foo has a
dependency on gtk+ (=3D part of Angstrom) and libbaz (=3D not part of Ang=
strom).

I want to built foo and the feed containing it with a single command:

bitbake angstrom-plus-feed

When it finishes I want to have a complete ipk feed which I can copy
onto a server. It should contain foo, libbaz and not gtk+. Users should
then add the URL for that feed into their machines and be able to
install "foo" along with the dependencies. foo and libbaz will be
fetched from my feed, gtk+ should be fetched from angstrom feed.

It is clear that I have to built all the angstrom packages on the build
machine and possibly won't be able to suppress the do_package phase but
that is not a problem.

Has OE support for such an approach? If not would you be interested in
patches allowing it?

So far I have "emulated" this by using a special PACKAGE_ARCH but that
is not really a solution.

Regards
Robert


--------------enig03D181AB31265CC8143A0B1E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFG5OXeG9cfwmwwEtoRCKknAKCWV0YiP31SSa2485T3gpJ6a3Ad4ACfYWR2
gYYpVVvNt7adW+tXp1RVFVY=
=gNsd
-----END PGP SIGNATURE-----

--------------enig03D181AB31265CC8143A0B1E--
