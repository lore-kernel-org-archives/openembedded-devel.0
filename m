Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PYctb-0002t3-P0 for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 12:11:43 +0100
Received: from f053039212.adsl.alicedsl.de ([78.53.39.212]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PYctL-0000nI-R0 for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 11:11:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Dec 2010 12:11:26 +0100
Message-ID: <1293793886.6161.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] hamlib: fix indentation and whitespace; move `SRC_URI[*sum]` to common place
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
X-List-Received-Date: Fri, 31 Dec 2010 11:11:43 -0000
X-Groupsio-MsgNum: 27601
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Wg9Am8XACnuygvBn24qC"

--=-Wg9Am8XACnuygvBn24qC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 31 Dec 2010 12:02:46 +0100

With this patch using these recipes as templates in the future will not pas=
s on these cosmetic errors.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/sdr/hamlib_1.2.10.bb |   10 ++++------
 recipes/sdr/hamlib_1.2.12.bb |    6 ++----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/recipes/sdr/hamlib_1.2.10.bb b/recipes/sdr/hamlib_1.2.10.bb
index 311eb44..76b8dda 100644
--- a/recipes/sdr/hamlib_1.2.10.bb
+++ b/recipes/sdr/hamlib_1.2.10.bb
@@ -4,6 +4,8 @@ LICENSE =3D "GPLv2"
 DEPENDS =3D "swig-native perl python virtual/libusb0 tcl gnuradio"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/hamlib/hamlib-${PV}.tar.gz"
+SRC_URI[md5sum] =3D "29f0d30779a8ffe0444eb523a6ad8344"
+SRC_URI[sha256sum] =3D "9b50825666519b0b86469f1988a0de09ce2ffc08fa221f9aa4=
0d18c7b7f6c651"
=20
 inherit autotools
=20
@@ -19,8 +21,8 @@ do_compile_prepend() {
 	for i in $(find ${S} -name "Makefile") ; do
 		sed -i -e 's:${STAGING_LIBDIR_NATIVE}:${STAGING_LIBDIR}:g' \
 		       -e s:-L/usr/local/lib::g \
-			   -e 's:\"$(CC)\":\"${CC}\" LD=3D\"${LD}\" LDFLAGS=3D\"${LDFLAGS}\":g'=
 \
-		       -e s:${STAGING_INCDIR_NATIVE}/python2.6:${STAGING_INCDIR}/python2=
.6:g $i=20
+		       -e 's:\"$(CC)\":\"${CC}\" LD=3D\"${LD}\" LDFLAGS=3D\"${LDFLAGS}\"=
:g' \
+		       -e s:${STAGING_INCDIR_NATIVE}/python2.6:${STAGING_INCDIR}/python2=
.6:g $i
 	done
 }
=20
@@ -37,7 +39,3 @@ python populate_packages_prepend () {
 	do_split_packages(d, hamlib_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'hamlib =
%s development package', extra_depends=3D'${PN}-dev')
 	do_split_packages(d, hamlib_libdir, '^lib(.*)\.so\.*', 'lib%s', 'hamlib %=
s library', extra_depends=3D'', allow_links=3DTrue)
 }
-
-
-SRC_URI[md5sum] =3D "29f0d30779a8ffe0444eb523a6ad8344"
-SRC_URI[sha256sum] =3D "9b50825666519b0b86469f1988a0de09ce2ffc08fa221f9aa4=
0d18c7b7f6c651"
diff --git a/recipes/sdr/hamlib_1.2.12.bb b/recipes/sdr/hamlib_1.2.12.bb
index 69e5e6e..f2774bf 100644
--- a/recipes/sdr/hamlib_1.2.12.bb
+++ b/recipes/sdr/hamlib_1.2.12.bb
@@ -17,8 +17,8 @@ do_compile_prepend() {
 	for i in $(find ${S} -name "Makefile") ; do
 		sed -i -e 's:${STAGING_LIBDIR_NATIVE}:${STAGING_LIBDIR}:g' \
 		       -e s:-L/usr/local/lib::g \
-			   -e 's:\"$(CC)\":\"${CC}\" LD=3D\"${LD}\" LDFLAGS=3D\"${LDFLAGS}\":g'=
 \
-		       -e s:${STAGING_INCDIR_NATIVE}/python2.6:${STAGING_INCDIR}/python2=
.6:g $i=20
+		       -e 's:\"$(CC)\":\"${CC}\" LD=3D\"${LD}\" LDFLAGS=3D\"${LDFLAGS}\"=
:g' \
+		       -e s:${STAGING_INCDIR_NATIVE}/python2.6:${STAGING_INCDIR}/python2=
.6:g $i
 	done
 }
=20
@@ -35,5 +35,3 @@ python populate_packages_prepend () {
 	do_split_packages(d, hamlib_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'hamlib =
%s development package', extra_depends=3D'${PN}-dev')
 	do_split_packages(d, hamlib_libdir, '^lib(.*)\.so\.*', 'lib%s', 'hamlib %=
s library', extra_depends=3D'', allow_links=3DTrue)
 }
-
-
--=20
1.7.2.3

--=-Wg9Am8XACnuygvBn24qC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0dul4ACgkQPX1aK2wOHViTnQCZAcKRVeORkiB+kz+6ga7jGt1K
7nAAoIr/HYpXqaSkifTEAZ1AcKBuICuP
=+Ui6
-----END PGP SIGNATURE-----

--=-Wg9Am8XACnuygvBn24qC--
