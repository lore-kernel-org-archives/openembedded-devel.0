Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NFBEX-0002NL-OG
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 19:44:29 +0100
Received: by iwn32 with SMTP id 32so2252129iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 10:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=8vK1dUZi3r9rSQsL+ui9r6AHSaszrs2pIyr/nINyaw0=;
	b=MgPMPrPbiS2mfjhjR0mh/csudwhLYKhW9Is+j7O31U0jmzxQ3uAVfMmam3YBtR6V4L
	5r6KK0151tmAQDijIKFj0jRUSNAFi11fpSF+nzmRGpCcLe/hvZeM5k5DuSvfNNlBqde/
	Mgg7jW6Q3Y5GipYbC+hrBSh7uCdZoowH72UbU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=A6flshUuepI04DOZlKtrOQKR4zGTo4MakK2yc51K6kKvQrMDwhtHtBxvDxj6q0l0HV
	7KIiOY9VmF2yF0HQTiAvcUhcNS8kzmMiU+M0NvwldlEHMbJCSjeeduZ7ZQ38mQTquA+f
	trEu6TDVYvAyrhwBifKIuP0ekHBEyMd70uVQU=
MIME-Version: 1.0
Received: by 10.231.29.149 with SMTP id q21mr8679276ibc.35.1259606571252; Mon, 
	30 Nov 2009 10:42:51 -0800 (PST)
In-Reply-To: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
Date: Mon, 30 Nov 2009 10:42:51 -0800
Message-ID: <19c1b8a90911301042t6ed432b2m1189c619772edf9c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Mon, 30 Nov 2009 18:44:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2009 at 3:37 AM, RK Raggit <rk.raggit@gmail.com> wrote:
> hi folks,
>
> a strange internal compiler error pops up when i am compiling glibc. This=
 is
> my version -
>
> PREFERRED_VERSION_glibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D "2.6.1"
> PREFERRED_VERSION_glibc-initial =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "2.6.1"
> I see the same error when i change the version to 2.9. This is the error =
log
> -
>
> ****************************************************
> ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a9
> -mfpu=3Dneon -mfloat-abi=3Dsoftfp ../sysdeps/unix/sysv/linux/mq_unlink.c =
-c
> -std=3Dgnu99 -fgnu89-inline -O2 -Wall -Winline -Wwrite-strings
> -fexpensive-optimizations -fmerge-all-constants -Wstrict-prototypes
> -fomit-frame-pointer =C2=A0 =C2=A0-I../include
> -I/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/gli=
bc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt
> -I/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/gli=
bc-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi
> -I../ports/sysdeps/arm/elf -I../ports/sysdeps/unix/sysv/linux/arm/eabi/np=
tl
> -I../ports/sysdeps/unix/sysv/linux/arm/eabi
> -I../sysdeps/unix/sysv/linux/arm/eabi
> -I../ports/sysdeps/unix/sysv/linux/arm/nptl
> -I../ports/sysdeps/unix/sysv/linux/arm -I../sysdeps/unix/sysv/linux/arm
> -I../ports/sysdeps/unix/sysv/linux -I../nptl/sysdeps/unix/sysv/linux
> -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../sysdeps/unix/sysv/lin=
ux
> -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman
> -I../sysdeps/unix/inet -I../ports/sysdeps/unix/sysv
> -I../nptl/sysdeps/unix/sysv -I../sysdeps/unix/sysv
> -I../ports/sysdeps/unix/arm -I../ports/sysdeps/unix -I../nptl/sysdeps/uni=
x
> -I../sysdeps/unix -I../sysdeps/posix -I../ports/sysdeps/arm/eabi
> -I../ports/sysdeps/arm/fpu -I../ports/sysdeps/arm/nptl
> -I../ports/sysdeps/arm -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-=
32
> -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754 -I../sysdeps/generic/elf
> -I../sysdeps/generic -I../ports -I../nptl =C2=A0-I.. -I../libio -I. -nost=
dinc
> -isystem
> /home/raghu/opendistro/build/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-=
gnueabi/4.2.3/include
> -isystem
> /home/raghu/opendistro/build/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-=
gnueabi/4.2.3/include-fixed
> -isystem
> /home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gnueabi/us=
r/include
> -D_LIBC_REENTRANT -include ../include/libc-symbols.h =C2=A0 -DNOT_IN_libc=
=3D1
> -DIS_IN_librt=3D1 =C2=A0 =C2=A0-o
> /home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc=
-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt/mq_unlink.o
> -MD -MP -MF
> /home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc=
-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt/mq_unlink.o.dt
> -MT
> /home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glibc=
-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt/mq_unlink.o
> ../sysdeps/unix/sysv/linux/mq_unlink.c: In function 'mq_unlink':
> ../sysdeps/unix/sysv/linux/mq_unlink.c:50: error: could not split insn
> (insn:TI 80 48 39 ../sysdeps/unix/sysv/linux/mq_unlink.c:43 (parallel [
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(set (reg/v:SI 4 r4 [orig:135 re=
t ] [135])
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(if_then_else:SI (=
ne (reg/v:SI 0 r0 [orig:133 ret.53 ]
> [133])
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(const_int -1 [0xffffffffffffffff]))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(neg=
:SI (reg/v:SI 0 r0 [orig:133 ret.53 ] [133]))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(con=
st_int 13 [0xd])))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(clobber (reg:CC 24 cc))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0]) 311 {*ifcompare_neg_move} (nil)
> =C2=A0 =C2=A0(expr_list:REG_DEAD (reg/v:SI 0 r0 [orig:133 ret.53 ] [133])
> =C2=A0 =C2=A0 =C2=A0 =C2=A0(expr_list:REG_UNUSED (reg:CC 24 cc)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(nil))))
> ../sysdeps/unix/sysv/linux/mq_unlink.c:50: internal compiler error: in
> final_scan_insn, at final.c:2553
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <URL:http://gcc.gnu.org/bugs.html <http://gcc.gnu.org/bugs.html>> for
> instructions.
> make[2]: ***
> [/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/glib=
c-2.6.1-r35.0/build-arm-angstrom-linux-gnueabi/rt/mq_unlink.o]
> Error 1
> ******************************************************
>
> glibc-initial seems to have built fine. I couldnt find any hints by
> googling.

glibc-initial does not compile much of code.

>
> Anyone seen something similar and could help out with some clues ?
>

This is gcc ICE. You could preprocess the file and provide commandline
options and the preprocessed file.
Secondly I also noticed that you are using gcc 4.2. It would be
interesting to know if the same ICE happens
with gcc 4.4. Btw. you would be better of using gcc 4.4 for new arm
processors like cortex a9

-Khem


