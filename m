Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <srinredplano@gmail.com>) id 1Piw1k-0008Gu-Qx
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 22:38:45 +0100
Received: by qyk36 with SMTP id 36so3798738qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 13:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=kgCnloNz6GTD0O/w2yZ5jjW8h0Z5h0VtmD5L8lLzBwU=;
	b=wyFWJ4uYnNEE0vOLpTaqUKF7G7nybuivuAzP9FbDHJ7BUsBKe0BZjdc7MnNHuVMmHx
	ik3ixOjo/rsyiCe4CQCbfIR5E5sKTq2gcHsnmM+z8zbls88U7N6lwgF3uQydW4YhBrkj
	SymGBO3/3gNCx8ID/Z7e2XS9aUYU0DbHbz+eQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=vhxyoNtOGZBHbNqm1HrqmAUm4hY6wnFpNM231pO+5Jw1oNknHtUFVMghl4bxWB4Gn4
	ls+ZhmrLiQ8JP4wredChZrY8wgyiHV24CfUEFxuk09NlmBVSNzYiCf7cKrW2KDY34CTV
	p+IqXlFhy04vF7tjDna/y/N6dHCfYAfSLbleQ=
MIME-Version: 1.0
Received: by 10.229.236.203 with SMTP id kl11mr1275905qcb.131.1296250674227;
	Fri, 28 Jan 2011 13:37:54 -0800 (PST)
Received: by 10.220.175.203 with HTTP; Fri, 28 Jan 2011 13:37:54 -0800 (PST)
Date: Fri, 28 Jan 2011 13:37:54 -0800
Message-ID: <AANLkTimnVCsZ7sW0yW_jqRV-nosmOQd-9pprD67HDNem@mail.gmail.com>
From: srinredplano SP <srinredplano@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: how to know why bitbake will pick a wrong .bb file after providing PREFERRED_PROVIDER value
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
X-List-Received-Date: Fri, 28 Jan 2011 21:38:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi ,
I am using *DISTRO=arago*  and *MACHINE= omap3axon*(same as that of omap3evm
) to compile* linux-2.6.22 * kernel .

when I try to execute the following   command
tbake finds my .bb file and uses

*$> MACHINE=omap3axon  bitbake virtual/kernel*

*wrong bb file is getting picked up . How to know why a wrong .bb file is
picked up(it always picks linux-nokia900-2.6.28.10+gitr0+
e93534addfc33a2fefbca13cb86a8f787e4b650c-r92.bb file  ) and which  variable
i have to override so that only my .bb file gets executed .
Is there any thing else which I am missing . thanks  in advance
*
The following  the local.conf ,   omap3axon.conf

*local.conf  file :*
### local.conf #########

SCRATCH ?= "${OEBASE}"

DL_DIR = "${SCRATCH}/downloads"

TMPDIR = "${SCRATCH}/arago-tmp"

MACHINE = "omap3axon"

DISTRO = "arago"

ENABLE_BINARY_LOCALE_GENERATION = "0"

IMAGE_FSTYPES = "jffs2 tar.gz ext2.gz"

BBDEBUG = "yes"

PARALLEL_MAKE = "-j 8"
BB_NUMBER_THREADS = "4"

BBINCLUDELOGS = "yes"

TOOLCHAIN_TYPE = "external"
TOOLCHAIN_BRAND = "csl"
DEFAULT_PREFERENCE = "1"

####### END local.conf ####

*
MACHINE : omap3axon.conf *
## MACHINE  CONF omap3axon.conf  ##

#@DESCRIPTION: Machine configuration for the TI OMAP3 EVM
TARGET_ARCH = "arm"

PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
XSERVER = "xserver-xorg \
           xf86-input-evdev \
           xf86-input-mouse \
           xf86-input-tslib \
           xf86-video-omapfb \
           xf86-input-keyboard"

GUI_MACHINE_CLASS = "smallscreen"

require conf/machine/include/omap3.inc

IMAGE_FSTYPES ?= "jffs2 tar.bz2"
EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"

SERIAL_CONSOLE = "115200 ttyS0"

PREFERRED_PROVIDER_virtual/kernel = "linux-omap3axon-2.6.22-pspaxon"

UBOOT_ARCH = "arm"

MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen
touchscreen"

KVER= "2.6.22"

MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"

UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"

##END -- MACHINE  CONF omap3axon.conf  ##





*linux-omap3axon-2.6.22-pspaxon.bb* file :
#####linux-omap3axon-2.6.22-pspaxon.bb ##

SRC_URI = "file://linux-2.6.22.tar.gz \
           file://defconfig"

COMPATIBLE_MACHINE = "omap3axon"

require linux-omap3.inc

SECTION = "kernel"

KVER = "2.6.22"

DEFAULT_PREFERENCE = "1"
DEFAULT_PREFERENCE_omap3axon = "1"
#SRC_URI := "${@oe_filter_out('file://defconfig', bb.data.getVar('SRC_URI',
d, 1), d)}"


DEFAULT_PREFERENCE = "1"

do_setup_defconfig() {
        :
}

do_configure() {
        make omap3evm_defconfig
}


SRCREV = "753"

MACHINE_KERNEL_PR_append = "+svnr${SRCREV}"

SRC_URI = "file://linux-2.6.22.tar.gz \
           file://defconfig"

addtask quiltfixup before do_patch after do_unpack

do_quiltfixup() {
          :
}

S = "${WORKDIR}/kernel/linux-2.6.22"


do_install_append() {
            install -d ${D}/boot
}

PACKAGES =+ "omap-dss-doc"
FILES_omap-dss-doc = "/boot/DSS"


####END----linux-omap3axon-2.6.22-pspaxon.bb<http://end----linux-omap3axon-2.6.22-pspaxon.bb/>####

