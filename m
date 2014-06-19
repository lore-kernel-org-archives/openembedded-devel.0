Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7816FCAD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 19:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id DA9713A079AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 15:58:56 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 7SqPapVr2Qb3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 15:58:52 -0400 (EDT)
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.rogue-research.com (Postfix) with ESMTPSA id 3796F3A079A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 15:58:52 -0400 (EDT)
Received: by mail-vc0-f179.google.com with SMTP id id10so2685666vcb.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 12:58:51 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.58.196.231 with SMTP id ip7mr2435119vec.47.1403207931517;
	Thu, 19 Jun 2014 12:58:51 -0700 (PDT)
Received: by 10.58.46.129 with HTTP; Thu, 19 Jun 2014 12:58:51 -0700 (PDT)
Date: Thu, 19 Jun 2014 15:58:51 -0400
Message-ID: <CACgAsMf4yz8NQF7kiQn4HVmvQkCkWBPt2+kO7nr3QprcivViCA@mail.gmail.com>
From: =?UTF-8?Q?Kevyn=2DAlexandre_Par=C3=A9?= <kapare@rogue-research.com>
To: openembedded-devel@lists.openembedded.org
Subject: [yocto][meta-qt5][daisy] ERROR meta-toochain-qt5
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
X-List-Received-Date: Thu, 19 Jun 2014 19:58:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Any idea?

# bitbake meta-toolchain-qt5
Loading cache: 100%
|########################################################################################################################################################################|
ETA:  00:00:00
Loaded 2302 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.22.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "overo"
DISTRO            = "poky"
DISTRO_VERSION    = "1.6.1"
TUNE_FEATURES     = "armv7a vfp neon"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "(nobranch):db6819b0c353479af50058a7f209836e3c1cb4bf"
meta-gnome
meta-oe
meta-xfce
meta-systemd
meta-networking
meta-multimedia
meta-ruby         = "(nobranch):dca466c074c9a35bc0133e7e0d65cca0731e2acf"
meta-gumstix      = "master:ee8f9454fbd461e2f32710eb7c35dcd82893aa9e"
meta-gumstix-extras = "(nobranch):82b92454ffbeda031aa3a93e79247818da960880"
meta-ros          = "(nobranch):821427d23adb33674da76dc34d8ab6983590fcd4"
meta-nirs         = "(nobranch):db6819b0c353479af50058a7f209836e3c1cb4bf"
meta-qt5          = "daisy:0137274b13a568718e441f8f1c611a653db9f2f7"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-eglibc/2.19-r0/packages-split/nativesdk-nscd/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/sbin/nscd'
has relocations in .text
WARNING: QA Issue: gcc-cross-canadian-arm: found library in wrong
location: /opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.2/liblto_plugin.so.0
gcc-cross-canadian-arm: found library in wrong location:
/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.2/liblto_plugin.so.0.0.0
gcc-cross-canadian-arm: found library in wrong location:
/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.2/liblto_plugin.so
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu
/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/lib/qemu/qemu-bridge-helper'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu
/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-arm'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu
/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-ga' has
relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu
/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-ppc' has
relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu
/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-x86_64'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu
/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-mipsel' has
relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu
/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-i386' has
relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu
/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-mips'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-io'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-i386'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-mipsel'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-nbd'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-x86_64'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-arm'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-img'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-ppc'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-mips.real'
has relocations in .text
ERROR: Unable to install packages. Command
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/sysroots/x86_64-linux/usr/bin/smart
--data-dir=/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/meta-toolchain-qt5/1.0-r0/sdk/image/opt/poky/1.6.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/var/lib/smart
install -y packagegroup-core-standalone-sdk-target-dbg@all
packagegroup-core-standalone-sdk-target@all
packagegroup-qt5-toolchain-target@all' returned 1:
Loading cache...
Updating cache...               ######################################## [100%]

Computing transaction...error: Can't install
qtwebkit-dev-5.2.1-r0@armv7a_vfp_neon: no package provides qtwebkit =
5.2.1-r0


ERROR: Function failed: do_populate_sdk
ERROR: Logfile of failure stored in:
/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/meta-toolchain-qt5/1.0-r0/temp/log.do_populate_sdk.32315
ERROR: Task 7 (/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/poky/meta-qt5/recipes-qt/meta/meta-toolchain-qt5.bb,
do_populate_sdk) failed with exit code '1'
NOTE: Tasks Summary: Attempted 4312 tasks of which 3693 didn't need to
be rerun and 1 failed.
No currently running tasks (4312 of 4313)

Summary: 1 task failed:
  /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/poky/meta-qt5/recipes-qt/meta/meta-toolchain-qt5.bb,
do_populate_sdk
Summary: There were 19 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.


LOG:http://pastebin.com/xXtkFMXf

BR,

-KA

-KA

