Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QYEn5-0006dE-3A for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jun 2011 11:59:40 +0200
Received: from f053044243.adsl.alicedsl.de ([78.53.44.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QYEjj-00043e-QF; Sun, 19 Jun 2011 09:56:12 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jun 2011 11:56:08 +0200
Message-ID: <1308477368.18748.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH] shiboken: Add `apiextrator-native` to `DEPENDS`
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
X-List-Received-Date: Sun, 19 Jun 2011 09:59:40 -0000
X-Groupsio-MsgNum: 32747
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-7giL3e4Gk0AcLMPvP6Z2"

--=-7giL3e4Gk0AcLMPvP6Z2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 19 Jun 2011 11:45:37 +0200

Task configure fails with the following error message using `minimal{,-ucli=
bc}` for `MACHINE =3D "beagleboard"`.

	+ cmake . -DCMAKE_INSTALL_PREFIX:PATH=3D/usr -DCMAKE_INSTALL_SO_NO_EXE=3D0=
 -DCMAKE_TOOLCHAIN_FILE=3D/oe/build-minimal-uclibc/minimal-uclibc-dev/work/=
armv7a-oe-linux-uclibceabi/libshiboken-1.0.2-r1.1/toolchain.cmake -DCMAKE_V=
ERBOSE_MAKEFILE=3D1 -Wno-dev
	CMake Warning at cmake/Modules/FindQt4.cmake:351 (message):
		QT_LIBRARY_DIR:
	Call Stack (most recent call first):
		CMakeLists.txt:9 (find_package)

	CMake Warning at cmake/Modules/FindQt4.cmake:352 (message):
		QT_LIBINFIX:
	Call Stack (most recent call first):
		CMakeLists.txt:9 (find_package)

	CMake Warning at cmake/Modules/FindQt4.cmake:353 (message):
		QT_DIR_NAME:
	Call Stack (most recent call first):
		CMakeLists.txt:9 (find_package)

	CMake Error at CMakeLists.txt:10 (find_package):
		Could not find module FindApiExtractor.cmake or a configuration file for
		package ApiExtractor.

		Adjust CMAKE_MODULE_PATH to find FindApiExtractor.cmake or set
		ApiExtractor_DIR to the directory containing a CMake configuration file f=
or
		ApiExtractor.  The file will have one of the following names:

		  ApiExtractorConfig.cmake
		  apiextractor-config.cmake

	CMake Error at CMakeLists.txt:11 (find_package):
		Could not find module FindGeneratorRunner.cmake or a configuration file f=
or
		package GeneratorRunner.

		Adjust CMAKE_MODULE_PATH to find FindGeneratorRunner.cmake or set
		GeneratorRunner_DIR to the directory containing a CMake configuration fil=
e
		for GeneratorRunner.  The file will have one of the following names:

		  GeneratorRunnerConfig.cmake
		  generatorrunner-config.cmake

Adding `apiextrator-native` to `DEPENDS` fixes the error.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Simon Busch <morphis@gravedo.de>
---
Dear Simon,


unfortunately I am not able to test this, because of Qt4 build problems [1]=
. Could you please test this.


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/032978=
.html
---
 recipes/pyside/shiboken.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/pyside/shiboken.inc b/recipes/pyside/shiboken.inc
index d09953d..56901ab 100644
--- a/recipes/pyside/shiboken.inc
+++ b/recipes/pyside/shiboken.inc
@@ -4,7 +4,7 @@ HOMEPAGE =3D "http://www.pyside.org"
 LICENSE =3D "LGPL"
 INC_PR =3D "r1"
=20
-DEPENDS =3D "generatorrunner-native"
+DEPENDS =3D "apiextractor-native generatorrunner-native"
=20
 SRC_URI =3D "http://www.pyside.org/files/shiboken-${PV}.tar.bz2"
 S =3D "${WORKDIR}/shiboken-${PV}"
--=20
1.7.5.4

--=-7giL3e4Gk0AcLMPvP6Z2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk39x7gACgkQPX1aK2wOHViOWwCfbzAWDrqHCFxNt901oqnvGSi2
p10AoIXin7drCUO7QdqlsiNLFtAR08O5
=ZOOs
-----END PGP SIGNATURE-----

--=-7giL3e4Gk0AcLMPvP6Z2--
