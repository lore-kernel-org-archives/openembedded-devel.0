Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PLxGf-00067V-PJ for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 13:19:10 +0100
Received: from f053037197.adsl.alicedsl.de ([78.53.37.197]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PLxFU-0000nl-0p for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 12:17:56 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Nov 2010 13:17:54 +0100
Message-ID: <1290773874.28296.34.camel@mattotaupa>
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
Subject: [PATCH 1/4] xbmc_svn: add `jasper` to `DEPENDS`
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
X-List-Received-Date: Fri, 26 Nov 2010 12:19:10 -0000
X-Groupsio-MsgNum: 26617
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-AcEoGKjWT/8CqPRHn5ZZ"

--=-AcEoGKjWT/8CqPRHn5ZZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 26 Nov 2010 00:49:11 +0100

Task `configure` fails with the following error.

        [=E2=80=A6]
        | checking for main in -lresolv... yes
        | checking for main in -ljasper... no
        | configure: error: Could not find a required library. Please see t=
he README for your platform.
        | ERROR: Function do_configure failed
        NOTE: package xbmc-10.05-r8+gitr0+e2ab481ebe964321c358ab9d6402088c7=
14adcbe: task do_configure: Failed
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/xbmc/xbmc_svn.bb do_config=
ure failed
        ERROR: Task 11 (/oe/openembedded/recipes/xbmc/xbmc_svn.bb, do_confi=
gure) failed with 256
        ERROR: '/oe/openembedded/recipes/xbmc/xbmc_svn.bb' failed
        ERROR: '/oe/openembedded/recipes/xbmc/xbmc_svn.bb' failed
        ERROR: '/oe/openembedded/recipes/xbmc/xbmc_svn.bb' failed

Adding `jasper` to `DEPENDS` fixes this error with the following build conf=
iguration.

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

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/xbmc/xbmc_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
index b42d7fa..d03ea0b 100644
--- a/recipes/xbmc/xbmc_svn.bb
+++ b/recipes/xbmc/xbmc_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "XBMC Media Center"
 LICENSE =3D "xbmc"
=20
-DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmodpl=
ug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virt=
ual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi l=
ibsamplerate0 libxrandr bzip2 virtual/libsdl"
+DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmodpl=
ug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virt=
ual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi l=
ibsamplerate0 libxrandr bzip2 virtual/libsdl jasper"
 require recipes/egl/egl.inc
=20
 SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"
--=20
1.7.2.3


--=-AcEoGKjWT/8CqPRHn5ZZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzvpXIACgkQPX1aK2wOHVihawCfRnCxKuhwYd8rXMHXg4w7Fp24
RnoAoIvWW3SfmjSy6IJoajVqVkTIJ1qw
=Ey0I
-----END PGP SIGNATURE-----

--=-AcEoGKjWT/8CqPRHn5ZZ--
