Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1MgItt-0004UG-10
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 15:50:57 +0200
Received: by ewy21 with SMTP id 21so313094ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 06:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type;
	bh=xjAACexCSJImsfeuCIO7PpAsms5RA7HU6mVIdaeHgGo=;
	b=Rk3hmTwUq+xFGyrIv3gM0ymo3ron6KytJkZ9Dt3S9JGRQvBHpJ6KRqHICgiLEcNkdp
	CJu0d18uO2q/Htk4R/ETQcddBe5co8BWhEV1/85I8BJE0izHrdozgMh9S7xQYD/mJ520
	lbI8SLiLAEIBGKHOKvDU/gtq1iD5pOD/HYd6A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type;
	b=EE1Y5SoI+p9miH7kSF9k6BJdAPrKhe4PYcnDoALRCns9lvmJdLjLrGhXn9ozNrvnvT
	1mDmFF0lrqqK99i08X/sMeJk7+5w+XJ/sRrKdPcJcsdpaDctDCdILGIxWU7mevwymH8s
	7YCcD/u1u2AzX3dgUu+g02NRKEfgpj/jhQHPY=
Received: by 10.211.165.10 with SMTP id s10mr618542ebo.62.1251293577931;
	Wed, 26 Aug 2009 06:32:57 -0700 (PDT)
Received: from ?192.168.0.7? ([94.180.47.99])
	by mx.google.com with ESMTPS id 10sm2817287eyz.9.2009.08.26.06.32.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Aug 2009 06:32:48 -0700 (PDT)
Message-ID: <4A9539AA.3070306@gmail.com>
Date: Wed, 26 Aug 2009 19:33:30 +0600
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Strange do_patch behaviour
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
X-List-Received-Date: Wed, 26 Aug 2009 13:50:57 -0000
Content-Type: multipart/mixed; boundary="------------090506090908000702010906"

--------------090506090908000702010906
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm still working on building OE for Phytec LPC3250 (local.conf 
attached) and faced following thing:

I've created patch file from working 2.6.27.8 kernel sources (make 
distclean and diff -Nurd then), moved it to 
'recipes/linux/linux-2.6.27.8/phy3250/', copied working .config to 
'recipes/linux/linux-2.6.27.8/phy3250/defconfig', created 2.6.27.8 
recipe based on 2.6.27 (attached). When I try to run builded kernel 
('bitbake virtual/kernel') on target board I get kernel panic (not 
syncing: Attempted to kill init). Digged a little and found that 
standard sources with applied patch differs from fetched, unpacked and 
patched by bitbake sources, that lies at 
tmp/work/phy3250-oe-linux-gnueabi/linux-2.6.27.8-r1/linux-2.6.27.8. It's 
rather strange for me, because tail of 'bitbake virtual/kernel -v -DD -c 
patch' is following:
------------
NOTE: Running task 36 of 36 (ID: 3, 
/home/raydan/work/oe/openembedded/recipes/linux/linux_2.6.27.8.bb, do_patch)
DEBUG: Parsing 
/home/raydan/work/oe/openembedded/recipes/linux/linux_2.6.27.8.bb (full)
DEBUG: BB 
/home/raydan/work/oe/openembedded/recipes/linux/linux_2.6.27.8.bb: 
handle(data)
DEBUG: BB linux.inc: handle(data, include)
DEBUG: BB :0: inheriting classes/kernel.bbclass
DEBUG: BB classes/kernel.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/linux-kernel-base.bbclass
DEBUG: BB classes/linux-kernel-base.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/module_strip.bbclass
DEBUG: BB classes/module_strip.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/kernel-arch.bbclass
DEBUG: BB classes/kernel-arch.bbclass: handle(data, include)
DEBUG: setVarFlag(kernel_do_compile, depends, ${INITRAMFS_TASK}, data)
DEBUG: setVarFlag(do_menuconfig, nostamp, 1, data)
DEBUG: BB :0: inheriting classes/cml1.bbclass
DEBUG: BB classes/cml1.bbclass: handle(data, include)
DEBUG: setVarFlag(do_deploy, dirs, ${S}, data)
DEBUG: update_data()
DEBUG: update_data()
DEBUG: Executing task do_patch
DEBUG: update_data()
DEBUG: 
mkdirhier(/home/raydan/work/oe/build/tmp/work/phy3250-oe-linux-gnueabi/linux-2.6.27.8-r1)
DEBUG: 
mkdirhier(/home/raydan/work/oe/build/tmp/work/phy3250-oe-linux-gnueabi/linux-2.6.27.8-r1)
NOTE: Applying patch 'phy3250.patch' 
(../openembedded/recipes/linux/linux-2.6.27.8/phy3250/phy3250.patch)
DEBUG: 
mkdirhier(/home/raydan/work/oe/build/tmp/stamps/phy3250-oe-linux-gnueabi)
NOTE: Tasks Summary: Attempted 36 tasks of which 35 didn't need to be 
rerun and 0 failed.
------------
And looks like bitbake did nothing except patching, but actually it does 
(diff between manually and bitbake patched dirs is ~30000 strings, and I 
decided not to attach it:)) and as a result builded kernel fails with 
kernel panic. Diff shows, that '.pc' dir is created (and some files in 
it are forbidden for any access (0000 rights)) and not only it -- some 
other files like in arch/arm or sound/soc/lpc3xxx/ differs too. Tried to 
remove tmp/ and rebuild -- same result.

Could anybody explain this strange behaviour? I thought that patch task 
should only execute 'patch' command.

P.S.: openembedded stable/2009, bitbake 1.8.12-1 from Debian rep.

-- 
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>

#
# local.conf
#
# Author: Dmitry Vinokurov <raydan@permlug.org>
#


DL_DIR = "${HOME}/sources"
BBFILES := "${HOME}/work/oe/openembedded/recipes/*/*.bb"
BBMASK = ""

ASSUME_PROVIDED += " virtual/libc "
#ASSUME_PROVIDED += " linux-libc-headers "
ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-initial "
ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-intermediate "
ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}binutils "
#ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}libc-for-gcc "

MACHINE = "phy3250"

DISTRO = "minimal"

#CCACHE = "ccache "
CCACHE = " "

TOOLCHAIN_BASE_PATH = "/opt/nxp/gcc-4.3.2-glibc-2.7"
TOOLCHAIN_PATH = "${TOOLCHAIN_BASE_PATH}/arm-vfp-linux-gnu"

export CC="${CCACHE}${TOOLCHAIN_BASE_PATH}/bin/arm-vfp-linux-gnu-gcc "
export CXX="${CCACHE}${TOOLCHAIN_BASE_PATH}/bin/arm-vfp-linux-gnu-g++ "
export CPP="${TOOLCHAIN_BASE_PATH}/bin/arm-vfp-linux-gnu-gcc -E "
export LD="${TOOLCHAIN_BASE_PATH}/bin/arm-vfp-linux-gnu-ld "
export AR="${TOOLCHAIN_BASE_PATH}/bin/arm-vfp-linux-gnu-ar "
export AS="${TOOLCHAIN_BASE_PATH}/bin/arm-vfp-linux-gnu-as "
export NM="${TOOLCHAIN_BASE_PATH}/bin/arm-vfp-linux-gnu-nm "
export RANLIB="${TOOLCHAIN_BASE_PATH}/bin/arm-vfp-linux-gnu-ranlib "
export STRIP="${TOOLCHAIN_BASE_PATH}/bin/arm-vfp-linux-gnu-strip "
export OBJCOPY="${TOOLCHAIN_BASE_PATH}/bin/arm-vfp-linux-gnu-objcopy "
export OBJDUMP="${TOOLCHAIN_BASE_PATH}/bin/arm-vfp-linux-gnu-objdump "

TARGET_CPPFLAGS_append = " -I${TOOLCHAIN_PATH}/include "
TARGET_LDFLAGS_prepend = " -L${TOOLCHAIN_PATH}/lib -Wl,-rpath-link,${TOOLCHAIN_PATH}/lib "

KERNEL_IMAGETYPE = "uImage"

HOST_PREFIX="${CCACHE}${TOOLCHAIN_BASE_PATH}/bin/arm-vfp-linux-gnu-"
UBOOT_ENTRYPOINT = "80008000"

require linux.inc

PR = "r1"

# Mark archs/machines that this kernel supports
DEFAULT_PREFERENCE = "-1"
DEFAULT_PREFERENCE_phy3250 = "1"

SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
           file://defconfig "

SRC_URI_append_phy3250 = "file://phy3250.patch;patch=1"


--------------090506090908000702010906--
