Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QOFz8-0006ZT-E5 for openembedded-devel@lists.openembedded.org;
	Sun, 22 May 2011 23:14:51 +0200
Received: from f053035096.adsl.alicedsl.de ([78.53.35.96]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QOFwU-00015t-8O for openembedded-devel@lists.openembedded.org;
	Sun, 22 May 2011 21:12:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 May 2011 23:11:51 +0200
Message-ID: <1306098711.5994.97.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH 2/3] icedtea6-native: add `unzip-native` to `DEPENDS`
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
X-List-Received-Date: Sun, 22 May 2011 21:14:51 -0000
X-Groupsio-MsgNum: 32239
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-8aQp9SYtGC+Pmg5onlax"

--=-8aQp9SYtGC+Pmg5onlax
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 22 May 2011 21:57:22 +0200

`unzip-native` is build indirectly by the dependency of a recipe in `DEPEND=
S`. The dependency is not added by `classes/base.bbclass` since `SRC_URI` d=
oes not contain any ZIP files. Therefore add that dependency explicitly to =
not depend on that behavior.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/icedtea/icedtea6-native.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/icedtea/icedtea6-native.inc b/recipes/icedtea/icedtea6=
-native.inc
index 968bd4b..f474869 100644
--- a/recipes/icedtea/icedtea6-native.inc
+++ b/recipes/icedtea/icedtea6-native.inc
@@ -9,6 +9,7 @@ DEPENDS =3D "virtual/javac-native classpath-tools-native \
 	   ant-native \
 	   libx11-native xproto-native libxt-native libxext-native \
 	   freetype-native zlib-native giflib-native jpeg-native \
+	   unzip-native \
 	   zip-native \
 	  "
=20
--=20
1.7.5.1

--=-8aQp9SYtGC+Pmg5onlax
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3ZfBcACgkQPX1aK2wOHVgWHACghrTcKd6kBQJgHQoDh8PcqkSj
A2kAn1PX9POhSYmPfNdO08Egx3wzng3B
=1aJ4
-----END PGP SIGNATURE-----

--=-8aQp9SYtGC+Pmg5onlax--
