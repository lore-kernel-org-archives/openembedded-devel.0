Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Onei9-0003v7-CD
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 23:37:49 +0200
Received: by wwi14 with SMTP id 14so644884wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 14:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=eEJsbHxdubdUWQOca5L4bLuQRP4IV7uIk6yXQrcBLD0=;
	b=kCAXhMwnuftH+VnBJAn7rmQN9zdeMKW4YwKU4cmEBgx+O9Q4kFo5R0N5476RF6keTa
	l5FObgFiI03TN76LAebvA1vTK9V8bhajJyJDnSpdanHNdjQ0alDyzK2mkMEZvyh60HB7
	VKPHiBV8uanjDVpKXDzwY8gwY6PVt5uT5iWZk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=hZi44rKQ+BpPiKYHkOcZADvK1xIWXmYkDpKM/FMoGx/3MqQSo50kDzWQs6AoRQxZHx
	os1hMtQh4KmAc0ZiMco//V5uVLOhE61XcwtdBaWTjrxDvHAXJMl+6boh+7GT1jv1bx4Y
	ntIOpTbclh5rIqG/xof48Ktap7dbFwLVnbKm8=
MIME-Version: 1.0
Received: by 10.216.145.99 with SMTP id o77mr5027824wej.113.1282599440413;
	Mon, 23 Aug 2010 14:37:20 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Mon, 23 Aug 2010 14:37:20 -0700 (PDT)
Date: Mon, 23 Aug 2010 14:37:20 -0700
Message-ID: <AANLkTinSSP7c=DtDsHhCtqosf3i9-3Ci0bneURG9ySHo@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Build failing on glib
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
X-List-Received-Date: Mon, 23 Aug 2010 21:37:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am building for an overo fire and have tried cleaning the recipe
deleting the entire tmp dir and still get stuck on this one file. I
have no clue how to even try to fix this one for myself would
appreciate some help. Here is as much of the error left in the
terminal:

| checking whether to enable garbage collector friendliness... no
| checking whether to disable memory pools... no
| checking for arm-angstrom-linux-gnueabi-gcc... (cached)
arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb
| checking whether we are using the GNU C compiler... (cached) yes
| checking whether arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb accepts -g... (cached) yes
| checking for arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb option to accept ISO C89... (cached) none needed
| checking dependency style of arm-angstrom-linux-gnueabi-gcc
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-mthumb-interwork -mno-thumb... (cached) gcc3
| checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E
| checking for arm-angstrom-linux-gnueabi-c++...
arm-angstrom-linux-gnueabi-g++ -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb
| checking whether we are using the GNU C++ compiler... yes
| checking whether arm-angstrom-linux-gnueabi-g++ -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb accepts -g... yes
| checking dependency style of arm-angstrom-linux-gnueabi-g++
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-mthumb-interwork -mno-thumb... gcc3
| checking for arm-angstrom-linux-gnueabi-gcc... (cached)
arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb
| checking whether we are using the GNU C compiler... (cached) yes
| checking whether arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb accepts -g... (cached) yes
| checking for arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb option to accept ISO C89... (cached) none needed
| checking dependency style of arm-angstrom-linux-gnueabi-gcc
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-mthumb-interwork -mno-thumb... (cached) gcc3
| checking whether arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb and cc understand -c and -o together... yes
| checking for special C compiler options needed for large files... no
| checking for _FILE_OFFSET_BITS value needed for large files... 64
| checking for pkg-config...
/home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/bin/pkg-config
| checking for gawk... (cached) gawk
| checking for perl5... no
| checking for perl... perl
| checking for indent... no
| checking for perl... /usr/bin/perl
| checking for a Python interpreter with version >= 2.4... python
| checking for python...
/home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/bin/python
| checking for python version... 2.6
| checking for python platform... linux2
| checking for python script directory... ${prefix}/lib/python2.6/site-packages
| checking for python extension module directory...
${exec_prefix}/lib/python2.6/site-packages
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
| checking for inflate in -lz... yes
| checking zlib.h usability... yes
| checking zlib.h presence... yes
| checking for zlib.h... yes
| checking locale.h usability... yes
| checking locale.h presence... yes
| checking for locale.h... yes
| checking for LC_MESSAGES... yes
| checking libintl.h usability... yes
| checking libintl.h presence... yes
| checking for libintl.h... yes
| checking for ngettext in libc... yes
| checking for dgettext in libc... yes
| checking for bind_textdomain_codeset... yes
| checking for msgfmt...
/home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/bin/msgfmt
| checking for dcgettext... yes
| checking if msgfmt accepts -c... yes
| checking for gmsgfmt...
/home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/bin/msgfmt
| checking for xgettext...
/home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/bin/xgettext
| checking for catalogs to be installed...  af am ar as ast az be
be@latin bg bn bn_IN bs ca ca@valencia cs cy da de dz el en_CA en_GB
en@shaw eo es et eu fa fi fr ga gl gu he hi hr hu hy id is it ja ka kn
ko ku lt lv mai mg mk ml mn mr ms nb nds ne nl nn oc or pa pl ps pt
pt_BR ro ru rw si sk sl sq sr sr@latin sr@ije sv ta te th tl tr tt uk
vi wa xh yi zh_CN zh_HK zh_TW
| checking for a sed that does not truncate output... /bin/sed
| checking for fgrep... /bin/grep -F
| checking for ld used by arm-angstrom-linux-gnueabi-gcc
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-mthumb-interwork -mno-thumb... arm-angstrom-linux-gnueabi-ld
| checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)...
arm-angstrom-linux-gnueabi-nm
| checking the name lister (arm-angstrom-linux-gnueabi-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking whether the shell understands some XSI constructs... yes
| checking whether the shell understands "+="... yes
| checking for arm-angstrom-linux-gnueabi-ld option to reload object files... -r
| checking for arm-angstrom-linux-gnueabi-objdump...
arm-angstrom-linux-gnueabi-objdump
| checking how to recognize dependent libraries... pass_all
| checking for arm-angstrom-linux-gnueabi-ar... arm-angstrom-linux-gnueabi-ar
| checking for arm-angstrom-linux-gnueabi-strip... (cached)
arm-angstrom-linux-gnueabi-strip
| checking for arm-angstrom-linux-gnueabi-ranlib...
arm-angstrom-linux-gnueabi-ranlib
| checking command to parse arm-angstrom-linux-gnueabi-nm output from
arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb object...
ok
| checking for dlfcn.h... yes
| checking whether we are using the GNU C++ compiler... (cached) yes
| checking whether arm-angstrom-linux-gnueabi-g++ -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb accepts -g... (cached) yes
| checking dependency style of arm-angstrom-linux-gnueabi-g++
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-mthumb-interwork -mno-thumb... (cached) gcc3
| checking how to run the C++ preprocessor...
arm-angstrom-linux-gnueabi-g++ -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb -E
| checking for objdir... .libs
| checking if arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb supports -fno-rtti -fno-exceptions... no
| checking for arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb option to produce PIC... -fPIC -DPIC
| checking if arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb PIC flag -fPIC -DPIC works... yes
| checking if arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb static flag -static works... yes
| checking if arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb supports -c -o file.o... yes
| checking if arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb supports -c -o file.o... (cached) yes
| checking whether the arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb linker (arm-angstrom-linux-gnueabi-ld) supports shared
libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for ld used by arm-angstrom-linux-gnueabi-g++
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-mthumb-interwork -mno-thumb... arm-angstrom-linux-gnueabi-ld
| checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld... yes
| checking whether the arm-angstrom-linux-gnueabi-g++ -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb linker (arm-angstrom-linux-gnueabi-ld) supports shared
libraries... yes
| checking for arm-angstrom-linux-gnueabi-g++ -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb option to produce PIC... -fPIC -DPIC
| checking if arm-angstrom-linux-gnueabi-g++ -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb PIC flag -fPIC -DPIC works... yes
| checking if arm-angstrom-linux-gnueabi-g++ -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb static flag -static works... yes
| checking if arm-angstrom-linux-gnueabi-g++ -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb supports -c -o file.o... yes
| checking if arm-angstrom-linux-gnueabi-g++ -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb supports -c -o file.o... (cached) yes
| checking whether the arm-angstrom-linux-gnueabi-g++ -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb linker (arm-angstrom-linux-gnueabi-ld) supports shared
libraries... yes
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| configure: creating ./config.lt
| config.lt: creating arm-angstrom-linux-gnueabi-libtool
| checking for extra flags for POSIX compliance... none needed
| checking for ANSI C header files... (cached) yes
| checking for vprintf... yes
| checking for _doprnt... no
| checking for working alloca.h... yes
| checking for alloca... yes
| checking for mmap... yes
| checking for posix_memalign... yes
| checking for memalign... yes
| checking for valloc... yes
| checking for fsync... yes
| checking for pipe2... yes
| checking for atexit... yes
| checking for on_exit... yes
| checking for timegm... yes
| checking for gmtime_r... yes
| checking size of char... (cached) 1
| checking size of short... (cached) 2
| checking size of long... (cached) 4
| checking size of int... (cached) 4
| checking size of void *... (cached) 4
| checking size of long long... (cached) 8
| checking size of __int64... (cached) 0
| checking for format to printf and scanf a guint64... (cached) %llu
| checking for an ANSI C-conforming const... yes
| checking if malloc() and friends prototypes are gmem.h compatible... yes
| checking for growing stack pointer... (cached) no
| checking for __inline... (cached) yes
| checking for __inline__... (cached) yes
| checking for inline... (cached) yes
| checking if inline functions in headers work... yes
| checking for working do while(0) macros... yes
| checking for ISO C99 varargs macros in C... yes
| checking for ISO C99 varargs macros in C++... yes
| checking for GNUC varargs macros... yes
| checking for GNUC visibility attribute... yes
| checking whether using Sun Studio C compiler... no
| checking whether byte ordering is bigendian... (cached) no
| checking dirent.h usability... yes
| checking dirent.h presence... yes
| checking for dirent.h... yes
| checking float.h usability... yes
| checking float.h presence... yes
| checking for float.h... yes
| checking limits.h usability... yes
| checking limits.h presence... yes
| checking for limits.h... yes
| checking pwd.h usability... yes
| checking pwd.h presence... yes
| checking for pwd.h... yes
| checking grp.h usability... yes
| checking grp.h presence... yes
| checking for grp.h... yes
| checking sys/param.h usability... yes
| checking sys/param.h presence... yes
| checking for sys/param.h... yes
| checking sys/poll.h usability... yes
| checking sys/poll.h presence... yes
| checking for sys/poll.h... yes
| checking sys/resource.h usability... yes
| checking sys/resource.h presence... yes
| checking for sys/resource.h... yes
| checking sys/time.h usability... yes
| checking sys/time.h presence... yes
| checking for sys/time.h... yes
| checking sys/times.h usability... yes
| checking sys/times.h presence... yes
| checking for sys/times.h... yes
| checking sys/wait.h usability... yes
| checking sys/wait.h presence... yes
| checking for sys/wait.h... yes
| checking for unistd.h... (cached) yes
| checking values.h usability... yes
| checking values.h presence... yes
| checking for values.h... yes
| checking sys/select.h usability... yes
| checking sys/select.h presence... yes
| checking for sys/select.h... yes
| checking for sys/types.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking sched.h usability... yes
| checking sched.h presence... yes
| checking for sched.h... yes
| checking malloc.h usability... yes
| checking malloc.h presence... yes
| checking for malloc.h... yes
| checking sys/vfs.h usability... yes
| checking sys/vfs.h presence... yes
| checking for sys/vfs.h... yes
| checking sys/mount.h usability... yes
| checking sys/mount.h presence... yes
| checking for sys/mount.h... yes
| checking sys/vmount.h usability... no
| checking sys/vmount.h presence... no
| checking for sys/vmount.h... no
| checking sys/statfs.h usability... yes
| checking sys/statfs.h presence... yes
| checking for sys/statfs.h... yes
| checking sys/statvfs.h usability... yes
| checking sys/statvfs.h presence... yes
| checking for sys/statvfs.h... yes
| checking mntent.h usability... yes
| checking mntent.h presence... yes
| checking for mntent.h... yes
| checking sys/mnttab.h usability... no
| checking sys/mnttab.h presence... no
| checking for sys/mnttab.h... no
| checking sys/vfstab.h usability... no
| checking sys/vfstab.h presence... no
| checking for sys/vfstab.h... no
| checking sys/mntctl.h usability... no
| checking sys/mntctl.h presence... no
| checking for sys/mntctl.h... no
| checking sys/sysctl.h usability... yes
| checking sys/sysctl.h presence... yes
| checking for sys/sysctl.h... yes
| checking fstab.h usability... yes
| checking fstab.h presence... yes
| checking for fstab.h... yes
| checking sys/uio.h usability... yes
| checking sys/uio.h presence... yes
| checking for sys/uio.h... yes
| checking for struct stat.st_mtimensec... no
| checking for struct stat.st_mtim.tv_nsec... yes
| checking for struct stat.st_atimensec... no
| checking for struct stat.st_atim.tv_nsec... yes
| checking for struct stat.st_ctimensec... no
| checking for struct stat.st_ctim.tv_nsec... yes
| checking for struct stat.st_blksize... yes
| checking for struct stat.st_blocks... yes
| checking for struct statfs.f_fstypename... no
| checking for struct statfs.f_bavail... yes
| checking for struct statvfs.f_basetype... no
| checking for nl_langinfo and CODESET... yes
| checking whether we are using the GNU C Library 2.1 or newer... (cached) yes
| checking stddef.h usability... yes
| checking stddef.h presence... yes
| checking for stddef.h... yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for setlocale... yes
| checking size of size_t... (cached) 4
| checking for the appropriate definition for size_t... unsigned int
| checking for lstat... yes
| checking for strerror... (cached) yes
| checking for strsignal... yes
| checking for memmove... yes
| checking for vsnprintf... yes
| checking for stpcpy... yes
| checking for strcasecmp... yes
| checking for strncasecmp... yes
| checking for poll... yes
| checking for getcwd... yes
| checking for vasprintf... yes
| checking for setenv... yes
| checking for unsetenv... yes
| checking for getc_unlocked... yes
| checking for readlink... yes
| checking for symlink... yes
| checking for fdwalk... no
| checking for chown... yes
| checking for lchmod... no
| checking for lchown... yes
| checking for fchmod... yes
| checking for fchown... yes
| checking for link... yes
| checking for statvfs... yes
| checking for statfs... yes
| checking for utimes... yes
| checking for getgrgid... yes
| checking for getpwuid... yes
| checking for getmntent_r... yes
| checking for setmntent... yes
| checking for endmntent... yes
| checking for hasmntopt... yes
| checking for getmntinfo... no
| checking for nanosleep... yes
| checking for nsleep... no
| checking for splice... yes
| checking crt_externs.h usability... no
| checking crt_externs.h presence... no
| checking for crt_externs.h... no
| checking for _NSGetEnviron... no
| checking for C99 vsnprintf... (cached) yes
| checking whether printf supports positional parameters... (cached) yes
| checking value of AF_INET... 2
| checking value of AF_INET6... 10
| checking value of AF_UNIX... 1
| checking value of MSG_PEEK... 2
| checking value of MSG_OOB... 1
| checking value of MSG_DONTROUTE... 4
| checking for getprotobyname_r... yes
| checking for endservent... yes
| checking netdb.h usability... yes
| checking netdb.h presence... yes
| checking for netdb.h... yes
| checking wspiapi.h usability... no
| checking wspiapi.h presence... no
| checking for wspiapi.h... no
| checking for strndup... yes
| checking for setresuid... (cached) yes
| checking for setreuid... yes
| checking sys/prctl.h usability... yes
| checking sys/prctl.h presence... yes
| checking for sys/prctl.h... yes
| checking arpa/nameser_compat.h usability... yes
| checking arpa/nameser_compat.h presence... yes
| checking for arpa/nameser_compat.h... yes
| checking for res_query... in -lresolv
| checking number of arguments to statfs()... 2
| checking for signed... yes
| checking for long long... yes
| checking for long double... yes
| checking for wchar_t... yes
| checking for wint_t... yes
| checking for size_t... yes
| checking for ptrdiff_t... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for snprintf... yes
| checking for wcslen... yes
| checking for C99 snprintf... (cached) yes
| checking for sys_errlist... yes
| checking for sys_siglist... yes
| checking for sys_siglist declaration... yes
| checking for fd_set... yes, found in sys/types.h
| checking whether realloc (NULL,) will work... (cached) yes
| checking for nl_langinfo (CODESET)... yes
| checking for a compliant posix_memalign() implementation... (cached) yes
| checking for OpenBSD strlcpy/strlcat... no
| checking for an implementation of va_copy()... (cached) yes
| checking for an implementation of __va_copy()... (cached) yes
| checking whether va_lists can be copied by value... (cached) yes
| checking for dlopen... no
| checking for NSLinkModule... no
| checking for dlopen in -ldl... yes
| checking for dlsym in -ldl... yes
| /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/crt1.o:
In function `_start':
| init.c:(.text+0x30): undefined reference to `main'
| collect2: ld returned 1 exit status
| checking for RTLD_GLOBAL brokenness... (cached) no
| checking for preceeding underscore in symbols... (cached) no
| checking for dlerror... yes
| checking for the suffix of module shared libraries... .so
| checking for gspawn implementation... gspawn.lo
| checking for GIOChannel implementation... giounix.lo
| checking for is_selinux_enabled in -lselinux... no
| checking sys/inotify.h usability... yes
| checking sys/inotify.h presence... yes
| checking for sys/inotify.h... yes
| checking for inotify_init1... yes
| checking for FAMOpen in -lfam... no
| configure: WARNING: *** FAM support will not be built (FAM library
not found) ***
| checking for getxattr in -lc... yes
| checking sys/xattr.h usability... yes
| checking sys/xattr.h presence... yes
| checking for sys/xattr.h... yes
| checking for XATTR_NOFOLLOW... no
| checking for platform-dependent source...
| checking whether to compile timeloop... yes
| checking if building for some Win32 platform... no
| checking for thread implementation... posix
| checking thread related cflags... -pthread
| checking for sched_get_priority_min... yes
| checking thread related libraries... -pthread
| checking for localtime_r... yes
| checking for gmtime_r... (cached) yes
| checking for posix getpwuid_r... (cached) yes
| checking for posix getgrgid_r... (cached) yes
| checking size of pthread_t... (cached) 4
| checking for pthread_attr_setstacksize... yes
| checking for minimal/maximal thread priority...
sched_get_priority_min(SCHED_OTHER)/sched_get_priority_max(SCHED_OTHER)
| checking for pthread_setschedparam... yes
| checking for posix yield function... sched_yield
| checking size of pthread_mutex_t... (cached) 24
| checking byte contents of PTHREAD_MUTEX_INITIALIZER... no
| checking for clock_gettime... no
| checking for clock_gettime in -lrt... yes
| checking for monotonic clocks... yes
| checking whether to use assembler code for atomic operations...
checking whether GCC supports build-in atomic intrinsics... yes
| checking for futex(2) system call... yes
| checking value of POLLIN... 1
| checking value of POLLOUT... 4
| checking value of POLLPRI... 2
| checking value of POLLERR... 8
| checking value of POLLHUP... 16
| checking value of POLLNVAL... 32
| checking for broken poll... no (cross compiling)
| checking whether compiler understands -Wno-pointer-sign... yes
| checking for EILSEQ... yes
| checking for glib-genmarshal... no
| configure: error: Could not find a glib-genmarshal in your PATH
NOTE: Task failed:
/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/glib-2.0-2.24.1-r0/temp/log.do_configure.28085
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/glib-2.0/glib-2.0_2.24.1.bb
do_configure failed
ERROR: Task 8 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/glib-2.0/glib-2.0_2.24.1.bb,
do_configure) failed
NOTE: Tasks Summary: Attempted 4 tasks of which 4 didn't need to be
rerun and 1 failed.
ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/glib-2.0/glib-2.0_2.24.1.bb'
failed

Thanks for any help with this.


