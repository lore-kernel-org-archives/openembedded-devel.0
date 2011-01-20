Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1Pfz0i-0006tN-HJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 19:13:28 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApsEAHMKOE1bdWOb/2dsb2JhbAClRb9ngwCCUASKKoYl
X-IronPort-AV: E=Sophos;i="4.60,352,1291590000"; d="scan'208";a="799267226"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 20 Jan 2011 19:12:34 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1Pfyzq-0003NU-GU
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 19:12:34 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1Pfyzq-0007Qx-CQ
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 19:12:34 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1Pfyzp-0000Ia-T9
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 19:12:33 +0100
Date: Thu, 20 Jan 2011 19:12:33 +0100
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110120181233.GA1789@lit.local.igalia.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: problems compiling glibc_2.9-r37.4 under Angstrom
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
X-List-Received-Date: Thu, 20 Jan 2011 18:13:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


In order to build native-sdk-image recipe, I found my self compiling
glibc_2.9-r37.4, because it is the real provider of virtual-libc-dev (the
toolchain does not truly provide it -but that is another bug [1]-).

But the glibc_2.9-r37.4 configuration fails using the canonical
arm-angstrom-linux-gnueabi- toolchain (using the csl external toolchain fails
too, but for other reasons):

Log data follows:
| configure.in:2204: warning: AC_CACHE_VAL(pic_default, ...): suspicious cache-id, must contain _cv_ to be cached
| ../../lib/autoconf/general.m4:1999: AC_CACHE_VAL is expanded from...
| ../../lib/autoconf/general.m4:2020: AC_CACHE_CHECK is expanded from...
| configure.in:2204: the top level
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... arm-angstrom-linux-gnueabi
| checking add-on ports for preconfigure fragments... am33 arm hppa m68k mips
| configure: running configure fragment for add-on nptl
| configure: running configure fragment for add-on libidn
| checking sysdep dirs... ports/sysdeps/arm/elf ports/sysdeps/unix/sysv/linux/arm/eabi/nptl ports/sysdeps/unix/sysv/linux/arm/eabi sysdeps/unix/sysv/linux/arm/eabi ports/sysdeps/unix/sysv/linux/arm/nptl ports/sysdeps/unix/sysv/linux/arm sysdeps/unix/sysv/linux/arm ports/sysdeps/unix/sysv/linux nptl/sysdeps/unix/sysv/linux nptl/sysdeps/pthread sysdeps/pthread sysdeps/unix/sysv/linux sysdeps/gnu sysdeps/unix/common sysdeps/unix/mman sysdeps/unix/inet ports/sysdeps/unix/sysv nptl/sysdeps/unix/sysv sysdeps/unix/sysv ports/sysdeps/unix/arm ports/sysdeps/unix nptl/sysdeps/unix sysdeps/unix sysdeps/posix ports/sysdeps/arm/eabi ports/sysdeps/arm/fpu ports/sysdeps/arm/nptl ports/sysdeps/arm sysdeps/wordsize-32 sysdeps/ieee754/flt-32 sysdeps/ieee754/dbl-64 sysdeps/ieee754 sysdeps/generic/elf sysdeps/generic
| checking for a BSD-compatible install... /media/DISK/meego/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/bin/install -c
| checking whether ln -s works... yes
| checking for arm-angstrom-linux-gnueabi-gcc... ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb accepts -g... yes
| checking for ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb option to accept ISO C89... unsupported
| checking for gcc... ccache gcc
| checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E
| configure: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E" fails sanity check
| See `config.log' for more details.

Reading the config.log I found:

configure:3734: checking how to run the C preprocessor
configure:3850: result: arm-angstrom-linux-gnueabi-gcc -E
configure:3879: arm-angstrom-linux-gnueabi-gcc -E  conftest.c
In file included from /media/DISK/meego/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed/syslimits.h:7,
                 from /media/DISK/meego/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed/limits.h:11,
                 from conftest.c:10:
/media/DISK/meego/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed/limits.h:122:61: error: limits.h: No such file or directory
configure:3885: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME "GNU C Library"
| #define PACKAGE_TARNAME "c-library"
| #define PACKAGE_VERSION "(see version.h)"
| #define PACKAGE_STRING "GNU C Library (see version.h)"
| #define PACKAGE_BUGREPORT "glibc"
| #define HAVE_LIBIDN 1
| /* end confdefs.h.  */
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
| 		     Syntax error
configure:3879: arm-angstrom-linux-gnueabi-gcc -E  conftest.c
In file included from /media/DISK/meego/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed/syslimits.h:7,
                 from /media/DISK/meego/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed/limits.h:11,
                 from conftest.c:10:
/media/DISK/meego/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed/limits.h:122:61: error: limits.h: No such file or directory
configure:3885: $? = 1

So, the problem is that the pre-processor is _unable_ to find the *correct*
header limits.h. Why? Because it does not exist in the sysroot!!!!

$ find tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/ -name "limits.h"
tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed/limits.h
tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/c++/4.3.3/tr1/limits.h
tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/linux/limits.h

Why? Why the toolchain does not install a sane limits.h in a sane directory?

Thanks.

vmjl

1. http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/028942.html


