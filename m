Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <v2g.udel@gmail.com>) id 1Q4w62-0001sl-HL
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 16:10:06 +0200
Received: by vxd7 with SMTP id 7so1167128vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=zRcxcf/Pn43Y4AqQwt5XCplqwvk9J8ifaqHTKKobhTc=;
	b=E4fu+OVNHv18FMOaZOE0W+TW+v/AvHVWm3Eoi/ey6d4H7KTD32z3fpGe/ayCAa93Ri
	q8a05syMF+9rtqMtaDDREHOLGWgMov8Mdg7flYwQf2NtwAUAqGV6Km96SqgQTGB+1KCQ
	QJ2e3ZLlnuPzRvrOnnv6EJXB4NIu19c78JeTM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=afojJK9DxV+GZ3nctcpchTFOkTou0W/4jciRHefG5MZ4lINTcxHSj3GbftFgg2wXop
	83dhT4rfseHgVSZeXnJYKr0ulL7N4owIM89+y/lzS+Ppk+NQquKlJxuPTI8t86DpwrNs
	AaBHFunB9lGnZnIQeNWFTAESWM/ZMFN2JflR0=
Received: by 10.52.0.239 with SMTP id 15mr1657645vdh.65.1301494085652;
	Wed, 30 Mar 2011 07:08:05 -0700 (PDT)
Received: from localhost.localdomain (fundoo.ceoe.udel.edu [128.175.74.10])
	by mx.google.com with ESMTPS id h34sm26893vcr.18.2011.03.30.07.08.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2011 07:08:05 -0700 (PDT)
From: UDel V2G Team <v2g.udel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 10:07:09 -0400
Message-Id: <1301494030-10554-5-git-send-email-v2g.udel@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
References: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
Subject: [PATCH 5/6] Added images for the TS7500 ARM SBCs
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
X-List-Received-Date: Wed, 30 Mar 2011 14:10:07 -0000

* This commit includes two images - one for building the initrd image and the other for
  building the rootfs image.

Signed-off-by: UDel V2G Team <v2g.udel@gmail.com>
---
 files/device_table-ts75xx.txt         |   66 +++++++++++
 recipes/images/ts75xx-initrd-image.bb |   89 ++++++++++++++
 recipes/images/ts75xx-rootfs-image.bb |  206 +++++++++++++++++++++++++++++++++
 3 files changed, 361 insertions(+), 0 deletions(-)
 create mode 100644 files/device_table-ts75xx.txt
 create mode 100644 recipes/images/ts75xx-initrd-image.bb
 create mode 100644 recipes/images/ts75xx-rootfs-image.bb

diff --git a/files/device_table-ts75xx.txt b/files/device_table-ts75xx.txt
new file mode 100644
index 0000000..feacaa0
--- /dev/null
+++ b/files/device_table-ts75xx.txt
@@ -0,0 +1,66 @@
+#<path> <type> <mode>   <uid>   <gid>   <major> <minor> <start> <inc>   <count>
+#/dev/mem    c      640      0       0       1       1       0        0        -
+#
+#type can be one of: 
+#    f  A regular file
+#    d  Directory
+#    c  Character special device file
+#    b  Block special device file
+#    p  Fifo (named pipe)
+/dev            d       755     0       0       -       -       -       -       -
+/dev/initctl    p       600     0       0       -       -       -       -       -
+/dev/pts	d	775	0	0	-	-	-	-	-
+/dev/shm	d	775	0	0	-	-	-	-	-
+/var		d	775	0	0	-	-	-	-	-
+/boot/var/empty	d	755	0	3	-	-	-	-
+/dev/apm_bios	c	660	0	46	10	134	-	-	-
+/dev/console	c	660	0	5	5	1	-	-
+/dev/full	c	666	0	7	-	-	-
+/dev/i2c0	c	660	0	0	89	0	-	-	-
+/dev/kmem	c	640	0	15	1	2	-	-	-
+/dev/kmsg	c	640	0	0	1	11	-	-	-
+/dev/loop0	b	660	0	11	7	0	-	-	-
+/dev/loop1	b	660	0	11	7	1	-	-	-
+/dev/mem	c	640	0	15	1	1	-	-	-
+/dev/mtd	c	660	0	6	90	0	0	2	8
+/dev/mtdblock	b	640	0	0	31	0	0	1	8
+/dev/nbd0	b	664	0	0	43	0	-	-	-
+/dev/nbd1	b	664	0	0	43	1	-	-	-
+/dev/nbd2	b	664	0	0	43	2	-	-	-
+/dev/nbd3	b	664	0	0	43	3	-	-	-
+/dev/nbd4	b	664	0	0	43	4	-	-	-
+/dev/nbd5	b	664	0	0	43	5	-	-	-
+/dev/nbd6	b	664	0	0	43	6	-	-	-
+/dev/nbd7	b	664	0	0	43	7	-	-	-
+/dev/nbd8	b	664	0	0	43	8	-	-	-
+/dev/nbd9	b	664	0	0	43	9	-	-	-
+/dev/nbd10	b	664	0	0	43	10	-	-	-
+/dev/nbd11	b	664	0	0	43	11	-	-	-
+/dev/nbd12	b	664	0	0	43	12	-	-	-
+/dev/nbd13	b	664	0	0	43	13	-	-	-
+/dev/nbd14	b	664	0	0	43	14	-	-	-
+/dev/nbd15	b	664	0	0	43	15	-	-	-
+/dev/null	c	666	0	0	1	3	-	-	-
+/dev/port	c	640	0	15	1	4	-	-	-
+/dev/ppp	c	640	0	0	108	0	-	-	-
+/dev/psaux	c	660	0	0	10	1	-	-	-
+/dev/ptmx	c	666	0	5	5	2	-	-	-
+/dev/ram0	b	644	0	0	1	0	0	1	4
+/dev/ram1	b	660	0	0	1	1	0	1	4
+/dev/ram2	b	660	0	0	1	2	0	1	4
+/dev/ram3	b	660	0	0	1	3	0	1	4
+/dev/random	c	444	0	0	1	8	-	-	-
+/dev/rtc	c	660	0	47	10	135	-	-	-
+/dev/sda	b	660	0	6	8	0	-	-	-
+/dev/sda1	b	660	0	6	8	1	-	-	-
+/dev/sda2	b	660	0	6	8	2	-	-	-
+/dev/sda3	b	660	0	6	8	3	-	-	-
+/dev/sda4	b	660	0	6	8	4	-	-	-
+/dev/tty	c	664	0	5	5	0	-	-	-
+/dev/ttyS0	c	660	0	5	4	64	0	1	2
+/dev/ttyS1	c	660	0	5	4	65	0	1	2
+/dev/ttyUSB	c	660	0	5	188	0	0	1	2
+/dev/urandom	c	644	0	0	1	9	-	-	-
+/dev/usbdev1.1_ep00	c	660	0	5	254	0	-	-	-
+/dev/usbdev1.1_ep81	c	660	0	5	254	1	-	-	-
+/dev/zero	c	644	0	0	1	5	-	-	-
diff --git a/recipes/images/ts75xx-initrd-image.bb b/recipes/images/ts75xx-initrd-image.bb
new file mode 100644
index 0000000..306bf3a
--- /dev/null
+++ b/recipes/images/ts75xx-initrd-image.bb
@@ -0,0 +1,89 @@
+# This is an initrd recipe for the Technologic Systems TS7500 board
+#
+# The generated initrd image will be very similar to stock initrd
+# that can be downloaded from:
+# ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/binaries/ts-images/
+# with a few changes:
+# 1. All the linuxrc and ts-bitstreams have been moved to the ts7500 directory
+# 2. The linuxrc scripts have been modified to mount the third partition 
+#    of the SD card as root (/) and the fourth partition as /var
+# 3. All the ts utilities included in /sbin now use the EABI, so the OABI
+#    support in the kernel is no longer needed
+# 4. Unionfs is not built into the kernel, so it no longer needs to be
+#    loaded as a module.
+
+# Use a newer version of busybox since it includes the nbd-client applet.
+# We no longer need to build the nbd-client program since we enable this.
+DEPENDS = "busybox-1.18.3"
+
+IMAGE_INSTALL = "busybox canctl dioctl dmxctl spictl ts-utils ts-initrd \
+	      kernel-module-crash \
+	      kernel-module-ehci-hcd \
+	      kernel-module-input-core \
+	      kernel-module-inthandler \
+	      kernel-module-scsi-mod \
+	      kernel-module-scsi-wait-scan \
+	      kernel-module-sd-mod \
+	      kernel-module-sg \
+	      kernel-module-usbcore \
+	      kernel-module-usb-storage \
+	      "
+IMAGE_LINGUAS = ""
+
+# We don't need a login manager or init scripts 
+IMAGE_LOGIN_MANAGER = ""
+
+# Include minimum init and init scripts
+IMAGE_DEV_MANAGER = "busybox-mdev"
+IMAGE_INIT_MANAGER = ""
+IMAGE_INITSCRIPTS = ""
+
+# This should build all the correct device tables.
+IMAGE_DEVICE_TABLES = "files/device_table-ts75xx.txt"
+
+fix_image () {
+	  echo "Fixing Image... ${IMAGE_ROOTFS}"
+	  # Delete extra files
+	  for file in "${IMAGE_ROOTFS}/usr/bin/opkg* \
+	      ${IMAGE_ROOTFS}/usr/bin/update-alternatives \
+	      ${IMAGE_ROOTFS}/usr/lib/* \
+	      ${IMAGE_ROOTFS}/usr/share/* \
+	      ${IMAGE_ROOTFS}/var/lib/opkg \
+	      ${IMAGE_ROOTFS}/sbin/diotest* \
+	      ${IMAGE_ROOTFS}/sbin/dioctl \
+	      ${IMAGE_ROOTFS}/lib/libdioctl.so.1.0.1 \
+	      ${IMAGE_ROOTFS}/lib/modules \
+	      ${IMAGE_ROOTFS}/etc/* \
+	      ${IMAGE_ROOTFS}/var/*" ; 
+          do rm -r ${file} ; done
+	  
+	  # Make extra nodes
+	  for file in "${IMAGE_ROOTFS}/mnt/root \
+	      ${IMAGE_ROOTFS}/mnt/root/var \
+	      ${IMAGE_ROOTFS}/lib/modules \
+	      ${IMAGE_ROOTFS}/proc \
+	      ${IMAGE_ROOTFS}/sys \
+	      ${IMAGE_ROOTFS}/var/run \
+	      ${IMAGE_ROOTFS}/var/lock" ; 
+          do mkdir -p ${file} ; done
+	  
+	  # Copy over the linuxrc scripts
+	  cp ${IMAGE_ROOTFS}/ts7500/linuxrc-sdroot-readonly ${IMAGE_ROOTFS}/linuxrc
+}
+
+create_modules_gz () {
+	  OLDPWD=`pwd`
+	  cd ${IMAGE_ROOTFS}
+	  tar cvzf ${IMAGE_ROOTFS}/modules.tar.gz lib/modules
+	  cd $OLDPWD
+}
+
+# Remove any kernel-image that the kernel-module-* packages may have pulled in.
+PACKAGE_REMOVE = "kernel-image-* update-modules"
+ROOTFS_POSTPROCESS_COMMAND += "create_modules_gz ; opkg-cl ${IPKG_ARGS} -force-depends \
+                                remove ${PACKAGE_REMOVE}; "
+
+IMAGE_PREPROCESS_COMMAND += "fix_image ; "
+
+export IMAGE_BASENAME = "ts75xx-initrd-image"
+inherit image
diff --git a/recipes/images/ts75xx-rootfs-image.bb b/recipes/images/ts75xx-rootfs-image.bb
new file mode 100644
index 0000000..689d264
--- /dev/null
+++ b/recipes/images/ts75xx-rootfs-image.bb
@@ -0,0 +1,206 @@
+# This is an rootfs recipe for the Technologic Systems TS7500 board
+#
+# The TS7500 boards are meant to be booted using an initrd 
+# partition - so most of the init scripts in the rcS.d directory
+# and not needed. This image deletes those unneeded scripts. 
+# See the ts75xx-initrd-image.bb for the recipe for
+# building the initrd image. 
+#
+# This recipe also includes java. Feel free to disable it if not needed.
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp ; "
+IMAGE_INIT_MANAGER = "sysvinit"
+DISTRO_SSH_DAEMON = "openssh"
+BUILD_ALL_DEPS = "1"
+
+IMAGE_DEVICE_TABLES = "files/device_table-ts75xx.txt"
+
+DEPENDS = "\
+	task-proper-tools \
+	${DISTRO_SSH_DAEMON} \
+	${@base_contains('MACHINE_FEATURES', 'ext2', 'task-base-ext2', '', d)} \
+	${@base_contains('MACHINE_FEATURES', 'usbhost', 'task-base-usbhost', '', d)} \
+	canctl dioctl dmxctl spictl ts-utils ts-initrd \
+	coreutils \
+	findutils \
+	bash \
+	python \
+	ntp \
+	cron \
+	nano \
+	task-java \
+	dhclient \
+	dhcpcd \
+	"
+
+KERNEL_MODULES = "\
+     	kernel-module-aes-generic \
+     	kernel-module-ansi-cprng \
+	kernel-module-arptable-filter \
+     	kernel-module-arp-tables \
+     	kernel-module-arpt-mangle \
+     	kernel-module-atkbd \
+     	kernel-module-cn \
+     	kernel-module-crash \
+     	kernel-module-crc-itu-t \
+     	kernel-module-ehci-hcd \
+     	kernel-module-firmware-class \
+     	kernel-module-hid \
+     	kernel-module-input-core \
+     	kernel-module-inthandler \
+     	kernel-module-ip-queue \
+     	kernel-module-iptable-filter \
+     	kernel-module-iptable-mangle \
+     	kernel-module-iptable-nat \
+     	kernel-module-iptable-raw \
+     	kernel-module-ip-tables \
+     	kernel-module-ipt-addrtype \
+     	kernel-module-ipt-ah \
+     	kernel-module-ipt-ecn \
+     	kernel-module-ipt-log \
+     	kernel-module-ipt-masquerade \
+    	kernel-module-ipt-netmap \
+     	kernel-module-ipt-redirect \
+     	kernel-module-ipt-reject \
+     	kernel-module-ipt-ulog \
+     	kernel-module-ipv6 \
+     	kernel-module-libps2 \
+     	kernel-module-michael-mic \
+     	kernel-module-mousedev \
+     	kernel-module-nf-conntrack \
+     	kernel-module-nf-conntrack-ipv4 \
+     	kernel-module-nf-conntrack-pptp \
+     	kernel-module-nf-conntrack-proto-gre \
+     	kernel-module-nf-defrag-ipv4 \
+     	kernel-module-nf-nat \
+     	kernel-module-nf-nat-pptp \
+     	kernel-module-nf-nat-proto-gre \
+     	kernel-module-nfnetlink \
+     	kernel-module-nfnetlink-log \
+     	kernel-module-nfnetlink-queue \
+     	kernel-module-ohci-hcd \
+     	kernel-module-psmouse \
+     	kernel-module-r8a66597-udc \
+     	kernel-module-rng-core \
+     	kernel-modules \
+     	kernel-module-scsi-mod \
+     	kernel-module-scsi-wait-scan \
+     	kernel-module-sd-mod \
+     	kernel-module-serio \
+     	kernel-module-serport \
+     	kernel-module-sg \
+     	kernel-module-sha1-generic \
+     	kernel-module-sit \
+     	kernel-module-ssb \
+     	kernel-module-ts-bm \
+     	kernel-module-ts-fsm \
+     	kernel-module-ts-kmp \
+     	kernel-module-tunnel4 \
+     	kernel-module-uhci-hcd \
+     	kernel-module-usbcore \
+     	kernel-module-usbhid \
+     	kernel-module-usbserial \
+     	kernel-module-usb-storage \
+     	kernel-module-xfrm6-mode-beet \
+     	kernel-module-xfrm6-mode-transport \
+     	kernel-module-xfrm6-mode-tunnel \
+     	kernel-module-x-tables \
+     	kernel-module-xt-classify \
+     	kernel-module-xt-comment \
+     	kernel-module-xt-connbytes \
+     	kernel-module-xt-conntrack \
+     	kernel-module-xt-dccp \
+     	kernel-module-xt-helper \
+     	kernel-module-xt-hl \
+     	kernel-module-xt-iprange \
+     	kernel-module-xt-length \
+     	kernel-module-xt-limit \
+     	kernel-module-xt-mac \
+	kernel-module-xt-mark \
+     	kernel-module-xt-nflog \
+     	kernel-module-xt-nfqueue \
+     	kernel-module-xt-notrack \
+     	kernel-module-xt-pkttype \
+     	kernel-module-xt-realm \
+     	kernel-module-xt-sctp \
+     	kernel-module-xt-state \
+     	kernel-module-xt-string \
+     	kernel-module-xt-tcpmss \
+     	kernel-module-xt-tcpudp \
+	"
+
+IMAGE_INSTALL = "\
+	task-proper-tools \
+	${DISTRO_SSH_DAEMON} \
+	${@base_contains('MACHINE_FEATURES', 'ext2', 'task-base-ext2', '', d)} \
+	${@base_contains('MACHINE_FEATURES', 'usbhost', 'task-base-usbhost', '', d)} \
+	kernel-image \
+	${KERNEL_MODULES} \
+	canctl dioctl dmxctl spictl ts-utils ts-initrd \
+	bash \
+	python \
+	ntp \
+	cron \
+	nano \
+	screen \
+	wget \
+	curl \	
+	file \
+	task-java \
+	openjdk-6-vm-cacao \
+        openjdk-6-vm-shark \
+        openjdk-6-vm-zero \
+        openjdk-6-java \
+        openjdk-6-jdk \
+        openjdk-6-jre \
+        iptables \
+	dhclient \	
+	dhcpcd \
+	"
+
+fix_image () {
+          echo "Fixing Image... ${IMAGE_ROOTFS}"
+          # Delete extra files
+          for file in "${IMAGE_ROOTFS}/etc/rcS.d/S03udev \
+	      ${IMAGE_ROOTFS}/etc/rcS.d/S03sysfs \
+	      ${IMAGE_ROOTFS}/etc/rcS.d/S06alignment \
+	      ${IMAGE_ROOTFS}/etc/rcS.d/S10checkroot \
+	      ${IMAGE_ROOTFS}/etc/rcS.d/S12udev-cache \
+	      ${IMAGE_ROOTFS}/etc/rcS.d/S30procps.sh \
+	      ${IMAGE_ROOTFS}/etc/rcS.d/S30ramdisk \
+	      ${IMAGE_ROOTFS}/etc/rcS.d/S35mountall.sh \
+	      ${IMAGE_ROOTFS}/etc/rcS.d/S37populate-volatile.sh \
+	      ${IMAGE_ROOTFS}/etc/rcS.d/S38devpts.sh \
+	      ${IMAGE_ROOTFS}/etc/rcS.d/S39ifup \
+	      ${IMAGE_ROOTFS}/etc/rcS.d/S40configure \
+	      ${IMAGE_ROOTFS}/etc/rcS.d/S45mountnfs.sh \
+	      ${IMAGE_ROOTFS}/etc/rcS.d/S55bootmisc.sh \
+              ${IMAGE_ROOTFS}/var/*" ; 
+          do rm -r ${file} ; done
+          
+          # Make extra nodes
+          for file in "${IMAGE_ROOTFS}/proc \
+              ${IMAGE_ROOTFS}/sys \
+	      ${IMAGE_ROOTFS}/home/root \
+	      ${IMAGE_ROOTFS}/home/v2g \
+	      ${IMAGE_ROOTFS}/tmp" ; 
+          do mkdir -p ${file} ; done
+          
+	  # Fix the opkg-config
+	  echo "src/gz base http://chinook.ceoe.udel.edu/v2g/downloads/ts7500/glibc/ipk/armv4" > ${IMAGE_ROOTFS}/etc/opkg/base-feed.conf
+	  echo "src/gz noarch http://chinook.ceoe.udel.edu/v2g/downloads/ts7500/glibc/ipk/all" > ${IMAGE_ROOTFS}/etc/opkg/noarch-feed.conf
+	  echo "src/gz ts75xx http://chinook.ceoe.udel.edu/v2g/downloads/ts7500/glibc/ipk/ts75xx" > ${IMAGE_ROOTFS}/etc/opkg/ts75xx-feed.conf
+	  
+	  # Fix the non-existent sh link
+	  ln -s /bin/bash ${IMAGE_ROOTFS}/bin/sh
+}
+
+# ROOTFS_POSTPROCESS_COMMAND += "depmod -a ; opkg-cl configure ; "
+
+IMAGE_PREPROCESS_COMMAND += "fix_image ; "
+
+
+export IMAGE_BASENAME = "ts75xx-rootfs-image"
+IMAGE_LINGUAS = ""
+
+inherit image
-- 
1.7.3.4



