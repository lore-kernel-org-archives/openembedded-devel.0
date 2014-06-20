Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id C181B70180
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 23:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id DE1D43A164AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 19:41:52 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id EeNtmVAfOT6c
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 19:41:49 -0400 (EDT)
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.rogue-research.com (Postfix) with ESMTPSA id 052B43A1649F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 19:41:48 -0400 (EDT)
Received: by mail-wi0-f173.google.com with SMTP id cc10so1536525wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 16:41:47 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.194.90.77 with SMTP id bu13mr8116941wjb.92.1403307707587;
	Fri, 20 Jun 2014 16:41:47 -0700 (PDT)
Received: by 10.180.205.175 with HTTP; Fri, 20 Jun 2014 16:41:47 -0700 (PDT)
In-Reply-To: <CACgAsMf4yz8NQF7kiQn4HVmvQkCkWBPt2+kO7nr3QprcivViCA@mail.gmail.com>
References: <CACgAsMf4yz8NQF7kiQn4HVmvQkCkWBPt2+kO7nr3QprcivViCA@mail.gmail.com>
Date: Fri, 20 Jun 2014 19:41:47 -0400
Message-ID: <CACgAsMdy3pBxucP-VU=_JxkhuzAoXAwNHW9vsyrDjso0eHLXxA@mail.gmail.com>
From: =?UTF-8?Q?Kevyn=2DAlexandre_Par=C3=A9?= <kapare@rogue-research.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [yocto][meta-qt5][daisy] ERROR meta-toochain-qt5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jun 2014 23:41:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

http://lists.openembedded.org/pipermail/openembedded-devel/2014-February/09=
4113.html

I add "inherit populate_sdk_qt5" into my image recipe.

bitbake -c populate_sdk <image>

But still have issue with it:
Computing transaction...error: Can't install
packagegroup-qt5-toolchain-target-1.0-r0@all: no package provides
qtwebkit-qmlplugins
LOG: http://pastebin.com/LuF1Vdki

BR,

-KA

On Thu, Jun 19, 2014 at 3:58 PM, Kevyn-Alexandre Par=C3=A9
<kapare@rogue-research.com> wrote:
> Hi,
>
> Any idea?
>
> # bitbake meta-toolchain-qt5
> Loading cache: 100%
> |########################################################################=
###########################################################################=
#####################|
> ETA:  00:00:00
> Loaded 2302 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        =3D "1.22.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "Ubuntu-12.04"
> TARGET_SYS        =3D "arm-poky-linux-gnueabi"
> MACHINE           =3D "overo"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "1.6.1"
> TUNE_FEATURES     =3D "armv7a vfp neon"
> TARGET_FPU        =3D "vfp-neon"
> meta
> meta-yocto        =3D "(nobranch):db6819b0c353479af50058a7f209836e3c1cb4b=
f"
> meta-gnome
> meta-oe
> meta-xfce
> meta-systemd
> meta-networking
> meta-multimedia
> meta-ruby         =3D "(nobranch):dca466c074c9a35bc0133e7e0d65cca0731e2ac=
f"
> meta-gumstix      =3D "master:ee8f9454fbd461e2f32710eb7c35dcd82893aa9e"
> meta-gumstix-extras =3D "(nobranch):82b92454ffbeda031aa3a93e79247818da960=
880"
> meta-ros          =3D "(nobranch):821427d23adb33674da76dc34d8ab6983590fcd=
4"
> meta-nirs         =3D "(nobranch):db6819b0c353479af50058a7f209836e3c1cb4b=
f"
> meta-qt5          =3D "daisy:0137274b13a568718e441f8f1c611a653db9f2f7"
>
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-eglibc/2.19-r0/p=
ackages-split/nativesdk-nscd/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/u=
sr/sbin/nscd'
> has relocations in .text
> WARNING: QA Issue: gcc-cross-canadian-arm: found library in wrong
> location: /opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-p=
oky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.2/liblto_plugin.so.0
> gcc-cross-canadian-arm: found library in wrong location:
> /opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-=
gnueabi/gcc/arm-poky-linux-gnueabi/4.8.2/liblto_plugin.so.0.0.0
> gcc-cross-canadian-arm: found library in wrong location:
> /opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-=
gnueabi/gcc/arm-poky-linux-gnueabi/4.8.2/liblto_plugin.so
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu
> /opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/lib/qemu/qemu-bridge-he=
lper'
> has relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu
> /opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-arm'
> has relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu
> /opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-ga' has
> relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu
> /opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-ppc' has
> relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu
> /opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-x86_64'
> has relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu
> /opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-mipsel' has
> relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu
> /opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-i386' has
> relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu
> /opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-mips'
> has relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/us=
r/bin/qemu-io'
> has relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/us=
r/bin/qemu-system-i386'
> has relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/us=
r/bin/qemu-system-mipsel'
> has relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/us=
r/bin/qemu-nbd'
> has relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/us=
r/bin/qemu-x86_64'
> has relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/us=
r/bin/qemu-arm'
> has relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/us=
r/bin/qemu-img'
> has relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/us=
r/bin/qemu-system-ppc'
> has relocations in .text
> WARNING: QA Issue: ELF binary
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/pa=
ckages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/us=
r/bin/qemu-mips.real'
> has relocations in .text
> ERROR: Unable to install packages. Command
> '/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/s=
rc/build/tmp/sysroots/x86_64-linux/usr/bin/smart
> --data-dir=3D/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/y=
octo_build/src/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/meta-toolc=
hain-qt5/1.0-r0/sdk/image/opt/poky/1.6.1/sysroots/armv7a-vfp-neon-poky-linu=
x-gnueabi/var/lib/smart
> install -y packagegroup-core-standalone-sdk-target-dbg@all
> packagegroup-core-standalone-sdk-target@all
> packagegroup-qt5-toolchain-target@all' returned 1:
> Loading cache...
> Updating cache...               ######################################## =
[100%]
>
> Computing transaction...error: Can't install
> qtwebkit-dev-5.2.1-r0@armv7a_vfp_neon: no package provides qtwebkit =3D
> 5.2.1-r0
>
>
> ERROR: Function failed: do_populate_sdk
> ERROR: Logfile of failure stored in:
> /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/sr=
c/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/meta-toolchain-qt5/1.0-=
r0/temp/log.do_populate_sdk.32315
> ERROR: Task 7 (/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point=
/yocto_build/src/poky/meta-qt5/recipes-qt/meta/meta-toolchain-qt5.bb,
> do_populate_sdk) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4312 tasks of which 3693 didn't need to
> be rerun and 1 failed.
> No currently running tasks (4312 of 4313)
>
> Summary: 1 task failed:
>   /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/=
src/poky/meta-qt5/recipes-qt/meta/meta-toolchain-qt5.bb,
> do_populate_sdk
> Summary: There were 19 WARNING messages shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
>
>
> LOG:http://pastebin.com/xXtkFMXf
>
> BR,
>
> -KA
>
> -KA

