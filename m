Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1J2U69-0004Kb-Ib
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2007 17:06:13 +0100
Received: (qmail invoked by alias); 12 Dec 2007 16:01:51 -0000
Received: from e178125125.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.125.125]
	by mail.gmx.net (mp040) with SMTP; 12 Dec 2007 17:01:51 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/2O7Q42t32B0SVm8av3p4mYgWgFHKdl7xRNfPVY3
	0cgyOL7a2cZpiH
Message-ID: <476005E5.5050605@gmx.net>
Date: Wed, 12 Dec 2007 17:01:41 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <475EDA2B.8080109@gmx.net>
	<c384c5ea0712120529m10874ac8g97faeac69e60024a@mail.gmail.com>
In-Reply-To: <c384c5ea0712120529m10874ac8g97faeac69e60024a@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: RFC: merging recipes from Jalimo
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
X-List-Received-Date: Wed, 12 Dec 2007 16:06:13 -0000
X-Groupsio-MsgNum: 3610
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig7D50731AA73AD508BB4300D4"

--------------enig7D50731AA73AD508BB4300D4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Leon,

Leon Woestenberg schrieb:
> Hello Robert,
> I see the compile task assumes the availability of "javac".
>=20
> javac -d build -source 1.4 -sourcepath source `cat $list`;
>=20
> How do you expect this to be available on the host? Will any javac
> that's out there be good enough to use?
A Java 1.4 compatible compiler is needed. That can be the proprietary
javac, gcj -C, jikes and ecj. Most distribution have some way to let the
latter three be available as 'javac'.

You may say that we could use jikes-native from OE then but that
compiler needs (as all Java compilers) a class library. Jikes is not
Java5-capable but GNU Classpath expects one since version 0.95. One
could build an older GNU Classpath release just for this purpose but
then there would still be no runtime to use ecj-bootstrap (which is a
Java app itself). Additionally I wanted to stick with latest and
greatest GNU Classpath (especially everything after the Java5 switch)
releases since the older ones contain surprising bugs and miss important
tools (gjar, gjavah etc).

It is really a messy bootstrapping situation, I know. Since OE expects
GCC being installed I think that gij and gcj can also be available on
those systems.

> Currently, OpenEmbedded tries to rely on a defined set of host tools
> to be installed, and my concern is that we now must add one (out of a
> set of acceptable) java compiler to that external dependency list. If
> so, we must do so carefully.
Yes, thats true. A java compiler and a runtime (both from the fairly old
1.4 times) are needed in the beginning. After ecj-bootstrap is built its
only purpose is to built OE's own java runtime and compiler.

If independence from those two pieces of software is important I could
look into this. However I expect this to become complicated.

Regards
Robert


--------------enig7D50731AA73AD508BB4300D4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHYAXoG9cfwmwwEtoRCCBlAJ9fiyE0pSKzP6MQMc6x/XJsNiexKQCdEjoJ
bj5wEffyFBTJCjFhP/8vFnk=
=j113
-----END PGP SIGNATURE-----

--------------enig7D50731AA73AD508BB4300D4--
