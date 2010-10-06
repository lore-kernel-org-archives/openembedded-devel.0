Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P3UqX-0006ui-KU for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 16:19:57 +0200
Received: from f053037105.adsl.alicedsl.de ([78.53.37.105]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P3UqF-0006nw-PO for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 14:19:35 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 06 Oct 2010 16:19:34 +0200
Message-ID: <1286374774.3792.12.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] mokosuite2: Add `libfakekey` and `vala-native` to DEPENDS.
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
X-List-Received-Date: Wed, 06 Oct 2010 14:20:03 -0000
X-Groupsio-MsgNum: 24433
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-vHFPEjdOAX7C2jlXRFwS"

--=-vHFPEjdOAX7C2jlXRFwS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 4 Oct 2010 11:56:14 +0200

During the latest bumps of `SRCREV` I guess it was forgotten to add some de=
pendencies.

`libfakekey` is needed for a successful configure and without `vala-native`=
 `valac` is not found on a clean and minimal build system.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/openmoko-3rdparty/mokosuite2_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/openmoko-3rdparty/mokosuite2_git.bb b/recipes/openmoko=
-3rdparty/mokosuite2_git.bb
index cbdf89d..9812ca6 100644
--- a/recipes/openmoko-3rdparty/mokosuite2_git.bb
+++ b/recipes/openmoko-3rdparty/mokosuite2_git.bb
@@ -2,11 +2,11 @@ DESCRIPTION =3D "Desktop environment and phone stack GUI =
for SHR"
 HOMEPAGE =3D "http://gitorious.org/mokosuite2"
 AUTHOR =3D "Daniele Ricci"
 LICENSE =3D "GPLv3"
-DEPENDS =3D "mokowm elementary libfreesmartphone-glib libphone-utils eggdb=
us glib-2.0 dbus-glib alsa-lib db sqlite3"
+DEPENDS =3D "mokowm elementary libfakekey libfreesmartphone-glib libphone-=
utils eggdbus glib-2.0 dbus-glib alsa-lib db sqlite3 vala-native"
 SECTION =3D "misc/utils"
=20
 PV =3D "1.0.99+gitr${SRCPV}"
-PR =3D "r1"
+PR =3D "r2"
 SRCREV =3D "e70e928216eea9d07c28327634ea49c87bc0c92f"
=20
 SRC_URI =3D "git://gitorious.org/mokosuite2/appbunch.git;protocol=3Dgit"
--=20
1.7.1

--=-vHFPEjdOAX7C2jlXRFwS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyshXYACgkQPX1aK2wOHVhhPACbBXKqttb2wXO6aZGYX+PJ4dow
Dg0AmgInV34/TIhZ0vQHjEeQ2DtYDTbi
=fl+S
-----END PGP SIGNATURE-----

--=-vHFPEjdOAX7C2jlXRFwS--
