Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NDzAX-0002Xk-ML
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 12:39:25 +0100
Received: by pwj11 with SMTP id 11so938239pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 03:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=uu18smMcigFzm4kQA7cx30l+BB4qZzwDGRo52mMSwOc=;
	b=Pw6Hos9ft4psTOhscEKLXXIDbr/3o/DUxDhThQe+ZbUbNslylMGWJLgkinWCA3tzO5
	vPk7DeX5tcgJnLoTkoQTwkPNqSEO7WZ0CdmKSdLW/2ydzSsjMPLWYeVOfymECWdNZnci
	PaS3ccXjA0LcTcRbhpCZtSxmadKJHd3db126k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=pphxE5CAHAiCDnnX4LLhq2C0WUu1pmaHDIjIiFbX2hDkYz4JhPWFQjV7IqdImuCWta
	ueakD0rYynwdB62ecuAA4gGcJozUvct8aHHmpZP1czMH2WzZxXK7RiTzCUOcVXgVILjc
	j8t3o5PFiV8Qu78OPOGpLZ9H/+h3ff9vEz6YA=
MIME-Version: 1.0
Received: by 10.140.174.7 with SMTP id w7mr56473rve.138.1259321869678; Fri, 27 
	Nov 2009 03:37:49 -0800 (PST)
Date: Fri, 27 Nov 2009 17:07:19 +0530
Message-ID: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: cortex-a9 build failure at glibc
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
X-List-Received-Date: Fri, 27 Nov 2009 11:39:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi folks,

a strange internal compiler error pops up when i am compiling glibc. This is
my version -

PREFERRED_VERSION_glibc                 = "2.6.1"
PREFERRED_VERSION_glibc-initial         = "2.6.1"
I see the same error when i change the version to 2.9. This is the error log
-

****************************************************
ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a9
-mfpu=neon -mfloat-abi=softfp ../sysdeps/unix/sysv/linux/mq_unlink.c -c
-std=gnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings
-fexpensive-optimizations -fmerge-all-constants -Wstrict-prototypes
-fomit-frame-pointer    -I../include
-I/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt
-I/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi
-I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl
-I../ports/sysdeps/unix/sysv/linux/arm/eabi
-I../sysdeps/unix/sysv/linux/arm/eabi
-I../ports/sysdeps/unix/sysv/linux/arm/nptl
-I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm
-I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/sysv/linux
-I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix/sysv/linux
-I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman
-I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv
-I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv
-I../ports/sysdeps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix
-I../sysdeps/unix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi
-I../ports/sysdeps/arm/fpu -I../ports/sysdeps/arm/nptl
-I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32
-I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf
-I../sysdeps/generic -I../ports -I../nptl  -I.. -I../libio -I. -nostdinc
-isystem
/home/raghu/opendistro/build/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.2.3/include
-isystem
/home/raghu/opendistro/build/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.2.3/include-fixed
-isystem
/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-D_LIBC_REENTRANT -include ../include/libc-symbols.h   -DNOT_IN_libc=1
-DIS_IN_librt=1    -o
/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt/mq_unlink.o
-MD -MP -MF
/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt/mq_unlink.o.dt
-MT
/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt/mq_unlink.o
../sysdeps/unix/sysv/linux/mq_unlink.c: In function 'mq_unlink':
../sysdeps/unix/sysv/linux/mq_unlink.c:50: error: could not split insn
(insn:TI 80 48 39 ../sysdeps/unix/sysv/linux/mq_unlink.c:43 (parallel [
            (set (reg/v:SI 4 r4 [orig:135 ret ] [135])
                (if_then_else:SI (ne (reg/v:SI 0 r0 [orig:133 ret.53 ]
[133])
                        (const_int -1 [0xffffffffffffffff]))
                    (neg:SI (reg/v:SI 0 r0 [orig:133 ret.53 ] [133]))
                    (const_int 13 [0xd])))
            (clobber (reg:CC 24 cc))
        ]) 311 {*ifcompare_neg_move} (nil)
    (expr_list:REG_DEAD (reg/v:SI 0 r0 [orig:133 ret.53 ] [133])
        (expr_list:REG_UNUSED (reg:CC 24 cc)
            (nil))))
../sysdeps/unix/sysv/linux/mq_unlink.c:50: internal compiler error: in
final_scan_insn, at final.c:2553
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html <http://gcc.gnu.org/bugs.html>> for
instructions.
make[2]: ***
[/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt/mq_unlink.o]
Error 1
******************************************************

glibc-initial seems to have built fine. I couldnt find any hints by
googling.

Anyone seen something similar and could help out with some clues ?

Thanks
--RK

