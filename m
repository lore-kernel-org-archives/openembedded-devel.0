Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <oe@hentges.net>) id 1Ix7Dv-0001SE-7l
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2007 21:40:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id DADD33081F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2007 21:37:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at hentges.net
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563.serverkompetenz.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 0IvQYyPGpDYT
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2007 21:37:08 +0100 (CET)
Received: from [192.168.5.2] (xdsl-87-78-215-172.netcologne.de [87.78.215.172])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id E33253081E3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2007 21:37:07 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <474C31B6.5060807@kernelconcepts.de>
References: <20071125221011.B403A40012A@tinman.treke.net>
	<200711260016.45820.openembedded@haerwu.biz>
	<474C31B6.5060807@kernelconcepts.de>
Date: Tue, 27 Nov 2007 21:37:06 +0100
Message-Id: <1196195826.4469.3.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.3 
Subject: Re: [oe-issues] [Bug 3131] zaurusd should rdepend on bl
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
X-List-Received-Date: Tue, 27 Nov 2007 20:40:06 -0000
X-Groupsio-MsgNum: 3454
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-Y+baL8ql17Flf78uCrrr"

--=-Y+baL8ql17Flf78uCrrr
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 27.11.2007, 16:03 +0100 schrieb Florian Boor:
> Hi,
>=20
> Marcin Juszkiewicz schrieb:
> >> --- Comment #1 from Matthias 'CoreDump' Hentges <oe@hentges.net>=20
> >> 2007-11-25 14:10:11 --- Added gpe-conf to DEPENDS and RDEPENDS as
> >> gpe-conf emulates "bl" these days.
> >=20
> > Zaurusd REQUIRE bl - not gpe-conf and we have 'bl' in repo -=20
> > packages/bl/bl_cvs.bb recipe. Please do test and fix zaurusd recipe to=20
> > depend on proper tool.
>=20
> In my opinion "bl" is old, unmaintained, dead and only works on a few dev=
ices.
> The bl emulation in gpe-conf should do the trick for zaurusd - even it mi=
ght be
> a better idea to have selectable providers for bl. gpe-conf is quite heav=
y and
> you might not want to pull that in everywhere.
>=20

That is indeed the best option here IMO. Seeing as Opie *really* has no
use for gpe-conf but does have a use for "bl" we should make that a
virtual/bl or something.

--=20
Matthias 'CoreDump' Hentges=20
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice



--=-Y+baL8ql17Flf78uCrrr
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHTH/yPXyoPq8wMNkRAjtAAJoDgwjzhTP5+gS47G7MZdeDFeXXewCgw3jk
4+/H4MZ+0MXzhXzqp6eSLeQ=
=RRZe
-----END PGP SIGNATURE-----

--=-Y+baL8ql17Flf78uCrrr--
