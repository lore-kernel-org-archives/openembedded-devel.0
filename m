Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SD90Z-0008Uu-R6
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 08:38:55 +0200
Received: by eekc1 with SMTP id c1so621283eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 23:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=G3biMaWfh793dRP3b18Z0/KflGpfcaU75S+umF3EB+A=;
	b=FhufsfHdd74vJedWPknAc7XCdBLEfNos7diWzhyEdsCYuAHnTfsWt47AC0JnRKcuTq
	cuN01cEaqDSq/WVuPTkWvtUmOCjRp75i+3gvWnDTB2trKcu7ElfevBLdbPYPFXi0bQyj
	gBoDgYe2unI9B1y/U/282VU02SIr/knKOZI7PQVW5J7j3jRJCXxM7IbcUF2lCkCyJ+fr
	Ly3GIy74y9uBzTnlsWiBC6tF86RJyQY9YfPMZPkn8e0LcBq0xZyflCjn2Oze//yT4+Ai
	RqOnl2ZjwGrsnS52cGn+NdIN3+jz4zSqGs+bz6Jk99xGwmoFnKQnPmrdGiuYz5c/2ZGT
	czKA==
Received: by 10.180.104.231 with SMTP id gh7mr2470478wib.10.1333002593123;
	Wed, 28 Mar 2012 23:29:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j3sm24064989wiw.1.2012.03.28.23.29.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 23:29:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Mar 2012 08:29:40 +0200
Message-Id: <c32bd0451da9fb904f408607012d9fbad7adcce8.1333002292.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <a778a584bcb8f57690598ebcc401a5181eb56e19.1333002292.git.Martin.Jansa@gmail.com>
References: <a778a584bcb8f57690598ebcc401a5181eb56e19.1333002292.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1333002292.git.Martin.Jansa@gmail.com>
References: <cover.1333002292.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/6] kernel.bbclass: unify white spaces
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
X-List-Received-Date: Thu, 29 Mar 2012 06:38:55 -0000

* indentation was with spaces and tabs, unify to use tabs instead of
  spaces, because "python populate_packages" expects tabs (or 8 spaces)
  and we're doing populate_packages_preppend here

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |   78 ++++++++++++++++++++--------------------
 1 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 1ef8e2a..cfcd5e9 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -11,20 +11,20 @@ INITRAMFS_IMAGE ?= ""
 INITRAMFS_TASK ?= ""
 
 python __anonymous () {
-    kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
-    if kerneltype == 'uImage':
-    	depends = d.getVar("DEPENDS", True)
-    	depends = "%s u-boot-mkimage-native" % depends
-    	d.setVar("DEPENDS", depends)
+	kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
+	if kerneltype == 'uImage':
+		depends = d.getVar("DEPENDS", True)
+		depends = "%s u-boot-mkimage-native" % depends
+		d.setVar("DEPENDS", depends)
 
-    image = d.getVar('INITRAMFS_IMAGE', True)
-    if image:
-    	d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
+	image = d.getVar('INITRAMFS_IMAGE', True)
+	if image:
+		d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
 
-    machine_kernel_pr = d.getVar('MACHINE_KERNEL_PR', True)
+	machine_kernel_pr = d.getVar('MACHINE_KERNEL_PR', True)
 
-    if machine_kernel_pr:
-    	d.setVar('PR', machine_kernel_pr)
+	if machine_kernel_pr:
+		d.setVar('PR', machine_kernel_pr)
 }
 
 inherit kernel-arch deploy
@@ -96,7 +96,7 @@ kernel_do_compile() {
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake ${PARALLEL_MAKE} modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+		oe_runmake ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 	else
 		bbnote "no modules to compile"
 	fi
@@ -120,7 +120,7 @@ kernel_do_install() {
 
 	#
 	# Install various kernel output (zImage, map file, config, module support files)
-	#	
+	#
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
 	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
@@ -193,7 +193,7 @@ kernel_do_install() {
 	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
 	           arch/powerpc/boot/mktree"
 	for entry in $bin_files; do
-	        rm -f $kerneldir/$entry
+		rm -f $kerneldir/$entry
 	done
 }
 
@@ -391,10 +391,10 @@ python populate_packages_prepend () {
 		return deps
 	
 	def get_dependencies(file, pattern, format):
-                # file no longer includes PKGD
+		# file no longer includes PKGD
 		file = file.replace(d.getVar('PKGD', True) or '', '', 1)
-                # instead is prefixed with /lib/modules/${KERNEL_VERSION}
-                file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
+		# instead is prefixed with /lib/modules/${KERNEL_VERSION}
+		file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
 
 		if module_deps.has_key(file):
 			import re
@@ -498,34 +498,34 @@ python populate_packages_prepend () {
 do_sizecheck() {
 	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
 		size=`ls -l ${KERNEL_OUTPUT} | awk '{ print $5}'`
-        	if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
+		if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
 			rm ${KERNEL_OUTPUT}
-                	die  "This kernel (size=$size > ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the size of the kernel by making more of it modular."
-        	fi
-    	fi
+			die "This kernel (size=$size > ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the size of the kernel by making more of it modular."
+		fi
+	fi
 }
 
 addtask sizecheck before do_install after do_compile
 
 do_uboot_mkimage() {
-    if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
-        ENTRYPOINT=${UBOOT_ENTRYPOINT}
-        if test -n "${UBOOT_ENTRYSYMBOL}"; then
-            ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
-                   awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
-        fi
-        if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
-            ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
-            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
-            rm -f linux.bin
-        else
-            ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
-            rm -f linux.bin.gz
-            gzip -9 linux.bin
-            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
-            rm -f linux.bin.gz
-        fi
-    fi
+	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
+		ENTRYPOINT=${UBOOT_ENTRYPOINT}
+		if test -n "${UBOOT_ENTRYSYMBOL}"; then
+			ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+				awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+		fi
+		if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
+			${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
+			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
+			rm -f linux.bin
+		else
+			${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
+			rm -f linux.bin.gz
+			gzip -9 linux.bin
+			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
+			rm -f linux.bin.gz
+		fi
+	fi
 }
 
 addtask uboot_mkimage before do_install after do_compile
-- 
1.7.8.5



