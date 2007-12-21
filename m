Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1J5ef4-0003pm-LZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2007 10:59:22 +0100
Received: (qmail invoked by alias); 21 Dec 2007 09:54:08 -0000
Received: from e178102245.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.102.245]
	by mail.gmx.net (mp058) with SMTP; 21 Dec 2007 10:54:08 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18KxkFVHwYKGjEkRv/JgjLlTl/hn4P2jiRhEog35M
	PukDid/m3dRTRa
Message-ID: <476B8D3A.7010703@gmx.net>
Date: Fri, 21 Dec 2007 10:54:02 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: java recipe policy for OE
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
X-List-Received-Date: Fri, 21 Dec 2007 09:59:22 -0000
X-Groupsio-MsgNum: 3724
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig461BE1381A9E8EF18E47761A"

--------------enig461BE1381A9E8EF18E47761A
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
the toolchain stuff has not been committed yet but I still want to start
a little discussion about the future of java packages in OE.

a) jar location
The Debian java packages have the fine habit of placing all the jars
(this is what resembles a shared library in java land) into
/usr/share/java. Since Java (still) lacks an automated mechanism to look
up those jars they have to be provided manually when starting an
application (e.g. through a shell script) and putting them into a common
directory saves people's nerves.

Making the jar location variable is easy, making applications work can
be hard (patching scripts etc). I don't see much value in making this
configurable either.

b) jni library location
Another addition from the Debian guys is to put JNI libraries (shared
libraries which provide some C stuff to the Java side) into
/usr/lib/jni. Native library lookup is even more strange in Java and it
was decided to simply patch Java runtimes to add /usr/lib/jni to the
default native library search path (hard coding).

Making this location configurable is difficult since it would involve
making the patches for the Java runtime configurable.

If OE follows both approaches I hope that people will have it easier to
use start scripts from Debian or Debian-aware projects on their devices.

c) naming
Debian names packages containing only jars lib<PN>-java. If it has a
corresponding JNI library it is called lib<PN>-jni. I would like to
adopt this for OE. With the help of a bbclass for java library recipes
this safes boilerplate. I have an early version of such a bbclass in the
Jalimo repository for everyone to look at, criticise and enhance. :)

For those coming from the C world these suggestion may look quite strict
but please keep in mind that compiling Java package from source is often
a complete mess: Source tarballs often contains pre-built dependencies
of some unknown version and every project has its own special way of
being built. So it is already very complicated to write proper OE
recipes for those. Making the policy for Java packages as strict as
explained above gives us the possibility to patch every out of place
source tarball into obedience. :)

Regards
Robert


--------------enig461BE1381A9E8EF18E47761A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHa40/G9cfwmwwEtoRCK7/AJ9aTaW2FxEAVQU0nB302cb1rDZvhQCeKKok
TEQCnxj6beA1N9H94vxJmxI=
=Y0SS
-----END PGP SIGNATURE-----

--------------enig461BE1381A9E8EF18E47761A--
