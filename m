Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srop3-0002BY-BC
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 13:23:09 +0200
Received: by wgbdr1 with SMTP id dr1so2166976wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 04:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7NE+D+T3DYWBjsOKkFhYCd6ExJnirzgL5NqFUDW/fIc=;
	b=iEKg+xzEYL/TfpcTiGaBS+pAnlhw7Yc5vptr3vXKRcETDjclrj6Yo40Em+FZnkMwO7
	dURAEb6+7JJnym9UEk7ELZqpMqy+Tf06PpqJ/78GniGNpX0YuI+i30aFQ5XLVqtluBeF
	izjWULjGMHA93xHUBb151Fmn+J/mCldseSlX6KZGfThDOPhGY0ZhOe3m1WwZRzcYqmva
	BKPPTjSmgD1dI7cg+B3TJm7bGCl/wcjvjI2jm1DbyZvJHDiAdx5SfkLkWEQw2XFjhzXK
	wCAFVg591zpJHUxYogowo99qfLA475U4uQjruGtUKPKw5jH3M+Cjx4iUcQyWMLv3dse5
	OETw==
Received: by 10.180.90.207 with SMTP id by15mr15181626wib.22.1342696307695;
	Thu, 19 Jul 2012 04:11:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ck9sm5322485wib.2.2012.07.19.04.11.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 04:11:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 13:11:55 +0200
Message-Id: <1342696316-8537-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][RFC 1/2] kernel.bbclass: convert tabs to 4 spaces also in bash tasks
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
X-List-Received-Date: Thu, 19 Jul 2012 11:23:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |  346 ++++++++++++++++++++--------------------
 1 files changed, 173 insertions(+), 173 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 2bb1b5b..77bddd2 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -89,163 +89,163 @@ KERNEL_SRC_PATH = "/usr/src/kernel"
 KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
 
 kernel_do_compile() {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
-	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
-	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
-		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
-	fi
+    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+    oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+    oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+    if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
+        gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
+    fi
 }
 
 do_compile_kernelmodules() {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}"
-	else
-		bbnote "no modules to compile"
-	fi
+    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+    if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+        oe_runmake ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+    else
+        bbnote "no modules to compile"
+    fi
 }
 addtask compile_kernelmodules after do_compile before do_install
 
 kernel_do_install() {
-	#
-	# First install the modules
-	#
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
-		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
-		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
-		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
-		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
-	else
-		bbnote "no modules to install"
-	fi
-
-	#
-	# Install various kernel output (zImage, map file, config, module support files)
-	#
-	install -d ${D}/${KERNEL_IMAGEDEST}
-	install -d ${D}/boot
-	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
-	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
-	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
-	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
-	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
-	install -d ${D}/etc/modules-load.d
-	install -d ${D}/etc/modprobe.d
-
-	#
-	# Support for external module building - create a minimal copy of the
-	# kernel source tree.
-	#
-	kerneldir=${D}${KERNEL_SRC_PATH}
-	install -d $kerneldir
-
-	#
-	# Store the kernel version in sysroots for module-base.bbclass
-	#
-
-	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
-
-	#
-	# Store kernel image name to allow use during image generation
-	#
-
-	echo "${KERNEL_IMAGE_BASE_NAME}" >$kerneldir/kernel-image-name
-
-	#
-	# Copy the entire source tree. In case an external build directory is
-	# used, copy the build directory over first, then copy over the source
-	# dir. This ensures the original Makefiles are used and not the
-	# redirecting Makefiles in the build directory.
-	#
-	# work and sysroots can be on different partitions, so we can't rely on
-	# hardlinking, unfortunately.
-	#
-	cp -fR * $kerneldir
-	cp .config $kerneldir
-	if [ "${S}" != "${B}" ]; then
-		cp -fR ${S}/* $kerneldir
-	fi
-	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
-	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
-
-	#
-	# Clean and remove files not needed for building modules.
-	# Some distributions go through a lot more trouble to strip out
-	# unecessary headers, for now, we just prune the obvious bits.
-	#
-	# We don't want to leave host-arch binaries in /sysroots, so
-	# we clean the scripts dir while leaving the generated config
-	# and include files.
-	#
-	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
-	make -C $kerneldir _mrproper_scripts
-	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
-	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
-
-	# As of Linux kernel version 3.0.1, the clean target removes
-	# arch/powerpc/lib/crtsavres.o which is present in
-	# KBUILD_LDFLAGS_MODULE, making it required to build external modules.
-	if [ ${ARCH} = "powerpc" ]; then
-		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
-	fi
-
-	# Necessary for building modules like compat-wireless.
-	cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
-
-	# Remove the following binaries which cause strip or arch QA errors
-	# during do_package for cross-compiled platforms
-	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
-	           arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
-		   scripts/kconfig/conf.o scripts/kconfig/kxgettext.o"
-	for entry in $bin_files; do
-		rm -f $kerneldir/$entry
-	done
+    #
+    # First install the modules
+    #
+    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+    if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+        oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
+        rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
+        rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
+        rm "${D}/lib/modules/${KERNEL_VERSION}/build"
+        rm "${D}/lib/modules/${KERNEL_VERSION}/source"
+    else
+        bbnote "no modules to install"
+    fi
+
+    #
+    # Install various kernel output (zImage, map file, config, module support files)
+    #
+    install -d ${D}/${KERNEL_IMAGEDEST}
+    install -d ${D}/boot
+    install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
+    install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
+    install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
+    install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
+    [ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
+    install -d ${D}/etc/modules-load.d
+    install -d ${D}/etc/modprobe.d
+
+    #
+    # Support for external module building - create a minimal copy of the
+    # kernel source tree.
+    #
+    kerneldir=${D}${KERNEL_SRC_PATH}
+    install -d $kerneldir
+
+    #
+    # Store the kernel version in sysroots for module-base.bbclass
+    #
+
+    echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
+
+    #
+    # Store kernel image name to allow use during image generation
+    #
+
+    echo "${KERNEL_IMAGE_BASE_NAME}" >$kerneldir/kernel-image-name
+
+    #
+    # Copy the entire source tree. In case an external build directory is
+    # used, copy the build directory over first, then copy over the source
+    # dir. This ensures the original Makefiles are used and not the
+    # redirecting Makefiles in the build directory.
+    #
+    # work and sysroots can be on different partitions, so we can't rely on
+    # hardlinking, unfortunately.
+    #
+    cp -fR * $kerneldir
+    cp .config $kerneldir
+    if [ "${S}" != "${B}" ]; then
+        cp -fR ${S}/* $kerneldir
+    fi
+    install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
+    install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
+
+    #
+    # Clean and remove files not needed for building modules.
+    # Some distributions go through a lot more trouble to strip out
+    # unecessary headers, for now, we just prune the obvious bits.
+    #
+    # We don't want to leave host-arch binaries in /sysroots, so
+    # we clean the scripts dir while leaving the generated config
+    # and include files.
+    #
+    oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
+    make -C $kerneldir _mrproper_scripts
+    find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
+    find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
+
+    # As of Linux kernel version 3.0.1, the clean target removes
+    # arch/powerpc/lib/crtsavres.o which is present in
+    # KBUILD_LDFLAGS_MODULE, making it required to build external modules.
+    if [ ${ARCH} = "powerpc" ]; then
+        cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
+    fi
+
+    # Necessary for building modules like compat-wireless.
+    cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
+
+    # Remove the following binaries which cause strip or arch QA errors
+    # during do_package for cross-compiled platforms
+    bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
+               arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
+               scripts/kconfig/conf.o scripts/kconfig/kxgettext.o"
+    for entry in $bin_files; do
+        rm -f $kerneldir/$entry
+    done
 }
 
 sysroot_stage_all_append() {
-	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
+    sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
 }
 
 kernel_do_configure() {
-	# fixes extra + in /lib/modules/2.6.37+
-	# $ scripts/setlocalversion . => +
-	# $ make kernelversion => 2.6.37
-	# $ make kernelrelease => 2.6.37+
-	touch ${B}/.scmversion ${S}/.scmversion
-
-	# Copy defconfig to .config if .config does not exist. This allows
-	# recipes to manage the .config themselves in do_configure_prepend().
-	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
-		cp "${WORKDIR}/defconfig" "${B}/.config"
-	fi
-	yes '' | oe_runmake oldconfig
-
-	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
-		for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
-		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
-			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" initramfs.$img
-		fi
-		done
-	fi
+    # fixes extra + in /lib/modules/2.6.37+
+    # $ scripts/setlocalversion . => +
+    # $ make kernelversion => 2.6.37
+    # $ make kernelrelease => 2.6.37+
+    touch ${B}/.scmversion ${S}/.scmversion
+
+    # Copy defconfig to .config if .config does not exist. This allows
+    # recipes to manage the .config themselves in do_configure_prepend().
+    if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
+        cp "${WORKDIR}/defconfig" "${B}/.config"
+    fi
+    yes '' | oe_runmake oldconfig
+
+    if [ ! -z "${INITRAMFS_IMAGE}" ]; then
+        for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
+        if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
+            cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" initramfs.$img
+        fi
+        done
+    fi
 }
 
 do_configure[depends] += "${INITRAMFS_TASK}"
 
 do_savedefconfig() {
-	oe_runmake savedefconfig
+    oe_runmake savedefconfig
 }
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
 
 pkg_postinst_kernel-base () {
-	cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
+    cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
 }
 
 pkg_postrm_kernel-base () {
-	cd /${KERNEL_IMAGEDEST}; update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
+    cd /${KERNEL_IMAGEDEST}; update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
 }
 
 inherit cml1
@@ -272,19 +272,19 @@ ALLOW_EMPTY_kernel-image = "1"
 
 pkg_postinst_kernel-image () {
 if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
-	mkdir -p $D/lib/modules/${KERNEL_VERSION}
+    mkdir -p $D/lib/modules/${KERNEL_VERSION}
 fi
 if [ -n "$D" ]; then
-	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
+    depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 else
-	depmod -a ${KERNEL_VERSION}
+    depmod -a ${KERNEL_VERSION}
 fi
 }
 
 pkg_postinst_modules () {
 if [ -z "$D" ]; then
-	depmod -a ${KERNEL_VERSION}
-	update-modules || true
+    depmod -a ${KERNEL_VERSION}
+    update-modules || true
 fi
 }
 
@@ -294,7 +294,7 @@ update-modules || true
 
 autoload_postinst_fragment() {
 if [ x"$D" = "x" ]; then
-	modprobe %s || true
+    modprobe %s || true
 fi
 }
 
@@ -494,13 +494,13 @@ python populate_packages_prepend () {
 # Support checking the kernel size since some kernels need to reside in partitions
 # with a fixed length or there is a limit in transferring the kernel to memory
 do_sizecheck() {
-	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
-		size=`ls -l ${KERNEL_OUTPUT} | awk '{ print $5}'`
-		if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
-			rm ${KERNEL_OUTPUT}
-			die "This kernel (size=$size > ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the size of the kernel by making more of it modular."
-		fi
-	fi
+    if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
+        size=`ls -l ${KERNEL_OUTPUT} | awk '{ print $5}'`
+        if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
+            rm ${KERNEL_OUTPUT}
+            die "This kernel (size=$size > ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the size of the kernel by making more of it modular."
+        fi
+    fi
 }
 
 addtask sizecheck before do_install after do_compile
@@ -511,42 +511,42 @@ KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
 
 do_uboot_mkimage() {
-	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
-		if test "x${KEEPUIMAGE}" = "x" ; then
-			ENTRYPOINT=${UBOOT_ENTRYPOINT}
-			if test -n "${UBOOT_ENTRYSYMBOL}"; then
-				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
-					awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
-			fi
-			if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
-				${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
-				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
-				rm -f linux.bin
-			else
-				${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
-				rm -f linux.bin.gz
-				gzip -9 linux.bin
-				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
-				rm -f linux.bin.gz
-			fi
-		fi
-	fi
+    if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
+        if test "x${KEEPUIMAGE}" = "x" ; then
+            ENTRYPOINT=${UBOOT_ENTRYPOINT}
+            if test -n "${UBOOT_ENTRYSYMBOL}"; then
+                ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+                    awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+            fi
+            if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
+                ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
+                uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
+                rm -f linux.bin
+            else
+                ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
+                rm -f linux.bin.gz
+                gzip -9 linux.bin
+                uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
+                rm -f linux.bin.gz
+            fi
+        fi
+    fi
 }
 
 addtask uboot_mkimage before do_install after do_compile
 
 kernel_do_deploy() {
-	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
-	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
-	fi
+    install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
+    if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+        tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
+    fi
 
-	cd ${DEPLOYDIR}
-	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
+    cd ${DEPLOYDIR}
+    rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
+    ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
+    ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
 
-	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
+    cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 }
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 
-- 
1.7.8.6



