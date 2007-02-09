Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>)
	id 1HFSma-0004uw-8E; Fri, 09 Feb 2007 11:15:17 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 0A46F28C013; Fri,  9 Feb 2007 11:10:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from [192.168.2.128] (e180176234.adsl.alicedsl.de [85.180.176.234])
	by srv043.dedi23.de (Postfix) with ESMTP id 87AAC28C011;
	Fri,  9 Feb 2007 11:09:56 +0100 (CET)
Date: Fri, 9 Feb 2007 11:15:07 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.95.6) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <632810863.20070209111507@vanille-media.de>
To: Jim Thompson <jim@netgate.com>
In-Reply-To: <3FB473C1-9865-4B0F-A320-1BC0814B6025@netgate.com>
References: <3FB473C1-9865-4B0F-A320-1BC0814B6025@netgate.com>
MIME-Version: 1.0
Cc: openembedded-issues@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe-issues] potential issue with glibc-initial
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2007 10:15:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

[forwarded to correct list, since only bugzilla is supposed to post to openembedded-issues]

Jim Thompson wrote:
> "eclipse" is essentially a clone of x86.conf

> jim@ubuntu:~/OpenEmbedded/build$ bitbake -vvv glibc-intermediate
> NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install
> it to increase performance.
> NOTE: Using cache in '/home/jim/OpenEmbedded/build/tmp/cache/eclipse'
> NOTE: Handling BitBake files: - (4151/4151) [100 %]
> NOTE: Parsing finished. 3968 cached, 0 parsed, 183 skipped, 0 masked.

> NOTE: build 200702082255: started

> OE Build Configuration:
> BB_VERSION     = "1.6.3"
> OE_REVISION    = "64a406be5c1819c15b47d3a2a9b566ff3f852846"
> TARGET_ARCH    = "i686"
> TARGET_OS      = "linux"
> MACHINE        = "eclipse"
> DISTRO         = "generic"
> DISTRO_VERSION = ".dev-snapshot-20070209"
> TARGET_FPU     = ""

> NOTE: current path: glibc-intermediate (glibc-intermediate)
> NOTE: dependencies for glibc-intermediate are: autoconf-native  
> automake-native libtool-native gnu-config-native file-native fakeroot-
> native quilt-native virtual/i686-linux-gcc-initial linux-libc-headers
> NOTE: Selecting already-staged autoconf-native (2.59-r5) to satisfy  
> autoconf-native
> NOTE: current path: glibc-intermediate (glibc-intermediate) ->  
> autoconf-native (autoconf-native)
> NOTE: dependencies for autoconf-native are: quilt-native m4-native  
> gnu-config-native
> NOTE: Selecting already-staged quilt-native (0.45-r1) to satisfy  
> quilt-native
> NOTE: current path: glibc-intermediate (glibc-intermediate) ->  
> autoconf-native (autoconf-native) -> quilt-native (quilt-native)
> NOTE: dependencies for quilt-native are: patch-native
> NOTE: Selecting already-staged m4-native (1.4.4-r0) to satisfy m4-native
> NOTE: current path: glibc-intermediate (glibc-intermediate) ->  
> autoconf-native (autoconf-native) -> m4-native (m4-native)
> NOTE: dependencies for m4-native are: quilt-native gnu-config-native
> NOTE: Selecting already-staged gnu-config-native (0.1+cvs20050701-r4)
> to satisfy gnu-config-native
> NOTE: current path: glibc-intermediate (glibc-intermediate) ->  
> autoconf-native (autoconf-native) -> m4-native (m4-native) -> gnu- 
> config-native (gnu-config-native)
> NOTE: dependencies for gnu-config-native are: quilt-native
> NOTE: Selecting already-staged automake-native (1.9.3-r5) to satisfy  
> automake-native
> NOTE: current path: glibc-intermediate (glibc-intermediate) ->  
> automake-native (automake-native)
> NOTE: dependencies for automake-native are: quilt-native autoconf-native
> NOTE: Selecting already-staged libtool-native (1.5.10-r4) to satisfy  
> libtool-native
> NOTE: current path: glibc-intermediate (glibc-intermediate) ->  
> libtool-native (libtool-native)
> NOTE: dependencies for libtool-native are: autoconf-native automake- 
> native gnu-config-native quilt-native
> NOTE: Selecting already-staged file-native (4.18-r1) to satisfy file- 
> native
> NOTE: current path: glibc-intermediate (glibc-intermediate) -> file- 
> native (file-native)
> NOTE: dependencies for file-native are: autoconf-native automake- 
> native libtool-native gnu-config-native quilt-native
> NOTE: Selecting already-staged fakeroot-native (1.2.13-r1) to satisfy
> fakeroot-native
> NOTE: current path: glibc-intermediate (glibc-intermediate) ->  
> fakeroot-native (fakeroot-native)
> NOTE: dependencies for fakeroot-native are: autoconf-native automake- 
> native libtool-native gnu-config-native quilt-native
> NOTE: Selecting already-staged gcc-cross-initial (4.1.1-r10) to  
> satisfy virtual/i686-linux-gcc-initial
> NOTE: selecting gcc-cross-initial to satisfy virtual/i686-linux-gcc- 
> initial due to PREFERRED_PROVIDERS
> NOTE: current path: glibc-intermediate (glibc-intermediate) -> gcc- 
> cross-initial (virtual/i686-linux-gcc-initial)
> NOTE: dependencies for gcc-cross-initial are: autoconf-native  
> automake-native libtool-native gnu-config-native file-native fakeroot-
> native quilt-native virtual/i686-linux-binutils virtual/i686-linux- 
> libc-initial
> NOTE: Selecting already-staged binutils-cross (2.17.50.0.5-r1) to  
> satisfy virtual/i686-linux-binutils
> NOTE: current path: glibc-intermediate (glibc-intermediate) -> gcc- 
> cross-initial (virtual/i686-linux-gcc-initial) -> binutils-cross  
> (virtual/i686-linux-binutils)
> NOTE: dependencies for binutils-cross are: autoconf-native automake- 
> native libtool-native gnu-config-native file-native fakeroot-native  
> quilt-native gettext-native flex-native bison-native
> NOTE: Selecting already-staged gettext-native (0.14.1-r4) to satisfy  
> gettext-native
> NOTE: current path: glibc-intermediate (glibc-intermediate) -> gcc- 
> cross-initial (virtual/i686-linux-gcc-initial) -> binutils-cross  
> (virtual/i686-linux-binutils) -> gettext-native (gettext-native)
> NOTE: dependencies for gettext-native are: autoconf-native automake- 
> native libtool-native gnu-config-native quilt-native
> NOTE: Selecting already-staged flex-native (2.5.31-r2) to satisfy  
> flex-native
> NOTE: current path: glibc-intermediate (glibc-intermediate) -> gcc- 
> cross-initial (virtual/i686-linux-gcc-initial) -> binutils-cross  
> (virtual/i686-linux-binutils) -> flex-native (flex-native)
> NOTE: dependencies for flex-native are: autoconf-native automake- 
> native libtool-native gnu-config-native quilt-native
> NOTE: Selecting already-staged bison-native (2.0-r2) to satisfy bison-
> native
> NOTE: current path: glibc-intermediate (glibc-intermediate) -> gcc- 
> cross-initial (virtual/i686-linux-gcc-initial) -> binutils-cross  
> (virtual/i686-linux-binutils) -> bison-native (bison-native)
> NOTE: dependencies for bison-native are: autoconf-native automake- 
> native libtool-native gnu-config-native quilt-native
> NOTE: Selecting already-staged glibc-initial (2.5-r4) to satisfy  
> virtual/i686-linux-libc-initial
> NOTE: current path: glibc-intermediate (glibc-intermediate) -> gcc- 
> cross-initial (virtual/i686-linux-gcc-initial) -> glibc-initial  
> (virtual/i686-linux-libc-initial)
> NOTE: dependencies for glibc-initial are: autoconf-native automake- 
> native libtool-native gnu-config-native file-native fakeroot-native  
> quilt-native linux-libc-headers
> NOTE: Selecting already-staged linux-libc-headers (2.6.18-r1) to  
> satisfy linux-libc-headers
> NOTE: current path: glibc-intermediate (glibc-intermediate) -> gcc- 
> cross-initial (virtual/i686-linux-gcc-initial) -> glibc-initial  
> (virtual/i686-linux-libc-initial) -> linux-libc-headers (linux-libc- 
> headers)
> NOTE: dependencies for linux-libc-headers are: ipkg-utils-native file-
> native fakeroot-native quilt-native unifdef-native
> NOTE: Selecting already-staged ipkg-utils-native (1.6+cvs20050404-r8)
> to satisfy ipkg-utils-native
> NOTE: current path: glibc-intermediate (glibc-intermediate) -> gcc- 
> cross-initial (virtual/i686-linux-gcc-initial) -> glibc-initial  
> (virtual/i686-linux-libc-initial) -> linux-libc-headers (linux-libc- 
headers) ->> ipkg-utils-native (ipkg-utils-native)
> NOTE: dependencies for ipkg-utils-native are: quilt-native
> NOTE: Selecting already-staged unifdef-native (2.6.18+git-r0) to  
> satisfy unifdef-native
> NOTE: current path: glibc-intermediate (glibc-intermediate) -> gcc- 
> cross-initial (virtual/i686-linux-gcc-initial) -> glibc-initial  
> (virtual/i686-linux-libc-initial) -> linux-libc-headers (linux-libc- 
headers) ->> unifdef-native (unifdef-native)
> NOTE: dependencies for unifdef-native are: quilt-native
> NOTE: package glibc-intermediate-2.5: started
> NOTE: package glibc-intermediate-2.5-r4: task do_configure: started
> ERROR: function do_configure failed
> ERROR: log data follows (/home/jim/OpenEmbedded/build/tmp/work/i686- 
> linux/glibc-intermediate-2.5-r4/temp/log.do_configure.391)
> | NOTE: Running /home/jim/OpenEmbedded/build/tmp/work/i686-linux/ 
> glibc-intermediate-2.5-r4/glibc-2.5/configure      --build=i686- 
> linux               --host=i686-linux               --target=i686- 
> linux                     --prefix=/usr                    -- 
> exec_prefix=/usr              --bindir=/usr/bin               -- 
> sbindir=/usr/sbin     --libexecdir=/usr/libexec                -- 
> datadir=/usr/share                    --sysconfdir=/etc            
> --sharedstatedir=/usr/com                --localstatedir=/ 
> var                    --libdir=/usr/lib               --includedir=/ 
> usr/include                --oldincludedir=/usr/ 
> include                    --infodir=/usr/share/info                --
> mandir=/usr/share/man                     --enable- 
> kernel=2.6.17          --without-cvs --disable-profile --disable- 
> debug --without-gd             --enable-clocale=gnu            -- 
> enable-add-ons=nptl,ports              --with-headers=/home/jim/ 
> OpenEmbedded/build/tmp/staging/i686-linux/include              -- 
> without-selinux                                    ...
> | configure: loading site script /home/jim/OpenEmbedded/ 
> org.openembedded.dev/site/endian-little
> | configure: loading site script /home/jim/OpenEmbedded/ 
> org.openembedded.dev/site/common-glibc
> | configure: loading site script /home/jim/OpenEmbedded/ 
> org.openembedded.dev/site/ix86-common
> | configure: loading site script /home/jim/OpenEmbedded/ 
> org.openembedded.dev/site/common
> | configure: loading site script /home/jim/OpenEmbedded/ 
> org.openembedded.dev/site/common
> | checking build system type... i686-pc-linux-gnu
> | checking host system type... i686-pc-linux-gnu
> | configure: running configure fragment for add-on nptl
> | checking add-on ports for preconfigure fragments... am33 arm hppa  
> m68k mips
> | checking sysdep dirs... sysdeps/i386/elf nptl/sysdeps/unix/sysv/ 
> linux/i386/i686 nptl/sysdeps/unix/sysv/linux/i386 sysdeps/unix/sysv/ 
> linux/i386 nptl/sysdeps/unix/sysv/linux nptl/sysdeps/pthread sysdeps/ 
> pthread ports/sysdeps/unix/sysv/linux sysdeps/unix/sysv/linux sysdeps/
> gnu sysdeps/unix/common sysdeps/unix/mman sysdeps/unix/inet ports/ 
> sysdeps/unix/sysv/i386 sysdeps/unix/sysv/i386 nptl/sysdeps/unix/sysv  
> ports/sysdeps/unix/sysv sysdeps/unix/sysv sysdeps/unix/i386 nptl/ 
> sysdeps/unix ports/sysdeps/unix sysdeps/unix sysdeps/posix sysdeps/ 
> i386/i686/fpu nptl/sysdeps/i386/i686 sysdeps/i386/i686 sysdeps/i386/ 
> i486 nptl/sysdeps/i386/i486 sysdeps/i386/fpu nptl/sysdeps/i386  
> sysdeps/i386 sysdeps/wordsize-32 sysdeps/ieee754/ldbl-96 sysdeps/ 
> ieee754/dbl-64 sysdeps/ieee754/flt-32 sysdeps/ieee754 sysdeps/generic/
> elf sysdeps/generic
> | checking for a BSD-compatible install... /usr/bin/install -c
> | checking whether ln -s works... yes
> | checking for i686-linux-gcc... ccache i686-linux-gcc
> | checking for suffix of object files... o
> | checking whether we are using the GNU C compiler... yes
> | checking whether ccache i686-linux-gcc accepts -g... yes
> | checking for ccache i686-linux-gcc option to accept ANSI C... none  
> needed
> | checking how to run the C preprocessor... i686-linux-gcc -E
> | checking for i686-linux-g++... ccache i686-linux-g++
> | checking whether we are using the GNU C++ compiler... no
> | checking whether ccache i686-linux-g++ accepts -g... no
> | checking whether /home/jim/OpenEmbedded/build/tmp/cross/lib/gcc/ 
> i686-linux/4.1.1/../../../../i686-linux/bin/as is GNU as... yes
> | checking whether /home/jim/OpenEmbedded/build/tmp/cross/lib/gcc/ 
> i686-linux/4.1.1/../../../../i686-linux/bin/ld is GNU ld... yes
> | checking for /home/jim/OpenEmbedded/build/tmp/cross/lib/gcc/i686- 
> linux/4.1.1/../../../../i686-linux/bin/as... /home/jim/OpenEmbedded/ 
> build/tmp/cross/lib/gcc/i686-linux/4.1.1/../../../../i686-linux/bin/as
> | checking version of /home/jim/OpenEmbedded/build/tmp/cross/lib/gcc/ 
> i686-linux/4.1.1/../../../../i686-linux/bin/as... 2.17.50.0.5, ok
> | checking for /home/jim/OpenEmbedded/build/tmp/cross/lib/gcc/i686- 
> linux/4.1.1/../../../../i686-linux/bin/ld... /home/jim/OpenEmbedded/ 
> build/tmp/cross/lib/gcc/i686-linux/4.1.1/../../../../i686-linux/bin/ld
> | checking version of /home/jim/OpenEmbedded/build/tmp/cross/lib/gcc/ 
> i686-linux/4.1.1/../../../../i686-linux/bin/ld... 2.17.50.0.5, ok
> | checking for pwd... /bin/pwd
> | checking for i686-linux-gcc... (cached) ccache i686-linux-gcc
> | checking version of ccache i686-linux-gcc... 4.1.1, ok
> | checking for gnumake... make
> | checking version of make... 3.81, ok
> | checking for gnumsgfmt... no
> | checking for gmsgfmt... no
> | checking for msgfmt... msgfmt
> | checking version of msgfmt... 0.14.1, ok
> | checking for makeinfo... makeinfo
> | checking version of makeinfo... 4.8, ok
> | checking for sed... sed
> | checking version of sed... 4.1.5, ok
> | checking for autoconf... autoconf
> | checking whether autoconf works... yes
> | checking whether ranlib is necessary... no
> | checking LD_LIBRARY_PATH variable... ok
> | checking whether GCC supports -static-libgcc... -static-libgcc
> | checking for bash... /bin/bash
> | checking for gawk... gawk
> | checking for perl... /usr/bin/perl
> | checking for install-info... /usr/sbin/install-info
> | checking for bison...
> /home/jim/OpenEmbedded/build/tmp/staging/i686- 
> linux/bin/bison
> | checking for signed size_t type... no
> | checking for libc-friendly stddef.h... yes
> | checking whether we need to use -P to assemble .S files... no
> | checking whether .text pseudo-op must be used... yes
> | checking for assembler global-symbol directive... .globl
> | checking for .set assembler directive... yes
> | checking for assembler .type directive prefix... @
> | checking for .symver assembler directive... yes
> | checking for ld --version-script... yes
> | checking for .previous assembler directive... yes
> | checking for .protected and .hidden assembler directive... yes
> | checking whether __attribute__((visibility())) is supported... yes
> | checking for broken __attribute__((visibility()))... no
> | checking for broken __attribute__((alias()))... no
> | checking whether to put _rtld_local into .sdata section... no
> | checking for i686-linux-readelf... i686-linux-readelf
> | checking for .preinit_array/.init_array/.fini_array support... yes
> | checking for libunwind-support in compiler... no
> | checking for -z nodelete option... yes
> | checking for -z nodlopen option... yes
> | checking for -z initfirst option... yes
> | checking for -z relro option... yes
> | checking for -Bgroup option... yes
> | checking for libgcc_s suffix...
> | checking for --as-needed option... no
> | checking whether --noexecstack is desirable for .S files... yes
> | checking for -z combreloc... yes
> | checking for -z execstack... yes
> | checking for -fpie... no
> | checking for --hash-style option... yes
> | checking for -fno-toplevel-reorder... no
> | checking for -fstack-protector... no
> | checking whether cc puts quotes around section names... no
> | checking for assembler .weak directive... yes
> | checking whether CFI directives are supported... yes
> | checking for ld --no-whole-archive... yes
> | checking for gcc -fexceptions... yes
> | checking for __builtin_expect... yes
> | checking for __builtin_memset... no
> | checking for redirection of built-in functions... yes
> | checking for __thread... yes
> | checking for tls_model attribute... yes
> | checking for libgd... no
> | checking for egrep... grep -E
> | checking for ANSI C header files... no
> | checking for sys/types.h... yes
> | checking for sys/stat.h... yes
> | checking for stdlib.h... yes
> | checking for string.h... yes
> | checking for memory.h... yes
> | checking for strings.h... yes
> | checking for inttypes.h... yes
> | checking for stdint.h... yes
> | checking for unistd.h... yes
> | checking for long double... yes
> | checking size of long double... configure: error: cannot compute  
> sizeof (long double), 77
> | See `config.log' for more details.
> | FATAL: oe_runconf failed
> NOTE: Task failed: /home/jim/OpenEmbedded/build/tmp/work/i686-linux/ 
> glibc-intermediate-2.5-r4/temp/log.do_configure.391
> NOTE: package glibc-intermediate-2.5-r4: task do_configure: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package glibc-intermediate-2.5: failed
> ERROR: Build of glibc-intermediate failed

> _______________________________________________
> Openembedded-issues mailing list
> Openembedded-issues@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-issues


Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



