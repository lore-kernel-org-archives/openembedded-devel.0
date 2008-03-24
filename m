Received: from [212.227.126.179] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>) id 1Jdj3t-00072J-Te
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Mar 2008 10:33:49 +0100
Received: from [10.0.0.200] (Mb5a8.m.pppool.de [89.49.181.168])
	by mrelayeu.kundenserver.de (node=mrelayeu7) with ESMTP (Nemesis)
	id 0ML2xA-1Jdj3q3cv2-0000Qs; Mon, 24 Mar 2008 10:33:47 +0100
Message-ID: <47E7757A.6080807@linuxdevelopment.de>
Date: Mon, 24 Mar 2008 10:33:46 +0100
From: =?ISO-8859-15?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.12 (X11/20080226)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.6
X-Provags-ID: V01U2FsdGVkX18e6b1BYxU5jvScYeUFapJoVqcXh7tcbymDqrD
	ZoP9SLGRlBvZ+ybD8MRRJBnkIInFtRJVNseB69qirBp0QezmGw
	MZEt1+DKp9YxZSpmG36NHQdl3gbEhZb5XPFcL/d3uY=
Subject: AVR32 - stops at gcc-cross-4.2.1 configure GCC_NO_EXECUTABLES
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
X-List-Received-Date: Mon, 24 Mar 2008 09:33:50 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Dear All

I am still fighting to get a clean build for the avr32
The build i try is on a x86_64 host (if that makes a differecen)

First i have to "fake" external-toolchin do_populate_staging with 
touching the stamp.

Then it goes on and it stops at gcc-cross-4.2.1 with this configure error.

Please advice !!!

NOTE: Resolving missing task queue dependencies
NOTE: multiple providers are available for 
virtual/avr32-angstrom-linux-uclibc-libc-for-gcc (external-toolchain, 
uclibc);
NOTE: consider defining 
PREFERRED_PROVIDER_virtual/avr32-angstrom-linux-uclibc-libc-for-gcc
NOTE: Preparing runqueue



  checking for library containing strerror... configure: error: Link 
tests are not allowed after GCC_NO_EXECUTABLES.
| checking for enabled wchar_t specializations... yes
| checking for ISO C99 support in <math.h>... yes
| make[1]: *** [configure-target-libiberty] Error 1
| make[1]: *** Waiting for unfinished jobs....
| checking complex.h usability... yes
| checking complex.h presence... yes
| checking for complex.h... yes
| checking for ISO C99 support in <complex.h>... no
| checking for ISO C99 support in <stdio.h>... yes
| checking for ISO C99 support in <stdlib.h>... yes
| checking for ISO C99 support in <wchar.h>... yes
| checking for fully enabled ISO C99 support... no
| configure: Debug build flags set to -g3 -O0
| checking for additional debug build... no
| checking for extra compiler flags for building...
| checking for thread model used by GCC... posix
| checking for atomic builtins... yes
| checking for g++ that supports -ffunction-sections -fdata-sections... yes
| checking nan.h usability... no
| checking nan.h presence... no
| checking for nan.h... no
| checking ieeefp.h usability... no
| checking ieeefp.h presence... no
| checking for ieeefp.h... no
| checking endian.h usability... yes
| checking endian.h presence... yes
| checking for endian.h... yes
| checking sys/isa_defs.h usability... no
| checking sys/isa_defs.h presence... no
| checking for sys/isa_defs.h... no
| checking machine/endian.h usability... no
| checking machine/endian.h presence... no
| checking for machine/endian.h... no
| checking machine/param.h usability... no
| checking machine/param.h presence... no
| checking for machine/param.h... no
| checking sys/machine.h usability... no
| checking sys/machine.h presence... no
| checking for sys/machine.h... no
| checking for sys/types.h... (cached) yes
| checking fp.h usability... no
| checking fp.h presence... no
| checking for fp.h... no
| checking float.h usability... yes
| checking float.h presence... yes
| checking for float.h... yes
| checking for endian.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking locale.h usability... yes
| checking locale.h presence... yes
| checking for locale.h... yes
| checking for float.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for g++ that supports -ffunction-sections -fdata-sections... yes
| checking for ld version... 21700
| checking for ld that supports -Wl,--gc-sections... configure: error: 
Link tests are not allowed after GCC_NO_EXECUTABLES.
| make[1]: *** [configure-target-libstdc++-v3] Error 1
| make[1]: Leaving directory 
`/srv/home/bob/oe/avr32/tmp/work/avr32-angstrom-linux-uclibc/gcc-cross-4.2.1-r12/gcc-4.2.1/build.x86_64-linux.avr32-angstrom-linux-uclibc'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: 
/srv/home/bob/oe/avr32/tmp/work/avr32-angstrom-linux-uclibc/gcc-cross-4.2.1-r12/temp/log.do_compile.14611
NOTE: package gcc-cross-4.2.1-r12: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gcc-cross-4.2.1: failed
ERROR: Build of 
/srv/home/bob/oe/org.openembedded.dev/packages/gcc/gcc-cross_4.2.1.bb 
do_compile failed



