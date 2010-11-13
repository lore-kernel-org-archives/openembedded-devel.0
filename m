Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PHGrr-0003Mu-5E for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 15:14:23 +0100
Received: from f053034232.adsl.alicedsl.de ([78.53.34.232]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PHGqs-000123-H9; Sat, 13 Nov 2010 14:13:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Nov 2010 15:13:09 +0100
Message-ID: <1289657589.3693.113.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Revert "unzip: Add update-alternatives to unzip"
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
X-List-Received-Date: Sat, 13 Nov 2010 14:14:28 -0000
X-Groupsio-MsgNum: 26107
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-S0pMUOYyk9H0D7U26iO9"

--=-S0pMUOYyk9H0D7U26iO9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sat, 13 Nov 2010 14:49:28 +0100

This reverts commit 902b98f32ffd35661e43382f47226f65528ff1b1.

With this patch, decompressing zip files does not work anymore in `angstrom=
-2008.1, angstrom-2010.x`, `minimal` and `minimal-uclibc`.

        /oe/build-angstrom-next$ bitbake -k jasper
        [=E2=80=A6]
        NOTE: package jasper-1.900.1-r1: task do_unpack: Started
        NOTE: Unpacking ../downloads/jasper-1.900.1.zip to angstrom-dev/wor=
k/armv7a-angstrom-linux-gnueabi/jasper-1.900.1-r1/
        FATAL: Unable to unpack '/oe/downloads/jasper-1.900.1.zip' to '/oe/=
build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/jasper-=
1.900.1-r1' (cmd: unzip -q -o '/home/paul/oe/downloads/jasper-1.900.1.zip')=
:
        Execution of 'unzip -q -o '/oe/downloads/jasper-1.900.1.zip'' faile=
d with exit code 127:
        /bin/sh: unzip: command not found
       =20
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/perl/perl-native_5.10.1.bb=
 do_compile failed
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/jpeg/jasper_1.900.1.bb do_=
distribute_sources failed
        /oe/build-angstrom-next$ find . -name unzip
        ./angstrom-dev/work/i686-linux/unzip-native-552-r2/unzip-5.52/unzip

I do not know what in Tom=E2=80=99s patch might cause this behavior but rev=
erting this patch fixes the problem for me.

Please note, that `unzip` is not installed on my build host.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/unzip/unzip_552.bb |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/recipes/unzip/unzip_552.bb b/recipes/unzip/unzip_552.bb
index 0decc4a..6e3497e 100644
--- a/recipes/unzip/unzip_552.bb
+++ b/recipes/unzip/unzip_552.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "A (de)compression library for the ZIP format"
 SECTION =3D "console/utils"
 LICENSE =3D "Info-ZIP"
-PR =3D "r2"
+PR =3D "r1"
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/infozip/UnZip%205.x%20and%20ear=
lier/5.52/unzip${PV}.tar.gz"
 S =3D "${WORKDIR}/unzip-5.52"
=20
@@ -19,15 +19,6 @@ do_install() {
         oe_runmake -f unix/Makefile install prefix=3D${D}${prefix}
 	install -d ${D}${mandir}
 	mv ${D}${prefix}/man/* ${D}${mandir}
-	mv ${D}${bindir}/unzip ${D}${bindir}/unzip.${PN}
-}
-
-pkg_postinst_${PN} () {
-	update-alternatives --install ${bindir}/unzip unzip unzip.${PN} 100
-}
-
-pkg_prerm_${PN} () {
-	update-alternatives --remove unzip unzip.${PN}
 }
=20
 SRC_URI[md5sum] =3D "9d23919999d6eac9217d1f41472034a9"
--=20
1.7.2.3

--=-S0pMUOYyk9H0D7U26iO9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzenPUACgkQPX1aK2wOHVil7ACePep4YgHQONCoq38ntPG1wgoW
x/0An1G/PMhZKkUES+TxMrfroCMBCG/n
=hjKm
-----END PGP SIGNATURE-----

--=-S0pMUOYyk9H0D7U26iO9--
