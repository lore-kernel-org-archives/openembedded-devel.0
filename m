Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S09EB-0000Uu-Nm
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 11:15:16 +0100
Received: by pbcum15 with SMTP id um15so2589147pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 02:06:55 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.210.12 as permitted sender) client-ip=10.68.210.12; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.210.12 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.210.12])
	by 10.68.210.12 with SMTP id mq12mr86471228pbc.2.1329905215084
	(num_hops = 1); Wed, 22 Feb 2012 02:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=IopZVh49YvQOiYpEZ8VRExmw+YNk1RNIML+04zuufk0=;
	b=g+f31Pwq2IXnysUdifnT47byww3xzqqF1OqWE+1/pXxtf81QRJw5bxUrs+hs2XFblI
	O+0Z9vryKNGMeS05wydacYQ2/RuvuaxTF/deWigm2IA7MoJF2WcuvurThB3COGt3pLEj
	tXJfb3GuBV25HHUPCSYVk/vn/3gLdNiWdyRIw=
MIME-Version: 1.0
Received: by 10.68.210.12 with SMTP id mq12mr71106421pbc.2.1329905215019; Wed,
	22 Feb 2012 02:06:55 -0800 (PST)
Received: by 10.143.147.17 with HTTP; Wed, 22 Feb 2012 02:06:54 -0800 (PST)
In-Reply-To: <f00dfb824dfcab58a0b261b718c409a17d7e0bc5.1329780628.git.andrea.adami@gmail.com>
References: <cover.1329780628.git.andrea.adami@gmail.com>
	<f00dfb824dfcab58a0b261b718c409a17d7e0bc5.1329780628.git.andrea.adami@gmail.com>
Date: Wed, 22 Feb 2012 11:06:54 +0100
Message-ID: <CAAQYJAsQMFUjq66BY+51BeuSa=BfVyvJ=rUmaUVV4HC5rDbeAg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 5/6] meta-initramfs: add kexecboot recipes from meta-handheld
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
X-List-Received-Date: Wed, 22 Feb 2012 10:15:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2012 at 1:21 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> * (purged from device specific settings)
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =A0.../recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb =A0 =A0 | =A0 61 ++++++=
++++++++++++++
> =A0.../recipes-bsp/kexecboot/kexecboot-klibc_git.bb =A0 | =A0 12 ++++
> =A0meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc | =A0 54 ++++++++++=
+++++++
> =A0.../recipes-bsp/kexecboot/kexecboot_git.bb =A0 =A0 =A0 =A0 | =A0 =A09 =
+++
> =A04 files changed, 136 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_=
0.1.bb
> =A0create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot-klib=
c_git.bb
> =A0create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
> =A0create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.=
bb
>
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb b/=
meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
> new file mode 100644
> index 0000000..84c1116
> --- /dev/null
> +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
> @@ -0,0 +1,61 @@
> +DESCRIPTION =3D "Configuration file for kexecboot"
> +SECTION =3D "base"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
> +
> +PR =3D "r13"
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +
> +SRC_URI =3D "file://icon.xpm"
> +
> +CMDLINE ?=3D ""
> +CMDLINE_DEBUG ?=3D "${@base_conditional('DISTRO_TYPE', 'release', 'quiet=
', 'debug',d)}"
> +
> +# Note: for qvga the label is currently limited to about 24 chars
> +KEXECBOOT_LABEL ?=3D "${@d.getVar('DISTRO', True) or d.getVar('DISTRO_VE=
RSION', True)}-${MACHINE}"
> +
> +do_configure_prepend () {
> + =A0 =A0install -m 0644 ${WORKDIR}/icon.xpm ${S}
> +}
> +
> +do_install_prepend () {
> +echo '# First kernel stanza.
> +# Specify full kernel path on target.
> +KERNEL=3D/boot/${KERNEL_IMAGETYPE}
> +
> +# Show this label in kexecboot menu.
> +LABEL=3D${KEXECBOOT_LABEL}
> +#
> +# Append this tags to the kernel cmdline.
> +APPEND=3D${CMDLINE} ${CMDLINE_DEBUG}
> +#
> +# Specify optional initrd/initramfs.
> +# INITRD=3D/boot/initramfs.cpio.gz
> +#
> +# Specify full path for a custom icon for the menu-item.
> +# If not set, use device-icons as default (NAND, SD, CF, ...).
> +# ICON=3D/boot/icon.xpm
> +#
> +# Priority of item in kexecboot menu.
> +# Items with highest priority will be shown at top of menu.
> +# Default: 0 (lowest, ordered by device ordering)
> +# PRIORITY=3D10
> +#
> +#
> +# Second kernel stanza.
> +# KERNEL=3D/boot/${KERNEL_IMAGETYPE}-test
> +# LABEL=3D${DISTRO}-${MACHINE}-test
> +# APPEND=3D${CMDLINE}
> +#' >> ${S}/boot.cfg
> +}
> +
> +do_install () {
> + =A0 =A0 =A0 =A0install -d ${D}/boot
> + =A0 =A0 =A0 =A0install -m 0644 boot.cfg ${D}/boot/boot.cfg
> + =A0 =A0 =A0 =A0install -m 0644 icon.xpm ${D}/boot/icon.xpm
> +}
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +FILES_${PN} +=3D "/boot/*"
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb =
b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
> new file mode 100644
> index 0000000..0d6d00f
> --- /dev/null
> +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
> @@ -0,0 +1,12 @@
> +RDEPENDS_${PN} =3D "kexec-klibc"
> +PV =3D "0.5.9"
> +PR =3D "r8+gitr${SRCREV}"
> +
> +SRC_URI =3D "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.git=
;protocol=3Dgit "
> +SRCREV =3D "8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7"
> +S =3D "${WORKDIR}/git"
> +
> +# the binary is statically linked against klibc
> +inherit klibc
> +
> +require kexecboot.inc
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc b/meta-in=
itramfs/recipes-bsp/kexecboot/kexecboot.inc
> new file mode 100644
> index 0000000..a205904
> --- /dev/null
> +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
> @@ -0,0 +1,54 @@
> +###########################
> +# Configure options:
> +#
> +# =A0--enable-static-linking compile kexecboot as static executable [def=
ault=3Dno]
> +# =A0--enable-fbui =A0 =A0 =A0 =A0 =A0 support framebuffer menu [default=
=3Dyes]
> +# =A0--enable-fbui-width =A0 =A0 limit FB UI width to specified value [d=
efault=3Dno]
> +# =A0--enable-fbui-height =A0 =A0limit FB UI height to specified value [=
default=3Dno]
> +# =A0--enable-textui =A0 =A0 =A0 =A0 support console text user interface=
 [default=3Dno]
> +# =A0--enable-cfgfiles =A0 =A0 =A0 support config files [default=3Dyes]
> +# =A0--enable-icons =A0 =A0 =A0 =A0 =A0support custom icons (depends on =
fbui) [default=3Dyes]
> +# =A0--enable-zaurus =A0 =A0 =A0 =A0 compile Sharp Zaurus specific code =
[default=3Dno]
> +# =A0--enable-zimage =A0 =A0 =A0 =A0 compile with zImage support [defaul=
t=3Dyes]
> +# =A0--enable-uimage =A0 =A0 =A0 =A0 compile with uImage support [defaul=
t=3Dno]
> +# =A0--enable-machine-kernel look for machine-specific zImage kernel [de=
fault=3Dno]
> +# =A0--enable-devices-recreating
> +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enable devices re-c=
reating [default=3Dyes]
> +# =A0--enable-debug =A0 =A0 =A0 =A0 =A0enable debug output [default=3Dno=
]
> +# =A0--enable-host-debug =A0 =A0 allow for non-destructive executing of =
kexecboot on
> +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0host system [de=
fault=3Dno]
> +# =A0--enable-numkeys =A0 =A0 =A0 =A0enable menu item selection by keys =
[0-9] [default=3Dyes]
> +# =A0--enable-bg-buffer =A0 =A0 =A0enable buffer for pre-drawed FB GUI b=
ackground
> +#
> +# =A0--enable-timeout =A0 =A0 =A0 =A0allow to boot 1st kernel after time=
out in seconds
> +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[default=3Dno]
> +# =A0--enable-delay =A0 =A0 =A0 =A0 =A0specify delay before device scann=
ing, allowing
> +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0initialization =
of old CF/SD cards [default=3D1]
> +# =A0--enable-bpp =A0 =A0 =A0 =A0 =A0 =A0enable support of specified bpp=
 modes
> +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(all,32,24,18,1=
6,4,2,1) [default=3Dall]
> +# =A0--enable-evdev-rate =A0 =A0 change evdev (keyboard/mouse) repeat ra=
te
> +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in milliseconds=
 e.g. "1000,250" [default=3Dno]
> +# =A0--with-kexec-binary =A0 =A0 look for kexec binary at path
> +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[default=3D"/us=
r/sbin/kexec"]
> +##########################
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--enable-delay=3D2 --enable-evdev-rate=3D1000,250"
> +
> +do_install () {
> + =A0 =A0 =A0 =A0install -d ${D}${bindir}
> + =A0 =A0 =A0 =A0install -m 0755 kexecboot ${D}${bindir}/
> + =A0 =A0 =A0 =A0install -d ${D}/proc
> + =A0 =A0 =A0 =A0install -d ${D}/mnt
> + =A0 =A0 =A0 =A0install -d ${D}/dev
> +}
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +FILES_${PN} +=3D " ${bindir}/kexecboot /init /proc /mnt /dev"
> +
> +pkg_postinst_${PN} () {
> + =A0 =A0 =A0 =A0ln -sf ${bindir}/kexecboot $D/init
> +}
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta=
-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> new file mode 100644
> index 0000000..1341461
> --- /dev/null
> +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> @@ -0,0 +1,9 @@
> +RDEPENDS_${PN} =3D "kexec"
> +PV =3D "0.5.9"
> +PR =3D "r8+gitr${SRCREV}"
> +
> +SRC_URI =3D "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.git=
;protocol=3Dgit "
> +SRCREV =3D "8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7"
> +S =3D "${WORKDIR}/git"
> +
> +require kexecboot.inc
> --
> 1.7.3.4
>

Unfortunately I forgot to add /kexecboot-cfg/icon.xpm
I'll send a separate patch to fix the things in meta-initramfs.

Regards

Andrea


