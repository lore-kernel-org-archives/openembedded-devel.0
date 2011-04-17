Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBUsZ-0006li-Hd for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 18:31:19 +0200
Received: from f053034068.adsl.alicedsl.de ([78.53.34.68]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBUql-0004Lj-Gi; Sun, 17 Apr 2011 16:29:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Apr 2011 18:29:00 +0200
Message-ID: <1303057740.23572.23.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] schroedinger.inc: remove version dependent checksums
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
X-List-Received-Date: Sun, 17 Apr 2011 16:31:19 -0000
X-Groupsio-MsgNum: 31241
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-FaizXwbeDAEN6KrD5Vd0"

--=-FaizXwbeDAEN6KrD5Vd0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 17 Apr 2011 18:14:13 +0200

This is a fix up for commit cb84b138 [1].

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dcb84b13=
8269ed9f3426f4e79f4bb9911e5066387

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/schroedinger/schroedinger.inc |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/schroedinger/schroedinger.inc b/recipes/schroedinger/s=
chroedinger.inc
index 4dc8a6e..386fc73 100644
--- a/recipes/schroedinger/schroedinger.inc
+++ b/recipes/schroedinger/schroedinger.inc
@@ -5,8 +5,6 @@ DEPENDS =3D "liboil orc-native orc"
 INC_PR =3D "r1"
=20
 SRC_URI =3D "http://www.diracvideo.org/download/schroedinger/${P}.tar.gz;n=
ame=3Dschroedingertargz"
-SRC_URI[schroedingertargz.md5sum] =3D "d67ec48b7c506db8c8b49156bf409e60"
-SRC_URI[schroedingertargz.sha256sum] =3D "345abcaa72ff0f2e9c1075e22f714147=
5ee4e6eea23a7f568b69ffc13cc1c723"
 SRC_URI +=3D "file://configure.ac.patch"
=20
 EXTRA_OECONF +=3D "STAGING_DIR=3D${STAGING_DIR_NATIVE}"
--=20
1.7.4.4

--=-FaizXwbeDAEN6KrD5Vd0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2rFUwACgkQPX1aK2wOHVhQagCcCIOQuovd1eQEnHOp3nbHWzHt
cigAoIyj3LJUXT3JeCwXpVuEM73tgu9A
=uwaT
-----END PGP SIGNATURE-----

--=-FaizXwbeDAEN6KrD5Vd0--
