Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RTXA5-0005f7-DK
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 12:08:13 +0100
Received: by ywb20 with SMTP id 20so2255574ywb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 03:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=2xIFSnXVB29WHzj7ayLtXQT5jjMey41SeMlOH8tieSQ=;
	b=QczYke7/8QECPPw84KfIt4oy7ODP0E+nhCIDj/++vW/UPTfstR97+Ad+oeRpQwcXvb
	/UlKG78bnAs/Wfk+vtSpv6/pvIGYScfxyLd3yMWE26nKb9Szd+5gCj3MKFMN+/hsDoQb
	0jvHdOoUl/X3f35koRbyocORYEs883YKBNCbo=
MIME-Version: 1.0
Received: by 10.236.197.9 with SMTP id s9mr41032426yhn.71.1322132500059; Thu,
	24 Nov 2011 03:01:40 -0800 (PST)
Received: by 10.150.229.21 with HTTP; Thu, 24 Nov 2011 03:01:40 -0800 (PST)
In-Reply-To: <4fb71f23ca156720be745d2a86828f5f6d0081a7.1322129758.git.Martin.Jansa@gmail.com>
References: <cover.1322129758.git.Martin.Jansa@gmail.com>
	<0004016e514fbb3f18793561ebf85766344ae499.1322129758.git.Martin.Jansa@gmail.com>
	<4fb71f23ca156720be745d2a86828f5f6d0081a7.1322129758.git.Martin.Jansa@gmail.com>
Date: Thu, 24 Nov 2011 12:01:40 +0100
Message-ID: <CAAQYJAsKM-qcHC-ntH11SrHrSXd76pVfHQ23MQza74totvH1og@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld 3/6] linux-kexecboot: use kernel_conf_variable like linux.inc does and respect CMDLINE_DEBUG
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
X-List-Received-Date: Thu, 24 Nov 2011 11:08:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2011 at 11:18 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0recipes-kernel/linux/linux-kexecboot.inc | =A0103 ++++++++++++++------=
---------
> =A01 files changed, 50 insertions(+), 53 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-kexecboot.inc b/recipes-kernel/li=
nux/linux-kexecboot.inc
> index 31ae5b5..83b7018 100644
> --- a/recipes-kernel/linux/linux-kexecboot.inc
> +++ b/recipes-kernel/linux/linux-kexecboot.inc
> @@ -20,13 +20,17 @@ LOGO_SIZE ?=3D "."
> =A0# to your kernel recipe, and then structure your logos for each resolu=
tion
> =A0# accordingly.
>
> +# Set the verbosity of kernel messages during runtime
> +# You can define CMDLINE_DEBUG in your local.conf or distro.conf to over=
ride this behaviour
> +CMDLINE_DEBUG ?=3D '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "=
debug", "loglevel=3D3", d)}'

Remember that we break the integrity of bootlogo on screen.
EXTRA_IMAGE_FEATURES =3D "debug-tweaks" is default in local.conf.

> +
> =A0# Note how we set loglevel=3D3 and master console on serial to protect=
 bootlogo.
> -CMDLINE_c7x0 =3D "console=3Dtty1 console=3DttyS0,115200n8 loglevel=3D3"
> -CMDLINE_tosa =3D "console=3Dtty1 console=3DttyS0,115200n8 loglevel=3D3"
> -CMDLINE_poodle =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drota=
te:1 loglevel=3D3"
> -CMDLINE_akita =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drotat=
e:1 loglevel=3D3"
> -CMDLINE_collie =3D "console=3Dtty1 console=3DttySA0,115200n8 fbcon=3Drot=
ate:1 mem=3D64M loglevel=3D3"
> -CMDLINE_spitz =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drotat=
e:1 loglevel=3D3"
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
>
> =A0PACKAGES =3D ""
> =A0PROVIDES =3D ""
> @@ -47,28 +51,39 @@ LOCALVERSION ?=3D ""
> =A0# we want the smallest size
> =A0INITRAMFS_IMAGE =3D "initramfs-kexecboot-klibc-image"
>
> +kernel_conf_variable() {
> + =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CONFIG_$1[ =3D]/d;"
> + =A0 =A0 =A0 =A0if test "$2" =3D "n"
> + =A0 =A0 =A0 =A0then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "# CONFIG_$1 is not set" >> ${S}/.c=
onfig
> + =A0 =A0 =A0 =A0else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "CONFIG_$1=3D$2" >> ${S}/.config
> + =A0 =A0 =A0 =A0fi
> +}
> +
> =A0do_configure_prepend() {
>
> =A0 =A0 =A0 =A0 echo "" > ${S}/.config
> + =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D""
>
> =A0 =A0 =A0 =A0 #
> =A0 =A0 =A0 =A0 # CONFIG_CMDLINE mangling
> =A0 =A0 =A0 =A0 #
> - =A0 =A0 =A0 =A0echo "CONFIG_CMDLINE_BOOL=3Dy" >> ${S}/.config
> - =A0 =A0 =A0 =A0echo "CONFIG_CMDLINE=3D\"${CMDLINE}\"" >> ${S}/.config
> + =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE_BOOL y
> + =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEB=
UG}\""
>
> =A0 =A0 =A0 =A0 # mips and x86

Here things have changed lately for ARM:
CMDLINE_FROM_BOOTLOADER, CMDLINE_EXTEND, CMDLINE_FORCE
 I'm not proud of this mangling...

> - =A0 =A0 =A0 =A0echo "CONFIG_CMDLINE_OVERRIDE=3Dy" >> ${S}/.config
> + =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE_OVERRIDE y
>
> =A0 =A0 =A0 =A0 # sh only
> - =A0 =A0 =A0 =A0echo "CONFIG_CMDLINE_OVERWRITE=3Dy" >> ${S}/.config
> - =A0 =A0 =A0 =A0echo "# CONFIG_CMDLINE_EXTEND is not set" >> ${S}/.confi=
g
> + =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE_OVERWRITE y
> + =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE_EXTEND n
>
> =A0 =A0 =A0 =A0 #
> =A0 =A0 =A0 =A0 # endian support
> =A0 =A0 =A0 =A0 #
> =A0 =A0 =A0 =A0 if [ "${SITEINFO_ENDIANNESS}" =3D "be" ]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "CONFIG_CPU_BIG_ENDIAN=3Dy" =A0 =A0=
 =A0 =A0 =A0>> ${S}/.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CPU_BIG_ENDIAN y
> =A0 =A0 =A0 =A0 fi
>
> =A0 =A0 =A0 =A0 #
> @@ -76,60 +91,42 @@ do_configure_prepend() {
> =A0 =A0 =A0 =A0 #
> =A0 =A0 =A0 =A0 if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${WORKDIR}/logo_linux_clu=
t224.ppm drivers/video/logo/logo_linux_clut224.ppm
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "CONFIG_LOGO=3Dy" =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0>> ${S}/.config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "CONFIG_LOGO_LINUX_CLUT224=3Dy" =A0=
 =A0 =A0>> ${S}/.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable LOGO y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable LOGO_LINUX_CLUT224 =
y
> =A0 =A0 =A0 =A0 fi
>
> =A0 =A0 =A0 =A0 # When enabling thumb for userspace we also need thumb su=
pport in the kernel
> =A0 =A0 =A0 =A0 if [ "${ARM_INSTRUCTION_SET}" =3D "thumb" ] ; then
> - =A0 =A0 =A0 =A0 =A0 =A0sed -i -e /CONFIG_ARM_THUMB/d ${WORKDIR}/defconf=
ig
> - =A0 =A0 =A0 =A0 =A0 =A0echo "CONFIG_ARM_THUMB=3Dy" >> ${S}/.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable ARM_THUMB y
> =A0 =A0 =A0 =A0 fi
>
> - =A0 =A0 =A0 =A0sed -e '/CONFIG_CMDLINE=3D/d' \
> - =A0 =A0 =A0 =A0 =A0 =A0-e '/CONFIG_CMDLINE_BOOL/d' \
> - =A0 =A0 =A0 =A0 =A0 =A0-e '/CONFIG_CMDLINE_OVERRIDE/d' \
> - =A0 =A0 =A0 =A0 =A0 =A0-e '/CONFIG_CMDLINE_OVERWRITE/d' \
> - =A0 =A0 =A0 =A0 =A0 =A0-e '/CONFIG_CMDLINE_EXTEND/d' \
> - =A0 =A0 =A0 =A0 =A0 =A0-e '/CONFIG_CPU_BIG_ENDIAN/d' \
> - =A0 =A0 =A0 =A0 =A0 =A0-e '/CONFIG_LOGO=3D/d' \
> - =A0 =A0 =A0 =A0 =A0 =A0-e '/CONFIG_LOGO_LINUX_CLUT224=3D/d' \
> - =A0 =A0 =A0 =A0 =A0 =A0-e '/CONFIG_LOCALVERSION/d' \
> - =A0 =A0 =A0 =A0 =A0 =A0-e '/CONFIG_LOCALVERSION_AUTO/d' \
> - =A0 =A0 =A0 =A0 =A0 =A0< '${WORKDIR}/defconfig' >>'${S}/.config'
> -
> - =A0 =A0 =A0 =A0echo 'CONFIG_LOCALVERSION=3D"${LOCALVERSION}"' >>${S}/.c=
onfig
> - =A0 =A0 =A0 =A0echo '# CONFIG_LOCALVERSION_AUTO is not set' >>${S}/.con=
fig
> + =A0 =A0 =A0 =A0kernel_conf_variable LOCALVERSION "\"${LOCALVERSION}\""
> + =A0 =A0 =A0 =A0kernel_conf_variable LOCALVERSION_AUTO n
>
> =A0 =A0 =A0 =A0 # Force sane defaults for kexec-enabled kernels and keep =
size small
> - =A0 =A0 =A0 =A0sed -i -e /CONFIG_BLK_DEV_INITRD/d \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e /CONFIG_KEXEC/d \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e /=3Dm/d \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e /CONFIG_MODULES/d \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e /CONFIG_DEBUG_ERRORS/d \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e /CONFIG_DEBUG_BUGVERBOSE/d \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e /CONFIG_DEBUG_KERNEL/d \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${S}/.config
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo 'CONFIG_BLK_DEV_INITRD=3Dy' >>${S}/.co=
nfig
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo 'CONFIG_KEXEC=3Dy' >>${S}/.config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo '# CONFIG_MODULES is not set' >> ${S}/=
.config
> + =A0 =A0 =A0 =A0kernel_conf_variable BLK_DEV_INITRD y
> + =A0 =A0 =A0 =A0kernel_conf_variable KEXEC y
> + =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /=3Dm/d;"
> + =A0 =A0 =A0 =A0kernel_conf_variable MODULES n
> + =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_ERRORS n
> + =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_BUGVERBOSE n
> + =A0 =A0 =A0 =A0kernel_conf_variable DEBUG_KERNEL n
>
> =A0 =A0 =A0 =A0 # Force lzma for arm kernels only
> =A0 =A0 =A0 =A0 if [ "${ARCH}" =3D "arm" ] ; then
> -
> - =A0 =A0 =A0 =A0 =A0 =A0sed -i -e /CONFIG_KERNEL/d \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e /CONFIG_INITRAMFS_COMPRESSION/d \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e /CONFIG_INITRAMFS_SOURCE/d \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e /CONFIG_RD/d \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${S}/.config
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo 'CONFIG_KERNEL_LZMA=3Dy' >>${S}/.confi=
g
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo 'CONFIG_INITRAMFS_COMPRESSION_LZMA=3Dy=
' >>${S}/.config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo 'CONFIG_INITRAMFS_SOURCE=3D"initramfs.=
cpio.lzma"' >>${S}/.config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo 'CONFIG_RD_LZMA=3Dy' >>${S}/.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CON=
FIG_KERNEL/d;"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CON=
FIG_RD/d;"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CON=
FIG_INITRAMFS_COMPRESSION/d;"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CON=
FIG_INITRAMFS_SOURCE/d;"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable KERNEL_LZMA y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable RD_LZMA y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable INITRAMFS_COMPRESSI=
ON_LZMA y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable INITRAMFS_SOURCE "\=
"initramfs.cpio.lzma\""
> =A0 =A0 =A0 =A0 fi
>
> + =A0 =A0 =A0 =A0sed -e "${CONF_SED_SCRIPT}" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0< '${WORKDIR}/defconfig'=
 >>'${S}/.config'
> +
> =A0 =A0 =A0 =A0 yes '' | oe_runmake oldconfig
> =A0}
>
> --
> 1.7.8.rc3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Thanks for the refactoring.

Andrea


