Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PLxJF-0006Eh-8Y for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 13:21:49 +0100
Received: from f053037197.adsl.alicedsl.de ([78.53.37.197]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PLxI3-0000r9-FH for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 12:20:35 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1290773874.28296.34.camel@mattotaupa>
References: <1290773874.28296.34.camel@mattotaupa>
Date: Fri, 26 Nov 2010 13:20:34 +0100
Message-ID: <1290774034.28296.37.camel@mattotaupa>
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
Subject: [PATCH 2/4] xbmc: add `libxtst` to `DEPENDS`
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
X-List-Received-Date: Fri, 26 Nov 2010 12:21:50 -0000
X-Groupsio-MsgNum: 26618
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-aPvLJKOG64NKrm6PVXQu"

--=-aPvLJKOG64NKrm6PVXQu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 26 Nov 2010 10:33:57 +0100

Task `configure` fails with the following error.

        [=E2=80=A6]
        checking for ENCA... yes
        checking for XT... yes
        checking for XTST... no
        configure: error: Could not find a required library. Please see the=
 README for your platform.
        ERROR: Function do_configure failed

Adding `libxtst` to `DEPENDS` fixes this error with the following build con=
figuration.

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
index d03ea0b..7880a57 100644
--- a/recipes/xbmc/xbmc_svn.bb
+++ b/recipes/xbmc/xbmc_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "XBMC Media Center"
 LICENSE =3D "xbmc"
=20
-DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmodpl=
ug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virt=
ual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi l=
ibsamplerate0 libxrandr bzip2 virtual/libsdl jasper"
+DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmodpl=
ug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virt=
ual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi l=
ibsamplerate0 libxrandr libxtst bzip2 virtual/libsdl jasper"
 require recipes/egl/egl.inc
=20
 SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"
--=20
1.7.2.3

--=-aPvLJKOG64NKrm6PVXQu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzvphIACgkQPX1aK2wOHViaggCeK0wJK0z7AJNmKnxtJ8mYULs7
Cp4An3qqIla+V54UvSK86Fi4nwQWVEdE
=eR58
-----END PGP SIGNATURE-----

--=-aPvLJKOG64NKrm6PVXQu--
