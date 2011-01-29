Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <srinredplano@gmail.com>) id 1PiyiR-0005F2-RO
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 01:30:59 +0100
Received: by qyk36 with SMTP id 36so3913269qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 16:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=l2DZ1RE9Y7MTjWZ2haN7yei805G63/IKCL85svRzpfU=;
	b=oXVcec/V+lopy5JUXXq3HubdutUUbrt9k1ybPC10Lka9l1PcxR8aNzas4/QIjyKfep
	rTw2JG4LL9bWPN0iaJJ33lfxgQ/mH5mtswImlqeXNMjDsXAzi60H8ZbWbYJpUMZ5G99L
	PooFoVo+7ggeGQP1thVk9k82se0qqLkA4W6F8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=aNE92vga2/fDEsfy/He4915wIoNJPukLZbFZuxza4OYR/VXZ34+piMGX1bN7nRl8WE
	qXKMdeTny91ramXg6Ixwn7dZxIE/PaHvH4CoKDRVPd1j9ZESKyxPUGItMO9obr3DEn9p
	9kNHXtpCLQ8KG2GpZ4VvULRMJLSj4VM92E+Ew=
MIME-Version: 1.0
Received: by 10.229.235.143 with SMTP id kg15mr1429301qcb.17.1296261009108;
	Fri, 28 Jan 2011 16:30:09 -0800 (PST)
Received: by 10.220.175.203 with HTTP; Fri, 28 Jan 2011 16:30:09 -0800 (PST)
Date: Fri, 28 Jan 2011 16:30:09 -0800
Message-ID: <AANLkTimD_HUT+vTfSpC8eAOQ+tqmA4hwZWnpppMvmOBh@mail.gmail.com>
From: srinredplano SP <srinredplano@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sat, 29 Jan 2011 00:31:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi ,
I am using DISTRO=3Darago=A0 and MACHINE=3D omap3axon(same as that of
omap3evm ) to compile linux-2.6.22=A0 kernel .

when I try to execute the following=A0 =A0command
tbake finds my .bb file and uses

$> MACHINE=3Domap3axon=A0 bitbake virtual/kernel

wrong bb file is getting picked up . How to know why a wrong .bb file
is picked up(it always picks
linux-nokia900-2.6.28.10+gitr0+e93534addfc33a2fefbca13cb86a8f787e4b650c-r92=
.bb
file=A0 ) and which=A0 variable i have to override so that only my .bb
file gets executed .
Is there any thing else which I am missing . thanks=A0 in advance

The following=A0 the local.conf , =A0 omap3axon.conf

local.conf=A0 file :
### local.conf #########

SCRATCH ?=3D "${OEBASE}"

DL_DIR =3D "${SCRATCH}/downloads"

TMPDIR =3D "${SCRATCH}/arago-tmp"

MACHINE =3D "omap3axon"

DISTRO =3D "arago"

ENABLE_BINARY_LOCALE_GENERATION =3D "0"

IMAGE_FSTYPES =3D "jffs2 tar.gz ext2.gz"

BBDEBUG =3D "yes"

PARALLEL_MAKE =3D "-j 8"
BB_NUMBER_THREADS =3D "4"

BBINCLUDELOGS =3D "yes"

TOOLCHAIN_TYPE =3D "external"
TOOLCHAIN_BRAND =3D "csl"
DEFAULT_PREFERENCE =3D "1"

####### END local.conf ####


MACHINE : omap3axon.conf
## MACHINE=A0 CONF omap3axon.conf=A0 ##

#@DESCRIPTION: Machine configuration for the TI OMAP3 EVM
TARGET_ARCH =3D "arm"

PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
XSERVER =3D "xserver-xorg \
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xf86-input-evdev \
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xf86-input-mouse \
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xf86-input-tslib \
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xf86-video-omapfb \
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xf86-input-keyboard"

GUI_MACHINE_CLASS =3D "smallscreen"

require conf/machine/include/omap3.inc

IMAGE_FSTYPES ?=3D "jffs2 tar.bz2"
EXTRA_IMAGECMD_jffs2 =3D "-lnp -e 0x20000 -s 2048"

SERIAL_CONSOLE =3D "115200 ttyS0"

PREFERRED_PROVIDER_virtual/kernel =3D "linux-omap3axon-2.6.22-pspaxon"

UBOOT_ARCH =3D "arm"

MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen touch=
screen"

KVER=3D "2.6.22"

MKUBIFS_ARGS =3D "-m 2048 -e 129024 -c 1996"

UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512"

##END -- MACHINE=A0 CONF omap3axon.conf=A0 ##





linux-omap3axon-2.6.22-pspaxon.bb file :
#####linux-omap3axon-2.6.22-pspaxon.bb ##

SRC_URI =3D "file://linux-2.6.22.tar.gz \
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://defconfig"

COMPATIBLE_MACHINE =3D "omap3axon"

require linux-omap3.inc

SECTION =3D "kernel"

KVER =3D "2.6.22"

DEFAULT_PREFERENCE =3D "1"
DEFAULT_PREFERENCE_omap3axon =3D "1"
#SRC_URI :=3D "${@oe_filter_out('file://defconfig',
bb.data.getVar('SRC_URI', d, 1), d)}"


DEFAULT_PREFERENCE =3D "1"

do_setup_defconfig() {
=A0=A0=A0=A0=A0=A0=A0 :
}

do_configure() {
=A0=A0=A0=A0=A0=A0=A0 make omap3evm_defconfig
}


SRCREV =3D "753"
PREFERRED_PROVIDER_omap3axon =3D "1"
MACHINE_KERNEL_PR_append =3D "+svnr${SRCREV}"

SRC_URI =3D "file://linux-2.6.22.tar.gz \
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://defconfig"

addtask quiltfixup before do_patch after do_unpack

do_quiltfixup() {
=A0=A0=A0=A0=A0=A0=A0=A0=A0 :
}

S =3D "${WORKDIR}/kernel/linux-2.6.22"


do_install_append() {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 install -d ${D}/boot
}

PACKAGES =3D+ "omap-dss-doc"
FILES_omap-dss-doc =3D "/boot/DSS"


####END----linux-omap3axon-2.6.22-pspaxon.bb ####


