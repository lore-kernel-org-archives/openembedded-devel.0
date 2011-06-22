Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QZWIx-0007GB-TW for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 00:53:51 +0200
Received: from f053036030.adsl.alicedsl.de ([78.53.36.30]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QZWFf-0001QF-WF; Wed, 22 Jun 2011 22:50:28 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2011 00:50:16 +0200
Message-ID: <1308783016.21159.16.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: libshiboken: Do not override `DEPENDS`
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
X-List-Received-Date: Wed, 22 Jun 2011 22:53:52 -0000
X-Groupsio-MsgNum: 32794
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-7GaalrdtxZRVKBLu4R7g"

--=-7GaalrdtxZRVKBLu4R7g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 20 Jun 2011 18:01:13 +0200

This is a fix up for commit 1b9260e7 [1].

	commit 1b9260e7a6c756d6938821f013a41c371065980a
	Author: Paul Menzel <paulepanter@users.sourceforge.net>
	Date:   Sun Jun 19 11:45:37 2011 +0200

		  shiboken: Add `apiextrator-native` to `DEPENDS`

This commit does not fix the mentioned error, that
`ApiExtractorConfig.cmake` is not built, since by using `=3D` instead of `
+=3D` the dependencies from the include file `shiboken.inc` are overriden
in the recipe.

This patch fixes the error and is built tested using `minimal` for
`MACHINE =3D "beagleboard"`.

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1b9260e=
7a6c756d6938821f013a41c371065980a

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Simon Busch <morphis@gravedo.de>
---
 recipes/pyside/libshiboken_1.0.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/pyside/libshiboken_1.0.2.bb b/recipes/pyside/libshibok=
en_1.0.2.bb
index a9edded..91ea29b 100644
--- a/recipes/pyside/libshiboken_1.0.2.bb
+++ b/recipes/pyside/libshiboken_1.0.2.bb
@@ -1,6 +1,6 @@
 require shiboken.inc
=20
-DEPENDS =3D "python"
+DEPENDS +=3D "python"
 RDEPENDS_${PN} =3D "python-core"
 PR =3D "${INC_PR}.1"
=20
--=20
1.7.5.4

--=-7GaalrdtxZRVKBLu4R7g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4CcagACgkQPX1aK2wOHVgbmACdHUolxYfr5dL+7fhAndFvdABb
D88AnjQbjsufkhSao9i7ZSFrLJV/katp
=3Zxt
-----END PGP SIGNATURE-----

--=-7GaalrdtxZRVKBLu4R7g--
