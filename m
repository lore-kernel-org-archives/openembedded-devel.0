Received: from bay0-omc4-s15.bay0.hotmail.com ([65.54.190.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1NbxMg-0002c8-FO
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 15:35:02 +0100
Received: from BAY127-W14 ([65.54.190.199]) by bay0-omc4-s15.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 1 Feb 2010 06:32:27 -0800
Message-ID: <BAY127-W14AEB2F48C0FDE1C76BE47D8580@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Feb 2010 19:32:28 +0500
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 01 Feb 2010 14:32:27.0837 (UTC)
	FILETIME=[60FA46D0:01CAA34B]
X-SA-Exim-Connect-IP: 65.54.190.217
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: problem in bitbaking ossie-image
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
X-List-Received-Date: Mon, 01 Feb 2010 14:35:02 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello
I am building ossie-image in openembedded using bitbake command but it is g=
iving error of not finding boost_filesystem library. How I can resolve this=
 problem? Plz guide me.
Terminal window is looking like this.
[saleh@localhost ~]$ bitbake ossie-imageNOTE: Handling BitBake files: - (76=
60/7660) [100 %]
NOTE: Parsing finished. 7053 cached=2C 300 parsed=2C 307 skipped=2C 0 maske=
d.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1224 of 2992 (ID: 1133=2C /oe/ossie_collection/recipes/o=
ssie-libraries/ossie-cf_svn.bb=2C do_configure)
ERROR: function do_configure failed
ERROR: log data follows (/home/saleh/tmp/work/armv5te-angstrom-linux-gnueab=
i/ossie-cf-0.0.0+svnr247-r1/temp/log.do_configure.3404)
| automake (GNU automake) 1.10.2
| Copyright (C) 2008 Free Software Foundation=2C Inc.
| License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.h=
tml>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY=2C to the extent permitted by law.
|=20
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.10
| NOTE: Executing autoreconf --verbose --install --force --exclude=3Dautopo=
int -I/home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclo=
cal-1.10 -I /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/shar=
e/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal -I /home/saleh/tmp/staging/armv5te-angstrom-=
linux-gnueabi/usr/share/aclocal-1.10 -I /home/saleh/tmp/staging/armv5te-ang=
strom-linux-gnueabi/usr/share/aclocal --force
| /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/=
libpcap.m4:923: warning: underquoted definition of AC_LBL_LINUX_TPACKET_AUX=
DATA_TP_VLAN_TCI
| /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/=
libpcap.m4:923:   run info '(automake)Extending aclocal'
| /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/=
libpcap.m4:923:   or see http://sources.redhat.com/automake/automake.html#E=
xtending-aclocal
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in `.'.
| libtoolize: copying file `./ltmain.sh'
| libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.ac a=
nd
| libtoolize: rerunning libtoolize=2C to keep the correct libtool macros in=
-tree.
| libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/=
libpcap.m4:923: warning: underquoted definition of AC_LBL_LINUX_TPACKET_AUX=
DATA_TP_VLAN_TCI
| /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/=
libpcap.m4:923:   run info '(automake)Extending aclocal'
| /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/=
libpcap.m4:923:   or see http://sources.redhat.com/automake/automake.html#E=
xtending-aclocal
| autoreconf: running: /home/saleh/tmp/staging/i686-linux/usr/bin/autoconf =
--include=3D/home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/shar=
e/aclocal-1.10 --include=3D/home/saleh/tmp/staging/armv5te-angstrom-linux-g=
nueabi/usr/share/aclocal --force --warnings=3Dcross
| autoreconf: configure.ac: not using Autoheader
| autoreconf: running: automake --foreign --add-missing --copy --force-miss=
ing --warnings=3Dcross
| automake: unknown warning category `cross'
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `.'
| NOTE: Running /home/saleh/tmp/work/armv5te-angstrom-linux-gnueabi/ossie-c=
f-0.0.0+svnr247-r1/trunk/configure               --build=3Di686-linux      =
        --host=3Darm-angstrom-linux-gnueabi               --target=3Darm-an=
gstrom-linux-gnueabi     --prefix=3D/usr                   --exec_prefix=3D=
/usr              --bindir=3D/usr/bin               --sbindir=3D/usr/sbin  =
                   --libexecdir=3D/usr/libexec               --datadir=3D/u=
sr/share                    --sysconfdir=3D/etc      --sharedstatedir=3D/co=
m                    --localstatedir=3D/var                   --libdir=3D/u=
sr/lib                --includedir=3D/usr/include               --oldinclud=
edir=3D/usr/include                    --infodir=3D/usr/share/info         =
     --mandir=3D/usr/share/man                      --with-omniorb=3D/home/=
saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/bin/.. IDL=3D/home/sal=
eh/tmp/staging/i686-linux/usr/bin/omniidl                     ...
| configure: WARNING: unrecognized options: --with-omniorb
| configure: loading site script /oe/openembedded/site/endian-little
| configure: loading site script /oe/openembedded/site/common-linux
| configure: loading site script /oe/openembedded/site/common-glibc
| configure: loading site script /oe/openembedded/site/arm-common
| configure: loading site script /oe/openembedded/site/arm-linux
| configure: loading site script /oe/openembedded/site/common
| configure: loading site script /oe/openembedded/site/common
| checking for a BSD-compatible install... /usr/bin/install -c
| checking whether build environment is sane... yes
| checking for a thread-safe mkdir -p... /bin/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking for arm-angstrom-linux-gnueabi-strip... arm-angstrom-linux-gnuea=
bi-strip
| checking for C++ compiler default output file name... a.out
| checking whether the C++ compiler works... yes
| checking whether we are cross compiling... yes
| checking for suffix of executables...
| checking for suffix of object files... o
| checking whether we are using the GNU C++ compiler... yes
| checking whether ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -=
mtune=3Darm926ej-s -mthumb-interwork -mno-thumb accepts -g... yes
| checking for style of include used by make... GNU
| checking dependency style of ccache arm-angstrom-linux-gnueabi-g++ -march=
=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb... gcc3
| checking for a BSD-compatible install... /usr/bin/install -c
| checking whether make sets $(MAKE)... (cached) yes
| checking build system type... i686-pc-linux-gnu
| checking host system type... arm-angstrom-linux-gnueabi
| checking for arm-angstrom-linux-gnueabi-gcc... ccache arm-angstrom-linux-=
gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thu=
mb
| checking whether we are using the GNU C compiler... yes
| checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -=
mtune=3Darm926ej-s -mthumb-interwork -mno-thumb accepts -g... yes
| checking for ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtun=
e=3Darm926ej-s -mthumb-interwork -mno-thumb option to accept ISO C89... non=
e needed
| checking dependency style of ccache arm-angstrom-linux-gnueabi-gcc -march=
=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb... gcc3
| checking for a sed that does not truncate output... /bin/sed
| checking for grep that handles long lines and -e... /bin/grep
| checking for egrep... /bin/grep -E
| checking for fgrep... /bin/grep -F
| checking for ld used by ccache arm-angstrom-linux-gnueabi-gcc -march=3Dar=
mv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb... arm-angstrom-linu=
x-gnueabi-ld
| checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... arm-angstrom-linux=
-gnueabi-nm
| checking the name lister (arm-angstrom-linux-gnueabi-nm) interface... BSD=
 nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 98304
| checking whether the shell understands some XSI constructs... yes
| checking whether the shell understands "+=3D"... yes
| checking for arm-angstrom-linux-gnueabi-ld option to reload object files.=
.. -r
| checking for arm-angstrom-linux-gnueabi-objdump... arm-angstrom-linux-gnu=
eabi-objdump
| checking how to recognize dependent libraries... pass_all
| checking for arm-angstrom-linux-gnueabi-ar... arm-angstrom-linux-gnueabi-=
ar
| checking for arm-angstrom-linux-gnueabi-strip... (cached) arm-angstrom-li=
nux-gnueabi-strip
| checking for arm-angstrom-linux-gnueabi-ranlib... arm-angstrom-linux-gnue=
abi-ranlib
| checking command to parse arm-angstrom-linux-gnueabi-nm output from ccach=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb object... ok
| checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc =
-E
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
| checking for dlfcn.h... yes
| checking whether we are using the GNU C++ compiler... (cached) yes
| checking whether ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -=
mtune=3Darm926ej-s -mthumb-interwork -mno-thumb accepts -g... (cached) yes
| checking dependency style of ccache arm-angstrom-linux-gnueabi-g++ -march=
=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb... (cached) gcc=
3
| checking how to run the C++ preprocessor... ccache arm-angstrom-linux-gnu=
eabi-g++ -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb =
-E
| checking for objdir... .libs
| checking if ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=
=3Darm926ej-s -mthumb-interwork -mno-thumb supports -fno-rtti -fno-exceptio=
ns... no
| checking for ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtun=
e=3Darm926ej-s -mthumb-interwork -mno-thumb option to produce PIC... -fPIC =
-DPIC
| checking if ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=
=3Darm926ej-s -mthumb-interwork -mno-thumb PIC flag -fPIC -DPIC works... ye=
s
| checking if ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=
=3Darm926ej-s -mthumb-interwork -mno-thumb static flag -static works... yes
| checking if ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=
=3Darm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o... yes
| checking if ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=
=3Darm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o... (cached=
) yes
| checking whether the ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5=
te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb linker (arm-angstrom-li=
nux-gnueabi-ld) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... yes
| checking for ld used by ccache arm-angstrom-linux-gnueabi-g++ -march=3Dar=
mv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb... arm-angstrom-linu=
x-gnueabi-ld
| checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld... yes
| checking whether the ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5=
te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb linker (arm-angstrom-li=
nux-gnueabi-ld) supports shared libraries... yes
| checking for ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtun=
e=3Darm926ej-s -mthumb-interwork -mno-thumb option to produce PIC... -fPIC =
-DPIC
| checking if ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=
=3Darm926ej-s -mthumb-interwork -mno-thumb PIC flag -fPIC -DPIC works... ye=
s
| checking if ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=
=3Darm926ej-s -mthumb-interwork -mno-thumb static flag -static works... yes
| checking if ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=
=3Darm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o... yes
| checking if ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=
=3Darm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o... (cached=
) yes
| checking whether the ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5=
te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb linker (arm-angstrom-li=
nux-gnueabi-ld) supports shared libraries... yes
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking for main in -lomniORB4... yes
| checking omniORB4/CORBA.h usability... yes
| checking omniORB4/CORBA.h presence... yes
| checking for omniORB4/CORBA.h... yes
| checking for omniidl... /home/saleh/tmp/staging/i686-linux/usr/bin/omniid=
l
| checking boost/filesystem/operations.hpp usability... yes
| checking boost/filesystem/operations.hpp presence... yes
| checking for boost/filesystem/operations.hpp... yes
| checking for main in -lboost_filesystem... no
| configure: error: cannot find boost_filesystem library.
| FATAL: oe_runconf failed
NOTE: Task failed: /home/saleh/tmp/work/armv5te-angstrom-linux-gnueabi/ossi=
e-cf-0.0.0+svnr247-r1/temp/log.do_configure.3404
ERROR: TaskFailed event exception=2C aborting
ERROR: Build of /oe/ossie_collection/recipes/ossie-libraries/ossie-cf_svn.b=
b do_configure failed
ERROR: Task 1133 (/oe/ossie_collection/recipes/ossie-libraries/ossie-cf_svn=
.bb=2C do_configure) failed
NOTE: Tasks Summary: Attempted 1223 tasks of which 1223 didn't need to be r=
erun and 1 failed.
ERROR: '/oe/ossie_collection/recipes/ossie-libraries/ossie-cf_svn.bb' faile=
d

Saleh

 		 	   		 =20
_________________________________________________________________
Hotmail: Free=2C trusted and rich email service.
https://signup.live.com/signup.aspx?id=3D60969=

