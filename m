Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Nd2Gn-0003bl-3l
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 15:01:24 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id BC90B491264
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Feb 2010 14:58:54 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 4 Feb 2010 14:59:34 +0100
Message-ID: <4B6AD2B0.3020104@dresearch.de>
Date: Thu, 04 Feb 2010 14:59:12 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W217652A5FD6DFB2C0B4E2FD8570@phx.gbl>	<4B684D9D.2030001@dresearch.de>	<4B699C5A.70909@dresearch.de>	<20100203162120.GB26844@xora-build.xora.org.uk>	<4B6AC59A.90000@dresearch.de>
	<4B6AC734.4090807@balister.org>
In-Reply-To: <4B6AC734.4090807@balister.org>
X-OriginalArrivalTime: 04 Feb 2010 13:59:34.0741 (UTC)
	FILETIME=[4828F850:01CAA5A2]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in bitbaking
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
X-List-Received-Date: Thu, 04 Feb 2010 14:01:24 -0000
Content-Type: multipart/mixed; boundary="------------020103060503040803090706"

--------------020103060503040803090706
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
>> [1] I've rechecked this again with angstrom distro and hipox,
>> beagleboard, and x86 machine making a clean build of glib-2.0:
>>
>>    rm -rf tmp.5
>>    bitbake glib-2.0
> 
> glib-2.0 is building for me. Do you have an error log?

Yepp.
automake (GNU automake) 1.10.2
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.
AUTOV is 1.10
NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint -I /home/sledz/work/HydraIP/OE/tmp.5/work/i686-linux/glib-2.0-native-2.22.4-r0/glib-2.22.4/ -I /home/sledz/work/HydraIP/OE/tmp.5/work/i686-linux/glib-2.0-native-2.22.4-r0/glib-2.22.4/m4macros/ -I/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/share/aclocal-1.10 -I /home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/share/aclocal
autoreconf: Entering directory `.'
autoreconf: configure.in: not using Gettext
autoreconf: running: aclocal -I /home/sledz/work/HydraIP/OE/tmp.5/work/i686-linux/glib-2.0-native-2.22.4-r0/glib-2.22.4/ -I /home/sledz/work/HydraIP/OE/tmp.5/work/i686-linux/glib-2.0-native-2.22.4-r0/glib-2.22.4/m4macros/ -I /home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/share/aclocal-1.10 -I /home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/share/aclocal --force 
autoreconf: configure.in: tracing
configure.in:549: warning: AC_RUN_IFELSE called without default to allow cross compiling
../../lib/autoconf/general.m4:2577: AC_RUN_IFELSE is expanded from...
../../lib/autoconf/general.m4:2593: AC_TRY_RUN is expanded from...
configure.in:549: the top level
configure.in:544: warning: AC_RUN_IFELSE called without default to allow cross compiling
configure.in:544: the top level
configure.in:671: warning: AC_RUN_IFELSE called without default to allow cross compiling
../../lib/m4sugar/m4sh.m4:505: AS_IF is expanded from...
../../lib/autoconf/general.m4:1975: AC_CACHE_VAL is expanded from...
../../lib/autoconf/general.m4:1995: AC_CACHE_CHECK is expanded from...
configure.in:671: the top level
configure.in:1136: warning: AC_RUN_IFELSE called without default to allow cross compiling
configure.in:1136: the top level
configure.in:1485: warning: AC_RUN_IFELSE called without default to allow cross compiling
configure.in:1485: the top level
configure.in:2160: warning: AC_RUN_IFELSE called without default to allow cross compiling
configure.in:2160: the top level
configure.in:2199: warning: AC_RUN_IFELSE called without default to allow cross compiling
configure.in:2199: the top level
autoreconf: running: libtoolize --copy --force
libtoolize: putting auxiliary files in `.'.
libtoolize: copying file `./ltmain.sh'
libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.in and
libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
autoreconf: running: /home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/bin/autoconf --include=/home/sledz/work/HydraIP/OE/tmp.5/work/i686-linux/glib-2.0-native-2.22.4-r0/glib-2.22.4/ --include=/home/sledz/work/HydraIP/OE/tmp.5/work/i686-linux/glib-2.0-native-2.22.4-r0/glib-2.22.4/m4macros/ --include=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/share/aclocal-1.10 --include=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/share/aclocal --force --warnings=cross
configure.in:549: warning: AC_RUN_IFELSE called without default to allow cross compiling
../../lib/autoconf/general.m4:2577: AC_RUN_IFELSE is expanded from...
../../lib/autoconf/general.m4:2593: AC_TRY_RUN is expanded from...
configure.in:549: the top level
configure.in:544: warning: AC_RUN_IFELSE called without default to allow cross compiling
configure.in:544: the top level
configure.in:671: warning: AC_RUN_IFELSE called without default to allow cross compiling
../../lib/m4sugar/m4sh.m4:505: AS_IF is expanded from...
../../lib/autoconf/general.m4:1975: AC_CACHE_VAL is expanded from...
../../lib/autoconf/general.m4:1995: AC_CACHE_CHECK is expanded from...
configure.in:671: the top level
configure.in:1136: warning: AC_RUN_IFELSE called without default to allow cross compiling
configure.in:1136: the top level
configure.in:1485: warning: AC_RUN_IFELSE called without default to allow cross compiling
configure.in:1485: the top level
configure.in:2160: warning: AC_RUN_IFELSE called without default to allow cross compiling
configure.in:2160: the top level
configure.in:2199: warning: AC_RUN_IFELSE called without default to allow cross compiling
configure.in:2199: the top level
autoreconf: running: /home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/bin/autoheader --include=/home/sledz/work/HydraIP/OE/tmp.5/work/i686-linux/glib-2.0-native-2.22.4-r0/glib-2.22.4/ --include=/home/sledz/work/HydraIP/OE/tmp.5/work/i686-linux/glib-2.0-native-2.22.4-r0/glib-2.22.4/m4macros/ --include=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/share/aclocal-1.10 --include=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/share/aclocal --force --warnings=cross
autoreconf: running: automake --foreign --add-missing --copy --force-missing --warnings=cross
automake: unknown warning category `cross'
gtk-doc.make:26: EXTRA_DIST multiply defined in condition TRUE ...
docs/reference/gio/Makefile.am:122:   `gtk-doc.make' included from here
Makefile.decl:8: ... `EXTRA_DIST' previously defined here
docs/reference/gio/Makefile.am:1:   `Makefile.decl' included from here
gtk-doc.make:26: EXTRA_DIST multiply defined in condition TRUE ...
docs/reference/glib/Makefile.am:73:   `gtk-doc.make' included from here
Makefile.decl:8: ... `EXTRA_DIST' previously defined here
docs/reference/glib/Makefile.am:2:   `Makefile.decl' included from here
gtk-doc.make:26: EXTRA_DIST multiply defined in condition TRUE ...
docs/reference/gobject/Makefile.am:61:   `gtk-doc.make' included from here
Makefile.decl:8: ... `EXTRA_DIST' previously defined here
docs/reference/gobject/Makefile.am:2:   `Makefile.decl' included from here
autoreconf: running: gnu-configize
autoreconf: Leaving directory `.'
NOTE: Running /home/sledz/work/HydraIP/OE/tmp.5/work/i686-linux/glib-2.0-native-2.22.4-r0/glib-2.22.4/configure 		    --build=i686-linux 		    --host=i686-linux 		    --target=i686-linux 		    --prefix=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr 		    --exec_prefix=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr 		    --bindir=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/bin 		    --sbindir=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/sbin 		    --libexecdir=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/libexec 		    --datadir=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/share 		    --sysconfdir=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/etc 		    --sharedstatedir=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/com 		    --localstatedir=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/var 		    --libdir=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/lib 		    --includedir=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/include 		    --oldincludedir=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/include 		    --infodir=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/share/info 		    --mandir=/home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/share/man 			 		    ...
checking for a BSD-compatible install... /home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking for the BeOS... no
checking for Win32... no
checking for Mac OS X Carbon support... checking for style of include used by make... GNU
checking for i686-linux-gcc... gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... 
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking dependency style of gcc... gcc3
checking how to run the C preprocessor... gcc -E
no
checking whether to enable garbage collector friendliness... no
checking whether to disable memory pools... no
checking for i686-linux-gcc... (cached) gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether gcc accepts -g... (cached) yes
checking for gcc option to accept ISO C89... (cached) none needed
checking dependency style of gcc... (cached) gcc3
checking how to run the C preprocessor... gcc -E
checking for i686-linux-c++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking dependency style of g++... gcc3
checking for i686-linux-gcc... (cached) gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether gcc accepts -g... (cached) yes
checking for gcc option to accept ISO C89... (cached) none needed
checking dependency style of gcc... (cached) gcc3
checking whether gcc and cc understand -c and -o together... yes
checking for a BSD-compatible install... /home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/bin/install -c
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... 64
checking for pkg-config... /usr/bin/pkg-config
checking for gawk... (cached) gawk
checking for perl5... no
checking for perl... perl
checking for indent... indent
checking for perl... /usr/bin/perl
checking for a Python interpreter with version >= 2.4... python
checking for python... /usr/bin/python
checking for python version... 2.6
checking for python platform... linux2
checking for python script directory... ${prefix}/lib/python2.6/site-packages
checking for python extension module directory... ${exec_prefix}/lib/python2.6/site-packages
checking for iconv_open... yes
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking whether we are using the GNU C Library 2.1 or newer... yes
checking Whether to cache iconv descriptors... no
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking for LC_MESSAGES... yes
checking libintl.h usability... yes
checking libintl.h presence... yes
checking for libintl.h... yes
checking for ngettext in libc... yes
checking for dgettext in libc... yes
checking for bind_textdomain_codeset... yes
checking for msgfmt... /home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/bin/msgfmt
checking for dcgettext... yes
checking if msgfmt accepts -c... yes
checking for gmsgfmt... /home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/bin/msgfmt
checking for xgettext... /home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/bin/xgettext
checking for catalogs to be installed...  am ar as az be be@latin bg bn bn_IN bs ca ca@valencia cs cy da de dz el en_CA en_GB eo es et eu fa fi fr ga gl gu he hi hr hu hy id is it ja ka kn ko ku lt lv mai mg mk ml mn mr ms nb ne nl nn oc or pa pl ps pt pt_BR ro ru rw si sk sl sq sr sr@latin sr@ije sv ta te th tl tr tt uk vi wa xh yi zh_CN zh_HK zh_TW
checking for a sed that does not truncate output... /usr/bin/sed
checking for fgrep... /usr/bin/grep -F
checking for ld used by gcc... ld
checking if the linker (ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... nm
checking the name lister (nm) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking for ld option to reload object files... -r
checking for i686-linux-objdump... objdump
checking how to recognize dependent libraries... pass_all
checking for i686-linux-ar... ar
checking for i686-linux-strip... strip
checking for i686-linux-ranlib... ranlib
checking command to parse nm output from gcc object... ok
checking for dlfcn.h... yes
checking whether we are using the GNU C++ compiler... (cached) yes
checking whether g++ accepts -g... (cached) yes
checking dependency style of g++... (cached) gcc3
checking how to run the C++ preprocessor... g++ -E
checking for objdir... .libs
checking if gcc supports -fno-rtti -fno-exceptions... no
checking for gcc option to produce PIC... -fPIC -DPIC
checking if gcc PIC flag -fPIC -DPIC works... yes
checking if gcc static flag -static works... yes
checking if gcc supports -c -o file.o... yes
checking if gcc supports -c -o file.o... (cached) yes
checking whether the gcc linker (ld) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking for ld used by g++... ld
checking if the linker (ld) is GNU ld... yes
checking whether the g++ linker (ld) supports shared libraries... yes
checking for g++ option to produce PIC... -fPIC -DPIC
checking if g++ PIC flag -fPIC -DPIC works... yes
checking if g++ static flag -static works... yes
checking if g++ supports -c -o file.o... yes
checking if g++ supports -c -o file.o... (cached) yes
checking whether the g++ linker (ld) supports shared libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
configure: creating ./config.lt
config.lt: creating i686-linux-libtool
checking for extra flags to get ANSI library prototypes... none needed
checking for extra flags for POSIX compliance... none needed
checking for ANSI C header files... (cached) yes
checking for vprintf... yes
checking for _doprnt... no
checking for working alloca.h... yes
checking for alloca... yes
checking for mmap... yes
checking for posix_memalign... yes
checking for memalign... yes
checking for valloc... yes
checking for fsync... yes
checking for pipe2... yes
checking for atexit... yes
checking for on_exit... yes
checking for timegm... yes
checking for gmtime_r... yes
checking size of char... 1
checking size of short... 2
checking size of long... 4
checking size of int... 4
checking size of void *... 4
checking size of long long... 8
checking size of __int64... 0
checking for format to printf and scanf a guint64... %llu
checking for an ANSI C-conforming const... yes
checking if malloc() and friends prototypes are gmem.h compatible... yes
checking for growing stack pointer... no
checking for __inline... yes
checking for __inline__... yes
checking for inline... yes
checking if inline functions in headers work... yes
checking for working do while(0) macros... yes
checking for ISO C99 varargs macros in C... yes
checking for ISO C99 varargs macros in C++... yes
checking for GNUC varargs macros... yes
checking for GNUC visibility attribute... yes
checking whether using Sun Studio C compiler... no
checking whether byte ordering is bigendian... no
checking dirent.h usability... yes
checking dirent.h presence... yes
checking for dirent.h... yes
checking float.h usability... yes
checking float.h presence... yes
checking for float.h... yes
checking limits.h usability... yes
checking limits.h presence... yes
checking for limits.h... yes
checking pwd.h usability... yes
checking pwd.h presence... yes
checking for pwd.h... yes
checking grp.h usability... yes
checking grp.h presence... yes
checking for grp.h... yes
checking sys/param.h usability... yes
checking sys/param.h presence... yes
checking for sys/param.h... yes
checking sys/poll.h usability... yes
checking sys/poll.h presence... yes
checking for sys/poll.h... yes
checking sys/resource.h usability... yes
checking sys/resource.h presence... yes
checking for sys/resource.h... yes
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking sys/times.h usability... yes
checking sys/times.h presence... yes
checking for sys/times.h... yes
checking sys/wait.h usability... yes
checking sys/wait.h presence... yes
checking for sys/wait.h... yes
checking for unistd.h... (cached) yes
checking values.h usability... yes
checking values.h presence... yes
checking for values.h... yes
checking sys/select.h usability... yes
checking sys/select.h presence... yes
checking for sys/select.h... yes
checking for sys/types.h... (cached) yes
checking for stdint.h... (cached) yes
checking sched.h usability... yes
checking sched.h presence... yes
checking for sched.h... yes
checking malloc.h usability... yes
checking malloc.h presence... yes
checking for malloc.h... yes
checking sys/vfs.h usability... yes
checking sys/vfs.h presence... yes
checking for sys/vfs.h... yes
checking sys/mount.h usability... yes
checking sys/mount.h presence... yes
checking for sys/mount.h... yes
checking sys/vmount.h usability... no
checking sys/vmount.h presence... no
checking for sys/vmount.h... no
checking sys/statfs.h usability... yes
checking sys/statfs.h presence... yes
checking for sys/statfs.h... yes
checking sys/statvfs.h usability... yes
checking sys/statvfs.h presence... yes
checking for sys/statvfs.h... yes
checking mntent.h usability... yes
checking mntent.h presence... yes
checking for mntent.h... yes
checking sys/mnttab.h usability... no
checking sys/mnttab.h presence... no
checking for sys/mnttab.h... no
checking sys/vfstab.h usability... no
checking sys/vfstab.h presence... no
checking for sys/vfstab.h... no
checking sys/mntctl.h usability... no
checking sys/mntctl.h presence... no
checking for sys/mntctl.h... no
checking sys/sysctl.h usability... yes
checking sys/sysctl.h presence... yes
checking for sys/sysctl.h... yes
checking fstab.h usability... yes
checking fstab.h presence... yes
checking for fstab.h... yes
checking sys/uio.h usability... yes
checking sys/uio.h presence... yes
checking for sys/uio.h... yes
checking for struct stat.st_mtimensec... no
checking for struct stat.st_mtim.tv_nsec... yes
checking for struct stat.st_atimensec... no
checking for struct stat.st_atim.tv_nsec... yes
checking for struct stat.st_ctimensec... no
checking for struct stat.st_ctim.tv_nsec... yes
checking for struct stat.st_blksize... yes
checking for struct stat.st_blocks... yes
checking for struct statfs.f_fstypename... no
checking for struct statfs.f_bavail... yes
checking for struct statvfs.f_basetype... no
checking for nl_langinfo and CODESET... yes
checking whether we are using the GNU C Library 2.1 or newer... (cached) yes
checking stddef.h usability... yes
checking stddef.h presence... yes
checking for stddef.h... yes
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking for setlocale... yes
checking size of size_t... 4
checking for the appropriate definition for size_t... unsigned int
checking for lstat... yes
checking for strerror... yes
checking for strsignal... yes
checking for memmove... yes
checking for vsnprintf... yes
checking for stpcpy... yes
checking for strcasecmp... yes
checking for strncasecmp... yes
checking for poll... yes
checking for getcwd... yes
checking for vasprintf... yes
checking for setenv... yes
checking for unsetenv... yes
checking for getc_unlocked... yes
checking for readlink... yes
checking for symlink... yes
checking for fdwalk... no
checking for chown... yes
checking for lchmod... no
checking for lchown... yes
checking for fchmod... yes
checking for fchown... yes
checking for link... yes
checking for statvfs... yes
checking for statfs... yes
checking for utimes... yes
checking for getgrgid... yes
checking for getpwuid... yes
checking for getmntent_r... yes
checking for setmntent... yes
checking for endmntent... yes
checking for hasmntopt... yes
checking for getmntinfo... no
checking for nanosleep... yes
checking for nsleep... no
checking crt_externs.h usability... no
checking crt_externs.h presence... no
checking for crt_externs.h... no
checking for _NSGetEnviron... no
checking for C99 vsnprintf... yes
checking whether printf supports positional parameters... yes
checking value of AF_INET... 2
checking value of AF_INET6... 10
checking value of AF_UNIX... 1
checking value of MSG_PEEK... 2
checking value of MSG_OOB... 1
checking value of MSG_DONTROUTE... 4
checking for getprotobyname_r... yes
checking for endservent... yes
checking netdb.h usability... yes
checking netdb.h presence... yes
checking for netdb.h... yes
checking winsock2.h usability... no
checking winsock2.h presence... no
checking for winsock2.h... no
checking mswsock.h usability... no
checking mswsock.h presence... no
checking for mswsock.h... no
checking wspiapi.h usability... no
checking wspiapi.h presence... no
checking for wspiapi.h... no
checking for strndup... yes
checking for setresuid... yes
checking for setreuid... yes
checking sys/prctl.h usability... yes
checking sys/prctl.h presence... yes
checking for sys/prctl.h... yes
checking arpa/nameser_compat.h usability... yes
checking arpa/nameser_compat.h presence... yes
checking for arpa/nameser_compat.h... yes
checking for res_query... no
checking for res_query in -lresolv... yes
checking number of arguments to statfs()... 2
checking for signed... yes
checking for long long... yes
checking for long double... yes
checking for wchar_t... yes
checking for wint_t... yes
checking for size_t... yes
checking for ptrdiff_t... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for snprintf... yes
checking for wcslen... yes
checking for C99 snprintf... yes
checking for sys_errlist... yes
checking for sys_siglist... yes
checking for sys_siglist declaration... yes
checking for fd_set... yes, found in sys/types.h
checking whether realloc (NULL,) will work... yes
checking for nl_langinfo (CODESET)... yes
checking for a compliant posix_memalign() implementation... yes
checking for OpenBSD strlcpy/strlcat... no
checking for an implementation of va_copy()... yes
checking for an implementation of __va_copy()... yes
checking whether va_lists can be copied by value... yes
checking for dlopen... no
checking for NSLinkModule... no
checking for dlopen in -ldl... yes
checking for dlsym in -ldl... yes
/usr/lib/gcc/i586-suse-linux/4.4/../../../crt1.o: In function `_start':
/usr/src/packages/BUILD/glibc-2.10.1/csu/../sysdeps/i386/elf/start.S:115: undefined reference to `main'
collect2: ld returned 1 exit status
checking for RTLD_GLOBAL brokenness... no
checking for preceeding underscore in symbols... no
checking for dlerror... yes
checking for the suffix of module shared libraries... .so
checking for gspawn implementation... gspawn.lo
checking for GIOChannel implementation... giounix.lo
checking for is_selinux_enabled in -lselinux... yes
checking selinux/selinux.h usability... yes
checking selinux/selinux.h presence... yes
checking for selinux/selinux.h... yes
checking for lgetfilecon_raw in -lselinux... yes
checking sys/inotify.h usability... yes
checking sys/inotify.h presence... yes
checking for sys/inotify.h... yes
checking for inotify_init1... yes
checking for FAMOpen in -lfam... no
configure: WARNING: *** FAM support will not be built (FAM library not found) ***
checking for getxattr in -lc... yes
checking sys/xattr.h usability... yes
checking sys/xattr.h presence... yes
checking for sys/xattr.h... yes
checking for XATTR_NOFOLLOW... no
checking for platform-dependent source... 
checking whether to compile timeloop... yes
checking if building for some Win32 platform... no
checking for thread implementation... posix
checking thread related cflags... -pthread
checking for sched_get_priority_min... yes
checking thread related libraries... -pthread 
checking for localtime_r... yes
checking for gmtime_r... (cached) yes
checking for posix getpwuid_r... yes
checking for posix getgrgid_r... yes
checking size of pthread_t... 4
checking for pthread_attr_setstacksize... yes
checking for minimal/maximal thread priority... sched_get_priority_min(SCHED_OTHER)/sched_get_priority_max(SCHED_OTHER)
checking for pthread_setschedparam... yes
checking for posix yield function... sched_yield
checking size of pthread_mutex_t... 24
checking byte contents of PTHREAD_MUTEX_INITIALIZER... 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
checking for clock_gettime... no
checking for clock_gettime in -lrt... yes
checking for monotonic clocks... yes
checking whether to use assembler code for atomic operations... i486
checking value of POLLIN... 1
checking value of POLLOUT... 4
checking value of POLLPRI... 2
checking value of POLLERR... 8
checking value of POLLHUP... 16
checking value of POLLNVAL... 32
checking for broken poll... no
/home/sledz/work/HydraIP/OE/tmp.5/work/i686-linux/glib-2.0-native-2.22.4-r0/glib-2.22.4/configure: line 45117: syntax error near unexpected token `PCRE,'
/home/sledz/work/HydraIP/OE/tmp.5/work/i686-linux/glib-2.0-native-2.22.4-r0/glib-2.22.4/configure: line 45117: `    PKG_CHECK_MODULES(PCRE,'
FATAL: oe_runconf failed

--------------020103060503040803090706--
