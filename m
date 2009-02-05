Received: from [83.222.24.113] (helo=smtp-13.masterhost.ru)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LV6Ht-0005hC-MU
	for openembedded-devel@openembedded.org; Thu, 05 Feb 2009 16:37:16 +0100
Received: (qmail 92828 invoked from network); 5 Feb 2009 15:36:30 -0000
Received: from unknown (HELO ?192.168.1.105?) (rik@osrc.info@80.246.246.162)
	by smtp1.masterhost.ru with SMTP; 5 Feb 2009 15:36:31 -0000
To: openembedded-devel@lists.openembedded.org
From: Roman I Khimov <roman@khimov.ru>
Date: Thu, 5 Feb 2009 18:36:16 +0300
MIME-Version: 1.0
Message-Id: <200902051836.25770.roman@khimov.ru>
Subject: [PATCH] New package: byacc
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
X-List-Received-Date: Thu, 05 Feb 2009 15:37:17 -0000
X-Groupsio-MsgNum: 7559
Content-Type: multipart/signed; boundary="nextPart2608679.oNTGlTOjkU";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2608679.oNTGlTOjkU
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello everyone.

The package is mostly intended to be built as native and then used to build=
=20
other packages. It's trivial and I thought it might be useful for someone=20
else too, hence, trying to push.

diff -puraN /void/byacc_20081225.bb packages/byacc/byacc_20081225.bb
=2D-- a/packages/byacc/byacc_20081225.bb	1970-01-01 03:00:00.000000000 +0300
+++ b/packages/byacc/byacc_20081225.bb	2009-02-03 22:51:24.811593078 +0300
@@ -0,0 +1,13 @@
+DESCRIPTION =3D "Berkeley Yacc"
+SECTION =3D "devel"
+LICENSE =3D "public domain"
+PR =3D "r0"
+
+SRC_URI =3D "ftp://invisible-island.net/byacc/byacc.tar.gz"
+EXTRA_OECONF +=3D "--program-transform-name=3D's,^,b,'"
+
+inherit autotools
+
+do_configure() {
+	oe_runconf
+}
diff -puraN /void/byacc-native_20081225.bb=20
packages/byacc/byacc-native_20081225.bb
=2D-- a/packages/byacc/byacc-native_20081225.bb	1970-01-01 03:00:00.0000000=
00=20
+0300
+++ b/packages/byacc/byacc-native_20081225.bb	2009-02-03 15:36:55.981948513=
=20
+0300
@@ -0,0 +1,4 @@
+SECTION =3D "devel"
+require byacc_${PV}.bb
+S =3D "${WORKDIR}/byacc-${PV}"
+inherit native
diff --git a/conf/checksums.ini b/conf/checksums.ini
index 8339981..07e3733 100644
=2D-- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -25042,3 +25042,6 @@=20
sha256=3D5cc1a53bb909922596bdd0fa967b654fe1bfbe0dcf1d34608f0b7c90e0c27867
 md5=3D5f7b88ebb2bcd7e8044328482d079661
 sha256=3Df57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
=20
+[ftp://invisible-island.net/byacc/byacc.tar.gz]
+md5=3Db9715b9a2867c221176b597e8f73cbc9
+sha256=3D1364c7fe382de659e8b9841a1736b645345a460d2f4302303e80c02235a2a575


=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2608679.oNTGlTOjkU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmLB3AACgkQXJ70z+XgVcNxNACg1BfFi+KD6DXLV52a9x0M5MX1
FmcAoKgOLSwC5k4pG1pt0BbZQ0Goti/h
=Diq3
-----END PGP SIGNATURE-----

--nextPart2608679.oNTGlTOjkU--
