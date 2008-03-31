Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1JgPps-00040d-8E
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 21:38:28 +0200
Received: by an-out-0708.google.com with SMTP id b33so478229ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 12:38:20 -0700 (PDT)
Received: by 10.100.43.13 with SMTP id q13mr16829537anq.74.1206992300501;
	Mon, 31 Mar 2008 12:38:20 -0700 (PDT)
Received: from debian ( [74.254.162.162])
	by mx.google.com with ESMTPS id 32sm7916369aga.20.2008.03.31.12.38.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Mar 2008 12:38:19 -0700 (PDT)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2008 14:38:05 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200803311438.09825.e.robertson.svg@gmail.com>
Subject: stable branch checksum missmatch for quilt-0.45
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Mar 2008 19:38:28 -0000
X-Groupsio-MsgNum: 4863
Content-Type: multipart/signed; boundary="nextPart3705868.5Q5IO9YGyD";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3705868.5Q5IO9YGyD
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

building helloworld:

OE Build Configuration:
BB_VERSION     =3D "1.8.10"
OE_REVISION    =3D "a0a3cc0088bc51023a19b1d6942f7cc643e6bb52"
TARGET_ARCH    =3D "arm"
TARGET_OS      =3D "linux-uclibcgnueabi"
MACHINE        =3D "at91sam9263ek"
DISTRO         =3D "angstrom"
DISTRO_VERSION =3D "2008.1-test-20080331"
TARGET_FPU     =3D "soft"

=2E..
NOTE: package quilt-native-0.45: started
NOTE: package quilt-native-0.45-r1: task do_fetch: started
sh: oe_sha256sum: command not found
NOTE: The SHA256 Sums do not match.=20
Wanted: 'de7290f334baf631a14d031df304ee94cfb550aa69e7512aa589d21c2381c7d8'=
=20
Got: ''
NOTE: Task failed: Checksum=20
of 'http://download.savannah.gnu.org/releases/quilt/quilt-0.45.tar.gz' fail=
ed
NOTE: package quilt-native-0.45-r1: task do_fetch: failed
ERROR: TaskFailed event exception, aborting
NOTE: package quilt-native-0.45: failed
ERROR: Build=20
of /OpenEmbedded_Stuff/org.openembedded.stable/packages/quilt/quilt-native_=
0.45.bb=20
do_fetch failed



according to checksums.ini:

[http://download.savannah.gnu.org/releases/quilt/quilt-0.45.tar.gz]
md5=3D5f8dd5a041ca7c700b16620228f922aa
sha256=3Dde7290f334baf631a14d031df304ee94cfb550aa69e7512aa589d21c2381c7d8

If I edit this file and later do a stable update, would it erase my changes?

--nextPart3705868.5Q5IO9YGyD
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBH8T2h2sS31XKVICURAmUeAJ4vIrFFfL6aRjdz5N5/23rMS/vEcgCgnFoX
GMWKXi5sj7i7UUoh3F2xzts=
=5TaP
-----END PGP SIGNATURE-----

--nextPart3705868.5Q5IO9YGyD--
