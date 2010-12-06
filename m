Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PPbSw-0004Zz-L3 for openembedded-devel@lists.openembedded.org;
	Mon, 06 Dec 2010 14:50:55 +0100
Received: from f053044154.adsl.alicedsl.de ([78.53.44.154]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PPbRZ-0001gB-Ir for openembedded-devel@lists.openembedded.org;
	Mon, 06 Dec 2010 13:49:29 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1291642945.3756.16.camel@mattotaupa>
References: <1291642945.3756.16.camel@mattotaupa>
Date: Mon, 06 Dec 2010 14:49:28 +0100
Message-ID: <1291643368.3756.21.camel@mattotaupa>
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
Subject: [PATCH 2/2] enjoy: add `elementary` to `DEPENDS`
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
X-List-Received-Date: Mon, 06 Dec 2010 13:50:55 -0000
X-Groupsio-MsgNum: 26927
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-x8TrPfy123jgZPm58TZw"

--=-x8TrPfy123jgZPm58TZw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 6 Dec 2010 14:22:16 +0100

Task `configure` fails with the following error message.

	| checking pkg-config is at least version 0.9.0... yes
	| checking for EDBUS... yes
	| checking for ELEMENTARY... configure: error: Package requirements (eleme=
ntary ecore-file) were not met:
	|
	| No package 'elementary' found
	|
	| Consider adjusting the PKG_CONFIG_PATH environment variable if you
	| installed software in a non-standard prefix.
	|
	| Alternatively, you may set the environment variables ELEMENTARY_CFLAGS
	| and ELEMENTARY_LIBS to avoid the need to call pkg-config.
	| See the pkg-config man page for more details.
	|
	| ERROR: Function do_configure failed
	NOTE: package enjoy-0.0+svnr55157-r2: task do_configure: Failed
	ERROR: TaskFailed event exception, aborting
	ERROR: Build of /oe/openembedded/recipes/e17/enjoy_svn.bb do_configure fai=
led
	ERROR: Task 12 (/oe/openembedded/recipes/e17/enjoy_svn.bb, do_configure) f=
ailed with 256
	ERROR: '/oe/openembedded/recipes/e17/enjoy_svn.bb' failed
	ERROR: '/oe/openembedded/recipes/e17/enjoy_svn.bb' failed
	ERROR: '/oe/openembedded/recipes/e17/enjoy_svn.bb' failed

Adding `elementary` to `DEPENDS` fixes this problem and is tested with the =
following configurations.

        Build Configuration:
        BB_VERSION        =3D "1.10.0"
        METADATA_BRANCH   =3D "org.openembedded.dev"
        METADATA_REVISION =3D "2bd4f33"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-gnueabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "angstrom"
        DISTRO_VERSION    =3D "next"
        TARGET_FPU        =3D "hard"

        Build Configuration:
        BB_VERSION        =3D "1.10.0"
        METADATA_BRANCH   =3D "org.openembedded.dev"
        METADATA_REVISION =3D "fa3f861"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-gnueabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "minimal"
        DISTRO_VERSION    =3D "dev-snapshot-20101206"
        TARGET_FPU        =3D "hard"

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/e17/enjoy_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/e17/enjoy_svn.bb b/recipes/e17/enjoy_svn.bb
index 20c9c63..3288338 100644
--- a/recipes/e17/enjoy_svn.bb
+++ b/recipes/e17/enjoy_svn.bb
@@ -1,9 +1,9 @@
 DESCRIPTION =3D "Enjoy music player"
 LICENSE =3D "LGPLv3"
-DEPENDS =3D "evas ecore edje emotion lightmediascanner"
+DEPENDS =3D "evas ecore edje elementary emotion lightmediascanner"
 SRCREV =3D "${EFL_SRCREV}"
 PV =3D "0.0+svnr${SRCPV}"
-PR =3D "r3"
+PR =3D "r4"
=20
 DEPENDS +=3D "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1=
', '', 'gst-plugins-ugly', d)}"
=20
--=20
1.7.2.3

--=-x8TrPfy123jgZPm58TZw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkz86egACgkQPX1aK2wOHVhDxwCghTU6vvn1IOepkgvQtqNrsp7q
IdgAmwRRJY0uR88VQ8gZhuC045wCpzpY
=sU++
-----END PGP SIGNATURE-----

--=-x8TrPfy123jgZPm58TZw--
