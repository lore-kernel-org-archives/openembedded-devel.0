Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1LodRw-00027i-Sl
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 14:52:16 +0200
Received: (qmail invoked by alias); 31 Mar 2009 12:50:02 -0000
Received: from p579E1696.dip.t-dialin.net (EHLO [192.168.4.51]) [87.158.22.150]
	by mail.gmx.net (mp069) with SMTP; 31 Mar 2009 14:50:02 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/y8QJiIRvypViigxgHSTyxdQ3N9xKJ9Pw8OVkrfm
	xX5PdFO2/s++aR
Message-ID: <49D21128.30201@gmx.net>
Date: Tue, 31 Mar 2009 14:48:40 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.59
Subject: ugly OE issue with RDEPENDS
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
X-List-Received-Date: Tue, 31 Mar 2009 12:52:17 -0000
X-Groupsio-MsgNum: 8867
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig5B7D44C92A1A20A5C7FCDCA9"

--------------enig5B7D44C92A1A20A5C7FCDCA9
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,
I have this specific issue with with RDEPENDS and no idea how to solve
it. It affects my Java recipes but in theory it can happen to any other
recipes too. It is nothing Java specific. The unwanted effect is that OE
builds to much and as such slows down the time to build a specific
package considerably.

Ok here is how it goes:

I want to build recipe jamvm (application). This in turn needs recipe
classpath. classpath puts a lot of useful things into staging which is
needed by the jamvm build. So far so good.

The problem is. classpath's tar.gz also contains some Java applications
(the well known jar, javah and so). Via PACKAGE variable I place those
into the binary package classpath-tools. To make everything as smooth as
possible for the user I furthermore declare:

RDEPENDS_classpath-tools =3D "java2-runtime". This means: For this packag=
e
to work correctly a Java runtime needs to be installed. OE in turn
demands that this java2-runtime dependency is also satisfied during the
build.

The odd thing that happens here is: jamvm (which I want to build) is a
provider for java2-runtime but this does not interest OE and it builds
another provider for java2-runtime instead. In my case this is
openjdk-6, a recipe takes a very long time to built.

So I hope you understand my problem and can see that this is by no means
Java specific.

As I see it there are two ways out:

1) If I do 'bitbake jamvm', OE should take that as a valid java2-runtime
provider that the built wants to have (Yeah, the classpath recipe wants
it actually before) and should not select another recipe that provides it=
=2E

2) I could split classpath into different recipes. E.g. a dedicated
classpath-tools recipe.


What should I do?

Regards
Robert


--------------enig5B7D44C92A1A20A5C7FCDCA9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAknSESgACgkQG9cfwmwwEtqTQwCghelP78wXUdvYGQ7KFGZzfnaD
uXQAmwUapnVIwXExiPceX/U+KnmFyE5H
=MvZp
-----END PGP SIGNATURE-----

--------------enig5B7D44C92A1A20A5C7FCDCA9--
