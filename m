Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PWbWi-00060z-5G for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 22:19:44 +0100
Received: from f053037080.adsl.alicedsl.de ([78.53.37.80]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PWbWY-000668-KP for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 21:19:34 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Dec 2010 22:19:33 +0100
Message-ID: <1293311973.4089.26.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: xbmc: angstrom-2010.x: task `compile` fails with `/bin/grep: /usr/lib/libz.la: No such file or directory`
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
X-List-Received-Date: Sat, 25 Dec 2010 21:19:44 -0000
X-Groupsio-MsgNum: 27518
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ag+TA54I6OcFibkksVJ6"

--=-ag+TA54I6OcFibkksVJ6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


after the last to commit `xbmc` builds fine with `angstrom-2008.1` for
`MACHINE =3D "beagleboard"`.

Using `angstrom-2010.x` task `compile` fails with
`/bin/grep: /usr/lib/libz.la: No such file or directory`.
=20
 	| make -C ..
 	| make[2]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/=
armv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d6=
402088c714adcbe/git/lib/libass'
 	|  cd . && /bin/sh ./config.status Makefile
 	| config.status: creating Makefile
 	| make[2]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass'
 	| make[2]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/=
armv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d6=
402088c714adcbe/git/lib/libass'
 	| make[3]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/=
armv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d6=
402088c714adcbe/git/lib/libass'
 	| Making all in libass
 	| make[4]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/=
armv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d6=
402088c714adcbe/git/lib/libass/libass'
 	|  cd .. && /bin/sh ./config.status libass/Makefile depfiles
 	| config.status: creating libass/Makefile
 	| config.status: executing depfiles commands
 	| make[4]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass/libass'
 	| make[4]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/=
armv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d6=
402088c714adcbe/git/lib/libass/libass'
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
 	| arm-angstrom-linux-gnueabi-libtool: link: warning: library `/oe/build-a=
ngstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/li=
bfreetype.la' was moved.
 	| /bin/grep: /usr/lib/libz.la: No such file or directory
 	| /bin/sed: can't read /usr/lib/libz.la: No such file or directory
 	| arm-angstrom-linux-gnueabi-libtool: link: `/usr/lib/libz.la' is not a v=
alid libtool archive
 	| make[4]: *** [libass.la] Error 1
 	| make[4]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass/libass'
 	| make[3]: *** [all-recursive] Error 1
 	| make[3]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass'
 	| make[2]: *** [all] Error 2
 	| make[2]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass'
 	| make[1]: *** [../libass/.libs/libass.so] Error 2
 	| make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d64=
02088c714adcbe/git/lib/libass/xbmc'
 	| make: *** [dvdpcodecs] Error 2
 	| FATAL: oe_runmake failed
 	| ERROR: Function do_compile failed

`zlib.la` is available though.

	$ ls angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libz.la
	angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libz.la
	$ ls angstrom-dev/sysroots/i686-linux/usr/lib/libz.la
	angstrom-dev/sysroots/i686-linux/usr/lib/libz.la

I tried to look where `/usr/lib/libz.la` is coming from to no avail.
Could this be a Libtool issue? `angstrom-2008.1` is using 2.2 and
`angstrom-2010.x` is using 2.4.

        $ git grep -i libtool conf/
        [=E2=80=A6]
        conf/distro/include/angstrom-2008-preferred-versions.inc:PREFERRED_=
VERSION_libtool      =3D "2.2.6b"
        conf/distro/include/angstrom-2008-preferred-versions.inc:PREFERRED_=
VERSION_libtool-native =3D "2.2.6b"
        conf/distro/include/angstrom-2008-preferred-versions.inc:PREFERRED_=
VERSION_libtool-cross        =3D "2.2.6b"
        conf/distro/include/angstrom-2008-preferred-versions.inc:PREFERRED_=
VERSION_libtool-sdk  =3D "2.2.6b"
        conf/distro/include/angstrom-2010-preferred-versions.inc:ANGSTROM_L=
IBTOOL_VERSION =3D "2.4"
        conf/distro/include/angstrom-2010-preferred-versions.inc:LIBTOOL_HA=
S_SYSROOT =3D "yes"
        conf/distro/include/angstrom-2010-preferred-versions.inc:PREFERRED_=
VERSION_libtool           =3D "${ANGSTROM_LIBTOOL_VERSION}"
        conf/distro/include/angstrom-2010-preferred-versions.inc:PREFERRED_=
VERSION_libtool-native    =3D "${ANGSTROM_LIBTOOL_VERSION}"
        conf/distro/include/angstrom-2010-preferred-versions.inc:PREFERRED_=
VERSION_libtool-cross     =3D "${ANGSTROM_LIBTOOL_VERSION}"
        conf/distro/include/angstrom-2010-preferred-versions.inc:PREFERRED_=
VERSION_libtool-nativesdk =3D "${ANGSTROM_LIBTOOL_VERSION}"
        conf/distro/include/angstrom-2010-preferred-versions.inc:PREFERRED_=
VERSION_libtool-sdk       =3D "${ANGSTROM_LIBTOOL_VERSION}"
        [=E2=80=A6]


Thanks,

Paul=20

--=-ag+TA54I6OcFibkksVJ6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0WX+UACgkQPX1aK2wOHVgW6QCeNqi4+m+K7RvwSeB07vY2ZYC/
m9sAmwXFbwuJCBkoueVXOk7dtrZ1XN0h
=jIkV
-----END PGP SIGNATURE-----

--=-ag+TA54I6OcFibkksVJ6--
