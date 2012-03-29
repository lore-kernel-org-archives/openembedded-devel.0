Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SDCAS-0004jd-0S
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 12:01:20 +0200
Received: by yhjj56 with SMTP id j56so1322949yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 02:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=sYi/NUncSbPV1h9qv7ioVPQnVOqzDitgyUsfs6N2TqQ=;
	b=wBsjdn2/ioJ/1ws8DnCkplH70uWPafSv7dwUxHPBA0JAZ7wHesDMuTDH49remYLPI/
	MvPZZhYlBdr7CJSmp65GdlWU8PwYXEqCfxanxjg2FrmrXMBj3Iztwu1SzYRExiqJR1cc
	LlOwEHAMywU2lAfeBTtHpIv+c1HwlxkEnOVoykTG/r0FlJdapE0544cbQ20Wmikk8FDT
	SjrqWFL278dGadzTBUMsGJQKqA9fjPGjD4NVUDQyIvLmKVUl2hIe9qi6fAQHZ9KScZKf
	0tkFYmonfcjJY9PSbufxtxpYomHRJdl/7fK5rSpsGsSzOy2DXlJiW14/7rvY8LsUfagc
	2AFA==
MIME-Version: 1.0
Received: by 10.68.220.137 with SMTP id pw9mr4328436pbc.122.1333014735076;
	Thu, 29 Mar 2012 02:52:15 -0700 (PDT)
Received: by 10.143.165.10 with HTTP; Thu, 29 Mar 2012 02:52:15 -0700 (PDT)
In-Reply-To: <3065bcbfb2b5c24a3e316375b0afbedadf265665.1333002899.git.Martin.Jansa@gmail.com>
References: <cover.1333002899.git.Martin.Jansa@gmail.com>
	<082c61be8baa1e3b863ef083ff98ac97a6c594aa.1333002899.git.Martin.Jansa@gmail.com>
	<3065bcbfb2b5c24a3e316375b0afbedadf265665.1333002899.git.Martin.Jansa@gmail.com>
Date: Thu, 29 Mar 2012 11:52:15 +0200
Message-ID: <CAAQYJAts20KyLfPtXY3wUCd8R9awthfsPue+sbw6UuWcuujW0g@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 29 Mar 2012 10:01:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 8:35 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * notice that ARM_KEEP_OABI default value is now 0 instead of 1
> =A0but only linux-hackndev and linux-handhelds-2.6-2.6.21 had
> =A0CONFIG_OABI_COMPAT=3Dy in defconfigs so this shouldn't change anything
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0recipes-kernel/linux/linux.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0130 ------=
----------------------
> =A0recipes-kernel/linux/linux_2.6.29.bb =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes-kernel/linux/linux_3.0.1.bb =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes-kernel/linux/linux_3.1.bb =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes-kernel/linux/linux_3.2.bb =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes-kernel/linux/linux_git.bb =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes-kernel/linux/openezx-kernel_git.bb | =A0 =A02 +-
> =A07 files changed, 6 insertions(+), 136 deletions(-)
> =A0delete mode 100644 recipes-kernel/linux/linux.inc
>
> diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.=
inc
> deleted file mode 100644
> index f920b84..0000000
> --- a/recipes-kernel/linux/linux.inc
> +++ /dev/null
> @@ -1,130 +0,0 @@
> -DESCRIPTION =3D "Linux Kernel"
> -SECTION =3D "kernel"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
> -
> -INC_PR =3D "r0"
> -
> -inherit kernel siteinfo
> -
> -# Enable OABI compat for people stuck with obsolete userspace
> -ARM_KEEP_OABI ?=3D "1"
> -
> -# Set the verbosity of kernel messages during runtime
> -# You can define CMDLINE_DEBUG in your local.conf or distro.conf to over=
ride this behaviour
> -CMDLINE_DEBUG ?=3D "loglevel=3D3"
> -
> -# Kernel bootlogo is distro-specific (default is OE logo).
> -# Logo resolution (qvga, vga, ...) is machine-specific.
> -LOGO_SIZE ?=3D '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen", "v=
ga", "qvga", d)}'
> -# To use this, add file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 or sim=
ilar
> -# to your kernel recipe, and then structure your logos for each resoluti=
on
> -# accordingly.
> -
> -LOCALVERSION ?=3D ""
> -
> -kernel_conf_variable() {
> - =A0 =A0 =A0 CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CONFIG_$1[ =3D]/d;"
> - =A0 =A0 =A0 if test "$2" =3D "n"
> - =A0 =A0 =A0 then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "# CONFIG_$1 is not set" >> ${S}/.conf=
ig
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "CONFIG_$1=3D$2" >> ${S}/.config
> - =A0 =A0 =A0 fi
> -}
> -
> -do_configure_prepend() {
> - =A0 =A0 =A0 =A0echo "" > ${S}/.config
> - =A0 =A0 =A0 CONF_SED_SCRIPT=3D""
> -
> - =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 =A0# logo support, if you supply logo_linux_clut224.ppm in =
SRC_URI, then it's going to be used
> - =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 =A0if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0644 ${WORKDIR}/logo_linux_cl=
ut224.ppm drivers/video/logo/logo_linux_clut224.ppm
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable LOGO y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable LOGO_LINUX_CLUT224 y
> - =A0 =A0 =A0 =A0fi
> -
> - =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 =A0# oabi / eabi support
> - =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 kernel_conf_variable AEABI y
> - =A0 =A0 =A0 if [ "${ARM_KEEP_OABI}" =3D "1" ] ; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable OABI_COMPAT y
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable OABI_COMPAT n
> - =A0 =A0 =A0 fi
> -
> - =A0 =A0 =A0 =A0# When enabling thumb for userspace we also need thumb s=
upport in the kernel
> - =A0 =A0 =A0 =A0if [ "${ARM_INSTRUCTION_SET}" =3D "thumb" ] ; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable ARM_THUMB y
> - =A0 =A0 =A0 =A0fi
> -
> - =A0 =A0 =A0 kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}=
\""
> -
> - =A0 =A0 =A0 kernel_conf_variable LOCALVERSION "\"${LOCALVERSION}\""
> - =A0 =A0 =A0 kernel_conf_variable LOCALVERSION_AUTO n
> -
> - =A0 =A0 =A0 kernel_conf_variable SYSFS_DEPRECATED n
> - =A0 =A0 =A0 kernel_conf_variable SYSFS_DEPRECATED_V2 n
> - =A0 =A0 =A0 =A0kernel_conf_variable HOTPLUG y
> - =A0 =A0 =A0 =A0kernel_conf_variable UEVENT_HELPER_PATH \"\"
> - =A0 =A0 =A0 =A0kernel_conf_variable UNIX y
> - =A0 =A0 =A0 =A0kernel_conf_variable SYSFS y
> - =A0 =A0 =A0 =A0kernel_conf_variable PROC_FS y
> - =A0 =A0 =A0 =A0kernel_conf_variable TMPFS y
> - =A0 =A0 =A0 =A0kernel_conf_variable INOTIFY_USER y
> - =A0 =A0 =A0 =A0kernel_conf_variable SIGNALFD y
> - =A0 =A0 =A0 =A0kernel_conf_variable TMPFS_POSIX_ACL y
> - =A0 =A0 =A0 =A0kernel_conf_variable BLK_DEV_BSG y
> - =A0 =A0 =A0 =A0kernel_conf_variable DEVTMPFS y
> - =A0 =A0 =A0 =A0kernel_conf_variable DEVTMPFS_MOUNT y
> -
> - =A0 =A0 =A0 =A0# Newer inits like systemd need cgroup support
> - =A0 =A0 =A0 =A0if [ "${KERNEL_ENABLE_CGROUPS}" =3D "1" ] ; then
> - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_SCHED y
> - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUPS y
> - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_NS y
> - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_FREEZER y
> - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_DEVICE y
> - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CPUSETS y
> - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable PROC_PID_CPUSET y
> - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_CPUACCT y
> - =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable RESOURCE_COUNTERS y
> - =A0 =A0 =A0 =A0fi
> -
> - =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 =A0# root-over-nfs-over-usb-eth support. Limited, but shoul=
d cover some cases.
> - =A0 =A0 =A0 =A0# Enable this by setting a proper CMDLINE_NFSROOT_USB.
> - =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 =A0if [ ! -z "${CMDLINE_NFSROOT_USB}" ]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bbnote "Configuring the kernel for root-=
over-nfs-over-usb-eth with CMDLINE ${CMDLINE_NFSROOT_USB}"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable INET y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable IP_PNP y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable USB_GADGET y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable USB_GADGET_SELECTED=
 y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable USB_ETH y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable NFS_FS y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable ROOT_NFS y
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE \"${CMDLINE=
_NFSROOT_USB} ${CMDLINE_DEBUG}\"
> - =A0 =A0 =A0 =A0fi
> -
> - =A0 =A0 =A0 =A0sed -e "${CONF_SED_SCRIPT}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 < '${WORKDIR}/defconfig' >>'${S}/.config'
> -
> - =A0 =A0 =A0 yes '' | oe_runmake oldconfig
> -}
> -
> -do_configure_append() {
> - =A0 =A0 =A0 =A0if test -e scripts/Makefile.fwinst ; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e "s:-m0644:-m 0644:g" scripts/Make=
file.fwinst
> - =A0 =A0 =A0 fi
> -}
> -
> -do_install_append() {
> - =A0 =A0 =A0 oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_pr=
efix}/src/linux-${KERNEL_VERSION} ARCH=3D$ARCH
> -}
> -
> -PACKAGES =3D+ "kernel-headers"
> -FILES_kernel-headers =3D "${exec_prefix}/src/linux*"
> diff --git a/recipes-kernel/linux/linux_2.6.29.bb b/recipes-kernel/linux/=
linux_2.6.29.bb
> index e1da026..6640004 100644
> --- a/recipes-kernel/linux/linux_2.6.29.bb
> +++ b/recipes-kernel/linux/linux_2.6.29.bb
> @@ -1,4 +1,4 @@
> -require linux.inc
> +require recipes-kernel/linux/linux.inc
>
> =A0PR =3D "r0"
>
> diff --git a/recipes-kernel/linux/linux_3.0.1.bb b/recipes-kernel/linux/l=
inux_3.0.1.bb
> index 38c5196..5eb44d1 100644
> --- a/recipes-kernel/linux/linux_3.0.1.bb
> +++ b/recipes-kernel/linux/linux_3.0.1.bb
> @@ -1,4 +1,4 @@
> -require linux.inc
> +require recipes-kernel/linux/linux.inc
>
> =A0# Mark archs/machines that this kernel supports
> =A0DEFAULT_PREFERENCE =3D "-1"
> diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/lin=
ux_3.1.bb
> index 5e9a714..613f9e5 100644
> --- a/recipes-kernel/linux/linux_3.1.bb
> +++ b/recipes-kernel/linux/linux_3.1.bb
> @@ -1,4 +1,4 @@
> -require linux.inc
> +require recipes-kernel/linux/linux.inc
>
> =A0PR =3D "${INC_PR}.9"
> =A0COMPATIBLE_MACHINE =3D "(akita|c7x0|collie|poodle|tosa|spitz|h1940)"
> diff --git a/recipes-kernel/linux/linux_3.2.bb b/recipes-kernel/linux/lin=
ux_3.2.bb
> index 5379870..2799ab4 100644
> --- a/recipes-kernel/linux/linux_3.2.bb
> +++ b/recipes-kernel/linux/linux_3.2.bb
> @@ -1,4 +1,4 @@
> -require linux.inc
> +require recipes-kernel/linux/linux.inc
>
> =A0PR =3D "${INC_PR}.4"
> =A0COMPATIBLE_MACHINE =3D "(akita|c7x0|collie|poodle|tosa|spitz)"
> diff --git a/recipes-kernel/linux/linux_git.bb b/recipes-kernel/linux/lin=
ux_git.bb
> index 222df31..f7425ee 100644
> --- a/recipes-kernel/linux/linux_git.bb
> +++ b/recipes-kernel/linux/linux_git.bb
> @@ -1,4 +1,4 @@
> -require linux.inc
> +require recipes-kernel/linux/linux.inc
>
> =A0PR =3D "${INC_PR}.0"
> =A0COMPATIBLE_MACHINE =3D "spitz"
> diff --git a/recipes-kernel/linux/openezx-kernel_git.bb b/recipes-kernel/=
linux/openezx-kernel_git.bb
> index 03467d0..d48afa5 100644
> --- a/recipes-kernel/linux/openezx-kernel_git.bb
> +++ b/recipes-kernel/linux/openezx-kernel_git.bb
> @@ -6,7 +6,7 @@ KV =3D "2.6.38-oe"
> =A0PV =3D "${KV}+gitr${SRCREV}"
> =A0PR =3D "r0"
>
> -require linux.inc
> +require recipes-kernel/linux/linux.inc
>
> =A0# Make sure not to use thumb[-interworking]
> =A0ARM_INSTRUCTION_SET =3D "arm"
> --
> 1.7.8.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Martin,

I have some concerns here, because I don't think meta-handeld should
depend on meta-oe.
(I know udev .bbappend requires it now but talking with Paul we found
a better solution and udev will disappear from layer soon).

Then, I have already done some tests using linux-yocto with our
defconfigs and this could be indeed the future direction.
So, please, let it there until we decide the best approach.

Regards

Andrea


