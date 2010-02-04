Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nd34q-0001gu-Pw for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 15:53:07 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nd32U-0006LJ-Cf for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 15:50:38 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2010 15:50:38 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2010 15:50:38 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Feb 2010 15:50:16 +0100
Message-ID: <hkemr6$ak$1@ger.gmane.org>
References: <BAY127-W15FED367FDA09AC0D1E15CD8550@phx.gbl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100130 Shredder/3.0.2pre
In-Reply-To: <BAY127-W15FED367FDA09AC0D1E15CD8550@phx.gbl>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem of bitbaking
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
X-List-Received-Date: Thu, 04 Feb 2010 14:53:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Since your problem is with a recipe that isn't in OE you should take the
issue to the people you got this recipe from.

On 04-02-10 15:17, saleh usman wrote:
> 
> I've tried bitbake libboost  but it is giving error of nothing provides libboost.I've also tried bitbake boost that built successfully but I am giving same error while baking ossie-image.Following is terminal window image showing messages of all three bitbakes.
> Saleh
> 
> [saleh@localhost ~]$ bitbake libboost
> NOTE: Handling BitBake files: - (7660/7660) [100 %]
> NOTE: Parsing finished. 7053 cached, 300 parsed, 307 skipped, 0 masked.
> ERROR: Nothing PROVIDES 'libboost'
> 
> [saleh@localhost ~]$ bitbake boost
> NOTE: Handling BitBake files: - (7660/7660) [100 %]
> NOTE: Parsing finished. 7053 cached, 300 parsed, 307 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 363 of 500 (ID: 12, /oe/openembedded/recipes/boost/boost_1.36.0.bb, do_package)
> NOTE: Multiple libraries (libboost_unit_test_framework-mt.so, libboost_prg_exec_monitor-mt.so) found and LEAD_SONAME not defined
> NOTE: Running task 366 of 500 (ID: 16, /oe/openembedded/recipes/boost/boost_1.36.0.bb, do_package_write_ipk)
> Packaged contents of boost-dbg into /home/saleh/tmp/deploy/glibc/ipk/armv5te/boost-dbg_1.36.0-r8.5_armv5te.ipk
> Packaged contents of boost-date-time into /home/saleh/tmp/deploy/glibc/ipk/armv5te/boost-date-time_1.36.0-r8.5_armv5te.ipk
> Packaged contents of boost-filesystem into /home/saleh/tmp/deploy/glibc/ipk/armv5te/boost-filesystem_1.36.0-r8.5_armv5te.ipk
> Packaged contents of boost-graph into /home/saleh/tmp/deploy/glibc/ipk/armv5te/boost-graph_1.36.0-r8.5_armv5te.ipk
> Packaged contents of boost-iostreams into /home/saleh/tmp/deploy/glibc/ipk/armv5te/boost-iostreams_1.36.0-r8.5_armv5te.ipk
> Packaged contents of boost-program-options into /home/saleh/tmp/deploy/glibc/ipk/armv5te/boost-program-options_1.36.0-r8.5_armv5te.ipk
> Packaged contents of boost-regex into /home/saleh/tmp/deploy/glibc/ipk/armv5te/boost-regex_1.36.0-r8.5_armv5te.ipk
> Packaged contents of boost-signals into /home/saleh/tmp/deploy/glibc/ipk/armv5te/boost-signals_1.36.0-r8.5_armv5te.ipk
> Packaged contents of boost-system into /home/saleh/tmp/deploy/glibc/ipk/armv5te/boost-system_1.36.0-r8.5_armv5te.ipk
> Packaged contents of boost-test into /home/saleh/tmp/deploy/glibc/ipk/armv5te/boost-test_1.36.0-r8.5_armv5te.ipk
> Packaged contents of boost-thread into /home/saleh/tmp/deploy/glibc/ipk/armv5te/boost-thread_1.36.0-r8.5_armv5te.ipk
> Packaged contents of boost-dev into /home/saleh/tmp/deploy/glibc/ipk/armv5te/boost-dev_1.36.0-r8.5_armv5te.ipk
> NOTE: Not creating empty archive for boost-1.36.0-r8.5
> NOTE: Running task 367 of 500 (ID: 11, /oe/openembedded/recipes/boost/boost_1.36.0.bb, do_package_write)
> NOTE: Running task 385 of 500 (ID: 15, /oe/openembedded/recipes/boost/boost_1.36.0.bb, do_package_stage)
> NOTE: Running task 497 of 500 (ID: 14, /oe/openembedded/recipes/boost/boost_1.36.0.bb, do_package_stage_all)
> NOTE: Running task 498 of 500 (ID: 13, /oe/openembedded/recipes/boost/boost_1.36.0.bb, do_distribute_sources)
> NOTE: Running task 499 of 500 (ID: 10, /oe/openembedded/recipes/boost/boost_1.36.0.bb, do_qa_staging)
> NOTE: Running task 500 of 500 (ID: 0, /oe/openembedded/recipes/boost/boost_1.36.0.bb, do_build)
> NOTE: Tasks Summary: Attempted 500 tasks of which 492 didn't need to be rerun and 0 failed.
> 
> 
> 
> [saleh@localhost ~]$ bitbake ossie-image
> NOTE: Handling BitBake files: - (7660/7660) [100 %]
> NOTE: Parsing finished. 7053 cached, 300 parsed, 307 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 1224 of 2992 (ID: 1133, /oe/ossie_collection/recipes/ossie-libraries/ossie-cf_svn.bb, do_configure)
> ERROR: function do_configure failed
> ERROR: log data follows (/home/saleh/tmp/work/armv5te-angstrom-linux-gnueabi/ossie-cf-0.0.0+svnr247-r1/temp/log.do_configure.6716)
> | automake (GNU automake) 1.10.2
> | Copyright (C) 2008 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> | 
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.10
> | NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint -I/home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 -I /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal
> | autoreconf: Entering directory `.'
> | autoreconf: configure.ac: not using Gettext
> | autoreconf: running: aclocal -I /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 -I /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal --force
> | /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:923: warning: underquoted definition of AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI
> | /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:923:   run info '(automake)Extending aclocal'
> | /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:923:   or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
> | autoreconf: configure.ac: tracing
> | autoreconf: running: libtoolize --copy --force
> | libtoolize: putting auxiliary files in `.'.
> | libtoolize: copying file `./ltmain.sh'
> | libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.ac and
> | libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
> | libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
> | /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:923: warning: underquoted definition of AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI
> | /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:923:   run info '(automake)Extending aclocal'
> | /home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:923:   or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
> | autoreconf: running: /home/saleh/tmp/staging/i686-linux/usr/bin/autoconf --include=/home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 --include=/home/saleh/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal --force --warnings=cross
> | autoreconf: configure.ac: not using Autoheader
> | autoreconf: running: automake --foreign --add-missing --copy --force-missing --warnings=cross
> | automake: unknown warning category `cross'
> | autoreconf: running: gnu-configize
> | autoreconf: Leaving directory `.'
> | NOTE: Running /home/saleh/tmp/work/armv5te-angstrom-linux-gnueabi/ossie-cf-0.0.0+svnr247-r1/trunk/configure               --build=i686-linux              --host=arm-angstrom-linux-gnueabi               --target=arm-angstrom-linux-gnueabi     --prefix=/usr                   --exec_prefix=/usr              --bindir=/usr/bin               --sbindir=/usr/sbin                     --libexecdir=/usr/libexec               --datadir=/usr/share                    --sysconfdir=/etc      --sharedstatedir=/com                    --localstatedir=/var                   --libdir=/usr/lib                --includedir=/usr/include               --oldincludedir=/usr/include                    --infodir=/usr/share/info              --mandir=/usr/share/man                      --with-omniorb=/home/saleh/tmp/s
>  taging/armv5te-angstrom-linux-gnueabi/usr/bin/.. IDL=/home/saleh/tmp/staging/i686-linux/usr/bin/omniidl                     ...
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
> | checking whether ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb accepts -g... yes
> | checking for style of include used by make... GNU
> | checking dependency style of ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb... gcc3
> | checking for a BSD-compatible install... /usr/bin/install -c
> | checking whether make sets $(MAKE)... (cached) yes
> | checking build system type... i686-pc-linux-gnu
> | checking host system type... arm-angstrom-linux-gnueabi
> | checking for arm-angstrom-linux-gnueabi-gcc... ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb
> | checking whether we are using the GNU C compiler... yes
> | checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb accepts -g... yes
> | checking for ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb option to accept ISO C89... none needed
> | checking dependency style of ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb... gcc3
> | checking for a sed that does not truncate output... /bin/sed
> | checking for grep that handles long lines and -e... /bin/grep
> | checking for egrep... /bin/grep -E
> | checking for fgrep... /bin/grep -F
> | checking for ld used by ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb... arm-angstrom-linux-gnueabi-ld
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
> | checking command to parse arm-angstrom-linux-gnueabi-nm output from ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb object... ok
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
> | checking whether ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb accepts -g... (cached) yes
> | checking dependency style of ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb... (cached) gcc3
> | checking how to run the C++ preprocessor... ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb -E
> | checking for objdir... .libs
> | checking if ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb supports -fno-rtti -fno-exceptions... no
> | checking for ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb option to produce PIC... -fPIC -DPIC
> | checking if ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb PIC flag -fPIC -DPIC works... yes
> | checking if ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb static flag -static works... yes
> | checking if ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o... yes
> | checking if ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o... (cached) yes
> | checking whether the ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb linker (arm-angstrom-linux-gnueabi-ld) supports shared libraries... yes
> | checking whether -lc should be explicitly linked in... no
> | checking dynamic linker characteristics... GNU/Linux ld.so
> | checking how to hardcode library paths into programs... immediate
> | checking whether stripping libraries is possible... yes
> | checking if libtool supports shared libraries... yes
> | checking whether to build shared libraries... yes
> | checking whether to build static libraries... yes
> | checking for ld used by ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb... arm-angstrom-linux-gnueabi-ld
> | checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld... yes
> | checking whether the ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb linker (arm-angstrom-linux-gnueabi-ld) supports shared libraries... yes
> | checking for ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb option to produce PIC... -fPIC -DPIC
> | checking if ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb PIC flag -fPIC -DPIC works... yes
> | checking if ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb static flag -static works... yes
> | checking if ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o... yes
> | checking if ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o... (cached) yes
> | checking whether the ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb linker (arm-angstrom-linux-gnueabi-ld) supports shared libraries... yes
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
> NOTE: Task failed: /home/saleh/tmp/work/armv5te-angstrom-linux-gnueabi/ossie-cf-0.0.0+svnr247-r1/temp/log.do_configure.6716
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /oe/ossie_collection/recipes/ossie-libraries/ossie-cf_svn.bb do_configure failed
> ERROR: Task 1133 (/oe/ossie_collection/recipes/ossie-libraries/ossie-cf_svn.bb, do_configure) failed
> NOTE: Tasks Summary: Attempted 1223 tasks of which 1223 didn't need to be rerun and 1 failed.
> ERROR: '/oe/ossie_collection/recipes/ossie-libraries/ossie-cf_svn.bb' failed
> 
> 
> 
> 
> 
>> Frans Meulenbroeks <fransmeulenbroeks <at> gmail.com> writes:
>>
>> 2010/2/3 saleh usman <salehusman <at> hotmail.com>:
>>>
>>> If it is a problem of automake/automake. then how can I solve it.Actually I am unable to diagnose these
>> kinds of problems.Is there any tutorial/documentation other than openembedded user manual which can
>> give me better understanding of all of this process.
>>> plz help me in resolving this error.
>>> Saleh
>>
>> I don't have/know ossie.
>> Some hints though:
>> You could try to do a bitbake boost (or maybe it is called libboost).
>> then bake ossieimage. If that works there is a missing dependency
>> somewhere.
>> I tmight also help to provide some more info. E.g. mention at what
>> time you get the message (which recipe was it building, which task is
>> failing etc).
>> With no info it becomes difficult to provide advice.
>>
>> Frans
>>
>>>
>>>> Steffen Sledz <sledz <at> dresearch.de> writes:
>>>
>>>>> saleh usman wrote:
>>>>> I am building ossie-image in openembedded using bitbake command but
>>>>> it is giving error of not finding boost_filesystem library.
>>>>> What exactly is this error.Plz guide me.
>>>>> saleh
>>>
>>>> Since today i see a similar problem when doing a clean bitbake of
>>>> glib-2.0. It seems to be a problem with automake/automake. :(
>>>>
>>>> Steffen 		 	   		  
> _________________________________________________________________
> Hotmail: Free, trusted and rich email service.
> https://signup.live.com/signup.aspx?id=60969

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLat6oMkyGM64RGpERAtSIAJ4yHEvqlnYv5Q7DsStl1fbCyG9LZQCghSnn
lGJPZ8wBXvTe1F3fdx4fzxg=
=aBcl
-----END PGP SIGNATURE-----



