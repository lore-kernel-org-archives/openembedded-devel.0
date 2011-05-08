Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJ1Sv-0003o6-6P for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 12:43:57 +0200
Received: from f053040243.adsl.alicedsl.de ([78.53.40.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJ1RU-0005HA-Os for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 10:42:28 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 08 May 2011 12:41:15 +0200
Message-ID: <1304851275.4124.48.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] networkmanager_git: remove `DEFAULT_PREFERENCE = "-1"`
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
X-List-Received-Date: Sun, 08 May 2011 10:43:57 -0000
X-Groupsio-MsgNum: 31732
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-pfMFSWOorRY2DDTKsaB+"

--=-pfMFSWOorRY2DDTKsaB+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sat, 7 May 2011 16:40:28 +0200

1. Use `networkmanager_git` by default.
2. Build tested using `minimal` for `MACHINE =3D "beagleboard"`. Using `min=
imal-uclibc` task compile fails because `execinfo.h` is not available [1].

[1] http://mail.gnome.org/archives/networkmanager-list/2011-May/msg00069.ht=
ml

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/networkmanager/networkmanager_git.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/networkmanager/networkmanager_git.bb b/recipes/network=
manager/networkmanager_git.bb
index 8187787..cb79e78 100644
--- a/recipes/networkmanager/networkmanager_git.bb
+++ b/recipes/networkmanager/networkmanager_git.bb
@@ -1,6 +1,5 @@
 require networkmanager-0.7.inc
=20
-DEFAULT_PREFERENCE =3D "-1"
 DEFAULT_PREFERENCE_angstrom =3D "1"
 DEFAULT_PREFERENCE_shr =3D "1"
=20
--=20
1.7.4.4

--=-pfMFSWOorRY2DDTKsaB+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3Gc0oACgkQPX1aK2wOHVgioQCePbZRsp0QDL9mPO95J5aoJ/GM
yDgAn3ZvQjC7dBSirIIAh6voHSLisDgw
=1k/R
-----END PGP SIGNATURE-----

--=-pfMFSWOorRY2DDTKsaB+--
