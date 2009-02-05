Received: from [83.222.24.119] (helo=smtp-19.masterhost.ru)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LVA89-0001GM-B8
	for openembedded-devel@openembedded.org; Thu, 05 Feb 2009 20:43:21 +0100
Received: (qmail 98144 invoked from network); 5 Feb 2009 19:42:31 -0000
Received: from unknown (HELO mate.hex) (rik@osrc.info@84.17.11.114)
	by smtp1.masterhost.ru with SMTP; 5 Feb 2009 19:42:34 -0000
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@openembedded.org
Date: Thu, 5 Feb 2009 22:42:11 +0300
User-Agent: KMail/1.9.9
References: <200902051836.25770.roman@khimov.ru>
	<200902052150.04203.roman@khimov.ru>
	<20090205190412.GS3856@smtp.west.cox.net>
In-Reply-To: <20090205190412.GS3856@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200902052242.29168.roman@khimov.ru>
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
X-List-Received-Date: Thu, 05 Feb 2009 19:43:21 -0000
X-Groupsio-MsgNum: 7567
Content-Type: multipart/signed; boundary="nextPart7350127.upD4hJ0zJu";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart7350127.upD4hJ0zJu
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Tom Rini:
> On Thu, Feb 05, 2009 at 09:50:04PM +0300, Roman I Khimov wrote:
> > Updated one:
>
> Perhaps a byacc.inc with most of what's in byacc_20081225.bb?

OK.

> > +SRC_URI =3D "ftp://invisible-island.net/byacc/byacc-20081225.tgz"
>
> then ${PN}-${PV}

I guess ${PN} would break native builds, done ${PV}.

> > +SECTION =3D "devel"
>
> Already set in the main one, btw.

OK, how about this one?

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
=2D-- a/packages/byacc/byacc_20081225.bb	1970-01-01 03:00:00.000000000 +0300
+++ b/packages/byacc/byacc_20081225.bb	2009-02-05 22:25:46.383881444 +0300
@@ -0,0 +1,3 @@
+PR =3D "r0"
+
+require byacc.inc
=2D-- a/packages/byacc/byacc.inc	1970-01-01 03:00:00.000000000 +0300
+++ b/packages/byacc/byacc.inc	2009-02-05 22:35:47.122630342 +0300
@@ -0,0 +1,13 @@
+DESCRIPTION =3D "Berkeley Yacc"
+SECTION =3D "devel"
+LICENSE =3D "public domain"
+
+SRC_URI =3D "ftp://invisible-island.net/byacc/byacc-${PV}.tgz"
+EXTRA_OECONF +=3D "--program-transform-name=3D's,^,b,'"
+S =3D "${WORKDIR}/byacc-${PV}"
+
+inherit autotools
+
+do_configure() {
+	oe_runconf
+}
=2D-- a/packages/byacc/byacc-native_20081225.bb	1970-01-01 03:00:00.0000000=
00 +0300
+++ b/packages/byacc/byacc-native_20081225.bb	2009-02-05 22:34:23.637607905=
 +0300
@@ -0,0 +1,5 @@
+PR =3D "r0"
+
+require byacc.inc
+
+inherit native
=20

=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart7350127.upD4hJ0zJu
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmLQRMACgkQXJ70z+XgVcNBsQCgx9jq9hIDxDdJiPNtUsl1JxvB
kScAnRSje+D2OCdaVm6FJxQhRtdaK9fQ
=4ovw
-----END PGP SIGNATURE-----

--nextPart7350127.upD4hJ0zJu--
