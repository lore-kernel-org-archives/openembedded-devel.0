Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PWCv8-0006At-SQ for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 20:03:18 +0100
Received: from f053044232.adsl.alicedsl.de ([78.53.44.232]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PWCv0-0006qA-To for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 19:03:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Dec 2010 20:03:09 +0100
Message-ID: <1293217389.4027.39.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH 1/2] xbmc: add `zlib` to `DEPENDS`
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
X-List-Received-Date: Fri, 24 Dec 2010 19:03:18 -0000
X-Groupsio-MsgNum: 27492
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-8RkC0zr7lnwcG42J4Y6F"

--=-8RkC0zr7lnwcG42J4Y6F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Wed, 1 Dec 2010 17:27:33 +0100

Task `compile` fails with `/bin/grep: /usr/lib/libz.la: No such file or dir=
ectory`.

	| make -C ..
	| make[2]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass'
	|  cd . && /bin/sh ./config.status Makefile
	| config.status: creating Makefile
	| make[2]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/ar=
mv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d640=
2088c714adcbe/git/lib/libass'
	| make[2]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass'
	| make[3]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass'
	| Making all in libass
	| make[4]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass/libass'
	|  cd .. && /bin/sh ./config.status libass/Makefile depfiles
	| config.status: creating libass/Makefile
	| config.status: executing depfiles commands
	| make[4]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/ar=
mv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d640=
2088c714adcbe/git/lib/libass/libass'
	| make[4]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass/libass'
	|   CC    ass.o
	|   CC    ass_cache.o
	|   CC    ass_font.o
	|   CC    ass_fontconfig.o
	|   CC    ass_render.o
	|   CC    ass_utils.o
	|   CC    ass_bitmap.o
	|   CC    ass_library.o
	|   CC    ass_drawing.o
	|   CC    ass_parse.o
	|   CC    ass_strtod.o
	|   LINK  libass.la
	| arm-angstrom-linux-gnueabi-libtool: link: warning: library `/oe/build-an=
gstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/lib=
freetype.la' was moved.
	| /bin/grep: /usr/lib/libz.la: No such file or directory
	| /bin/sed: can't read /usr/lib/libz.la: No such file or directory
	| arm-angstrom-linux-gnueabi-libtool: link: `/usr/lib/libz.la' is not a va=
lid libtool archive
	| make[4]: *** [libass.la] Error 1
	| make[4]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/ar=
mv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d640=
2088c714adcbe/git/lib/libass/libass'
	| make[3]: *** [all-recursive] Error 1
	| make[3]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/ar=
mv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d640=
2088c714adcbe/git/lib/libass'
	| make[2]: *** [all] Error 2
	| make[2]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/ar=
mv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d640=
2088c714adcbe/git/lib/libass'
	| make[1]: *** [../libass/.libs/libass.so] Error 2
	| make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/ar=
mv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d640=
2088c714adcbe/git/lib/libass/xbmc'
	| make: *** [dvdpcodecs] Error 2
	| FATAL: oe_runmake failed
	| ERROR: Function do_compile failed

Adding `zlib` to `DEPENDS` fixes the problem for `angstrom-2008.1` and `min=
imal` with `MACHINE =3D "beagleboard"`.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/xbmc/xbmc_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
index ad95a8a..3ca90e0 100644
--- a/recipes/xbmc/xbmc_svn.bb
+++ b/recipes/xbmc/xbmc_svn.bb
@@ -1,13 +1,13 @@
 DESCRIPTION =3D "XBMC Media Center"
 LICENSE =3D "xbmc"
=20
-DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmodpl=
ug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virt=
ual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi l=
ibsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip=
-native"
+DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmodpl=
ug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virt=
ual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi l=
ibsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip=
-native zlib"
 require recipes/egl/egl.inc
=20
 SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"
=20
 PV =3D "10.05"
-PR =3D "r9"
+PR =3D "r10"
 PR_append =3D "+gitr${SRCPV}"
=20
 SRC_URI =3D "git://xbmc.git.sourceforge.net/gitroot/xbmc/xbmc;protocol=3Dg=
it;branch=3Dmaster \
--=20
1.7.2.3

--=-8RkC0zr7lnwcG42J4Y6F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0U7m0ACgkQPX1aK2wOHVhKvwCcC+gntZowwLTA+65nAojXohRa
bioAnjJhPxh/ijXCpdxo7SPfT+GmkuC9
=gsGZ
-----END PGP SIGNATURE-----

--=-8RkC0zr7lnwcG42J4Y6F--
