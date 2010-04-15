Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1O2MTm-0003oO-FI
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 12:39:26 +0200
Received: by wwb18 with SMTP id 18so546727wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=LM5qVjyn419zEQjCnt93Hpd+Jttjy1YvTQzjMcPoQ2I=;
	b=S1g8sZtbECnuO0iglMNlKg8OLv/LIhs0dp7Z70N10M+9LvXRG1qtZmlKJa19rWER/u
	qWA11OFjR9dHzLwAZkul1kulh8l/uGKnwLq1CIkd9PyS/igh4MsRDD+94+zn0W/6ixVN
	opI7oruPWKul83AYzi7ezSfRETRMqdsJwfBW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=szDMuWBMxGnhiwwoIyk9/1cN8R/qy6MJ6Qq5lM+iE8nTqFa0eEyUOq2zyBH9+UQAI5
	aD1HJ4IMXawxvhP6bCk30Aj1071RCddM4qJFhAU8PeU2VnVLSHD/AFM4thGJ1SMRdEa7
	EChL/eEJL5aI7eMqLE6qlzw7foguiCL4TXjYQ=
Received: by 10.216.181.69 with SMTP id k47mr771853wem.82.1271327756380;
	Thu, 15 Apr 2010 03:35:56 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id t27sm10734542wbc.17.2010.04.15.03.35.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 15 Apr 2010 03:35:55 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Apr 2010 12:35:48 +0200
Message-Id: <1271327750-29247-1-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH 1/2] kernel bbclass: convert to new style staging (from poky)
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
X-List-Received-Date: Thu, 15 Apr 2010 10:39:26 -0000

---
 classes/kernel.bbclass |  135 ++++++++++++++++++++++++------------------------
 1 files changed, 67 insertions(+), 68 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 7f7062b..20403ea 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -97,108 +97,107 @@ kernel_do_compile() {
 }
 kernel_do_compile[depends] = "${INITRAMFS_TASK}"
 
-kernel_do_stage() {
+kernel_do_install() {
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
+	else
+		oenote "no modules to install"
+	fi
+	
+	install -d ${D}/${KERNEL_IMAGEDEST}
+	install -d ${D}/boot
+	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
+	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
+	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
+	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
+	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
+	install -d ${D}/etc/modutils
+	if [ "${KERNEL_MAJOR_VERSION}" = "2.6" ]; then
+		install -d ${D}/etc/modprobe.d
+	fi
+	
+        # Check if scripts/genksyms exists and if so, build it
+        if [ -e scripts/genksyms/ ]; then
+                oe_runmake SUBDIRS="scripts/genksyms"
+        fi
+
+	kerneldir=${D}/kernel/
+
 	if [ -e include/asm ] ; then
 		# This link is generated only in kernel before 2.6.33-rc1, don't stage it for newer kernels
 		ASMDIR=`readlink include/asm`
 
-		mkdir -p ${STAGING_KERNEL_DIR}/include/$ASMDIR
-		cp -fR include/$ASMDIR/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
+		mkdir -p $kerneldir/include/$ASMDIR
+		cp -fR include/$ASMDIR/* $kerneldir/include/$ASMDIR/
 	fi
+
+	cp -fR include/$ASMDIR/* $kerneldir/include/$ASMDIR/
 	# Kernel 2.6.27 moved headers from includes/asm-${ARCH} to arch/${ARCH}/include/asm	
 	if [ -e arch/${ARCH}/include/asm/ ] ; then 
-		if [ -e include/asm ] ; then
-			cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
-		fi
-		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
-		cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/	
+		cp -fR arch/${ARCH}/include/asm/* $kerneldir/include/$ASMDIR/
+		install -d $kerneldir/arch/${ARCH}/include
+		cp -fR arch/${ARCH}/* $kerneldir/arch/${ARCH}/	
 
 	# Check for arch/x86 on i386
 	elif [ -d arch/x86/include/asm/ ]; then
-		if [ -e include/asm ] ; then
-			cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/asm-x86/
-		fi
-		install -d ${STAGING_KERNEL_DIR}/arch/x86/include
-		cp -fR arch/x86/* ${STAGING_KERNEL_DIR}/arch/x86/
+		cp -fR arch/x86/include/asm/* $kerneldir/include/asm-x86/
+		install -d $kerneldir/arch/x86/include
+		cp -fR arch/x86/* $kerneldir/arch/x86/
 	fi
 
 	if [ -e include/asm ] ; then
-		rm -f ${STAGING_KERNEL_DIR}/include/asm
-		ln -sf $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
+		rm -f $kerneldir/include/asm
+		ln -sf $ASMDIR $kerneldir/include/asm
 	fi
 
-	mkdir -p ${STAGING_KERNEL_DIR}/include/asm-generic
-	cp -fR include/asm-generic/* ${STAGING_KERNEL_DIR}/include/asm-generic/
+	mkdir -p $kerneldir/include/asm-generic
+	cp -fR include/asm-generic/* $kerneldir/include/asm-generic/
 
 	for entry in drivers/crypto drivers/media include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace; do
 		if [ -d $entry ]; then
-			mkdir -p ${STAGING_KERNEL_DIR}/$entry
-			cp -fR $entry/* ${STAGING_KERNEL_DIR}/$entry/
+			mkdir -p $kerneldir/$entry
+			cp -fR $entry/* $kerneldir/$entry/
 		fi
 	done
 
 	if [ -d drivers/sound ]; then
 		# 2.4 alsa needs some headers from this directory
-		mkdir -p ${STAGING_KERNEL_DIR}/include/drivers/sound
-		cp -fR drivers/sound/*.h ${STAGING_KERNEL_DIR}/include/drivers/sound/
+		mkdir -p $kerneldir/include/drivers/sound
+		cp -fR drivers/sound/*.h $kerneldir/include/drivers/sound/
 	fi
 
-	install -m 0644 .config ${STAGING_KERNEL_DIR}/config-${KERNEL_VERSION}
-	ln -sf config-${KERNEL_VERSION} ${STAGING_KERNEL_DIR}/.config
-	ln -sf config-${KERNEL_VERSION} ${STAGING_KERNEL_DIR}/kernel-config
-	echo "${KERNEL_VERSION}" >${STAGING_KERNEL_DIR}/kernel-abiversion
-	echo "${S}" >${STAGING_KERNEL_DIR}/kernel-source
-	echo "${KERNEL_CCSUFFIX}" >${STAGING_KERNEL_DIR}/kernel-ccsuffix
-	echo "${KERNEL_LDSUFFIX}" >${STAGING_KERNEL_DIR}/kernel-ldsuffix
-	[ -e Rules.make ] && install -m 0644 Rules.make ${STAGING_KERNEL_DIR}/
-	[ -e Makefile ] && install -m 0644 Makefile ${STAGING_KERNEL_DIR}/
+	install -m 0644 .config $kerneldir/config-${KERNEL_VERSION}
+	ln -sf config-${KERNEL_VERSION} $kerneldir/.config
+	ln -sf config-${KERNEL_VERSION} $kerneldir/kernel-config
+	echo "${KERNEL_VERSION}" >$kerneldir/kernel-abiversion
+	echo "${S}" >$kerneldir/kernel-source
+	echo "${KERNEL_CCSUFFIX}" >$kerneldir/kernel-ccsuffix
+	echo "${KERNEL_LDSUFFIX}" >$kerneldir/kernel-ldsuffix
+	[ -e Rules.make ] && install -m 0644 Rules.make $kerneldir/
+	[ -e Makefile ] && install -m 0644 Makefile $kerneldir/
 	
 	# Check if arch/${ARCH}/Makefile exists and install it
 	if [ -e arch/${ARCH}/Makefile ]; then
-		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}
-		install -m 0644 arch/${ARCH}/Makefile* ${STAGING_KERNEL_DIR}/arch/${ARCH}
+		install -d $kerneldir/arch/${ARCH}
+		install -m 0644 arch/${ARCH}/Makefile* $kerneldir/arch/${ARCH}
 	# Otherwise check arch/x86/Makefile for i386 and x86_64 on kernels >= 2.6.24
 	elif [ -e arch/x86/Makefile ]; then
-		install -d ${STAGING_KERNEL_DIR}/arch/x86
-		install -m 0644 arch/x86/Makefile* ${STAGING_KERNEL_DIR}/arch/x86
+		install -d $kerneldir/arch/x86
+		install -m 0644 arch/x86/Makefile* $kerneldir/arch/x86
 	fi
-	cp -fR include/config* ${STAGING_KERNEL_DIR}/include/	
+	cp -fR include/config* $kerneldir/include/	
 	# Install kernel images and system.map to staging
-	[ -e vmlinux ] && install -m 0644 vmlinux ${STAGING_KERNEL_DIR}/	
-	install -m 0644 ${KERNEL_OUTPUT} ${STAGING_KERNEL_DIR}/${KERNEL_IMAGETYPE}
-	install -m 0644 System.map ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION}
-	[ -e Module.symvers ] && install -m 0644 Module.symvers ${STAGING_KERNEL_DIR}/
+	[ -e vmlinux ] && install -m 0644 vmlinux $kerneldir/	
+	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
+	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
+	[ -e Module.symvers ] && install -m 0644 Module.symvers $kerneldir/
 
-	cp -fR scripts ${STAGING_KERNEL_DIR}/
+	cp -fR scripts $kerneldir/
 }
 
-kernel_do_install() {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
-	else
-		oenote "no modules to install"
-	fi
-	
-	install -d ${D}/${KERNEL_IMAGEDEST}
-	install -d ${D}/boot
-	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
-	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
-	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
-	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
-	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
-	install -d ${D}/etc/modutils
-	if [ "${KERNEL_MAJOR_VERSION}" = "2.6" ]; then
-		install -d ${D}/etc/modprobe.d
-	fi
-	
-        # Check if scripts/genksyms exists and if so, build it
-        if [ -e scripts/genksyms/ ]; then
-                oe_runmake SUBDIRS="scripts/genksyms"
-        fi
-
-        install -d ${STAGING_KERNEL_DIR}
-        cp -fR scripts ${STAGING_KERNEL_DIR}/
+sysroot_stage_all_append() {
+	sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}
 }
 
 kernel_do_configure() {
@@ -234,7 +233,7 @@ pkg_postrm_kernel () {
 
 inherit cml1
 
-EXPORT_FUNCTIONS do_compile do_install do_stage do_configure
+EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
-- 
1.7.0



