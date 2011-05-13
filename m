Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eivind@kvedalen.name>) id 1QKtrx-0007YN-DH
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 17:01:34 +0200
Received: from homiemail-a32.g.dreamhost.com (caiajhbdcbef.dreamhost.com
	[208.97.132.145])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 3AF3017A812
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 07:28:46 -0700 (PDT)
Received: from homiemail-a32.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a32.g.dreamhost.com (Postfix) with ESMTP id C065D584065
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 07:28:44 -0700 (PDT)
Received: from webmail.infeline.org (caiajhbdcaid.dreamhost.com
	[208.97.132.83]) (Authenticated sender: eivindkv@infeline.org)
	by homiemail-a32.g.dreamhost.com (Postfix) with ESMTPA id 77BA6584059
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 07:28:44 -0700 (PDT)
Received: from 84.215.127.180 (proxying for 84.215.127.180)
	(SquirrelMail authenticated user eivindkv@infeline.org)
	by webmail.infeline.org with HTTP; Fri, 13 May 2011 16:28:44 +0200
Message-ID: <f8a3ce78c529edc295cc9d15986d55bd.squirrel@webmail.infeline.org>
In-Reply-To: <201105131210.17952.sgh@sgh.dk>
References: <201105131210.17952.sgh@sgh.dk>
Date: Fri, 13 May 2011 16:28:44 +0200
From: "Eivind Kvedalen" <eivind@kvedalen.name>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.21
MIME-Version: 1.0
Subject: Re: qt-x11-free_7.7.2 fail configure missing qmake
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
X-List-Received-Date: Fri, 13 May 2011 15:01:34 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I get the same problem here when trying to compile qt4-embedded_4.7.2.bb.

Build Configuration:
BB_VERSION        =3D "1.10.2"
METADATA_BRANCH   =3D "master"
METADATA_REVISION =3D "54ab33e"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "beagleboard"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v2011.05"
TARGET_FPU        =3D "hard"

The problem seems to be a dangling symlink:

build/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.7.2-r28.1/qt-=
everywhere-opensource-src-4.7.2/bin/qmake
-> build/tmp/sysroots/i686-linux/usr/bin/qmake2

(I've shortened the paths a bit)

qmake2 is in on my system located in the following directories:

build/sysroots/i686-linux-sdk/usr/local/angstrom/arm/bin/qmake2
build/work/i686-armv7a-sdk-angstrom-linux-gnueabi/qt4-tools-sdk-4.7.2-r3.=
0/package/usr/local/angstrom/arm/bin/qmake2
build/work/i686-armv7a-sdk-angstrom-linux-gnueabi/qt4-tools-sdk-4.7.2-r3.=
0/package/usr/local/angstrom/arm/bin/.debug/qmake2
build/work/i686-armv7a-sdk-angstrom-linux-gnueabi/qt4-tools-sdk-4.7.2-r3.=
0/sysroot-destdir/home/eivind/jobb/shoebox/build/tmp/sysroots/i686-linux-=
sdk/usr/local/angstrom/arm/bin/qmake2
build/work/i686-armv7a-sdk-angstrom-linux-gnueabi/qt4-tools-sdk-4.7.2-r3.=
0/image/usr/local/angstrom/arm/bin/qmake2
build/work/i686-armv7a-sdk-angstrom-linux-gnueabi/qt4-tools-sdk-4.7.2-r3.=
0/packages-split/qt4-tools-sdk-dbg/usr/local/angstrom/arm/bin/.debug/qmak=
e2
build/work/i686-armv7a-sdk-angstrom-linux-gnueabi/qt4-tools-sdk-4.7.2-r3.=
0/packages-split/qt4-tools-sdk/usr/local/angstrom/arm/bin/qmake2
build/work/i686-armv7a-sdk-angstrom-linux-gnueabi/qt4-tools-sdk-4.7.2-r3.=
0/staging-pkg/sysroots/i686-linux-sdk/usr/local/angstrom/arm/bin/qmake2

--=20
Eivind

S=F8ren Holm wrote:
>
> Hi
>
> Commit 5a6efd58cdc85d08ab9e106c84bbac5110b5aecd makes qt4 fail during
> compilation. It seems like qmake is not compiled or at least not staged=
.
> Adding DEPENDS +=3D "qt4-native" does not seem to help since qt4-native=
 is
> actually build.
>
> I've tried deleting tmp to get a fresh build but with no luck.
>
> | + ./configure -v -prefix /usr/ -bindir /usr/bin -libdir /usr/lib
> -datadir /usr/share/qt4 -sysconfdir /etc/qt4 -docdir /usr/share/doc/qt4
> -headerdir /usr/include/qt4 -plugindir /usr/lib/qt4/plugins
> -translationdir /usr/share/qt4/translations -examplesdir
> /usr/bin/qt4/examples -demosdir /usr/bin/qt4/demos -platform linux-oe-g=
++
> -xplatform linux-oe-g++ -embedded i386 -little-endian -crossarch i386
> -no-xinerama -no-xkb -no-opengl -release -no-cups -no-accessibility
> -reduce-relocations -shared -no-nas-sound -no-sm -no-nis -qt-gif
> -system-libjpeg -system-libpng -system-zlib -no-sql-ibase
> -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite
> -plugin-sql-sqlite2 -no-pch -qdbus -stl -glib -phonon -webkit
> -javascript-jit -script -scripttools -declarative -xmlpatterns -no-rpat=
h
> -qt3support -reduce-relocations -silent -no-opengl -no-embedded -xrandr
> -x11 -no-fast
> -L/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux/usr/=
lib
> -I/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux/usr/=
include
> -I/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux/usr/=
include/freetype2
> -I/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux/usr/=
include/mysql
> -I/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-linux/usr/=
include/postgresql
> | Which edition of Qt do you want to use ?
> |
> | Type 'c' if you want to use the Commercial Edition.
> | Type 'o' if you want to use the Open Source Edition.
> |
> |
> | Determining system architecture... (Linux:2.6.38-8-server:x86_64)
> |     64-bit AMD 80x86 (x86_64)
> |     'i386' is supported
> |     'x86_64' is supported
> | System architecture: 'i386'
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/fvisi=
bility.test:
> line 28: i686-angstrom-linux-g++ -march=3Dpentiumpro
> --sysroot=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/i686-angstrom-=
linux:
> No such file or directory
> | Symbol visibility control disabled.
> | Symbolic function binding enabled.
> |
> | This is the Qt for Linux/X11 Open Source Edition.
> |
> | You are licensed to use this software under the terms of
> | the Lesser GNU General Public License (LGPL) versions 2.1.
> | You are also licensed to use this software under the terms of
> | the GNU General Public License (GPL) versions 3.
> |
> | Type '3' to view the GNU General Public License version 3.
> | Type 'L' to view the Lesser GNU General Public License version 2.1.
> | Type 'yes' to accept this license offer.
> | Type 'no' to decline this license offer.
> |
> | Do you accept the terms of either license?
> | floatmath auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | floatmath disabled.
> | mmx auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | mmx disabled.
> | 3dnow auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | 3dnow disabled.
> | sse auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | sse disabled.
> | sse2 auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | sse2 disabled.
> | sse3 auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | sse3 disabled.
> | ssse3 auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | ssse3 disabled.
> | sse4_1 auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | sse4_1 disabled.
> | sse4_2 auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | sse4_2 disabled.
> | avx auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | avx disabled.
> | libtiff auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | libtiff disabled.
> | libmng auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | libmng disabled.
> | DB2 auto-detection... ()
> | /home/sgh/oe-new-oe/build-vmcERROR: Function 'do_configure' failed (s=
ee
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/temp/log.do_configure.25552
> for further information)
> |
> 16/tmp/work/i686-angstrom-linux/qt4-x11-free-4.7.2-r24.0/qt-everywhere-=
opensource-src-4.7.2/config.tests/unix/compile.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | DB2 disabled.
> | MySQL (thread-safe) auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | MySQL (thread-safe) disabled.
> | MySQL (thread-unsafe) auto-detection... ()
> |
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/config.tests/unix/compi=
le.test:
> line 71:
> /home/sgh/oe-new-oe/build-vmc16/tmp/work/i686-angstrom-linux/qt4-x11-fr=
ee-4.7.2-r24.0/qt-everywhere-opensource-src-4.7.2/bin/qmake:
> No such file or directory
> | make: *** No targets specified and no makefile found.  Stop.
> | MySQL (thread-unsafe) disabled.
> | MySQL support cannot be enabled due to functionality tests!
> |  Turn on verbose messaging (-v) to ./configure to see the final repor=
t.
> |  If you believe this message is in error you may use the continue
> |  switch (-continue) to ./configure to continue.
> NOTE: package qt4-x11-free-4.7.2-r24.0: task do_configure: Failed
> ERROR: Task 12
> (/home/sgh/oe-new-oe/org.openembedded.dev/recipes/qt4/qt4-x11-free_4.7.=
2.bb,
> do_configure) failed with exit code '1'
> ERROR:
> '/home/sgh/oe-new-oe/org.openembedded.dev/recipes/qt4/qt4-x11-free_4.7.=
2.bb'
> failed
>
> --
> S=F8ren Holm
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



