Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1My0G7-0003JE-Oi
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 11:35:06 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 02EED16E235
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 11:34:11 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id B54FE2A4281
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 11:34:10 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 14 Oct 2009 11:35:50 +0200
Message-ID: <4AD59AF2.50003@dresearch.de>
Date: Wed, 14 Oct 2009 11:33:38 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 14 Oct 2009 09:35:50.0734 (UTC)
	FILETIME=[B7A35EE0:01CA4CB1]
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: glibc_2.9 compile failed for armv5te
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
X-List-Received-Date: Wed, 14 Oct 2009 09:35:07 -0000
Content-Type: multipart/mixed; boundary="------------010604090506030603080804"

--------------010604090506030603080804
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Since a few days a clean build of glibc_2.9 failed for hipox machine
(armv5te) with this error (details see attached logfile):

| ../ports/sysdeps/arm/eabi/setjmp.S: Assembler messages:
| ../ports/sysdeps/arm/eabi/setjmp.S:45: Error: internal_relocation
(type: OFFSET_IMM) not fixed up

Sorry, but i've no idea what the problem is and which commit is
responsible for it. Any ideas?

Steffen
/opt/bitbake/lib/bb/COW.py:29: DeprecationWarning: the sets module is deprecated
  import types, sets
/opt/bitbake/lib/bb/COW.py:29: DeprecationWarning: the sets module is deprecated
  import types, sets
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it to increase performance.
NOTE: Out of date cache found, rebuilding...
Parsing .bb files, please wait...NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
done.
NOTE: Parsing finished. 0 cached, 7055 parsed, 295 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 275 of 409 (ID: 7, /home/DRESEARCH/sledz/work/openembedded/recipes/glibc/glibc_2.9.bb, do_compile)
ERROR: function do_compile failed
ERROR: log data follows (/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/temp/log.do_compile.23796)
| NOTE: make -j rootsbindir=/sbin
| make -r PARALLELMFLAGS="" CVSOPTS="" -C /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9 objdir=`pwd` all
| make[1]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9'
| make  subdir=csu -C csu ..=../ subdir_lib
| make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/csu'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/csu'
| make  subdir=iconv -C iconv ..=../ subdir_lib
| make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/iconv'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/iconv'
| make  subdir=locale -C locale ..=../ subdir_lib
| make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/locale'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/locale'
| make  subdir=localedata -C localedata ..=../ subdir_lib
| make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/localedata'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/localedata'
| make  subdir=iconvdata -C iconvdata ..=../ subdir_lib
| make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/iconvdata'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/iconvdata'
| make  subdir=assert -C assert ..=../ subdir_lib
| make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/assert'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/assert'
| make  subdir=ctype -C ctype ..=../ subdir_lib
| make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/ctype'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/ctype'
| make  subdir=intl -C intl ..=../ subdir_lib
| make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/intl'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/intl'
| make  subdir=catgets -C catgets ..=../ subdir_lib
| make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/catgets'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/catgets'
| make  subdir=math -C math ..=../ subdir_lib
| make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/math'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/math'
| make  subdir=setjmp -C setjmp ..=../ subdir_lib
| make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/setjmp'
| make[2]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/setjmp'
| make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/setjmp'
| arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/setjmp.S -c  -I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I../ports -I../nptl  -I.. -I../libio -I. -nostdinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h  -DPIC -DSHARED     -DASSEMBLER   -Wa,--noexecstack  -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp/setjmp.os -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp/setjmp.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp/setjmp.os
| arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/__longjmp.S -c  -I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I../ports -I../nptl  -I.. -I../libio -I. -nostdinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h  -DPIC -DSHARED     -DASSEMBLER   -Wa,--noexecstack  -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp/__longjmp.os -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp/__longjmp.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp/__longjmp.os
| arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb ../nptl/sysdeps/unix/sysv/linux/jmp-unwind.c -c -std=gnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants -Wstrict-prototypes  -fomit-frame-pointer -fPIC    -I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I../ports -I../nptl  -I.. -I../libio -I. -nostdinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h  -DPIC -DSHARED     -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp/jmp-unwind.os -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp/jmp-unwind.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp/jmp-unwind.os
| ../ports/sysdeps/arm/eabi/__longjmp.S: Assembler messages:
| ../ports/sysdeps/arm/eabi/__longjmp.S:47: Error: internal_relocation (type: OFFSET_IMM) not fixed up
| make[2]: *** [/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp/__longjmp.os] Error 1
| make[2]: *** Waiting for unfinished jobs....
| ../ports/sysdeps/arm/eabi/setjmp.S: Assembler messages:
| ../ports/sysdeps/arm/eabi/setjmp.S:45: Error: internal_relocation (type: OFFSET_IMM) not fixed up
| make[2]: *** [/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/setjmp/setjmp.os] Error 1
| make[2]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/setjmp'
| make[1]: *** [setjmp/subdir_lib] Error 2
| make[1]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/temp/log.do_compile.23796
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/DRESEARCH/sledz/work/openembedded/recipes/glibc/glibc_2.9.bb do_compile failed
ERROR: Task 7 (/home/DRESEARCH/sledz/work/openembedded/recipes/glibc/glibc_2.9.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 399 tasks of which 399 didn't need to be rerun and 1 failed.
ERROR: '/home/DRESEARCH/sledz/work/openembedded/recipes/glibc/glibc_2.9.bb' failed

--------------010604090506030603080804--
