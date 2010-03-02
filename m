Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NmTZu-00049P-E4 for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 16:00:12 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NmTX9-00039y-Ly for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 15:57:15 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 15:57:15 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 15:57:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 02 Mar 2010 15:57:00 +0100
Message-ID: <hmj8vs$m1u$1@dough.gmane.org>
References: <BAY127-W1205B0845E793D5B4B70C3D83B0@phx.gbl>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <BAY127-W1205B0845E793D5B4B70C3D83B0@phx.gbl>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 02 Mar 2010 15:00:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I suspect it's called boost_filesystem-mt in OE and you'll need to ask
the ossie guys to updated their autofoo to have option to specify the
name. If they already have such an option, bug them to update their
recipes :)

regards,

Koen

On 02-03-10 15:23, saleh usman wrote:
> 
> Hi 
> I am getting an error of boost library while bitbaking an image.OE can not find boost file system library.Terminal log shows this error as
> | configure: error: cannot find boost_filesystem library.
> 
> Image is of ossie and I am unable to resolve this problem.How I can get rid of this error.Kindly guide me.
> Saleh
> 
> Terminal log is looking like as follows.
> 
> [saleh@localhost ~]$ bitbake ossie-image
> NOTE: Handling BitBake files: - (7660/7660) [100 %]
> NOTE: Parsing finished. 7053 cached, 300 parsed, 307 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 1224 of 2992 (ID: 1133, /oe/ossie_collection/recipes/ossie-libraries/ossie-cf_svn.bb, do_configure)
> ERROR: function do_configure failed
> ERROR:
> log data follows
> (/home/saleh/tmp/work/armv5te-angstrom-linux-gnueabi/ossie-cf-0.0.0+svnr247-r1/temp/log.do_configure.3404)
> | automake (GNU automake) 1.10.2
> | Copyright (C) 2008 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> | 
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.10
> |
> NOTE: Executing autoreconf --verbose --install --force
> --exclude=autopoint
> -I/home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10
> -I
> /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal
> | autoreconf: Entering directory `.'
> | autoreconf: configure.ac: not using Gettext
> |
> autoreconf: running: aclocal -I
> /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10
> -I
> /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal
> --force
> |
> /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:923:
> warning: underquoted definition of
> AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI
> |
> /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:923:  
> run info '(automake)Extending aclocal'
> |
> /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:923:  
> or see
> http://sources.redhat.com/automake/automake.html#Extending-aclocal
> | autoreconf: configure.ac: tracing
> | autoreconf: running: libtoolize --copy --force
> | libtoolize: putting auxiliary files in `.'.
> | libtoolize: copying file `./ltmain.sh'
> | libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.ac and
> | libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
> | libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
> |
> /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:923:
> warning: underquoted definition of
> AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI
> |
> /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:923:  
> run info '(automake)Extending aclocal'
> |
> /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:923:  
> or see
> http://sources.redhat.com/automake/automake.html#Extending-aclocal
> |
> autoreconf: running:
> /home/saleh/tmp/staging/i686-linux/usr/bin/autoconf
> --include=/home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10
> --include=/home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal
> --force --warnings=cross
> | autoreconf: configure.ac: not using Autoheader
> | autoreconf: running: automake --foreign --add-missing --copy --force-missing --warnings=cross
> | automake: unknown warning category `cross'
> | autoreconf: running: gnu-configize
> | autoreconf: Leaving directory `.'
> |
> NOTE: Running
> /home/saleh/tmp/work/armv5te-angstrom-linux-gnueabi/ossie-cf-0.0.0+svnr247-r1/trunk/configure              
> --build=i686-linux             
> --host=arm-angstrom-linux-gnueabi              
> --target=arm-angstrom-linux-gnueabi     --prefix=/usr                  
> --exec_prefix=/usr              --bindir=/usr/bin              
> --sbindir=/usr/sbin                    
> --libexecdir=/usr/libexec              
> --datadir=/usr/share                    --sysconfdir=/etc     
> --sharedstatedir=/com                   
> --localstatedir=/var                   --libdir=/usr/lib               
> --includedir=/usr/include              
> --oldincludedir=/usr/include                   
> --infodir=/usr/share/info             
> --mandir=/usr/share/man                     
> --with-omniorb=/home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/bin/..
> IDL=/home/saleh/tmp/staging/i686-linux/usr/bin/omniidl                    
> ...
> | configure: WARNING: unrecognized options: --with-omniorb
> | configure: loading site script /oe/openembedded/site/endian-little
> | configure: loading site script /oe/openembedded/site/common-linux
> | configure: loading site script /oe/openembedded/site/common-glibc
> | configure: loading site script /oe/openembedded/site/arm-common
> | configure: loading site script /oe/openembedded/site/arm-linux
> | configure: loading site script /oe/openembedded/site/common
> | configure: loading site script /oe/openembedded/site/common
> | checking for a BSD-compatible install... /usr/bin/install -c
> | checking whether build environment is sane... yes
> | checking for a thread-safe mkdir -p... /bin/mkdir -p
> | checking for gawk... gawk
> | checking whether make sets $(MAKE)... yes
> | checking for arm-angstrom-linux-gnueabi-strip... arm-angstrom-linux-gnueabi-strip
> | checking for C++ compiler default output file name... a.out
> | checking whether the C++ compiler works... yes
> | checking whether we are cross compiling... yes
> | checking for suffix of executables...
> | checking for suffix of object files... o
> | checking whether we are using the GNU C++ compiler... yes
> |
> checking whether ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te
> -mtune=arm926ej-s -mthumb-interwork -mno-thumb accepts -g... yes
> | checking for style of include used by make... GNU
> |
> checking dependency style of ccache arm-angstrom-linux-gnueabi-g++
> -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb... gcc3
> | checking for a BSD-compatible install... /usr/bin/install -c
> | checking whether make sets $(MAKE)... (cached) yes
> | checking build system type... i686-pc-linux-gnu
> | checking host system type... arm-angstrom-linux-gnueabi
> |
> checking for arm-angstrom-linux-gnueabi-gcc... ccache
> arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s
> -mthumb-interwork -mno-thumb
> | checking whether we are using the GNU C compiler... yes
> |
> checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te
> -mtune=arm926ej-s -mthumb-interwork -mno-thumb accepts -g... yes
> |
> checking for ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te
> -mtune=arm926ej-s -mthumb-interwork -mno-thumb option to accept ISO
> C89... none needed
> | checking dependency style of ccache
> arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s
> -mthumb-interwork -mno-thumb... gcc3
> | checking for a sed that does not truncate output... /bin/sed
> | checking for grep that handles long lines and -e... /bin/grep
> | checking for egrep... /bin/grep -E
> | checking for fgrep... /bin/grep -F
> |
> checking for ld used by ccache arm-angstrom-linux-gnueabi-gcc
> -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb...
> arm-angstrom-linux-gnueabi-ld
> | checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld... yes
> | checking for BSD- or MS-compatible name lister (nm)... arm-angstrom-linux-gnueabi-nm
> | checking the name lister (arm-angstrom-linux-gnueabi-nm) interface... BSD nm
> | checking whether ln -s works... yes
> | checking the maximum length of command line arguments... 98304
> | checking whether the shell understands some XSI constructs... yes
> | checking whether the shell understands "+="... yes
> | checking for arm-angstrom-linux-gnueabi-ld option to reload object files... -r
> | checking for arm-angstrom-linux-gnueabi-objdump... arm-angstrom-linux-gnueabi-objdump
> | checking how to recognize dependent libraries... pass_all
> | checking for arm-angstrom-linux-gnueabi-ar... arm-angstrom-linux-gnueabi-ar
> | checking for arm-angstrom-linux-gnueabi-strip... (cached) arm-angstrom-linux-gnueabi-strip
> | checking for arm-angstrom-linux-gnueabi-ranlib... arm-angstrom-linux-gnueabi-ranlib
> |
> checking command to parse arm-angstrom-linux-gnueabi-nm output from
> ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s
> -mthumb-interwork -mno-thumb object... ok
> | checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E
> | checking for ANSI C header files... yes
> | checking for sys/types.h... yes
> | checking for sys/stat.h... yes
> | checking for stdlib.h... yes
> | checking for string.h... yes
> | checking for memory.h... yes
> | checking for strings.h... yes
> | checking for inttypes.h... yes
> | checking for stdint.h... yes
> | checking for unistd.h... yes
> | checking for dlfcn.h... yes
> | checking whether we are using the GNU C++ compiler... (cached) yes
> |
> checking whether ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te
> -mtune=arm926ej-s -mthumb-interwork -mno-thumb accepts -g... (cached)
> yes
> | checking dependency style of ccache
> arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s
> -mthumb-interwork -mno-thumb... (cached) gcc3
> | checking how to run
> the C++ preprocessor... ccache arm-angstrom-linux-gnueabi-g++
> -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb -E
> | checking for objdir... .libs
> |
> checking if ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te
> -mtune=arm926ej-s -mthumb-interwork -mno-thumb supports -fno-rtti
> -fno-exceptions... no
> | checking for ccache
> arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s
> -mthumb-interwork -mno-thumb option to produce PIC... -fPIC -DPIC
> |
> checking if ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te
> -mtune=arm926ej-s -mthumb-interwork -mno-thumb PIC flag -fPIC -DPIC
> works... yes
> | checking if ccache arm-angstrom-linux-gnueabi-gcc
> -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb static
> flag -static works... yes
> | checking if ccache
> arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s
> -mthumb-interwork -mno-thumb supports -c -o file.o... yes
> | checking
> if ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te
> -mtune=arm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o...
> (cached) yes
> | checking whether the ccache
> arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s
> -mthumb-interwork -mno-thumb linker (arm-angstrom-linux-gnueabi-ld)
> supports shared libraries... yes
> | checking whether -lc should be explicitly linked in... no
> | checking dynamic linker characteristics... GNU/Linux ld.so
> | checking how to hardcode library paths into programs... immediate
> | checking whether stripping libraries is possible... yes
> | checking if libtool supports shared libraries... yes
> | checking whether to build shared libraries... yes
> | checking whether to build static libraries... yes
> |
> checking for ld used by ccache arm-angstrom-linux-gnueabi-g++
> -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb...
> arm-angstrom-linux-gnueabi-ld
> | checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld... yes
> |
> checking whether the ccache arm-angstrom-linux-gnueabi-g++
> -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb linker
> (arm-angstrom-linux-gnueabi-ld) supports shared libraries... yes
> |
> checking for ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te
> -mtune=arm926ej-s -mthumb-interwork -mno-thumb option to produce PIC...
> -fPIC -DPIC
> | checking if ccache arm-angstrom-linux-gnueabi-g++
> -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb PIC flag
> -fPIC -DPIC works... yes
> | checking if ccache
> arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s
> -mthumb-interwork -mno-thumb static flag -static works... yes
> |
> checking if ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te
> -mtune=arm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o...
> yes
> | checking if ccache arm-angstrom-linux-gnueabi-g++
> -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb supports
> -c -o file.o... (cached) yes
> | checking whether the ccache
> arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s
> -mthumb-interwork -mno-thumb linker (arm-angstrom-linux-gnueabi-ld)
> supports shared libraries... yes
> | checking dynamic linker characteristics... GNU/Linux ld.so
> | checking how to hardcode library paths into programs... immediate
> | checking for main in -lomniORB4... yes
> | checking omniORB4/CORBA.h usability... yes
> | checking omniORB4/CORBA.h presence... yes
> | checking for omniORB4/CORBA.h... yes
> | checking for omniidl... /home/saleh/tmp/staging/i686-linux/usr/bin/omniidl
> | checking boost/filesystem/operations.hpp usability... yes
> | checking boost/filesystem/operations.hpp presence... yes
> | checking for boost/filesystem/operations.hpp... yes
> | checking for main in -lboost_filesystem... no
> | configure: error: cannot find boost_filesystem library.
> | FATAL: oe_runconf failed
> NOTE: Task failed: /home/saleh/tmp/work/armv5te-angstrom-linux-gnueabi/ossie-cf-0.0.0+svnr247-r1/temp/log.do_configure.3404
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /oe/ossie_collection/recipes/ossie-libraries/ossie-cf_svn.bb do_configure failed
> ERROR: Task 1133 (/oe/ossie_collection/recipes/ossie-libraries/ossie-cf_svn.bb, do_configure) failed
> NOTE: Tasks Summary: Attempted 1223 tasks of which 1223 didn't need to be rerun and 1 failed.
> ERROR: '/oe/ossie_collection/recipes/ossie-libraries/ossie-cf_svn.bb' failed 		 	   		  
> _________________________________________________________________
> Hotmail: Trusted email with Microsoft’s powerful SPAM protection.
> https://signup.live.com/signup.aspx?id=60969

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLjSc8MkyGM64RGpERAl1vAJ9bqgbolTJGUM3k1Jdk10a+zcPfaQCghWYj
he8sVtCk1LlLIKnxmEwtTwk=
=I7S7
-----END PGP SIGNATURE-----



