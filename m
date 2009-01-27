Received: from [198.175.154.225] (helo=us194mx04.tycoelectronics.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john.charlton@tycoelectronics.com>)
	id 1LRnxP-000677-DC for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 14:26:23 +0100
Received: from us194mx11.tycoelectronics.net ([163.241.185.106]) by
	us194mx04.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.2499); 
	Tue, 27 Jan 2009 08:18:48 -0500
Received: from us194mx07.tycoelectronics.net ([163.241.185.38]) by
	us194mx11.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.1830); 
	Tue, 27 Jan 2009 08:18:48 -0500
Received: from us194mx002.tycoelectronics.net (163.241.202.108) by
	us194mx07.tycoelectronics.net (163.241.185.38) with Microsoft SMTP
	Server (TLS) id 8.1.336.0; Tue, 27 Jan 2009 08:18:47 -0500
Received: from us194mx002.tycoelectronics.net ([163.241.202.108]) by
	us194mx002.tycoelectronics.net ([163.241.202.108]) with mapi;
	Tue, 27 Jan 2009 08:18:47 -0500
From: "Charlton, John" <john.charlton@tycoelectronics.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Jan 2009 08:18:46 -0500
Thread-Topic: [oe] Build problems
Thread-Index: AcmAeum2j4Lw3g5DS5GJWaVgSS2MHQABRL4g
Message-ID: <CF7FB0793253794F9F45991443E5FE2004E3A8C2CE@us194mx002.tycoelectronics.net>
References: <1233059140.7818.4.camel@ubuntu2>
In-Reply-To: <1233059140.7818.4.camel@ubuntu2>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 27 Jan 2009 13:18:48.0053 (UTC)
	FILETIME=[C9BD4250:01C98081]
Subject: Re: Build problems
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
X-List-Received-Date: Tue, 27 Jan 2009 13:26:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


You might try the angstrom-2008.1 DISTRO with the org.openembedded.dev bran=
ch Or angstrom-2007.1 with the org.openembedded.stable branch.  I have buil=
t oe for the "i686-generic" MACHINE with the angstrom-2007.1 with some prob=
lems but the Angstrom distro seems to define all of the things you need to =
do the build.

--John

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Paolo Cremonese
Sent: Tuesday, January 27, 2009 7:26 AM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] Build problems

Hi all.
I'm new in Openembedded.
I'm trying to build an image ( bitbake opie-image), and I get errors.
In the following the output of bitbake:

Can anyone help me?

Thanks in advance,
Paolo



NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it to=
 increase performance.
NOTE: Handling BitBake files: \ (6411/6411) [100 %]
NOTE: Parsing finished. 6140 cached, 0 parsed, 271 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200901271107: started

OE Build Configuration:
BB_VERSION        =3D "1.8.13"
METADATA_BRANCH   =3D "org.openembedded.dev"
METADATA_REVISION =3D "a41bdd6cda499d2629ce2a156348620b7ab7afc4"
TARGET_ARCH       =3D "i686"
TARGET_OS         =3D "linux"
MACHINE           =3D "i686-generic"
DISTRO            =3D "minimal"
DISTRO_VERSION    =3D ".dev-snapshot-20090127"
TARGET_FPU        =3D ""

NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for virtual/i686-linux-binutils (bin=
utils-cross, external-toolchain);
NOTE: consider defining PREFERRED_PROVIDER_virtual/i686-linux-binutils
NOTE: multiple providers are available for virtual/libqte2 (qte-mt-static, =
qte, qte-mt);
NOTE: consider defining PREFERRED_PROVIDER_virtual/libqte2
NOTE: multiple providers are available for virtual/i686-linux-libc-initial =
(glibc-initial, eglibc-initial);
NOTE: consider defining
PREFERRED_PROVIDER_virtual/i686-linux-libc-initial
NOTE: multiple providers are available for gconf (gconf, gconf-dbus);
NOTE: consider defining PREFERRED_PROVIDER_gconf
NOTE: multiple providers are available for avahi (avahi, avahi-python);
NOTE: consider defining PREFERRED_PROVIDER_avahi
NOTE: multiple providers are available for virtual/db (db3, db);
NOTE: consider defining PREFERRED_PROVIDER_virtual/db
NOTE: multiple providers are available for virtual/db-native (db3-native, d=
b-native);
NOTE: consider defining PREFERRED_PROVIDER_virtual/db-native
NOTE: multiple providers are available for gtk+ (gtk+, gtk
+-fastscaling);
NOTE: consider defining PREFERRED_PROVIDER_gtk+
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 60 of 2525 (ID:
1007, /home/paolo/oe/stuff/openembedded/packages/pkgconfig/pkgconfig-native=
_0.22.bb, do_setscene)
NOTE: package pkgconfig-native-0.22: started
NOTE: package pkgconfig-native-0.22-r7: task do_setscene: started
NOTE: package pkgconfig-native-0.22-r7: task do_setscene: completed
NOTE: package pkgconfig-native-0.22: completed
NOTE: Running task 61 of 2525 (ID:
1008, /home/paolo/oe/stuff/openembedded/packages/pkgconfig/pkgconfig-native=
_0.22.bb, do_fetch)
NOTE: package pkgconfig-native-0.22: started
NOTE: package pkgconfig-native-0.22-r7: task do_fetch: started
NOTE: fetch
http://pkgconfig.freedesktop.org/releases/pkg-config-0.22.tar.gz
--11:09:10--
http://pkgconfig.freedesktop.org/releases/pkg-config-0.22.tar.gz
           =3D> `/home/paolo/sources/pkg-config-0.22.tar.gz'
Resolving pkgconfig.freedesktop.org... 131.252.210.176 Connecting to pkgcon=
fig.freedesktop.org|131.252.210.176|:80...
connected.
HTTP request sent, awaiting response... 200 OK
Length: 1,006,425 (983K) [application/x-gzip]

100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>] 1,006,425    206.02K/s
ETA 00:00

11:09:16 (181.24 KB/s) - `/home/paolo/sources/pkg-config-0.22.tar.gz'
saved [1006425/1006425]

NOTE: package pkgconfig-native-0.22-r7: task do_fetch: completed
NOTE: package pkgconfig-native-0.22: completed
NOTE: Running task 62 of 2525 (ID:
1009, /home/paolo/oe/stuff/openembedded/packages/pkgconfig/pkgconfig-native=
_0.22.bb, do_unpack)
NOTE: package pkgconfig-native-0.22: started
NOTE: package pkgconfig-native-0.22-r7: task do_unpack: started
NOTE: Unpacking /home/paolo/sources/pkg-config-0.22.tar.gz
to /home/paolo/oe/stuff/build/tmp/work/i686-linux/pkgconfig-native-0.22-r7/
NOTE:
Unpacking /home/paolo/oe/stuff/openembedded/packages/pkgconfig/pkgconfig-0.=
22/glibconfig-sysdefs.h to /home/paolo/oe/stuff/build/tmp/work/i686-linux/p=
kgconfig-native-0.22-r7/
NOTE: package pkgconfig-native-0.22-r7: task do_unpack: completed
NOTE: package pkgconfig-native-0.22: completed
NOTE: Running task 64 of 2525 (ID:
1131, /home/paolo/oe/stuff/openembedded/packages/libtool/libtool-cross_1.5.=
10.bb, do_configure)
NOTE: package libtool-cross-1.5.10: started
NOTE: package libtool-cross-1.5.10-r10: task do_configure: started
ERROR: function do_configure failed
ERROR: log data follows
(/home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross-1.5.10-r10/te=
mp/log.do_configure.7933)
| automake (GNU automake) 1.9.3
| Written by Tom Tromey <tromey@redhat.com>.
|=20
| Copyright 2004 Free Software Foundation, Inc.
| This is free software; see the source for copying conditions.  There
is NO
| warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
| AUTOV is 1.9
| NOTE: Executing autoreconf --verbose --install --force
--exclude=3Dlibtoolize
-I /home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross-1.5.10-r10/=
libtool-1.5.10/ -I/home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/sha=
re/aclocal-1.9 -I /home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/sha=
re/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal
-I /home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross-1.5.10-r10/=
libtool-1.5.10/ -I /home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/sh=
are/aclocal-1.9 -I /home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/sh=
are/aclocal --force
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: adding subdirectory libltdl to autoreconf
| autoreconf: Entering directory `libltdl'
| autoreconf:
running: /home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/bin/autoconf=
 --include=3D/home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross-1=
.5.10-r10/libtool-1.5.10/ --include=3D/home/paolo/oe/stuff/build/tmp/stagin=
g/i686-linux/usr/share/aclocal-1.9 --include=3D/home/paolo/oe/stuff/build/t=
mp/staging/i686-linux/usr/share/aclocal --force --warnings=3Dcross
| autoreconf:
running: /home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/bin/autohead=
er --include=3D/home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross=
-1.5.10-r10/libtool-1.5.10/ --include=3D/home/paolo/oe/stuff/build/tmp/stag=
ing/i686-linux/usr/share/aclocal-1.9 --include=3D/home/paolo/oe/stuff/build=
/tmp/staging/i686-linux/usr/share/aclocal --force --warnings=3Dcross
| autoreconf: running: automake --foreign --add-missing --copy
--force-missing --warnings=3Dcross
| automake: unknown warning category `cross'
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `libltdl'
| autoreconf: configure.ac: not using Autoheader
| automake: unknown warning category `cross'
| autoreconf: Leaving directory `.'
| NOTE:
Running /home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross-1.5.10=
-r10/libtool-1.5.10/configure 		    --build=3Di686-linux 		    --host=3Di68=
6-linux 		    --target=3Di686-linux 		    --prefix=3D/home/paolo/oe/stuff/b=
uild/tmp/staging/i686-linux/usr 		    --exec_prefix=3D/home/paolo/oe/stuff/=
build/tmp/staging/i686-linux/usr 		    --bindir=3D/home/paolo/oe/stuff/buil=
d/tmp/staging/i686-linux/usr/bin 		    --sbindir=3D/usr/sbin 		    --libexe=
cdir=3D/usr/libexec 		    --datadir=3D/usr/share 		    --sysconfdir=3D/etc =
		    --sharedstatedir=3D/usr/com 		    --localstatedir=3D/var 		    --libd=
ir=3D/usr/lib 		    --includedir=3D/usr/include 		    --oldincludedir=3D/us=
r/include 		    --infodir=3D/usr/share/info 		    --mandir=3D/usr/share/man=
 			 		    ...
| configure: loading site
script /home/paolo/oe/stuff/openembedded/site/endian-little
| configure: loading site
script /home/paolo/oe/stuff/openembedded/site/common-linux
| configure: loading site
script /home/paolo/oe/stuff/openembedded/site/common-glibc
| configure: loading site
script /home/paolo/oe/stuff/openembedded/site/ix86-common
| configure: loading site
script /home/paolo/oe/stuff/openembedded/site/common
| configure: loading site
script /home/paolo/oe/stuff/openembedded/site/common
| checking for a BSD-compatible install... /usr/bin/install -c checking=20
| whether build environment is sane... yes checking for gawk... gawk=20
| checking whether make sets $(MAKE)... yes checking for=20
| i686-linux-gcc... ccache i686-linux-gcc -march=3Dpentiumpro checking for=
=20
| C compiler default output file name...
| configure: error: C compiler cannot create executables See=20
| `config.log' for more details.
| FATAL: oe_runconf failed
NOTE: Task
failed: /home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross-1.5.10=
-r10/temp/log.do_configure.7933
NOTE: package libtool-cross-1.5.10-r10: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package libtool-cross-1.5.10: failed
ERROR: Build
of /home/paolo/oe/stuff/openembedded/packages/libtool/libtool-cross_1.5.10.=
bb do_configure failed
ERROR: Task 1131
(/home/paolo/oe/stuff/openembedded/packages/libtool/libtool-cross_1.5.10.bb=
, do_configure) failed
NOTE: Tasks Summary: Attempted 63 tasks of which 60 didn't need to be rerun=
 and 1 failed.
ERROR:
'/home/paolo/oe/stuff/openembedded/packages/libtool/libtool-cross_1.5.10.bb=
' failed
NOTE: build 200901271107: completed
paolo@ubuntu2:~/oe/stuff/build$=20




_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


