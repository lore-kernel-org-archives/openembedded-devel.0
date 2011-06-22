Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QZWKH-0007Mg-Fx for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 00:55:13 +0200
Received: from f053036030.adsl.alicedsl.de ([78.53.36.30]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QZWH0-000276-C8; Wed, 22 Jun 2011 22:51:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2011 00:51:18 +0200
Message-ID: <1308783078.21159.17.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: libfso-qt-embedded: Do not override `DEPENDS`
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
X-List-Received-Date: Wed, 22 Jun 2011 22:55:13 -0000
X-Groupsio-MsgNum: 32795
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-k304XbOjUnKeaQKGDWoT"

--=-k304XbOjUnKeaQKGDWoT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Wed, 22 Jun 2011 23:41:38 +0200

Using `=3D` instead of `+=3D` overrides the dependencies declared in `libfs=
o-qt.inc`.

Task configure therefore fails with the following errors.

1. `fso-specs` is not found.

 	checking for SPECS... no
	configure: error: Package requirements (fso-specs >=3D 2011.06.01.1) were =
not met:

	No package 'fso-specs' found

2. `qfsodbusxml2cpp` is not found.

	checking for QFSODBUSXML2CPP... no
	configure: error: Package requirements (qfsodbusxml2cpp >=3D 0.7.0) were n=
ot met:

	No package 'qfsodbusxml2cpp' found

Using `+=3D` solves these problems and is built tested using `minimal` for =
`MACHINE =3D "beagleboard"`.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Simon Busch <morphis@gravedo.de>
---
 recipes/freesmartphone/libfso-qt-embedded_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/freesmartphone/libfso-qt-embedded_git.bb b/recipes/fre=
esmartphone/libfso-qt-embedded_git.bb
index 647f439..641cf8d 100644
--- a/recipes/freesmartphone/libfso-qt-embedded_git.bb
+++ b/recipes/freesmartphone/libfso-qt-embedded_git.bb
@@ -2,5 +2,5 @@ require libfso-qt.inc
=20
 PR =3D "${INC_PR}.0"
=20
-DEPENDS =3D "qt4-embedded"
+DEPENDS +=3D "qt4-embedded"
 EXTRA_OECONF_append =3D "--enable-qt-embedded"
--=20
1.7.5.4

--=-k304XbOjUnKeaQKGDWoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4CceUACgkQPX1aK2wOHViopACfQ5yLm2J7MeWJ1YL4QhPRPHQw
cxQAnjYdbXSor+oBw3NGPBI7/Vg6vKQK
=6oGr
-----END PGP SIGNATURE-----

--=-k304XbOjUnKeaQKGDWoT--
