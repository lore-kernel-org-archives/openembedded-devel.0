Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SB5AV-0004G8-BA
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 15:08:39 +0100
Received: by yenm3 with SMTP id m3so2730178yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 06:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ALsWxJc7PLkNN0V6C7gyMzOpd95StJ0Fg69/b6Re4TU=;
	b=JvQI8w+uUMN4k7woW4g76osDpPh77w23sJ6PBCZbfNS7Sem9ZC+IfqWLiTP5a4E2ew
	3pQPyyjUpLNiiDfBs96mKeWy1HMRNa+WPiyHvjIWJ3DmlnR79H5PTy+RCJwuRP2XKYwU
	t6LdMFLGzFf0EklHCxKb7ZexZKezm/gh/Q+CYSEugP6v/u/t6vnpDTLlvybeaCFvrXlm
	TcLH5lDoYHKhwxgdj+QCoI+8QrtGKSdbxKVRiK75PidULkGlkLxVWYQNI4vGzavwl8ER
	66uFu1wTB6Th1lxywgoRGF6v6MDtovsycmZVgfNRH59l08XWrIT48Xlvz+CZ/NGH7vaw
	w0TA==
MIME-Version: 1.0
Received: by 10.60.22.10 with SMTP id z10mr15524613oee.16.1332511182523; Fri,
	23 Mar 2012 06:59:42 -0700 (PDT)
Received: by 10.182.36.196 with HTTP; Fri, 23 Mar 2012 06:59:42 -0700 (PDT)
In-Reply-To: <b16115c16837e5aa6a3ad556a37832192c128f43.1332507730.git.Martin.Jansa@gmail.com>
References: <cover.1332507730.git.Martin.Jansa@gmail.com>
	<3fca50b933c63bab6cff938db607bcecde86fd3d.1332507730.git.Martin.Jansa@gmail.com>
	<b16115c16837e5aa6a3ad556a37832192c128f43.1332507730.git.Martin.Jansa@gmail.com>
Date: Fri, 23 Mar 2012 14:59:42 +0100
Message-ID: <CAAQYJAvNR8RhJRd_oK4VnJcYJQVaxY2BVEpsEfSEVHVvCxf6vQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 3/5] linux: import shared linux.inc so we have just one copy
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
X-List-Received-Date: Fri, 23 Mar 2012 14:08:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 2:04 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * in my env I have 7 copies now
> =A0./meta-smartphone/meta-htc/recipes-kernel/linux/linux.inc
> =A0./meta-smartphone/meta-nokia/recipes-kernel/linux/linux.inc
> =A0./meta-smartphone/meta-openmoko/recipes-kernel/linux/linux.inc
> =A0./meta-smartphone/meta-samsung/recipes-kernel/linux/linux.inc
> =A0./meta-smartphone/meta-palm/recipes-kernel/linux/linux.inc
> =A0./meta-ti/recipes-kernel/linux/linux.inc
> =A0./meta-handheld/recipes-kernel/linux/linux.inc
> =A0meta-smartphone's are 100% identical, meta-handheld is slightly
> =A0different (ARM_KEEP_OABI can be set in recipe after require .inc) and
> =A0meta-ti seems like much older version of linux.inc
>

Good idea Martin!
Only some minor thoughts:

> +CMDLINE_DEBUG ?=3D "loglevel=3D3"

Actually setting loglevel=3D3 is too low. We did this to protect bootlogo.
Probably "ignore_loglevel" is the more appropriate for debug (this
will print /all/ kernel messages to the console.
Where should we expect to define CMDLINE_DEBUG? At machine level?
Distro level? User choice/local.conf?

> +LOGO_SIZE ?=3D '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen", "v=
ga", "qvga", d)}'
This is maybe too specific and iirc was causing issues when LOGO_SIZE
and MACHINE_GUI_CLASS were unset.
Need to be tested out of meta-handheld.


> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0meta-oe/recipes-kernel/linux/linux.inc | =A0131 ++++++++++++++++++++++=
++++++++++
> =A01 files changed, 131 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta-oe/recipes-kernel/linux/linux.inc
>
> diff --git a/meta-oe/recipes-kernel/linux/linux.inc b/meta-oe/recipes-ker=
nel/linux/linux.inc
> new file mode 100644
> index 0000000..2b2fbf3
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/linux/linux.inc
> @@ -0,0 +1,131 @@
> +DESCRIPTION =3D "Linux Kernel"
> +SECTION =3D "kernel"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
> +
> +INC_PR =3D "r0"
> +
> +inherit kernel siteinfo
> +
> +# Enable OABI compat for people stuck with obsolete userspace
> +ARM_KEEP_OABI ?=3D "0"
> +
> +# Set the verbosity of kernel messages during runtime
> +# You can define CMDLINE_DEBUG in your local.conf or distro.conf to over=
ride this behaviour
> +CMDLINE_DEBUG ?=3D "loglevel=3D3"
> +
> +# Kernel bootlogo is distro-specific (default is OE logo).
> +# Logo resolution (qvga, vga, ...) is machine-specific.
> +LOGO_SIZE ?=3D '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen", "v=
ga", "qvga", d)}'
> +# To use this, add file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 or sim=
ilar
> +# to your kernel recipe, and then structure your logos for each resoluti=
on
> +# accordingly.
> +
> +LOCALVERSION ?=3D ""
> +
> +#kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\""
> +kernel_conf_variable() {
> + =A0 =A0 =A0 CONF_SED_SCRIPT=3D"$CONF_SED_SCRIPT /CONFIG_$1[ =3D]/d;"
> + =A0 =A0 =A0 if test "$2" =3D "n"
> + =A0 =A0 =A0 then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "# CONFIG_$1 is not set" >> ${S}/.conf=
ig
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "CONFIG_$1=3D$2" >> ${S}/.config
> + =A0 =A0 =A0 fi
> +}
> +
> +do_configure_prepend() {
> + =A0 =A0 =A0 =A0echo "" > ${S}/.config
> + =A0 =A0 =A0 CONF_SED_SCRIPT=3D""
> +
> + =A0 =A0 =A0 =A0#
> + =A0 =A0 =A0 =A0# logo support, if you supply logo_linux_clut224.ppm in =
SRC_URI, then it's going to be used
> + =A0 =A0 =A0 =A0#
> + =A0 =A0 =A0 =A0if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0644 ${WORKDIR}/logo_linux_cl=
ut224.ppm drivers/video/logo/logo_linux_clut224.ppm
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable LOGO y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable LOGO_LINUX_CLUT224 y
> + =A0 =A0 =A0 =A0fi
> +
> + =A0 =A0 =A0 =A0#
> + =A0 =A0 =A0 =A0# oabi / eabi support
> + =A0 =A0 =A0 =A0#
> + =A0 =A0 =A0 kernel_conf_variable AEABI y
> + =A0 =A0 =A0 if [ "${ARM_KEEP_OABI}" =3D "1" ] ; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable OABI_COMPAT y
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable OABI_COMPAT n
> + =A0 =A0 =A0 fi
> +
> + =A0 =A0 =A0 =A0# When enabling thumb for userspace we also need thumb s=
upport in the kernel
> + =A0 =A0 =A0 =A0if [ "${ARM_INSTRUCTION_SET}" =3D "thumb" ] ; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel_conf_variable ARM_THUMB y
> + =A0 =A0 =A0 =A0fi
> +
> + =A0 =A0 =A0 kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}=
\""
> +
> + =A0 =A0 =A0 kernel_conf_variable LOCALVERSION "\"${LOCALVERSION}\""
> + =A0 =A0 =A0 kernel_conf_variable LOCALVERSION_AUTO n
> +
> + =A0 =A0 =A0 kernel_conf_variable SYSFS_DEPRECATED n
> + =A0 =A0 =A0 kernel_conf_variable SYSFS_DEPRECATED_V2 n
> + =A0 =A0 =A0 =A0kernel_conf_variable HOTPLUG y
> + =A0 =A0 =A0 =A0kernel_conf_variable UEVENT_HELPER_PATH \"\"
> + =A0 =A0 =A0 =A0kernel_conf_variable UNIX y
> + =A0 =A0 =A0 =A0kernel_conf_variable SYSFS y
> + =A0 =A0 =A0 =A0kernel_conf_variable PROC_FS y
> + =A0 =A0 =A0 =A0kernel_conf_variable TMPFS y
> + =A0 =A0 =A0 =A0kernel_conf_variable INOTIFY_USER y
> + =A0 =A0 =A0 =A0kernel_conf_variable SIGNALFD y
> + =A0 =A0 =A0 =A0kernel_conf_variable TMPFS_POSIX_ACL y
> + =A0 =A0 =A0 =A0kernel_conf_variable BLK_DEV_BSG y
> + =A0 =A0 =A0 =A0kernel_conf_variable DEVTMPFS y
> + =A0 =A0 =A0 =A0kernel_conf_variable DEVTMPFS_MOUNT y
> +
> + =A0 =A0 =A0 =A0# Newer inits like systemd need cgroup support
> + =A0 =A0 =A0 =A0if [ "${KERNEL_ENABLE_CGROUPS}" =3D "1" ] ; then
> + =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_SCHED y
> + =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUPS y
> + =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_NS y
> + =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_FREEZER y
> + =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_DEVICE y
> + =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CPUSETS y
> + =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable PROC_PID_CPUSET y
> + =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CGROUP_CPUACCT y
> + =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable RESOURCE_COUNTERS y
> + =A0 =A0 =A0 =A0fi
> +
> + =A0 =A0 =A0 =A0#
> + =A0 =A0 =A0 =A0# root-over-nfs-over-usb-eth support. Limited, but shoul=
d cover some cases.
> + =A0 =A0 =A0 =A0# Enable this by setting a proper CMDLINE_NFSROOT_USB.
> + =A0 =A0 =A0 =A0#
> + =A0 =A0 =A0 =A0if [ ! -z "${CMDLINE_NFSROOT_USB}" ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bbnote "Configuring the kernel for root-=
over-nfs-over-usb-eth with CMDLINE ${CMDLINE_NFSROOT_USB}"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable INET y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable IP_PNP y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable USB_GADGET y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable USB_GADGET_SELECTED=
 y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable USB_ETH y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable NFS_FS y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable ROOT_NFS y
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kernel_conf_variable CMDLINE \"${CMDLINE=
_NFSROOT_USB} ${CMDLINE_DEBUG}\"
> + =A0 =A0 =A0 =A0fi
> +
> + =A0 =A0 =A0 =A0sed -e "${CONF_SED_SCRIPT}" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 < '${WORKDIR}/defconfig' >>'${S}/.config'
> +
> + =A0 =A0 =A0 yes '' | oe_runmake oldconfig
> +}
> +
> +do_configure_append() {
> + =A0 =A0 =A0 =A0if test -e scripts/Makefile.fwinst ; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e "s:-m0644:-m 0644:g" scripts/Make=
file.fwinst
> + =A0 =A0 =A0 fi
> +}
> +
> +do_install_append() {
> + =A0 =A0 =A0 oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_pr=
efix}/src/linux-${KERNEL_VERSION} ARCH=3D$ARCH
> +}
> +
> +PACKAGES =3D+ "kernel-headers"
> +FILES_kernel-headers =3D "${exec_prefix}/src/linux*"
> --
> 1.7.8.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Regards

Andrea


