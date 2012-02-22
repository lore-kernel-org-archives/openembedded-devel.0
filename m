Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S00Gw-00085a-2V
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 01:41:30 +0100
Received: by daln34 with SMTP id n34so6237102dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 16:33:09 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.74.72 as permitted sender) client-ip=10.68.74.72; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.74.72 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.74.72])
	by 10.68.74.72 with SMTP id r8mr74831181pbv.86.1329870789652 (num_hops
	= 1); Tue, 21 Feb 2012 16:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=L9Bja1BDS2VzDYBhcNiu/RkL6XAbZu14WBXGaXqt5OY=;
	b=CSj6cAJwNNQuOH1ygco9bidTD7Rz1XDjaVHMcjrW3+FseT5yEMvVVt0I1fiBeaApb8
	kdFqji+kYHvHViU4EperlHSLbT1E/fKcw88kXe41CWEO177oSJaQ3UKl9I8YxA8QM991
	uf+qGrZ3daKhoF8EQmELbWq8XX6OnCTVrrxWI=
MIME-Version: 1.0
Received: by 10.68.74.72 with SMTP id r8mr61483059pbv.86.1329870789485; Tue,
	21 Feb 2012 16:33:09 -0800 (PST)
Received: by 10.143.147.17 with HTTP; Tue, 21 Feb 2012 16:33:09 -0800 (PST)
In-Reply-To: <1329870032-4952-1-git-send-email-andrea.adami@gmail.com>
References: <1329870032-4952-1-git-send-email-andrea.adami@gmail.com>
Date: Wed, 22 Feb 2012 01:33:09 +0100
Message-ID: <CAAQYJAvfp4SFyDHuR9p06JZ307RYnCkPk0q_MaofsQ4ZThcC-Q@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 1/1] linux-kexecboot_3.2 and _git: remove and add .bbappend
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
X-List-Received-Date: Wed, 22 Feb 2012 00:41:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 1:20 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> * recipes are now in meta-initramfs
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =A0recipes-core/udev/udev/touchscreen.rules =A0 =A0 =A0 =A0 =A0| =A0 21 -=
--
> =A0recipes-core/udev/udev_173.bbappend =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A05 -
> =A0recipes-kernel/linux/linux-kexecboot.inc =A0 =A0 =A0 =A0 =A0| =A0150 -=
--------------------
> =A0recipes-kernel/linux/linux-kexecboot_3.2.bb =A0 =A0 =A0 | =A0 =A05 -
> =A0recipes-kernel/linux/linux-kexecboot_3.2.bbappend | =A0 38 +++++
> =A0recipes-kernel/linux/linux-kexecboot_git.bb =A0 =A0 =A0 | =A0 =A04 -
> =A0recipes-kernel/linux/linux-kexecboot_git.bbappend | =A0 38 +++++
> =A07 files changed, 76 insertions(+), 185 deletions(-)
> =A0delete mode 100644 recipes-core/udev/udev/touchscreen.rules
> =A0delete mode 100644 recipes-core/udev/udev_173.bbappend
> =A0delete mode 100644 recipes-kernel/linux/linux-kexecboot.inc
> =A0delete mode 100644 recipes-kernel/linux/linux-kexecboot_3.2.bb
> =A0create mode 100644 recipes-kernel/linux/linux-kexecboot_3.2.bbappend
> =A0delete mode 100644 recipes-kernel/linux/linux-kexecboot_git.bb
> =A0create mode 100644 recipes-kernel/linux/linux-kexecboot_git.bbappend
>
> diff --git a/recipes-core/udev/udev/touchscreen.rules b/recipes-core/udev=
/udev/touchscreen.rules
> deleted file mode 100644
> index b2307cf..0000000
> --- a/recipes-core/udev/udev/touchscreen.rules
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -# There are a number of modifiers that are allowed to be used in some
> -# of the different fields. They provide the following subsitutions:
> -#
> -# %n the "kernel number" of the device.
> -# =A0 =A0For example, 'sda3' has a "kernel number" of '3'
> -# %e the smallest number for that name which does not matches an existin=
g node
> -# %k the kernel name for the device
> -# %M the kernel major number for the device
> -# %m the kernel minor number for the device
> -# %b the bus id for the device
> -# %c the string returned by the PROGRAM
> -# %s{filename} the content of a sysfs attribute
> -# %% the '%' char itself
> -#
> -
> -# Create a symlink to any touchscreen input device
> -SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D=
"input:*-e0*,3,*a0,1,*18,*", SYMLINK+=3D"input/touchscreen0"
> -SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D=
"ads7846", SYMLINK+=3D"input/touchscreen0"
> -# This one is necessary for h1940
> -SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D=
"input:*-e0*,3,*a0,1,*", SYMLINK+=3D"input/touchscreen0"
> -
> diff --git a/recipes-core/udev/udev_173.bbappend b/recipes-core/udev/udev=
_173.bbappend
> deleted file mode 100644
> index 4770c5b..0000000
> --- a/recipes-core/udev/udev_173.bbappend
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> -
> -PRINC =3D "1"
> -
> diff --git a/recipes-kernel/linux/linux-kexecboot.inc b/recipes-kernel/li=
nux/linux-kexecboot.inc
> deleted file mode 100644
> index b2758a6..0000000
> --- a/recipes-kernel/linux/linux-kexecboot.inc
> +++ /dev/null
> @@ -1,150 +0,0 @@
> -DESCRIPTION =3D "Linux Kernel"
> -SECTION =3D "kernel"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
> -
> -INC_PR =3D "r1"
> -
> -inherit kernel siteinfo
> -
> -# FILESEXTRAPATHS cannot be used, because it puts extra paths before FIL=
ESPATH and we need it at the end
> -# only as fallback for patches available only in linux-PV dir and ie def=
configs needs to go from linux-kexecboot-PV
> -FILESPATH_append =3D ":${FILE_DIRNAME}/linux-${PV}"
> -
> -DEPENDS +=3D "xz-native"
> -
> -# Kernel bootlogo is distro-specific (default is OE logo).
> -# Logo resolution (qvga, vga, ...) is machine-specific.
> -LOGO_SIZE ?=3D "."
> -# To use this, add file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 or sim=
ilar
> -# to your kernel recipe, and then structure your logos for each resoluti=
on
> -# accordingly.
> -
> -# Set the verbosity of kernel messages during runtime
> -# You can define CMDLINE_DEBUG in your local.conf or distro.conf to over=
ride this behaviour
> -CMDLINE_DEBUG ?=3D "loglevel=3D3"
> -
> -# Note how we set loglevel=3D3 and master console on serial to protect b=
ootlogo.
> -CMDLINE_c7x0 =3D "console=3Dtty1 console=3DttyS0,115200n8"
> -CMDLINE_tosa =3D "console=3Dtty1 console=3DttyS0,115200n8"
> -CMDLINE_poodle =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drota=
te:1"
> -CMDLINE_akita =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drotat=
e:1"
> -CMDLINE_collie =3D "console=3Dtty1 console=3DttySA0,115200n8 fbcon=3Drot=
ate:1 mem=3D64M"
> -CMDLINE_spitz =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drotat=
e:1"
> -
> -PACKAGES =3D ""
> -PROVIDES =3D ""
> -
> -# Zaurus machines need kernel size-check
> -KERNEL_IMAGE_MAXSIZE_akita =3D "1294336"
> -KERNEL_IMAGE_MAXSIZE_c7x0 =3D "1294336"
> -KERNEL_IMAGE_MAXSIZE_collie =3D "1048576"
> -KERNEL_IMAGE_MAXSIZE_poodle =3D "1294336"
> -KERNEL_IMAGE_MAXSIZE_tosa =3D "1294336"
> -KERNEL_IMAGE_MAXSIZE_spitz =3D "1294336"
> -
> -KERNEL_IMAGE_BASE_NAME =3D "${KERNEL_IMAGETYPE}-kexecboot-${PV}-${PR}-${=
MACHINE}"
> -KERNEL_IMAGE_SYMLINK_NAME =3D "${KERNEL_IMAGETYPE}-kexecboot-${MACHINE}"
> -
> -LOCALVERSION ?=3D ""
> -
> -# we want the smallest size
> -INITRAMFS_IMAGE =3D "initramfs-kexecboot-klibc-image"
> -
> -kernel_conf_variable() {
> - =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CONFIG_$1[ =3D]/d;"
> - =A0 =A0 =A0 =A0if test "$2" =3D "n"
> - =A0 =A0 =A0 =A0then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "# CONFIG_$1 is not set" >> ${S}/.c=
onfig
> - =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "CONFIG_$1=3D$2" >> ${S}/.config
> - =A0 =A0 =A0 =A0fi
> -}
> -
> -do_configure_prepend() {
> -
> - =A0 =A0 =A0 =A0echo "" > ${S}/.config
> - =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D""
> -
> - =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 =A0# CONFIG_CMDLINE mangling
> - =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE_BOOL y
> - =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEB=
UG}\""
> -
> - =A0 =A0 =A0 =A0# mips and x86
> - =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE_OVERRIDE y
> -
> - =A0 =A0 =A0 =A0# sh only
> - =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE_OVERWRITE y
> - =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE_EXTEND n
> -
> - =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 =A0# endian support
> - =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 =A0if [ "${SITEINFO_ENDIANNESS}" =3D "be" ]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CPU_BIG_ENDIAN y
> - =A0 =A0 =A0 =A0fi
> -
> - =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 =A0# logo support, if you supply logo_linux_clut224.ppm in =
SRC_URI, then it is going to be used
> - =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 =A0if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0644 ${WORKDIR}/logo_linux_cl=
ut224.ppm drivers/video/logo/logo_linux_clut224.ppm
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable LOGO y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable LOGO_LINUX_CLUT224 =
y
> - =A0 =A0 =A0 =A0fi
> -
> - =A0 =A0 =A0 =A0# When enabling thumb for userspace we also need thumb s=
upport in the kernel
> - =A0 =A0 =A0 =A0if [ "${ARM_INSTRUCTION_SET}" =3D "thumb" ] ; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable ARM_THUMB y
> - =A0 =A0 =A0 =A0fi
> -
> - =A0 =A0 =A0 =A0kernel_conf_variable LOCALVERSION "\"${LOCALVERSION}\""
> - =A0 =A0 =A0 =A0kernel_conf_variable LOCALVERSION_AUTO n
> -
> - =A0 =A0 =A0 =A0# Force sane defaults for kexec-enabled kernels and keep=
 size small
> - =A0 =A0 =A0 =A0kernel_conf_variable BLK_DEV_INITRD y
> - =A0 =A0 =A0 =A0kernel_conf_variable KEXEC y
> - =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /=3Dm/d;"
> - =A0 =A0 =A0 =A0kernel_conf_variable MODULES n
> - =A0 =A0 =A0 =A0if ${@base_contains("CMDLINE_DEBUG", "debug", "true", "f=
alse", d)}; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_LL y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable PRINTK y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable EARLY_PRINTK y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable BUG y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_ERRORS y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_BUGVERBOSE y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_KERNEL y
> - =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_ERRORS n
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_BUGVERBOSE n
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_KERNEL n
> - =A0 =A0 =A0 =A0fi
> -
> - =A0 =A0 =A0 =A0# Force lzma for arm kernels only
> - =A0 =A0 =A0 =A0if [ "${ARCH}" =3D "arm" ] ; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CON=
FIG_KERNEL/d;"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CON=
FIG_RD/d;"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CON=
FIG_INITRAMFS_COMPRESSION/d;"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CON=
FIG_INITRAMFS_SOURCE/d;"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable KERNEL_LZMA y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable RD_LZMA y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable INITRAMFS_COMPRESSI=
ON_LZMA y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable INITRAMFS_SOURCE "\=
"initramfs.cpio.lzma\""
> - =A0 =A0 =A0 =A0fi
> -
> - =A0 =A0 =A0 =A0sed -e "${CONF_SED_SCRIPT}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0< '${WORKDIR}/defconfig'=
 >>'${S}/.config'
> -
> - =A0 =A0 =A0 =A0yes '' | oe_runmake oldconfig
> -}
> -
> -do_populate_sysroot() {
> - =A0 =A0 =A0 =A0:
> -}
> -
> -do_install() {
> - =A0 =A0 =A0 =A0:
> -}
> -
> diff --git a/recipes-kernel/linux/linux-kexecboot_3.2.bb b/recipes-kernel=
/linux/linux-kexecboot_3.2.bb
> deleted file mode 100644
> index 8b4b9ce..0000000
> --- a/recipes-kernel/linux/linux-kexecboot_3.2.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require linux-kexecboot.inc
> -require linux-${PV}.inc
> -
> -PR =3D "${INC_PR}.0"
> -S =3D "${WORKDIR}/linux-${PV}"
> diff --git a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend b/recipes-=
kernel/linux/linux-kexecboot_3.2.bbappend
> new file mode 100644
> index 0000000..375dcdd
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
> @@ -0,0 +1,38 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-kexecboot-${PV}:${THISDIR=
}/files:"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +#COMPATIBLE_MACHINE =3D "(akita|c7x0|collie|poodle|tosa|spitz)"
> +COMPATIBLE_MACHINE =3D "(spitz)"
> +
> +# Note we set loglevel=3D3 and master console on serial to protect bootl=
ogo.
> +CMDLINE_c7x0 =3D "console=3Dtty1 console=3DttyS0,115200n8"
> +CMDLINE_tosa =3D "console=3Dtty1 console=3DttyS0,115200n8"
> +CMDLINE_poodle =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drota=
te:1"
> +CMDLINE_akita =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drotat=
e:1"
> +CMDLINE_collie =3D "console=3Dtty1 console=3DttySA0,115200n8 fbcon=3Drot=
ate:1 mem=3D64M"
> +CMDLINE_spitz =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drotat=
e:1"
> +
> +# Zaurus machines need kernel size-check.
> +KERNEL_IMAGE_MAXSIZE_akita =3D "1294336"
> +KERNEL_IMAGE_MAXSIZE_c7x0 =3D "1294336"
> +KERNEL_IMAGE_MAXSIZE_collie =3D "1048576"
> +KERNEL_IMAGE_MAXSIZE_poodle =3D "1294336"
> +KERNEL_IMAGE_MAXSIZE_tosa =3D "1294336"
> +KERNEL_IMAGE_MAXSIZE_spitz =3D "1294336"
> +
> +LOGO_SIZE ?=3D "."
> +
> +SRC_URI +=3D "file://defconfig \
> + =A0 =A0 =A0 =A0 =A0 file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
> + =A0 =A0 =A0 =A0 =A0 "
> +
> +SRC_URI_append_collie =3D " \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://0001-pcmcia-pxa2=
xx_sharpsl-retain-ops-structure-on-collie.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://locomo_kbd_tweak=
-r2.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> +
> +SRC_URI_append_poodle =3D " \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://locomo_kbd_tweak=
-r2.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> +
> +
> diff --git a/recipes-kernel/linux/linux-kexecboot_git.bb b/recipes-kernel=
/linux/linux-kexecboot_git.bb
> deleted file mode 100644
> index 5671b4f..0000000
> --- a/recipes-kernel/linux/linux-kexecboot_git.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require linux-kexecboot.inc
> -require linux-git.inc
> -
> -PR =3D "${INC_PR}.0"
> diff --git a/recipes-kernel/linux/linux-kexecboot_git.bbappend b/recipes-=
kernel/linux/linux-kexecboot_git.bbappend
> new file mode 100644
> index 0000000..1acab8a
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-kexecboot_git.bbappend
> @@ -0,0 +1,38 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-kexecboot-${PV}:${THISDIR=
}/files:"
> +
> +DEFAULT_PREFERENCE =3D "-2"
> +#COMPATIBLE_MACHINE =3D "(akita|c7x0|collie|poodle|tosa|spitz)"
> +COMPATIBLE_MACHINE =3D "(spitz)"
> +
> +# Note we set loglevel=3D3 and master console on serial to protect bootl=
ogo.
> +CMDLINE_c7x0 =3D "console=3Dtty1 console=3DttyS0,115200n8"
> +CMDLINE_tosa =3D "console=3Dtty1 console=3DttyS0,115200n8"
> +CMDLINE_poodle =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drota=
te:1"
> +CMDLINE_akita =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drotat=
e:1"
> +CMDLINE_collie =3D "console=3Dtty1 console=3DttySA0,115200n8 fbcon=3Drot=
ate:1 mem=3D64M"
> +CMDLINE_spitz =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drotat=
e:1"
> +
> +# Zaurus machines need kernel size-check.
> +KERNEL_IMAGE_MAXSIZE_akita =3D "1294336"
> +KERNEL_IMAGE_MAXSIZE_c7x0 =3D "1294336"
> +KERNEL_IMAGE_MAXSIZE_collie =3D "1048576"
> +KERNEL_IMAGE_MAXSIZE_poodle =3D "1294336"
> +KERNEL_IMAGE_MAXSIZE_tosa =3D "1294336"
> +KERNEL_IMAGE_MAXSIZE_spitz =3D "1294336"
> +
> +LOGO_SIZE ?=3D "."
> +
> +SRC_URI +=3D "file://defconfig \
> + =A0 =A0 =A0 =A0 =A0 file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
> + =A0 =A0 =A0 =A0 =A0 "
> +
> +SRC_URI_append_collie =3D " \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://0001-pcmcia-pxa2=
xx_sharpsl-retain-ops-structure-on-collie.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://locomo_kbd_tweak=
-r2.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> +
> +SRC_URI_append_poodle =3D " \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://locomo_kbd_tweak=
-r2.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> +
> +
> --
> 1.7.3.4
>

Ouch, udev is the innocent victim of this patch.
Sorry, v2 follows.

Cough, cough,...

Regards

Andrea


