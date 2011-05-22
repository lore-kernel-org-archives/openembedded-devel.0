Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QOFsR-0006Pe-Dz for openembedded-devel@lists.openembedded.org;
	Sun, 22 May 2011 23:07:55 +0200
Received: from f053035096.adsl.alicedsl.de ([78.53.35.96]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QOFpm-00012U-RM for openembedded-devel@lists.openembedded.org;
	Sun, 22 May 2011 21:05:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 May 2011 23:04:56 +0200
Message-ID: <1306098296.5994.89.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH 1/3] icedtea6-native: convert spaces to tabulators
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
X-List-Received-Date: Sun, 22 May 2011 21:07:55 -0000
X-Groupsio-MsgNum: 32238
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-T91F/Yec80V+GtamMdP0"

--=-T91F/Yec80V+GtamMdP0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 22 May 2011 21:56:18 +0200

Tabulators are mostly used in the recipes so the few spaces are converted t=
o tabulators to unify the style.

The format guidelines in the style guide [1] recommend to use spaces though=
.

[1] http://openembedded.org/index.php/Styleguide#Format_Guidelines

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/icedtea/icedtea6-native.inc       |   44 ++++++++++++++-----------=
---
 recipes/icedtea/icedtea6-native_1.7.10.bb |    2 +-
 recipes/icedtea/icedtea6-native_1.7.5.bb  |    2 +-
 recipes/icedtea/icedtea6-native_1.8.bb    |    8 ++--
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/recipes/icedtea/icedtea6-native.inc b/recipes/icedtea/icedtea6=
-native.inc
index 06da7c0..968bd4b 100644
--- a/recipes/icedtea/icedtea6-native.inc
+++ b/recipes/icedtea/icedtea6-native.inc
@@ -7,9 +7,9 @@ DEPENDS =3D "virtual/javac-native classpath-tools-native \
 	   virtual/java-native classpath-native \
 	   xalan-j-native xerces-j-native rhino-native \
 	   ant-native \
-           libx11-native xproto-native libxt-native libxext-native \
+	   libx11-native xproto-native libxt-native libxext-native \
 	   freetype-native zlib-native giflib-native jpeg-native \
-           zip-native \
+	   zip-native \
 	  "
=20
 inherit native java autotools
@@ -29,7 +29,7 @@ EXTRA_OECONF =3D "\
 	--disable-docs \
 	--disable-pulse-java \
 	--disable-plugin \
-        --disable-npplugin \
+	--disable-npplugin \
 	--disable-xrender \
 	\
 	--with-ecj=3D${STAGING_BINDIR_NATIVE}/ecj-bootstrap \
@@ -56,19 +56,19 @@ JDK_INSTALL_DIR =3D "${D}/${libdir_jvm}/${JDK_DIR}"
=20
 do_configure_prepend() {
=20
-        case "${TARGET_ARCH}" in
-                x86_64)
-                        libarch=3Damd64
-                ;;
-                i386|i486|i586|i686)
-                        libarch=3Dx86
-                ;;
-                *)
-                        arch=3D${TARGET_ARCH}
-                        libarch=3D${TARGET_ARCH}
-                ;;
-        esac
-=20
+	case "${TARGET_ARCH}" in
+		x86_64)
+			libarch=3Damd64
+		;;
+		i386|i486|i586|i686)
+			libarch=3Dx86
+		;;
+		*)
+			arch=3D${TARGET_ARCH}
+			libarch=3D${TARGET_ARCH}
+		;;
+	esac
+
 	chmod -R ug+w ${WORKDIR}/openjdk-src-dir
 	(cd ${WORKDIR}/openjdk-src-dir && sh ${S}/fsg.sh)
=20
@@ -132,13 +132,13 @@ do_compile() {
 		;;
 	esac
=20
-        echo "libarch ist ${libarch}"
+	echo "libarch ist ${libarch}"
=20
-        install -d openjdk-ecj/control/build/linux-$arch/hotspot/import/jr=
e/lib
-        if [ $libarch !=3D $arch ]; then
-                # Something is strange with the directoy naming. OpenJDK u=
ses both variants.
-                ln -sf $libarch openjdk-ecj/control/build/linux-$arch/hots=
pot/import/jre/lib/$arch
-        fi
+	install -d openjdk-ecj/control/build/linux-$arch/hotspot/import/jre/lib
+	if [ $libarch !=3D $arch ]; then
+		# Something is strange with the directoy naming. OpenJDK uses both varia=
nts.
+		ln -sf $libarch openjdk-ecj/control/build/linux-$arch/hotspot/import/jre=
/lib/$arch
+	fi
=20
=20
 	# First build hotspot to get a libjvm.so
diff --git a/recipes/icedtea/icedtea6-native_1.7.10.bb b/recipes/icedtea/ic=
edtea6-native_1.7.10.bb
index 77c6232..136a2b8 100644
--- a/recipes/icedtea/icedtea6-native_1.7.10.bb
+++ b/recipes/icedtea/icedtea6-native_1.7.10.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "\
 	file://icedtea-fix-jar-path.patch \
 	file://build-hacks-native.patch \
 	file://icedtea-sane-x86-arch-name.patch \
-        file://icedtea-javac-in.patch \
+	file://icedtea-javac-in.patch \
 	${ICEDTEA_PATCHES} \
 	"
 SRC_URI[ojdk.md5sum] =3D "078fe0ab744c98694decc77f2456c560"
diff --git a/recipes/icedtea/icedtea6-native_1.7.5.bb b/recipes/icedtea/ice=
dtea6-native_1.7.5.bb
index 373d1c4..a101f99 100644
--- a/recipes/icedtea/icedtea6-native_1.7.5.bb
+++ b/recipes/icedtea/icedtea6-native_1.7.5.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "\
 	file://icedtea-fix-jar-path.patch \
 	file://build-hacks-native.patch \
 	file://icedtea-sane-x86-arch-name.patch \
-        file://icedtea-javac-in.patch \
+	file://icedtea-javac-in.patch \
 	${ICEDTEA_PATCHES} \
 	"
 SRC_URI[ojdk.md5sum] =3D "078fe0ab744c98694decc77f2456c560"
diff --git a/recipes/icedtea/icedtea6-native_1.8.bb b/recipes/icedtea/icedt=
ea6-native_1.8.bb
index 67c2632..629b95f 100644
--- a/recipes/icedtea/icedtea6-native_1.8.bb
+++ b/recipes/icedtea/icedtea6-native_1.8.bb
@@ -39,9 +39,9 @@ ICEDTEA_PATCHES =3D "\
 	file://icedtea-ecj-disable-compilation.patch;apply=3Dno \
 	file://icedtea-ecj-fix-freetype.patch;apply=3Dno \
 	file://icedtea-ecj-fix-zlib.patch;apply=3Dno \
-        file://icedtea-hotspot-make-arch-sane-for-x86.patch;apply=3Dno \
-        file://icedtea-jdk-sane-x86-arch.patch;apply=3Dno \
-        file://icedtea-unbreak-float.patch;apply=3Dno \
+	file://icedtea-hotspot-make-arch-sane-for-x86.patch;apply=3Dno \
+	file://icedtea-jdk-sane-x86-arch.patch;apply=3Dno \
+	file://icedtea-unbreak-float.patch;apply=3Dno \
 	"
=20
 export DISTRIBUTION_PATCHES =3D "\
@@ -49,7 +49,7 @@ export DISTRIBUTION_PATCHES =3D "\
 	patches/icedtea-ecj-fix-freetype.patch \
 	patches/icedtea-ecj-fix-zlib.patch \
 	patches/icedtea-hotspot-make-arch-sane-for-x86.patch \
-        patches/icedtea-jdk-sane-x86-arch.patch \
+	patches/icedtea-jdk-sane-x86-arch.patch \
 	patches/icedtea-unbreak-float.patch \
 	"
=20
--=20
1.7.5.1

--=-T91F/Yec80V+GtamMdP0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3ZengACgkQPX1aK2wOHVgxAACfdWBX1ytIPmk46HSi5EN27QbO
m6wAn37PEyeyktsxZSZpJa2XdBwn4KHJ
=DP8Y
-----END PGP SIGNATURE-----

--=-T91F/Yec80V+GtamMdP0--
