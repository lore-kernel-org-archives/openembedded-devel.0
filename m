Received: from [83.222.24.104] (helo=smtp-4.masterhost.ru)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LV9JC-00032V-W0
	for openembedded-devel@openembedded.org; Thu, 05 Feb 2009 19:50:43 +0100
Received: (qmail 15960 invoked from network); 5 Feb 2009 18:50:06 -0000
Received: from unknown (HELO mate.hex) (rik@osrc.info@84.17.11.114)
	by smtp1.masterhost.ru with SMTP; 5 Feb 2009 18:50:08 -0000
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@openembedded.org
Date: Thu, 5 Feb 2009 21:50:04 +0300
User-Agent: KMail/1.9.9
References: <200902051836.25770.roman@khimov.ru>
	<200902052118.26879.roman@khimov.ru>
	<200902052142.50027.roman@khimov.ru>
In-Reply-To: <200902052142.50027.roman@khimov.ru>
MIME-Version: 1.0
Message-Id: <200902052150.04203.roman@khimov.ru>
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] New package: byacc
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
X-List-Received-Date: Thu, 05 Feb 2009 18:50:43 -0000
X-Groupsio-MsgNum: 7565
Content-Type: multipart/signed; boundary="nextPart2058716.Gk67M68K2f";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2058716.Gk67M68K2f
Content-Type: text/plain;
  charset="windows-1251"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Roman I Khimov:
> OK, will fix.

Updated one:

=2D-- a/packages/byacc/byacc_20081225.bb	1970-01-01 03:00:00.000000000 +0300
+++ b/packages/byacc/byacc_20081225.bb	2009-02-03 22:51:24.811593078 +0300
@@ -0,0 +1,13 @@
+DESCRIPTION =3D "Berkeley Yacc"
+SECTION =3D "devel"
+LICENSE =3D "public domain"
+PR =3D "r0"
+
+SRC_URI =3D "ftp://invisible-island.net/byacc/byacc-20081225.tgz"
+EXTRA_OECONF +=3D "--program-transform-name=3D's,^,b,'"
+
+inherit autotools
+
+do_configure() {
+	oe_runconf
+}
=2D-- a/packages/byacc/byacc-native_20081225.bb	1970-01-01 03:00:00.0000000=
00 +0300
+++ b/packages/byacc/byacc-native_20081225.bb	2009-02-03 15:36:55.981948513=
 +0300
@@ -0,0 +1,4 @@
+SECTION =3D "devel"
+require byacc_${PV}.bb
+S =3D "${WORKDIR}/byacc-${PV}"
+inherit native
=2D-- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -25042,3 +25042,6 @@ sha256=3D5cc1a53bb909922596bdd0fa967b654fe1bfbe0dcf=
1d34608f0b7c90e0c27867
 md5=3D5f7b88ebb2bcd7e8044328482d079661
 sha256=3Df57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
=20
+[ftp://invisible-island.net/byacc/byacc-20081225.tgz]
+md5=3Db9715b9a2867c221176b597e8f73cbc9
+sha256=3D1364c7fe382de659e8b9841a1736b645345a460d2f4302303e80c02235a2a575



=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2058716.Gk67M68K2f
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmLNNwACgkQXJ70z+XgVcMGWACeMLxlZ+Zk1EkZPq++sDF3X1ev
VU4AnjJJCzjOS+9mlKK6EHWYZHKZMnj0
=wR9a
-----END PGP SIGNATURE-----

--nextPart2058716.Gk67M68K2f--
