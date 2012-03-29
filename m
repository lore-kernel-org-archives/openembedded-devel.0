Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDFny-0001FF-Kj
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 15:54:22 +0200
Received: by wibhj13 with SMTP id hj13so67982wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=g4Aaei28AWHLj+gLRoDqZn3amQ+piOfIitkjzreomJM=;
	b=FYa+jnAkq48YyFy1uOR6dTRHYxP+bwg3zreiUuGYj+f6isRYrySVrLjivkSPjgcUaE
	vQsvfWV/62+SFF81a3iFpVJgZLpCBbnKZ2qcWTZ+j0RKRUin30BEsiUXBaf3aj68aL+z
	u6VkVNUb4ii/z6G9UI77FHwrh6vTEi7Mb87jeVUtpTknt5l8/ZHGzNyjpT3Mf/hBBNyn
	7yYH/sD99J9VIL3PtrUHPJ9wJFJvlMpjON98ENzK8/Y/WGD6yfsNNErcYTKDxfBOpllt
	CZ4nI70q7dH9Cg9b/46eyBJBxbgSsIxvwRt+4nNDNQWioEGOMKK4Hhp4mOCXNWSvPufs
	Zz1w==
Received: by 10.180.20.47 with SMTP id k15mr5737067wie.19.1333028719359;
	Thu, 29 Mar 2012 06:45:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm67197206wiy.7.2012.03.29.06.45.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 06:45:18 -0700 (PDT)
Date: Thu, 29 Mar 2012 15:45:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120329134519.GL4004@jama.jama.net>
References: <cover.1333002899.git.Martin.Jansa@gmail.com>
	<082c61be8baa1e3b863ef083ff98ac97a6c594aa.1333002899.git.Martin.Jansa@gmail.com>
	<3065bcbfb2b5c24a3e316375b0afbedadf265665.1333002899.git.Martin.Jansa@gmail.com>
	<CAAQYJAts20KyLfPtXY3wUCd8R9awthfsPue+sbw6UuWcuujW0g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAts20KyLfPtXY3wUCd8R9awthfsPue+sbw6UuWcuujW0g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld][PATCH 2/2] recipes-kernel: use shared linux.inc from meta-oe
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
X-List-Received-Date: Thu, 29 Mar 2012 13:54:22 -0000
X-Groupsio-MsgNum: 38074
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7vAdt9JsdkkzRPKN"
Content-Disposition: inline

--7vAdt9JsdkkzRPKN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 11:52:15AM +0200, Andrea Adami wrote:
> On Thu, Mar 29, 2012 at 8:35 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > * notice that ARM_KEEP_OABI default value is now 0 instead of 1
> > =A0but only linux-hackndev and linux-handhelds-2.6-2.6.21 had
> > =A0CONFIG_OABI_COMPAT=3Dy in defconfigs so this shouldn't change anythi=
ng
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > =A0recipes-kernel/linux/linux.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0130 ----=
------------------------
> > =A0recipes-kernel/linux/linux_2.6.29.bb =A0 =A0 =A0 | =A0 =A02 +-
> > =A0recipes-kernel/linux/linux_3.0.1.bb =A0 =A0 =A0 =A0| =A0 =A02 +-
> > =A0recipes-kernel/linux/linux_3.1.bb =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> > =A0recipes-kernel/linux/linux_3.2.bb =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> > =A0recipes-kernel/linux/linux_git.bb =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> > =A0recipes-kernel/linux/openezx-kernel_git.bb | =A0 =A02 +-
> > =A07 files changed, 6 insertions(+), 136 deletions(-)
> > =A0delete mode 100644 recipes-kernel/linux/linux.inc
> >
> > diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linu=
x.inc
> > deleted file mode 100644
> > index f920b84..0000000
> > --- a/recipes-kernel/linux/linux.inc
> > +++ /dev/null
> > @@ -1,130 +0,0 @@
> > -DESCRIPTION =3D "Linux Kernel"
> > -SECTION =3D "kernel"
> > -LICENSE =3D "GPLv2"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1b=
e7cd7"
> > -
> > -INC_PR =3D "r0"
> > -
> > -inherit kernel siteinfo
> > -
> > -# Enable OABI compat for people stuck with obsolete userspace
> > -ARM_KEEP_OABI ?=3D "1"
> > -
> > -# Set the verbosity of kernel messages during runtime
> > -# You can define CMDLINE_DEBUG in your local.conf or distro.conf to ov=
erride this behaviour
> > -CMDLINE_DEBUG ?=3D "loglevel=3D3"
> > -
> > -# Kernel bootlogo is distro-specific (default is OE logo).
> > -# Logo resolution (qvga, vga, ...) is machine-specific.
> > -LOGO_SIZE ?=3D '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen", =
"vga", "qvga", d)}'
> > -# To use this, add file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 or s=
imilar
> > -# to your kernel recipe, and then structure your logos for each resolu=
tion
> > -# accordingly.
> > -
> > -LOCALVERSION ?=3D ""
> > -
> > -kernel_conf_variable() {
> > - =A0 =A0 =A0 CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CONFIG_$1[ =3D]/d;"
> > - =A0 =A0 =A0 if test "$2" =3D "n"
> > - =A0 =A0 =A0 then
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "# CONFIG_$1 is not set" >> ${S}/.co=
nfig
> > - =A0 =A0 =A0 else
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "CONFIG_$1=3D$2" >> ${S}/.config
> > - =A0 =A0 =A0 fi
> > -}
> > -
> > -do_configure_prepend() {
> > - =A0 =A0 =A0 =A0echo "" > ${S}/.config
> > - =A0 =A0 =A0 CONF_SED_SCRIPT=3D""
> > -
> > - =A0 =A0 =A0 =A0#
> > - =A0 =A0 =A0 =A0# logo support, if you supply logo_linux_clut224.ppm i=
n SRC_URI, then it's going to be used
> > - =A0 =A0 =A0 =A0#
> > - =A0 =A0 =A0 =A0if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0644 ${WORKDIR}/logo_linux_=
clut224.ppm drivers/video/logo/logo_linux_clut224.ppm
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable LOGO y
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable LOGO_LINUX_CLUT224 y
> > - =A0 =A0 =A0 =A0fi
> > -
> > - =A0 =A0 =A0 =A0#
> > - =A0 =A0 =A0 =A0# oabi / eabi support
> > - =A0 =A0 =A0 =A0#
> > - =A0 =A0 =A0 kernel_conf_variable AEABI y
> > - =A0 =A0 =A0 if [ "${ARM_KEEP_OABI}" =3D "1" ] ; then
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable OABI_COMPAT y
> > - =A0 =A0 =A0 else
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable OABI_COMPAT n
> > - =A0 =A0 =A0 fi
> > -
> > - =A0 =A0 =A0 =A0# When enabling thumb for userspace we also need thumb=
 support in the kernel
> > - =A0 =A0 =A0 =A0if [ "${ARM_INSTRUCTION_SET}" =3D "thumb" ] ; then
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable ARM_THUMB y
> > - =A0 =A0 =A0 =A0fi
> > -
> > - =A0 =A0 =A0 kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBU=
G}\""
> > -
> > - =A0 =A0 =A0 kernel_conf_variable LOCALVERSION "\"${LOCALVERSION}\""
> > - =A0 =A0 =A0 kernel_conf_variable LOCALVERSION_AUTO n
> > -
> > - =A0 =A0 =A0 kernel_conf_variable SYSFS_DEPRECATED n
> > - =A0 =A0 =A0 kernel_conf_variable SYSFS_DEPRECATED_V2 n
> > - =A0 =A0 =A0 =A0kernel_conf_variable HOTPLUG y
> > - =A0 =A0 =A0 =A0kernel_conf_variable UEVENT_HELPER_PATH \"\"
> > - =A0 =A0 =A0 =A0kernel_conf_variable UNIX y
> > - =A0 =A0 =A0 =A0kernel_conf_variable SYSFS y
> > - =A0 =A0 =A0 =A0kernel_conf_variable PROC_FS y
> > - =A0 =A0 =A0 =A0kernel_conf_variable TMPFS y
> > - =A0 =A0 =A0 =A0kernel_conf_variable INOTIFY_USER y
> > - =A0 =A0 =A0 =A0kernel_conf_variable SIGNALFD y
> > - =A0 =A0 =A0 =A0kernel_conf_variable TMPFS_POSIX_ACL y
> > - =A0 =A0 =A0 =A0kernel_conf_variable BLK_DEV_BSG y
> > - =A0 =A0 =A0 =A0kernel_conf_variable DEVTMPFS y
> > - =A0 =A0 =A0 =A0kernel_conf_variable DEVTMPFS_MOUNT y
> > -
> > - =A0 =A0 =A0 =A0# Newer inits like systemd need cgroup support
> > - =A0 =A0 =A0 =A0if [ "${KERNEL_ENABLE_CGROUPS}" =3D "1" ] ; then
> > - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_SCHED y
> > - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUPS y
> > - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_NS y
> > - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_FREEZER y
> > - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_DEVICE y
> > - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CPUSETS y
> > - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable PROC_PID_CPUSET y
> > - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_CPUACCT y
> > - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable RESOURCE_COUNTERS y
> > - =A0 =A0 =A0 =A0fi
> > -
> > - =A0 =A0 =A0 =A0#
> > - =A0 =A0 =A0 =A0# root-over-nfs-over-usb-eth support. Limited, but sho=
uld cover some cases.
> > - =A0 =A0 =A0 =A0# Enable this by setting a proper CMDLINE_NFSROOT_USB.
> > - =A0 =A0 =A0 =A0#
> > - =A0 =A0 =A0 =A0if [ ! -z "${CMDLINE_NFSROOT_USB}" ]; then
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bbnote "Configuring the kernel for roo=
t-over-nfs-over-usb-eth with CMDLINE ${CMDLINE_NFSROOT_USB}"
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable INET y
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable IP_PNP y
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable USB_GADGET y
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable USB_GADGET_SELECT=
ED y
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable USB_ETH y
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable NFS_FS y
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable ROOT_NFS y
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE \"${CMDLI=
NE_NFSROOT_USB} ${CMDLINE_DEBUG}\"
> > - =A0 =A0 =A0 =A0fi
> > -
> > - =A0 =A0 =A0 =A0sed -e "${CONF_SED_SCRIPT}" \
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 < '${WORKDIR}/defconfig' >>'${S}/.config'
> > -
> > - =A0 =A0 =A0 yes '' | oe_runmake oldconfig
> > -}
> > -
> > -do_configure_append() {
> > - =A0 =A0 =A0 =A0if test -e scripts/Makefile.fwinst ; then
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e "s:-m0644:-m 0644:g" scripts/Ma=
kefile.fwinst
> > - =A0 =A0 =A0 fi
> > -}
> > -
> > -do_install_append() {
> > - =A0 =A0 =A0 oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_=
prefix}/src/linux-${KERNEL_VERSION} ARCH=3D$ARCH
> > -}
> > -
> > -PACKAGES =3D+ "kernel-headers"
> > -FILES_kernel-headers =3D "${exec_prefix}/src/linux*"
> > diff --git a/recipes-kernel/linux/linux_2.6.29.bb b/recipes-kernel/linu=
x/linux_2.6.29.bb
> > index e1da026..6640004 100644
> > --- a/recipes-kernel/linux/linux_2.6.29.bb
> > +++ b/recipes-kernel/linux/linux_2.6.29.bb
> > @@ -1,4 +1,4 @@
> > -require linux.inc
> > +require recipes-kernel/linux/linux.inc
> >
> > =A0PR =3D "r0"
> >
> > diff --git a/recipes-kernel/linux/linux_3.0.1.bb b/recipes-kernel/linux=
/linux_3.0.1.bb
> > index 38c5196..5eb44d1 100644
> > --- a/recipes-kernel/linux/linux_3.0.1.bb
> > +++ b/recipes-kernel/linux/linux_3.0.1.bb
> > @@ -1,4 +1,4 @@
> > -require linux.inc
> > +require recipes-kernel/linux/linux.inc
> >
> > =A0# Mark archs/machines that this kernel supports
> > =A0DEFAULT_PREFERENCE =3D "-1"
> > diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/l=
inux_3.1.bb
> > index 5e9a714..613f9e5 100644
> > --- a/recipes-kernel/linux/linux_3.1.bb
> > +++ b/recipes-kernel/linux/linux_3.1.bb
> > @@ -1,4 +1,4 @@
> > -require linux.inc
> > +require recipes-kernel/linux/linux.inc
> >
> > =A0PR =3D "${INC_PR}.9"
> > =A0COMPATIBLE_MACHINE =3D "(akita|c7x0|collie|poodle|tosa|spitz|h1940)"
> > diff --git a/recipes-kernel/linux/linux_3.2.bb b/recipes-kernel/linux/l=
inux_3.2.bb
> > index 5379870..2799ab4 100644
> > --- a/recipes-kernel/linux/linux_3.2.bb
> > +++ b/recipes-kernel/linux/linux_3.2.bb
> > @@ -1,4 +1,4 @@
> > -require linux.inc
> > +require recipes-kernel/linux/linux.inc
> >
> > =A0PR =3D "${INC_PR}.4"
> > =A0COMPATIBLE_MACHINE =3D "(akita|c7x0|collie|poodle|tosa|spitz)"
> > diff --git a/recipes-kernel/linux/linux_git.bb b/recipes-kernel/linux/l=
inux_git.bb
> > index 222df31..f7425ee 100644
> > --- a/recipes-kernel/linux/linux_git.bb
> > +++ b/recipes-kernel/linux/linux_git.bb
> > @@ -1,4 +1,4 @@
> > -require linux.inc
> > +require recipes-kernel/linux/linux.inc
> >
> > =A0PR =3D "${INC_PR}.0"
> > =A0COMPATIBLE_MACHINE =3D "spitz"
> > diff --git a/recipes-kernel/linux/openezx-kernel_git.bb b/recipes-kerne=
l/linux/openezx-kernel_git.bb
> > index 03467d0..d48afa5 100644
> > --- a/recipes-kernel/linux/openezx-kernel_git.bb
> > +++ b/recipes-kernel/linux/openezx-kernel_git.bb
> > @@ -6,7 +6,7 @@ KV =3D "2.6.38-oe"
> > =A0PV =3D "${KV}+gitr${SRCREV}"
> > =A0PR =3D "r0"
> >
> > -require linux.inc
> > +require recipes-kernel/linux/linux.inc
> >
> > =A0# Make sure not to use thumb[-interworking]
> > =A0ARM_INSTRUCTION_SET =3D "arm"
> > --
> > 1.7.8.5
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> Martin,
>=20
> I have some concerns here, because I don't think meta-handeld should
> depend on meta-oe.
> (I know udev .bbappend requires it now but talking with Paul we found
> a better solution and udev will disappear from layer soon).

Denis wanted linux.inc also in some smaller layer then meta-oe, so maybe
we can create meta-bsp-support in meta-opememebedded repository and move
it there?

Having linux.inc copy for each BSP is wrong.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7vAdt9JsdkkzRPKN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk90Z28ACgkQN1Ujt2V2gByZEgCcCkvHsQmdAihKjTlrhNHoed8b
qJYAnial3vvOpe05H3oWXv/NHUEVEmDS
=YtEe
-----END PGP SIGNATURE-----

--7vAdt9JsdkkzRPKN--
