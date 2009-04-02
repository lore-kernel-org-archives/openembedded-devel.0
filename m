Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1LpJVg-0008CG-Ua
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 11:47:24 +0200
Received: by ewy20 with SMTP id 20so447836ewy.12
	for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 02:44:31 -0700 (PDT)
Received: by 10.216.28.85 with SMTP id f63mr2936309wea.142.1238665470919;
	Thu, 02 Apr 2009 02:44:30 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 10sm1186935eyz.59.2009.04.02.02.44.29
	(version=SSLv3 cipher=RC4-MD5); Thu, 02 Apr 2009 02:44:30 -0700 (PDT)
Message-ID: <49D488FC.3080803@xora.org.uk>
Date: Thu, 02 Apr 2009 10:44:28 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <49D3582F.4070304@xora.org.uk>
	<200904012342.38417.raj.khem@gmail.com>
In-Reply-To: <200904012342.38417.raj.khem@gmail.com>
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: klibc problems
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
X-List-Received-Date: Thu, 02 Apr 2009 09:47:24 -0000
Content-Type: multipart/mixed; boundary="------------090807040905050707010406"

--------------090807040905050707010406
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Wednesday 01 April 2009 05:03:59 Graeme Gregory wrote:
>   
>> Ok, its no mystery to some people that klibc has problems with modern
>> kernels.
>>
>> But I think we also have a problem with the package in OE. Seeing as
>> klibc is machine dependent in that it includes mach-XXX/include/mach/*.h
>> files it really should not be staged as part of the base arch. I think
>> we need to stage it into ${MACHINE_ARCH} the same was as the kernel is.
>>
>> We can then work on fixing the application compiles. 
>>     
>
> How much work this would be.
>
>   
Not sure, in theory its a new variable KLIBC_STAGING_DIR and a different
do_stage(), I guess this could be hidden in a klibc.bbclass.

>> I think I have a
>> suitable hack.
>>     
>
> post it.
>   
Attaching the changes to this message, they arent 100% complete but
should give an indication where I was going with them.

Basic workings of the hack are use the kernel Makefile to kick out what
machine the kernel was configured for. Then link that machine in the
include/ hierarchy of klibc.

Graeme

require klibc-common.inc

SRC_URI += "file://staging.patch;patch=1 \
	    file://klibc_kexecsyscall.patch;patch=1 \
	    "

PACKAGE_ARCH = "${MACHINE_ARCH}"

# we want only the shared programms and the lib so we chose them manually
do_install() {
        install -d ${D}${base_bindir}
        install -m 755 usr/dash/sh.shared ${D}${base_bindir}/sh
        install -m 755 usr/gzip/gzip ${D}${base_bindir}
        install -m 755 usr/kinit/kinit.shared ${D}${base_bindir}/kinit
        install -m 755 usr/kinit/fstype/shared/fstype ${D}${base_bindir}
        install -m 755 usr/kinit/ipconfig/shared/ipconfig ${D}${base_bindir}
        install -m 755 usr/kinit/nfsmount/shared/nfsmount ${D}${base_bindir}
        install -m 755 usr/kinit/resume/shared/resume ${D}${base_bindir}
        install -m 755 usr/kinit/run-init/shared/run-init ${D}${base_bindir}
	install -m 755 usr/utils/shared/cat ${D}${base_bindir}
        install -m 755 usr/utils/shared/chroot ${D}${base_bindir}
        install -m 755 usr/utils/shared/cpio ${D}${base_bindir}
        install -m 755 usr/utils/shared/dd ${D}${base_bindir}
        install -m 755 usr/utils/shared/false ${D}${base_bindir}
        install -m 755 usr/utils/shared/halt ${D}${base_bindir}
        install -m 755 usr/utils/shared/insmod ${D}${base_bindir}
        install -m 755 usr/utils/shared/kill ${D}${base_bindir}
        install -m 755 usr/utils/shared/ln ${D}${base_bindir}
        install -m 755 usr/utils/shared/minips ${D}${base_bindir}
        install -m 755 usr/utils/shared/mkdir ${D}${base_bindir}
        install -m 755 usr/utils/shared/mkfifo ${D}${base_bindir}
        install -m 755 usr/utils/shared/mknod ${D}${base_bindir}
        install -m 755 usr/utils/shared/mount ${D}${base_bindir}
        install -m 755 usr/utils/shared/nuke ${D}${base_bindir}
        install -m 755 usr/utils/shared/pivot_root ${D}${base_bindir}
        install -m 755 usr/utils/shared/poweroff ${D}${base_bindir}
        install -m 755 usr/utils/shared/readlink ${D}${base_bindir}
        install -m 755 usr/utils/shared/reboot ${D}${base_bindir}
        install -m 755 usr/utils/shared/sleep ${D}${base_bindir}
        install -m 755 usr/utils/shared/true ${D}${base_bindir}
        install -m 755 usr/utils/shared/umount ${D}${base_bindir}
        install -m 755 usr/utils/shared/uname ${D}${base_bindir}
	install -m 755 usr/utils/shared/modprobe ${D}${base_bindir}
	install -m 755 usr/utils/shared/losetup ${D}${base_bindir}
	install -m 755 usr/utils/shared/wc	${D}${base_bindir}

	install -d ${D}${base_libdir}
	install -m 755 usr/klibc/klibc-*.so ${D}${base_libdir}
	cd ${D}${base_libdir}
	ln -s klibc-*.so klibc.so
	cd -	
        cd ${D}${base_bindir}
	ln -s gzip gunzip
        ln -s gzip zcat
	cd -
}

export INST=${STAGING_DIR_TARGET}
do_stage() {
	oe_runmake  install
        cp '${STAGING_DIR_TARGET}/bin/klcc'  '${CROSS_DIR}/bin/${TARGET_PREFIX}klcc'
	KLIBC_MACHINE=`cat machine.tmp`
	ln -fs ${STAGING_KERNEL_DIR}/arch/${KLIBC_ARCH}/$KLIBC_MACHINE/include/mach ${D}${base_libdir}/klibc/include/mach
 
}

PACKAGES = "${PN} klibc-utils-sh klibc-utils-kinit \
	klibc-utils-fstype klibc-utils-ipconfig \
    	klibc-utils-nfsmount klibc-utils-resume \
	klibc-utils-run-init klibc-utils-cat \
	klibc-utils-chroot klibc-utils-cpio \
	klibc-utils-dd klibc-utils-false \
	klibc-utils-halt klibc-utils-insmod \
	klibc-utils-kill klibc-utils-ln \
	klibc-utils-minips klibc-utils-mkdir \
	klibc-utils-mkfifo klibc-utils-mknod \
        klibc-utils-mount klibc-utils-nuke \
        klibc-utils-pivot-root klibc-utils-poweroff \
	klibc-utils-readlink klibc-utils-reboot \
        klibc-utils-sleep klibc-utils-true \
        klibc-utils-umount klibc-utils-uname \
        klibc-utils-gzip klibc-utils-modprobe \
	klibc-utils-losetup klibc-utils-wc"

FILES_${PN} = "${base_libdir}/klibc*.so"	
FILES_klibc-utils-sh = "${base_bindir}/sh"
FILES_klibc-utils-gzip = "${base_bindir}/gzip ${base_bindir}/gunzip ${base_bindir}/zcat"
FILES_klibc-utils-kinit = "${base_bindir}/kinit"
FILES_klibc-utils-fstype = "${base_bindir}/fstype"
FILES_klibc-utils-ipconfig = "${base_bindir}/ipconfig"
FILES_klibc-utils-nfsmount = "${base_bindir}/nfsmount"
FILES_klibc-utils-resume = "${base_bindir}/resume"
FILES_klibc-utils-run-init = "${base_bindir}/run-init"
FILES_klibc-utils-cat = "${base_bindir}/cat"
FILES_klibc-utils-chroot = "${base_bindir}/chroot"
FILES_klibc-utils-cpio = "${base_bindir}/cpio"
FILES_klibc-utils-dd = "${base_bindir}/dd"
FILES_klibc-utils-false = "${base_bindir}/false"
FILES_klibc-utils-halt = "${base_bindir}/halt"
FILES_klibc-utils-insmod = "${base_bindir}/insmod"
FILES_klibc-utils-kill = "${base_bindir}/kill"
FILES_klibc-utils-ln = "${base_bindir}/ln"
FILES_klibc-utils-minips = "${base_bindir}/minips"
FILES_klibc-utils-mkdir = "${base_bindir}/mkdir"
FILES_klibc-utils-mkfifo = "${base_bindir}/mkfifo"
FILES_klibc-utils-mknod = "${base_bindir}/mknod"
FILES_klibc-utils-mount = "${base_bindir}/mount"
FILES_klibc-utils-nuke = "${base_bindir}/nuke"
FILES_klibc-utils-pivot-root = "${base_bindir}/pivot_root"
FILES_klibc-utils-poweroff = "${base_bindir}/poweroff"
FILES_klibc-utils-readlink = "${base_bindir}/readlink"
FILES_klibc-utils-reboot = "${base_bindir}/reboot"
FILES_klibc-utils-sleep = "${base_bindir}/sleep"
FILES_klibc-utils-true = "${base_bindir}/true"
FILES_klibc-utils-umount = "${base_bindir}/umount"
FILES_klibc-utils-uname = "${base_bindir}/uname"
FILES_klibc-utils-modprobe = "${base_bindir}/modprobe"
FILES_klibc-utils-losetup = "${base_bindir}/losetup"
FILES_klibc-utils-wc = "${base_bindir}/wc"

# Yes we want exactly the klibc that was compiled with the utils
RDEPENDS_klibc-utils-sh = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-kinit = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-fstype = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-ipconfig = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-nfsmount = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-resume = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-run-init = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-cat = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-chroot = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-cpio = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-dd = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-false = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-halt = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-insmod = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-kill = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-ln = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-minips = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-mkdir = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-mkfifo = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-mknod = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-mount = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-nuke = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-pivot-root = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-poweroff = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-readlink = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-reboot = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-sleep = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-true = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-umount = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-uname = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-modprobe = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-losetup = "${PN} (=${PV}-${PR})"
RDEPENDS_klibc-utils-wc = "${PN} (=${PV}-${PR})"
DEPENDS = "virtual/kernel perl-native"
SECTION = "libs"
DESCRIPTION = "klibc is intended to be a minimalistic libc subset for \
use with initramfs.  It is deliberately written for small size, \
minimal entaglement, and portability, not speed."
LICENSE = "BSD-ADV"
SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/klibc/Stable/klibc-${PV}.tar.bz2 \
	   file://fstype-sane-vfat-and-jffs2-for-1.5.patch;patch=1 \
	   file://modprobe.patch;patch=1 \
	   file://losetup.patch;patch=1 \
	   file://dash_readopt.patch;patch=1 \
	   file://wc.patch;patch=1 \
           file://Makefile.klibc \
	   "
S = "${WORKDIR}/klibc-${PV}"
PACKAGE_ARCH = "${MACHINE_ARCH}"

KLIBC_ARCH = '${TARGET_ARCH}'
KLIBC_ARCH_armeb = 'arm'
KLIBC_ARCH_mipsel = 'mips'
KLIBC_ARCH_x86 = 'i386'
KLIBC_ARCH_i486 = 'i386'
KLIBC_ARCH_i586 = 'i386'
KLIBC_ARCH_i686 = 'i386'
KLIBC_ARCH_pentium = 'i386'

# the klibc code contains ARM instructions (for ARM), this
# could be fixed, but for the moment:
ARM_INSTRUCTION_SET = "arm"

SRC_URI_append_linux-gnueabi = "file://klibc-config-eabi.patch;patch=1 \
				"
SRC_URI_append_linux-uclibcgnueabi = "file://klibc-config-eabi.patch;patch=1 \
				      "

EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                'CROSS_COMPILE=${TARGET_PREFIX}' \
                "

do_configure () {
	ln -sf ${STAGING_KERNEL_DIR} linux
	cd linux
	ARCH=${KLIBC_ARCH} KBUILD_EXTMOD=1 make -f ${WORKDIR}/Makefile.klibc klibc >${S}/machine.tmp
	cd ${S}
}



include Makefile

include/config/auto.conf:

PHONY = klibc
klibc :
	@echo mach-$(machine-y)


--------------090807040905050707010406--
