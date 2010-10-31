Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PCb4Z-0005X9-KI for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 17:47:59 +0100
Received: from f053032235.adsl.alicedsl.de ([78.53.32.235]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PCb3q-0001te-5I for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 16:47:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Oct 2010 17:47:12 +0100
Message-ID: <1288543633.13060.6.camel@mattotaupa>
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
Subject: [PATCH 2/2] accelges_svn: add `libglade` to `DEPENDS`
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
X-List-Received-Date: Sun, 31 Oct 2010 16:48:00 -0000
X-Groupsio-MsgNum: 25648
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-gLaJIZKtNKzTVG2rhtB6"

--=-gLaJIZKtNKzTVG2rhtB6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 31 Oct 2010 13:49:59 +0100

The task `configure` failed with the following error.

        [=E2=80=A6]
        | checking for NOTIFY... yes
        | checking for GLADE... configure: error: Package requirements (lib=
glade-2.0) were not met:
        |
        | No package 'libglade-2.0' found
        |
        | Consider adjusting the PKG_CONFIG_PATH environment variable if yo=
u
        | installed software in a non-standard prefix.
        |
        | Alternatively, you may set the environment variables GLADE_CFLAGS
        | and GLADE_LIBS to avoid the need to call pkg-config.
        | See the pkg-config man page for more details.
        |
        | ERROR: Function do_configure failed
        NOTE: package accelges-1_0.2+svnr206-r4: task do_configure: Failed

Adding `libglade` to `DEPENDS` fixes the problem and the recipe was build t=
ested with the following build configuration.

        Build Configuration:
        BB_VERSION        =3D "1.10.0"
        METADATA_BRANCH   =3D "org.openembedded.dev"
        METADATA_REVISION =3D "1218fb1420ff039012d08e4a43cf3bac70c08fdf"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-gnueabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "angstrom"
        DISTRO_VERSION    =3D "next"
        TARGET_FPU        =3D "hard"

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/accelges/accelges_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/accelges/accelges_svn.bb b/recipes/accelges/accelges_s=
vn.bb
index 805dc11..3afc166 100644
--- a/recipes/accelges/accelges_svn.bb
+++ b/recipes/accelges/accelges_svn.bb
@@ -9,7 +9,7 @@ PR =3D "r4"
 PE =3D "1"
 SRCREV =3D "206"
=20
-DEPENDS =3D "curl dbus dbus-glib gtk+ libnotify libxrandr notification-dae=
mon"
+DEPENDS =3D "curl dbus dbus-glib gtk+ libglade libnotify libxrandr notific=
ation-daemon"
 RDEPENDS_${PN} =3D "notification-daemon"
=20
 SRC_URI =3D "svn://accelges.googlecode.com/svn/;module=3Dtrunk;proto=3Dhtt=
p"
--=20
1.7.2.3

--=-gLaJIZKtNKzTVG2rhtB6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzNnZAACgkQPX1aK2wOHVhZcwCfdGGntF1rKzi9oV9cbN0/RLp9
QBsAn3E7Y5WtRk7Crz0Q4jcDvrOcJENA
=lb2q
-----END PGP SIGNATURE-----

--=-gLaJIZKtNKzTVG2rhtB6--
