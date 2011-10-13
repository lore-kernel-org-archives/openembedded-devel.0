Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1REQQC-0007S4-Ei
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 20:54:24 +0200
Received: by pzd13 with SMTP id 13so3466082pzd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 11:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=qQD/hcyOblxC1ElCQYkMTO1G3mCVBdsgOKpkI2hgCEg=;
	b=teyvF5gspWVOQEb9t74ESBVeqyILuO26Uul66MeZfld4EnlAKwjznycUHJn/Od/Q+5
	k5aqxliTEOoJg+Ri0F2Kp2b7UQRpAM+M/Z1wLv/UtacyLpWzl2Oo/2Z1blft1jgA5PFR
	2Pf7iEf5GoG2RxCQATG/dxG1ZNtbmySHqNO6A=
Received: by 10.68.20.226 with SMTP id q2mr10487110pbe.115.1318531719236; Thu,
	13 Oct 2011 11:48:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 13 Oct 2011 11:48:09 -0700 (PDT)
In-Reply-To: <4E96F59A.6030206@mlbassoc.com>
References: <4E96E9FE.1060005@mlbassoc.com>
	<6E64F0B8-773E-4558-B470-37BA010F419D@ti.com>
	<4E96F59A.6030206@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2011 11:48:09 -0700
Message-ID: <CAMKF1sroXD8KQE4HPXgUcvC8X35TDrzzf=SVmVLAvM073WD9vA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 13 Oct 2011 18:54:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 7:28 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2011-10-13 08:16, Kridner, Jason wrote:
>>
>> On Oct 13, 2011, at 8:39 AM, "Gary Thomas"<gary@mlbassoc.com> =C2=A0wrot=
e:
>>
>>> Trying to follow the Angstrom instructions directly.
>>>
>>> OE Build Configuration:
>>> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.13.3"
>>> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "arm"
>>> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux-gnueabi"
>>> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "beagleboard"
>>> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "angstrom"
>>> DISTRO_VERSION =C2=A0 =C2=A0=3D "v2011.10-core"
>>> TUNE_FEATURES =C2=A0 =C2=A0 =3D "armv7a vfp neon cortexa8"
>>> TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "vfp-neon"
>>> meta-angstrom =C2=A0 =C2=A0 =3D "master:66263650f8548d6b0b5f593ab728f53=
6d5e05a9f"
>>> meta-oe
>>> meta-efl
>>> meta-gpe
>>> meta-gnome
>>> meta-xfce =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:1e5d73ec4f44200104de0=
85838f04e31a49435da"
>>> meta-ti =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:3530f1025efc3792=
334b897a4e70c6d5822ef56d"
>>> meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:5ad1ca=
59dea6d5045f252ed7b786ad193faced64"
>>>
>>> Fails with this error:
>>> | ccache arm-angstrom-linux-gnueabi-gcc =C2=A0-march=3Darmv7-a
>>> -fno-tree-vectorize =C2=A0 =C2=A0 =C2=A0-mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon
>>> -mtune=3Dcortex-a8 -mthumb-interwork -mno-thumb
>>> --sysroot=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroo=
ts/beagleboard
>>> -DHAVE_CONFIG_H -I. -I.. -I../include =C2=A0 =C2=A0-O2 -pipe -g
>>> -feliminate-unused-debug-types -Wall -c walk_test.c
>>> | libcg_ba.cpp:18:18: fatal error: string: No such file or directory

Does this happen with lastest angstrom on oe-core ? or classic oe.dev
I am unable to reproduce it on my end

>>> | compilation terminated.
>>> | make[2]: *** [libcg_ba.o] Error 1
>>> | make[2]: *** Waiting for unfinished jobs....
>>> | make[2]: Leaving directory
>>> `/home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-=
angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/tests'
>>>
>>> Full compile log at http://www.mlbassoc.com/oe/libcgroup-log.do_compile
>>
>> I have the same issue on a 64-bit Ubuntu machine.
>
> Mine is 32 bit Fedora 13.
>
> The problem seems to be that G++ 4.5.4 is misconfigured. =C2=A0Running it=
 by
> hand:
>
> [gthomas@titan tests]$
> PATH=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686=
-linux/usr/bin/armv7a-angstrom-linux-gnueabi:$PATH
> arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -fno-tree-vectorize
> =C2=A0-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex=
-a8
> -mthumb-interwork -mno-thumb
> --sysroot=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots=
/beagleboard
> -DHAVE_CONFIG_H -I. -I.. -I../include =C2=A0 =C2=A0-O2 -pipe -g
> -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden
> -fvisibility-inlines-hidden -c -o libcg_ba.o libcg_ba.cpp -v
> Using built-in specs.
> COLLECT_GCC=3Darm-angstrom-linux-gnueabi-g++
> COLLECT_LTO_WRAPPER=3D/home/local/new-angstrom/build/tmp-angstrom_2010_x-=
eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../libe=
xec/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/lto-=
wrapper
> Target: arm-angstrom-linux-gnueabi
> Configured with:
> /local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work-shared/gcc-4.5-=
r43+svnr178923/gcc-4_5-branch/configure
> --build=3Di686-linux --host=3Di686-linux --target=3Darm-angstrom-linux-gn=
ueabi
> --prefix=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/=
i686-linux/usr
> --exec_prefix=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysr=
oots/i686-linux/usr
> --bindir=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/=
i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi
> --sbindir=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots=
/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi
> --libexecdir=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/i686-linux/usr/libexec/armv7a-angstrom-linux-gnueabi
> --datadir=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots=
/i686-linux/usr/share
> --sysconfdir=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/i686-linux/etc
> --sharedstatedir=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/i686-linux/com
> --localstatedir=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sy=
sroots/i686-linux/var
> --libdir=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/=
i686-linux/usr/lib/armv7a-angstrom-linux-gnueabi
> --includedir=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/i686-linux/usr/include
> --oldincludedir=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sy=
sroots/i686-linux/usr/include
> --infodir=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots=
/i686-linux/usr/share/info
> --mandir=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/=
i686-linux/usr/share/man
> --disable-silent-rules --disable-dependency-tracking
> --with-libtool-sysroot=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eg=
libc/sysroots/i686-linux
> --with-gnu-ld --enable-shared --enable-languages=3Dc,c++
> --enable-threads=3Dposix --disable-multilib --enable-c99 --enable-long-lo=
ng
> --enable-symvers=3Dgnu --enable-libstdcxx-pch
> --program-prefix=3Darm-angstrom-linux-gnueabi- --enable-target-optspace
> --enable-lto --enable-libssp --disable-bootstrap --disable-libgomp
> --disable-libmudflap --enable-cheaders=3Dc_global
> --with-local-prefix=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglib=
c/sysroots/beagleboard/usr
> --with-gxx-include-dir=3D/usr/include/c++
> --with-sysroot=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard
> --with-build-sysroot=3D/local/new-angstrom/build/tmp-angstrom_2010_x-egli=
bc/sysroots/beagleboard
> --enable-poison-system-directories
> --with-headers=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sys=
roots/beagleboard/usr/include
> --disable-nls --disable-libunwind-exceptions
> --with-mpfr=3D/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroo=
ts/i686-linux/usr
> --with-system-zlib --enable-nls --enable-__cxa_atexit
> Thread model: posix
> gcc version 4.5.4 20110917 (prerelease) (GCC)
> COLLECT_GCC_OPTIONS=3D'-march=3Darmv7-a' '-fno-tree-vectorize'
> '-mfloat-abi=3Dsoftfp' '-mfpu=3Dneon' '-mtune=3Dcortex-a8' '-mthumb-inter=
work'
> '-mno-thumb' '-DHAVE_CONFIG_H' '-I.' '-I..' '-I../include' '-O2' '-pipe'
> '-g' '-feliminate-unused-debug-types' '-fpermissive'
> '-fvisibility-inlines-hidden' '-c' '-o' 'libcg_ba.o' '-v' '-shared-libgcc=
'
>
> /home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-l=
inux/usr/bin/armv7a-angstrom-linux-gnueabi/../../libexec/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/cc1plus
> -quiet -v -I. -I.. -I../include -iprefix
> /home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-l=
inux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux-=
gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/
> -isysroot
> /local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard
> -D_GNU_SOURCE -DHAVE_CONFIG_H libcg_ba.cpp -quiet -dumpbase libcg_ba.cpp
> -march=3Darmv7-a -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8
> -mthumb-interwork -mno-thumb -auxbase-strip libcg_ba.o -g -O2 -version
> -fno-tree-vectorize -feliminate-unused-debug-types -fpermissive
> -fvisibility-inlines-hidden -o - |
>
> /home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-l=
inux/usr/bin/armv7a-angstrom-linux-gnueabi/../../libexec/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/as
> -march=3Darmv7-a -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mea=
bi=3D5 -o
> libcg_ba.o
> GNU C++ (GCC) version 4.5.4 20110917 (prerelease)
> (arm-angstrom-linux-gnueabi)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0compiled by GNU C version 4.4.5 20101112 (Red =
Hat 4.4.5-2), GMP
> version 5.0.2, MPFR version 3.0.1, MPC version 0.8.2
> GGC heuristics: --param ggc-min-expand=3D100 --param ggc-min-heapsize=3D1=
31072
> ignoring nonexistent directory
> "/home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-=
linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux=
-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/../../../../../arm-angstrom-l=
inux-gnueabi/include"
> ignoring nonexistent directory "/usr/include/c++/arm-angstrom-linux-gnuea=
bi"
> ignoring nonexistent directory "/usr/include/c++/backward"
> ignoring nonexistent directory
> "/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboar=
d/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/=
usr/include"
> ignoring duplicate directory
> "/home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-=
linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux=
-gnueabi/gcc/../../../lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-li=
nux-gnueabi/4.5.4/include"
> ignoring duplicate directory
> "/home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-=
linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux=
-gnueabi/gcc/../../../lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-li=
nux-gnueabi/4.5.4/include-fixed"
> ignoring nonexistent directory
> "/home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-=
linux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux=
-gnueabi/gcc/../../../lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-li=
nux-gnueabi/4.5.4/../../../../../arm-angstrom-linux-gnueabi/include"
> #include "..." search starts here:
> #include <...> search starts here:
> =C2=A0.
> =C2=A0..
> =C2=A0../include
>
> /home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-l=
inux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux-=
gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/include
>
> /home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-l=
inux/usr/bin/armv7a-angstrom-linux-gnueabi/../../lib/armv7a-angstrom-linux-=
gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/include-fixed
> =C2=A0/usr/include/c++
> =C2=A0/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagl=
eboard/usr/include
> End of search list.
> GNU C++ (GCC) version 4.5.4 20110917 (prerelease)
> (arm-angstrom-linux-gnueabi)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0compiled by GNU C version 4.4.5 20101112 (Red =
Hat 4.4.5-2), GMP
> version 5.0.2, MPFR version 3.0.1, MPC version 0.8.2
> GGC heuristics: --param ggc-min-expand=3D100 --param ggc-min-heapsize=3D1=
31072
> Compiler executable checksum: ff763b34759d1193f83d28b503f742f0
> libcg_ba.cpp:18:18: fatal error: string: No such file or directory
>
> --
> ------------------------------------------------------------
> Gary Thomas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0Consulting for the
> MLB Associates =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A0Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


