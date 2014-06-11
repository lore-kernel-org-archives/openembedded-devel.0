Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id AAF9360E23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 14:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id 1EC3939A41E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 10:53:18 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id kxVZs-rv4OyH
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 10:53:14 -0400 (EDT)
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.rogue-research.com (Postfix) with ESMTPSA id 88F5B39A41D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 10:53:14 -0400 (EDT)
Received: by mail-ve0-f181.google.com with SMTP id db11so5626333veb.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 07:53:13 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.220.190.197 with SMTP id dj5mr39264494vcb.19.1402498393834; 
	Wed, 11 Jun 2014 07:53:13 -0700 (PDT)
Received: by 10.58.46.129 with HTTP; Wed, 11 Jun 2014 07:53:13 -0700 (PDT)
Date: Wed, 11 Jun 2014 10:53:13 -0400
Message-ID: <CACgAsMeDOnYgGBwCEoev8Pn6tgxBJ4btfwUqdEi2c8fSYG+gYA@mail.gmail.com>
From: =?UTF-8?Q?Kevyn=2DAlexandre_Par=C3=A9?= <kapare@rogue-research.com>
To: openembedded-devel@lists.openembedded.org, 
	Yocto discussion list <yocto@yoctoproject.org>
Subject: [Yocto] populate_sdk WARNING messages?
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
X-List-Received-Date: Wed, 11 Jun 2014 14:53:20 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Any thought on why I'm having so many warnings when executing
populate_sdk? Should I worry?

yocto_build/src/build$ bitbake -c populate_sdk nirs-console-image
Loading cache: 100%
|########################################################################################################################################################################|
ETA:  00:00:00
Loaded 2249 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.22.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "overo"
DISTRO            = "poky"
DISTRO_VERSION    = "1.6"
TUNE_FEATURES     = "armv7a vfp neon"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "(nobranch):b8f6c7c794438fcfacef4fed8a9285f5dd2cb663"
meta-gnome
meta-oe
meta-xfce
meta-systemd
meta-networking
meta-multimedia   = "(nobranch):dca466c074c9a35bc0133e7e0d65cca0731e2acf"
meta-gumstix      = "(nobranch):ee8f9454fbd461e2f32710eb7c35dcd82893aa9e"
meta-gumstix-extras = "(nobranch):a80a576e65480c89f85e7583e071b6409bf3986c"
meta-ros          = "(nobranch):821427d23adb33674da76dc34d8ab6983590fcd4"
meta-nirs         = "(nobranch):b8f6c7c794438fcfacef4fed8a9285f5dd2cb663"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-eglibc/2.19-r0/packages-split/nativesdk-nscd/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/sbin/nscd'
has relocations in .text
WARNING: QA Issue: gcc-cross-canadian-arm: found library in wrong
location: /opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.2/liblto_plugin.so.0
gcc-cross-canadian-arm: found library in wrong location:
/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.2/liblto_plugin.so.0.0.0
gcc-cross-canadian-arm: found library in wrong location:
/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.2/liblto_plugin.so
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/lib/qemu/qemu-bridge-helper'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-arm'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-ga'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-ppc'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-x86_64'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-mipsel'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-i386'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-mips'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-io'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-i386'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-mipsel'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-nbd'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-x86_64'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-arm'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-img'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-system-ppc'
has relocations in .text
WARNING: QA Issue: ELF binary
'/home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-qemu/1.7.0-r0/packages-split/nativesdk-qemu/opt/poky/1.6/sysroots/x86_64-pokysdk-linux/usr/bin/qemu-mips.real'
has relocations in .text
NOTE: Tasks Summary: Attempted 3493 tasks of which 2682 didn't need to
be rerun and all succeeded.

Summary: There were 19 WARNING messages shown.



BR,

-KA

