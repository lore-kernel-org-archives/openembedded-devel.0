Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pbwz4-0007oZ-VF for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 16:15:06 +0100
Received: from f053039058.adsl.alicedsl.de ([78.53.39.58]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pbwye-0001QJ-Oy for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 15:14:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 09 Jan 2011 16:14:39 +0100
Message-ID: <1294586079.4036.63.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] libcap_1.10: remove `do_stage()`
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
X-List-Received-Date: Sun, 09 Jan 2011 15:15:07 -0000
X-Groupsio-MsgNum: 27840
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-vO46zPln+H6hKXYu18+h"

--=-vO46zPln+H6hKXYu18+h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 9 Jan 2011 15:59:33 +0100

Convert `libcap_1.10` to new staging system by removing `do_stage()` [1].

This change is build tested with the following configuration and `PREFERRED=
_BINUTILS_VERSION =3D "2.21"`.

        Build Configuration:
        BB_VERSION        =3D "1.10.2"
        METADATA_BRANCH   =3D "org.openembedded.dev"
        METADATA_REVISION =3D "224c193"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-uclibceabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "minimal-uclibc"
        DISTRO_VERSION    =3D "dev-snapshot-20110109"
        TARGET_FPU        =3D "soft"

[1] http://wiki.openembedded.org/index.php/Legacy_staging

Signed-off-by: Paul Menzel <paul@gw90.de>
---
 recipes/libcap/libcap_1.10.bb |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/recipes/libcap/libcap_1.10.bb b/recipes/libcap/libcap_1.10.bb
index e6ca393..af5600b 100644
--- a/recipes/libcap/libcap_1.10.bb
+++ b/recipes/libcap/libcap_1.10.bb
@@ -22,11 +22,5 @@ do_install() {
        oe_libinstall -s -C libcap libcap ${D}${libdir}
 }
=20
-do_stage() {
-       install -d ${STAGING_INCDIR}/sys
-       install -m 0644 libcap/include/sys/capability.h ${STAGING_INCDIR}/s=
ys/
-       oe_libinstall -s -C libcap libcap ${STAGING_LIBDIR}
-}
-
 SRC_URI[md5sum] =3D "4426a413128142cab89eb2e6f13d8571"
 SRC_URI[sha256sum] =3D "66c3f033fdc8f9ba0bd9d0ae2d1f2c11f9fa51bf0d1418e5cb=
75e29e6577a5bc"
--=20
1.7.2.3

--=-vO46zPln+H6hKXYu18+h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0p0N8ACgkQPX1aK2wOHVh4oACfZAqw/XIGoLFLyxPnuAPrhAOr
Z58AoIDiCBI9AwluxsVT1VsB+Fe7UlMz
=qaKM
-----END PGP SIGNATURE-----

--=-vO46zPln+H6hKXYu18+h--
