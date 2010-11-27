Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PM9n4-0004ME-M6 for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 02:41:28 +0100
Received: from f053037197.adsl.alicedsl.de ([78.53.37.197]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PM9ls-00019K-70 for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 01:40:12 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1290821557.3795.11.camel@mattotaupa>
References: <1290773874.28296.34.camel@mattotaupa>
	<1290774034.28296.37.camel@mattotaupa>
	<1290821557.3795.11.camel@mattotaupa>
Date: Sat, 27 Nov 2010 02:40:11 +0100
Message-ID: <1290822011.3795.13.camel@mattotaupa>
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
Subject: [PATCH 4/4] xbmc: add `zip-native` to `DEPENDS` and increase `PR`
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
X-List-Received-Date: Sat, 27 Nov 2010 01:41:28 -0000
X-Groupsio-MsgNum: 26636
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-NVw9CfTkSml5R0CyM4V4"

--=-NVw9CfTkSml5R0CyM4V4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 26 Nov 2010 11:34:59 +0100

1. Task `configure` fails with the following error.

	[=E2=80=A6]
	| checking for unzip... yes
	| checking for zip... no
	| configure: error: Could not find a required program. Please see the READ=
ME for your platform.
	| ERROR: Function do_configure failed
	NOTE: package xbmc-10.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe=
: task do_configure: Failed
	ERROR: TaskFailed event exception, aborting
	ERROR: Build of /oe/openembedded/recipes/xbmc/xbmc_svn.bb do_configure fai=
led
	ERROR: Task 11 (/oe/openembedded/recipes/xbmc/xbmc_svn.bb, do_configure) f=
ailed with 256
	ERROR: '/oe/openembedded/recipes/xbmc/xbmc_svn.bb' failed
	ERROR: '/oe/openembedded/recipes/xbmc/xbmc_svn.bb' failed
	ERROR: '/oe/openembedded/recipes/xbmc/xbmc_svn.bb' failed

Adding `zip-native` to `DEPENDS` fixes this error with the following build =
configuration.

	Build Configuration:
	BB_VERSION        =3D "1.10.0"
	METADATA_BRANCH   =3D "org.openembedded.dev"
	METADATA_REVISION =3D "97ea91e"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-gnueabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "angstrom"
	DISTRO_VERSION    =3D "2010.7-test-20101126"
	TARGET_FPU        =3D "hard"

2. After the newly added dependencies the program release (`PR`) has to be =
increased.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
I am not sure what the best way of submitting this series would be. Probabl=
y squashing everything in one patch or bump the `PR` in every patch.
---
 recipes/xbmc/xbmc_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
index d23cc8c..ad95a8a 100644
--- a/recipes/xbmc/xbmc_svn.bb
+++ b/recipes/xbmc/xbmc_svn.bb
@@ -1,13 +1,13 @@
 DESCRIPTION =3D "XBMC Media Center"
 LICENSE =3D "xbmc"
=20
-DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmodpl=
ug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virt=
ual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi l=
ibsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper"
+DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmodpl=
ug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virt=
ual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi l=
ibsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip=
-native"
 require recipes/egl/egl.inc
=20
 SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"
=20
 PV =3D "10.05"
-PR =3D "r8"
+PR =3D "r9"
 PR_append =3D "+gitr${SRCPV}"
=20
 SRC_URI =3D "git://xbmc.git.sourceforge.net/gitroot/xbmc/xbmc;protocol=3Dg=
it;branch=3Dmaster \
--=20
1.7.2.3

--=-NVw9CfTkSml5R0CyM4V4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzwYXsACgkQPX1aK2wOHVjAOwCdEoSF/pR6FOcaw6mdA3bMptzI
bPAAn1L4gBOF5Y+M8A7buyHL7/QftrEs
=8Ga3
-----END PGP SIGNATURE-----

--=-NVw9CfTkSml5R0CyM4V4--
