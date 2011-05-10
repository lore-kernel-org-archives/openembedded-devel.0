Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJu1z-0002eY-1l for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 22:59:47 +0200
Received: from f053032140.adsl.alicedsl.de ([78.53.32.140]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJu0b-0005PO-Au for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 20:58:21 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305060012.9982.33.camel@mattotaupa>
References: <1305060012.9982.33.camel@mattotaupa>
Date: Tue, 10 May 2011 22:57:01 +0200
Message-ID: <1305061022.9982.44.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: qt4-native: `/usr/include/gnu/stubs.h:9:27: error: gnu/stubs-64.h: No such file or directory` because architecture incorrectly detected
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
X-List-Received-Date: Tue, 10 May 2011 20:59:47 -0000
X-Groupsio-MsgNum: 31889
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-XBkMVUURlbWvN/3xDk7N"

--=-XBkMVUURlbWvN/3xDk7N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Simon and other OpenEmbedded folks,


I am sorry for the wrong subject line. I am fixing it hereby.


Am Dienstag, den 10.05.2011, 22:40 +0200 schrieb Paul Menzel:

> task configure of `qt4-native` fails on my build system which is a Xen
> DomU running a 64-bit Linux kernel but 32-bit user space.
>=20
>         $ uname -a
>         Linux oe-build-host 2.6.32-5-xen-amd64 #1 SMP Tue Mar 8 00:01:30 =
UTC 2011 x86_64 GNU/Linux
>         $ dpkg --print-architecture
>         i386
>=20
> This seems to be a problem in the Qt4 build system which seems to be
> using `uname` to determine the architecture.
>=20
>         $ more log.do_configure
>         + do_configure
>         + echo o
>         + echo yes
>         + ./configure -prefix /oe/build-angstrom-next/angstrom-dev/sysroo=
ts/i686-linux/usr -L /oe/build-angstrom-next/angstrom-dev/sysroots/i686-lin=
ux/usr/lib -I /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/=
include -qt-libjpeg -qt-gif -system-zlib -no-libjpeg -no-libpng -no-libmng =
-no-libtiff -no-accessibility -no-cups -no-nas-sound -no-nis -no-openssl -v=
erbose -release -embedded -no-freetype -no-glib -no-iconv -exceptions -xmlp=
atterns -qt3support -no-fast -silent -no-rpath
>         Which edition of Qt do you want to use ?
>        =20
>         Type 'c' if you want to use the Commercial Edition.
>         Type 'o' if you want to use the Open Source Edition.
>        =20
>        =20
>         Determining system architecture... (Linux:2.6.32-5-xen-amd64:x86_=
64)
>             64-bit AMD 80x86 (x86_64)
>             'x86_64' is supported
>         System architecture: 'x86_64'
>         Host architecture: 'x86_64'
>         Precompiled-headers support enabled.
>         Symbol visibility control enabled.
>        =20
>         This is the Qt for Embedded Linux Open Source Edition.
>        =20
>         You are licensed to use this software under the terms of
>         the Lesser GNU General Public License (LGPL) versions 2.1.
>         You are also licensed to use this software under the terms of
>         the GNU General Public License (GPL) versions 3.
>        =20
>         Type '3' to view the GNU General Public License version 3.
>         Type 'L' to view the Lesser GNU General Public License version 2.=
1.
>         Type 'yes' to accept this license offer.
>         Type 'no' to decline this license offer.
>        =20
>         Do you accept the terms of either license?=20
>         Creating qmake. Please wait...
>         g++ -c -o project.o -pipe -m64 -m64 -DQMAKE_OPENSOURCE_EDITION -I=
. -Igenerators -Igenerators/unix -Igenerators/win32 -Igenerators/mac -Igene=
rators/symbian -I/oe/build-angstrom-next/angstrom-dev/work/i686-linux/qt4-n=
ative-4.7.2-r0.0/qt-everywhere-opensource-src-4.7.2/include -I/oe/build-ang=
strom-next/angstrom-dev/work/i686-linux/qt4-native-4.7.2-r0.0/qt-everywhere=
-opensource-src-4.7.2/include/QtCore -I/oe/build-angstrom-next/angstrom-dev=
/work/i686-linux/qt4-native-4.7.2-r0.0/qt-everywhere-opensource-src-4.7.2/s=
rc/corelib/global -I/oe/build-angstrom-next/angstrom-dev/work/i686-linux/qt=
4-native-4.7.2-r0.0/qt-everywhere-opensource-src-4.7.2/src/corelib/xml -I/o=
e/build-angstrom-next/angstrom-dev/work/i686-linux/qt4-native-4.7.2-r0.0/qt=
-everywhere-opensource-src-4.7.2/tools/shared -DQT_NO_PCRE -DQT_BUILD_QMAKE=
 -DQT_BOOTSTRAPPED -DQLIBRARYINFO_EPOCROOT -DQT_NO_TEXTCODEC -DQT_NO_UNICOD=
ETABLES -DQT_NO_COMPONENT -DQT_NO_STL -DQT_NO_COMPRESS -I/oe/build-angstrom=
-next/angstrom-dev/work/i686-linux/qt4-native-4.7.2-r0.0/qt-everywhere-open=
source-src-4.7.2/mkspecs/qws/linux-x86_64-g++ -DHAVE_QCONFIG_CPP -DQT_NO_TH=
READ -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT  project.cpp
>         In file included from /usr/include/features.h:378,
>                          from /usr/include/string.h:26,
>                          from /oe/build-angstrom-next/angstrom-dev/work/i=
686-linux/qt4-native-4.7.2-r0.0/qt-everywhere-opensource-src-4.7.2/include/=
QtCore/../../src/corelib/tools/qbytearray.h:48,
>                          from /oe/build-angstrom-next/angstrom-dev/work/i=
686-linux/qt4-native-4.7.2-r0.0/qt-everywhere-opensource-src-4.7.2/include/=
QtCore/qbytearray.h:1,
>                          from /oe/build-angstrom-next/angstrom-dev/work/i=
686-linux/qt4-native-4.7.2-r0.0/qt-everywhere-opensource-src-4.7.2/include/=
QtCore/../../src/corelib/tools/qstring.h:46,
>                          from /oe/build-angstrom-next/angstrom-dev/work/i=
686-linux/qt4-native-4.7.2-r0.0/qt-everywhere-opensource-src-4.7.2/include/=
QtCore/qstring.h:1,
>                          from /oe/build-angstrom-next/angstrom-dev/work/i=
686-linux/qt4-native-4.7.2-r0.0/qt-everywhere-opensource-src-4.7.2/include/=
QtCore/../../src/corelib/io/qiodevice.h:51,
>                          from /oe/build-angstrom-next/angstrom-dev/work/i=
686-linux/qt4-native-4.7.2-r0.0/qt-everywhere-opensource-src-4.7.2/include/=
QtCore/qiodevice.h:1,
>                          from /oe/build-angstrom-next/angstrom-dev/work/i=
686-linux/qt4-native-4.7.2-r0.0/qt-everywhere-opensource-src-4.7.2/include/=
QtCore/../../src/corelib/io/qdatastream.h:46,
>                          from /oe/build-angstrom-next/angstrom-dev/work/i=
686-linux/qt4-native-4.7.2-r0.0/qt-everywhere-opensource-src-4.7.2/include/=
QtCore/qdatastream.h:1,
>                          from /oe/build-angstrom-next/angstrom-dev/work/i=
686-linux/qt4-native-4.7.2-r0.0/qt-everywhere-opensource-src-4.7.2/include/=
QtCore/../../src/corelib/tools/qstringlist.h:46,
>                          from /oe/build-angstrom-next/angstrom-dev/work/i=
686-linux/qt4-native-4.7.2-r0.0/qt-everywhere-opensource-src-4.7.2/include/=
QtCore/qstringlist.h:1,
>                          from project.h:45,
>                          from project.cpp:42:
>         /usr/include/gnu/stubs.h:9:27: error: gnu/stubs-64.h: No such fil=
e or directory
>         make: *** [project.o] Error 1
>         + die 'Configuring qt failed. EXTRA_OECONF was -prefix /oe/build-=
angstrom-next/angstrom-dev/sysroots/i686-linux/usr                 -L /oe/b=
uild-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/lib                =
 -I /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/include   =
              -qt-libjpeg -qt-gif -system-zlib                 -no-libjpeg =
-no-libpng -no-libmng -no-libtiff                 -no-accessibility        =
         -no-cups                 -no-nas-sound                 -no-nis -no=
-openssl                 -verbose -release                 -embedded -no-fr=
eetype -no-glib -no-iconv                 -exceptions -xmlpatterns         =
        -qt3support  -no-fast -silent -no-rpath'
>         + oefatal 'Configuring qt failed. EXTRA_OECONF was -prefix /oe/bu=
ild-angstrom-next/angstrom-dev/sysroots/i686-linux/usr                 -L /=
oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/lib            =
     -I /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/includ=
e                 -qt-libjpeg -qt-gif -system-zlib                 -no-libj=
peg -no-libpng -no-libmng -no-libtiff                 -no-accessibility    =
             -no-cups                 -no-nas-sound                 -no-nis=
 -no-openssl                 -verbose -release                 -embedded -n=
o-freetype -no-glib -no-iconv                 -exceptions -xmlpatterns     =
            -qt3support  -no-fast -silent -no-rpath'
>         + echo FATAL: 'Configuring qt failed. EXTRA_OECONF was -prefix /o=
e/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr                 =
-L /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/lib        =
         -I /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/in=
clude                 -qt-libjpeg -qt-gif -system-zlib                 -no-=
libjpeg -no-libpng -no-libmng -no-libtiff                 -no-accessibility=
                 -no-cups                 -no-nas-sound                 -no=
-nis -no-openssl                 -verbose -release                 -embedde=
d -no-freetype -no-glib -no-iconv                 -exceptions -xmlpatterns =
                -qt3support  -no-fast -silent -no-rpath'
>         FATAL: Configuring qt failed. EXTRA_OECONF was -prefix /oe/build-=
angstrom-next/angstrom-dev/sysroots/i686-linux/usr                 -L /oe/b=
uild-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/lib                =
 -I /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/include   =
              -qt-libjpeg -qt-gif -system-zlib                 -no-libjpeg =
-no-libpng -no-libmng -no-libtiff                 -no-accessibility        =
         -no-cups                 -no-nas-sound                 -no-nis -no=
-openssl                 -verbose -release                 -embedded -no-fr=
eetype -no-glib -no-iconv                 -exceptions -xmlpatterns         =
        -qt3support  -no-fast -silent -no-rpath
>         + exit 1
>=20
> Do you have direct contacts to the Qt developers you can ask about that?
> If not I need to register at Qt upstream and submit a report sometime.
>=20
> I found [1] and [2] on the WWW dealing with this error, but I did not
> find an upstream bug report.
>=20
>=20
> Thanks,
>=20
> Paul
>=20
>=20
> [1] http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D519050
> [2] http://www.bitchx.com/log/qt-f/qt-f-11-Jun-2010/qt-f-11-Jun-2010-09.p=
hp

--=-XBkMVUURlbWvN/3xDk7N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3Jpp0ACgkQPX1aK2wOHVjhzgCcDt1aZPTifum8eNzZxOtx8yQb
GYkAnRfNHGEwyrmBr6Y8koG5J+MSjhHE
=0lzB
-----END PGP SIGNATURE-----

--=-XBkMVUURlbWvN/3xDk7N--
