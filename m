Return-Path: <enelson1000@comcast.net>
Received: from qmta02.emeryville.ca.mail.comcast.net
	(qmta02.emeryville.ca.mail.comcast.net [76.96.30.24])
	by mail.openembedded.org (Postfix) with ESMTP id 880E46BC8C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 04:24:30 +0000 (UTC)
Received: from omta01.emeryville.ca.mail.comcast.net ([76.96.30.11])
	by qmta02.emeryville.ca.mail.comcast.net with comcast
	id fgP01n0020EPchoA2gQXET; Thu, 20 Mar 2014 04:24:31 +0000
Received: from [192.168.0.100] ([67.180.186.245])
	by omta01.emeryville.ca.mail.comcast.net with comcast
	id fgQW1n00B5J6Mc38MgQWJi; Thu, 20 Mar 2014 04:24:31 +0000
Message-ID: <532A6D78.3050000@comcast.net>
Date: Wed, 19 Mar 2014 21:24:24 -0700
From: ed nelson <enelson1000@comcast.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1395289471;
	bh=4sy+6QzcspONx82MDiNfFq7fR4H+1Qpwd09DosbLCko=;
	h=Received:Received:Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type;
	b=ss9Qu9Pc6iA81UBT9ltzof23MAf7jwkjWKZGf7tIM4QxOgC6pdQmzRla8mKxQ0tZ0
	E50/GDtlhsBhUC3DQ07Ian2oWlVosNBRpfRsjDatRHqLeGIcz+6z68GGnLDQCsMj47
	zLkdknDWzkQOJz1rWJ/ExQQO62KE+p/ZxkXdxy04r3/YjGieBMtn1vIGN5Qyeekx9y
	vyacT3MDbxTjAXIPziBvUXY7AmuShZ+t28L+bCg+4aPFciN8MTMZlGA6roprFy0aJn
	ASvEXvToJk/6TbfKGmcPhZ13T/nRsNRa2ufskurwiZNK2TSYOPuNO69LYk6yftaY1Y
	ecZT/AKN+ozFQ==
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: barebox builds OK but hangs on target at91sam9g20 board
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
X-List-Received-Date: Thu, 20 Mar 2014 04:24:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am trying to run barebox version 2013.02 on an AT91SAM9g20 board. I 
have downloaded barebox from the linux4sam github (barebox-at91) and 
have successfully compiled using the CodeSourcery Lite and successfully 
ran barebox on the target AT91sam9g20 board from an SD card.
I then tried to build barebox using yocto poky dylan 9.0.1 and started 
with the bitbake recipe in meta-fsl-arm. I made a few minor changes to 
barebox_2012.02.0bb file and barebox.inc.  I am able to build barebox 
with no errors but when I install on sd card the board hangs at the 
beginning of the boot.  I have compared the tags on barebox branch 
downloaded from the linux4sam git to the yocto fetched git and they 
match.  When I compare the compiled zbarebox.bin files the one built by 
yocto is smaller in size then the one built by Codesourcery Lite.  The 
defconfig files and the .conf files are the same.

It seems like there is something that I have not setup correctly in the 
bitbake file or machine config?  Anyone have any ideas?

Here is OK boot of barebox
RomBOOT


AT91Bootstrap 3.6.1-00078-g5415d4e-dirty (Sat Mar 15 23:25:08 PDT 2014)

SD/MMC: Image: Read file u-boot.bin to 0x21f00000
SD: Card Capacity: Standard
SD/MMC: Done to load image


barebox 2013.02.0-dirty #1 Wed Mar 19 19:19:45 PDT 2014


Board: Calao QIL-A9G20
AT91: Detected soc type: at91sam9g20
AT91: Detected soc subtype: Unknown
Clocks: CPU 399 MHz, master 133 MHz, main 12.000 MHz
registered netconsole as cs4
atmel_nand: Use On Flash BBT
nand: nand_get_flash_type: second ID read did not match 02,02 against ff,09
nand: No NAND device found (-19)!
atmel_nand atmel_nand0: probe failed: No error
atmel_mci atmel_mci0: version: 0x210
atmel_mci atmel_mci0: registered as atmel_mci0
mci mci0: registered disk0
mdio_bus: miibus0: probed
macb macb0: Cadence MACB at 0xfffc4000
at91_udc at91_udc0: at91_udc version 3 May 2006
malloc space: 0x23b00000 -> 0x23efffff (size 4 MiB)
running /env/bin/init...

Hit any key to stop autoboot:  0

At this point the kernel will load and the rootfs will load and run.  
Both built with yocto/poky
======
Here is bad boot
RomBOOT


AT91Bootstrap 3.6.1-00078-g5415d4e-dirty (Sat Mar 15 23:25:08 PDT 2014)

SD/MMC: Image: Read file u-boot.bin to 0x21f00000
SD: Card Capacity: Standard
SD/MMC: Done to load image


barebox 2013.02.0-dirty #1 Wed Mar 19 19:25:45 PDT 2014


Board: Calao QIL-A9G20
AT91: Detected soc type: at91sam9g20
AT91: Detected soc subtype: Unknown
Clocks: CPU 399 MHz, master 133 MHz, main 12.000 MHz

Hangs here


=====
My system
ed@ed-Aspire-5560:~/arm-dev/yocto/poky-dylan-9.0.2/build-calao$ bitbake 
barebox
Loading cache: 100% 
|####################################################################################################| 
ETA:  00:00:00
Loaded 1698 entries from dependency cache.

Build Configuration:
BB_VERSION        = "1.18.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "qil-a9g20"
DISTRO            = "poky"
DISTRO_VERSION    = "1.4.1"
TUNE_FEATURES     = "armv5 thumb dsp arm926ejs"
TARGET_FPU        = "soft"
meta-calao        = "master:619d152871676ecce5b282463d412464150c123a"
meta-oe           = "dylan:cb182019c4f7485713cb50623240c01882448ffd"
meta-java         = "dora:9dfb7ecb87e67052e94641d6e02907c582264217"
meta
meta-yocto
meta-yocto-bsp    = "dylan-9.0.1:73f103bf9b2cdf985464dc53bf4f1cfd71d4531f"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 549 tasks of which 533 didn't need to be 
rerun and all succeeded.

I then copy the zbarebox.bin located under barebox/arch/arm/pbl to sd 
card.   I also used file in the deploy directory (both the same) and had 
same problem.

==========
barebox.inc
DESCRIPTION = "Barebox - a bootloader that inherits the best of U-Boot 
and the Linux kernel"
HOMEPAGE = "http://www.barebox.org/"
SECTION = "bootloader"
PROVIDES = "virtual/bootloader"
PRIORITY = "optional"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=057bf9e50e1ca857d0eb97bfe4ba8e5d"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit kernel-arch

EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"

BAREBOX_BINARY ?= "zbarebox.bin"
BAREBOX_IMAGE ?= "barebox-${MACHINE}-${PV}-${PR}.bin"
BAREBOXENV_BIN ?= "bareboxenv-${MACHINE}-${PV}-${PR}.bin"
BAREBOX_SYMLINK ?= "barebox-${MACHINE}.bin"
BAREBOXENV_SYMLINK ?= "bareboxenv-${MACHINE}.bin"

INSANE_SKIP_${PN} = "True"

do_pre_configure() {
        cp ${WORKDIR}/defconfig ${S}/.config
        oe_runmake oldconfig
}
addtask pre_configure before do_configure after do_patch

do_compile () {
     if [ "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', 
'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
         sed -i 's/$(CROSS_COMPILE)ld/$(CROSS_COMPILE)ld.bfd/g' Makefile
     fi
     unset LDFLAGS
     unset CFLAGS
     unset CPPFLAGS
     oe_runmake all
}

do_deploy () {
     install -d ${DEPLOY_DIR_IMAGE}
     install ${S}/${BAREBOX_BINARY} ${DEPLOY_DIR_IMAGE}/${BAREBOX_IMAGE}

     cd ${DEPLOY_DIR_IMAGE}
     rm -f ${BAREBOX_SYMLINK}
     ln -sf ${BAREBOX_IMAGE} ${BAREBOX_SYMLINK}

     install -d ${STAGING_BINDIR_NATIVE}
     cd ${S}
     install -m 755 scripts/mkimage ${STAGING_BINDIR_NATIVE}/
     install -m 755 scripts/bareboxenv ${STAGING_BINDIR_NATIVE}/
}

do_deploy[dirs] = "${S}"
addtask deploy before do_build after do_compile

do_env_deploy() {
     install ${S}/common/barebox_default_env 
${DEPLOY_DIR_IMAGE}/${BAREBOXENV_BIN}

     cd ${DEPLOY_DIR_IMAGE}
     rm -f ${BAREBOXENV_SYMLINK}
     ln -sf ${BAREBOXENV_BIN} ${BAREBOXENV_SYMLINK}
}
addtask env_deploy before do_build after do_deploy



=====
barebox_2013.02.0.bb
require recipes-bsp/barebox/barebox.inc

BBBRANCH = "barebox-2013.01-next-at91"
BAREBOX_VERSION ?= "2013.02.0"
BAREBOX_BINARY = "barebox-flash-image"
BAREBOX_DEFCONFIG = "qil_a9g20_defconfig"

S = "${WORKDIR}/git"



# Override SRC_URI in a bbappend file to point at a different source
# tree if you do not want to build from Linus' tree.
SRC_URI = 
"git://github.com/linux4sam/barebox-at91.git;branch=${BBBRANCH};protocol=git"
SRC_URI += 
"file://${MACHINE}/${BBBRANCH}/barebox-2013-next-at91-calao-a9g20.patch"
SRC_URI += "file://${MACHINE}/${BBBRANCH}/defconfig"


# Override SRCREV to point to a different commit in a bbappend file to
# build a different release of the Linux kernel.
SRCREV="2d24be5514ace86f4b0750420ce7c3a337e47caa"
#PV = "${BAREBOX_VERSION}+${SRCREV}"
PV = "${BAREBOX_VERSION}"
PR = "r0"


# Override COMPATIBLE_MACHINE to include your machine in a bbappend
# file. Leaving it empty here ensures an early explicit build failure.
COMPATIBLE_MACHINE = "(sama5d3xek|at91sam9x5ek|qil-a9g20)"


python () {
     if not d.getVar("BAREBOX_MACHINE", True):
         PN = d.getVar("PN", True)
         FILE = os.path.basename(d.getVar("FILE", True))
         bb.debug(1, "To build %s, see %s for instructions on \
                  setting up your machine config" % (PN, FILE))
         raise bb.parse.SkipPackage("BAREBOX_MACHINE is not set in the 
%s machine configuration." %
d.getVar("MACHINE", True))
}


do_pre_configure() {
     cp ${WORKDIR}/${MACHINE}/${BBBRANCH}/defconfig ${S}/.config
     oe_runmake ${BAREBOX_DEFCONFIG}
}


do_env_deploy() {
}


Thanks
Ed

