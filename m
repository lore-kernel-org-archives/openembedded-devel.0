Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBoq5-0001fy-5J for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 15:50:05 +0200
Received: from f053044028.adsl.alicedsl.de ([78.53.44.28]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBooI-0006Nb-5E for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 13:48:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 15:47:45 +0200
Message-ID: <1303134465.3910.63.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH 1/2] pkgconfig: refactor to include file `pkgconfig-0.23.inc`
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
X-List-Received-Date: Mon, 18 Apr 2011 13:50:05 -0000
X-Groupsio-MsgNum: 31284
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-em2txRbmBr55KqlwD28m"

--=-em2txRbmBr55KqlwD28m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 17 Apr 2011 22:44:04 +0200

In pkg-config releases after 0.23 no patches need to be applied and OE defa=
ults can be used. Since `pkgconfig-{native,sdk}` also need the common bits =
factor those out into `pkgconfig-0.23.inc`.

This patch is build tested using `angstrom-2010.x` and `minimal{,-uclibc}` =
for `MACHINE =3D "beagleboard"`.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/pkgconfig/pkgconfig-0.23.inc       |   14 ++++++++++++++
 recipes/pkgconfig/pkgconfig-native_0.23.bb |    6 +-----
 recipes/pkgconfig/pkgconfig-sdk_0.23.bb    |    6 +-----
 recipes/pkgconfig/pkgconfig.inc            |   11 +++--------
 recipes/pkgconfig/pkgconfig_0.23.bb        |    7 ++-----
 5 files changed, 21 insertions(+), 23 deletions(-)
 create mode 100644 recipes/pkgconfig/pkgconfig-0.23.inc

diff --git a/recipes/pkgconfig/pkgconfig-0.23.inc b/recipes/pkgconfig/pkgco=
nfig-0.23.inc
new file mode 100644
index 0000000..5f87d28
--- /dev/null
+++ b/recipes/pkgconfig/pkgconfig-0.23.inc
@@ -0,0 +1,14 @@
+require pkgconfig.inc
+
+SRC_URI +=3D " \
+            file://autofoo.patch \
+            file://sysrootfix.patch \
+            file://glibconfig-sysdefs.h \
+           "
+SRC_URI[md5sum] =3D "d922a88782b64441d06547632fd85744"
+SRC_URI[sha256sum] =3D "08a0e072d6a05419a58124db864f0685e6ac96e71b2875bf15=
ac12714e983b53"
+
+acpaths =3D "-I ."
+do_configure_prepend () {
+	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h glib-1.2.*/
+}
diff --git a/recipes/pkgconfig/pkgconfig-native_0.23.bb b/recipes/pkgconfig=
/pkgconfig-native_0.23.bb
index f5f44ac..309077a 100644
--- a/recipes/pkgconfig/pkgconfig-native_0.23.bb
+++ b/recipes/pkgconfig/pkgconfig-native_0.23.bb
@@ -1,11 +1,7 @@
-require pkgconfig.inc
+require pkgconfig-0.23.inc
 FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/pkgconfig-${=
PV}"
=20
 PR =3D "${INC_PR}.1"
=20
-S =3D "${WORKDIR}/pkg-config-${PV}/"
 inherit native
 DEPENDS =3D ""
-
-SRC_URI[md5sum] =3D "d922a88782b64441d06547632fd85744"
-SRC_URI[sha256sum] =3D "08a0e072d6a05419a58124db864f0685e6ac96e71b2875bf15=
ac12714e983b53"
diff --git a/recipes/pkgconfig/pkgconfig-sdk_0.23.bb b/recipes/pkgconfig/pk=
gconfig-sdk_0.23.bb
index cbe6b81..4efb7bd 100644
--- a/recipes/pkgconfig/pkgconfig-sdk_0.23.bb
+++ b/recipes/pkgconfig/pkgconfig-sdk_0.23.bb
@@ -1,11 +1,7 @@
-require pkgconfig.inc
+require pkgconfig-0.23.inc
 FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/pkgconfig-${=
PV}"
=20
 PR =3D "${INC_PR}.1"
=20
-S =3D "${WORKDIR}/pkg-config-${PV}/"
 inherit sdk
 DEPENDS =3D ""
-
-SRC_URI[md5sum] =3D "d922a88782b64441d06547632fd85744"
-SRC_URI[sha256sum] =3D "08a0e072d6a05419a58124db864f0685e6ac96e71b2875bf15=
ac12714e983b53"
diff --git a/recipes/pkgconfig/pkgconfig.inc b/recipes/pkgconfig/pkgconfig.=
inc
index 4edad6a..e6fa5f1 100644
--- a/recipes/pkgconfig/pkgconfig.inc
+++ b/recipes/pkgconfig/pkgconfig.inc
@@ -5,22 +5,17 @@ It replaces the ubiquitous *-config scripts you may have =
\
 seen with a single tool."
 HOMEPAGE =3D "http://pkg-config.freedesktop.org/wiki/"
 LICENSE =3D "GPLv2+"
+DEPENDS =3D "glib-2.0"
 INC_PR =3D "r8"
=20
 SRC_URI =3D "http://pkgconfig.freedesktop.org/releases/pkg-config-${PV}.ta=
r.gz \
-           file://autofoo.patch \
-           file://sysrootfix.patch \
-           file://glibconfig-sysdefs.h"
+          "
=20
+# Setting `S` is needed, since the recipe name is `pkgconfig` instead of `=
pkg-config`.
 S =3D "${WORKDIR}/pkg-config-${PV}/"
=20
 inherit autotools
=20
-acpaths =3D "-I ."
-do_configure_prepend () {
-	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h glib-1.2.*/
-}
-
 do_install_append() {
 	install -d -m 0755 ${D}${libdir}/pkgconfig
 }
diff --git a/recipes/pkgconfig/pkgconfig_0.23.bb b/recipes/pkgconfig/pkgcon=
fig_0.23.bb
index 39f7010..3d8fe6c 100644
--- a/recipes/pkgconfig/pkgconfig_0.23.bb
+++ b/recipes/pkgconfig/pkgconfig_0.23.bb
@@ -1,9 +1,6 @@
-require pkgconfig.inc
+require ${PN}.inc
+require ${P}.inc
=20
 PR =3D "${INC_PR}.3"
=20
-DEPENDS +=3D "glib-2.0"
 EXTRA_OECONF =3D "--with-installed-glib"
-
-SRC_URI[md5sum] =3D "d922a88782b64441d06547632fd85744"
-SRC_URI[sha256sum] =3D "08a0e072d6a05419a58124db864f0685e6ac96e71b2875bf15=
ac12714e983b53"
--=20
1.7.4.4

--=-em2txRbmBr55KqlwD28m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2sQQEACgkQPX1aK2wOHVisswCeK41SLipLu+JWvHElufq/+2r0
KJYAnjy3AYYaytbrfHaJ+BbuDEXoVfwU
=GIL6
-----END PGP SIGNATURE-----

--=-em2txRbmBr55KqlwD28m--
