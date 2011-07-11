Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QgDur-0004sY-Rp for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 12:40:41 +0200
Received: from f053040213.adsl.alicedsl.de ([78.53.40.213]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QgDrZ-00009J-If for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 10:37:17 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jul 2011 12:36:46 +0200
Message-ID: <1310380606.4187.13.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH] angstrom: remove `conf/distro/include/angstrom-2008-preferred-versions.inc`
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
X-List-Received-Date: Mon, 11 Jul 2011 10:40:42 -0000
X-Groupsio-MsgNum: 33108
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-IWuNhcbMOb7kE45pJOe3"

--=-IWuNhcbMOb7kE45pJOe3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 11 Jul 2011 12:30:00 +0200

`angstrom-2008.1` is not supported anymore since commit 67a7c91a [1].

	commit 67a7c91a4eeed0a5b48f99d98ec9bb54ba6ea120
	Author: Koen Kooi <koen@openembedded.org>
	Date:   Wed Mar 9 14:51:10 2011 +0100

		  angstrom 2008.1: remove from .dev

		  This will be maintained in the 2011.03-maintenance branch

		  Signed-off-by: Koen Kooi <koen@openembedded.org>

`angstrom-2008-preferred-versions.inc` is obsolete now and is not used anyw=
here.

	$ git grep 'angstrom-2008-preferred-versions.inc'

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D67a7c91=
a4eeed0a5b48f99d98ec9bb54ba6ea120

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../include/angstrom-2008-preferred-versions.inc   |   89 ----------------=
----
 1 files changed, 0 insertions(+), 89 deletions(-)
 delete mode 100644 conf/distro/include/angstrom-2008-preferred-versions.in=
c

diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/con=
f/distro/include/angstrom-2008-preferred-versions.inc
deleted file mode 100644
index d79f64b..0000000
--- a/conf/distro/include/angstrom-2008-preferred-versions.inc
+++ /dev/null
@@ -1,89 +0,0 @@
-ANGSTROM_QT_VERSION ?=3D "4.6.3"
-CE_VERSION ?=3D "latest"
-
-require conf/distro/include/angstrom-codec-engine-${CE_VERSION}-preferred-=
versions.inc
-
-PREFERRED_VERSION_autoconf =3D "2.65"
-PREFERRED_VERSION_autoconf-native =3D "2.65"
-PREFERRED_VERSION_automake =3D "1.11.1"
-PREFERRED_VERSION_automake-native =3D "1.11.1"
-PREFERRED_VERSION_busybox 	=3D "1.13.2"
-PREFERRED_VERSION_cairo		=3D "1.10.0"
-PREFERRED_VERSION_dbus 		=3D "1.2.24"
-PREFERRED_VERSION_dropbear      =3D "0.51"
-PREFERRED_VERSION_fontconfig	=3D "2.8.0"
-PREFERRED_VERSION_glib-2.0 	=3D "2.24.1"
-PREFERRED_VERSION_glib-2.0-native =3D "2.24.1"
-PREFERRED_VERSION_glibmm =3D "2.24.0"
-PREFERRED_VERSION_gst-pulse 	=3D "0.9.7"
-PREFERRED_VERSION_gtk+		=3D "2.20.1"
-PREFERRED_VERSION_gtk+-native	=3D "2.20.1"
-PREFERRED_VERSION_gtkmm		=3D "2.20.0"
-PREFERRED_VERSION_gvfs		=3D "1.6.6"
-PREFERRED_VERSION_hal		=3D "0.5.14"
-PREFERRED_VERSION_libgemwidget	=3D "1.0"
-PREFERRED_VERSION_libgpephone	=3D "0.4"
-PREFERRED_VERSION_libsdl-x11	=3D "1.2.14"
-PREFERRED_VERSION_libsoup-2.4   =3D "2.32.2"
-PREFERRED_VERSION_libtool 	=3D "2.2.6b"
-PREFERRED_VERSION_libtool-native =3D "2.2.6b"
-PREFERRED_VERSION_libtool-cross	=3D "2.2.6b"
-PREFERRED_VERSION_libtool-sdk	=3D "2.2.6b"
-PREFERRED_VERSION_lighttpd      =3D "1.4.26"
-PREFERRED_VERSION_mesa          =3D "7.6"
-PREFERRED_VERSION_mesa-dri      =3D "7.6"
-PREFERRED_VERSION_mesa-xlib     =3D "7.6"
-PREFERRED_VERSION_mythplugins   =3D "0.23"
-PREFERRED_VERSION_myththemes    =3D "0.23"
-PREFERRED_VERSION_mythtv        =3D "0.23"
-PREFERRED_VERSION_mplayer       =3D "0.0+1.0rc3+svnr%"
-PREFERRED_VERSION_network-manager-applet =3D "0.8.1"
-PREFERRED_VERSION_networkmanager =3D "0.8.1"
-PREFERRED_VERSION_openssl =3D "1.0.0d"
-PREFERRED_VERSION_openssl-native =3D "1.0.0d"
-PREFERRED_VERSION_pango 	=3D "1.24.4"
-PREFERRED_VERSION_pango-native     =3D "1.24.4"
-#PREFERRED_VERSION_pixman	=3D "0.13.2"
-PREFERRED_VERSION_pkgconfig	=3D "0.23"
-PREFERRED_VERSION_pkgconfig-native =3D "0.23"
-PREFERRED_VERSION_policykit     =3D "0.96"
-PREFERRED_VERSION_policykit-gnome =3D "0.96"
-PREFERRED_VERSION_pulseaudio 	=3D "0.9.15"
-PREFERRED_VERSION_python-pycairo =3D "1.8.0"
-PREFERRED_VERSION_qt4-tools-native =3D "${ANGSTROM_QT_VERSION}"
-PREFERRED_VERSION_qt4-tools-sdk =3D "${ANGSTROM_QT_VERSION}"
-PREFERRED_VERSION_qt4-embedded =3D "${ANGSTROM_QT_VERSION}"
-PREFERRED_VERSION_qt4-embedded-gles =3D "${ANGSTROM_QT_VERSION}"
-PREFERRED_VERSION_qt4-x11-free =3D "${ANGSTROM_QT_VERSION}"
-PREFERRED_VERSION_qt4-x11-free-gles =3D "${ANGSTROM_QT_VERSION}"
-
-PREFERRED_VERSION_samba		=3D "3.3.9"
-PREFERRED_VERSION_tiff 		=3D "3.9.4+4.0.0beta6"
-
-PREFERRED_VERSION_udev 		=3D "151"
-PREFERRED_VERSION_udev_libc-uclibc =3D "141"
-UDEV_GE_141 =3D "1"
-
-PREFERRED_VERSION_usbutils =3D "0.86"
-PREFERRED_VERSION_wpa-supplicant =3D "0.7.3"
-PREFERRED_VERSION_wget =3D "1.11.4"
-PREFERRED_VERSION_xserver-common =3D "1.33"
-PREFERRED_VERSION_xserver-kdrive =3D "1.4.0.90"
-PREFERRED_VERSION_xserver-nodm-init =3D "2.0"
-PREFERRED_VERSION_xserver-xorg =3D "1.7.4"
-
-#
-# meta-moblin package SRCREVs
-#
-SRCREV_pn-bickley ?=3D "de9431b7c6040bc3731157c05947159ad2c7a0a9"
-SRCREV_pn-json-glib ?=3D "930fdf4c4dff1f5310a946c2a9f5b6860f7c8ba8"
-SRCREV_pn-libccss ?=3D "92bc59e1d39302c8be500d53cb5dd8b05c2e4a15"
-SRCREV_pn-libgdbus ?=3D "aeab6e3c0185b271ca343b439470491b99cc587f"
-SRCREV_pn-librest ?=3D "14d35103d9649dc1e10c3e9ac2c690b3165c8184"
-SRCREV_pn-moblin-menus ?=3D "e1d63681739dd16195d005b3cf15752df294bd3c"
-SRCREV_pn-mojito ?=3D "0542c4b0e26c0e3b69c5ad1fa1898dc276fb9f48"
-SRCREV_pn-mozilla-headless-services ?=3D "c7873654894af6c7c6c01194d6185db4=
6667b81f"
-SRCREV_pn-mutter ?=3D "aff4cf110307e149d3497d20543cde27b9699758"
-SRCREV_pn-twitter-glib ?=3D "849bec29292df88590e0b2898b50b9b8d766817e"
-SRCREV_pn-xf86-video-psb ?=3D "b6b3bba06fe5a3fe0b1bd6e31a7369dd83812bab"
-
--=20
1.7.5.4

--=-IWuNhcbMOb7kE45pJOe3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4a0j4ACgkQPX1aK2wOHVgk8gCfVin08dzlkrxp053xCWI/sSIX
Gf0AnAonH2I5NLsixvVuhBeNorcBG8UH
=Sa8M
-----END PGP SIGNATURE-----

--=-IWuNhcbMOb7kE45pJOe3--
