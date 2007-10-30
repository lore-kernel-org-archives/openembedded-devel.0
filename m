Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <theBohemian@gmx.net>) id 1ImyW2-0001x2-GE
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2007 22:20:50 +0100
Received: (qmail invoked by alias); 30 Oct 2007 20:54:02 -0000
Received: from e178080251.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.80.251]
	by mail.gmx.net (mp018) with SMTP; 30 Oct 2007 21:54:02 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19NEu8bUdJNMhy/JVAcekai7qVYrFwj3RThADwZ6j
	R2s/HMxCUMMfJi
Message-ID: <472799E6.5050007@gmx.net>
Date: Tue, 30 Oct 2007 21:53:58 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: fakeroot 1.7.1 not fetchable
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
X-List-Received-Date: Tue, 30 Oct 2007 21:20:50 -0000
X-Groupsio-MsgNum: 3251
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig0C37CCB6B616AA175FC931C4"

--------------enig0C37CCB6B616AA175FC931C4
Content-Type: multipart/mixed;
 boundary="------------080806020402090907090602"

--------------080806020402090907090602
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
fakeroot 1.7.1's source cannot be fetched from debian mirrors. It is not
available there. A short googling revealed that is available through
gentoo's mirrors instead:

ftp://ftp.gentoo.org.ua/distfiles/fakeroot_1.7.1.tar.gz

File a bug?

Regards
Robert

--------------080806020402090907090602
Content-Type: text/x-patch;
 name="oe-fakeroot171-url-fix.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="oe-fakeroot171-url-fix.diff"

#
# old_revision [420247a040098c2b3bf47d7ef03fd8a8adbc70ee]
#
# patch "packages/fakeroot/fakeroot_1.7.1.bb"
#  from [9671a1e7cbc80f1694a5f396598c05ac2f9f1269]
#    to [3136d26e1e4100fa3f4bcca51f30a2b9c13cc37f]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/fakeroot/fakeroot_1.7.1.bb	9671a1e7cbc80f1694a5f396598c05ac2=
f9f1269
+++ packages/fakeroot/fakeroot_1.7.1.bb	3136d26e1e4100fa3f4bcca51f30a2b9c=
13cc37f
@@ -5,7 +5,7 @@ PR =3D "r2"
 RDEPENDS =3D "util-linux"
 PR =3D "r2"
=20
-SRC_URI =3D "ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_$=
{PV}.tar.gz \
+SRC_URI =3D "ftp://ftp.gentoo.org.ua/distfiles/fakeroot_${PV}.tar.gz \
            file://work-with-older-libtool.patch;patch=3D1"
=20
 inherit autotools

--------------080806020402090907090602--

--------------enig0C37CCB6B616AA175FC931C4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHJ5npG9cfwmwwEtoRCMAnAJ4o9TX2Xd/XK7FN57N1bflFrGJ03gCgjGDg
Bg5vhIs/jl7GX9VrkLKlIoA=
=Ax9W
-----END PGP SIGNATURE-----

--------------enig0C37CCB6B616AA175FC931C4--
