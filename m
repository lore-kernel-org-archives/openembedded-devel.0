Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S09ni-0002HV-Ch
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 11:51:58 +0100
Received: by eaal10 with SMTP id l10so2563930eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 02:43:38 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.13.212 as permitted sender) client-ip=10.213.13.212; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.13.212 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.13.212])
	by 10.213.13.212 with SMTP id d20mr4705845eba.99.1329907418540
	(num_hops = 1); Wed, 22 Feb 2012 02:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=v/TR0Zj4AYGf9R4+DW/9nkAUHxcyRKq4623dUpIfjUI=;
	b=NI5N/3oLEqaNX5A5h7gTJ8Rmfpf0EiIc9yTOYRuGz/5p8mnkSNyDNlzRXCjCbliqN3
	hVhRbmG8H7QNp6QmOKicvP8YxB3N+FMSDNhz0+urLFKzI5hlh8hM1TznXeEctvPaqiFM
	1rLsJxQqWz+NXRLFByn0G7w3XoTelDSx7CCJw=
Received: by 10.213.13.212 with SMTP id d20mr3758799eba.99.1329907414087;
	Wed, 22 Feb 2012 02:43:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm98737917eem.0.2012.02.22.02.43.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 02:43:33 -0800 (PST)
Date: Wed, 22 Feb 2012 11:43:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120222104331.GI3769@jama.jama.net>
References: <cover.1329780628.git.andrea.adami@gmail.com>
	<f00dfb824dfcab58a0b261b718c409a17d7e0bc5.1329780628.git.andrea.adami@gmail.com>
	<CAAQYJAsQMFUjq66BY+51BeuSa=BfVyvJ=rUmaUVV4HC5rDbeAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAsQMFUjq66BY+51BeuSa=BfVyvJ=rUmaUVV4HC5rDbeAg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Wed, 22 Feb 2012 10:51:58 -0000
X-Groupsio-MsgNum: 37330
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ev7mvGV+3JQuI2Eo"
Content-Disposition: inline

--ev7mvGV+3JQuI2Eo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 11:06:54AM +0100, Andrea Adami wrote:
> On Tue, Feb 21, 2012 at 1:21 AM, Andrea Adami <andrea.adami@gmail.com> wr=
ote:
> > * (purged from device specific settings)

With this patchset applied to meta-oe and current meta-handheld master I
get strange bitbake error while parsing:

OE qemux86-64@shr ~/shr-core $ bitbake mcnavi
Pseudo is not present but is required, building this first before the main =
build
NOTE: Out of date cache found, rebuilding...
ERROR: Command execution failed: Exited with 1                             =
                                                                           =
                                                                        | E=
TA:  0:00:36
Summary: There were 0 ERROR messages shown, returning a non-zero exit code.

IIRC someone reported same error message yesterday on IRC or ML.

Removing meta-handheld from bblayers.conf allows me to finish parsing=20
and adding new meta-initramfs to bblayers.conf works too.

Maybe it's some require/include/inherit without corresponding file availabl=
e,=20
but for those it was showing reasonable error message before..

Cheers,

> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> > =A0.../recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb =A0 =A0 | =A0 61 ++++=
++++++++++++++++
> > =A0.../recipes-bsp/kexecboot/kexecboot-klibc_git.bb =A0 | =A0 12 ++++
> > =A0meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc | =A0 54 ++++++++=
+++++++++
> > =A0.../recipes-bsp/kexecboot/kexecboot_git.bb =A0 =A0 =A0 =A0 | =A0 =A0=
9 +++
> > =A04 files changed, 136 insertions(+), 0 deletions(-)
> > =A0create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cf=
g_0.1.bb
> > =A0create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot-kl=
ibc_git.bb
> > =A0create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
> > =A0create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot_gi=
t.bb
> >
> > diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb =
b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
> > new file mode 100644
> > index 0000000..84c1116
> > --- /dev/null
> > +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
> > @@ -0,0 +1,61 @@
> > +DESCRIPTION =3D "Configuration file for kexecboot"
> > +SECTION =3D "base"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109=
285ec7b81fdeb3b58"
> > +
> > +PR =3D "r13"
> > +
> > +INHIBIT_DEFAULT_DEPS =3D "1"
> > +
> > +SRC_URI =3D "file://icon.xpm"
> > +
> > +CMDLINE ?=3D ""
> > +CMDLINE_DEBUG ?=3D "${@base_conditional('DISTRO_TYPE', 'release', 'qui=
et', 'debug',d)}"
> > +
> > +# Note: for qvga the label is currently limited to about 24 chars
> > +KEXECBOOT_LABEL ?=3D "${@d.getVar('DISTRO', True) or d.getVar('DISTRO_=
VERSION', True)}-${MACHINE}"
> > +
> > +do_configure_prepend () {
> > + =A0 =A0install -m 0644 ${WORKDIR}/icon.xpm ${S}
> > +}
> > +
> > +do_install_prepend () {
> > +echo '# First kernel stanza.
> > +# Specify full kernel path on target.
> > +KERNEL=3D/boot/${KERNEL_IMAGETYPE}
> > +
> > +# Show this label in kexecboot menu.
> > +LABEL=3D${KEXECBOOT_LABEL}
> > +#
> > +# Append this tags to the kernel cmdline.
> > +APPEND=3D${CMDLINE} ${CMDLINE_DEBUG}
> > +#
> > +# Specify optional initrd/initramfs.
> > +# INITRD=3D/boot/initramfs.cpio.gz
> > +#
> > +# Specify full path for a custom icon for the menu-item.
> > +# If not set, use device-icons as default (NAND, SD, CF, ...).
> > +# ICON=3D/boot/icon.xpm
> > +#
> > +# Priority of item in kexecboot menu.
> > +# Items with highest priority will be shown at top of menu.
> > +# Default: 0 (lowest, ordered by device ordering)
> > +# PRIORITY=3D10
> > +#
> > +#
> > +# Second kernel stanza.
> > +# KERNEL=3D/boot/${KERNEL_IMAGETYPE}-test
> > +# LABEL=3D${DISTRO}-${MACHINE}-test
> > +# APPEND=3D${CMDLINE}
> > +#' >> ${S}/boot.cfg
> > +}
> > +
> > +do_install () {
> > + =A0 =A0 =A0 =A0install -d ${D}/boot
> > + =A0 =A0 =A0 =A0install -m 0644 boot.cfg ${D}/boot/boot.cfg
> > + =A0 =A0 =A0 =A0install -m 0644 icon.xpm ${D}/boot/icon.xpm
> > +}
> > +
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +FILES_${PN} +=3D "/boot/*"
> > diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.b=
b b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
> > new file mode 100644
> > index 0000000..0d6d00f
> > --- /dev/null
> > +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
> > @@ -0,0 +1,12 @@
> > +RDEPENDS_${PN} =3D "kexec-klibc"
> > +PV =3D "0.5.9"
> > +PR =3D "r8+gitr${SRCREV}"
> > +
> > +SRC_URI =3D "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.g=
it;protocol=3Dgit "
> > +SRCREV =3D "8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7"
> > +S =3D "${WORKDIR}/git"
> > +
> > +# the binary is statically linked against klibc
> > +inherit klibc
> > +
> > +require kexecboot.inc
> > diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc b/meta-=
initramfs/recipes-bsp/kexecboot/kexecboot.inc
> > new file mode 100644
> > index 0000000..a205904
> > --- /dev/null
> > +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
> > @@ -0,0 +1,54 @@
> > +###########################
> > +# Configure options:
> > +#
> > +# =A0--enable-static-linking compile kexecboot as static executable [d=
efault=3Dno]
> > +# =A0--enable-fbui =A0 =A0 =A0 =A0 =A0 support framebuffer menu [defau=
lt=3Dyes]
> > +# =A0--enable-fbui-width =A0 =A0 limit FB UI width to specified value =
[default=3Dno]
> > +# =A0--enable-fbui-height =A0 =A0limit FB UI height to specified value=
 [default=3Dno]
> > +# =A0--enable-textui =A0 =A0 =A0 =A0 support console text user interfa=
ce [default=3Dno]
> > +# =A0--enable-cfgfiles =A0 =A0 =A0 support config files [default=3Dyes]
> > +# =A0--enable-icons =A0 =A0 =A0 =A0 =A0support custom icons (depends o=
n fbui) [default=3Dyes]
> > +# =A0--enable-zaurus =A0 =A0 =A0 =A0 compile Sharp Zaurus specific cod=
e [default=3Dno]
> > +# =A0--enable-zimage =A0 =A0 =A0 =A0 compile with zImage support [defa=
ult=3Dyes]
> > +# =A0--enable-uimage =A0 =A0 =A0 =A0 compile with uImage support [defa=
ult=3Dno]
> > +# =A0--enable-machine-kernel look for machine-specific zImage kernel [=
default=3Dno]
> > +# =A0--enable-devices-recreating
> > +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enable devices re=
-creating [default=3Dyes]
> > +# =A0--enable-debug =A0 =A0 =A0 =A0 =A0enable debug output [default=3D=
no]
> > +# =A0--enable-host-debug =A0 =A0 allow for non-destructive executing o=
f kexecboot on
> > +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0host system [=
default=3Dno]
> > +# =A0--enable-numkeys =A0 =A0 =A0 =A0enable menu item selection by key=
s [0-9] [default=3Dyes]
> > +# =A0--enable-bg-buffer =A0 =A0 =A0enable buffer for pre-drawed FB GUI=
 background
> > +#
> > +# =A0--enable-timeout =A0 =A0 =A0 =A0allow to boot 1st kernel after ti=
meout in seconds
> > +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[default=3Dno]
> > +# =A0--enable-delay =A0 =A0 =A0 =A0 =A0specify delay before device sca=
nning, allowing
> > +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0initializatio=
n of old CF/SD cards [default=3D1]
> > +# =A0--enable-bpp =A0 =A0 =A0 =A0 =A0 =A0enable support of specified b=
pp modes
> > +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(all,32,24,18=
,16,4,2,1) [default=3Dall]
> > +# =A0--enable-evdev-rate =A0 =A0 change evdev (keyboard/mouse) repeat =
rate
> > +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in millisecon=
ds e.g. "1000,250" [default=3Dno]
> > +# =A0--with-kexec-binary =A0 =A0 look for kexec binary at path
> > +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[default=3D"/=
usr/sbin/kexec"]
> > +##########################
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> > +inherit autotools
> > +
> > +EXTRA_OECONF =3D "--enable-delay=3D2 --enable-evdev-rate=3D1000,250"
> > +
> > +do_install () {
> > + =A0 =A0 =A0 =A0install -d ${D}${bindir}
> > + =A0 =A0 =A0 =A0install -m 0755 kexecboot ${D}${bindir}/
> > + =A0 =A0 =A0 =A0install -d ${D}/proc
> > + =A0 =A0 =A0 =A0install -d ${D}/mnt
> > + =A0 =A0 =A0 =A0install -d ${D}/dev
> > +}
> > +
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +FILES_${PN} +=3D " ${bindir}/kexecboot /init /proc /mnt /dev"
> > +
> > +pkg_postinst_${PN} () {
> > + =A0 =A0 =A0 =A0ln -sf ${bindir}/kexecboot $D/init
> > +}
> > diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/me=
ta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> > new file mode 100644
> > index 0000000..1341461
> > --- /dev/null
> > +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> > @@ -0,0 +1,9 @@
> > +RDEPENDS_${PN} =3D "kexec"
> > +PV =3D "0.5.9"
> > +PR =3D "r8+gitr${SRCREV}"
> > +
> > +SRC_URI =3D "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.g=
it;protocol=3Dgit "
> > +SRCREV =3D "8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7"
> > +S =3D "${WORKDIR}/git"
> > +
> > +require kexecboot.inc
> > --
> > 1.7.3.4
> >
>=20
> Unfortunately I forgot to add /kexecboot-cfg/icon.xpm
> I'll send a separate patch to fix the things in meta-initramfs.
>=20
> Regards
>=20
> Andrea
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ev7mvGV+3JQuI2Eo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9ExtIACgkQN1Ujt2V2gBzERwCfXvEg9Ca+GezfoDYuiOdJMwDT
GEAAoJL5yagZweGBTL9x9lUgPWl87M/B
=fOeg
-----END PGP SIGNATURE-----

--ev7mvGV+3JQuI2Eo--
