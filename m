Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PR4Dz-00087e-KS for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 15:45:32 +0100
Received: from g225083164.adsl.alicedsl.de ([92.225.83.164]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PR4CX-0004Ua-OG for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 14:44:01 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Dec 2010 15:44:00 +0100
Message-ID: <1291992240.3970.74.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gypsy: add `bluez4` to `DEPENDS` instead of `bluez-libs`
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
X-List-Received-Date: Fri, 10 Dec 2010 14:45:32 -0000
X-Groupsio-MsgNum: 27072
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-sqlvRKGmJU/GuJbjLO+7"

--=-sqlvRKGmJU/GuJbjLO+7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 10 Dec 2010 15:17:07 +0100

Task `configure` when running `bitbake gypsy` failed with the following err=
or.

        checking pkg-config is at least version 0.9.0... yes
        checking for GYPSY... configure: error: Package requirements (glib-=
2.0 dbus-glib-1 >=3D 0.60 bluez) were not met:
       =20
        No package 'bluez' found
       =20
        Consider adjusting the PKG_CONFIG_PATH environment variable if you
        installed software in a non-standard prefix.
       =20
        Alternatively, you may set the environment variables GYPSY_CFLAGS
        and GYPSY_LIBS to avoid the need to call pkg-config.
        See the pkg-config man page for more details.
       =20
        ERROR: Function do_configure failed

`bluez4` is needed in the `DEPENDS` list instead of `bluez-libs`.

This patch is build tested with the following configurations.

        Build Configuration:
        BB_VERSION        =3D "1.10.0"
        METADATA_BRANCH   =3D "org.openembedded.dev"
        METADATA_REVISION =3D "a3f3bc0"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-uclibceabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "minimal-uclibc"
        DISTRO_VERSION    =3D "dev-snapshot-20101210"
        TARGET_FPU        =3D "hard"

        Build Configuration:
        BB_VERSION        =3D "1.10.0"
        METADATA_BRANCH   =3D "org.openembedded.dev"
        METADATA_REVISION =3D "a3f3bc0"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-gnueabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "minimal"
        DISTRO_VERSION    =3D "dev-snapshot-20101210"
        TARGET_FPU        =3D "hard"

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/gypsy/gypsy.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gypsy/gypsy.inc b/recipes/gypsy/gypsy.inc
index 793fee4..eab062c 100644
--- a/recipes/gypsy/gypsy.inc
+++ b/recipes/gypsy/gypsy.inc
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "GPS Controlling Daemon"
 LICENSE =3D "GPL"
 SECTION =3D "x11"
-DEPENDS =3D "glib-2.0 dbus-glib bluez-libs libxslt-native"
+DEPENDS =3D "glib-2.0 dbus-glib bluez4 libxslt-native"
=20
 inherit autotools pkgconfig
=20
--=20
1.7.2.3


--=-sqlvRKGmJU/GuJbjLO+7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0CPLAACgkQPX1aK2wOHVj9JACcD2QPWc6SUnFKSOHHkdWNuhqK
zYMAnjMSwUDRfLLUlTXk+OMk/m/4fel1
=tPhM
-----END PGP SIGNATURE-----

--=-sqlvRKGmJU/GuJbjLO+7--
