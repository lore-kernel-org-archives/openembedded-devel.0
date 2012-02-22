Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S00AO-0007sC-NX
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 01:34:45 +0100
Received: by eaal10 with SMTP id l10so2405042eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 16:26:25 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.9.148 as permitted sender) client-ip=10.213.9.148; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.9.148 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.9.148])
	by 10.213.9.148 with SMTP id l20mr4188885ebl.104.1329870385275
	(num_hops = 1); Tue, 21 Feb 2012 16:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xKjPPMQLEmOtjkvKbCc0867uL5wa5CBZ/FcEW2PQC1A=;
	b=Ip3X4eaSYfWssx6C+1icb/AZGIYZOdRX9O+lnBaUNAO1ukmkWgLi1HZYg7CBlH0y+O
	NvbnIO/cyJxcFnmEJxPVP9K7QNKaJkuWuZtIzrPVd4qWwqJoJi1QgikMIC3bGSVhSeSZ
	JKtEGpdnxr79fxAAOdHab5P8ZHrLQDKBsBmGA=
Received: by 10.213.9.148 with SMTP id l20mr3332846ebl.104.1329870384436;
	Tue, 21 Feb 2012 16:26:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm66675135eef.10.2012.02.21.16.26.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 16:26:23 -0800 (PST)
Date: Wed, 22 Feb 2012 01:26:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120222002621.GF3769@jama.jama.net>
References: <1329870032-4952-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1329870032-4952-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Wed, 22 Feb 2012 00:34:45 -0000
X-Groupsio-MsgNum: 37314
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline

--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 01:20:31AM +0100, Andrea Adami wrote:
> * recipes are now in meta-initramfs
>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-core/udev/udev/touchscreen.rules          |   21 ---
>  recipes-core/udev/udev_173.bbappend               |    5 -
>  recipes-kernel/linux/linux-kexecboot.inc          |  150 ---------------=
------
>  recipes-kernel/linux/linux-kexecboot_3.2.bb       |    5 -
>  recipes-kernel/linux/linux-kexecboot_3.2.bbappend |   38 +++++
>  recipes-kernel/linux/linux-kexecboot_git.bb       |    4 -
>  recipes-kernel/linux/linux-kexecboot_git.bbappend |   38 +++++
>  7 files changed, 76 insertions(+), 185 deletions(-)
>  delete mode 100644 recipes-core/udev/udev/touchscreen.rules
>  delete mode 100644 recipes-core/udev/udev_173.bbappend

is this ^udev^ intentional?

>  delete mode 100644 recipes-kernel/linux/linux-kexecboot.inc
>  delete mode 100644 recipes-kernel/linux/linux-kexecboot_3.2.bb
>  create mode 100644 recipes-kernel/linux/linux-kexecboot_3.2.bbappend
>  delete mode 100644 recipes-kernel/linux/linux-kexecboot_git.bb
>  create mode 100644 recipes-kernel/linux/linux-kexecboot_git.bbappend
>=20
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
> -#    For example, 'sda3' has a "kernel number" of '3'
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
> -        CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CONFIG_$1[ =3D]/d;"
> -        if test "$2" =3D "n"
> -        then
> -                echo "# CONFIG_$1 is not set" >> ${S}/.config
> -        else
> -                echo "CONFIG_$1=3D$2" >> ${S}/.config
> -        fi
> -}
> -
> -do_configure_prepend() {
> -
> -        echo "" > ${S}/.config
> -        CONF_SED_SCRIPT=3D""
> -
> -        #
> -        # CONFIG_CMDLINE mangling
> -        #
> -        kernel_conf_variable CMDLINE_BOOL y
> -        kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\""
> -
> -        # mips and x86
> -        kernel_conf_variable CMDLINE_OVERRIDE y
> -
> -        # sh only
> -        kernel_conf_variable CMDLINE_OVERWRITE y
> -        kernel_conf_variable CMDLINE_EXTEND n
> -
> -        #
> -        # endian support
> -        #
> -        if [ "${SITEINFO_ENDIANNESS}" =3D "be" ]; then
> -                kernel_conf_variable CPU_BIG_ENDIAN y
> -        fi
> -
> -        #
> -        # logo support, if you supply logo_linux_clut224.ppm in SRC_URI,=
 then it is going to be used
> -        #
> -        if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
> -                install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm driver=
s/video/logo/logo_linux_clut224.ppm
> -                kernel_conf_variable LOGO y
> -                kernel_conf_variable LOGO_LINUX_CLUT224 y
> -        fi
> -
> -        # When enabling thumb for userspace we also need thumb support i=
n the kernel
> -        if [ "${ARM_INSTRUCTION_SET}" =3D "thumb" ] ; then
> -                kernel_conf_variable ARM_THUMB y
> -        fi
> -
> -        kernel_conf_variable LOCALVERSION "\"${LOCALVERSION}\""
> -        kernel_conf_variable LOCALVERSION_AUTO n
> -
> -        # Force sane defaults for kexec-enabled kernels and keep size sm=
all
> -        kernel_conf_variable BLK_DEV_INITRD y
> -        kernel_conf_variable KEXEC y
> -        CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /=3Dm/d;"
> -        kernel_conf_variable MODULES n
> -        if ${@base_contains("CMDLINE_DEBUG", "debug", "true", "false", d=
)}; then
> -                kernel_conf_variable DEBUG_LL y
> -                kernel_conf_variable PRINTK y
> -                kernel_conf_variable EARLY_PRINTK y
> -                kernel_conf_variable BUG y
> -                kernel_conf_variable DEBUG_ERRORS y
> -                kernel_conf_variable DEBUG_BUGVERBOSE y
> -                kernel_conf_variable DEBUG_KERNEL y
> -        else
> -                kernel_conf_variable DEBUG_ERRORS n
> -                kernel_conf_variable DEBUG_BUGVERBOSE n
> -                kernel_conf_variable DEBUG_KERNEL n
> -        fi
> -
> -        # Force lzma for arm kernels only
> -        if [ "${ARCH}" =3D "arm" ] ; then
> -                CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CONFIG_KERNEL/d;"
> -                CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CONFIG_RD/d;"
> -                CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CONFIG_INITRAMFS_CO=
MPRESSION/d;"
> -                CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CONFIG_INITRAMFS_SO=
URCE/d;"
> -                kernel_conf_variable KERNEL_LZMA y
> -                kernel_conf_variable RD_LZMA y
> -                kernel_conf_variable INITRAMFS_COMPRESSION_LZMA y
> -                kernel_conf_variable INITRAMFS_SOURCE "\"initramfs.cpio.=
lzma\""
> -        fi
> -
> -        sed -e "${CONF_SED_SCRIPT}" \
> -                        < '${WORKDIR}/defconfig' >>'${S}/.config'
> -
> -        yes '' | oe_runmake oldconfig
> -}
> -
> -do_populate_sysroot() {
> -        :
> -}
> -
> -do_install() {
> -        :
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
> +           file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
> +           "
> +
> +SRC_URI_append_collie =3D " \
> +                         file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-st=
ructure-on-collie.patch \
> +                         file://locomo_kbd_tweak-r2.patch \
> +                         "
> +
> +SRC_URI_append_poodle =3D " \
> +                         file://locomo_kbd_tweak-r2.patch \
> +                         "
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
> +           file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
> +           "
> +
> +SRC_URI_append_collie =3D " \
> +                         file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-st=
ructure-on-collie.patch \
> +                         file://locomo_kbd_tweak-r2.patch \
> +                         "
> +
> +SRC_URI_append_poodle =3D " \
> +                         file://locomo_kbd_tweak-r2.patch \
> +                         "
> +
> +
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9ENi0ACgkQN1Ujt2V2gByyqwCgtizGd2jfmOXf2CN7J0+gyjco
+P4AoLtNF5GpfgSCotuE6qxMDD1lti+F
=sj/w
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--
