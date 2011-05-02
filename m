Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGrPK-0002db-VM for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 13:35:18 +0200
Received: from f053036031.adsl.alicedsl.de ([78.53.36.31]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGrNn-0001pE-T4 for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 11:33:44 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304324573-31754-1-git-send-email-koen@openembedded.org>
References: <1304324573-31754-1-git-send-email-koen@openembedded.org>
Date: Mon, 02 May 2011 13:32:43 +0200
Message-ID: <1304335963.3949.56.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] angstrom-2010-preferred-versions.inc: prefer DBus 1.4.1
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
X-List-Received-Date: Mon, 02 May 2011 11:35:19 -0000
X-Groupsio-MsgNum: 31555
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-SHK1mNU09snJkO0tNRgI"

--=-SHK1mNU09snJkO0tNRgI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 2 May 2011 13:26:24 +0200

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
This patch should go in before [1]

	[oe] [PATCH] systemd: update to v26

because otherwise task configure fails with the following error.

| checking for UDEV... yes
| checking for DBUS... configure: error: Package requirements ( dbus-1 >=3D=
 1.3.2 ) were not met:
|
| Requested 'dbus-1 >=3D 1.3.2' but version of dbus is 1.2.24
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables DBUS_CFLAGS
| and DBUS_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
|
NOTE: package systemd-v26-r0: task do_configure: Failed

[1] http://patches.openembedded.org/patch/3061/
---
 .../include/angstrom-2010-preferred-versions.inc   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/con=
f/distro/include/angstrom-2010-preferred-versions.inc
index 5c28440..ae01b57 100644
--- a/conf/distro/include/angstrom-2010-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
@@ -14,7 +14,7 @@ PREFERRED_VERSION_automake =3D "1.11.1"
 PREFERRED_VERSION_automake-native =3D "1.11.1"
 PREFERRED_VERSION_busybox 	=3D "1.18.4"
 PREFERRED_VERSION_cairo		=3D "1.10.0"
-PREFERRED_VERSION_dbus 		=3D "1.2.24"
+PREFERRED_VERSION_dbus 		=3D "1.4.1"
 PREFERRED_VERSION_dropbear      =3D "0.52"
 PREFERRED_VERSION_fontconfig	=3D "2.8.0"
 PREFERRED_VERSION_glib-2.0 	=3D "2.28.0"
--=20
1.7.4.4

--=-SHK1mNU09snJkO0tNRgI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2+llsACgkQPX1aK2wOHVgVMQCfSseproweG61AIdqhV/ZJqNdo
iHgAn1I/BhkfyUtXy876Q8ZQzjW+Gcvi
=dC3j
-----END PGP SIGNATURE-----

--=-SHK1mNU09snJkO0tNRgI--
