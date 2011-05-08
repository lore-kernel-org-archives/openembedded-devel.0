Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJ1Uo-0003tb-6h for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 12:45:54 +0200
Received: from f053040243.adsl.alicedsl.de ([78.53.40.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJ1TN-0005Hv-KU for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 10:44:26 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 08 May 2011 12:43:11 +0200
Message-ID: <1304851391.4124.50.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] networkmanager: remove versions 0.7, 0.7olpc, 0.7.1, 0.7.1.997
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
X-List-Received-Date: Sun, 08 May 2011 10:45:54 -0000
X-Groupsio-MsgNum: 31733
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-dX2cMEPXTCGOCgibsJM/"

--=-dX2cMEPXTCGOCgibsJM/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sat, 7 May 2011 16:08:01 +0200

Using `angstrom-2010.x`, `minimal` or `minimal-uclibc` for `MACHINE =3D "be=
agleboard"` task configure fails with the following error.

	| checking for UUID... yes
	| checking for POLKIT... no
	| configure: error: Package requirements (polkit-dbus) were not met:
	|
	| No package 'polkit-dbus' found
	|
	| Consider adjusting the PKG_CONFIG_PATH environment variable if you
	| installed software in a non-standard prefix.
	|
	| Alternatively, you may set the environment variables POLKIT_CFLAGS
	| and POLKIT_LIBS to avoid the need to call pkg-config.
	| See the pkg-config man page for more details.
	NOTE: package networkmanager-0.7.1.997-r1: task do_configure: Failed

The corresponding recipes `network-manager-applet` and `networkmanager-open=
vpn` are also removed.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
`git format-patch -1 -s -M -C -C -C` was used to create this patch.
---
 .../network-manager-applet_0.7.1.997.bb            |   30 ----------------=
-
 .../networkmanager/network-manager-applet_0.7.1.bb |   31 ----------------=
-
 .../networkmanager/networkmanager-openvpn_0.7.1.bb |   32 ----------------=
--
 recipes/networkmanager/networkmanager_0.7.1.997.bb |   35 ----------------=
----
 recipes/networkmanager/networkmanager_0.7.bb       |   28 ----------------
 recipes/networkmanager/networkmanager_0.7olpc.bb   |   11 ------
 6 files changed, 0 insertions(+), 167 deletions(-)
 delete mode 100644 recipes/networkmanager/network-manager-applet_0.7.1.997=
.bb
 delete mode 100644 recipes/networkmanager/network-manager-applet_0.7.1.bb
 delete mode 100644 recipes/networkmanager/networkmanager-openvpn_0.7.1.bb
 delete mode 100644 recipes/networkmanager/networkmanager_0.7.1.997.bb
 delete mode 100644 recipes/networkmanager/networkmanager_0.7.bb
 delete mode 100644 recipes/networkmanager/networkmanager_0.7olpc.bb

diff --git a/recipes/networkmanager/network-manager-applet_0.7.1.997.bb b/r=
ecipes/networkmanager/network-manager-applet_0.7.1.997.bb
deleted file mode 100644
index 3f02e9e..0000000
--- a/recipes/networkmanager/network-manager-applet_0.7.1.997.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION =3D "GTK+ applet for NetworkManager"=20
-LICENSE =3D "GPL"
-DEPENDS =3D "policykit-gnome libnotify networkmanager dbus-glib libglade g=
conf gnome-keyring"
-RDEPENDS_${PN} =3D "networkmanager"
-PR =3D "r1"
-
-inherit gnome
-
-SRC_URI +=3D "file://nm-applet.conf"
-
-do_configure_append() {
-        rm config.log
-        # Sigh... --enable-compile-warnings=3Dno doesn't actually turn off=
 -Werror
-        for i in $(find ${S} -name "Makefile") ; do
-            sed -i -e s:-Werror::g $i
-        done
-}
-
-# Hack around dbus a_console problems
-do_install_append() {
-	install -m 0644 ${WORKDIR}/nm-applet.conf ${D}${sysconfdir}/dbus-1/system=
.d/
-}
-
-FILES_${PN} +=3D "${datadir}/nm-applet/ \
-        ${datadir}/gnome-vpn-properties/ \
-        ${datadir}/gnome/autostart/ \
-        "
-
-SRC_URI[archive.md5sum] =3D "3183f5ae3553da0ce9c381dadbcc19e0"
-SRC_URI[archive.sha256sum] =3D "34316707a323b883f347b2566fd2dc7a3134b2bf43=
2fb3a8b31d88829b0947e3"
diff --git a/recipes/networkmanager/network-manager-applet_0.7.1.bb b/recip=
es/networkmanager/network-manager-applet_0.7.1.bb
deleted file mode 100644
index 8c2440c..0000000
--- a/recipes/networkmanager/network-manager-applet_0.7.1.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION =3D "GTK+ applet for NetworkManager"=20
-LICENSE =3D "GPL"
-DEPENDS =3D "policykit-gnome libnotify networkmanager dbus-glib libglade g=
conf gnome-keyring"
-RDEPENDS_${PN} =3D "networkmanager"
-
-PR =3D "r3"
-
-inherit gnome
-
-SRC_URI +=3D "file://nm-applet.conf"
-
-do_configure_append() {
-        rm config.log
-        # Sigh... --enable-compile-warnings=3Dno doesn't actually turn off=
 -Werror
-        for i in $(find ${S} -name "Makefile") ; do
-            sed -i -e s:-Werror::g $i
-        done
-}
-
-# Hack around dbus a_console problems
-do_install_append() {
-	install -m 0644 ${WORKDIR}/nm-applet.conf ${D}${sysconfdir}/dbus-1/system=
.d/
-}
-
-FILES_${PN} +=3D "${datadir}/nm-applet/ \
-        ${datadir}/gnome-vpn-properties/ \
-        ${datadir}/gnome/autostart/ \
-        "
-
-SRC_URI[archive.md5sum] =3D "d90a997e3e2051ce8866fe24f765141f"
-SRC_URI[archive.sha256sum] =3D "b22a90e6252d798b3889843910a016d185f9e87dd2=
3e203003b1072013f670a6"
diff --git a/recipes/networkmanager/networkmanager-openvpn_0.7.1.bb b/recip=
es/networkmanager/networkmanager-openvpn_0.7.1.bb
deleted file mode 100644
index 1fd2fba..0000000
--- a/recipes/networkmanager/networkmanager-openvpn_0.7.1.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION =3D "NetworkManager"
-SECTION =3D "net/misc"
-LICENSE =3D "GPL"
-PRIORITY =3D "optional"
-DEPENDS =3D "networkmanager libnl dbus dbus-glib hal wireless-tools policy=
kit gnutls util-linux-ng ppp"
-RDEPENDS_${PN} =3D "wpa-supplicant dhcp-client \
-           ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)}=
 \
-           "
-
-EXTRA_OECONF =3D " \
-		--with-distro=3Ddebian \
-		--with-crypto=3Dgnutls \
-		--disable-more-warnings"
-
-inherit autotools pkgconfig
-
-PR =3D "r2"
-
-SRC_URI +=3D "http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openvp=
n/0.7/NetworkManager-openvpn-${PV}.tar.bz2 \
-"
-
-S =3D "${WORKDIR}/NetworkManager-openvpn-${PV}"
-
-FILES_${PN} +=3D " \
-		${libdir}/NetworkManager/*.so \
-		${datadir}/gnome-vpn-properties \
-		${datadir}/icons "
-
-
-
-SRC_URI[md5sum] =3D "3637145716d5a2d55af0d713e4f05c68"
-SRC_URI[sha256sum] =3D "7c6a7b9b8c6ccf3e2fbf2431b9fb2035f99e1d78065f3344f6=
67e2f108f38d5b"
diff --git a/recipes/networkmanager/networkmanager_0.7.1.997.bb b/recipes/n=
etworkmanager/networkmanager_0.7.1.997.bb
deleted file mode 100644
index 812f101..0000000
--- a/recipes/networkmanager/networkmanager_0.7.1.997.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-require networkmanager-0.7.inc
-
-PR =3D "r1"
-
-SRC_URI +=3D " \
-    file://remove-gtk-doc-make.patch \
-    file://nm-system-settings.conf \
-    file://NetworkManager \
-    file://gtk-doc.make \
-"
-
-
-do_configure_prepend() {
-    cp ${WORKDIR}/gtk-doc.make ${S}/
-    echo "EXTRA_DIST =3D version.xml" > gnome-doc-utils.make
-    sed -i -e 's:man \\:man:' -e s:docs::g ${S}/Makefile.am
-    sed -i -e /^docs/d ${S}/configure.ac
-}
-
-
-S =3D "${WORKDIR}/NetworkManager-${PV}"
-
-do_install_append () {
-	install -d ${D}/etc/NetworkManager/
-	install -m 0644 ${WORKDIR}/nm-system-settings.conf ${D}/etc/NetworkManage=
r/
-	install -m 0755 ${WORKDIR}/NetworkManager ${D}/etc/init.d
-=09
-	# Install an empty VPN folder as nm-connection-editor will happily segfau=
lt without it :o.
-	# With or without VPN support built in ;).
-	install -d ${D}/etc/NetworkManager/VPN
-}
-
-
-SRC_URI[md5sum] =3D "12f12b2586043c21c3508b05e7994ba2"
-SRC_URI[sha256sum] =3D "a62a0f45d156cb190dd2ee3176aa3af4bf7b35c23a09ac65a3=
09c9dc5af87826"
diff --git a/recipes/networkmanager/networkmanager_0.7.bb b/recipes/network=
manager/networkmanager_0.7.bb
deleted file mode 100644
index 64fdace..0000000
--- a/recipes/networkmanager/networkmanager_0.7.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-require networkmanager-0.7.inc
-
-PV =3D "0.7"
-PR =3D "r10"
-
-SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/0.7/Net=
workManager-0.7.0.tar.bz2 \
-	file://remove-gtk-doc-make.patch \
-	file://008-BACKEND-debian-fallback-to-generic-loopback.loom.patch \
-	file://02-dbus_access_network_manager.patch \
-	file://add_probe_for_v250_modems.patch \
-	file://cx3110_bring_up.patch \
-	file://nm-system-settings.conf \
-	file://NetworkManager \
-"
-
-SRC_URI_append_mamona +=3D " file://disable_wireless_by_default.patch "
-
-S =3D "${WORKDIR}/NetworkManager-0.7.0"
-
-do_install_append () {
-        install -d ${D}/etc/NetworkManager/
-        install -m 0644 ${WORKDIR}/nm-system-settings.conf ${D}/etc/Networ=
kManager/
-	install -m 0755 ${WORKDIR}/NetworkManager ${D}/etc/init.d
-}
-
-
-SRC_URI[md5sum] =3D "64f780e7f95c252eaaed0201c3d9a4ca"
-SRC_URI[sha256sum] =3D "281234116b99b4c4b45fde038a435a0d26b7ee55beac0c3511=
86b3f12c301659"
diff --git a/recipes/networkmanager/networkmanager_0.7olpc.bb b/recipes/net=
workmanager/networkmanager_0.7olpc.bb
deleted file mode 100644
index 16cf9c5..0000000
--- a/recipes/networkmanager/networkmanager_0.7olpc.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require networkmanager-pre0.7.inc
-
-PR =3D "r2"
-PV =3D "0.7olpc+git"
-
-DEFAULT_PREFERENCE =3D "-1"
-
-SRC_URI +=3D "git://dev.laptop.org/users/sjoerd/NetworkManager.git;protoco=
l=3Dgit;branch=3Dolpc-patches;tag=3Df1fa6c27710196b7327402c59b2c55d920a12bb=
0 \
-            file://define_kernel_types_for_old_linux_headers_and_warn_func=
tions_from_glib_2_16.patch \
-           "
-S =3D "${WORKDIR}/git"
--=20
1.7.4.4

--=-dX2cMEPXTCGOCgibsJM/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3Gc78ACgkQPX1aK2wOHVgrNwCdGkTKi8XtRD8loUZSuJ8jKURC
6P4An1AxgvrnuGOHot3b8RUQJqbIf1ty
=N8b8
-----END PGP SIGNATURE-----

--=-dX2cMEPXTCGOCgibsJM/--
