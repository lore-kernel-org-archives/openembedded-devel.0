Received: from bay0-omc4-s11.bay0.hotmail.com ([65.54.190.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1OKpra-0003BC-1y
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 11:40:24 +0200
Received: from BAY127-W9 ([65.54.190.199]) by bay0-omc4-s11.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Sat, 5 Jun 2010 02:35:00 -0700
Message-ID: <BAY127-W96D63AA89D16355433704D8D30@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Sat, 5 Jun 2010 15:34:59 +0600
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Jun 2010 09:35:00.0279 (UTC)
	FILETIME=[5E3A0C70:01CB0492]
X-SA-Exim-Connect-IP: 65.54.190.213
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: glib configuration failed
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
X-List-Received-Date: Sat, 05 Jun 2010 09:40:24 -0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


 Hello
I am bitbaking console-image and  getting an error of failing configuration=
 of glib-2.0. Kindly tell me how to remove it.Terminal log follows.
Saleh

[Saleh@localhost ~]$ bitbake console-image
NOTE: Handling BitBake files: \ (8169/8169) [100 %]
NOTE: Parsing finished. 7530 cached=2C 309 parsed=2C 330 skipped=2C 0 maske=
d.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 432 of 3200 (ID: 1122=2C /sdr/openembedded/recipes/glib-=
2.0/glib-2.0_2.23.6.bb=2C do_configure)
ERROR: function do_configure failed
ERROR: log data follows (/sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi=
/glib-2.0-2.23.6-r1/temp/log.do_configure.3044)
| automake (GNU automake) 1.10.3
| Copyright (C) 2009 Free Software Foundation=2C Inc.
| License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.h=
tml>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY=2C to the extent permitted by law.
|=20
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.10
| NOTE: Executing autoreconf --verbose --install --force --exclude=3Dautopo=
int -I /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/glib-2.0-2.23.6-r=
1/glib-2.23.6/ -I /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/glib-2=
.0-2.23.6-r1/glib-2.23.6/m4macros/ -I/sdr/build/tmp/staging/armv5te-angstro=
m-linux-gnueabi/usr/share/aclocal-1.10 -I /sdr/build/tmp/staging/armv5te-an=
gstrom-linux-gnueabi/usr/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.in: not using Gettext
| autoreconf: running: aclocal -I /sdr/build/tmp/work/armv5te-angstrom-linu=
x-gnueabi/glib-2.0-2.23.6-r1/glib-2.23.6/ -I /sdr/build/tmp/work/armv5te-an=
gstrom-linux-gnueabi/glib-2.0-2.23.6-r1/glib-2.23.6/m4macros/ -I /sdr/build=
/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 -I /sdr/=
build/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal -I /sdr/=
build/tmp/work/armv5te-angstrom-linux-gnueabi/glib-2.0-2.23.6-r1/glib-2.23.=
6/ -I /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/glib-2.0-2.23.6-r1=
/glib-2.23.6/m4macros/ -I /sdr/build/tmp/staging/armv5te-angstrom-linux-gnu=
eabi/usr/share/aclocal-1.10 -I /sdr/build/tmp/staging/armv5te-angstrom-linu=
x-gnueabi/usr/share/aclocal --force
| autoreconf: configure.in: tracing
| configure.in:560: warning: AC_RUN_IFELSE called without default to allow =
cross compiling
| ../../lib/autoconf/general.m4:2716: AC_RUN_IFELSE is expanded from...
| ../../lib/autoconf/general.m4:2732: AC_TRY_RUN is expanded from...
| configure.in:560: the top level
| configure.in:555: warning: AC_RUN_IFELSE called without default to allow =
cross compiling
| configure.in:555: the top level
| configure.in:682: warning: AC_RUN_IFELSE called without default to allow =
cross compiling
| ../../lib/m4sugar/m4sh.m4:598: AS_IF is expanded from...
| ../../lib/autoconf/general.m4:1999: AC_CACHE_VAL is expanded from...
| ../../lib/autoconf/general.m4:2020: AC_CACHE_CHECK is expanded from...
| configure.in:682: the top level
| configure.in:1151: warning: AC_RUN_IFELSE called without default to allow=
 cross compiling
| configure.in:1151: the top level
| configure.in:1500: warning: AC_RUN_IFELSE called without default to allow=
 cross compiling
| configure.in:1500: the top level
| configure.in:2175: warning: AC_RUN_IFELSE called without default to allow=
 cross compiling
| configure.in:2175: the top level
| configure.in:2214: warning: AC_RUN_IFELSE called without default to allow=
 cross compiling
| configure.in:2214: the top level
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in `.'.
| libtoolize: copying file `./ltmain.sh'
| libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.in a=
nd
| libtoolize: rerunning libtoolize=2C to keep the correct libtool macros in=
-tree.
| libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| autoreconf: running: /sdr/build/tmp/staging/i686-linux/usr/bin/autoconf -=
-include=3D/sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/glib-2.0-2.23=
.6-r1/glib-2.23.6/ --include=3D/sdr/build/tmp/work/armv5te-angstrom-linux-g=
nueabi/glib-2.0-2.23.6-r1/glib-2.23.6/m4macros/ --include=3D/sdr/build/tmp/=
staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 --include=3D/=
sdr/build/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal --fo=
rce --warnings=3Dcross
| configure.in:560: warning: AC_RUN_IFELSE called without default to allow =
cross compiling
| ../../lib/autoconf/general.m4:2716: AC_RUN_IFELSE is expanded from...
| ../../lib/autoconf/general.m4:2732: AC_TRY_RUN is expanded from...
| configure.in:560: the top level
| configure.in:555: warning: AC_RUN_IFELSE called without default to allow =
cross compiling
| configure.in:555: the top level
| configure.in:682: warning: AC_RUN_IFELSE called without default to allow =
cross compiling
| ../../lib/m4sugar/m4sh.m4:598: AS_IF is expanded from...
| ../../lib/autoconf/general.m4:1999: AC_CACHE_VAL is expanded from...
| ../../lib/autoconf/general.m4:2020: AC_CACHE_CHECK is expanded from...
| configure.in:682: the top level
| configure.in:1151: warning: AC_RUN_IFELSE called without default to allow=
 cross compiling
| configure.in:1151: the top level
| configure.in:1500: warning: AC_RUN_IFELSE called without default to allow=
 cross compiling
| configure.in:1500: the top level
| configure.in:2175: warning: AC_RUN_IFELSE called without default to allow=
 cross compiling
| configure.in:2175: the top level
| configure.in:2214: warning: AC_RUN_IFELSE called without default to allow=
 cross compiling
| configure.in:2214: the top level
| autoreconf: running: /sdr/build/tmp/staging/i686-linux/usr/bin/autoheader=
 --include=3D/sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/glib-2.0-2.=
23.6-r1/glib-2.23.6/ --include=3D/sdr/build/tmp/work/armv5te-angstrom-linux=
-gnueabi/glib-2.0-2.23.6-r1/glib-2.23.6/m4macros/ --include=3D/sdr/build/tm=
p/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 --include=
=3D/sdr/build/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal =
--force --warnings=3Dcross
| autoreconf: running: automake --foreign --add-missing --copy --force-miss=
ing --warnings=3Dcross
| automake: unknown warning category `cross'
| gtk-doc.make:26: EXTRA_DIST multiply defined in condition TRUE ...
| docs/reference/gio/Makefile.am:122:   `gtk-doc.make' included from here
| Makefile.decl:8: ... `EXTRA_DIST' previously defined here
| docs/reference/gio/Makefile.am:1:   `Makefile.decl' included from here
| gtk-doc.make:26: EXTRA_DIST multiply defined in condition TRUE ...
| docs/reference/glib/Makefile.am:79:   `gtk-doc.make' included from here
| Makefile.decl:8: ... `EXTRA_DIST' previously defined here
| docs/reference/glib/Makefile.am:2:   `Makefile.decl' included from here
| gtk-doc.make:26: EXTRA_DIST multiply defined in condition TRUE ...
| docs/reference/gobject/Makefile.am:61:   `gtk-doc.make' included from her=
e
| Makefile.decl:8: ... `EXTRA_DIST' previously defined here
| docs/reference/gobject/Makefile.am:2:   `Makefile.decl' included from her=
e
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `.'
| NOTE: Running /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/glib-2.0=
-2.23.6-r1/glib-2.23.6/configure                 --build=3Di686-linux      =
        --host=3Darm-angstrom-linux-gnueabi               --target=3Darm-an=
gstrom-linux-gnueabi     --prefix=3D/usr                   --exec_prefix=3D=
/usr              --bindir=3D/usr/bin               --sbindir=3D/usr/sbin  =
                   --libexecdir=3D/usr/libexec               --datadir=3D/u=
sr/share                    --sysconfdir=3D/etc      --sharedstatedir=3D/co=
m                    --localstatedir=3D/var                   --libdir=3D/u=
sr/lib                --includedir=3D/usr/include               --oldinclud=
edir=3D/usr/include                    --infodir=3D/usr/share/info         =
     --mandir=3D/usr/share/man                      --disable-debug        =
            ...
| configure: loading site script /sdr/openembedded/site/endian-little
| configure: loading site script /sdr/openembedded/site/common-linux
| configure: loading site script /sdr/openembedded/site/common-glibc
| configure: loading site script /sdr/openembedded/site/arm-common
| configure: loading site script /sdr/openembedded/site/arm-linux
| configure: loading site script /sdr/openembedded/site/common
| configure: loading site script /sdr/openembedded/site/common
| checking for a BSD-compatible install... /sdr/build/tmp/staging/i686-linu=
x/usr/bin/install -c
| checking whether build environment is sane... yes
| checking for arm-angstrom-linux-gnueabi-strip... arm-angstrom-linux-gnuea=
bi-strip
| checking for a thread-safe mkdir -p... /sdr/build/tmp/staging/i686-linux/=
usr/bin/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether to enable maintainer-specific portions of Makefiles... n=
o
| checking build system type... i686-pc-linux-gnu
| checking host system type... arm-angstrom-linux-gnueabi
| checking for the BeOS... no
| checking for Win32... no
| checking for Mac OS X Carbon support... checking for style of include use=
d by make... GNU
| checking for arm-angstrom-linux-gnueabi-gcc... ccache arm-angstrom-linux-=
gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thu=
mb
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -=
mtune=3Darm926ej-s -mthumb-interwork -mno-thumb accepts -g... yes
| checking for ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtun=
e=3Darm926ej-s -mthumb-interwork -mno-thumb option to accept ISO C89... non=
e needed
| checking dependency style of ccache arm-angstrom-linux-gnueabi-gcc -march=
=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb... gcc3
| checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc =
-E
| no
| checking whether to enable garbage collector friendliness... no
| checking whether to disable memory pools... no
| checking for arm-angstrom-linux-gnueabi-gcc... (cached) ccache arm-angstr=
om-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork=
 -mno-thumb
| checking whether we are using the GNU C compiler... (cached) yes
| checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -=
mtune=3Darm926ej-s -mthumb-interwork -mno-thumb accepts -g... (cached) yes
| checking for ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtun=
e=3Darm926ej-s -mthumb-interwork -mno-thumb option to accept ISO C89... (ca=
ched) none needed
| checking dependency style of ccache arm-angstrom-linux-gnueabi-gcc -march=
=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb... (cached) gcc=
3
| checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc =
-E
| checking for arm-angstrom-linux-gnueabi-c++... ccache arm-angstrom-linux-=
gnueabi-g++ -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thu=
mb
| checking whether we are using the GNU C++ compiler... yes
| checking whether ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -=
mtune=3Darm926ej-s -mthumb-interwork -mno-thumb accepts -g... yes
| checking dependency style of ccache arm-angstrom-linux-gnueabi-g++ -march=
=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb... gcc3
| checking for arm-angstrom-linux-gnueabi-gcc... (cached) ccache arm-angstr=
om-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork=
 -mno-thumb
| checking whether we are using the GNU C compiler... (cached) yes
| checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -=
mtune=3Darm926ej-s -mthumb-interwork -mno-thumb accepts -g... (cached) yes
| checking for ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtun=
e=3Darm926ej-s -mthumb-interwork -mno-thumb option to accept ISO C89... (ca=
ched) none needed
| checking dependency style of ccache arm-angstrom-linux-gnueabi-gcc -march=
=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb... (cached) gcc=
3
| checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -=
mtune=3Darm926ej-s -mthumb-interwork -mno-thumb and cc understand -c and -o=
 together... yes
| checking for special C compiler options needed for large files... no
| checking for _FILE_OFFSET_BITS value needed for large files... (cached) 6=
4
| checking for pkg-config... /sdr/build/tmp/staging/i686-linux/usr/bin/pkg-=
config
| checking for gawk... (cached) gawk
| checking for perl5... no
| checking for perl... perl
| checking for indent... indent
| checking for perl... /usr/bin/perl
| checking for a Python interpreter with version >=3D 2.4... python
| checking for python... /sdr/build/tmp/staging/i686-linux/usr/bin/python
| checking for python version... 2.6
| checking for python platform... linux2
| checking for python script directory... ${prefix}/lib/python2.6/site-pack=
ages
| checking for python extension module directory... ${exec_prefix}/lib/pyth=
on2.6/site-packages
| checking for iconv_open... yes
| checking for grep that handles long lines and -e... /bin/grep
| checking for egrep... /bin/grep -E
| checking whether we are using the GNU C Library 2.1 or newer... yes
| checking Whether to cache iconv descriptors... no
| checking for ANSI C header files... yes
| checking for sys/types.h... yes
| checking for sys/stat.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for memory.h... yes
| checking for strings.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for unistd.h... yes
| checking for inflate in -lz... no
| configure: error: *** Working zlib library and headers not found ***
| FATAL: oe_runconf failed
NOTE: Task failed: /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/glib-=
2.0-2.23.6-r1/temp/log.do_configure.3044
ERROR: TaskFailed event exception=2C aborting
ERROR: Build of /sdr/openembedded/recipes/glib-2.0/glib-2.0_2.23.6.bb do_co=
nfigure failed
ERROR: Task 1122 (/sdr/openembedded/recipes/glib-2.0/glib-2.0_2.23.6.bb=2C =
do_configure) failed
NOTE: Tasks Summary: Attempted 431 tasks of which 431 didn't need to be rer=
un and 1 failed.
ERROR: '/sdr/openembedded/recipes/glib-2.0/glib-2.0_2.23.6.bb' failed

 		 	   		 =20
Your E-mail and More On-the-Go. Get Windows Live Hotmail Free. Sign up now.=
 		 	   		 =20
_________________________________________________________________
Hotmail: Trusted email with Microsoft=92s powerful SPAM protection.
https://signup.live.com/signup.aspx?id=3D60969=

