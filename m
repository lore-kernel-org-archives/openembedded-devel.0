Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1O2Oc7-00026G-L9
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 14:56:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 8DCA114012
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 13:52:43 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 2xjDCI3wDBB8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 13:52:41 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 7586BA4B49
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 13:52:41 +0100 (BST)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id EF47821342; Thu, 15 Apr 2010 13:54:21 +0100 (BST)
Date: Thu, 15 Apr 2010 13:54:21 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100415125421.GD2561@xora-desktop.xora.org.uk>
References: <1271327750-29247-1-git-send-email-koen@openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1271327750-29247-1-git-send-email-koen@openembedded.org>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] kernel bbclass: convert to new style staging (from poky)
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
X-List-Received-Date: Thu, 15 Apr 2010 12:56:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Both

Acked-by: Graeme Gregory <dp@xora.org.uk>

On Thu, Apr 15, 2010 at 12:35:48PM +0200, Koen Kooi wrote:
> ---
>  classes/kernel.bbclass |  135 ++++++++++++++++++++++++------------------------
>  1 files changed, 67 insertions(+), 68 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 7f7062b..20403ea 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -97,108 +97,107 @@ kernel_do_compile() {
>  }
>  kernel_do_compile[depends] = "${INITRAMFS_TASK}"
>  
> -kernel_do_stage() {
> +kernel_do_install() {
> +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> +	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> +		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
> +	else
> +		oenote "no modules to install"
> +	fi
> +	
> +	install -d ${D}/${KERNEL_IMAGEDEST}
> +	install -d ${D}/boot
> +	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> +	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
> +	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
> +	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> +	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
> +	install -d ${D}/etc/modutils
> +	if [ "${KERNEL_MAJOR_VERSION}" = "2.6" ]; then
> +		install -d ${D}/etc/modprobe.d
> +	fi
> +	
> +        # Check if scripts/genksyms exists and if so, build it
> +        if [ -e scripts/genksyms/ ]; then
> +                oe_runmake SUBDIRS="scripts/genksyms"
> +        fi
> +
> +	kerneldir=${D}/kernel/
> +
>  	if [ -e include/asm ] ; then
>  		# This link is generated only in kernel before 2.6.33-rc1, don't stage it for newer kernels
>  		ASMDIR=`readlink include/asm`
>  
> -		mkdir -p ${STAGING_KERNEL_DIR}/include/$ASMDIR
> -		cp -fR include/$ASMDIR/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
> +		mkdir -p $kerneldir/include/$ASMDIR
> +		cp -fR include/$ASMDIR/* $kerneldir/include/$ASMDIR/
>  	fi
> +
> +	cp -fR include/$ASMDIR/* $kerneldir/include/$ASMDIR/
>  	# Kernel 2.6.27 moved headers from includes/asm-${ARCH} to arch/${ARCH}/include/asm	
>  	if [ -e arch/${ARCH}/include/asm/ ] ; then 
> -		if [ -e include/asm ] ; then
> -			cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
> -		fi
> -		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
> -		cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/	
> +		cp -fR arch/${ARCH}/include/asm/* $kerneldir/include/$ASMDIR/
> +		install -d $kerneldir/arch/${ARCH}/include
> +		cp -fR arch/${ARCH}/* $kerneldir/arch/${ARCH}/	
>  
>  	# Check for arch/x86 on i386
>  	elif [ -d arch/x86/include/asm/ ]; then
> -		if [ -e include/asm ] ; then
> -			cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/asm-x86/
> -		fi
> -		install -d ${STAGING_KERNEL_DIR}/arch/x86/include
> -		cp -fR arch/x86/* ${STAGING_KERNEL_DIR}/arch/x86/
> +		cp -fR arch/x86/include/asm/* $kerneldir/include/asm-x86/
> +		install -d $kerneldir/arch/x86/include
> +		cp -fR arch/x86/* $kerneldir/arch/x86/
>  	fi
>  
>  	if [ -e include/asm ] ; then
> -		rm -f ${STAGING_KERNEL_DIR}/include/asm
> -		ln -sf $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
> +		rm -f $kerneldir/include/asm
> +		ln -sf $ASMDIR $kerneldir/include/asm
>  	fi
>  
> -	mkdir -p ${STAGING_KERNEL_DIR}/include/asm-generic
> -	cp -fR include/asm-generic/* ${STAGING_KERNEL_DIR}/include/asm-generic/
> +	mkdir -p $kerneldir/include/asm-generic
> +	cp -fR include/asm-generic/* $kerneldir/include/asm-generic/
>  
>  	for entry in drivers/crypto drivers/media include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace; do
>  		if [ -d $entry ]; then
> -			mkdir -p ${STAGING_KERNEL_DIR}/$entry
> -			cp -fR $entry/* ${STAGING_KERNEL_DIR}/$entry/
> +			mkdir -p $kerneldir/$entry
> +			cp -fR $entry/* $kerneldir/$entry/
>  		fi
>  	done
>  
>  	if [ -d drivers/sound ]; then
>  		# 2.4 alsa needs some headers from this directory
> -		mkdir -p ${STAGING_KERNEL_DIR}/include/drivers/sound
> -		cp -fR drivers/sound/*.h ${STAGING_KERNEL_DIR}/include/drivers/sound/
> +		mkdir -p $kerneldir/include/drivers/sound
> +		cp -fR drivers/sound/*.h $kerneldir/include/drivers/sound/
>  	fi
>  
> -	install -m 0644 .config ${STAGING_KERNEL_DIR}/config-${KERNEL_VERSION}
> -	ln -sf config-${KERNEL_VERSION} ${STAGING_KERNEL_DIR}/.config
> -	ln -sf config-${KERNEL_VERSION} ${STAGING_KERNEL_DIR}/kernel-config
> -	echo "${KERNEL_VERSION}" >${STAGING_KERNEL_DIR}/kernel-abiversion
> -	echo "${S}" >${STAGING_KERNEL_DIR}/kernel-source
> -	echo "${KERNEL_CCSUFFIX}" >${STAGING_KERNEL_DIR}/kernel-ccsuffix
> -	echo "${KERNEL_LDSUFFIX}" >${STAGING_KERNEL_DIR}/kernel-ldsuffix
> -	[ -e Rules.make ] && install -m 0644 Rules.make ${STAGING_KERNEL_DIR}/
> -	[ -e Makefile ] && install -m 0644 Makefile ${STAGING_KERNEL_DIR}/
> +	install -m 0644 .config $kerneldir/config-${KERNEL_VERSION}
> +	ln -sf config-${KERNEL_VERSION} $kerneldir/.config
> +	ln -sf config-${KERNEL_VERSION} $kerneldir/kernel-config
> +	echo "${KERNEL_VERSION}" >$kerneldir/kernel-abiversion
> +	echo "${S}" >$kerneldir/kernel-source
> +	echo "${KERNEL_CCSUFFIX}" >$kerneldir/kernel-ccsuffix
> +	echo "${KERNEL_LDSUFFIX}" >$kerneldir/kernel-ldsuffix
> +	[ -e Rules.make ] && install -m 0644 Rules.make $kerneldir/
> +	[ -e Makefile ] && install -m 0644 Makefile $kerneldir/
>  	
>  	# Check if arch/${ARCH}/Makefile exists and install it
>  	if [ -e arch/${ARCH}/Makefile ]; then
> -		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}
> -		install -m 0644 arch/${ARCH}/Makefile* ${STAGING_KERNEL_DIR}/arch/${ARCH}
> +		install -d $kerneldir/arch/${ARCH}
> +		install -m 0644 arch/${ARCH}/Makefile* $kerneldir/arch/${ARCH}
>  	# Otherwise check arch/x86/Makefile for i386 and x86_64 on kernels >= 2.6.24
>  	elif [ -e arch/x86/Makefile ]; then
> -		install -d ${STAGING_KERNEL_DIR}/arch/x86
> -		install -m 0644 arch/x86/Makefile* ${STAGING_KERNEL_DIR}/arch/x86
> +		install -d $kerneldir/arch/x86
> +		install -m 0644 arch/x86/Makefile* $kerneldir/arch/x86
>  	fi
> -	cp -fR include/config* ${STAGING_KERNEL_DIR}/include/	
> +	cp -fR include/config* $kerneldir/include/	
>  	# Install kernel images and system.map to staging
> -	[ -e vmlinux ] && install -m 0644 vmlinux ${STAGING_KERNEL_DIR}/	
> -	install -m 0644 ${KERNEL_OUTPUT} ${STAGING_KERNEL_DIR}/${KERNEL_IMAGETYPE}
> -	install -m 0644 System.map ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION}
> -	[ -e Module.symvers ] && install -m 0644 Module.symvers ${STAGING_KERNEL_DIR}/
> +	[ -e vmlinux ] && install -m 0644 vmlinux $kerneldir/	
> +	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
> +	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
> +	[ -e Module.symvers ] && install -m 0644 Module.symvers $kerneldir/
>  
> -	cp -fR scripts ${STAGING_KERNEL_DIR}/
> +	cp -fR scripts $kerneldir/
>  }
>  
> -kernel_do_install() {
> -	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> -	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> -		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
> -	else
> -		oenote "no modules to install"
> -	fi
> -	
> -	install -d ${D}/${KERNEL_IMAGEDEST}
> -	install -d ${D}/boot
> -	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> -	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
> -	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
> -	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> -	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
> -	install -d ${D}/etc/modutils
> -	if [ "${KERNEL_MAJOR_VERSION}" = "2.6" ]; then
> -		install -d ${D}/etc/modprobe.d
> -	fi
> -	
> -        # Check if scripts/genksyms exists and if so, build it
> -        if [ -e scripts/genksyms/ ]; then
> -                oe_runmake SUBDIRS="scripts/genksyms"
> -        fi
> -
> -        install -d ${STAGING_KERNEL_DIR}
> -        cp -fR scripts ${STAGING_KERNEL_DIR}/
> +sysroot_stage_all_append() {
> +	sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}
>  }
>  
>  kernel_do_configure() {
> @@ -234,7 +233,7 @@ pkg_postrm_kernel () {
>  
>  inherit cml1
>  
> -EXPORT_FUNCTIONS do_compile do_install do_stage do_configure
> +EXPORT_FUNCTIONS do_compile do_install do_configure
>  
>  # kernel-base becomes kernel-${KERNEL_VERSION}
>  # kernel-image becomes kernel-image-${KERNEL_VERISON}
> -- 
> 1.7.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


