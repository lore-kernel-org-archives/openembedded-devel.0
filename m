Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q0Yy2-0007dP-Nb for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 13:39:46 +0100
Received: from f053044006.adsl.alicedsl.de ([78.53.44.6] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q0YwN-00041w-Hj for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 12:38:03 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1293311973.4089.26.camel@mattotaupa>
References: <1293311973.4089.26.camel@mattotaupa>
Date: Fri, 18 Mar 2011 13:38:02 +0100
Message-ID: <1300451882.3830.54.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] xbmc: add `libass` to `DEPENDS`
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
X-List-Received-Date: Fri, 18 Mar 2011 12:39:46 -0000
X-Groupsio-MsgNum: 30400
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0C7XC25ZHre+hlAyOfFV"

--=-0C7XC25ZHre+hlAyOfFV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 18 Mar 2011 09:51:52 +0100

Task compile of `xbmc_svn.bb` fails with the following error message when u=
sing `angstrom-2010.x`. `angstrom-2008.1` does/did not have this problem pr=
obably because of using Libtool 2.2.

	arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/b=
uild-angstrom-next/angstrom-dev/s
	ysroots/armv7a-angstrom-linux-gnueabi -MD -c -fexpensive-optimizations -fo=
mit-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-i=
nlines-hidden -fPIC -DPIC -D_RE
	ENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -=
O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dc=
ortex-a8 -mfpu=3Dneon -mvectorize-with-ne
	on-quad -fexpensive-optimizations -fomit-frame-pointer -frename-registers =
-O2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRAN=
T -D_LARGEFILE64_SOURCE -D_FILE
	_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-sta=
ck-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-wit=
h-neon-quad -fexpensive-optimizations -fo
	mit-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-=
inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSE=
T_BITS=3D64 -g -D_DEBUG -Wall -O2
	 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dco=
rtex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -D_LINUX -D_FILE_DEFINED -D=
__STDC_CONSTANT_MACROS -DBIN_INSTALL_PA
	TH=3D"\"/usr/lib/xbmc\"" -DINSTALL_PATH=3D"\"/usr/share/xbmc\"" -DHAS_SDL_=
JOYSTICK -D'SVN_REV=3D"Unknown"' -D_ARMEL -DHAVE_CONFIG_H  -I. -I.. -I../..=
/ -I../linux -I../cores -I../../guili
	b -I../posix -I../../lib/jsoncpp/jsoncpp/include -D_GNU_SOURCE=3D1 -D_REEN=
TRANT -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux=
-gnueabi/usr/include/ -
	I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnuea=
bi/usr/include/SDL -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-a=
ngstrom-lin
	ux-gnueabi/usr/include/alsa -I/oe/build-angstrom-next/angstrom-dev/sysroot=
s/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0 -I/oe/build-angstrom-n=
ext/angstro
	m-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/freetype2 -I/oe/b=
uild-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/=
include/fribidi -I/ho
	me/paul/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux=
-gnueabi/usr/include/glib-2.0 -I/oe/build-angstrom-next/angstrom-dev/sysroo=
ts/armv7a-angstrom-li
	nux-gnueabi/usr/include/libpng12 -I/oe/build-angstrom-next/angstrom-dev/sy=
sroots/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/oe/build-a=
ngstrom-nex
	t/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/inc=
lude -I/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/armv7a/=
include -I/
	oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbm=
c-10.05-r11+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe/git Socket.cpp -=
o Socket.o
		LINK  libass.la
	In file included from log.h:25:0,
		               from Socket.cpp:26:
	../../guilib/StdString.h:1597:14: note: the mangling of 'va_list' has chan=
ged in GCC 4.4
	arm-angstrom-linux-gnueabi-libtool: link: warning: library `/oe/build-angs=
trom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libfr=
eetype.la' was moved.
	/bin/grep: /usr/lib/libz.la: No such file or directory
	/bin/sed: can't read /usr/lib/libz.la: No such file or directory
	arm-angstrom-linux-gnueabi-libtool: link: `/usr/lib/libz.la' is not a vali=
d libtool archive
	make[4]: *** [libass.la] Error 1
	make[4]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/armv=
7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+e2ab481ebe964321c358ab9d6402=
088c714adcbe/git/lib/
	libass/libass'
	make[3]: *** [all-recursive] Error 1
	make[3]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/armv=
7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+e2ab481ebe964321c358ab9d6402=
088c714adcbe/git/lib/
	libass'
	make[2]: *** [all] Error 2
	make[2]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/armv=
7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+e2ab481ebe964321c358ab9d6402=
088c714adcbe/git/lib/
	libass'
	make[1]: *** [../libass/.libs/libass.so] Error 2
	make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/armv=
7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+e2ab481ebe964321c358ab9d6402=
088c714adcbe/git/lib/
	libass/xbmc'
	make: *** [dvdpcodecs] Error 2
	make: *** Waiting for unfinished jobs....

Using the external package fixes this problem.

	Build Configuration:
	BB_VERSION        =3D "1.12.0"
	METADATA_BRANCH   =3D "<unknown>"
	METADATA_REVISION =3D "a36e1dd"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-gnueabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "angstrom"
	DISTRO_VERSION    =3D "v20110318"
	TARGET_FPU        =3D "hard"

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/xbmc/xbmc_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
index be2e34e..45a7dad 100644
--- a/recipes/xbmc/xbmc_svn.bb
+++ b/recipes/xbmc/xbmc_svn.bb
@@ -1,13 +1,13 @@
 DESCRIPTION =3D "XBMC Media Center"
 LICENSE =3D "xbmc"
=20
-DEPENDS =3D "gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig =
curl python libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-ima=
ge libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boo=
st lzo2 enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtu=
al/libsdl jasper zip-native zlib"
+DEPENDS =3D "gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig =
curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native lib=
sdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libp=
cre boost lzo2 enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip=
2 virtual/libsdl jasper zip-native zlib"
 require recipes/egl/egl.inc
=20
 SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"
=20
 PV =3D "10.05"
-PR =3D "r11"
+PR =3D "r12"
 PR_append =3D "+gitr${SRCPV}"
=20
 SRC_URI =3D "git://xbmc.git.sourceforge.net/gitroot/xbmc/xbmc;protocol=3Dg=
it;branch=3Dmaster \
--=20
1.7.4.1

--=-0C7XC25ZHre+hlAyOfFV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2DUioACgkQPX1aK2wOHVjVAwCgi9L8el8DJHqwMrdqMIeMTmLC
6Z8An1IJ0K8EHobx4yEbipxCI7tPxJPW
=ClMT
-----END PGP SIGNATURE-----

--=-0C7XC25ZHre+hlAyOfFV--
