Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QOG5W-0006ha-EQ for openembedded-devel@lists.openembedded.org;
	Sun, 22 May 2011 23:21:26 +0200
Received: from f053035096.adsl.alicedsl.de ([78.53.35.96]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QOG2s-0001zs-7Y for openembedded-devel@lists.openembedded.org;
	Sun, 22 May 2011 21:18:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 May 2011 23:18:27 +0200
Message-ID: <1306099107.5994.105.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH 3/3] icedtea6-native.inc: set environment variable `UNZIP` to fix build error
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
X-List-Received-Date: Sun, 22 May 2011 21:21:26 -0000
X-Groupsio-MsgNum: 32240
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-oPk7Qa3/xJLbaheYvZjr"

--=-oPk7Qa3/xJLbaheYvZjr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 22 May 2011 22:35:39 +0200

Task compile fails with the following error message.

	( cd  /oe/build-angstrom-next/angstrom-dev/work/i686-linux/icedtea6-native=
-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86 && /usr/bin/unzip =
-o /oe/build-angstrom-next/angstrom-dev/work/i686-linux/icedtea6-native-1.7=
.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/corba/dist/lib/bin.zip=
 )
	/bin/sh: /usr/bin/unzip: No such file or directory
	make[4]: *** [/oe/build-angstrom-next/angstrom-dev/work/i686-linux/icedtea=
6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/tmp/java/c=
omponents_imported] Error 127

Passing the path to (the staged) `unzip` directly using the environment var=
iable `UNZIP` fixes the error.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/icedtea/icedtea6-native.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/icedtea/icedtea6-native.inc b/recipes/icedtea/icedtea6=
-native.inc
index f474869..9961bf7 100644
--- a/recipes/icedtea/icedtea6-native.inc
+++ b/recipes/icedtea/icedtea6-native.inc
@@ -113,6 +113,7 @@ do_configure_append() {
=20
 EXTRA_OEMAKE =3D ' \
                 ZIPEXE=3D"${STAGING_BINDIR_NATIVE}/zip" \
+                UNZIP=3D"${STAGING_BINDIR_NATIVE}/unzip" \
                '
=20
 do_compile() {
--=20
1.7.5.1

--=-oPk7Qa3/xJLbaheYvZjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3ZfaMACgkQPX1aK2wOHVi3fQCdHK6fSXQ/1gYMXbd9Zw/8CXpo
rU0Anjo5YxiHYVUeUuDP5nrD1MJ9qt55
=iC8r
-----END PGP SIGNATURE-----

--=-oPk7Qa3/xJLbaheYvZjr--
