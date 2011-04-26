Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEkEP-0002SR-TG for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 17:31:18 +0200
Received: from f053033081.adsl.alicedsl.de ([78.53.33.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEkCk-0007aH-UU for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 15:29:35 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2011 17:28:47 +0200
Message-ID: <1303831727.4073.79.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] bluez4: remove `DEFAULT_PREFERENCE = "-1"`
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
X-List-Received-Date: Tue, 26 Apr 2011 15:31:18 -0000
X-Groupsio-MsgNum: 31487
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-atC6zsyAWoeDWLdXcZW8"

--=-atC6zsyAWoeDWLdXcZW8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 26 Apr 2011 09:03:49 +0200

Disabling it by default started with commit 58c8e70e [1].

	commit 58c8e70ec14568d0dd21f6dfe72015375edccd60
	Author: Koen Kooi <koen@openembedded.org>
	Date:   Mon Jul 20 11:29:06 2009 +0200

	    bluez4: add 4.46, disabled by default

BlueZ 4.91 builds fine using `minimal{,-uclibc}` for `MACHINE =3D "beaglebo=
ard" though.

Distributions should pin `bluez4_4.42.bb` if they want to use it.

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D58c8e70=
ec14568d0dd21f6dfe72015375edccd60

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/bluez/bluez4_4.91.bb |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/recipes/bluez/bluez4_4.91.bb b/recipes/bluez/bluez4_4.91.bb
index 5684fc8..ebb2dab 100644
--- a/recipes/bluez/bluez4_4.91.bb
+++ b/recipes/bluez/bluez4_4.91.bb
@@ -3,10 +3,6 @@ require bluez4.inc
 SRC_URI[md5sum] =3D "3059b7ef5168c84cd0c6a67034ce79f9"
 SRC_URI[sha256sum] =3D "11e9279e2669db996afd464b96d2c68f41f157f6eb9b8842a0=
bbcad8a4eac18d"
=20
-DEFAULT_PREFERENCE =3D "-1"
-DEFAULT_PREFERENCE_angstrom =3D "1"
-DEFAULT_PREFERENCE_shr =3D "1"
-
 DEPENDS +=3D "libsndfile1"
=20
 PR =3D "${INC_PR}.0"
--=20
1.7.4.4

--=-atC6zsyAWoeDWLdXcZW8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk225K8ACgkQPX1aK2wOHVgcpwCfS5Gz/p3EqdgEDaU4FRTNj6Rs
EvkAni1rrlTe6waXappYViDrM7QpbLde
=vXAm
-----END PGP SIGNATURE-----

--=-atC6zsyAWoeDWLdXcZW8--
