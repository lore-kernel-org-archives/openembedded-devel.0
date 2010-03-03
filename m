Received: from qw-out-1920.google.com ([74.125.92.146])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jesmith@kaon.com>) id 1NmsGv-0004QT-R7
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 18:22:13 +0100
Received: by qw-out-1920.google.com with SMTP id 5so359244qwc.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 09:19:19 -0800 (PST)
Received: by 10.224.45.1 with SMTP id c1mr45042qaf.87.1267636751776;
	Wed, 03 Mar 2010 09:19:11 -0800 (PST)
Received: from ?10.10.0.195? (216-230-77-82.client.cypresscom.net
	[216.230.77.82])
	by mx.google.com with ESMTPS id 39sm1877577yxd.63.2010.03.03.09.19.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Mar 2010 09:19:10 -0800 (PST)
From: Joshua Smith <jesmith@kaon.com>
Mime-Version: 1.0 (Apple Message framework v1077)
Date: Wed, 3 Mar 2010 12:19:08 -0500
In-Reply-To: <B22FA4FC-2DB7-49E8-AB09-3FF8FC3D36D9@kaon.com>
To: openembedded-devel@lists.openembedded.org
References: <B22FA4FC-2DB7-49E8-AB09-3FF8FC3D36D9@kaon.com>
Message-Id: <4CF74675-86F3-45C9-A837-5D5A3489F2A5@kaon.com>
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 74.125.92.146
X-SA-Exim-Mail-From: jesmith@kaon.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Trying and Failing to enable Java with GCC 4.3.3
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
X-List-Received-Date: Wed, 03 Mar 2010 17:22:15 -0000
X-Groupsio-MsgNum: 17300
Content-Type: multipart/mixed; boundary=Apple-Mail-50--580743534

--Apple-Mail-50--580743534
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Update: I dug around in the log files and I think I have a more root =
cause of this error.

configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.

I've attached the whole log of the failing build.

Any hints?

On Mar 3, 2010, at 11:20 AM, Joshua Smith wrote:

> Hello,
>=20
> I'm new to OE.  I'm trying to get GCJ compiled for the TouchBook (an =
ARM-based tablet).  After some searching and trial-and-error, I figured =
out that I need to add:
>=20
> JAVA_arm =3D ",java" to recipies/gcc-4.3.3.inc
>=20
> But now I'm getting an error when it tries to build gcc-cross-4.3.3:
>=20
> make[4]: Entering directory =
`/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc=
-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/64/zlib'
> make[4]: *** No rule to make target `all'.  Stop.
> make[4]: Leaving directory =
`/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc=
-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/64/zlib'
> make[3]: *** [multi-do] Error 1
> make[3]: Leaving directory =
`/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc=
-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/zlib'
> make[2]: *** [all-multi] Error 2
> make[2]: Leaving directory =
`/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc=
-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/zlib'
> make[1]: *** [all-zlib] Error 2
>=20
> (I can give you more of the log if it would help, but this is the =
first error)
>=20
> I can see why adding Java would cause GCC to need zlib when maybe it =
didn't before.  But I don't know what to change to get zlib configured =
as part of the gcc build process.
>=20
> Help?
>=20
> -Joshua Smith
>=20

--Apple-Mail-50--580743534
Content-Disposition: attachment;
	filename=log.do_compile.19464
Content-Type: application/octet-stream;
	name="log.do_compile.19464"
Content-Transfer-Encoding: 7bit

NOTE: make -j4 ARCH_FLAGS_FOR_TARGET=-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -isystem/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
make[1]: Entering directory `/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi'
mkdir -p -- build-i686-linux/libiberty
Configuring in build-i686-linux/libiberty
mkdir -p -- ./libiberty
mkdir -p -- ./intl
mkdir -p -- ./fixincludes
Configuring in ./libiberty
Configuring in ./intl
Configuring in ./fixincludes
configure: creating cache ./config.cache
checking build system type... i686-pc-linux-gnu
checking host system type... configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
i686-pc-linux-gnu
checking target system type... configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: creating cache ./config.cache
checking whether make sets $(MAKE)... arm-angstrom-linux-gnueabi
checking for i686-linux-gcc... gcc 
configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
yes
checking for a BSD-compatible install... /usr/bin/install -c
checking whether NLS is requested... yes
checking for msgfmt... checking for C compiler default output file name... configure: loading site script /OE/ai.openembedded.dev/site/common
configure: creating cache ./config.cache
checking whether to enable maintainer-specific portions of Makefiles... no
checking for makeinfo... makeinfo --split-size=5000000
checking for perl... perl
checking build system type... configure: creating cache ../config.cache
i686-pc-linux-gnu
checking host system type... checking whether to enable maintainer-specific portions of Makefiles... no
checking for makeinfo... makeinfo --split-size=5000000
checking for perl... perl
i686-pc-linux-gnu
/OE/build/tmp/staging/i686-linux/usr/bin/msgfmt
checking for gmsgfmt... /OE/build/tmp/staging/i686-linux/usr/bin/msgfmt
checking for i686-linux-ar... ar
checking for i686-linux-ranlib... ranlib
checking for i686-linux-gcc... gcc 
checking build system type... i686-pc-linux-gnu
checking for xgettext... a.out
checking whether the C compiler works... yes
/OE/build/tmp/staging/i686-linux/usr/bin/xgettext
checking for msgmerge... checking host system type... checking whether we are cross compiling... no
checking for suffix of executables... /OE/build/tmp/staging/i686-linux/usr/bin/msgmerge
i686-pc-linux-gnu

checking for suffix of object files... checking for i686-linux-gcc... gcc 
checking for i686-linux-ar... ar
checking for i686-linux-ranlib... ranlib
checking for i686-linux-gcc... gcc 
checking for C compiler default output file name... o
checking whether we are using the GNU C compiler... checking for C compiler default output file name... checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... yes
checking whether gcc  accepts -g... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... a.out
checking whether the C compiler works... yes
checking for gcc  option to accept ISO C89... yes
checking whether we are cross compiling... no
checking for suffix of executables... 
checking for suffix of object files... 
o
checking whether we are using the GNU C compiler... checking for suffix of object files... 
checking for suffix of object files... none needed
checking whether gcc  supports -W... yes
checking whether gcc  accepts -g... o
checking whether we are using the GNU C compiler... o
checking whether we are using the GNU C compiler... yes
checking whether gcc  supports -Wall... yes
checking whether gcc  accepts -g... yes
checking for gcc  option to accept ANSI C... yes
checking whether gcc  accepts -g... yes
checking whether gcc  supports -Wwrite-strings... yes
checking for gcc  option to accept ANSI C... none needed
yes
checking for gcc  option to accept ANSI C... yes
checking whether gcc  supports -Wstrict-prototypes... checking how to run the C preprocessor... gcc -E
none needed
none needed
yes
checking whether gcc  supports -Wmissing-prototypes... checking how to run the C preprocessor... gcc -E
checking build system type... i686-pc-linux-gnu
yes
checking host system type... checking whether gcc  supports -Wold-style-definition... checking whether gcc  supports -W... yes
checking whether gcc  supports -Wmissing-format-attribute... checking whether gcc  supports -W... i686-pc-linux-gnu
checking for i686-linux-ranlib... ranlib
checking for library containing strerror... yes
yes
checking whether gcc  supports -Wno-overlength-strings... yes
checking whether gcc  supports -Wall... checking whether gcc  supports -Wall... yes
checking whether gcc  supports -pedantic -Wno-long-long... none required
checking how to run the C preprocessor... gcc -E
yes
yes
yes
checking how to run the C preprocessor... gcc -E
checking whether gcc  supports -Wwrite-strings... checking whether gcc  supports -Wwrite-strings... yes
checking whether gcc  supports -Wc++-compat... yes
checking for grep that handles long lines and -e... checking whether gcc  supports -Wc++-compat... checking for egrep... /bin/grep
checking for egrep... /bin/grep -E
checking for ANSI C header files... grep -E
checking for ANSI C header files... yes
yes
checking whether gcc  supports -Wstrict-prototypes... checking whether gcc  supports -Wstrict-prototypes... yes
yes
checking whether gcc  supports -pedantic ... checking whether gcc  supports -pedantic ... yes
checking whether gcc  and cc understand -c and -o together... yes
checking whether gcc  and cc understand -c and -o together... yes
checking for sys/types.h... yes
yes
checking for an ANSI C-conforming const... checking for sys/stat.h... yes
checking for an ANSI C-conforming const... yes
checking for an ANSI C-conforming const... yes
checking for inline... yes
yes
checking for inline... checking for stdlib.h... inline
checking for sys/types.h... yes
checking for inline... yes
yes
checking for string.h... inline
checking whether byte ordering is bigendian... checking for sys/stat.h... inline
checking whether byte ordering is bigendian... (cached) no
checking for a BSD-compatible install... /usr/bin/install -c
checking for sys/file.h... yes
checking for memory.h... yes
checking for sys/param.h... yes
yes
checking for stdlib.h... checking for strings.h... no
checking for a BSD-compatible install... /usr/bin/install -c
checking for sys/file.h... yes
yes
checking for sys/param.h... checking for limits.h... yes
yes
yes
checking for string.h... checking for limits.h... checking for inttypes.h... yes
checking for stdlib.h... yes
checking for stdlib.h... yes
checking for malloc.h... yes
yes
yes
yes
checking for malloc.h... checking for string.h... checking for memory.h... yes
yes
checking for string.h... checking for stdint.h... checking for unistd.h... yes
checking for unistd.h... yes
yes
checking for strings.h... yes
checking for strings.h... checking for strings.h... yes
checking for unistd.h... yes
checking for sys/time.h... yes
yes
checking for sys/time.h... yes
checking stddef.h usability... checking for inttypes.h... yes
yes
checking for time.h... checking for time.h... yes
checking for stdint.h... yes
yes
yes
checking stddef.h presence... checking for sys/resource.h... yes
checking for stddef.h... yes
checking for sys/resource.h... checking for stdlib.h... (cached) yes
checking for strings.h... (cached) yes
yes
yes
checking for unistd.h... (cached) checking for sys/stat.h... yes
yes
checking for sys/stat.h... checking for unistd.h... yes
checking fcntl.h usability... yes
checking for sys/mman.h... checking for sys/mman.h... yes
checking fcntl.h presence... yes
yes
checking for fcntl.h... yes
yes
checking for fcntl.h... yes
checking for fcntl.h... yes
checking for off_t... checking sys/file.h usability... yes
checking for alloca.h... checking for alloca.h... yes
yes
checking for size_t... yes
checking for sys/pstat.h... yes
checking sys/file.h presence... checking for sys/pstat.h... yes
checking for sys/file.h... no
no
checking for sys/sysmp.h... yes
checking for working alloca.h... yes
checking for sys/sysmp.h... checking for sys/stat.h... (cached) yes
no
checking for sys/sysinfo.h... yes
no
checking for sys/sysinfo.h... checking for clearerr_unlocked... checking for machine/hal_sysinfo.h... yes
yes
checking for alloca... checking for machine/hal_sysinfo.h... no
yes
checking for sys/table.h... no
checking for sys/table.h... checking for feof_unlocked... no
no
checking for sys/sysctl.h... checking for sys/sysctl.h... yes
checking for stdlib.h... (cached) yes
yes
yes
checking for unistd.h... (cached) yes
yes
checking for sys/systemcfg.h... checking for getpagesize... (cached) yes
no
checking for ferror_unlocked... checking for working mmap... (cached) yes
checking whether we are using the GNU C Library 2.1 or newer... checking for stdint.h... checking for sys/systemcfg.h... yes
checking for stdio_ext.h... yes
checking whether integer division by zero raises SIGFPE... no
checking for stdint.h... yes
yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking for stdio_ext.h... checking for fflush_unlocked... yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking for inttypes.h... yes
yes
checking for fgetc_unlocked... checking whether time.h and sys/time.h may both be included... yes
checking whether time.h and sys/time.h may both be included... yes
checking whether errno must be declared... yes
yes
checking for stdint.h... checking for fgets_unlocked... yes
checking whether errno must be declared... no
checking for egrep... yes
checking for unsigned long long... yes
grep -E
checking for ANSI C header files... checking for fileno_unlocked... no
checking for egrep... grep -E
checking for ANSI C header files... yes
checking for fprintf_unlocked... yes
checking for inttypes.h... yes
yes
no
checking whether the inttypes.h PRIxNN macros are broken... checking for fputc_unlocked... checking for sys/types.h... yes
no
checking for sys/stat.h... (cached) yes
checking for ld used by GCC... ld
checking if the linker (ld) is GNU ld... yes
checking for shared library run path origin... yes
checking for fputs_unlocked... yes
checking for stdlib.h... (cached) yes
checking for sys/types.h... checking for string.h... (cached) yes
done
checking for memory.h... yes
checking for sys/stat.h... (cached) yes
checking argz.h usability... checking for stdlib.h... (cached) yes
yes
yes
checking for fread_unlocked... checking for string.h... (cached) yes
checking for strings.h... (cached) yes
checking for memory.h... checking for inttypes.h... yes
checking argz.h presence... yes
yes
yes
checking for stdint.h... (cached) yes
checking for fwrite_unlocked... checking for strings.h... (cached) yes
yes
checking for argz.h... yes
checking for unistd.h... (cached) yes
checking for int... checking limits.h usability... checking for inttypes.h... yes
yes
checking for stdint.h... (cached) yes
checking for getchar_unlocked... checking for unistd.h... (cached) yes
yes
checking size of int... (cached) 4
yes
checking limits.h presence... checking for uintptr_t... checking for int... yes
checking for limits.h... yes
checking locale.h usability... yes
yes
checking for a 64-bit type... yes
checking size of int... uint64_t
checking for getc_unlocked... checking for pid_t... yes
checking locale.h presence... 4
checking for uintptr_t... yes
checking for locale.h... yes
yes
checking nl_types.h usability... checking for library containing strerror... yes
checking for putchar_unlocked... yes
checking for a 64-bit type... yes
yes
checking nl_types.h presence... checking for putc_unlocked... none required
checking for asprintf... uint64_t
checking for pid_t... yes
checking for nl_types.h... yes
checking malloc.h usability... yes
yes
checking whether abort is declared... checking for atexit... yes
checking malloc.h presence... yes
checking for library containing strerror... yes
checking for malloc.h... yes
yes
checking whether asprintf is declared... yes
none required
checking stddef.h usability... checking for asprintf... checking for basename... no
checking whether basename is declared... yes
no
checking whether errno is declared... yes
checking for bcmp... yes
checking stddef.h presence... checking for atexit... yes
checking for stddef.h... yes
no
checking for stdlib.h... (cached) yes
checking whether vasprintf is declared... checking for string.h... (cached) yes
yes
checking for unistd.h... (cached) yes
checking for basename... yes
no
checking whether clearerr_unlocked is declared... checking sys/param.h usability... checking for bcopy... yes
checking sys/param.h presence... yes
checking whether feof_unlocked is declared... yes
yes
checking for sys/param.h... checking for bsearch... yes
checking for feof_unlocked... yes
checking for bcmp... yes
checking whether ferror_unlocked is declared... yes
yes
checking whether fflush_unlocked is declared... yes
checking for fgets_unlocked... yes
checking for bzero... checking for bcopy... yes
checking whether fgetc_unlocked is declared... yes
checking for getc_unlocked... yes
checking for calloc... yes
checking whether fgets_unlocked is declared... yes
checking for getcwd... yes
no
checking whether fileno_unlocked is declared... yes
checking for bsearch... checking for clock... yes
checking for getegid... yes
checking whether fprintf_unlocked is declared... yes
yes
checking for ffs... checking for bzero... no
checking whether fputc_unlocked is declared... yes
checking for geteuid... yes
yes
checking for getcwd... yes
checking whether fputs_unlocked is declared... checking for calloc... yes
checking for getgid... no
checking whether fread_unlocked is declared... yes
yes
checking for getpagesize... (cached) yes
checking for clock... yes
checking whether fwrite_unlocked is declared... checking for gettimeofday... yes
checking for getuid... yes
checking whether getchar_unlocked is declared... yes
yes
checking for index... yes
checking for ffs... yes
checking whether getc_unlocked is declared... yes
yes
checking whether putchar_unlocked is declared... checking for insque... yes
checking for getcwd... yes
yes
checking whether putc_unlocked is declared... checking for munmap... yes
checking for memchr... yes
yes
checking for an ANSI C-conforming const... checking for getpagesize... yes
checking for putenv... yes
checking sys/mman.h usability... yes
yes
checking for gettimeofday... yes
checking for memcmp... yes
checking sys/mman.h presence... checking for setenv... yes
checking for sys/mman.h... yes
checking for mmap... yes
yes
yes
checking for setlocale... checking for memcpy... (cached) yes
checking for index... checking for memmove... yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
yes
checking whether to enable maintainer-specific portions of Makefiles... no
configure: updating cache ./config.cache
configure: creating ./config.status
yes
checking for stpcpy... checking for insque... yes
checking for mempcpy... yes
yes
checking for memchr... yes
checking for strcasecmp... checking for memset... config.status: creating Makefile
yes
checking for mkstemps... yes
config.status: creating mkheaders.almost
yes
checking for strdup... config.status: creating config.h
checking for memcmp... no
checking for putenv... yes
checking for strtoul... mkdir -p -- build-i686-linux/fixincludes
Configuring in build-i686-linux/fixincludes
yes
yes
checking for random... checking for memcpy... yes
checking for tsearch... yes
yes
checking for rename... checking for memmove... yes
checking for __argz_count... yes
checking for rindex... yes
yes
checking for __argz_stringify... checking for mempcpy... yes
yes
yes
checking for __argz_next... checking for setenv... checking for memset... yes
yes
yes
checking for mkstemps... checking for __fsetlocking... checking for snprintf... no
checking for putenv... configure: loading cache ../config.cache
yes
yes
checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking target system type... checking for iconv... checking for sigsetmask... yes
checking for random... arm-angstrom-linux-gnueabi
checking for i686-linux-gcc... gcc 
checking for C compiler default output file name... yes
yes
checking for iconv declaration... a.out
checking whether the C compiler works... yes
checking for stpcpy... yes
checking whether we are cross compiling... no
checking for suffix of executables... checking for rename... 
checking for suffix of object files... 
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
checking for nl_langinfo and CODESET... o
checking whether we are using the GNU C compiler... yes
yes
checking whether gcc  accepts -g... yes
checking for stpncpy... yes
checking for LC_MESSAGES... yes
checking for gcc  option to accept ISO C89... checking for rindex... none needed
checking whether gcc  supports -W... yes
yes
checking for bison... bison
checking version of bison... checking for strcasecmp... 2.3, ok
checking whether NLS is requested... yes
checking whether included gettext is requested... no
checking for GNU gettext in libc... yes
checking whether gcc  supports -Wall... yes
yes
checking for strchr... yes
checking whether to use NLS... yes
checking where the gettext function comes from... libc
checking for setenv... yes
checking whether gcc  supports -Wwrite-strings... checking for aclocal... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
yes
checking for strdup... updating cache ./config.cache
configure: creating ./config.status
yes
checking whether gcc  supports -Wstrict-prototypes... yes
yes
checking whether gcc  supports -Wmissing-prototypes... checking for snprintf... yes
yes
checking for strncasecmp... checking whether gcc  supports -Wold-style-definition... yes
checking whether gcc  supports -Wmissing-format-attribute... yes
checking whether gcc  supports -Wno-overlength-strings... yes
checking for strndup... yes
checking for sigsetmask... yes
checking whether gcc  supports -pedantic -Wno-long-long... yes
checking for strrchr... yes
checking how to run the C preprocessor... gcc -E
yes
config.status: creating Makefile
checking for stpcpy... checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for ANSI C header files... config.status: creating config.intl
config.status: creating config.h
yes
checking for strstr... yes
checking for stpncpy... yes
config.status: executing default-1 commands
checking for sys/types.h... yes
checking for sys/stat.h... yes
yes
checking for strtod... yes
checking for strcasecmp... checking for stdlib.h... yes
yes
mkdir -p -- ./zlib
Configuring in ./zlib
checking for string.h... yes
checking for strchr... checking for strtol... yes
checking for memory.h... yes
checking for strdup... yes
yes
checking for strtoul... checking for strings.h... yes
checking for strncasecmp... yes
yes
checking for inttypes.h... yes
checking for strndup... checking for strverscmp... yes
checking for stdint.h... yes
yes
checking for tmpnam... checking for strrchr... yes
yes
checking for unistd.h... checking for vasprintf... yes
checking for strstr... yes
configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
checking stddef.h usability... configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/common
yes
checking for strtod... configure: creating cache ./config.cache
yes
checking for vfprintf... checking build system type... yes
checking stddef.h presence... i686-pc-linux-gnu
checking host system type... yes
checking for stddef.h... yes
yes
checking for stdlib.h... (cached) yes
checking for strings.h... (cached) yes
i686-pc-linux-gnu
checking target system type... yes
checking for strtol... checking for unistd.h... (cached) yes
arm-angstrom-linux-gnueabi
checking for vprintf... checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... checking fcntl.h usability... yes
yes
checking fcntl.h presence... checking for strtoul... yes
checking for fcntl.h... yes
checking sys/file.h usability... yes
yes
checking for vsnprintf... yes
checking sys/file.h presence... yes
checking for sys/file.h... yes
yes
checking for strverscmp... checking for sys/stat.h... (cached) yes
yes
checking for clearerr_unlocked... checking for vsprintf... checking for gawk... gawk
checking whether make sets $(MAKE)... yes
yes
checking for tmpnam... checking whether to enable maintainer-specific portions of Makefiles... no
checking for i686-linux-gcc... gcc 
yes
yes
checking for waitpid... checking for feof_unlocked... yes
checking for C compiler default output file name... yes
checking for vasprintf... yes
checking whether alloca needs Cray hooks... checking for ferror_unlocked... a.out
checking whether the C compiler works... yes
no
checking stack direction for C alloca... checking whether we are cross compiling... no
checking for suffix of executables... yes
checking for fflush_unlocked... yes

checking for suffix of object files... checking for vfprintf... -1
checking for unistd.h... (cached) yes
checking for vfork.h... o
checking whether we are using the GNU C compiler... yes
no
checking for fork... checking for fgetc_unlocked... yes
yes
checking whether gcc  accepts -g... checking for vprintf... yes
checking for vfork... yes
checking for gcc  option to accept ANSI C... yes
yes
checking for fgets_unlocked... checking for vsnprintf... yes
none needed
checking for working fork... checking for style of include used by make... GNU
checking dependency style of gcc ... yes
checking for working vfork... (cached) yes
checking for _doprnt... yes
yes
checking for vsprintf... checking for fileno_unlocked... gcc3
checking for a sed that does not truncate output... /bin/sed
checking for egrep... no
yes
checking for waitpid... grep -E
checking for fgrep... grep -F
checking for ld used by gcc ... ld
checking if the linker (ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... nm
checking the name lister (nm) interface... checking for sys_errlist... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 805306365
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
yes
checking for ld option to reload object files... -r
checking how to recognize dependent libraries... pass_all
checking for i686-linux-ar... ar
checking for i686-linux-strip... strip
checking for i686-linux-ranlib... ranlib
checking command to parse nm output from gcc  object... checking for fprintf_unlocked... yes
checking for sys_nerr... yes
checking whether alloca needs Cray hooks... no
checking stack direction for C alloca... no
checking for fputc_unlocked... ok
checking how to run the C preprocessor... gcc -E
yes
checking for sys_siglist... yes
-1
checking for ANSI C header files... checking for unistd.h... (cached) yes
checking for fputs_unlocked... checking for vfork.h... yes
checking for external symbol _system_configuration... no
no
checking for fork... yes
checking for getrusage... checking for fread_unlocked... yes
yes
checking for sys/types.h... checking for vfork... yes
checking for on_exit... yes
yes
checking for fwrite_unlocked... yes
checking for sys/stat.h... checking for psignal... yes
checking for getchar_unlocked... yes
checking for working fork... yes
yes
checking for stdlib.h... yes
checking for working vfork... (cached) yes
checking for _doprnt... checking for strerror... (cached) yes
checking for strsignal... yes
yes
checking for string.h... no
checking for sys_errlist... checking for getc_unlocked... yes
yes
checking for memory.h... checking for sysconf... yes
checking for sys_nerr... yes
checking for putchar_unlocked... yes
yes
checking for sys_siglist... checking for strings.h... yes
checking for putc_unlocked... yes
checking for times... yes
yes
checking whether abort is declared... yes
checking for external symbol _system_configuration... checking for sbrk... yes
checking for inttypes.h... no
yes
checking whether asprintf is declared... checking for getrusage... yes
no
checking whether basename is declared... yes
checking for stdint.h... checking for gettimeofday... (cached) yes
checking for realpath... no
checking whether errno is declared... yes
checking for on_exit... no
checking whether vasprintf is declared... yes
yes
checking for canonicalize_file_name... checking for unistd.h... yes
no
checking whether clearerr_unlocked is declared... checking for psignal... yes
checking for pstat_getstatic... yes
checking whether feof_unlocked is declared... yes
checking for dlfcn.h... no
checking for pstat_getdynamic... yes
checking whether ferror_unlocked is declared... yes
checking for objdir... .libs
yes
checking whether fflush_unlocked is declared... yes
checking for strerror... no
checking for sysmp... yes
checking whether fgetc_unlocked is declared... checking if gcc  supports -fno-rtti -fno-exceptions... no
checking for getsysinfo... yes
no
checking for gcc  option to produce PIC... -fPIC -DPIC
checking if gcc  PIC flag -fPIC -DPIC works... checking for strsignal... yes
checking whether fgets_unlocked is declared... yes
checking if gcc  static flag -static works... no
no
checking whether fileno_unlocked is declared... checking for table... yes
checking for sysconf... no
checking for sysctl... yes
checking whether fprintf_unlocked is declared... yes
no
checking whether fputc_unlocked is declared... checking for times... yes
yes
checking for wait3... checking whether fputs_unlocked is declared... yes
checking for sbrk... no
checking whether fread_unlocked is declared... yes
yes
checking if gcc  supports -c -o file.o... checking for wait4... yes
checking whether fwrite_unlocked is declared... yes
checking if gcc  supports -c -o file.o... (cached) yes
checking whether the gcc  linker (ld) supports shared libraries... yes
checking for gettimeofday... (cached) yes
yes
checking whether -lc should be explicitly linked in... yes
checking whether getchar_unlocked is declared... checking for realpath... yes
yes
checking whether getc_unlocked is declared... checking for __fsetlocking... no
checking dynamic linker characteristics... yes
checking for canonicalize_file_name... yes
checking whether putchar_unlocked is declared... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
yes
checking whether putc_unlocked is declared... yes
checking for pstat_getstatic... yes
checking how to run the C preprocessor... gcc -E
checking whether basename is declared... yes
checking for an ANSI C-conforming const... no
checking for pstat_getdynamic... checking for stdlib.h... (cached) yes
no
checking for unistd.h... (cached) yes
checking sys/mman.h usability... checking whether ffs is declared... yes
no
checking for getpagesize... (cached) yes
checking for sysmp... checking for working mmap... (cached) yes
checking for memcpy... (cached) yes
yes
checking sys/mman.h presence... checking for strerror... (cached) yes
yes
checking whether asprintf is declared... yes
checking for sys/mman.h... yes
checking for mmap... checking for unistd.h... (cached) yes
no
checking for getsysinfo... no
checking whether vasprintf is declared... updating cache ./config.cache
configure: creating ./config.status
yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... no
no
checking whether snprintf is declared... checking for table... yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
checking whether to enable maintainer-specific portions of Makefiles... no
no
configure: updating cache ../config.cache
configure: creating ./config.status
checking for sysctl... yes
checking whether vsnprintf is declared... yes
yes
checking whether calloc is declared... checking for wait3... yes
checking whether getenv is declared... yes
checking for wait4... yes
checking whether getopt is declared... yes
config.status: creating Makefile
checking for __fsetlocking... config.status: creating mkheaders.almost
config.status: creating config.h
yes
checking whether malloc is declared... yes
checking whether basename is declared... yes
checking whether realloc is declared... no
mkdir -p -- ./libdecnumber
Configuring in ./libdecnumber
checking whether ffs is declared... yes
checking whether sbrk is declared... yes
checking whether asprintf is declared... yes
checking whether strverscmp is declared... no
checking whether vasprintf is declared... no
checking whether canonicalize_file_name must be declared... no
checking whether snprintf is declared... yes
checking for stdlib.h... (cached) yes
checking for unistd.h... (cached) yes
yes
checking whether vsnprintf is declared... checking for getpagesize... (cached) yes
checking for working mmap... (cached) yes
checking for working strncmp... yes
checking whether calloc is declared... config.status: creating Makefile
yes
yes
config.status: executing default-1 commands
checking whether getenv is declared... updating cache ./config.cache
configure: creating ./config.status
yes
checking whether getopt is declared... yes
checking whether malloc is declared... configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: creating cache ./config.cache
checking whether make sets $(MAKE)... yes
checking for i686-linux-gcc... gcc 
yes
checking whether realloc is declared... Adding multilib support to Makefile in /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/zlib
multidirs=64
with_multisubdir=
Running configure in multilib subdirs 64
pwd: /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/zlib
checking for C compiler default output file name... Running configure in multilib subdir 64
pwd: /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi
mkdir 64
a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... yes
checking whether sbrk is declared... config.status: creating Makefile

checking for suffix of object files... yes
checking whether strverscmp is declared... config.status: creating testsuite/Makefile
config.status: creating config.h
o
checking whether we are using the GNU C compiler... no
checking whether canonicalize_file_name must be declared... config.status: executing default commands
yes
checking whether gcc  accepts -g... yes
checking for stdlib.h... (cached) yes
yes
checking for gcc  option to accept ANSI C... checking for unistd.h... (cached) yes
checking for getpagesize... (cached) yes
checking for working mmap... none needed
make[2]: Entering directory `/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/libiberty'
if [ x"-fpic" != x ] && [ ! -d pic ]; then \
	  mkdir pic; \
	else true; fi
touch stamp-picdir
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/safe-ctype.c -o pic/safe-ctype.o; \
	else true; fi
checking for i686-linux-ranlib... ranlib
yes
checking for aclocal... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
checking whether gcc  supports -W... checking for working strncmp... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/safe-ctype.c -o safe-ctype.o
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/sort.c -o pic/sort.o; \
	else true; fi
yes
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/sort.c -o sort.o
yes
checking whether gcc  supports -Wall... updating cache ../config.cache
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/spaces.c -o pic/spaces.o; \
	else true; fi
configure: creating ./config.status
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/spaces.c -o spaces.o
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/splay-tree.c -o pic/splay-tree.o; \
	else true; fi
yes
checking whether gcc  supports -Wwrite-strings... yes
checking whether gcc  supports -Wstrict-prototypes... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/splay-tree.c -o splay-tree.o
configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
yes
checking whether gcc  supports -Wmissing-prototypes... configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: creating cache ./config.cache
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/strerror.c -o pic/strerror.o; \
	else true; fi
yes
checking whether gcc  supports -Wold-style-definition... checking build system type... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/strerror.c -o strerror.o
i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
yes
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/strsignal.c -o pic/strsignal.o; \
	else true; fi
checking target system type... checking whether gcc  supports -Wmissing-format-attribute... arm-angstrom-linux-gnueabi
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... config.status: creating Makefile
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/strsignal.c -o strsignal.o
yes
checking whether gcc  supports -Wcast-qual... config.status: creating testsuite/Makefile
yes
checking whether gcc  supports -pedantic -Wno-long-long... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/unlink-if-ordinary.c -o pic/unlink-if-ordinary.o; \
	else true; fi
config.status: creating config.h
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/unlink-if-ordinary.c -o unlink-if-ordinary.o
yes
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
yes
checking how to run the C preprocessor... gcc -E
checking for i686-linux-strip... strip
checking whether to enable maintainer-specific portions of Makefiles... no
checking for i686-linux-gcc... gcc  -m64
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xatexit.c -o pic/xatexit.o; \
	else true; fi
config.status: executing default commands
checking for suffix of object files... checking for egrep... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xatexit.c -o xatexit.o
grep -E
checking for ANSI C header files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc  -m64 accepts -g... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xexit.c -o pic/xexit.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xexit.c -o xexit.o
yes
checking for gcc  -m64 option to accept ANSI C... yes
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xmalloc.c -o pic/xmalloc.o; \
	else true; fi
checking for sys/types.h... mkdir -p -- ./gcc
Configuring in ./gcc
yes
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xmalloc.c -o xmalloc.o
checking for sys/stat.h... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xmemdup.c -o pic/xmemdup.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xmemdup.c -o xmemdup.o
yes
checking for stdlib.h... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xstrdup.c -o pic/xstrdup.o; \
	else true; fi
none needed
checking for style of include used by make... GNU
checking dependency style of gcc  -m64... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xstrdup.c -o xstrdup.o
yes
gcc3
checking for a sed that does not truncate output... checking for string.h... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xstrerror.c -o pic/xstrerror.o; \
	else true; fi
/bin/sed
checking for egrep... grep -E
checking for fgrep... grep -F
checking for ld used by gcc  -m64... ld
checking if the linker (ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... nm
checking the name lister (nm) interface... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xstrerror.c -o xstrerror.o
yes
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xstrndup.c -o pic/xstrndup.o; \
	else true; fi
BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 805306365
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking for ld option to reload object files... -r
checking how to recognize dependent libraries... pass_all
checking for i686-linux-ar... ar
checking for i686-linux-strip... (cached) strip
checking for i686-linux-ranlib... ranlib
checking command to parse nm output from gcc  -m64 object... checking for memory.h... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/xstrndup.c -o xstrndup.o
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/mkstemps.c -o pic/mkstemps.o; \
	else true; fi
yes
checking for strings.h... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/mkstemps.c -o mkstemps.o
failed
checking how to run the C preprocessor... gcc -E
rm -f needed-list; touch needed-list; \
	for f in atexit calloc memchr memcmp memcpy memmove memset rename strchr strerror strncmp strrchr strstr strtol strtoul tmpnam vfprintf vprintf vfork waitpid bcmp bcopy bzero; do \
	  for g in ./mkstemps.o ; do \
	    case "$g" in \
	      *$f*) echo $g >> needed-list ;; \
	    esac; \
	  done; \
	done
echo ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./alloca.o ./argv.o ./choose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o ./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbasename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-one.o ./pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./strerror.o ./strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmemdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o > required-list
yes
make[3]: Entering directory `/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/libiberty/testsuite'
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/regex.c -o pic/regex.o; \
	else true; fi
checking for inttypes.h... checking for ANSI C header files... configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/endian-little
configure: loading site script /OE/ai.openembedded.dev/site/common-linux
configure: loading site script /OE/ai.openembedded.dev/site/common-glibc
configure: loading site script /OE/ai.openembedded.dev/site/ix86-common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: loading site script /OE/ai.openembedded.dev/site/common
configure: creating cache ./config.cache
no
yes
checking for sys/types.h... checking for stdint.h... no
checking for sys/stat.h... checking build system type... no
yes
checking for unistd.h... checking for stdlib.h... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking target system type... arm-angstrom-linux-gnueabi
no
checking LIBRARY_PATH variable... ok
checking GCC_EXEC_PREFIX variable... ok
checking whether to place generated files in the source directory... no
checking whether a default linker was specified... no
checking whether a default assembler was specified... no
checking for i686-linux-gcc... gcc 
checking for string.h... yes
checking ctype.h usability... checking for C compiler default output file name... no
checking for memory.h... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... no
checking for strings.h... yes
checking ctype.h presence... 
checking for suffix of object files... yes
checking for ctype.h... yes
no
checking for inttypes.h... checking stddef.h usability... no
o
checking whether we are using the GNU C compiler... checking for stdint.h... no
yes
checking stddef.h presence... checking for unistd.h... yes
checking whether gcc  accepts -g... yes
checking for stddef.h... yes
checking for string.h... (cached) yes
no
checking for dlfcn.h... checking stdio.h usability... yes
checking for gcc  option to accept ANSI C... no
checking for objdir... .libs
yes
checking stdio.h presence... none needed
yes
checking for stdio.h... yes
checking if gcc  -m64 supports -fno-rtti -fno-exceptions... looking for a compliant stdint.h in stdint.h, checking for uintmax_t... checking whether gcc  and cc understand -c and -o together... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/regex.c -o regex.o
no
checking for gcc  -m64 option to produce PIC... -fPIC -DPIC
checking if gcc  -m64 PIC flag -fPIC -DPIC works... yes
checking for uintptr_t... yes
checking if gcc  -m64 static flag -static works... yes
checking for int_least32_t... no
checking if gcc  -m64 supports -c -o file.o... yes
yes
checking for int_fast32_t... checking how to run the C preprocessor... gcc -E
yes
checking if gcc  -m64 supports -c -o file.o... (cached) yes
checking whether the gcc  -m64 linker (ld) supports shared libraries... checking for inline... yes
checking whether -lc should be explicitly linked in... yes
checking for uint64_t... inline
checking for egrep... grep -E
checking for ANSI C header files... no
checking dynamic linker characteristics... configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.
yes
checking what to include in gstdint.h... stdint.h (already complete)
checking for an ANSI C-conforming const... yes
checking for off_t... yes
checking for sys/types.h... yes
checking for int... yes
checking for sys/stat.h... yes
checking size of int... (cached) 4
checking for long... yes
checking for stdlib.h... yes
checking size of long... (cached) 4
checking for ANSI C header files... (cached) yes
checking build system type... yes
i686-pc-linux-gnu
checking host system type... checking for string.h... i686-pc-linux-gnu
checking target system type... arm-angstrom-linux-gnueabi
checking for decimal floating point... dpd
checking whether byte ordering is bigendian... (cached) no
updating cache ./config.cache
configure: creating ./config.status
yes
checking for memory.h... make[1]: *** [configure-zlib] Error 1
make[1]: *** Waiting for unfinished jobs....
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/cplus-dem.c -o pic/cplus-dem.o; \
	else true; fi
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/cp-demangle.c -o pic/cp-demangle.o; \
	else true; fi
yes
checking for strings.h... yes
checking for inttypes.h... config.status: creating Makefile
config.status: creating config.h
config.status: executing gstdint.h commands
yes
checking for stdint.h... yes
checking for unistd.h... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/md5.c -o pic/md5.o; \
	else true; fi
yes
checking for void *... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/cp-demangle.c -o cp-demangle.o
yes
checking size of void *... (cached) 4
checking for short... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/md5.c -o md5.o
yes
checking size of short... (cached) 2
checking for int... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/cplus-dem.c -o cplus-dem.o
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/alloca.c -o pic/alloca.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/alloca.c -o alloca.o
yes
checking size of int... (cached) 4
checking for long... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/argv.c -o pic/argv.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/argv.c -o argv.o
yes
checking size of long... (cached) 4
checking for long long... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/choose-temp.c -o pic/choose-temp.o; \
	else true; fi
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/concat.c -o pic/concat.o; \
	else true; fi
yes
checking for long long... (cached) yes
checking size of long long... (cached) 8
checking for __int64... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/choose-temp.c -o choose-temp.o
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/concat.c -o concat.o
no
checking whether gcc  supports -W... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/cp-demint.c -o pic/cp-demint.o; \
	else true; fi
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/dyn-string.c -o pic/dyn-string.o; \
	else true; fi
yes
checking whether gcc  supports -Wall... yes
checking whether gcc  supports -Wwrite-strings... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/cp-demint.c -o cp-demint.o
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/dyn-string.c -o dyn-string.o
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/fdmatch.c -o pic/fdmatch.o; \
	else true; fi
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/fibheap.c -o pic/fibheap.o; \
	else true; fi
yes
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/fdmatch.c -o fdmatch.o
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/filename_cmp.c -o pic/filename_cmp.o; \
	else true; fi
checking whether gcc  supports -Wstrict-prototypes... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/floatformat.c -o pic/floatformat.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/filename_cmp.c -o filename_cmp.o
yes
checking whether gcc  supports -Wmissing-prototypes... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/fibheap.c -o fibheap.o
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/fnmatch.c -o pic/fnmatch.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/fnmatch.c -o fnmatch.o
yes
checking whether gcc  supports -Wc++-compat... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/fopen_unlocked.c -o pic/fopen_unlocked.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/fopen_unlocked.c -o fopen_unlocked.o
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/floatformat.c -o floatformat.o
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/getopt.c -o pic/getopt.o; \
	else true; fi
yes
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/getopt.c -o getopt.o
checking whether gcc  supports -Wold-style-definition... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/getopt1.c -o pic/getopt1.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/getopt1.c -o getopt1.o
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/getpwd.c -o pic/getpwd.o; \
	else true; fi
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/getruntime.c -o pic/getruntime.o; \
	else true; fi
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/hashtab.c -o pic/hashtab.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/getpwd.c -o getpwd.o
yes
checking whether gcc  supports -Wmissing-format-attribute... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/hex.c -o pic/hex.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/getruntime.c -o getruntime.o
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/hex.c -o hex.o
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/hashtab.c -o hashtab.o
yes
checking whether gcc  supports -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-overlength-strings... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/lbasename.c -o pic/lbasename.o; \
	else true; fi
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/lrealpath.c -o pic/lrealpath.o; \
	else true; fi
yes
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/lbasename.c -o lbasename.o
checking valgrind.h usability... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/lrealpath.c -o lrealpath.o
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/make-relative-prefix.c -o pic/make-relative-prefix.o; \
	else true; fi
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/make-temp-file.c -o pic/make-temp-file.o; \
	else true; fi
no
checking valgrind.h presence... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/objalloc.c -o pic/objalloc.o; \
	else true; fi
no
checking for valgrind.h... no
configure: WARNING: decimal float is not supported for this target
configure: WARNING: fixed-point is not supported for this target
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/make-temp-file.c -o make-temp-file.o
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/objalloc.c -o objalloc.o
checking whether make sets $(MAKE)... yes
checking for gawk... gawk
checking whether ln -s works... yes
checking whether ln works... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/make-relative-prefix.c -o make-relative-prefix.o
yes
checking for i686-linux-ranlib... ranlib
checking for a BSD compatible install... /usr/bin/install -c
checking for cmp's capabilities... gnucompare
checking for mktemp... yes
checking for makeinfo... makeinfo --split-size=5000000
checking for modern makeinfo... yes
checking for recent Pod::Man... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/obstack.c -o pic/obstack.o; \
	else true; fi
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/partition.c -o pic/partition.o; \
	else true; fi
yes
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pexecute.c -o pic/pexecute.o; \
	else true; fi
checking for flex... flex
checking for bison... bison
checking for nm... nm
checking for ar... ar
checking for GNU C library... gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/obstack.c -o obstack.o
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pexecute.c -o pexecute.o
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/partition.c -o partition.o
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/physmem.c -o pic/physmem.o; \
	else true; fi
yes
checking for ANSI C header files... (cached) yes
checking whether time.h and sys/time.h may both be included... if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-common.c -o pic/pex-common.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/physmem.c -o physmem.o
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-one.c -o pic/pex-one.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-one.c -o pex-one.o
if [ x"-fpic" != x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c -o pic/pex-unix.o; \
	else true; fi
yes
checking whether string.h and strings.h may both be included... /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c: In function 'pex_child_error':
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:343: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:344: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:345: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:346: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:347: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:348: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:349: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:350: warning: ignoring return value of 'write', declared with attribute warn_unused_result
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-common.c -o pex-common.o
yes
gcc  -c -DHAVE_CONFIG_H -isystem/OE/build/tmp/staging/i686-linux/usr/include -O2 -I. -I/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c -o pex-unix.o
checking for sys/wait.h that is POSIX.1 compatible... /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c: In function 'pex_child_error':
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:343: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:344: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:345: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:346: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:347: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:348: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:349: warning: ignoring return value of 'write', declared with attribute warn_unused_result
/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/libiberty/pex-unix.c:350: warning: ignoring return value of 'write', declared with attribute warn_unused_result
yes
rm -f ./libiberty.a pic/./libiberty.a
ar rc ./libiberty.a \
	  ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./alloca.o ./argv.o ./choose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o ./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbasename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-one.o ./pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./strerror.o ./strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmemdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o  ./mkstemps.o
checking for limits.h... ranlib ./libiberty.a
if [ x"-fpic" != x ]; then \
	  cd pic; \
	  ar rc ./libiberty.a \
	    ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./alloca.o ./argv.o ./choose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o ./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbasename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-one.o ./pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./strerror.o ./strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmemdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o  ./mkstemps.o; \
	  ranlib ./libiberty.a; \
	  cd ..; \
	else true; fi
make[2]: Leaving directory `/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/libiberty'
yes
checking for stddef.h... yes
checking for string.h... (cached) yes
checking for strings.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for time.h... yes
checking for iconv.h... yes
checking for fcntl.h... yes
checking for unistd.h... (cached) yes
checking for sys/file.h... yes
checking for sys/time.h... yes
checking for sys/mman.h... yes
checking for sys/resource.h... yes
checking for sys/param.h... yes
checking for sys/times.h... yes
checking for sys/stat.h... (cached) yes
checking for direct.h... no
checking for malloc.h... yes
checking for langinfo.h... yes
checking for ldfcn.h... no
checking for locale.h... yes
checking for wchar.h... yes
checking for thread.h... no
checking for pthread.h... yes
checking for CHAR_BIT... yes
checking whether byte ordering is bigendian... (cached) no
checking for collect2 libraries... none required
checking for library containing exc_resume... no
checking for library containing ldexp... none required
checking for inttypes.h... yes
checking for times... yes
checking for clock... yes
checking for kill... yes
checking for getrlimit... yes
checking for setrlimit... yes
checking for atoll... yes
checking for atoq... no
checking for sysconf... yes
checking for strsignal... yes
checking for getrusage... yes
checking for nl_langinfo... yes
checking for scandir... yes
checking for alphasort... yes
checking for gettimeofday... yes
checking for mbstowcs... yes
checking for wcswidth... yes
checking for mmap... yes
checking for mincore... yes
checking for setlocale... yes
checking for clearerr_unlocked... yes
checking for feof_unlocked... yes
checking for ferror_unlocked... yes
checking for fflush_unlocked... yes
checking for fgetc_unlocked... yes
checking for fgets_unlocked... yes
checking for fileno_unlocked... yes
checking for fprintf_unlocked... no
checking for fputc_unlocked... yes
checking for fputs_unlocked... yes
checking for fread_unlocked... yes
checking for fwrite_unlocked... yes
checking for getchar_unlocked... yes
checking for getc_unlocked... yes
checking for putchar_unlocked... yes
checking for putc_unlocked... yes
checking whether mbstowcs works... yes
checking for ssize_t... yes
checking for uid_t in sys/types.h... (cached) {ac_cv_type_uid_t=yes}
checking type of array argument to getgroups... gid_t
checking for sys/mman.h... (cached) yes
checking for mmap... (cached) yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
checking for pid_t... yes
checking for unistd.h... (cached) yes
checking for vfork.h... no
checking for fork... yes
checking for vfork... yes
checking for working fork... yes
checking for working vfork... (cached) yes
checking for ld used by GCC... ld
checking if the linker (ld) is GNU ld... yes
checking for shared library run path origin... done
checking for iconv... yes
checking for iconv declaration... 
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
checking for LC_MESSAGES... yes
checking for nl_langinfo and CODESET... yes
checking whether getenv is declared... yes
checking whether atol is declared... yes
checking whether asprintf is declared... yes
checking whether sbrk is declared... yes
checking whether abort is declared... yes
checking whether atof is declared... yes
checking whether getcwd is declared... yes
checking whether getwd is declared... yes
checking whether strsignal is declared... yes
checking whether strstr is declared... yes
checking whether strverscmp is declared... yes
checking whether errno is declared... yes
checking whether snprintf is declared... yes
checking whether vsnprintf is declared... yes
checking whether vasprintf is declared... yes
checking whether malloc is declared... yes
checking whether realloc is declared... yes
checking whether calloc is declared... yes
checking whether free is declared... yes
checking whether basename is declared... yes
checking whether getopt is declared... no
checking whether clock is declared... yes
checking whether getpagesize is declared... yes
checking whether clearerr_unlocked is declared... yes
checking whether feof_unlocked is declared... yes
checking whether ferror_unlocked is declared... yes
checking whether fflush_unlocked is declared... yes
checking whether fgetc_unlocked is declared... yes
checking whether fgets_unlocked is declared... yes
checking whether fileno_unlocked is declared... yes
checking whether fprintf_unlocked is declared... no
checking whether fputc_unlocked is declared... yes
checking whether fputs_unlocked is declared... yes
checking whether fread_unlocked is declared... yes
checking whether fwrite_unlocked is declared... yes
checking whether getchar_unlocked is declared... yes
checking whether getc_unlocked is declared... yes
checking whether putchar_unlocked is declared... yes
checking whether putc_unlocked is declared... yes
checking whether getrlimit is declared... yes
checking whether setrlimit is declared... yes
checking whether getrusage is declared... yes
checking whether ldgetname is declared... no
checking whether times is declared... yes
checking whether sigaltstack is declared... yes
checking for struct tms... yes
checking for clock_t... yes
checking for .preinit_array/.init_array/.fini_array support... yes
checking if mkdir takes one argument... no
For  real value is 
For  real value is 
Using `/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/gcc/config/arm/arm.c' for machine-specific logic.
Using `/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/gcc/config/arm/arm.md' as machine description file.
Using the following target machine macro files:
	/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/gcc/config/dbxelf.h
	/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/gcc/config/elfos.h
	/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/gcc/config/linux.h
	/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/gcc/config/arm/elf.h
	/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/gcc/config/arm/linux-gas.h
	/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/gcc/config/arm/linux-elf.h
	/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/gcc/config/arm/bpabi.h
	/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/gcc/config/arm/linux-eabi.h
	/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/gcc/config/arm/aout.h
	/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/gcc/config/arm/arm.h
Using host-linux.o for host machine hooks.
checking whether NLS is requested... yes
checking for catalogs to be installed...  be da de el es fi fr id ja nl ru sr sv tr zh_CN zh_TW be da de el es fi fr id ja nl ru sr sv tr zh_CN zh_TW
checking for a sed that does not truncate output... /bin/sed
checking for fgrep... grep -F
checking for ld used by gcc ... ld
checking if the linker (ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... nm
checking the name lister (nm) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 805306365
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking for ld option to reload object files... -r
checking how to recognize dependent libraries... pass_all
checking for i686-linux-ar... (cached) ar
checking for i686-linux-strip... strip
checking for i686-linux-ranlib... (cached) ranlib
checking command to parse nm output from gcc  object... ok
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc  supports -fno-rtti -fno-exceptions... no
checking for gcc  option to produce PIC... -fPIC -DPIC
checking if gcc  PIC flag -fPIC -DPIC works... yes
checking if gcc  static flag -static works... yes
checking if gcc  supports -c -o file.o... yes
checking if gcc  supports -c -o file.o... (cached) yes
checking whether the gcc  linker (ld) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking what assembler to use... /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bin/as
checking what linker to use... /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bin/ld
checking what nm to use... /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bin/nm
checking what objdump to use... /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bin/objdump
checking assembler for .balign and .p2align... yes
checking assembler for .p2align with maximum skip... yes
checking assembler for .literal16... no
checking assembler for working .subsection -1... yes
checking assembler for .weak... yes
checking assembler for .weakref... yes
checking assembler for .nsubspa comdat... no
checking assembler for .hidden... yes
checking linker for .hidden support... yes
checking assembler for .sleb128 and .uleb128... yes
checking assembler for eh_frame optimization... no
checking assembler for section merging support... yes
checking assembler for COMDAT group support... no
checking assembler for COMDAT group support... yes
checking assembler for thread-local storage support... yes
checking linker -Bstatic/-Bdynamic option... yes
checking assembler for dwarf2 debug_line support... yes
checking assembler for buggy dwarf2 .file directive... no
checking assembler for --gdwarf2 option... yes
checking assembler for --gstabs option... yes
checking assembler for --debug-prefix-map option... yes
checking assembler for tolerance to line number 0... yes
checking linker read-only and read-write section mixing... read-write
checking linker PT_GNU_EH_FRAME support... yes
checking linker position independent executable support... yes
checking linker EH-compatible garbage collection of sections... no
checking linker --as-needed support... yes
checking linker --sysroot support... yes
checking __stack_chk_fail in target C library... yes
Using ggc-page for garbage collection.
checking whether to enable maintainer-specific portions of Makefiles... no
Links are now set up to build a cross-compiler
 from i686-pc-linux-gnu to arm-angstrom-linux-gnueabi.
updating cache ./config.cache
configure: creating ./config.status
config.status: creating as
config.status: creating collect-ld
config.status: creating nm
config.status: creating Makefile
config.status: creating gccbug
config.status: creating libada-mk
config.status: creating ada/Makefile
config.status: creating auto-host.h
config.status: executing default commands
make[1]: Leaving directory `/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi'
make: *** [all] Error 2
FATAL: oe_runmake failed

--Apple-Mail-50--580743534--
