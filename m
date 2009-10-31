Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N48N1-0005TR-TG
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Oct 2009 08:27:35 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSD00AFLBBDOM0L@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Oct 2009 02:26:07 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BCC5C14AF60; Sat,
	31 Oct 2009 03:26:01 -0400 (EDT)
Date: Sat, 31 Oct 2009 03:26:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091031072601.GD16188@denix.org>
References: <1256913629-22621-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1256913629-22621-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <koen@openembedded.org>, Koen Kooi <k-kooi@ti.com>
Subject: Re: [STABLE][PATCH] kernel bbclass: sync with .dev
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
X-List-Received-Date: Sat, 31 Oct 2009 07:27:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 30, 2009 at 03:40:29PM +0100, Koen Kooi wrote:
> From: Koen Kooi <k-kooi@ti.com>
> 
> * stages more directories
> * adds mkimage step
> 
> Signed-off-by: Koen Kooi <k-kooi@ti.com>
> Signed-off-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  classes/kernel.bbclass |   68 +++++++++++++++++++++++++++++++++---------------
>  1 files changed, 47 insertions(+), 21 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 278aec1..4474f5b 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -78,6 +78,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  UBOOT_ENTRYPOINT ?= "20008000"
>  UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
>  
> +# For the kernel, we don't want the '-e MAKEFLAGS=' in EXTRA_OEMAKE.
> +# We don't want to override kernel Makefile variables from the environment
> +EXTRA_OEMAKE = ""
> +
>  kernel_do_compile() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>  	oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> @@ -103,8 +107,15 @@ kernel_do_stage() {
>  		cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
>  		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
>  		cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/	
> +
> +	# Check for arch/x86 on i386
> +	elif [ -d arch/x86/include/asm/ ]; then
> +		cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/asm-x86/
> +		install -d ${STAGING_KERNEL_DIR}/arch/x86/include
> +		cp -fR arch/x86/* ${STAGING_KERNEL_DIR}/arch/x86/
>  	fi
> -	rm -f $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
> +
> +	rm -f ${STAGING_KERNEL_DIR}/include/asm
>  	ln -sf $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
>  
>  	mkdir -p ${STAGING_KERNEL_DIR}/include/asm-generic
> @@ -119,7 +130,7 @@ kernel_do_stage() {
>  	mkdir -p ${STAGING_KERNEL_DIR}/include/pcmcia
>  	cp -fR include/pcmcia/* ${STAGING_KERNEL_DIR}/include/pcmcia/
>  
> -	for entry in drivers/crypto drivers/media include/media include/acpi include/sound include/video include/scsi; do
> +	for entry in drivers/crypto drivers/media include/media include/acpi include/sound include/video include/scsi include/trace; do
>  		if [ -d $entry ]; then
>  			mkdir -p ${STAGING_KERNEL_DIR}/$entry
>  			cp -fR $entry/* ${STAGING_KERNEL_DIR}/$entry/
> @@ -175,6 +186,7 @@ kernel_do_install() {
>  	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>  	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>  	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> +	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
>  	install -d ${D}/etc/modutils
>  	if [ "${KERNEL_MAJOR_VERSION}" = "2.6" ]; then
>  		install -d ${D}/etc/modprobe.d
> @@ -224,8 +236,8 @@ EXPORT_FUNCTIONS do_compile do_install do_stage do_configure
>  # kernel-image becomes kernel-image-${KERNEL_VERISON}
>  PACKAGES = "kernel kernel-base kernel-image kernel-dev kernel-vmlinux"
>  FILES = ""
> -FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
> -FILES_kernel-dev = "/boot/System.map* /boot/config*"
> +FILES_kernel-image = "/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}*"
> +FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
>  FILES_kernel-vmlinux = "/boot/vmlinux*"
>  RDEPENDS_kernel = "kernel-base"
>  RRECOMMENDS_kernel-module-hostap-cs += '${@base_version_less_or_equal("KERNEL_VERSION", "2.6.17", "", "apm-wifi-suspendfix", d)}'
> @@ -442,10 +454,14 @@ python populate_packages_prepend () {
>  
>  	postinst = bb.data.getVar('pkg_postinst_modules', d, 1)
>  	postrm = bb.data.getVar('pkg_postrm_modules', d, 1)
> +
> +        maybe_update_modules = "update-modules "
> +        if bb.data.getVar("ONLINE_PACKAGE_MANAGEMENT", d) == "none":
> +                maybe_update_modules = ""
>  	
>  	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>  	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
> -	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % bb.data.getVar("KERNEL_VERSION", d, 1))
> +	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%skernel-%s' % (maybe_update_modules, bb.data.getVar("KERNEL_VERSION", d, 1)))
>  
>  	import re, os
>  	metapkg = "kernel-modules"
> @@ -481,8 +497,32 @@ do_sizecheck() {
>  
>  addtask sizecheck before do_install after do_compile
>  
> +do_uboot_mkimage() {
> +    if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
> +        ENTRYPOINT=${UBOOT_ENTRYPOINT}
> +        if test -n "${UBOOT_ENTRYSYMBOL}"; then
> +            ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
> +                   awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
> +        fi
> +        if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> +            ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
> +            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
> +            rm -f linux.bin
> +        else
> +            ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
> +            rm -f linux.bin.gz
> +            gzip -9 linux.bin
> +            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
> +            rm -f linux.bin.gz
> +        fi
> +    fi
> +}
> +
> +addtask uboot_mkimage before do_install after do_compile
> +
>  KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}"
>  KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
> +MODULES_IMAGE_BASE_NAME ?= modules-${PV}-${PR}-${MACHINE}
>  
>  do_deploy() {
>  	install -d ${DEPLOY_DIR_IMAGE}
> @@ -490,22 +530,7 @@ do_deploy() {
>  	package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
>  
>  	if [ -d "${D}/lib" ]; then
> -	tar -cvzf ${DEPLOY_DIR_IMAGE}/modules-${PV}-${PR}-${MACHINE}.tgz -C ${D} lib
> -	fi
> -
> -	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
> -		if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> -			${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
> -			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
> -			rm -f linux.bin
> -		else
> -			${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
> -			rm -f linux.bin.gz
> -			gzip -9 linux.bin
> -			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
> -			rm -f linux.bin.gz
> -		fi
> -		package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
> +		fakeroot tar -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.tgz -C ${D} lib
>  	fi
>  
>  	cd ${DEPLOY_DIR_IMAGE}
> @@ -515,5 +540,6 @@ do_deploy() {
>  }
>  
>  do_deploy[dirs] = "${S}"
> +do_deploy[depends] += "fakeroot-native:do_populate_staging"
>  
>  addtask deploy before do_package after do_install
> -- 
> 1.6.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


