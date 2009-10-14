Received: from [209.85.219.210] (helo=mail-ew0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1My7Bz-0008O6-1Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 18:59:18 +0200
Received: by ewy6 with SMTP id 6so2843440ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 09:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NbInmW4WM/3RzielLj87O+VgsWHHjtvBMqGjZDcaOaA=;
	b=AguKg0IWJMRBD6rYSiHqlkSXpaZucQV3FP6pNwjq5El9yeR5JbHkYH54uNP72fjyLB
	89e0Rv2+LVUGrzgxRT+rHH9kSNQlowIev2WAsRgcwH5xD9P4Kwsz2gJjx6UFALU+NVtS
	NmmxUrcxd66P0IRLwjY52MqWOBfuARGpUJp4s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LzW67aomQR2b/o/2CBJz3kjjG1ll2rNuNqjC8BZGPmh8e4/uDlT68vvdbqH2ZGB+7W
	xoof6kHHnrgBHInXx9C2n7d4wA1/XDlh3WLiN9ZZtvGnC23TssIyPXLRiojsjpnVULJ1
	EP6Wwhj2ir/EQx1ba8AspkpRcX34rd+OQ1UTk=
MIME-Version: 1.0
Received: by 10.211.146.10 with SMTP id y10mr1915700ebn.32.1255539499527; Wed, 
	14 Oct 2009 09:58:19 -0700 (PDT)
In-Reply-To: <4AD5C4B3.1050505@dresearch.de>
References: <4AD59AF2.50003@dresearch.de>
	<1255516331.9214.327.camel@lenovo.internal.reciva.com>
	<4AD5C4B3.1050505@dresearch.de>
Date: Wed, 14 Oct 2009 09:58:19 -0700
Message-ID: <19c1b8a90910140958v561e4d04pd48cf3260145b916@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.210
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: glibc_2.9 compile failed for armv5te
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
X-List-Received-Date: Wed, 14 Oct 2009 16:59:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2009 at 5:31 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Phil Blundell schrieb:
>> On Wed, 2009-10-14 at 11:33 +0200, Steffen Sledz wrote:
>>> Since a few days a clean build of glibc_2.9 failed for hipox machine
>>> (armv5te) with this error (details see attached logfile):
>>>
>>> | ../ports/sysdeps/arm/eabi/setjmp.S: Assembler messages:
>>> | ../ports/sysdeps/arm/eabi/setjmp.S:45: Error: internal_relocation
>>> (type: OFFSET_IMM) not fixed up


usually such error means that a undefined define is being used in assembly
like in this case LDR a3, [a3, #RTLD_GLOBAL_RO_DL_HWCAP_OFFSET]

you should trace why RTLD_GLOBAL_RO_DL_HWCAP_OFFSET is not being defined
correctly

>>>
>>> Sorry, but i've no idea what the problem is and which commit is
>>> responsible for it. Any ideas?
>>
>> What does the offending line of code look like?
>
> I've made an update to the current HEAD of the dev-branch. Now the
> same error occurs at the different place:
>
> | ../ports/sysdeps/unix/sysv/linux/arm/nptl/../vfork.S: Assembler
> messages:
> | ../ports/sysdeps/unix/sysv/linux/arm/nptl/../vfork.S:34: Error:
> internal_relocation (type: OFFSET_IMM) not fixed up
> | ../ports/sysdeps/unix/sysv/linux/arm/nptl/../vfork.S:34: Error:
> internal_relocation (type: OFFSET_IMM) not fixed up
> | ../ports/sysdeps/unix/sysv/linux/arm/nptl/../vfork.S:38: Error:
> internal_relocation (type: OFFSET_IMM) not fixed up
>
> Attached are the log.do_compile and the mentioned vfork.S file.
>
> Steffen
>
> /* Copyright (C) 1999, 2002, 2003, 2005 Free Software Foundation, Inc.
> =C2=A0 This file is part of the GNU C Library.
> =C2=A0 Contributed by Philip Blundell <philb@gnu.org>.
>
> =C2=A0 The GNU C Library is free software; you can redistribute it and/or
> =C2=A0 modify it under the terms of the GNU Lesser General Public
> =C2=A0 License as published by the Free Software Foundation; either
> =C2=A0 version 2.1 of the License, or (at your option) any later version.
>
> =C2=A0 The GNU C Library is distributed in the hope that it will be usefu=
l,
> =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See the=
 GNU
> =C2=A0 Lesser General Public License for more details.
>
> =C2=A0 You should have received a copy of the GNU Lesser General Public
> =C2=A0 License along with the GNU C Library; if not, write to the Free
> =C2=A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> =C2=A0 02111-1307 USA. =C2=A0*/
>
> #include <sysdep.h>
> #define _ERRNO_H =C2=A0 =C2=A0 =C2=A0 =C2=A01
> #include <bits/errno.h>
> #include <kernel-features.h>
>
> /* Clone the calling process, but without copying the whole address space=
.
> =C2=A0 The calling process is suspended until the new process exits or is
> =C2=A0 replaced by a call to `execve'. =C2=A0Return -1 for errors, 0 to t=
he new process,
> =C2=A0 and the process ID of the new process to the old process. =C2=A0*/
>
> ENTRY (__vfork)
>
> #ifdef __NR_vfork
> #ifdef SAVE_PID
> =C2=A0 =C2=A0 =C2=A0 =C2=A0SAVE_PID
> #endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0DO_CALL (vfork, 0)
> #ifdef RESTORE_PID
> =C2=A0 =C2=A0 =C2=A0 =C2=A0RESTORE_PID
> #endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cmn =C2=A0 =C2=A0 a1, #4096
> =C2=A0 =C2=A0 =C2=A0 =C2=A0RETINSTR(cc, lr)
>
> # ifdef __ASSUME_VFORK_SYSCALL
> =C2=A0 =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0 PLTJMP(SYSCALL_ERROR)
> # else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check if vfork syscall is known at all. =C2=
=A0*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cmn =C2=A0 =C2=A0 a1, #ENOSYS
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bne =C2=A0 =C2=A0 PLTJMP(SYSCALL_ERROR)
> # endif
> #endif
>
> #ifndef __ASSUME_VFORK_SYSCALL
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we don't have vfork, fork is close enoug=
h. =C2=A0*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0DO_CALL (fork, 0)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cmn =C2=A0 =C2=A0 a1, #4096
> =C2=A0 =C2=A0 =C2=A0 =C2=A0RETINSTR(cc, lr)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0 PLTJMP(SYSCALL_ERROR)
> #elif !defined __NR_vfork
> # error "__NR_vfork not available and __ASSUME_VFORK_SYSCALL defined"
> #endif
>
> PSEUDO_END (__vfork)
> libc_hidden_def (__vfork)
>
> weak_alias (__vfork, vfork)
>
> NOTE: make -j rootsbindir=3D/sbin
> make -r PARALLELMFLAGS=3D"" CVSOPTS=3D"" -C /home/DRESEARCH/sledz/work/Hy=
draIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.=
9 objdir=3D`pwd` all
> make[1]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/=
work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9'
> make =C2=A0subdir=3Dcsu -C csu ..=3D../ subdir_lib
> make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/=
work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/csu'
> make[2]: Leaving directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/w=
ork/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/csu'
> make[2]: Entering directory `/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/=
work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/glibc-2.9/csu'
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb libc-start.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wa=
ll -Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants=
 -Wstrict-prototypes =C2=A0-fomit-frame-pointer -fexceptions =C2=A0 -I../in=
clude -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-l=
inux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu -I/home/D=
RESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/gl=
ibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -=
I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sys=
v/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/u=
nix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps=
/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/u=
nix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/=
unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix=
/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps=
/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sy=
sdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I..=
/ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm =
-I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/d=
bl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I=
../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem /home/DRESE=
ARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-g=
nueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/c=
ross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isyste=
m /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linu=
x-gnueabi/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h =
=C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH/sledz/work/HydraIP/=
OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angs=
trom-linux-gnueabi/csu/libc-start.o -MD -MP -MF /home/DRESEARCH/sledz/work/=
HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-=
arm-angstrom-linux-gnueabi/csu/libc-start.o.dt -MT /home/DRESEARCH/sledz/wo=
rk/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/bui=
ld-arm-angstrom-linux-gnueabi/csu/libc-start.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/unix/sysv/linux/arm/sysdep.S -c =
=C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5=
te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/=
csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-lin=
ux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysd=
eps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sys=
deps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../po=
rts/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm=
 -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../n=
ptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread =
-I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I..=
/sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I..=
/nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm =
-I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysde=
ps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports=
/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysd=
eps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysde=
ps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isyste=
m /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-ang=
strom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/Hydra=
IP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-=
fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-=
angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../include/li=
bc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -DASSEMBLER =C2=A0-I/home=
/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/=
glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/. =C2=A0-Wa,--noexecst=
ack =C2=A0-o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angst=
rom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/sysd=
ep.o -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-a=
ngstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/=
sysdep.o.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-an=
gstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/s=
ysdep.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb version.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wall =
-Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants -W=
strict-prototypes =C2=A0-fomit-frame-pointer =C2=A0 =C2=A0-I../include -I/h=
ome/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnuea=
bi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu -I/home/DRESEARCH/s=
ledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r3=
5.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I../ports/=
sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv/linux/ar=
m/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/unix/sysv/l=
inux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/unix/sysv=
/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/sysv/l=
inux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix/sysv/=
linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I..=
/sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/unix/sysv=
 -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sysdeps/unix=
 -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/sys=
deps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -I../sysde=
ps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I..=
/sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I../ports -=
I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem /home/DRESEARCH/sledz=
/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3=
.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5=
te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem /home/DR=
ESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux-gnueabi/=
usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h =C2=A0 =C2=
=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/w=
ork/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux=
-gnueabi/csu/version.o -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-=
linux-gnueabi/csu/version.o.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-=
linux-gnueabi/csu/version.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb check_fds.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wal=
l -Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants =
-Wstrict-prototypes =C2=A0-fomit-frame-pointer =C2=A0 =C2=A0-I../include -I=
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnu=
eabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu -I/home/DRESEARCH=
/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-=
r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I../port=
s/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv/linux/=
arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/unix/sysv=
/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/unix/sy=
sv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/sysv=
/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix/sys=
v/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I=
../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/unix/sy=
sv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sysdeps/un=
ix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/s=
ysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -I../sys=
deps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I=
../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I../ports=
 -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem /home/DRESEARCH/sle=
dz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4=
.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/arm=
v5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem /home/=
DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux-gnueab=
i/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h =C2=A0 =
=C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-li=
nux-gnueabi/csu/check_fds.o -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/=
OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angs=
trom-linux-gnueabi/csu/check_fds.o.dt -MT /home/DRESEARCH/sledz/work/HydraI=
P/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-an=
gstrom-linux-gnueabi/csu/check_fds.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/libc-tls.c -c -std=3Dgnu99 -fg=
nu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimizations -f=
merge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer =C2=A0 =
=C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5=
te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/=
csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-lin=
ux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysd=
eps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sys=
deps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../po=
rts/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm=
 -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../n=
ptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread =
-I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I..=
/sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I..=
/nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm =
-I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysde=
ps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports=
/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysd=
eps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysde=
ps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isyste=
m /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-ang=
strom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/Hydra=
IP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-=
fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-=
angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../include/li=
bc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH/sledz/=
work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/b=
uild-arm-angstrom-linux-gnueabi/csu/libc-tls.o -MD -MP -MF /home/DRESEARCH/=
sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r=
35.2/build-arm-angstrom-linux-gnueabi/csu/libc-tls.o.dt -MT /home/DRESEARCH=
/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-=
r35.2/build-arm-angstrom-linux-gnueabi/csu/libc-tls.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb elf-init.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wall=
 -Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants -=
Wstrict-prototypes =C2=A0-fomit-frame-pointer =C2=A0 =C2=A0-I../include -I/=
home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnue=
abi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu -I/home/DRESEARCH/=
sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r=
35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I../ports=
/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv/linux/a=
rm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/unix/sysv/=
linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/unix/sys=
v/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/sysv/=
linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix/sysv=
/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I.=
./sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/unix/sys=
v -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sysdeps/uni=
x -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/sy=
sdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -I../sysd=
eps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I.=
./sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I../ports =
-I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem /home/DRESEARCH/sled=
z/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.=
3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv=
5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem /home/D=
RESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux-gnueabi=
/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h =C2=A0 =
=C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-li=
nux-gnueabi/csu/elf-init.o -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/O=
E/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angst=
rom-linux-gnueabi/csu/elf-init.o.dt -MT /home/DRESEARCH/sledz/work/HydraIP/=
OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angs=
trom-linux-gnueabi/csu/elf-init.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb dso_handle.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wa=
ll -Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants=
 -Wstrict-prototypes =C2=A0-fomit-frame-pointer =C2=A0 =C2=A0-I../include -=
I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gn=
ueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu -I/home/DRESEARC=
H/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9=
-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I../por=
ts/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv/linux=
/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/unix/sys=
v/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/unix/s=
ysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/sys=
v/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix/sy=
sv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -=
I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/unix/s=
ysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sysdeps/u=
nix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/=
sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -I../sy=
sdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -=
I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I../port=
s -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem /home/DRESEARCH/sl=
edz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/=
4.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/ar=
mv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem /home=
/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux-gnuea=
bi/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h =C2=A0 =
=C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-li=
nux-gnueabi/csu/dso_handle.o -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP=
/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-ang=
strom-linux-gnueabi/csu/dso_handle.o.dt -MT /home/DRESEARCH/sledz/work/Hydr=
aIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-=
angstrom-linux-gnueabi/csu/dso_handle.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb errno.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wall -W=
inline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants -Wst=
rict-prototypes =C2=A0-fomit-frame-pointer =C2=A0 =C2=A0-I../include -I/hom=
e/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi=
/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu -I/home/DRESEARCH/sle=
dz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.=
2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I../ports/sy=
sdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv/linux/arm/=
eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/unix/sysv/lin=
ux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/unix/sysv/l=
inux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/sysv/lin=
ux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix/sysv/li=
nux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I../s=
ysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/unix/sysv -=
I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sysdeps/unix -=
I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/sysde=
ps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -I../sysdeps=
/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I../s=
ysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I../ports -I.=
./nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem /home/DRESEARCH/sledz/w=
ork/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3=
/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te=
/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem /home/DRES=
EARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux-gnueabi/us=
r/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h =C2=A0 =C2=
=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/w=
ork/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux=
-gnueabi/csu/errno.o -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-li=
nux-gnueabi/csu/errno.o.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/=
work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linu=
x-gnueabi/csu/errno.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.=
S -c =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/=
armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnu=
eabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstro=
m-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports=
/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../port=
s/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I=
../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linu=
x/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -=
I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pth=
read -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common=
 -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv=
 -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix=
/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../=
sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../=
ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I..=
/sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../=
sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -i=
system /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/ar=
m-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/=
HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/inc=
lude-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/arm=
v5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../inclu=
de/libc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -DASSEMBLER =C2=A0-I=
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnu=
eabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/. =C2=A0-Wa,--noe=
xecstack =C2=A0-o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-=
angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu=
/aeabi_read_tp.o -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/wo=
rk/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-=
gnueabi/csu/aeabi_read_tp.o.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-=
linux-gnueabi/csu/aeabi_read_tp.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb errno-loc.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wal=
l -Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants =
-Wstrict-prototypes =C2=A0-fomit-frame-pointer =C2=A0 =C2=A0-I../include -I=
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnu=
eabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu -I/home/DRESEARCH=
/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-=
r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I../port=
s/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv/linux/=
arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/unix/sysv=
/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/unix/sy=
sv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/sysv=
/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix/sys=
v/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I=
../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/unix/sy=
sv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sysdeps/un=
ix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/s=
ysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -I../sys=
deps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I=
../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I../ports=
 -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem /home/DRESEARCH/sle=
dz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4=
.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/arm=
v5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem /home/=
DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux-gnueab=
i/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h =C2=A0 =
=C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-li=
nux-gnueabi/csu/errno-loc.o -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/=
OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angs=
trom-linux-gnueabi/csu/errno-loc.o.dt -MT /home/DRESEARCH/sledz/work/HydraI=
P/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-an=
gstrom-linux-gnueabi/csu/errno-loc.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_lcsts.c -c -std=3Dg=
nu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimiza=
tions -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer =
=C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/wor=
k/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-g=
nueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angst=
rom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../por=
ts/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../po=
rts/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi =
-I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/li=
nux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux=
 -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/p=
thread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/comm=
on -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sy=
sv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/un=
ix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I.=
./sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I.=
./ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I=
../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I.=
./sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc =
-isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/=
arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/wor=
k/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/i=
nclude-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/a=
rmv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../inc=
lude/libc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH=
/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-=
r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_lcsts.o -MD -MP -MF /home/=
DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/g=
libc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_lcsts.o.dt -MT /h=
ome/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnuea=
bi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_lcsts.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_sighandlers.S -c =
=C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5=
te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/=
csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-lin=
ux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysd=
eps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sys=
deps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../po=
rts/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm=
 -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../n=
ptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread =
-I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I..=
/sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I..=
/nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm =
-I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysde=
ps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports=
/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysd=
eps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysde=
ps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isyste=
m /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-ang=
strom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/Hydra=
IP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-=
fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-=
angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../include/li=
bc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -DASSEMBLER =C2=A0-I/home=
/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/=
glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/. =C2=A0-Wa,--noexecst=
ack =C2=A0-o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angst=
rom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeab=
i_sighandlers.o -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/wor=
k/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-g=
nueabi/csu/aeabi_sighandlers.o.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE=
/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstr=
om-linux-gnueabi/csu/aeabi_sighandlers.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_math.c -c -std=3Dgn=
u99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimizat=
ions -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer =
=C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/wor=
k/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-g=
nueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angst=
rom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../por=
ts/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../po=
rts/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi =
-I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/li=
nux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux=
 -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/p=
thread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/comm=
on -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sy=
sv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/un=
ix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I.=
./sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I.=
./ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I=
../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I.=
./sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc =
-isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/=
arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/wor=
k/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/i=
nclude-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/a=
rmv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../inc=
lude/libc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH=
/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-=
r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_math.o -MD -MP -MF /home/D=
RESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/gl=
ibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_math.o.dt -MT /hom=
e/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi=
/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_math.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_assert.c -c -std=3D=
gnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimiz=
ations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer=
 =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/wo=
rk/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-=
gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angs=
trom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../po=
rts/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../p=
orts/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi=
 -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/l=
inux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linu=
x -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/=
pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/com=
mon -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/s=
ysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/u=
nix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I=
../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I=
../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -=
I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I=
../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc=
 -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc=
/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/wo=
rk/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/=
include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/=
armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../in=
clude/libc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARC=
H/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9=
-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_assert.o -MD -MP -MF /hom=
e/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi=
/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_assert.o.dt -MT=
 /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gn=
ueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_assert.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_localeconv.c -c -st=
d=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-opt=
imizations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-poi=
nter =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-li=
nux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-=
angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I.=
./ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I=
../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/=
eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sy=
sv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/=
linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysd=
eps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix=
/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/un=
ix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysde=
ps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/uni=
x -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/npt=
l -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-=
32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/el=
f -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nost=
dinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib=
/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sled=
z/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.=
3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/stag=
ing/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include .=
./include/libc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRES=
EARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc=
-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_localeconv.o -MD -MP =
-MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux=
-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_localec=
onv.o.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angst=
rom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeab=
i_localeconv.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_errno_addr.c -c -st=
d=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-opt=
imizations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-poi=
nter =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-li=
nux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-=
angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I.=
./ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I=
../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/=
eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sy=
sv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/=
linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysd=
eps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix=
/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/un=
ix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysde=
ps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/uni=
x -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/npt=
l -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-=
32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/el=
f -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nost=
dinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib=
/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sled=
z/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.=
3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/stag=
ing/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include .=
./include/libc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRES=
EARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc=
-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_errno_addr.o -MD -MP =
-MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux=
-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_errno_a=
ddr.o.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angst=
rom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeab=
i_errno_addr.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_mb_cur_max.c -c -st=
d=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-opt=
imizations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-poi=
nter =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-li=
nux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-=
angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I.=
./ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I=
../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/=
eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sy=
sv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/=
linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysd=
eps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix=
/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/un=
ix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysde=
ps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/uni=
x -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/npt=
l -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-=
32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/el=
f -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nost=
dinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib=
/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sled=
z/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.=
3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/stag=
ing/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include .=
./include/libc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRES=
EARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc=
-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_mb_cur_max.o -MD -MP =
-MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux=
-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_mb_cur_=
max.o.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angst=
rom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeab=
i_mb_cur_max.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_atexit.c -c -std=3D=
gnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimiz=
ations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer=
 =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/wo=
rk/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-=
gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angs=
trom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../po=
rts/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../p=
orts/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi=
 -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/l=
inux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linu=
x -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/=
pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/com=
mon -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/s=
ysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/u=
nix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I=
../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I=
../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -=
I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I=
../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc=
 -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc=
/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/wo=
rk/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/=
include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/=
armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../in=
clude/libc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARC=
H/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9=
-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_atexit.o -MD -MP -MF /hom=
e/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi=
/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_atexit.o.dt -MT=
 /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gn=
ueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_atexit.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_memclr.c -c -std=3D=
gnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimiz=
ations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer=
 =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/wo=
rk/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-=
gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angs=
trom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../po=
rts/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../p=
orts/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi=
 -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/l=
inux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linu=
x -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/=
pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/com=
mon -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/s=
ysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/u=
nix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I=
../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I=
../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -=
I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I=
../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc=
 -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc=
/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/wo=
rk/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/=
include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/=
armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../in=
clude/libc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARC=
H/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9=
-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memclr.o -MD -MP -MF /hom=
e/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi=
/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memclr.o.dt -MT=
 /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gn=
ueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memclr.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_memcpy.c -c -std=3D=
gnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimiz=
ations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer=
 =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/wo=
rk/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-=
gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angs=
trom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../po=
rts/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../p=
orts/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi=
 -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/l=
inux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linu=
x -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/=
pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/com=
mon -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/s=
ysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/u=
nix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I=
../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I=
../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -=
I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I=
../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc=
 -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc=
/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/wo=
rk/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/=
include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/=
armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../in=
clude/libc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARC=
H/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9=
-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memcpy.o -MD -MP -MF /hom=
e/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi=
/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memcpy.o.dt -MT=
 /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gn=
ueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memcpy.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_memmove.c -c -std=
=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-opti=
mizations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-poin=
ter =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3=
/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-lin=
ux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-a=
ngstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I..=
/ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I.=
./ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/e=
abi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sys=
v/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/l=
inux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysde=
ps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/=
common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/uni=
x/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdep=
s/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix=
 -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl=
 -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-3=
2 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf=
 -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostd=
inc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/=
gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz=
/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3=
.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/stagi=
ng/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ..=
/include/libc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESE=
ARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-=
2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memmove.o -MD -MP -MF =
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnu=
eabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memmove.o.d=
t -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-lin=
ux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memmo=
ve.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_memset.c -c -std=3D=
gnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimiz=
ations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer=
 =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/wo=
rk/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-=
gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angs=
trom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../po=
rts/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../p=
orts/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi=
 -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/l=
inux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linu=
x -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/=
pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/com=
mon -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/s=
ysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/u=
nix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I=
../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I=
../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -=
I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I=
../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc=
 -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc=
/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/wo=
rk/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/=
include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/=
armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../in=
clude/libc-symbols.h =C2=A0 =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARC=
H/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9=
-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memset.o -MD -MP -MF /hom=
e/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi=
/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memset.o.dt -MT=
 /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gn=
ueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memset.o
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../sysdeps/unix/sysv/linux/init-first.c -c -std=3Dg=
nu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimiza=
tions -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer =
-fPIC =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp=
.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-l=
inux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te=
-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I=
../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -=
I../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm=
/eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/s=
ysv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv=
/linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sys=
deps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/uni=
x/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/u=
nix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysd=
eps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/un=
ix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/np=
tl -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt=
-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/e=
lf -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nos=
tdinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/li=
b/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sle=
dz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4=
.3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/sta=
ging/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include =
../include/libc-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFIN=
I -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linu=
x-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/init-first.o=
s -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angs=
trom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/ini=
t-first.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-=
angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu=
/init-first.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb libc-start.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wa=
ll -Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants=
 -Wstrict-prototypes =C2=A0-fomit-frame-pointer -fPIC -fexceptions =C2=A0 -=
I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angs=
trom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu -I/=
home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnue=
abi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm=
/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/un=
ix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sys=
deps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../s=
ysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sys=
deps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sy=
sdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdep=
s/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/s=
ysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../po=
rts/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posi=
x -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdep=
s/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/iee=
e754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/gene=
ric -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem /home=
/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-l=
inux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/t=
mp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -=
isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstro=
m-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../include/libc-symb=
ols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH=
/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-=
r35.2/build-arm-angstrom-linux-gnueabi/csu/libc-start.os -MD -MP -MF /home/=
DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/g=
libc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/libc-start.os.dt -MT /h=
ome/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnuea=
bi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/libc-start.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/unix/sysv/linux/arm/sysdep.S -c =
=C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5=
te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/=
csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-lin=
ux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysd=
eps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sys=
deps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../po=
rts/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm=
 -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../n=
ptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread =
-I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I..=
/sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I..=
/nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm =
-I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysde=
ps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports=
/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysd=
eps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysde=
ps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isyste=
m /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-ang=
strom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/Hydra=
IP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-=
fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-=
angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../include/li=
bc-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFINI -DASSEMBLER=
 =C2=A0-I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-=
linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/. =C2=A0=
-Wa,--noexecstack =C2=A0-o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work=
/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gn=
ueabi/csu/sysdep.os -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3=
/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-lin=
ux-gnueabi/csu/sysdep.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3=
/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-lin=
ux-gnueabi/csu/sysdep.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb version.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wall =
-Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants -W=
strict-prototypes =C2=A0-fomit-frame-pointer -fPIC =C2=A0 =C2=A0-I../includ=
e -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux=
-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu -I/home/DRESE=
ARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-=
2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I../=
ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv/li=
nux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/unix/=
sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/uni=
x/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/=
sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix=
/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mma=
n -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/uni=
x/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sysdep=
s/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../por=
ts/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -I..=
/sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-6=
4 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I../p=
orts -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem /home/DRESEARCH=
/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnuea=
bi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross=
/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem /h=
ome/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux-gn=
ueabi/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h =C2=
=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH/sledz/wo=
rk/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/bui=
ld-arm-angstrom-linux-gnueabi/csu/version.os -MD -MP -MF /home/DRESEARCH/sl=
edz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35=
.2/build-arm-angstrom-linux-gnueabi/csu/version.os.dt -MT /home/DRESEARCH/s=
ledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r3=
5.2/build-arm-angstrom-linux-gnueabi/csu/version.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb check_fds.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wal=
l -Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants =
-Wstrict-prototypes =C2=A0-fomit-frame-pointer -fPIC =C2=A0 =C2=A0-I../incl=
ude -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-lin=
ux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu -I/home/DRE=
SEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glib=
c-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I.=
./ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv/=
linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/uni=
x/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/u=
nix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/uni=
x/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/un=
ix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/m=
man -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/u=
nix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sysd=
eps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../p=
orts/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -I=
../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl=
-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I..=
/ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem /home/DRESEAR=
CH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnu=
eabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cro=
ss/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem =
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux-=
gnueabi/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h =
=C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH/sledz=
/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/=
build-arm-angstrom-linux-gnueabi/csu/check_fds.os -MD -MP -MF /home/DRESEAR=
CH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.=
9-r35.2/build-arm-angstrom-linux-gnueabi/csu/check_fds.os.dt -MT /home/DRES=
EARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc=
-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/check_fds.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb dso_handle.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wa=
ll -Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants=
 -Wstrict-prototypes =C2=A0-fomit-frame-pointer -fPIC =C2=A0 =C2=A0-I../inc=
lude -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-li=
nux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu -I/home/DR=
ESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/gli=
bc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I=
../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv=
/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/un=
ix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/=
unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/un=
ix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/u=
nix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/=
mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/=
unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sys=
deps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../=
ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -=
I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/db=
l-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I.=
./ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem /home/DRESEA=
RCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gn=
ueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cr=
oss/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem=
 /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux=
-gnueabi/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h =
=C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH/sledz=
/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/=
build-arm-angstrom-linux-gnueabi/csu/dso_handle.os -MD -MP -MF /home/DRESEA=
RCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2=
.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/dso_handle.os.dt -MT /home/DR=
ESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/gli=
bc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/dso_handle.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl/unwi=
nd-resume.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strin=
gs -fexpensive-optimizations -fmerge-all-constants -Wstrict-prototypes =C2=
=A0-fomit-frame-pointer -fPIC -fexceptions -fasynchronous-unwind-tables =C2=
=A0 -I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te=
-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/cs=
u -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux=
-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdep=
s/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysde=
ps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../port=
s/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -=
I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../npt=
l/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I=
../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../s=
ysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../n=
ptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I=
../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps=
/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/s=
ysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdep=
s/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps=
/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem =
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angst=
rom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP=
/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fi=
xed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-an=
gstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../include/libc=
-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRES=
EARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc=
-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/unwind-resume.os -MD -MP -M=
F /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-g=
nueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/unwind-resume.o=
s.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-=
linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/unwind-r=
esume.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb errno.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wall -W=
inline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants -Wst=
rict-prototypes =C2=A0-fomit-frame-pointer -fPIC =C2=A0 =C2=A0-I../include =
-I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-g=
nueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu -I/home/DRESEAR=
CH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.=
9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I../po=
rts/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv/linu=
x/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/unix/sy=
sv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/unix/=
sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/sy=
sv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix/s=
ysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman =
-I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/unix/=
sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sysdeps/=
unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports=
/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -I../s=
ysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 =
-I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I../por=
ts -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem /home/DRESEARCH/s=
ledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi=
/4.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/a=
rmv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem /hom=
e/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux-gnue=
abi/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h =C2=A0=
-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH/sledz/work/=
HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-=
arm-angstrom-linux-gnueabi/csu/errno.os -MD -MP -MF /home/DRESEARCH/sledz/w=
ork/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/bu=
ild-arm-angstrom-linux-gnueabi/csu/errno.os.dt -MT /home/DRESEARCH/sledz/wo=
rk/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/bui=
ld-arm-angstrom-linux-gnueabi/csu/errno.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/unix/sysv/linux/arm/libc-aeabi_rea=
d_tp.S -c =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/=
work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linu=
x-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-an=
gstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../=
ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I..=
/ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/ea=
bi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv=
/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/li=
nux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdep=
s/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/c=
ommon -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix=
/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps=
/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix =
-I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl =
-I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32=
 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf =
-I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdi=
nc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/g=
cc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/=
work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.=
3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/stagin=
g/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include ../=
include/libc-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFINI -=
DASSEMBLER =C2=A0-I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te=
-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/cs=
u/. =C2=A0-Wa,--noexecstack =C2=A0-o /home/DRESEARCH/sledz/work/HydraIP/OE/=
tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstro=
m-linux-gnueabi/csu/libc-aeabi_read_tp.os -MD -MP -MF /home/DRESEARCH/sledz=
/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/=
build-arm-angstrom-linux-gnueabi/csu/libc-aeabi_read_tp.os.dt -MT /home/DRE=
SEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glib=
c-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/libc-aeabi_read_tp.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb errno-loc.c -c -std=3Dgnu99 -fgnu89-inline -O2 -Wal=
l -Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-constants =
-Wstrict-prototypes =C2=A0-fomit-frame-pointer -fPIC =C2=A0 =C2=A0-I../incl=
ude -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-lin=
ux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu -I/home/DRE=
SEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glib=
c-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../ports/sysdeps/arm/elf -I.=
./ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../ports/sysdeps/unix/sysv/=
linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi -I../ports/sysdeps/uni=
x/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/u=
nix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/uni=
x/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/un=
ix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/m=
man -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv -I../nptl/sysdeps/u=
nix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/unix/arm -I../ports/sysd=
eps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../p=
orts/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I../ports/sysdeps/arm -I=
../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl=
-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -I..=
/ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc -isystem /home/DRESEAR=
CH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnu=
eabi/4.3.3/include -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cro=
ss/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed -isystem =
/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/staging/armv5te-angstrom-linux-=
gnueabi/usr/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h =
=C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFINI -o /home/DRESEARCH/sledz=
/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/=
build-arm-angstrom-linux-gnueabi/csu/errno-loc.os -MD -MP -MF /home/DRESEAR=
CH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.=
9-r35.2/build-arm-angstrom-linux-gnueabi/csu/errno-loc.os.dt -MT /home/DRES=
EARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc=
-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/errno-loc.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_assert.c -c -std=3D=
gnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimiz=
ations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer=
 -fPIC =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-=
linux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5t=
e-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -=
I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl =
-I../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/ar=
m/eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/=
sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sys=
v/linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sy=
sdeps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/un=
ix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/=
unix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sys=
deps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/u=
nix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/n=
ptl -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/fl=
t-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/=
elf -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -no=
stdinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/l=
ib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sl=
edz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/=
4.3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/st=
aging/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include=
 ../include/libc-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFI=
NI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-lin=
ux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_asser=
t.os -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-a=
ngstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/=
aeabi_assert.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/arm=
v5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueab=
i/csu/aeabi_assert.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_localeconv.c -c -st=
d=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-opt=
imizations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-poi=
nter -fPIC =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/O=
E/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angst=
rom-linux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/ar=
mv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnuea=
bi -I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/n=
ptl -I../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linu=
x/arm/eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/u=
nix/sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix=
/sysv/linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I.=
./sysdeps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdep=
s/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysd=
eps/unix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports=
/sysdeps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysde=
ps/unix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/a=
rm/nptl -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee75=
4/flt-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/gene=
ric/elf -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I.=
 -nostdinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5=
te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARC=
H/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnue=
abi/4.3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
3/staging/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -inc=
lude ../include/libc-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_IN=
ITFINI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom=
-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_l=
ocaleconv.os -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/a=
rmv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnue=
abi/csu/aeabi_localeconv.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-=
linux-gnueabi/csu/aeabi_localeconv.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_errno_addr.c -c -st=
d=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-opt=
imizations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-poi=
nter -fPIC =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/O=
E/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angst=
rom-linux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/ar=
mv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnuea=
bi -I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/n=
ptl -I../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linu=
x/arm/eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/u=
nix/sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix=
/sysv/linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I.=
./sysdeps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdep=
s/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysd=
eps/unix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports=
/sysdeps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysde=
ps/unix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/a=
rm/nptl -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee75=
4/flt-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/gene=
ric/elf -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I.=
 -nostdinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5=
te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARC=
H/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnue=
abi/4.3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
3/staging/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -inc=
lude ../include/libc-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_IN=
ITFINI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom=
-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_e=
rrno_addr.os -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/a=
rmv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnue=
abi/csu/aeabi_errno_addr.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-=
linux-gnueabi/csu/aeabi_errno_addr.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_mb_cur_max.c -c -st=
d=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-opt=
imizations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-poi=
nter -fPIC =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/O=
E/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angst=
rom-linux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/ar=
mv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnuea=
bi -I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/n=
ptl -I../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linu=
x/arm/eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/u=
nix/sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix=
/sysv/linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I.=
./sysdeps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdep=
s/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysd=
eps/unix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports=
/sysdeps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysde=
ps/unix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/a=
rm/nptl -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee75=
4/flt-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/gene=
ric/elf -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I.=
 -nostdinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5=
te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARC=
H/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnue=
abi/4.3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.=
3/staging/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -inc=
lude ../include/libc-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_IN=
ITFINI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom=
-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_m=
b_cur_max.os -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/a=
rmv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnue=
abi/csu/aeabi_mb_cur_max.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-=
linux-gnueabi/csu/aeabi_mb_cur_max.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_atexit.c -c -std=3D=
gnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimiz=
ations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer=
 -fPIC =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-=
linux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5t=
e-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -=
I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl =
-I../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/ar=
m/eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/=
sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sys=
v/linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sy=
sdeps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/un=
ix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/=
unix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sys=
deps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/u=
nix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/n=
ptl -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/fl=
t-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/=
elf -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -no=
stdinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/l=
ib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sl=
edz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/=
4.3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/st=
aging/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include=
 ../include/libc-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFI=
NI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-lin=
ux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_atexi=
t.os -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-a=
ngstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/=
aeabi_atexit.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/arm=
v5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueab=
i/csu/aeabi_atexit.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_memclr.c -c -std=3D=
gnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimiz=
ations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer=
 -fPIC =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-=
linux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5t=
e-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -=
I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl =
-I../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/ar=
m/eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/=
sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sys=
v/linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sy=
sdeps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/un=
ix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/=
unix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sys=
deps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/u=
nix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/n=
ptl -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/fl=
t-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/=
elf -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -no=
stdinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/l=
ib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sl=
edz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/=
4.3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/st=
aging/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include=
 ../include/libc-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFI=
NI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-lin=
ux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memcl=
r.os -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-a=
ngstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/=
aeabi_memclr.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/arm=
v5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueab=
i/csu/aeabi_memclr.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_memcpy.c -c -std=3D=
gnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimiz=
ations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer=
 -fPIC =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-=
linux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5t=
e-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -=
I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl =
-I../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/ar=
m/eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/=
sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sys=
v/linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sy=
sdeps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/un=
ix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/=
unix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sys=
deps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/u=
nix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/n=
ptl -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/fl=
t-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/=
elf -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -no=
stdinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/l=
ib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sl=
edz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/=
4.3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/st=
aging/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include=
 ../include/libc-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFI=
NI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-lin=
ux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memcp=
y.os -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-a=
ngstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/=
aeabi_memcpy.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/arm=
v5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueab=
i/csu/aeabi_memcpy.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_memmove.c -c -std=
=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-opti=
mizations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-poin=
ter -fPIC =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE=
/tmp.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstr=
om-linux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/arm=
v5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueab=
i -I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/np=
tl -I../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux=
/arm/eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/un=
ix/sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/=
sysv/linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I..=
/sysdeps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps=
/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysde=
ps/unix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/=
sysdeps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdep=
s/unix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/ar=
m/nptl -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754=
/flt-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/gener=
ic/elf -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. =
-nostdinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5t=
e/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH=
/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnuea=
bi/4.3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3=
/staging/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -incl=
ude ../include/libc-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INI=
TFINI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-=
linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_me=
mmove.os -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5=
te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/=
csu/aeabi_memmove.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/wor=
k/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-g=
nueabi/csu/aeabi_memmove.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../ports/sysdeps/arm/eabi/aeabi_memset.c -c -std=3D=
gnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimiz=
ations -fmerge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer=
 -fPIC =C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tm=
p.3/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-=
linux-gnueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5t=
e-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -=
I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl =
-I../ports/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/ar=
m/eabi -I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/=
sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sys=
v/linux -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sy=
sdeps/pthread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/un=
ix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/=
unix/sysv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sys=
deps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/u=
nix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/n=
ptl -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/fl=
t-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/=
elf -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -no=
stdinc -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/l=
ib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sl=
edz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/=
4.3.3/include-fixed -isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/st=
aging/armv5te-angstrom-linux-gnueabi/usr/include -D_LIBC_REENTRANT -include=
 ../include/libc-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -DHAVE_INITFI=
NI -o /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angstrom-lin=
ux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/aeabi_memse=
t.os -MD -MP -MF /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-a=
ngstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi/csu/=
aeabi_memset.os.dt -MT /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/arm=
v5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueab=
i/csu/aeabi_memset.os
> arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -mthu=
mb-interwork -mno-thumb ../sysdeps/wordsize-32/divdi3.c -c -std=3Dgnu99 -fg=
nu89-inline -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimizations -f=
merge-all-constants -Wstrict-prototypes =C2=A0-fomit-frame-pointer -fPIC =
=C2=A0 =C2=A0-I../include -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/wor=
k/armv5te-angstrom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-g=
nueabi/csu -I/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/armv5te-angst=
rom-linux-gnueabi/glibc-2.9-r35.2/build-arm-angstrom-linux-gnueabi -I../por=
ts/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/nptl -I../po=
rts/sysdeps/unix/sysv/linux/arm/eabi -I../sysdeps/unix/sysv/linux/arm/eabi =
-I../ports/sysdeps/unix/sysv/linux/arm/nptl -I../ports/sysdeps/unix/sysv/li=
nux/arm -I../sysdeps/unix/sysv/linux/arm -I../ports/sysdeps/unix/sysv/linux=
 -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/p=
thread -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/comm=
on -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sy=
sv -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../ports/sysdeps/un=
ix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/unix -I../sysdeps/unix -I.=
./sysdeps/posix -I../ports/sysdeps/arm/eabi -I../ports/sysdeps/arm/nptl -I.=
./ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I=
../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I.=
./sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nostdinc =
-isystem /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/cross/armv5te/lib/gcc/=
arm-angstrom-linux-gnueabi/4.3.3/include -isystem /home/DRESEARCH/sledz/wor=
k/HydraIP/OE/tmp.3/cross/armv5te/lib
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


