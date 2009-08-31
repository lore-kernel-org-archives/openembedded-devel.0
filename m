Received: from [209.85.221.196] (helo=mail-qy0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MiCH0-0005jd-0m
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Aug 2009 21:10:38 +0200
Received: by qyk34 with SMTP id 34so2660243qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2009 11:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nuEFqINFDgIEjcPg7AigfAtQ1/7M0fGsw8yDRhZWUSU=;
	b=p3pBDq00Qn3Z2ReTOVx9y4l6TCTGwtviJgF0Vr16t3PLEt1NzsQAsl6cJjO+EUGM7h
	Cup83kAfvnvT+PzqHqSoJChdMWGNic2MJQJTjKjfnXWsXmC93UHn/oEGNKvjn+psfIgk
	2YvS14Zwks0Z/xoMdS/xwMKznblricWvi7+3k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vxBtQrDi+T0VRnL2mCTT0aiXzIaS5KP0tLuLoEpxxutBVC2RMaESq1Nmkzv+ROXacv
	JcVmfBBR80YYy4IazHQTCjapkamqpksypkOco/nQWkNdSfATclgIVqh+6Mo2/EZqjJh2
	hU37QKTv36pJVk+S9W3sXGLjSe2Q1O0m2wqzY=
MIME-Version: 1.0
Received: by 10.229.23.4 with SMTP id p4mr1852548qcb.84.1251744723573; Mon, 31 
	Aug 2009 11:52:03 -0700 (PDT)
In-Reply-To: <12c2e32e0908311041g71b15fd7j102c162d440a7776@mail.gmail.com>
References: <12c2e32e0908310716r696a7dadrdc330ad9d4b1eb65@mail.gmail.com>
	<200908311722.45126.mickey@vanille-media.de>
	<12c2e32e0908311041g71b15fd7j102c162d440a7776@mail.gmail.com>
Date: Mon, 31 Aug 2009 11:52:03 -0700
Message-ID: <19c1b8a90908311152p4db05d71x73ef49de512792b9@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: DISTRO minimal.conf for ARM architectures
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
X-List-Received-Date: Mon, 31 Aug 2009 19:10:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2009 at 10:41 AM, Javi Roman<javiroman@kernel-labs.org> wro=
te:
> On Mon, Aug 31, 2009 at 5:22 PM, Michael 'Mickey'
> Lauer<mickey@vanille-media.de> wrote:
>> On Monday 31 August 2009 16:16:10 Javi Roman wrote:
>>> I've been unable to build minimal.conf distro for an ARM architecture
>>> (more precisely for Beagleboard platform), at this point I would like
>>> ask two questions:
>>>
>>> 1. Is it minimal.conf distro ready to build on ARM architectures right =
now?
>>
>> Yes. How exactly does it fail for you?
>
> /builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc=
-cross-initial-4.2.4-r8.1/gcc-4.2.4/build.i686-linux.arm-oe-linux-gnueabi/.=
/gcc/xgcc
> -B/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/g=
cc-cross-initial-4.2.4-r8.1/gcc-4.2.4/build.i686-linux.arm-oe-linux-gnueabi=
/./gcc/
> -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp
> -isystem/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/staging/armv7a-oe-linux-=
gnueabi/usr/include
> -B/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/cross/armv7a/arm-oe-linux-gnue=
abi/bin/
> -B/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/cross/armv7a/arm-oe-linux-gnue=
abi/lib/
> -isystem /builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/cross/armv7a/arm-oe-lin=
ux-gnueabi/include
> -isystem /builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/cross/armv7a/arm-oe-lin=
ux-gnueabi/sys-include
> -O2 -g -Os -DIN_GCC -DCROSS_COMPILE =C2=A0 -W -Wall -Wwrite-strings
> -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
> -isystem ./include =C2=A0-I. -I.
> -I/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/g=
cc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc
> -I/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/g=
cc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/.
> -I/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/g=
cc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/../include
> -I/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/g=
cc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/../libcpp/include
> =C2=A0-I/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnu=
eabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/../libdecnumber
> -I../libdecnumber =C2=A0-g0 -finhibit-size-directive -fno-inline-function=
s
> -fno-exceptions -fno-zero-initialized-in-bss -fno-toplevel-reorder
> -Dinhibit_libc =C2=A0-fPIC \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-c /builds/ASV1-BEAGLEBOARD.REVB6/build=
/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gc=
c/crtstuff.c
> -DCRT_END -DCRTSTUFFS_O \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o crtendS.o
> /builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc=
-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/crtstuff.c:1:
> error: bad value (cortex-a8) for -mtune=3D switch
> /builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc=
-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/crtstuff.c:1:
> error: bad value (armv7-a) for -march=3D switch
> /builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc=
-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/crtstuff.c:1:
> error: invalid floating point option:
> -mfpu=3Dneon/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux=
-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/crtstuff.c:1:
> error: bad value (cortex-a8) for -mtune=3D switch
> /builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc=
-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/crtstuff.c:1:
> error: bad value (armv7-a) for -march=3D switch
> /builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc=
-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/crtstuff.c:1:
> error: invalid floating point option: -mfpu=3Dneon
> make[2]: *** [crtbeginT.o] Error 1
> make[2]: *** [crtendS.o] Error 1
> make[2]: *** [crtbeginS.o] Error 1
> make[2]: Leaving directory
> `/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gc=
c-cross-initial-4.2.4-r8.1/gcc-4.2.4/build.i686-linux.arm-oe-linux-gnueabi/=
gcc'
> make[1]: *** [all-gcc] Error 2
> make[1]: Leaving directory
> `/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gc=
c-cross-initial-4.2.4-r8.1/gcc-4.2.4/build.i686-linux.arm-oe-linux-gnueabi'
> make: *** [all] Error 2
> FATAL: oe_runmake failed
>
>
> I've thought, before to try to find out the problem, if the tuning of
> minimal distro for ARM architecutes would be the Angstrom
> distribution.

the problem is that the compiler being used it old for armv7 support.
Try using gcc 4.4.1
something like

PREFERRED_GCC_VERSION_local                     =3D "4.4.1"

in your loca.conf file would do it for you.
and once done do a complete rebuild.


> good point of start a fresh (o vanilla) basic distribution, and
> Angstron is a more complete and cutting edge distribution for
> Beagleboard platform (as Koen has told me).
>
> Thanks.
>
> --
> Javi Roman
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


