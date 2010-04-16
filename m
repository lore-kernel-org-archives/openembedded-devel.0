Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1O2jrY-0000y7-Gc
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 13:37:37 +0200
Received: (qmail 23648 invoked by uid 1003); 16 Apr 2010 11:34:00 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 16 Apr 2010 11:34:00 -0000
Message-ID: <4BC84B26.5090105@balister.org>
Date: Fri, 16 Apr 2010 07:33:58 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1271327750-29247-1-git-send-email-koen@openembedded.org>
In-Reply-To: <1271327750-29247-1-git-send-email-koen@openembedded.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] kernel bbclass: convert to new style staging (from	poky)
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
X-List-Received-Date: Fri, 16 Apr 2010 11:37:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

On 04/15/2010 06:35 AM, Koen Kooi wrote:
> ---
>   classes/kernel.bbclass |  135 ++++++++++++++++++++++++------------------------
>   1 files changed, 67 insertions(+), 68 deletions(-)
>
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 7f7062b..20403ea 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -97,108 +97,107 @@ kernel_do_compile() {
>   }
>   kernel_do_compile[depends] = "${INITRAMFS_TASK}"
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
> +	[ -e Module.symvers ]&&  install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
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
>   	if [ -e include/asm ] ; then
>   		# This link is generated only in kernel before 2.6.33-rc1, don't stage it for newer kernels
>   		ASMDIR=`readlink include/asm`
>
> -		mkdir -p ${STAGING_KERNEL_DIR}/include/$ASMDIR
> -		cp -fR include/$ASMDIR/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
> +		mkdir -p $kerneldir/include/$ASMDIR
> +		cp -fR include/$ASMDIR/* $kerneldir/include/$ASMDIR/
>   	fi
> +
> +	cp -fR include/$ASMDIR/* $kerneldir/include/$ASMDIR/
>   	# Kernel 2.6.27 moved headers from includes/asm-${ARCH} to arch/${ARCH}/include/asm	
>   	if [ -e arch/${ARCH}/include/asm/ ] ; then
> -		if [ -e include/asm ] ; then
> -			cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
> -		fi
> -		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
> -		cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/	
> +		cp -fR arch/${ARCH}/include/asm/* $kerneldir/include/$ASMDIR/
> +		install -d $kerneldir/arch/${ARCH}/include
> +		cp -fR arch/${ARCH}/* $kerneldir/arch/${ARCH}/	
>
>   	# Check for arch/x86 on i386
>   	elif [ -d arch/x86/include/asm/ ]; then
> -		if [ -e include/asm ] ; then
> -			cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/asm-x86/
> -		fi
> -		install -d ${STAGING_KERNEL_DIR}/arch/x86/include
> -		cp -fR arch/x86/* ${STAGING_KERNEL_DIR}/arch/x86/
> +		cp -fR arch/x86/include/asm/* $kerneldir/include/asm-x86/
> +		install -d $kerneldir/arch/x86/include
> +		cp -fR arch/x86/* $kerneldir/arch/x86/
>   	fi
>
>   	if [ -e include/asm ] ; then
> -		rm -f ${STAGING_KERNEL_DIR}/include/asm
> -		ln -sf $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
> +		rm -f $kerneldir/include/asm
> +		ln -sf $ASMDIR $kerneldir/include/asm
>   	fi
>
> -	mkdir -p ${STAGING_KERNEL_DIR}/include/asm-generic
> -	cp -fR include/asm-generic/* ${STAGING_KERNEL_DIR}/include/asm-generic/
> +	mkdir -p $kerneldir/include/asm-generic
> +	cp -fR include/asm-generic/* $kerneldir/include/asm-generic/
>
>   	for entry in drivers/crypto drivers/media include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace; do
>   		if [ -d $entry ]; then
> -			mkdir -p ${STAGING_KERNEL_DIR}/$entry
> -			cp -fR $entry/* ${STAGING_KERNEL_DIR}/$entry/
> +			mkdir -p $kerneldir/$entry
> +			cp -fR $entry/* $kerneldir/$entry/
>   		fi
>   	done
>
>   	if [ -d drivers/sound ]; then
>   		# 2.4 alsa needs some headers from this directory
> -		mkdir -p ${STAGING_KERNEL_DIR}/include/drivers/sound
> -		cp -fR drivers/sound/*.h ${STAGING_KERNEL_DIR}/include/drivers/sound/
> +		mkdir -p $kerneldir/include/drivers/sound
> +		cp -fR drivers/sound/*.h $kerneldir/include/drivers/sound/
>   	fi
>
> -	install -m 0644 .config ${STAGING_KERNEL_DIR}/config-${KERNEL_VERSION}
> -	ln -sf config-${KERNEL_VERSION} ${STAGING_KERNEL_DIR}/.config
> -	ln -sf config-${KERNEL_VERSION} ${STAGING_KERNEL_DIR}/kernel-config
> -	echo "${KERNEL_VERSION}">${STAGING_KERNEL_DIR}/kernel-abiversion
> -	echo "${S}">${STAGING_KERNEL_DIR}/kernel-source
> -	echo "${KERNEL_CCSUFFIX}">${STAGING_KERNEL_DIR}/kernel-ccsuffix
> -	echo "${KERNEL_LDSUFFIX}">${STAGING_KERNEL_DIR}/kernel-ldsuffix
> -	[ -e Rules.make ]&&  install -m 0644 Rules.make ${STAGING_KERNEL_DIR}/
> -	[ -e Makefile ]&&  install -m 0644 Makefile ${STAGING_KERNEL_DIR}/
> +	install -m 0644 .config $kerneldir/config-${KERNEL_VERSION}
> +	ln -sf config-${KERNEL_VERSION} $kerneldir/.config
> +	ln -sf config-${KERNEL_VERSION} $kerneldir/kernel-config
> +	echo "${KERNEL_VERSION}">$kerneldir/kernel-abiversion
> +	echo "${S}">$kerneldir/kernel-source
> +	echo "${KERNEL_CCSUFFIX}">$kerneldir/kernel-ccsuffix
> +	echo "${KERNEL_LDSUFFIX}">$kerneldir/kernel-ldsuffix
> +	[ -e Rules.make ]&&  install -m 0644 Rules.make $kerneldir/
> +	[ -e Makefile ]&&  install -m 0644 Makefile $kerneldir/
>   	
>   	# Check if arch/${ARCH}/Makefile exists and install it
>   	if [ -e arch/${ARCH}/Makefile ]; then
> -		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}
> -		install -m 0644 arch/${ARCH}/Makefile* ${STAGING_KERNEL_DIR}/arch/${ARCH}
> +		install -d $kerneldir/arch/${ARCH}
> +		install -m 0644 arch/${ARCH}/Makefile* $kerneldir/arch/${ARCH}
>   	# Otherwise check arch/x86/Makefile for i386 and x86_64 on kernels>= 2.6.24
>   	elif [ -e arch/x86/Makefile ]; then
> -		install -d ${STAGING_KERNEL_DIR}/arch/x86
> -		install -m 0644 arch/x86/Makefile* ${STAGING_KERNEL_DIR}/arch/x86
> +		install -d $kerneldir/arch/x86
> +		install -m 0644 arch/x86/Makefile* $kerneldir/arch/x86
>   	fi
> -	cp -fR include/config* ${STAGING_KERNEL_DIR}/include/	
> +	cp -fR include/config* $kerneldir/include/	
>   	# Install kernel images and system.map to staging
> -	[ -e vmlinux ]&&  install -m 0644 vmlinux ${STAGING_KERNEL_DIR}/	
> -	install -m 0644 ${KERNEL_OUTPUT} ${STAGING_KERNEL_DIR}/${KERNEL_IMAGETYPE}
> -	install -m 0644 System.map ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION}
> -	[ -e Module.symvers ]&&  install -m 0644 Module.symvers ${STAGING_KERNEL_DIR}/
> +	[ -e vmlinux ]&&  install -m 0644 vmlinux $kerneldir/	
> +	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
> +	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
> +	[ -e Module.symvers ]&&  install -m 0644 Module.symvers $kerneldir/
>
> -	cp -fR scripts ${STAGING_KERNEL_DIR}/
> +	cp -fR scripts $kerneldir/
>   }
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
> -	[ -e Module.symvers ]&&  install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
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
>   }
>
>   kernel_do_configure() {
> @@ -234,7 +233,7 @@ pkg_postrm_kernel () {
>
>   inherit cml1
>
> -EXPORT_FUNCTIONS do_compile do_install do_stage do_configure
> +EXPORT_FUNCTIONS do_compile do_install do_configure
>
>   # kernel-base becomes kernel-${KERNEL_VERSION}
>   # kernel-image becomes kernel-image-${KERNEL_VERISON}


