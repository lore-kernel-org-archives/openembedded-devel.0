Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pg2Fu-0001Ct-V9
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 22:41:28 +0100
Received: by yie16 with SMTP id 16so377066yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 13:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=MzJEzNADckp7JLqrl1ndZD0rB/3iUoj0+QiWyG2x8M8=;
	b=Kn5igjUqe3LMoGYx7ZPU1XmNtmHaHdJTOn2ljZ9Cm7p2osc18A2J+XTRL0Cn9U9ywi
	leaNF8IUVBW9OmtP0laI/TYjjCntDQgcWAeke5gbzlkz3nBIqO1iHGQJGO/y8M5zy34n
	4faCWOzHAhehH53U5k2WfD4xGfjgia1kSd2DI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ewxJAby6ZMOiTETDASiBdEQeprIJsVIzsJ4Z4M2HbrNHQ3U3ZxQGuZRNhWo5llYJBb
	/bQr7cfXF4RDqP0J9aVWZCWa3T6cE5K7SOqpkchoDn3uLq+CuqUAaoTpM7EZuYTs2itZ
	8F9EOUGKsWOBQG+U7Qr4MgoHmel55DLTGXLu4=
Received: by 10.90.80.18 with SMTP id d18mr3264374agb.31.1295559639995; Thu,
	20 Jan 2011 13:40:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Thu, 20 Jan 2011 13:40:19 -0800 (PST)
In-Reply-To: <20110120181233.GA1789@lit.local.igalia.com>
References: <20110120181233.GA1789@lit.local.igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jan 2011 13:40:19 -0800
Message-ID: <AANLkTin6XfEpo_ic0Edp8+58EbzGutuhohM-V4EzzwhJ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: problems compiling glibc_2.9-r37.4 under Angstrom
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
X-List-Received-Date: Thu, 20 Jan 2011 21:41:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2011/1/20 V=C3=ADctor M. J=C3=A1quez L. <vjaquez@igalia.com>:
>
> In order to build native-sdk-image recipe, I found my self compiling
> glibc_2.9-r37.4, because it is the real provider of virtual-libc-dev (the
> toolchain does not truly provide it -but that is another bug [1]-).
>
> But the glibc_2.9-r37.4 configuration fails using the canonical
> arm-angstrom-linux-gnueabi- toolchain (using the csl external toolchain f=
ails
> too, but for other reasons):
>
> Log data follows:
> | configure.in:2204: warning: AC_CACHE_VAL(pic_default, ...): suspicious =
cache-id, must contain _cv_ to be cached
> | ../../lib/autoconf/general.m4:1999: AC_CACHE_VAL is expanded from...
> | ../../lib/autoconf/general.m4:2020: AC_CACHE_CHECK is expanded from...
> | configure.in:2204: the top level
> | checking build system type... x86_64-pc-linux-gnu
> | checking host system type... arm-angstrom-linux-gnueabi
> | checking add-on ports for preconfigure fragments... am33 arm hppa m68k =
mips
> | configure: running configure fragment for add-on nptl
> | configure: running configure fragment for add-on libidn
> | checking sysdep dirs... ports/sysdeps/arm/elf ports/sysdeps/unix/sysv/l=
inux/arm/eabi/nptl ports/sysdeps/unix/sysv/linux/arm/eabi sysdeps/unix/sysv=
/linux/arm/eabi ports/sysdeps/unix/sysv/linux/arm/nptl ports/sysdeps/unix/s=
ysv/linux/arm sysdeps/unix/sysv/linux/arm ports/sysdeps/unix/sysv/linux npt=
l/sysdeps/unix/sysv/linux nptl/sysdeps/pthread sysdeps/pthread sysdeps/unix=
/sysv/linux sysdeps/gnu sysdeps/unix/common sysdeps/unix/mman sysdeps/unix/=
inet ports/sysdeps/unix/sysv nptl/sysdeps/unix/sysv sysdeps/unix/sysv ports=
/sysdeps/unix/arm ports/sysdeps/unix nptl/sysdeps/unix sysdeps/unix sysdeps=
/posix ports/sysdeps/arm/eabi ports/sysdeps/arm/fpu ports/sysdeps/arm/nptl =
ports/sysdeps/arm sysdeps/wordsize-32 sysdeps/ieee754/flt-32 sysdeps/ieee75=
4/dbl-64 sysdeps/ieee754 sysdeps/generic/elf sysdeps/generic
> | checking for a BSD-compatible install... /media/DISK/meego/vjaquez-angs=
trom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/bin/=
install -c
> | checking whether ln -s works... yes
> | checking for arm-angstrom-linux-gnueabi-gcc... ccache arm-angstrom-linu=
x-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=
=3Dsoftfp -mthumb-interwork -mno-thumb
> | checking for suffix of object files... o
> | checking whether we are using the GNU C compiler... yes
> | checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a=
 -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mn=
o-thumb accepts -g... yes
> | checking for ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mt=
une=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-th=
umb option to accept ISO C89... unsupported
> | checking for gcc... ccache gcc
> | checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gc=
c -E
> | configure: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E" fa=
ils sanity check
> | See `config.log' for more details.
>
> Reading the config.log I found:
>
> configure:3734: checking how to run the C preprocessor
> configure:3850: result: arm-angstrom-linux-gnueabi-gcc -E
> configure:3879: arm-angstrom-linux-gnueabi-gcc -E =C2=A0conftest.c
> In file included from /media/DISK/meego/vjaquez-angstrom-setup-scripts/bu=
ild/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstr=
om-linux-gnueabi/4.3.3/include-fixed/syslimits.h:7,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /media/DISK/=
meego/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86=
_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include-fixed=
/limits.h:11,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from conftest.c:1=
0:
> /media/DISK/meego/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_=
1/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3=
/include-fixed/limits.h:122:61: error: limits.h: No such file or directory


you might try to use eglibc. It may fix this issue for you.


