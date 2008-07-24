Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1KMAgf-0000Qd-8d
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jul 2008 01:57:33 +0200
Received: (qmail invoked by alias); 24 Jul 2008 23:56:13 -0000
Received: from BAA37fe.baa.pppool.de (EHLO [192.168.178.36]) [77.128.55.254]
	by mail.gmx.net (mp013) with SMTP; 25 Jul 2008 01:56:13 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX181KwQb4HA1JyMvde+nxq2WQbkM3EyT/0fPUImyj3
	ByRv4ZuHez/tfH
Message-ID: <4889169C.7040108@gmx.de>
Date: Fri, 25 Jul 2008 01:56:12 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.46
Subject: RFC: kernel.bbclass and collie changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 24 Jul 2008 23:57:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

recently I finished a version of the spi driver for collie that is stable enough to use it as rootfs.
I already changed linux-rp to use mmc as root for collie but the resulting kernel is to large to fit
into flash. My solution is to flash a small initramfsed kernel that mounts the mmc card and kexecs
the real kernel from there.

How to use it:
1.) Apply the patch and build and image.  
2.) Rename zImage-collie-initramfs-kexec-image.bin to zImage.bin and flash as usual.
3.) untar your image to and ext2 formated card.
4.) pluck card into collie and switch on ;)

The only thing that affects non-collie builds is the change to device-table-minimal.txt. 
(I think nobody besides me uses the initramfs stuff ;)

Regards,
Thomas


#
# old_revision [d2f1a9f3ef64d23cec1e794848e1bb2ac1a92e63]
#
# patch "classes/kernel.bbclass"
#  from [7cbc09d4f4fd3e7051928da4ba4f8a6034393be9]
#    to [1a63b385323bcf314f65bd05cc5963ec6180ad6d]
# 
# patch "conf/machine/collie.conf"
#  from [c23a85835bc13ac978f36742cfc8ccf5880e0ec8]
#    to [aaae77a5a101fd08c9c0ca4d7f3257dd366367c4]
# 
# patch "conf/machine/include/zaurus-2.6.inc"
#  from [f56c5d7f00ad90430d1cfa3e9ff6283245f5e5c6]
#    to [08ade12cfdbf640f48c99ad3ad0be3a17ec5b626]
# 
# patch "files/device_table-minimal.txt"
#  from [3bd5796d9d4d302802ffbab0580fb8dc852b27c9]
#    to [dc5b02b6b72706c570908f014c45cafb6301c452]
#
============================================================
--- classes/kernel.bbclass	7cbc09d4f4fd3e7051928da4ba4f8a6034393be9
+++ classes/kernel.bbclass	1a63b385323bcf314f65bd05cc5963ec6180ad6d
@@ -91,13 +91,31 @@ do_builtin_initramfs() {
 	 if [ ! -z "${INITRAMFS_IMAGE}" ]; then
 		unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 		cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" usr/initramfs_data.cpio.gz
+		
+		if [ -e "../initramfs-config-${MACHINE}" ]; then
+			cp .config config.bak
+			cp ../initramfs-config-${MACHINE} .config
+		fi
+		
 		oe_runmake ${KERNEL_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 	
+		if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
+        		size=`ls -l arch/${ARCH}/boot/${KERNEL_IMAGETYPE} | awk '{ print $5}'`
+        		if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
+                		rm arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
+				die  "This kernel with buildin initramfs (size=$size > ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the size of the kernel by making more of it modular, or reduce the size it the initramfs-image"
+        		fi
+    		fi
+		
 		install -d ${DEPLOY_DIR_IMAGE}
 		install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}-${INITRAMFS_IMAGE}.bin
 		package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}-${INITRAMFS_IMAGE}.bin
-	
-		# Make sure to kill injected initramfs, in case someone will do "-c compile -f"
+		
+		
+		# Make sure to kill injected initramfs and config, in case someone will do "-c compile -f"
+		if [ -e "../initramfs-config-${MACHINE}" ]; then
+			cp config.bak .config
+		fi
 		rm usr/initramfs_data.cpio.gz
 		
 		cd ${DEPLOY_DIR_IMAGE}
@@ -468,7 +486,7 @@ do_sizecheck() {
 # Support checking the kernel size since some kernels need to reside in partitions
 # with a fixed length or there is a limit in transferring the kernel to memory
 do_sizecheck() {
-	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
+	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" -a -z "${DONT_CHECK_KERNELSIZE}"]; then
         	size=`ls -l arch/${ARCH}/boot/${KERNEL_IMAGETYPE} | awk '{ print $5}'`
         	if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
                 	rm arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
============================================================
--- conf/machine/collie.conf	c23a85835bc13ac978f36742cfc8ccf5880e0ec8
+++ conf/machine/collie.conf	aaae77a5a101fd08c9c0ca4d7f3257dd366367c4
@@ -16,3 +16,9 @@ ROOT_FLASH_SIZE = "14"
 
 ROOT_FLASH_SIZE = "14"
 # actually 14680064, see EXTRA_IMAGECMD above
+
+# we store kernel images in rootfs and only a minimal initramfs kernel in mtd1 for booting other kernels
+INITRAMFS_IMAGE= "initramfs-kexec-image"
+DONT_CHECK_KERNELSIZE = "1"
+
+XSERVER = "xserver-kdrive-fbdev"
============================================================
--- conf/machine/include/zaurus-2.6.inc	f56c5d7f00ad90430d1cfa3e9ff6283245f5e5c6
+++ conf/machine/include/zaurus-2.6.inc	08ade12cfdbf640f48c99ad3ad0be3a17ec5b626
@@ -72,4 +72,6 @@ RDEPENDS_kernel-base = ""
 
 # Don't include kernels in standard images for Zaurus machines
 RDEPENDS_kernel-base = ""
+# collie is an exception. We use mmc as root, include kernel and use another small kernel to boot it.
+RDEPENDS_kernel-base_collie = "kernel-image" 
 KERNEL_IMAGETYPE = "zImage"
============================================================
--- files/device_table-minimal.txt	3bd5796d9d4d302802ffbab0580fb8dc852b27c9
+++ files/device_table-minimal.txt	dc5b02b6b72706c570908f014c45cafb6301c452
@@ -29,3 +29,4 @@
 /dev/random	c	644	0	0	1	8	-	-	-
 /dev/urandom	c	644	0	0	1	9	-	-	-
 /dev/ptmx	c	644	0	0	5	2	-	-	-
+/dev/mmcblk0p1	b	6600	0	6	179	1	-	-	-



