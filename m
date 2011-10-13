Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1REQZI-0007zy-Im
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 21:03:49 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 075BC9AA2BC; Thu, 13 Oct 2011 12:58:05 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 7AA009AA2B7;
	Thu, 13 Oct 2011 12:58:01 -0600 (MDT)
Message-ID: <4E9734B7.2030207@mlbassoc.com>
Date: Thu, 13 Oct 2011 12:57:59 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E96E9FE.1060005@mlbassoc.com>
	<6E64F0B8-773E-4558-B470-37BA010F419D@ti.com>
	<4E96F59A.6030206@mlbassoc.com>
	<CAMKF1sroXD8KQE4HPXgUcvC8X35TDrzzf=SVmVLAvM073WD9vA@mail.gmail.com>
In-Reply-To: <CAMKF1sroXD8KQE4HPXgUcvC8X35TDrzzf=SVmVLAvM073WD9vA@mail.gmail.com>
Subject: Re: Can't build libcgroup
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
X-List-Received-Date: Thu, 13 Oct 2011 19:03:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-10-13 12:48, Khem Raj wrote:
> On Thu, Oct 13, 2011 at 7:28 AM, Gary Thomas<gary@mlbassoc.com>  wrote:
>> On 2011-10-13 08:16, Kridner, Jason wrote:
>>>
>>> On Oct 13, 2011, at 8:39 AM, "Gary Thomas"<gary@mlbassoc.com>    wrote:
>>>
>>>> Trying to follow the Angstrom instructions directly.
>>>>
>>>> OE Build Configuration:
>>>> BB_VERSION        = "1.13.3"
>>>> TARGET_ARCH       = "arm"
>>>> TARGET_OS         = "linux-gnueabi"
>>>> MACHINE           = "beagleboard"
>>>> DISTRO            = "angstrom"
>>>> DISTRO_VERSION    = "v2011.10-core"
>>>> TUNE_FEATURES     = "armv7a vfp neon cortexa8"
>>>> TARGET_FPU        = "vfp-neon"
>>>> meta-angstrom     = "master:66263650f8548d6b0b5f593ab728f536d5e05a9f"
>>>> meta-oe
>>>> meta-efl
>>>> meta-gpe
>>>> meta-gnome
>>>> meta-xfce         = "master:1e5d73ec4f44200104de085838f04e31a49435da"
>>>> meta-ti           = "master:3530f1025efc3792334b897a4e70c6d5822ef56d"
>>>> meta              = "master:5ad1ca59dea6d5045f252ed7b786ad193faced64"
>>>>
>>>> Fails with this error:
>>>> | ccache arm-angstrom-linux-gnueabi-gcc  -march=armv7-a
>>>> -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon
>>>> -mtune=cortex-a8 -mthumb-interwork -mno-thumb
>>>> --sysroot=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard
>>>> -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g
>>>> -feliminate-unused-debug-types -Wall -c walk_test.c
>>>> | libcg_ba.cpp:18:18: fatal error: string: No such file or directory
>
> Does this happen with lastest angstrom on oe-core ? or classic oe.dev
> I am unable to reproduce it on my end

Latest angstrom with layers as above.

>
>>>> | compilation terminated.
>>>> | make[2]: *** [libcg_ba.o] Error 1
>>>> | make[2]: *** Waiting for unfinished jobs....
>>>> | make[2]: Leaving directory
>>>> `/home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/tests'
>>>>
>>>> Full compile log at http://www.mlbassoc.com/oe/libcgroup-log.do_compile
>>>
>>> I have the same issue on a 64-bit Ubuntu machine.
>>
>> Mine is 32 bit Fedora 13.
>>
>> The problem seems to be that G++ 4.5.4 is misconfigured.  Running it by
>> hand:
>>
>> [gthomas@titan tests]$
>> PATH=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi:$PATH
>> arm-angstrom-linux-gnueabi-g++ -march=armv7-a -fno-tree-vectorize
>>   -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8
>> -mthumb-interwork -mno-thumb
>> --sysroot=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard
>> -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g
>> -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden
>> -fvisibility-inlines-hidden -c -o libcg_ba.o libcg_ba.cpp -v
>> Using built-in specs.
>> COLLECT_GCC=arm-angstrom-linux-gnueabi-g++
>> COLLECT_LTO_WRAPPER=/home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/lto-wrapper
>> Target: arm-angstrom-linux-gnueabi
>> Configured with:
>> /local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work-shared/gcc-4.5-r43+svnr178923/gcc-4_5-branch/configure
>> --build=i686-linux --host=i686-linux --target=arm-angstrom-linux-gnueabi
>> --prefix=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr
>> --exec_prefix=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr
>> --bindir=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi
>> --sbindir=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi
>> --libexecdir=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/libexec/armv7a-angstrom-linux-gnueabi
>> --datadir=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/share
>> --sysconfdir=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/etc
>> --sharedstatedir=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/com
>> --localstatedir=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/var
>> --libdir=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/lib/armv7a-angstrom-linux-gnueabi
>> --includedir=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/include
>> --oldincludedir=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/include
>> --infodir=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/share/info
>> --mandir=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/share/man
>> --disable-silent-rules --disable-dependency-tracking
>> --with-libtool-sysroot=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux
>> --with-gnu-ld --enable-shared --enable-languages=c,c++
>> --enable-threads=posix --disable-multilib --enable-c99 --enable-long-long
>> --enable-symvers=gnu --enable-libstdcxx-pch
>> --program-prefix=arm-angstrom-linux-gnueabi- --enable-target-optspace
>> --enable-lto --enable-libssp --disable-bootstrap --disable-libgomp
>> --disable-libmudflap --enable-cheaders=c_global
>> --with-local-prefix=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr
>> --with-gxx-include-dir=/usr/include/c++
>> --with-sysroot=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard
>> --with-build-sysroot=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard
>> --enable-poison-system-directories
>> --with-headers=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include
>> --disable-nls --disable-libunwind-exceptions
>> --with-mpfr=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr
>> --with-system-zlib --enable-nls --enable-__cxa_atexit
>> Thread model: posix
>> gcc version 4.5.4 20110917 (prerelease) (GCC)
>> COLLECT_GCC_OPTIONS='-march=armv7-a' '-fno-tree-vectorize'
>> '-mfloat-abi=softfp' '-mfpu=neon' '-mtune=cortex-a8' '-mthumb-interwork'
>> '-mno-thumb' '-DHAVE_CONFIG_H' '-I.' '-I..' '-I../include' '-O2' '-pipe'
>> '-g' '-feliminate-unused-debug-types' '-fpermissive'
>> '-fvisibility-inlines-hidden' '-c' '-o' 'libcg_ba.o' '-v' '-shared-libgcc'
>>
>> /home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/cc1plus
>> -quiet -v -I. -I.. -I../include -iprefix
>> /home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/
>> -isysroot
>> /local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard
>> -D_GNU_SOURCE -DHAVE_CONFIG_H libcg_ba.cpp -quiet -dumpbase libcg_ba.cpp
>> -march=armv7-a -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8
>> -mthumb-interwork -mno-thumb -auxbase-strip libcg_ba.o -g -O2 -version
>> -fno-tree-vectorize -feliminate-unused-debug-types -fpermissive
>> -fvisibility-inlines-hidden -o - |
>>
>> /home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/as
>> -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -meabi=5 -o
>> libcg_ba.o
>> GNU C++ (GCC) version 4.5.4 20110917 (prerelease)
>> (arm-angstrom-linux-gnueabi)
>>         compiled by GNU C version 4.4.5 20101112 (Red Hat 4.4.5-2), GMP
>> version 5.0.2, MPFR version 3.0.1, MPC version 0.8.2
>> GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
>> ignoring nonexistent directory
>> "/home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/../../../../../arm-angstrom-linux-gnueabi/include"
>> ignoring nonexistent directory "/usr/include/c++/arm-angstrom-linux-gnueabi"
>> ignoring nonexistent directory "/usr/include/c++/backward"
>> ignoring nonexistent directory
>> "/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include"
>> ignoring duplicate directory
>> "/home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux-gnueabi/gcc/../../../lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/include"
>> ignoring duplicate directory
>> "/home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux-gnueabi/gcc/../../../lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/include-fixed"
>> ignoring nonexistent directory
>> "/home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux-gnueabi/gcc/../../../lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/../../../../../arm-angstrom-linux-gnueabi/include"
>> #include "..." search starts here:
>> #include<...>  search starts here:
>>   .
>>   ..
>>   ../include
>>
>> /home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/include
>>
>> /home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/include-fixed
>>   /usr/include/c++
>>   /local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include
>> End of search list.
>> GNU C++ (GCC) version 4.5.4 20110917 (prerelease)
>> (arm-angstrom-linux-gnueabi)
>>         compiled by GNU C version 4.4.5 20101112 (Red Hat 4.4.5-2), GMP
>> version 5.0.2, MPFR version 3.0.1, MPC version 0.8.2
>> GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
>> Compiler executable checksum: ff763b34759d1193f83d28b503f742f0
>> libcg_ba.cpp:18:18: fatal error: string: No such file or directory
>>
>> --
>> ------------------------------------------------------------
>> Gary Thomas                 |  Consulting for the
>> MLB Associates              |    Embedded world
>> ------------------------------------------------------------
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


