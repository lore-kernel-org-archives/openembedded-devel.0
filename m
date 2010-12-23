Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PVnwB-0004Dg-RG for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 17:22:43 +0100
Received: from f053038033.adsl.alicedsl.de ([78.53.38.33]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PVnw4-00057a-T4 for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 16:22:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Dec 2010 17:22:35 +0100
Message-ID: <1293121355.3905.30.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] ffmpeg: replace tabulators with spaces for consistency
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
X-List-Received-Date: Thu, 23 Dec 2010 16:22:43 -0000
X-Groupsio-MsgNum: 27456
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Eg6/uGcPsGcjexsl4m/r"

--=-Eg6/uGcPsGcjexsl4m/r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 17 Dec 2010 13:27:02 +0100

`omapfbplay*.bb` recipes use tabulators consistently and therefore they are=
 not changed.

Use

	grep -e $'\t' ffmpeg_*bb

to find tabulators in Bash [1].


[1] http://www.claudiokuenzler.com/blog/99/tabulator-in-bash

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/ffmpeg/ffmpeg_0.4.9-pre1.bb |    2 +-
 recipes/ffmpeg/ffmpeg_0.5.bb        |    6 +++---
 recipes/ffmpeg/ffmpeg_git.bb        |   10 +++++-----
 recipes/ffmpeg/ffmpeg_svn.bb        |    2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes/ffmpeg/ffmpeg_0.4.9-pre1.bb b/recipes/ffmpeg/ffmpeg_0.=
4.9-pre1.bb
index 1ac8610..e6a7abe 100644
--- a/recipes/ffmpeg/ffmpeg_0.4.9-pre1.bb
+++ b/recipes/ffmpeg/ffmpeg_0.4.9-pre1.bb
@@ -6,7 +6,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/ffmpeg/ffmpeg-${PV}.tar.=
gz \
            file://configure.patch \
            file://gcc4.patch \
            file://soname.patch \
-	   file://Makefile-avformat-use-LDFLAGS.patch \
+           file://Makefile-avformat-use-LDFLAGS.patch \
            file://Makefile-add-liblame.patch \
            file://install-must-not-strip.patch \
           "
diff --git a/recipes/ffmpeg/ffmpeg_0.5.bb b/recipes/ffmpeg/ffmpeg_0.5.bb
index 07af21d..f3a6d21 100644
--- a/recipes/ffmpeg/ffmpeg_0.5.bb
+++ b/recipes/ffmpeg/ffmpeg_0.5.bb
@@ -8,9 +8,9 @@ DEFAULT_PREFERENCE =3D "1"
=20
 SRCREV_libswscale =3D "b2e1c8222eeef74b0ca8053b400957dd69e18e4d"
 SRC_URI =3D "http://ffmpeg.org/releases/ffmpeg-${PV}.tar.bz2 \
-	   file://armv4.patch \
+       file://armv4.patch \
        file://ffmpeg-arm-update.diff \
-	  "
+"
=20
 #S =3D "${WORKDIR}/git"
 B =3D "${S}/build.${HOST_SYS}.${TARGET_SYS}"
@@ -57,7 +57,7 @@ do_configure() {
         mkdir -p ${B}
         cd ${B}
         ${S}/configure ${EXTRA_OECONF}
-		sed -i -e s:Os:O4:g ${B}/config.h
+        sed -i -e s:Os:O4:g ${B}/config.h
 }
=20
=20
diff --git a/recipes/ffmpeg/ffmpeg_git.bb b/recipes/ffmpeg/ffmpeg_git.bb
index 5c84ea7..231b9cb 100644
--- a/recipes/ffmpeg/ffmpeg_git.bb
+++ b/recipes/ffmpeg/ffmpeg_git.bb
@@ -57,13 +57,13 @@ EXTRA_OECONF =3D " \
 do_configure() {
         sed -i -e s:'check_cflags -std=3Dc99'::g ${S}/configure
         cd ${S}
-	git clone git://git.mplayerhq.hu/libswscale || true
-	cd libswscale
-	git checkout ${SRCREV_libswscale} || true
-	cd ${S}
+        git clone git://git.mplayerhq.hu/libswscale || true
+        cd libswscale
+        git checkout ${SRCREV_libswscale} || true
+        cd ${S}
         mkdir -p ${B}
         cd ${B}
         ${S}/configure ${EXTRA_OECONF}
-		sed -i -e s:Os:O4:g ${B}/config.h
+        sed -i -e s:Os:O4:g ${B}/config.h
 }
=20
diff --git a/recipes/ffmpeg/ffmpeg_svn.bb b/recipes/ffmpeg/ffmpeg_svn.bb
index 573de03..ea0d757 100644
--- a/recipes/ffmpeg/ffmpeg_svn.bb
+++ b/recipes/ffmpeg/ffmpeg_svn.bb
@@ -56,6 +56,6 @@ do_configure() {
         mkdir -p ${B}
         cd ${B}
         ${S}/configure ${EXTRA_OECONF}
-		sed -i -e s:Os:O4:g ${B}/config.h
+        sed -i -e s:Os:O4:g ${B}/config.h
 }
=20
--=20
1.7.2.3

--=-Eg6/uGcPsGcjexsl4m/r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0Td0YACgkQPX1aK2wOHVhDTgCfZYvaV1prMnCb0LTxIqKkuhM1
7s8AnR5s/5aohNE6zRmUZhsVxCK1zeGW
=hPF1
-----END PGP SIGNATURE-----

--=-Eg6/uGcPsGcjexsl4m/r--
