Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <dp@xora.org.uk>) id 1IxLQp-0004ea-6d
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2007 12:50:19 +0100
Received: from [192.168.1.65] ([::ffff:78.86.128.56])
	(AUTH: PLAIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Wed, 28 Nov 2007 11:47:23 +0000
	id 0006822F.474D554B.000015FD
Message-ID: <474D5541.2020107@xora.org.uk>
Date: Wed, 28 Nov 2007 11:47:13 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
Mime-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.5
Subject: [RFC] Fix uImage generation in way compatible with kernel.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2007 11:50:19 -0000
Content-Type: multipart/mixed;
	boundary="=_xora.vm.bytemark.co.uk-5629-1196250443-0001-2"

--=_xora.vm.bytemark.co.uk-5629-1196250443-0001-2
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

I would like to do the attached patch to linux.inc to change uImage
generation so it is compatible with the way kernel.bbclass does things.

This means the uImage ends up in kernel-image not some random file
called uImage but not really a uImage.

koen said the do_install_prepend stuff was to work around vendor bugs
and is no longer needed in this file.

Thanks

Graeme
#
# old_revision [1e4ef7149831080d7927cc7ef101deab67fae6d7]
#
# patch "packages/linux/linux.inc"
#  from [14e3b9590c6a3ef9334959ab19c1b24b1954b55b]
#    to [46987c309dbee09b17a0f857b8163a862cadd4d8]
#
============================================================
--- packages/linux/linux.inc	14e3b9590c6a3ef9334959ab19c1b24b1954b55b
+++ packages/linux/linux.inc	46987c309dbee09b17a0f857b8163a862cadd4d8
@@ -66,7 +66,7 @@ do_configure_prepend() {
                     -e '/CONFIG_CMDLINE=/d' \
                     -i ${S}/.config
                 echo "CONFIG_INET=y"                     >> ${S}/.config
-				echo "CONFIG_IP_PNP=y"                   >> ${S}/.config
+                echo "CONFIG_IP_PNP=y"                   >> ${S}/.config
                 echo "CONFIG_USB_GADGET=y"               >> ${S}/.config
                 echo "CONFIG_USB_GADGET_SELECTED=y"      >> ${S}/.config
                 echo "CONFIG_USB_ETH=y"                  >> ${S}/.config
@@ -89,22 +89,24 @@ do_sizecheck() {
         fi
 }
 
-do_install_prepend() {
-        if test -e arch/${ARCH}/boot/Image ; then
-             ln -f arch/${ARCH}/boot/Image arch/${ARCH}/boot/uImage
-        fi
+UBOOT_ENTRYPOINT ?= "20008000"
 
-        if test -e arch/${ARCH}/boot/images/uImage ; then
-             ln -f arch/${ARCH}/boot/images/uImage arch/${ARCH}/boot/uImage
+do_compile_append() {
+    if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
+        if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
+            ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
+            uboot-mkimage -A ${ARCH} -O linux -T kernel -C none -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
+            rm -f linux.bin
+        else
+            ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
+            rm -f linux.bin.gz
+            gzip -9 linux.bin
+            uboot-mkimage -A ${ARCH} -O linux -T kernel -C gzip -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
+            rm -f linux.bin.gz
         fi
-
-        if test -e arch/${ARCH}/kernel/vmlinux.lds ; then
-             ln -f arch/${ARCH}/kernel/vmlinux.lds arch/${ARCH}/boot/vmlinux
-        fi
+    fi
 }
-
-UBOOT_ENTRYPOINT ?= "20008000"
-
+                    
 KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
 KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-${MACHINE}"
 
@@ -112,24 +114,10 @@ do_deploy() {
         install -d ${DEPLOY_DIR_IMAGE}
         install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
         tar -cvzf ${DEPLOY_DIR_IMAGE}/modules-${KERNEL_RELEASE}-${PR}-${MACHINE}.tgz -C ${D} lib
-        
-        if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
-            if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
-                ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
-                uboot-mkimage -A ${ARCH} -O linux -T kernel -C none -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOY_DIR_IMAGE}/uImage-${PV}-${PR}-${MACHINE}-${DATETIME}.bin
-                rm -f linux.bin
-            else
-                ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
-                rm -f linux.bin.gz
-                gzip -9 linux.bin
-                uboot-mkimage -A ${ARCH} -O linux -T kernel -C gzip -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOY_DIR_IMAGE}/uImage-${PV}-${PR}-${MACHINE}-${DATETIME}.bin
-                rm -f linux.bin.gz
-            fi
-        fi
 
-		cd ${DEPLOY_DIR_IMAGE}
-		rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
-		ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
+        cd ${DEPLOY_DIR_IMAGE}
+        rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
+        ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
 }
 
 do_deploy[dirs] = "${S}"

--=_xora.vm.bytemark.co.uk-5629-1196250443-0001-2--
