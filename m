Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PiUf7-0008IE-TG
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 17:25:34 +0100
Received: by gyh20 with SMTP id 20so687112gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 08:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=/QL1mgRN5wS5CgPvQL2+ZT3z6Xou8a6kiIXAxxXKxE0=;
	b=xA693pE4quvzZejRVe58gWxEHyQb5jxLgmBLndVknAqUEMfeoBpcbS3aWxmDeGIcr8
	WpwSTo6j7yzjsQXM69z2nNvdkiSN1TElXw92X+kw1bnzwvwBFQhlBeugl7lQYApF6FJh
	eywcxnDmpVLQruamjmWNUJlHZnfvX3XfGj3QA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Lq2Cc8vt9mYeiwjvaQxqgWSoT4bjt6DVDRfO2hUyLLesY313guwRkw/fGTHBlFo47q
	XFv3qWXB0+FLrEo1yoO5XW9eV+V+NLFaMbuXL3gigcAB+Bj2qUxjLQM2lsZZhyH3bI8G
	etsLEXiZj5uw7FZRJ6tHWnJxdBHYIM6vA6IVY=
Received: by 10.90.249.31 with SMTP id w31mr3243543agh.169.1296145483751; Thu,
	27 Jan 2011 08:24:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Thu, 27 Jan 2011 08:24:06 -0800 (PST)
In-Reply-To: <20110127130815.h92lw4hoa9kwow0g@mail.cs.uni-potsdam.de>
References: <20110127130815.h92lw4hoa9kwow0g@mail.cs.uni-potsdam.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2011 08:24:06 -0800
Message-ID: <AANLkTi=Ny0WfaQwiU6ANd=YyOF++YHJ40VNHcs0ufEm5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Error in building OE for MicroBlaze!
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
X-List-Received-Date: Thu, 27 Jan 2011 16:25:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2011 at 4:08 AM, Ali Akbar Zarezadeh
<akzare@cs.uni-potsdam.de> wrote:
> Hi,
>
> I am trying to build a Linux framework for ML605 (Virtex6 FPGA) from Xili=
nx.
> I took a look inside the OE, there are several complete solutions for
> PowerPC, but nothing for MicroBlaze. Hence, based on some useful notes fr=
om
> Mr. Adrian Alonso which I found in his blog, I have started to build a Li=
nux
> framework for MicroBlaze. After solving several issues, now I get stuck a=
t
> the compiling phase of gcc for MicroBlaze. An error occurs when OE tries =
to
> patch gcc. It is listed as follows:
>
> ----------------------------------------------------------------
> akzare@notebook:/opt/local/oe_mb$ bitbake helloworld-image -f
> NOTE: Handling BitBake files: \ (7075/7075) [100 %]
> Parsing of 7075 .bb files complete (6643 cached, 432 parsed). 7337 target=
s,
> 354 skipped, 0 masked, 0 errors.
>
> Build Configuration:
> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.10.2"
> METADATA_BRANCH =C2=A0 =3D "master"
> METADATA_REVISION =3D "c03c179"
> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "microblaze"
> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux"
> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "xilinx-ml605"
> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "angstrom"
> DISTRO_VERSION =C2=A0 =C2=A0=3D "v20110127"
>
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 254 of 832 (ID: 645,
> virtual:native:/opt/local/oe_mb/openembedded/recipes/bison/bison_2.4.3.bb=
,
> do_configure)
> NOTE: package bison-native-2.4.3-r9.0: task do_configure: Started
> NOTE: Running task 289 of 832 (ID: 707,
> /opt/local/oe_mb/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb,
> do_patch)
> NOTE: package gcc-cross-initial-4.5-r31.1+svnr168622: task do_patch: Star=
ted
> NOTE: Applying patch 'gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch'
> (openembedded/recipes/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch)
> NOTE: Applying patch '100-uclibc-conf.patch'
> (openembedded/recipes/gcc/gcc-4.5/100-uclibc-conf.patch)
> NOTE: Applying patch 'gcc-uclibc-locale-ctype_touplow_t.patch'
> (openembedded/recipes/gcc/gcc-4.5/gcc-uclibc-locale-ctype_touplow_t.patch=
)
> NOTE: Applying patch 'cache-amnesia.patch'
> (openembedded/recipes/gcc/gcc-4.5/cache-amnesia.patch)
> NOTE: Applying patch 'gcc-flags-for-build.patch'
> (openembedded/recipes/gcc/gcc-4.5/gcc-flags-for-build.patch)
> FATAL: Execution of 'quilt
> --quiltrc=3D/opt/local/oe_mb/tmp/sysroots/x86_64-linux/usr/bin/quiltrc pu=
sh'
> failed with exit code 1:
> Applying patch gcc-flags-for-build.patch
> patching file Makefile.def
> patching file gcc/Makefile.in
> Hunk #1 succeeded at 755 (offset -11 lines).
> patching file gcc/configure.ac
> Hunk #1 succeeded at 1774 (offset -24 lines).
> patching file Makefile.in
> patching file gcc/configure
> Hunk #1 succeeded at 705 (offset -2 lines).
> Hunk #2 succeeded at 10912 (offset -71 lines).
> Hunk #3 succeeded at 10920 (offset -71 lines).
> Hunk #4 FAILED at 17111.
> Hunk #5 FAILED at 17217.
> 2 out of 5 hunks FAILED -- rejects in file gcc/configure
> patching file Makefile.tpl
> patching file configure
> Hunk #2 succeeded at 7950 (offset -87 lines).
> Hunk #3 succeeded at 8016 (offset -87 lines).
> patching file configure.ac
> Hunk #1 succeeded at 3053 (offset -36 lines).
> Hunk #2 succeeded at 3120 (offset -36 lines).
> Patch gcc-flags-for-build.patch does not apply (enforce with -f)
>
> ERROR: Error in executing python function in:
> /opt/local/oe_mb/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb
> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
> ERROR: Printing the environment of the function
> ERROR: Function patch_do_patch failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /opt/local/oe_mb/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb do_pat=
ch
> failed
> ERROR: Task 707
> (/opt/local/oe_mb/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb,
> do_patch) failed with 256
> FATAL: Execution of 'quilt
> --quiltrc=3D/opt/local/oe_mb/tmp/sysroots/x86_64-linux/usr/bin/quiltrc pu=
sh'
> failed with exit code 1:
> Applying patch gcc-flags-for-build.patch
> patching file Makefile.def
> patching file gcc/Makefile.in
> Hunk #1 succeeded at 755 (offset -11 lines).
> patching file gcc/configure.ac
> Hunk #1 succeeded at 1774 (offset -24 lines).
> patching file Makefile.in
> patching file gcc/configure
> Hunk #1 succeeded at 705 (offset -2 lines).
> Hunk #2 succeeded at 10912 (offset -71 lines).
> Hunk #3 succeeded at 10920 (offset -71 lines).
> Hunk #4 FAILED at 17111.
> Hunk #5 FAILED at 17217.
> 2 out of 5 hunks FAILED -- rejects in file gcc/configure
> patching file Makefile.tpl
> patching file configure
> Hunk #2 succeeded at 7950 (offset -87 lines).
> Hunk #3 succeeded at 8016 (offset -87 lines).
> patching file configure.ac
> Hunk #1 succeeded at 3053 (offset -36 lines).
> Hunk #2 succeeded at 3120 (offset -36 lines).
> Patch gcc-flags-for-build.patch does not apply (enforce with -f)
>
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> virtual:native:/opt/local/oe_mb/openembedded/recipes/bison/bison_2.4.3.bb
> do_configure failed
> ----------------------------------------------------------------
>
> Moreover, those are all things which I hacked in several files of OE to g=
et
> this point where I am:
>
> local.conf ->
> ----------------------------------------------------------------
> MACHINE =3D "xilinx-ml605"
> TARGET_ARCH =3D "microblaze"
> TARGET_CPU =3D "microblaze"
> TARGET_TUNE =3D "microblaze"
> XILINX_BSP_PATH =3D
> XILINX_BOARD =3D "ml507"
> ...
> ----------------------------------------------------------------
>
> xilinx-ml605.conf ->
> ----------------------------------------------------------------
> TARGET_ARCH =3D "microblaze"
> TARGET_CPU =3D "microblaze"
> TARGET_TUNE =3D "microblaze"
> TARGET_FPU =3D "soft"
> #tune for the microblaze cpu
> require conf/machine/include/tune-microblaze.inc
> PREFERRED_PROVIDER_virtual/kernel =3D "linux-xilinx"
> KERNEL_IMAGETYPE =3D "uImage"
> MACHINE_FEATURES =3D "kernel26 apm ext2 vfat ethernet screen"
> MACHINE_EXTRA_RECOMMENDS =3D "kernel-modules"
> UBOOT_ENTRYPOINT ?=3D "0x00000000"
> UBOOT_LOADADDRESS ?=3D "0x00000000"
> PREFERRED_VERSION_u-boot_xilinx-virtex5 =3D "u-boot-xilinx"
> ...
> ----------------------------------------------------------------
>
> siteinfo.bbclass ->
> ----------------------------------------------------------------
> def siteinfo_data(d):
> =C2=A0 =C2=A0archinfo =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0...
> =C2=A0 =C2=A0 =C2=A0 =C2=A0"ppc64": "endian-big bit-64 powerpc-common pow=
erpc64-linux",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0"microblaze": "endian-big bit-32 powerpc-commo=
n",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0"sh3": "endian-little bit-32 sh-common",
> =C2=A0 =C2=A0}

microblaze is not powerpc. So you have that part wrong here.

>
> ...
> ----------------------------------------------------------------
>
> xilinx-bsp.bbclass ->
> ----------------------------------------------------------------
> def map_target(a, d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0import re
> =C2=A0 =C2=A0 =C2=A0 =C2=A0board =3D bb.data.getVar('XILINX_BOARD', d, 1)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu =3D bb.data.getVar('TARGET_CPU', d, 1)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if re.match('powerpc', a):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 'ppc' + cpu=
 + '-' + board
> =C2=A0 =C2=A0 =C2=A0 =C2=A0elif re.match('microblaze', a):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 'microblaze=
' + '-' + board
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 'system'
>
> ...
> ----------------------------------------------------------------
>
> kernel-arch.bbclass ->
> ----------------------------------------------------------------
> valid_archs =3D "alpha cris ia64 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m68knommu m68k ppc power=
pc ppc64 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 microblaze =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sparc sparc64 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...
> ...
> ----------------------------------------------------------------
>
> gcc-4.5.inc ->
> ----------------------------------------------------------------
> # BRANCH =3D "gcc-4_5-branch"
> BRANCH =3D "microblaze"
> PR_append =3D "+svnr${SRCPV}"
> ...


This is the problem for your gcc issue above. OE gcc tracks the
gcc-4_5-branch and all patches are based on that
if you change the branch to something else then obviously patches wont
apply. You have two options here
if microblaze branch has distinct patches then apply them to 4_5
branch otherwise write new recipes for gcc which
use the microblaze branch.

Hope that helps.

> ----------------------------------------------------------------
>
> Would you please let me know where the source of problem might be and how=
 I
> may supposed to resolve it?
>
> Thanks in advanced.
>
> Best regards,
> Ali
>
>
> ----------------------------------------------------------------
> This message was sent using IMP, the Internet Messaging Program.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


