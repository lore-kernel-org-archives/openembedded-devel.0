Received: from [83.222.24.114] (helo=smtp-14.masterhost.ru)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LXZjn-0006n1-BL
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 12:28:11 +0100
Received: (qmail 15164 invoked from network); 12 Feb 2009 11:26:33 -0000
Received: from unknown (HELO ?192.168.1.116?) (rik@osrc.info@80.246.246.162)
	by smtp1.masterhost.ru with SMTP; 12 Feb 2009 11:26:33 -0000
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 14:26:20 +0300
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200902121426.26727.roman@khimov.ru>
Subject: [PATCH] Fix rpm2cio sums
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
X-List-Received-Date: Thu, 12 Feb 2009 11:28:11 -0000
X-Groupsio-MsgNum: 7623
Content-Type: multipart/signed; boundary="nextPart1776724.QRY5DUBfPh";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1776724.QRY5DUBfPh
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello all.

Don't know why, but rpm2cpio tarball checksums are wrong, so here is the fi=
x:

=2D-- a/conf/checksums.ini     2009-02-12 14:23:11.655542059 +0300
+++ b/conf/checksums.ini      2009-02-12 14:23:50.520780173 +0300
@@ -18931,8 +18931,8 @@ md5=3Db8f0661ac765ce1a2de66ca53e37af83
 sha256=3Da8168b8884ab40aadebba0ba696b889e25020d32a88e646d4f4bc56f2236b184

 [ftp://ftp.freebsd.org/pub/FreeBSD//ports/packages/archivers/rpm2cpio-1.2_=
2.tbz]
=2Dmd5=3D63f39118ea5ef7cda84a0638002ed6d2
=2Dsha256=3D27ffe0392ae193eb04786a2159c099a00fe38ccdaebcebd72afc842c528bb6d3
+md5=3Dcb0cabdac81b7171843427f32427ca84
+sha256=3D20f48aa3c1f950c224e844d3a7d28a679f41173a26a2d7095ef1da27bda42c2f

 [http://downloads.sourceforge.net/rpyc/rpyc-3.02.tar.gz]
 md5=3D4e855372c4a533b9ed605503156e6e04

=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1776724.QRY5DUBfPh
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmUB10ACgkQXJ70z+XgVcNP+ACgh2PdF2HmHqvLjvGxSyYwL0l9
UAsAnRXvG/fdMUtaXKplJfVKk3kTXcoB
=rPks
-----END PGP SIGNATURE-----

--nextPart1776724.QRY5DUBfPh--
