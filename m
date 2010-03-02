Received: from bay0-omc4-s1.bay0.hotmail.com ([65.54.190.203])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1NmUJg-0004RU-Ca
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 16:47:30 +0100
Received: from BAY127-W17 ([65.54.190.199]) by bay0-omc4-s1.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 2 Mar 2010 07:44:32 -0800
Message-ID: <BAY127-W1722D270F69AFCCF361A0BD83B0@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Mar 2010 20:44:32 +0500
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 02 Mar 2010 15:44:32.0452 (UTC)
	FILETIME=[40A0E840:01CABA1F]
X-SA-Exim-Connect-IP: 65.54.190.203
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_SORBS_WEB,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Boost library problem
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
X-List-Received-Date: Tue, 02 Mar 2010 15:47:30 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


If I myself want to update it how I can do it? i.e. which recipes I need to=
 modify? Any guidance?
Regards=20
Saleh




Koen Kooi <k.kooi <at> student.utwente.nl> writes:

>=20
>=20
> Hi=2C
>=20
> I suspect it's called boost_filesystem-mt in OE and you'll need to ask
> the ossie guys to updated their autofoo to have option to specify the
> name. If they already have such an option=2C bug them to update their
> recipes :)
>=20
> regards=2C
>=20
> Koen
>=20
> On 02-03-10 15:23=2C saleh usman wrote:
> >=20
> > Hi=20
> > I am getting an error of boost library while bitbaking an image.OE can =
not find boost file system
> library.Terminal log shows this error as
> > | configure: error: cannot find boost_filesystem library.
> >=20
> > Image is of ossie and I am unable to resolve this problem.How I can get=
 rid of this error.Kindly guide me.
> > Saleh
> >=20
> > Terminal log is looking like as follows.
> >=20
> > [saleh <at> localhost ~]$ bitbake ossie-image
> > NOTE: Handling BitBake files: - (7660/7660) [100 %]
> > NOTE: Parsing finished. 7053 cached=2C 300 parsed=2C 307 skipped=2C 0 m=
asked.
> > NOTE: Resolving any missing task queue dependencies
> > NOTE: Preparing runqueue
> > NOTE: Executing runqueue
> > NOTE: Running task 1224 of 2992 (ID: 1133=2C
> /oe/ossie_collection/recipes/ossie-libraries/ossie-cf_svn.bb=2C do_config=
ure)
> > ERROR: function do_configure failed
> > ERROR:
> > log data follows
> > (/home/saleh/tmp/work/armv5te-angstrom-linux-gnueabi/ossie-cf-0.0.0+svn=
r247-r1/temp/log.do_configure.3404)
> > | automake (GNU automake) 1.10.2
> > | Copyright (C) 2008 Free Software Foundation=2C Inc.
> > | License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/g=
pl.html>
> > | This is free software: you are free to change and redistribute it.
> > | There is NO WARRANTY=2C to the extent permitted by law.
> > |=20
> > | Written by Tom Tromey <tromey <at> redhat.com>
> > |        and Alexandre Duret-Lutz <adl <at> gnu.org>.
> > | AUTOV is 1.10
> > |
> > NOTE: Executing autoreconf --verbose --install --force
> > --exclude=3Dautopoint
> > -I/home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclo=
cal-1.10
> > -I
> > /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/acloca=
l
> > | autoreconf: Entering directory `.'
> > | autoreconf: configure.ac: not using Gettext
> > |
> > autoreconf: running: aclocal -I
> > /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/acloca=
l-1.10
> > -I
> > /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/acloca=
l
> > --force
> > |
> > /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/acloca=
l/libpcap.m4:923:
> > warning: underquoted definition of
> > AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI
> > |
> > /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/acloca=
l/libpcap.m4:923: =20
> > run info '(automake)Extending aclocal'
> > |
> > /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/acloca=
l/libpcap.m4:923: =20
> > or see
> > http://sources.redhat.com/automake/automake.html#Extending-aclocal
> > | autoreconf: configure.ac: tracing
> > | autoreconf: running: libtoolize --copy --force
> > | libtoolize: putting auxiliary files in `.'.
> > | libtoolize: copying file `./ltmain.sh'
> > | libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.=
ac and
> > | libtoolize: rerunning libtoolize=2C to keep the correct libtool macro=
s in-tree.
> > | libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am=
.
> > |
> > /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/acloca=
l/libpcap.m4:923:
> > warning: underquoted definition of
> > AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI
> > |
> > /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/acloca=
l/libpcap.m4:923: =20
> > run info '(automake)Extending aclocal'
> > |
> > /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/acloca=
l/libpcap.m4:923: =20
> > or see
> > http://sources.redhat.com/automake/automake.html#Extending-aclocal
> > |
> > autoreconf: running:
> > /home/saleh/tmp/staging/i686-linux/usr/bin/autoconf
> > --include=3D/home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/=
share/aclocal-1.10
> > --include=3D/home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/=
share/aclocal
> > --force --warnings=3Dcross
> > | autoreconf: configure.ac: not using Autoheader
> > | autoreconf: running: automake --foreign --add-missing --copy --force-=
missing --warnings=3Dcross
> > | automake: unknown warning category `cross'
> > | autoreconf: running: gnu-configize
> > | autoreconf: Leaving directory `.'
> > |
> > NOTE: Running
> >
> /home/saleh/tmp/work/armv5te-angstrom-linux-gnueabi/ossie-cf-0.0.0+svnr24=
7-r1/trunk/configure
>=20
> > --build=3Di686-linux            =20
> > --host=3Darm-angstrom-linux-gnueabi             =20
> > --target=3Darm-angstrom-linux-gnueabi     --prefix=3D/usr              =
   =20
> > --exec_prefix=3D/usr              --bindir=3D/usr/bin             =20
> > --sbindir=3D/usr/sbin                   =20
> > --libexecdir=3D/usr/libexec             =20
> > --datadir=3D/usr/share                    --sysconfdir=3D/etc    =20
> > --sharedstatedir=3D/com                  =20
> > --localstatedir=3D/var                   --libdir=3D/usr/lib           =
   =20
> > --includedir=3D/usr/include             =20
> > --oldincludedir=3D/usr/include                  =20
> > --infodir=3D/usr/share/info            =20
> > --mandir=3D/usr/share/man                    =20
> > --with-omniorb=3D/home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi=
/usr/bin/..
> > IDL=3D/home/saleh/tmp/staging/i686-linux/usr/bin/omniidl               =
    =20
> > ...
> > | configure: WARNING: unrecognized options: --with-omniorb
> > | configure: loading site script /oe/openembedded/site/endian-little
> > | configure: loading site script /oe/openembedded/site/common-linux
> > | configure: loading site script /oe/openembedded/site/common-glibc
> > | configure: loading site script /oe/openembedded/site/arm-common
> > | configure: loading site script /oe/openembedded/site/arm-linux
> > | configure: loading site script /oe/openembedded/site/common
> > | configure: loading site script /oe/openembedded/site/common
> > | checking for a BSD-compatible install... /usr/bin/install -c
> > | checking whether build environment is sane... yes
> > | checking for a thread-safe mkdir -p... /bin/mkdir -p
> > | checking for gawk... gawk
> > | checking whether make sets $(MAKE)... yes
> > | checking for arm-angstrom-linux-gnueabi-strip... arm-angstrom-linux-g=
nueabi-strip
> > | checking for C++ compiler default output file name... a.out
> > | checking whether the C++ compiler works... yes
> > | checking whether we are cross compiling... yes
> > | checking for suffix of executables...
> > | checking for suffix of object files... o
> > | checking whether we are using the GNU C++ compiler... yes
> > |
> > checking whether ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te
> > -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb accepts -g... yes
> > | checking for style of include used by make... GNU
> > |
> > checking dependency style of ccache arm-angstrom-linux-gnueabi-g++
> > -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb... gc=
c3
> > | checking for a BSD-compatible install... /usr/bin/install -c
> > | checking whether make sets $(MAKE)... (cached) yes
> > | checking build system type... i686-pc-linux-gnu
> > | checking host system type... arm-angstrom-linux-gnueabi
> > |
> > checking for arm-angstrom-linux-gnueabi-gcc... ccache
> > arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> > -mthumb-interwork -mno-thumb
> > | checking whether we are using the GNU C compiler... yes
> > |
> > checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te
> > -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb accepts -g... yes
> > |
> > checking for ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te
> > -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb option to accept ISO
> > C89... none needed
> > | checking dependency style of ccache
> > arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> > -mthumb-interwork -mno-thumb... gcc3
> > | checking for a sed that does not truncate output... /bin/sed
> > | checking for grep that handles long lines and -e... /bin/grep
> > | checking for egrep... /bin/grep -E
> > | checking for fgrep... /bin/grep -F
> > |
> > checking for ld used by ccache arm-angstrom-linux-gnueabi-gcc
> > -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb...
> > arm-angstrom-linux-gnueabi-ld
> > | checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld... y=
es
> > | checking for BSD- or MS-compatible name lister (nm)... arm-angstrom-l=
inux-gnueabi-nm
> > | checking the name lister (arm-angstrom-linux-gnueabi-nm) interface...=
 BSD nm
> > | checking whether ln -s works... yes
> > | checking the maximum length of command line arguments... 98304
> > | checking whether the shell understands some XSI constructs... yes
> > | checking whether the shell understands "+=3D"... yes
> > | checking for arm-angstrom-linux-gnueabi-ld option to reload object fi=
les... -r
> > | checking for arm-angstrom-linux-gnueabi-objdump... arm-angstrom-linux=
-gnueabi-objdump
> > | checking how to recognize dependent libraries... pass_all
> > | checking for arm-angstrom-linux-gnueabi-ar... arm-angstrom-linux-gnue=
abi-ar
> > | checking for arm-angstrom-linux-gnueabi-strip... (cached) arm-angstro=
m-linux-gnueabi-strip
> > | checking for arm-angstrom-linux-gnueabi-ranlib... arm-angstrom-linux-=
gnueabi-ranlib
> > |
> > checking command to parse arm-angstrom-linux-gnueabi-nm output from
> > ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926e=
j-s
> > -mthumb-interwork -mno-thumb object... ok
> > | checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-=
gcc -E
> > | checking for ANSI C header files... yes
> > | checking for sys/types.h... yes
> > | checking for sys/stat.h... yes
> > | checking for stdlib.h... yes
> > | checking for string.h... yes
> > | checking for memory.h... yes
> > | checking for strings.h... yes
> > | checking for inttypes.h... yes
> > | checking for stdint.h... yes
> > | checking for unistd.h... yes
> > | checking for dlfcn.h... yes
> > | checking whether we are using the GNU C++ compiler... (cached) yes
> > |
> > checking whether ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te
> > -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb accepts -g... (cached)
> > yes
> > | checking dependency style of ccache
> > arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=3Darm926ej-s
> > -mthumb-interwork -mno-thumb... (cached) gcc3
> > | checking how to run
> > the C++ preprocessor... ccache arm-angstrom-linux-gnueabi-g++
> > -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb -E
> > | checking for objdir... .libs
> > |
> > checking if ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te
> > -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb supports -fno-rtti
> > -fno-exceptions... no
> > | checking for ccache
> > arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> > -mthumb-interwork -mno-thumb option to produce PIC... -fPIC -DPIC
> > |
> > checking if ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te
> > -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb PIC flag -fPIC -DPIC
> > works... yes
> > | checking if ccache arm-angstrom-linux-gnueabi-gcc
> > -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb stati=
c
> > flag -static works... yes
> > | checking if ccache
> > arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> > -mthumb-interwork -mno-thumb supports -c -o file.o... yes
> > | checking
> > if ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te
> > -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o.=
..
> > (cached) yes
> > | checking whether the ccache
> > arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> > -mthumb-interwork -mno-thumb linker (arm-angstrom-linux-gnueabi-ld)
> > supports shared libraries... yes
> > | checking whether -lc should be explicitly linked in... no
> > | checking dynamic linker characteristics... GNU/Linux ld.so
> > | checking how to hardcode library paths into programs... immediate
> > | checking whether stripping libraries is possible... yes
> > | checking if libtool supports shared libraries... yes
> > | checking whether to build shared libraries... yes
> > | checking whether to build static libraries... yes
> > |
> > checking for ld used by ccache arm-angstrom-linux-gnueabi-g++
> > -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb...
> > arm-angstrom-linux-gnueabi-ld
> > | checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld... y=
es
> > |
> > checking whether the ccache arm-angstrom-linux-gnueabi-g++
> > -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb linke=
r
> > (arm-angstrom-linux-gnueabi-ld) supports shared libraries... yes
> > |
> > checking for ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te
> > -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb option to produce PIC.=
..
> > -fPIC -DPIC
> > | checking if ccache arm-angstrom-linux-gnueabi-g++
> > -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb PIC f=
lag
> > -fPIC -DPIC works... yes
> > | checking if ccache
> > arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=3Darm926ej-s
> > -mthumb-interwork -mno-thumb static flag -static works... yes
> > |
> > checking if ccache arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te
> > -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o.=
..
> > yes
> > | checking if ccache arm-angstrom-linux-gnueabi-g++
> > -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb suppo=
rts
> > -c -o file.o... (cached) yes
> > | checking whether the ccache
> > arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=3Darm926ej-s
> > -mthumb-interwork -mno-thumb linker (arm-angstrom-linux-gnueabi-ld)
> > supports shared libraries... yes
> > | checking dynamic linker characteristics... GNU/Linux ld.so
> > | checking how to hardcode library paths into programs... immediate
> > | checking for main in -lomniORB4... yes
> > | checking omniORB4/CORBA.h usability... yes
> > | checking omniORB4/CORBA.h presence... yes
> > | checking for omniORB4/CORBA.h... yes
> > | checking for omniidl... /home/saleh/tmp/staging/i686-linux/usr/bin/om=
niidl
> > | checking boost/filesystem/operations.hpp usability... yes
> > | checking boost/filesystem/operations.hpp presence... yes
> > | checking for boost/filesystem/operations.hpp... yes
> > | checking for main in -lboost_filesystem... no
> > | configure: error: cannot find boost_filesystem library.
> > | FATAL: oe_runconf failed
> > NOTE: Task failed: /home/saleh/tmp/work/armv5te-angstrom-linux-gnueabi/=
ossie-cf-0.0.0+svnr247-r1/temp/log.do_configure.3404
> > ERROR: TaskFailed event exception=2C aborting
> > ERROR: Build of /oe/ossie_collection/recipes/ossie-libraries/ossie-cf_s=
vn.bb do_configure failed
> > ERROR: Task 1133 (/oe/ossie_collection/recipes/ossie-libraries/ossie-cf=
_svn.bb=2C do_configure) failed
> > NOTE: Tasks Summary: Attempted 1223 tasks of which 1223 didn't need to =
be rerun and 1 failed.
> > ERROR: '/oe/ossie_collection/recipes/ossie-libraries/ossie-cf_svn.bb' f=
ailed                        =20
 		 	   		 =20
_________________________________________________________________
Hotmail: Powerful Free email with security by Microsoft.
https://signup.live.com/signup.aspx?id=3D60969=

