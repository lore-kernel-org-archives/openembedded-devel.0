Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <v2g.udel@gmail.com>) id 1Q4w62-0001sm-HI
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 16:10:07 +0200
Received: by vxd7 with SMTP id 7so1167131vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 07:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=uAN52vMVVEqViLMX+oDQkIhF9/vc/aDaWzrUacn/4kQ=;
	b=fusbHjGo0NHAr1ZpA3dI1+TNy2dYiUKYtADtn6HP7/vCtej1HMR26Ik7m5RFbeMf8R
	W4Q7Asj/qXqnWJZ8itfnLbWaN8xAazkI26bVkKI4cYKub7/m/qtLylu6bb6k2P6OSQFt
	mrn0Kz71M8+ncf0PlfFZZ6s6Rgz7pWk19XFAA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VNK/KQdXgg0TDmKi88NZ2RbvStgzSENtQUkDYxvwk/dD1LuYl1hN/gsI6i57+7cCFC
	48VgIYKpoES1bPfu8PSmhW7vdkWgfrm0CGScp6KZVqjRglbnxUnRRrMeCjs2MNizzjGC
	bAiuU58YuHU++XHgoygXp4xsZWK7PD1zX5QYk=
Received: by 10.52.0.229 with SMTP id 5mr1551323vdh.271.1301494084587;
	Wed, 30 Mar 2011 07:08:04 -0700 (PDT)
Received: from localhost.localdomain (fundoo.ceoe.udel.edu [128.175.74.10])
	by mx.google.com with ESMTPS id h34sm26893vcr.18.2011.03.30.07.08.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2011 07:08:04 -0700 (PDT)
From: UDel V2G Team <v2g.udel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 10:07:08 -0400
Message-Id: <1301494030-10554-4-git-send-email-v2g.udel@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
References: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
Subject: [PATCH 4/6] Add recipes for building TS75xx userspace utilities
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
X-List-Received-Date: Wed, 30 Mar 2011 14:10:08 -0000

Support for building the following userspace utilities is provided:
* canctl
* dioctl
* dmxctl
* jed2vme
* sdctl
* ts7500ctl
* spiflashctl
* xuartctl

The original source for these utilities is:

ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7550-linux/sources/

This commit includes a minimal set of patches for building these utilities
with EABI and the latest kernel

Signed-off-by: UDel V2G Team <v2g.udel@gmail.com>
---
 recipes/ts7500/canctl_0.0.1.bb               |   29 ++
 recipes/ts7500/dioctl_0.0.1.bb               |   53 +++
 recipes/ts7500/dmxctl_0.0.1.bb               |   23 +
 recipes/ts7500/files/group                   |   22 +
 recipes/ts7500/files/linuxrc-fastboot        |  156 +++++++
 recipes/ts7500/files/linuxrc-nandmount       |  148 ++++++
 recipes/ts7500/files/linuxrc-sdmount         |  136 ++++++
 recipes/ts7500/files/linuxrc-sdroot          |  179 ++++++++
 recipes/ts7500/files/linuxrc-sdroot-readonly |  188 ++++++++
 recipes/ts7500/files/linuxrc-usbroot         |  163 +++++++
 recipes/ts7500/files/passwd                  |    9 +
 recipes/ts7500/files/ts-utils.patch          |   68 +++
 recipes/ts7500/files/ts7500.subr             |  633 ++++++++++++++++++++++++++
 recipes/ts7500/spictl_0.0.1.bb               |   26 +
 recipes/ts7500/ts-initrd_0.0.1.bb            |   46 ++
 recipes/ts7500/ts-utils_0.0.1.bb             |   60 +++
 recipes/ts7500/ts7500_0.0.1.bb               |    7 +
 17 files changed, 1946 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ts7500/canctl_0.0.1.bb
 create mode 100644 recipes/ts7500/dioctl_0.0.1.bb
 create mode 100644 recipes/ts7500/dmxctl_0.0.1.bb
 create mode 100644 recipes/ts7500/files/group
 create mode 100644 recipes/ts7500/files/linuxrc-fastboot
 create mode 100644 recipes/ts7500/files/linuxrc-nandmount
 create mode 100644 recipes/ts7500/files/linuxrc-sdmount
 create mode 100644 recipes/ts7500/files/linuxrc-sdroot
 create mode 100644 recipes/ts7500/files/linuxrc-sdroot-readonly
 create mode 100644 recipes/ts7500/files/linuxrc-usbroot
 create mode 100644 recipes/ts7500/files/passwd
 create mode 100644 recipes/ts7500/files/ts-utils.patch
 create mode 100644 recipes/ts7500/files/ts7500.subr
 create mode 100644 recipes/ts7500/spictl_0.0.1.bb
 create mode 100644 recipes/ts7500/ts-initrd_0.0.1.bb
 create mode 100644 recipes/ts7500/ts-utils_0.0.1.bb
 create mode 100644 recipes/ts7500/ts7500_0.0.1.bb

diff --git a/recipes/ts7500/canctl_0.0.1.bb b/recipes/ts7500/canctl_0.0.1.bb
new file mode 100644
index 0000000..7bf8f15
--- /dev/null
+++ b/recipes/ts7500/canctl_0.0.1.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "TS 7500 canctl scripts"
+PR = "r0"
+DEPENDS = ""
+SRC_URI = " \
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/canctl.tar.gz \
+"
+
+SRC_URI[md5sum] = "322da336b9e49aeb532bf2aa9e6d8f56"
+SRC_URI[sha256sum] = "91e22495b912e971630e87fb82620c6b1f0ce1c983f31e2fd1171b1e9ef6ff37"
+
+S = "${WORKDIR}/canctl"
+
+do_compile () {
+	   ${CC}${CFLAGS} -g -DOMIT_BOARDID -c -o canctl.o canctl.c 
+	   ${CC}${CFLAGS} -g -DOMIT_BOARDID -c -o sock.o sock.c
+	   ${CC}${CFLAGS} -g -DOMIT_BOARDID -c -o peekpoke.o peekpoke.c
+	   ${CC}${CFLAGS} -g -DOMIT_BOARDID -c -o ts.o ts.c
+	   ${CC}${CFLAGS} -g -DOMIT_BOARDID -c -o cavium.o cavium.c
+	   ${CC}${CFLAGS} -g -DOMIT_BOARDID -c -o prosoft.o prosoft.c
+	   ${CC}${CFLAGS} -g -DOMIT_BOARDID -c -o opt.o opt.c
+	   ${CC}${CFLAGS} -g -DOMIT_BOARDID ${LDFLAGS} -o canctl canctl.o sock.o peekpoke.o ts.o cavium.o prosoft.o opt.o
+}
+
+do_install () {
+	   install -d ${D}${base_sbindir}/
+	   install -m 0755 ${S}/canctl ${D}${base_sbindir}/
+}
+
+FILES_${PN} = "${base_sbindir}/canctl"
diff --git a/recipes/ts7500/dioctl_0.0.1.bb b/recipes/ts7500/dioctl_0.0.1.bb
new file mode 100644
index 0000000..4fa032e
--- /dev/null
+++ b/recipes/ts7500/dioctl_0.0.1.bb
@@ -0,0 +1,53 @@
+DESCRIPTION = "TS 7500 dioctl Scripts"
+PR = "r0"
+DEPENDS = ""
+SRC_URI = " \
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/dioctl-latest.tar.gz \
+"
+
+SRC_URI[md5sum] = "4d93e6075913732dd4bcf2f71b2b967f"
+SRC_URI[sha256sum] = "f9e22cb5ae3cab49f702207bdcd67ef340ab18bb808777337453362494566d52"
+
+S = "${WORKDIR}/dioctl"
+
+do_compile () {
+	   # Compile the files
+	   ${CC}${CFLAGS} -g -Os -c -o dioctl.o dioctl.c
+	   ${CC}${CFLAGS} -g -Os -c -o diomain.o diomain.c
+	   ${CC}${CFLAGS} -g -Os -c -o dioserv.o dioserv.c
+	   ${CC}${CFLAGS} -g -Os -c -o lock.o lock.c
+	   ${CC}${CFLAGS} -g -Os -c -o ring.o ring.c
+	   ${CC}${CFLAGS} -g -Os -c -o server.o server.c
+	   ${CC}${CFLAGS} -g -Os -c -o sock.o sock.c
+	   ${CC}${CFLAGS} -g -Os -c -o watch.o watch.c
+	   ${CC}${CFLAGS} -g -Os -c -o waitq.o waitq.c
+	   ${CC}${CFLAGS} -g -Os -c -o file.o file.c
+	   ${CC}${CFLAGS} -g -Os -c -o opt.o opt.c	   
+	   ${CC}${CFLAGS} -g -Os -c -o peekpoke.o peekpoke.c
+	   ${CC}${CFLAGS} -g -Os -c -o ts.o ts.c
+	   ${CC}${CFLAGS} -g -Os -c -o ts75xx.o ts75xx.c
+	   ${CC}${CFLAGS} -g -Os -c -o ts4200.o ts4200.c
+	   ${CC}${CFLAGS} -g -Os -c -o ts4500.o ts4500.c
+	   ${CC}${CFLAGS} -g -Os -c -o ts4800.o ts4800.c
+	   ${CC}${CFLAGS} -g -Os -c -o dioname.o dioname.c
+	   ${CC}${CFLAGS} -g -Os -c -o cavium.o cavium.c	 
+	   
+	   # Now build the binaries
+	   ${CC}${CFLAGS} -g ${LDFLAGS} -o dioctl  dioctl.o diomain.o dioserv.o lock.o ring.o server.o sock.o watch.o waitq.o file.o opt.o peekpoke.o ts.o ts4500.o ts4200.o cavium.o dioname.o ts4800.o ts75xx.o
+	   ${AR} rcs libdioctl.a dioctl.o opt.o sock.o dioname.o
+	   ${CC}${CFLAGS} -shared ${LDFLAGS} -Wl,-soname,libdioctl.so.1 -o ${S}/libdioctl.so.1.0.1  dioctl.o opt.o sock.o dioname.o
+	   ${CC}${CFLAGS} ${LDFLAGS} diotest1.c -L${S} -ldioctl -o diotest1
+	   ${CC}${CFLAGS} ${LDFLAGS} diotest2.c -L${S} -ldioctl -lpthread -o diotest2
+	   ${CC}${CFLAGS} ${LDFLAGS} diotest3.c -L${S} -ldioctl -o diotest3
+}
+
+do_install () {
+	   install -d ${D}${base_sbindir}/
+	   install -m 0755 ${S}/dioctl ${D}${base_sbindir}/
+	   install -m 0755 ${S}/diotest1 ${D}${base_sbindir}/
+	   install -m 0755 ${S}/diotest2 ${D}${base_sbindir}/
+	   install -m 0755 ${S}/diotest3 ${D}${base_sbindir}/
+	   install -d ${D}${base_libdir}/
+	   install -m 0755 ${S}/libdioctl.a ${D}${base_libdir}/
+	   install -m 0755 ${S}/libdioctl.so.1.0.1 ${D}${base_libdir}/
+}
diff --git a/recipes/ts7500/dmxctl_0.0.1.bb b/recipes/ts7500/dmxctl_0.0.1.bb
new file mode 100644
index 0000000..8ee7c1f
--- /dev/null
+++ b/recipes/ts7500/dmxctl_0.0.1.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "TS 7500 dmxctl Utility Script"
+PR = "r0"
+DEPENDS = ""
+SRC_URI = " \
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/dmxctl.tar.gz \
+"
+SRC_URI[md5sum] = "76c0c5b8b232f9c9da377d593b46fb6d"
+SRC_URI[sha256sum] = "2c39b8e7777ffed48ecf65cce0d3d9067ab4c9f7a647a7d2156e961964ca63e6"
+
+S = "${WORKDIR}/dmx"
+
+do_compile () {
+	   ${CC}${CFLAGS} -g -c -o file.o file.c
+	   ${CC}${CFLAGS} -g -c -o sock.o sock.c
+	   ${CC}${CFLAGS} -g -c -o opt.o opt.c 
+	   ${CC}${CFLAGS} -g -c -o dmxctl.o dmxctl.c
+	   ${CC}${CFLAGS} -g ${LDFLAGS} -o dmxctl dmxctl.o sock.o file.o opt.o
+}
+
+do_install () {
+	   install -d ${D}${base_sbindir}/
+	   install -m 0755 ${S}/dmxctl ${D}${base_sbindir}/
+}
diff --git a/recipes/ts7500/files/group b/recipes/ts7500/files/group
new file mode 100644
index 0000000..863273e
--- /dev/null
+++ b/recipes/ts7500/files/group
@@ -0,0 +1,22 @@
+bin:x:1:daemon
+console:x:21:
+daemon:x:2:
+ftp:x:49:
+kmem:x:9:
+lock:x:54:
+man:x:62:
+nobody:x:65533:
+nogroup:x:65534:nobody
+ntp:!:103:
+public:x:32:
+root:x:0:
+shadow:x:15:
+sshd:!:65:
+sys:x:3:
+trusted:x:42:
+tty:x:5:
+utmp:x:22:
+uucp:x:14:
+wheel:x:10:
+www:x:8:
+users:x:100:
diff --git a/recipes/ts7500/files/linuxrc-fastboot b/recipes/ts7500/files/linuxrc-fastboot
new file mode 100644
index 0000000..259793f
--- /dev/null
+++ b/recipes/ts7500/files/linuxrc-fastboot
@@ -0,0 +1,156 @@
+#!/bin/sh
+
+export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/mnt/root/bin:/mnt/root/sbin:/mnt/root
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+mount -t devpts devpts /dev/pts
+  
+ifconfig lo 127.0.0.1 up
+route add -net 127.0.0.0 netmask 255.0.0.0 lo
+xuartctl --server
+
+# If the RESET switch is being pushed, 
+# set the CONSOLE to the DB9 port (/dev/pts/#)
+eval `ts7500ctl --getdio`
+let dio9="(dio >> 9) & 0x1"
+XCONSOLE=0
+
+if [ "$dio9" == "1" ]; then
+  export CONSOLE=/dev/ttyS0
+else
+  eval `xuartctl --server --port 0 </dev/null 2>&1`
+  if [ "$ttyname" == "" ]; then
+    export CONSOLE=/dev/ttyS0
+  else
+    export CONSOLE=$ttyname
+    XCONSOLE=1
+    # If the RESET switch is being pushed, wait until released
+    while [ "$dio9" == "0" ]; do
+    	eval `ts7500ctl --getdio`
+    	let dio9="(dio >> 9) & 0x1"
+    done
+  fi
+fi
+                
+let x=`devmem 0x79000040`
+sec=$((x / 100000))
+tenths=$((x % 100000 / 1000))
+export BOOTTIME=`printf "%d.%02d" $sec $tenths`
+
+setconsole $CONSOLE
+stty -F $CONSOLE ospeed 115200 sane > /dev/null 2>&1
+hostname ts7500                                   
+ts7500ctl --resetswitchon --setrng --getrtc --autofeed 2 -d
+ts7500ctl --loadfpga=ts7500_bitstream.vme.gz
+
+# Get the model # and boot device (NAND, mSD, SPI flash)
+eval `ts7500ctl --info`
+export bootdev model
+
+# If this is a 4500/8200, we need to set DIO-7 HIGH
+# (EN_USB_5V) for the USB's to work
+if [ "$model" = "0x4500" ]; then
+	eval `ts7500ctl --getdioreg`
+	let diodir="diodir | (1<<7)"
+	let dio_out="dio_out | (1<<7)"
+	ts7500ctl --setdio $dio_out --setdiodir $diodir
+fi
+
+# If there is a USB drive, mount it
+# If it has 'tsinit', execute it
+# (this allows software auto-update)                                
+devmem 0xc8000004 32 0x106
+devmem 0xcc000060 32 0x1
+let x=`devmem 0xcc000068`
+let y=`devmem 0xcc000064`
+x=$(((x | y) & 0x1))
+if [ "$x" -eq 1 ]; then
+  (
+        ts7500ctl --redledon
+	mount -t tmpfs tmpfs /lib/modules
+	tar -x -z -f /modules.tar.gz -C /
+	modprobe scsi_mod
+	modprobe sd_mod
+	modprobe usbcore
+	modprobe ehci_hcd
+	modprobe usb_storage
+	modprobe smsc95xx
+	modprobe ohci_hcd
+	umount /lib/modules
+	x=0
+	while [ "$x" -lt 150 -a ! -e /sys/block/sda ]; do
+		x=$((x+1))
+		sleep .1
+	done
+	mount -o ro /dev/sda1 /mnt/usbdev
+	if [ -x /mnt/usbdev/tsinit ]; then 
+		/mnt/usbdev/tsinit <$CONSOLE >$CONSOLE 2>&1
+	fi
+	umount /mnt/usbdev
+	ts7500ctl --redledoff
+  ) &
+fi
+
+(
+  mount -t tmpfs none /dev/shm
+  ifconfig eth0 192.168.0.50
+  telnetd
+  mount -t tmpfs tmpfs /tmp
+
+  # If booted from NAND, mount NAND's Linux partition
+  # If booted from mSD, mount mSD's Linux partition
+    
+  # Model: 7550, 7551, etc. (NOT 7500) -- these boards have NAND
+  if [ "$model" != "0x7500" ]; then
+    nandctl -X -z 131072 --nbdserver lun0:disc,lun0:part1,lun0:part2,lun0:part3,lun0:part4
+    nbd-client 127.0.0.1 7525 /dev/nbd0
+    nbd-client 127.0.0.1 7526 /dev/nbd1
+    nbd-client 127.0.0.1 7527 /dev/nbd2
+    nbd-client 127.0.0.1 7528 /dev/nbd3
+    nbd-client 127.0.0.1 7529 /dev/nbd4
+    if [ "$bootdev" == "0x0" ]; then
+      mount -oro /dev/nbd3 /mnt/root
+    fi
+  fi
+ 
+  # Model: 7500 or 7551, 7552, etc.  (NOT 7550) -- these boards have mSD
+  if [ "$model" != "0x7550" ]; then
+    eval `sdctl -z 65536 --nbdserver lun0:disc,lun0:part1,lun0:part2,lun0:part3,lun0:part4 2>&1`
+    if [ "$cardsize_sectors" == "0" ]; then
+      killall sdctl >> $CONSOLE 2>&1
+    else
+      nbd-client 127.0.0.1 7500 /dev/nbd5
+      nbd-client 127.0.0.1 7501 /dev/nbd6
+      nbd-client 127.0.0.1 7502 /dev/nbd7
+      nbd-client 127.0.0.1 7503 /dev/nbd8
+      nbd-client 127.0.0.1 7504 /dev/nbd9
+      if [ "$bootdev" == "0x1" ]; then
+        mount -oro /dev/nbd9 /mnt/root
+      fi
+    fi
+  fi
+
+  # Software auto-update  
+  if [ -x /mnt/root/tsinit ]; then
+    /mnt/root/tsinit $XCONSOLE < $CONSOLE > $CONSOLE 2>&1
+  fi
+  
+) </dev/null >/dev/null 2>&1 &
+
+(
+  export ENV=/shinit
+  exec setsid cttyhack /bin/sh -i
+) <$CONSOLE >$CONSOLE 2>&1
+wait
+
+if [ -e /mnt/root/linuxrc ]; then
+  killall busybox telnetd >/dev/null 2>&1
+
+  cd /mnt/root
+  #pivot_root . ./initrd
+  #./bin/mount -n --move ./initrd/sys ./sys
+  #./bin/mount -n --move ./initrd/proc ./proc
+  /bin/mount -t proc none /mnt/root/proc
+  /bin/mount -t sysfs none /mnt/root/sysfs 
+  exec /usr/sbin/chroot /mnt/root /linuxrc < .$CONSOLE > .$CONSOLE 2>&1
+fi
diff --git a/recipes/ts7500/files/linuxrc-nandmount b/recipes/ts7500/files/linuxrc-nandmount
new file mode 100644
index 0000000..d6f8ef4
--- /dev/null
+++ b/recipes/ts7500/files/linuxrc-nandmount
@@ -0,0 +1,148 @@
+#!/bin/sh
+
+export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/mnt/root/bin:/mnt/root/sbin:/mnt/root
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+mount -t devpts devpts /dev/pts
+  
+ifconfig lo 127.0.0.1 up
+route add -net 127.0.0.0 netmask 255.0.0.0 lo
+xuartctl --server
+
+# If the RESET switch is being pushed, 
+# set the CONSOLE to the DB9 port (/dev/pts/#)
+eval `ts7500ctl --getdio`
+let dio9="(dio >> 9) & 0x1"
+XCONSOLE=0
+
+if [ "$dio9" == "1" ]; then
+  export CONSOLE=/dev/ttyS0
+else
+  eval `xuartctl --server --port 0 </dev/null 2>&1`
+  if [ "$ttyname" == "" ]; then
+    export CONSOLE=/dev/ttyS0
+  else
+    export CONSOLE=$ttyname
+    XCONSOLE=1
+    # If the RESET switch is being pushed, wait until released
+    while [ "$dio9" == "0" ]; do
+    	eval `ts7500ctl --getdio`
+    	let dio9="(dio >> 9) & 0x1"
+    done
+  fi
+fi
+                
+let x=`devmem 0x79000040`
+sec=$((x / 100000))
+tenths=$((x % 100000 / 1000))
+export BOOTTIME=`printf "%d.%02d" $sec $tenths`
+
+setconsole $CONSOLE
+stty -F $CONSOLE ospeed 115200 sane > /dev/null 2>&1
+hostname ts7500                                   
+ts7500ctl --resetswitchon --setrng --getrtc --autofeed 2 -d
+ts7500ctl --loadfpga=ts7500_bitstream.vme.gz
+
+# Get the model # and boot device (NAND, mSD, SPI flash)
+eval `ts7500ctl --info`
+export bootdev model
+
+# If this is a 4500/8200, we need to set DIO-7 HIGH
+# (EN_USB_5V) for the USB's to work
+if [ "$model" = "0x4500" ]; then
+	eval `ts7500ctl --getdioreg`
+	let diodir="diodir | (1<<7)"
+	let dio_out="dio_out | (1<<7)"
+	ts7500ctl --setdio $dio_out --setdiodir $diodir
+fi
+
+# If there is a USB drive, mount it
+# If it has 'tsinit', execute it
+# (this allows software auto-update)                                
+devmem 0xc8000004 32 0x106
+devmem 0xcc000060 32 0x1
+let x=`devmem 0xcc000068`
+let y=`devmem 0xcc000064`
+x=$(((x | y) & 0x1))
+if [ "$x" -eq 1 ]; then
+  (
+        ts7500ctl --redledon
+	mount -t tmpfs tmpfs /lib/modules
+	tar -x -z -f /modules.tar.gz -C /
+	modprobe scsi_mod
+	modprobe sd_mod
+	modprobe usbcore
+	modprobe ehci_hcd
+	modprobe usb_storage
+	modprobe smsc95xx
+	modprobe ohci_hcd
+	umount /lib/modules
+	x=0
+	while [ "$x" -lt 150 -a ! -e /sys/block/sda ]; do
+		x=$((x+1))
+		sleep .1
+	done
+	mount -o ro /dev/sda1 /mnt/usbdev
+	if [ -x /mnt/usbdev/tsinit ]; then 
+		/mnt/usbdev/tsinit <$CONSOLE >$CONSOLE 2>&1
+	fi
+	umount /mnt/usbdev
+	ts7500ctl --redledoff
+  ) &
+fi
+
+(
+  mount -t tmpfs none /dev/shm
+  ifconfig eth0 192.168.0.9
+  telnetd
+  mount -t tmpfs tmpfs /tmp
+
+  # If 7500, mount mSD; else mount NAND
+  if [ "$model" = "0x7500" ]; then
+    	eval `sdctl -z 65536 --nbdserver lun0:disc,lun0:part1,lun0:part2,lun0:part3,lun0:part4 2>&1`
+    	if [ "$cardsize_sectors" == "0" ]; then
+      		killall sdctl >> $CONSOLE 2>&1
+    	else
+      		nbd-client 127.0.0.1 7500 /dev/nbd5
+      		nbd-client 127.0.0.1 7501 /dev/nbd6
+      		nbd-client 127.0.0.1 7502 /dev/nbd7
+      		nbd-client 127.0.0.1 7503 /dev/nbd8
+      		nbd-client 127.0.0.1 7504 /dev/nbd9
+      		if [ "$bootdev" == "0x1" ]; then
+        		mount -oro /dev/nbd9 /mnt/root
+      		fi
+      	fi
+  else
+    	nandctl -X -z 131072 --nbdserver lun0:disc,lun0:part1,lun0:part2,lun0:part3,lun0:part4
+    	nbd-client 127.0.0.1 7525 /dev/nbd0
+    	nbd-client 127.0.0.1 7526 /dev/nbd1
+    	nbd-client 127.0.0.1 7527 /dev/nbd2
+    	nbd-client 127.0.0.1 7528 /dev/nbd3
+    	nbd-client 127.0.0.1 7529 /dev/nbd4
+      	mount -oro /dev/nbd3 /mnt/root
+  fi
+ 
+
+  # Software auto-update  
+  if [ -x /mnt/root/tsinit ]; then
+    /mnt/root/tsinit $XCONSOLE < $CONSOLE > $CONSOLE 2>&1
+  fi
+  
+) </dev/null >/dev/null 2>&1 &
+
+(
+  export ENV=/shinit
+  exec setsid cttyhack /bin/sh -i
+) <$CONSOLE >$CONSOLE 2>&1
+wait
+
+if [ -e /mnt/root/sbin/init ]; then
+  killall busybox telnetd >/dev/null 2>&1
+
+  cd /mnt/root
+  pivot_root . ./initrd
+  ./bin/mount -n --move ./initrd/sys ./sys
+  ./bin/mount -n --move ./initrd/proc ./proc
+  exec ./usr/sbin/chroot . ./sbin/init < .$CONSOLE > .$CONSOLE 2>&1
+fi
+
diff --git a/recipes/ts7500/files/linuxrc-sdmount b/recipes/ts7500/files/linuxrc-sdmount
new file mode 100644
index 0000000..f642320
--- /dev/null
+++ b/recipes/ts7500/files/linuxrc-sdmount
@@ -0,0 +1,136 @@
+#!/bin/sh
+
+export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/mnt/root/bin:/mnt/root/sbin:/mnt/root
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+mount -t devpts devpts /dev/pts
+  
+ifconfig lo 127.0.0.1 up
+route add -net 127.0.0.0 netmask 255.0.0.0 lo
+xuartctl --server
+
+# If the RESET switch is being pushed, 
+# set the CONSOLE to the DB9 port (/dev/pts/#)
+eval `ts7500ctl --getdio`
+let dio9="(dio >> 9) & 0x1"
+XCONSOLE=0
+
+if [ "$dio9" == "1" ]; then
+  export CONSOLE=/dev/ttyS0
+else
+  eval `xuartctl --server --port 0 </dev/null 2>&1`
+  if [ "$ttyname" == "" ]; then
+    export CONSOLE=/dev/ttyS0
+  else
+    export CONSOLE=$ttyname
+    XCONSOLE=1
+    # If the RESET switch is being pushed, wait until released
+    while [ "$dio9" == "0" ]; do
+    	eval `ts7500ctl --getdio`
+    	let dio9="(dio >> 9) & 0x1"
+    done
+  fi
+fi
+                
+let x=`devmem 0x79000040`
+sec=$((x / 100000))
+tenths=$((x % 100000 / 1000))
+export BOOTTIME=`printf "%d.%02d" $sec $tenths`
+
+setconsole $CONSOLE
+stty -F $CONSOLE ospeed 115200 sane > /dev/null 2>&1
+hostname ts7500                                   
+ts7500ctl --resetswitchon --setrng --getrtc --autofeed 2 -d
+ts7500ctl --loadfpga=ts7500_bitstream.vme.gz
+
+# Get the model # and boot device (NAND, mSD, SPI flash)
+eval `ts7500ctl --info`
+export bootdev model
+
+# If this is a 4500/8200, we need to set DIO-7 HIGH
+# (EN_USB_5V) for the USB's to work
+if [ "$model" = "0x4500" ]; then
+	eval `ts7500ctl --getdioreg`
+	let diodir="diodir | (1<<7)"
+	let dio_out="dio_out | (1<<7)"
+	ts7500ctl --setdio $dio_out --setdiodir $diodir
+fi
+
+# If there is a USB drive, mount it
+# If it has 'tsinit', execute it
+# (this allows software auto-update)                                
+devmem 0xc8000004 32 0x106
+devmem 0xcc000060 32 0x1
+let x=`devmem 0xcc000068`
+let y=`devmem 0xcc000064`
+x=$(((x | y) & 0x1))
+if [ "$x" -eq 1 ]; then
+  (
+        ts7500ctl --redledon
+	mount -t tmpfs tmpfs /lib/modules
+	tar -x -z -f /modules.tar.gz -C /
+	modprobe scsi_mod
+	modprobe sd_mod
+	modprobe usbcore
+	modprobe ehci_hcd
+	modprobe usb_storage
+	modprobe smsc95xx
+	modprobe ohci_hcd
+	umount /lib/modules
+	x=0
+	while [ "$x" -lt 150 -a ! -e /sys/block/sda ]; do
+		x=$((x+1))
+		sleep .1
+	done
+	mount -o ro /dev/sda1 /mnt/usbdev
+	if [ -x /mnt/usbdev/tsinit ]; then 
+		/mnt/usbdev/tsinit <$CONSOLE >$CONSOLE 2>&1
+	fi
+	umount /mnt/usbdev
+	ts7500ctl --redledoff
+  ) &
+fi
+
+(
+  mount -t tmpfs none /dev/shm
+  ifconfig eth0 192.168.0.9
+  telnetd
+  mount -t tmpfs tmpfs /tmp
+
+  # Always mount mSD, if present
+  eval `sdctl -z 65536 --nbdserver lun0:disc,lun0:part1,lun0:part2,lun0:part3,lun0:part4 2>&1`
+  if [ "$cardsize_sectors" == "0" ]; then
+	killall sdctl >> $CONSOLE 2>&1
+  else
+ 	nbd-client 127.0.0.1 7500 /dev/nbd5
+ 	nbd-client 127.0.0.1 7501 /dev/nbd6
+ 	nbd-client 127.0.0.1 7502 /dev/nbd7
+ 	nbd-client 127.0.0.1 7503 /dev/nbd8
+ 	nbd-client 127.0.0.1 7504 /dev/nbd9
+      	mount -oro /dev/nbd9 /mnt/root
+  fi
+ 
+
+  # Software auto-update  
+  if [ -x /mnt/root/tsinit ]; then
+    /mnt/root/tsinit $XCONSOLE < $CONSOLE > $CONSOLE 2>&1
+  fi
+  
+) </dev/null >/dev/null 2>&1 &
+
+(
+  export ENV=/shinit
+  exec setsid cttyhack /bin/sh -i
+) <$CONSOLE >$CONSOLE 2>&1
+wait
+
+if [ -e /mnt/root/sbin/init ]; then
+  killall busybox telnetd >/dev/null 2>&1
+
+  cd /mnt/root
+  pivot_root . ./initrd
+  ./bin/mount -n --move ./initrd/sys ./sys
+  ./bin/mount -n --move ./initrd/proc ./proc
+  exec ./usr/sbin/chroot . ./sbin/init < .$CONSOLE > .$CONSOLE 2>&1
+fi
+
diff --git a/recipes/ts7500/files/linuxrc-sdroot b/recipes/ts7500/files/linuxrc-sdroot
new file mode 100644
index 0000000..be0e715
--- /dev/null
+++ b/recipes/ts7500/files/linuxrc-sdroot
@@ -0,0 +1,179 @@
+#!/bin/sh
+
+export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/mnt/root/bin:/mnt/root/sbin:/mnt/root
+export INIT=sbin/init.sysvinit
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+  
+ifconfig lo 127.0.0.1 up
+route add -net 127.0.0.0 netmask 255.0.0.0 lo
+xuartctl --server
+
+# If the RESET switch is being pushed,
+# set the CONSOLE to the DB9 port (/dev/pts/#)
+eval `ts7500ctl --getdio`
+let dio9="(dio >> 9) & 0x1"
+XCONSOLE=0
+
+if [ "$dio9" == "1" ]; then
+  export CONSOLE=/dev/ttyS0
+else
+  eval `xuartctl --server --port 0 </dev/null 2>&1`
+  if [ "$ttyname" == "" ]; then
+    export CONSOLE=/dev/ttyS0
+  else
+    export CONSOLE=$ttyname
+    XCONSOLE=1
+    # If the RESET switch is being pushed, wait until released
+    while [ "$dio9" == "0" ]; do
+	    eval `ts7500ctl --getdio`
+	    let dio9="(dio >> 9) & 0x1"
+    done
+  fi
+fi
+                
+setconsole $CONSOLE
+stty -F $CONSOLE ospeed 115200 sane > /dev/null 2>&1
+stty -F /dev/ttyS1 ospeed 115200 sane > /dev/null 2>&1          
+hostname ts7500    
+echo "Loading initrd..." > $CONSOLE
+ts7500ctl --resetswitchon --setrng --getrtc --autofeed 2 -d > $CONSOLE
+ts7500ctl --loadfpga=/ts7500/ts7500_bitstream.vme.gz > $CONSOLE
+
+# Get the model # and boot device (NAND, mSD, SPI flash)
+eval `ts7500ctl --info`
+export bootdev model
+
+# If this is a 4500/8200, we need to set DIO-7 HIGH                             
+# (EN_USB_5V) for the USB's to work
+if [ "$model" = "0x4500" ]; then                                                
+	eval `ts7500ctl --getdioreg`
+	let diodir="diodir | (1<<7)"
+	let dio_out="dio_out | (1<<7)"
+	ts7500ctl --setdio $dio_out --setdiodir $diodir
+fi
+                                
+# If there is a USB drive, mount it
+# If it has 'tsinit', execute it
+# (this allows software auto-update)
+echo "Checking for a USB drive..." > $CONSOLE
+devmem 0xc8000004 32 0x106
+devmem 0xcc000060 32 0x1
+let x=`devmem 0xcc000068`
+let y=`devmem 0xcc000064`
+x=$(((x | y) & 0x1))
+if [ "$x" -eq 1 ]; then
+  (
+      echo "USB Drive found! Loading modules..." > $CONSOLE                               
+        ts7500ctl --redledon
+	mount -t tmpfs tmpfs /lib/modules
+	tar -x -z -f /modules.tar.gz -C /
+	modprobe scsi_mod
+	modprobe sd_mod
+	modprobe usbcore
+	modprobe ehci_hcd
+	modprobe usb_storage
+        modprobe smsc95xx                                  
+        modprobe ohci_hcd
+	umount /lib/modules
+	x=0
+	while [ "$x" -lt 150 -a ! -e /sys/block/sda ]; do
+		x=$((x+1))
+		sleep .1
+	done
+	mount -o ro /dev/sda1 /mnt/usbdev
+	if [ -x /mnt/usbdev/tsinit ]; then 
+	    echo "Loading auto init script from USB drive!" > $CONSOLE
+		/mnt/usbdev/tsinit <$CONSOLE >$CONSOLE 2>&1
+	fi
+	umount /mnt/usbdev
+	ts7500ctl --redledoff
+  ) &
+fi
+
+(
+  # If booted from NAND, mount NAND's Linux partition
+  # If booted from mSD, mount mSD's Linux partition
+    
+  # Model: 7550, 7551, etc. (NOT 7500) -- these boards have NAND
+  if [ "$model" != "0x7500" ]; then
+    nandctl -X -z 131072 --nbdserver lun0:disc,lun0:part1,lun0:part2,lun0:part3,lun0:part4
+    nbd-client 127.0.0.1 7525 /dev/nbd0
+    nbd-client 127.0.0.1 7526 /dev/nbd1
+    nbd-client 127.0.0.1 7527 /dev/nbd2
+    nbd-client 127.0.0.1 7528 /dev/nbd3
+    nbd-client 127.0.0.1 7529 /dev/nbd4
+    if [ "$bootdev" == "0x0" ]; then
+      mount -oro /dev/nbd3 /mnt/root
+    fi
+  fi
+  
+  # Model: 7500 or 7551, 7552, etc.  (NOT 7550) -- these boards have mSD
+  if [ "$model" != "0x7550" ]; then
+    echo "Mounting sdcard..." > $CONSOLE                               
+    eval `sdctl -z 65536 --nbdserver lun0:disc,lun0:part1,lun0:part2,lun0:part3,lun0:part4 > $CONSOLE 2>&1`
+    if [ "$cardsize_sectors" == "0" ]; then
+      killall sdctl >> $CONSOLE 2>&1
+    else
+      nbd-client 127.0.0.1 7500 /dev/nbd5
+      nbd-client 127.0.0.1 7501 /dev/nbd6
+      nbd-client 127.0.0.1 7502 /dev/nbd7
+      nbd-client 127.0.0.1 7503 /dev/nbd8
+      nbd-client 127.0.0.1 7504 /dev/nbd9
+      if [ "$bootdev" == "0x1" ]; then	  
+          mount -oro /dev/nbd8 /mnt/root
+	  mount -oro /dev/nbd9 /mnt/root/var
+      fi
+    fi
+  fi
+  echo "   > Done loading SD Card!" > $CONSOLE
+  # Software auto-update
+  if [ -x /mnt/root/tsinit ]; then
+    /mnt/root/tsinit $XCONSOLE < $CONSOLE > $CONSOLE 2>&1
+  fi
+  
+) </dev/null >/dev/null 2>&1 
+
+if [ -e /mnt/root/notrootfs -o -e /mnt/root/fastboot -o ! -e /mnt/root/$INIT  ]; then
+  if [ -e /mnt/root/fastboot ]; then
+    echo ">> File 'fastboot' found. Booting to initrd instead..." > $CONSOLE
+  else
+    echo ">> SD Card failed. Booting to initrd..." > $CONSOLE
+  fi
+
+  (                                                                             
+    mount -t devpts devpts /dev/pts
+    mount -t tmpfs none /dev/shm
+    ifconfig eth0 192.168.0.50
+    telnetd
+    mount -t tmpfs tmpfs /tmp
+  ) </dev/null >/dev/null 2>&1
+
+  (
+    let x=`devmem 0x79000040`
+    sec=$((x / 100000))
+    tenths=$((x % 100000 / 1000))
+    export BOOTTIME=`printf "%d.%02d" $sec $tenths`
+    export ENV=/shinit
+    exec setsid cttyhack /bin/sh -i
+  ) <$CONSOLE >$CONSOLE 2>&1
+  wait
+fi
+
+if [ -e /mnt/root/$INIT  ]; then
+  killall busybox telnetd >/dev/null 2>&1
+  #cd /mnt/root
+  #pivot_root . ./initrd
+  #./bin/mount -n --move ./initrd/sys ./sys
+  #./bin/mount -n --move ./initrd/proc ./proc
+  echo "Mounting filesystems read/write..." > $CONSOLE
+  /bin/mount -o remount,rw /mnt/root                                            
+  /bin/mount -o remount,rw /mnt/root/var  
+  echo "Done!" > $CONSOLE
+  /bin/mount -t proc none /mnt/root/proc
+  /bin/mount -t sysfs none /mnt/root/sys 
+  /bin/mount -o bind /dev /mnt/root/dev
+  /bin/mkdir /mnt/root/dev/pts
+  /bin/mount -o bind /dev/pts /mnt/root/dev/pts
+  exec /usr/sbin/chroot /mnt/root /$INIT < .$CONSOLE > .$CONSOLE 2>&1
+fi
diff --git a/recipes/ts7500/files/linuxrc-sdroot-readonly b/recipes/ts7500/files/linuxrc-sdroot-readonly
new file mode 100644
index 0000000..baa9f38
--- /dev/null
+++ b/recipes/ts7500/files/linuxrc-sdroot-readonly
@@ -0,0 +1,188 @@
+#!/bin/sh
+
+export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/mnt/root/bin:/mnt/root/sbin:/mnt/root
+export INIT=sbin/init.sysvinit
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+  
+ifconfig lo 127.0.0.1 up
+route add -net 127.0.0.0 netmask 255.0.0.0 lo
+xuartctl --server
+
+# If the RESET switch is being pushed,
+# set the CONSOLE to the DB9 port (/dev/pts/#)
+eval `ts7500ctl --getdio`
+let dio9="(dio >> 9) & 0x1"
+XCONSOLE=0
+
+if [ "$dio9" == "1" ]; then
+  export CONSOLE=/dev/ttyS0
+else
+  eval `xuartctl --server --port 0 </dev/null 2>&1`
+  if [ "$ttyname" == "" ]; then
+    export CONSOLE=/dev/ttyS0
+  else
+    export CONSOLE=$ttyname
+    XCONSOLE=1
+    # If the RESET switch is being pushed, wait until released
+    while [ "$dio9" == "0" ]; do
+	    eval `ts7500ctl --getdio`
+	    let dio9="(dio >> 9) & 0x1"
+    done
+  fi
+fi
+                
+setconsole $CONSOLE
+stty -F $CONSOLE ospeed 115200 sane > /dev/null 2>&1
+stty -F /dev/ttyS1 ospeed 115200 sane > /dev/null 2>&1          
+hostname ts7500    
+echo "Loading initrd..." > $CONSOLE
+ts7500ctl --resetswitchon --setrng --getrtc --autofeed 2 -d > $CONSOLE
+ts7500ctl --loadfpga=/ts7500/ts7500_bitstream.vme.gz > $CONSOLE
+
+# Get the model # and boot device (NAND, mSD, SPI flash)
+eval `ts7500ctl --info`
+export bootdev model
+
+# If this is a 4500/8200, we need to set DIO-7 HIGH                             
+# (EN_USB_5V) for the USB's to work
+if [ "$model" = "0x4500" ]; then                                                
+	eval `ts7500ctl --getdioreg`
+	let diodir="diodir | (1<<7)"
+	let dio_out="dio_out | (1<<7)"
+	ts7500ctl --setdio $dio_out --setdiodir $diodir
+fi
+                                
+# If there is a USB drive, mount it
+# If it has 'tsinit', execute it
+# (this allows software auto-update)
+echo "Checking for a USB drive..." > $CONSOLE
+devmem 0xc8000004 32 0x106
+devmem 0xcc000060 32 0x1
+let x=`devmem 0xcc000068`
+let y=`devmem 0xcc000064`
+x=$(((x | y) & 0x1))
+if [ "$x" -eq 1 ]; then
+  (
+      echo "USB Drive found! Loading modules..." > $CONSOLE                               
+        ts7500ctl --redledon
+	mount -t tmpfs tmpfs /lib/modules
+	tar -x -z -f /modules.tar.gz -C /
+	modprobe scsi_mod
+	modprobe sd_mod
+	modprobe usbcore
+	modprobe ehci_hcd
+	modprobe usb_storage
+        modprobe smsc95xx                                  
+        modprobe ohci_hcd
+	umount /lib/modules
+	x=0
+	while [ "$x" -lt 150 -a ! -e /sys/block/sda ]; do
+		x=$((x+1))
+		sleep .1
+	done
+	mount -o ro /dev/sda1 /mnt/usbdev
+	if [ -x /mnt/usbdev/tsinit ]; then 
+	    echo "Loading auto init script from USB drive!" > $CONSOLE
+		/mnt/usbdev/tsinit <$CONSOLE >$CONSOLE 2>&1
+	fi
+	umount /mnt/usbdev
+	ts7500ctl --redledoff
+  ) &
+fi
+
+(
+  # If booted from NAND, mount NAND's Linux partition
+  # If booted from mSD, mount mSD's Linux partition
+    
+  # Model: 7550, 7551, etc. (NOT 7500) -- these boards have NAND
+  if [ "$model" != "0x7500" ]; then
+    nandctl -X -z 131072 --nbdserver lun0:disc,lun0:part1,lun0:part2,lun0:part3,lun0:part4
+    nbd-client 127.0.0.1 7525 /dev/nbd0
+    nbd-client 127.0.0.1 7526 /dev/nbd1
+    nbd-client 127.0.0.1 7527 /dev/nbd2
+    nbd-client 127.0.0.1 7528 /dev/nbd3
+    nbd-client 127.0.0.1 7529 /dev/nbd4
+    if [ "$bootdev" == "0x0" ]; then
+      mount -oro /dev/nbd3 /mnt/root
+    fi
+  fi
+  
+  # Model: 7500 or 7551, 7552, etc.  (NOT 7550) -- these boards have mSD
+  if [ "$model" != "0x7550" ]; then
+    echo "Mounting sdcard..." > $CONSOLE                               
+    eval `sdctl -z 65536 --nbdserver lun0:disc,lun0:part1,lun0:part2,lun0:part3,lun0:part4 > /dev/null 2>&1`
+    if [ "$cardsize_sectors" == "0" ]; then
+      killall sdctl >> $CONSOLE 2>&1
+    else
+      nbd-client 127.0.0.1 7500 /dev/nbd5
+      nbd-client 127.0.0.1 7501 /dev/nbd6
+      nbd-client 127.0.0.1 7502 /dev/nbd7
+      nbd-client 127.0.0.1 7503 /dev/nbd8
+      nbd-client 127.0.0.1 7504 /dev/nbd9
+      if [ "$bootdev" == "0x1" ]; then	 
+	  mkdir /mnt/root.ro /mnt/root.var
+          mount -oro /dev/nbd8 /mnt/root.ro
+	  mount -oro /dev/nbd9 /mnt/root.var
+      fi
+    fi
+  fi
+  
+  # Software auto-update
+  if [ -x /mnt/root.ro/tsinit ]; then
+    /mnt/root.ro/tsinit $XCONSOLE < $CONSOLE > $CONSOLE 2>&1
+  fi
+  
+) </dev/null >/dev/null 2>&1 
+
+if [ -e /mnt/root.ro/notrootfs -o -e /mnt/root.ro/fastboot -o ! -e /mnt/root.ro/$INIT ]; then
+  if [ -e /mnt/root.ro/fastboot ]; then
+    echo ">> File 'fastboot' found. Booting to initrd instead..." > $CONSOLE
+  else
+    echo ">> SD Card failed. Booting to initrd..." > $CONSOLE
+  fi
+
+  (                                                                             
+    mount -t devpts devpts /dev/pts
+    mount -t tmpfs none /dev/shm
+    ifconfig eth0 192.168.0.50
+    telnetd
+    mount -t tmpfs tmpfs /tmp
+  ) </dev/null >/dev/null 2>&1
+
+  (
+    let x=`devmem 0x79000040`
+    sec=$((x / 100000))
+    tenths=$((x % 100000 / 1000))
+    export BOOTTIME=`printf "%d.%02d" $sec $tenths`
+    export ENV=/shinit
+    exec setsid cttyhack /bin/sh -i
+  ) <$CONSOLE >$CONSOLE 2>&1
+  wait
+fi
+
+if [ -e /mnt/root.ro/$INIT ]; then
+  killall busybox telnetd >/dev/null 2>&1
+  #cd /mnt/root
+  #pivot_root . ./initrd
+  #./bin/mount -n --move ./initrd/sys ./sys
+  #./bin/mount -n --move ./initrd/proc ./proc
+  echo "Mounting unionfs..." > $CONSOLE
+  /bin/mkdir /mnt/root.ro /mnt/root.rw /mnt/root.var
+  /bin/mount -o remount,rw /mnt/root.var 
+  /bin/mount -t tmpfs root.rw /mnt/root.rw
+  /bin/mount -t unionfs -o dirs=/mnt/root.rw=rw:/mnt/root.var=rw:/mnt/root.ro=ro unionfs /mnt/root/
+  /bin/chmod 755 /mnt/root
+  /bin/mkdir /mnt/root/ro /mnt/root/rw /mnt/root/vardir
+  /bin/mount --move /mnt/root.ro /mnt/root/ro
+  /bin/mount --move /mnt/root.rw /mnt/root/rw
+  /bin/mount --move /mnt/root.var /mnt/root/vardir
+  echo "Done mounting unionfs!" > $CONSOLE
+
+  /bin/mount -t proc none /mnt/root/proc
+  /bin/mount -t sysfs none /mnt/root/sys 
+  /bin/mount -o bind /dev /mnt/root/dev
+  /bin/mkdir /mnt/root/dev/pts
+  /bin/mount -o bind /dev/pts /mnt/root/dev/pts
+  exec /usr/sbin/chroot /mnt/root /$INIT < .$CONSOLE > .$CONSOLE 2>&1
+fi
diff --git a/recipes/ts7500/files/linuxrc-usbroot b/recipes/ts7500/files/linuxrc-usbroot
new file mode 100644
index 0000000..c210884
--- /dev/null
+++ b/recipes/ts7500/files/linuxrc-usbroot
@@ -0,0 +1,163 @@
+#!/bin/sh
+
+export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/mnt/root/bin:/mnt/root/sbin:/mnt/root
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+  
+ifconfig lo 127.0.0.1 up
+route add -net 127.0.0.0 netmask 255.0.0.0 lo
+xuartctl --server
+
+eval `ts7500ctl --getdio`
+let dio9="(dio >> 9) & 0x1"
+XCONSOLE=0
+
+# If the RESET switch is being pushed,
+# set the CONSOLE to the DB9 port (/dev/pts/#)
+if [ "$dio9" == "1" ]; then
+  export CONSOLE=/dev/ttyS0
+else
+  eval `xuartctl --server --port 0 </dev/null 2>&1`
+  if [ "$ttyname" == "" ]; then
+    export CONSOLE=/dev/ttyS0
+  else
+    export CONSOLE=$ttyname
+    XCONSOLE=1
+    # If the RESET switch is being pushed, wait until released
+    while [ "$dio9" == "0" ]; do
+	  eval `ts7500ctl --getdio`
+	  let dio9="(dio >> 9) & 0x1"
+    done
+  fi
+fi
+                
+setconsole $CONSOLE
+stty -F $CONSOLE ospeed 115200 sane > /dev/null 2>&1
+hostname ts7500                                   
+ts7500ctl --resetswitchon --setrng --getrtc --autofeed 2 -d
+ts7500ctl --loadfpga=ts7500_bitstream.vme.gz
+
+# Get the model # and boot device (NAND, mSD, SPI flash)
+eval `ts7500ctl --info`
+export bootdev model
+
+# If this is a 4500/8200, we need to set DIO-7 HIGH
+# (EN_USB_5V) for the USB's to work
+if [ "$model" = "0x4500" ]; then
+	eval `ts7500ctl --getdioreg`
+	let diodir="diodir | (1<<7)"
+	let dio_out="dio_out | (1<<7)"
+	ts500ctl --setdio $dio_out --setdiodir $diodir
+fi
+ 
+# If there is a USB drive, mount it
+# If it has 'tsinit', execute it
+# (this allows software auto-update)                                
+devmem 0xc8000004 32 0x106
+devmem 0xcc000060 32 0x1
+let x=`devmem 0xcc000068`
+let y=`devmem 0xcc000064`
+x=$(((x | y) & 0x1))
+if [ "$x" -eq 1 ]; then
+  (
+  	echo "Booting from USB device ... " > $CONSOLE
+        ts7500ctl --redledon
+	mount -t tmpfs tmpfs /lib/modules
+	tar -x -z -f /modules.tar.gz -C /
+	modprobe scsi_mod
+	modprobe sd_mod
+	modprobe usbcore
+	modprobe ehci_hcd
+	modprobe usb_storage
+        modprobe smsc95xx                                  
+        modprobe ohci_hcd
+	umount /lib/modules
+	x=0
+	while [ "$x" -lt 150 -a ! -e /sys/block/sda ]; do
+		x=$((x+1))
+		sleep .1
+	done
+	mount -o ro /dev/sda4 /mnt/root
+
+	ts7500ctl --redledoff
+  ) 
+fi
+
+(
+  # If booted from NAND, mount NAND's Linux partition
+  # If booted from mSD, mount mSD's Linux partition
+    
+  # Model: 7550, 7551, etc. (NOT 7500) -- these boards have NAND
+  if [ "$model" != "0x7500" ]; then
+    nandctl -X -z 131072 --nbdserver lun0:disc,lun0:part1,lun0:part2,lun0:part3,lun0:part4
+    nbd-client 127.0.0.1 7525 /dev/nbd0
+    nbd-client 127.0.0.1 7526 /dev/nbd1
+    nbd-client 127.0.0.1 7527 /dev/nbd2
+    nbd-client 127.0.0.1 7528 /dev/nbd3
+    nbd-client 127.0.0.1 7529 /dev/nbd4
+    if [ "$bootdev" == "0x0" ]; then
+      mkdir /mnt/nand_root
+      mount -oro /dev/nbd3 /mnt/nand_root
+    fi
+  fi
+  
+  # Model: 7500 or 7551, 7552, etc.  (NOT 7550) -- these boards have mSD 
+  if [ "$model" != "0x7550" ]; then
+    eval `sdctl -z 65536 --nbdserver lun0:disc,lun0:part1,lun0:part2,lun0:part3,lun0:part4 2>&1`
+    if [ "$cardsize_sectors" == "0" ]; then
+      killall sdctl >> $CONSOLE 2>&1
+    else
+      nbd-client 127.0.0.1 7500 /dev/nbd5
+      nbd-client 127.0.0.1 7501 /dev/nbd6
+      nbd-client 127.0.0.1 7502 /dev/nbd7
+      nbd-client 127.0.0.1 7503 /dev/nbd8
+      nbd-client 127.0.0.1 7504 /dev/nbd9
+      if [ "$bootdev" == "0x1" ]; then
+        mount /mnt/sd_root 
+        mount -oro /dev/nbd9 /mnt/sd_root
+      fi
+    fi
+  fi
+  
+  # Software auto-update
+  if [ -x /mnt/root/tsinit ]; then
+    /mnt/root/tsinit $XCONSOLE < $CONSOLE > $CONSOLE 2>&1
+  fi
+  
+) </dev/null >/dev/null 2>&1 
+
+if [ -e /mnt/root/notrootfs -o -e /mnt/root/fastboot -o ! -e /mnt/root/sbin/init ]; then
+  if [ -e /mnt/root/fastboot ]; then
+    echo ">> File 'fastboot' found. Booting to initrd instead..." > $CONSOLE
+  else
+    echo ">> USB Drive failed. Booting to initrd..." > $CONSOLE
+  fi
+
+  (                                                                             
+    mount -t devpts devpts /dev/pts
+    mount -t tmpfs none /dev/shm
+    ifconfig eth0 192.168.0.50
+    telnetd
+    mount -t tmpfs tmpfs /tmp
+  ) </dev/null >/dev/null 2>&1
+
+  (
+    let x=`devmem 0x79000040`
+    sec=$((x / 100000))
+    tenths=$((x % 100000 / 1000))
+    export BOOTTIME=`printf "%d.%02d" $sec $tenths`
+    export ENV=/shinit
+    exec setsid cttyhack /bin/sh -i
+  ) <$CONSOLE >$CONSOLE 2>&1
+  wait
+fi
+
+if [ -e /mnt/root/sbin/init ]; then
+  killall busybox telnetd 
+  cd /mnt/root
+  pivot_root . ./initrd
+  ./bin/mount -n --move ./initrd/sys ./sys
+  ./bin/mount -n --move ./initrd/proc ./proc
+  exec ./usr/sbin/chroot . ./sbin/init < .$CONSOLE > .$CONSOLE 2>&1
+fi
+
diff --git a/recipes/ts7500/files/passwd b/recipes/ts7500/files/passwd
new file mode 100644
index 0000000..0891d68
--- /dev/null
+++ b/recipes/ts7500/files/passwd
@@ -0,0 +1,9 @@
+root::0:0:root:/home/root:/bin/sh
+daemon:*:1:1:daemon:/usr/sbin:/bin/sh
+bin:*:2:2:bin:/bin:/bin/sh
+sys:*:3:3:sys:/dev:/bin/sh
+sync:*:4:65534:sync:/bin:/bin/sync
+man:*:6:12:man:/var/cache/man:/bin/sh
+proxy:*:13:13:proxy:/bin:/bin/sh
+nobody:*:65534:65534:nobody:/nonexistent:/bin/sh
+v2g::500:500:UD-V2G GIV-User,,,:/home/v2g:/bin/sh
diff --git a/recipes/ts7500/files/ts-utils.patch b/recipes/ts7500/files/ts-utils.patch
new file mode 100644
index 0000000..b337a7d
--- /dev/null
+++ b/recipes/ts7500/files/ts-utils.patch
@@ -0,0 +1,68 @@
+diff -rupN old/jed2vme.c new/jed2vme.c
+--- old/jed2vme.c	2011-03-09 11:34:07.000000000 -0500
++++ new/jed2vme.c	2011-03-09 11:34:38.000000000 -0500
+@@ -18,6 +18,7 @@
+  */
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <assert.h>
+ 
+ static unsigned char preamble[] = {
+diff -rupN old/sdctl.c new/sdctl.c
+--- old/sdctl.c	2011-03-09 11:51:29.000000000 -0500
++++ new/sdctl.c	2011-03-09 11:34:10.000000000 -0500
+@@ -16,6 +16,7 @@
+  *  WITHOUT THE PRIOR WRITTEN CONSENT OF TECHNOLOGIC SYSTEMS  COULD
+  *  SUBJECT THE PERPETRATOR TO CRIMINAL AND CIVIL LIABILITY.
+  */
++#include <errno.h>
+ #include <assert.h>
+ #include <string.h>
+ #include <fcntl.h>
+@@ -82,7 +83,11 @@ static volatile unsigned int *cvspiregs,
+ #define MEM_GETPGD       _IOR(0xaa, 1, unsigned long)
+ #ifndef PPC
+ #define __NR_cacheflush __ARM_NR_cacheflush
+-static inline _syscall3(int,cacheflush,unsigned long,beg,unsigned long,end,int,flags);
++// static inline _syscall3(int,cacheflush,unsigned long,beg,unsigned long,end,int,flags);
++static inline int cacheflush (unsigned long beg, unsigned long end, int flags)
++{
++  return syscall(__NR_cacheflush, beg, end, flags);
++}
+ #endif
+ 
+ static int devmem, devkmem;
+diff -rupN old/spiflashctl.c new/spiflashctl.c
+--- old/spiflashctl.c	2011-03-09 11:34:07.000000000 -0500
++++ new/spiflashctl.c	2011-03-09 11:37:00.000000000 -0500
+@@ -17,6 +17,7 @@
+  *  SUBJECT THE PERPETRATOR TO CRIMINAL AND CIVIL LIABILITY.
+  */
+ 
++#include <errno.h>
+ #include <assert.h>
+ #include <string.h>
+ #include <fcntl.h>
+diff -rupN old/ts7500ctl.c new/ts7500ctl.c
+--- old/ts7500ctl.c	2011-03-09 11:52:15.000000000 -0500
++++ new/ts7500ctl.c	2011-03-09 11:34:10.000000000 -0500
+@@ -16,6 +16,7 @@
+  *  WITHOUT THE PRIOR WRITTEN CONSENT OF TECHNOLOGIC SYSTEMS  COULD
+  *  SUBJECT THE PERPETRATOR TO CRIMINAL AND CIVIL LIABILITY.
+  */
++#include <errno.h>
+ #include <assert.h>
+ #include <string.h>
+ #include <fcntl.h>
+diff -rupN old/xuartctl.c new/xuartctl.c
+--- old/xuartctl.c	2011-03-09 11:34:07.000000000 -0500
++++ new/xuartctl.c	2011-03-09 11:40:47.000000000 -0500
+@@ -18,6 +18,7 @@
+  * CRIMINAL AND CIVIL LIABILITY.
+  */
+ 
++#include <limits.h>
+ #include <sys/socket.h>
+ #include <stdio.h>
+ #include <stdlib.h>
diff --git a/recipes/ts7500/files/ts7500.subr b/recipes/ts7500/files/ts7500.subr
new file mode 100644
index 0000000..b2ee180
--- /dev/null
+++ b/recipes/ts7500/files/ts7500.subr
@@ -0,0 +1,633 @@
+warn1="WARNING: do NOT power-down while saving/copying!"
+img="[kernel+initrd]"
+
+# ----------------------------------------------------------
+# Display the given number in binary format
+printbin() {
+# NOTE: assume only 7 digits, since getdio() only seem to give 7
+#       will only print the first 7 digits either way
+
+	digits="1 2 3 4 5 6 7"
+	# Loop thru the given hex digits
+	for digit in $digits; do
+		num=`echo $1 | cut -c${digit}`
+		if 	[ "$num" = "a" ]; then num="10"
+		elif 	[ "$num" = "b" ]; then num="11"
+		elif 	[ "$num" = "c" ]; then num="12"
+		elif 	[ "$num" = "d" ]; then num="13"
+		elif 	[ "$num" = "e" ]; then num="14"
+		elif 	[ "$num" = "f" ]; then num="15"
+		fi
+
+		# Loop thru the 4 binary digits:
+		# AND with 0x8 to get the MSB, display it
+		# SHIFT left, do the next digit
+		loops="1 2 3 4 "
+		for loop in $loops; do
+			bin=$((num&0x8));
+			if [ "$bin" = "0" ]; then 
+				echo -n "0"
+			else 
+				echo -n "1" 
+			fi
+			num=$((num<<1))
+		done
+		echo -n " "	
+	done	
+	# echo	
+}
+
+
+cvtime() {
+	local x sec tenths
+	let x=`devmem 0x79000040`
+	sec=$((x / 100000))
+	tenths=$((x % 100000 / 1000))
+	printf "%d.%02d" $sec $tenths
+	
+# Return the value read from mem
+return $x
+}
+
+
+usbload() {
+	mount -t tmpfs tmpfs /lib/modules
+	tar -x -z -f /modules.tar.gz -C /
+	modprobe scsi_mod
+	modprobe sd_mod
+	modprobe usbcore
+	modprobe ehci_hcd
+	modprobe usb_storage
+	umount /lib/modules
+}
+
+
+save() {
+	# Determine the boot device used:
+	# 	media		dev
+	#--------------------
+	# NAND/SPI-0	0 (NOTE: must determine model also!)
+	# mSD			1
+	# SPI-1			2
+	#--------------------
+	# 
+	local dev=`ts7500ctl -i | grep bootdev | cut -d= -f2 | cut -c3-`
+	if [ $dev -eq 0 ]; then
+		# Determine the model
+		local model=`ts7500ctl -i | grep "^model=" | cut -d= -f2 | cut -c3-`
+		if [ $model -eq 7500 ]; then
+			flashsave
+		else
+			nandsave
+		fi
+	elif [ $dev -eq 1 ]; then
+		sdsave
+	elif [ $dev -eq 2 ]; then
+		flash1save
+	fi
+}
+
+
+sdsave() {
+	echo "$warn1"
+	echo -n "Saving [initrd] to mSD ... "
+	mount -o remount,ro /
+	sdctl -W 32 -k part3 -z 65536 -i /dev/ram0 >/dev/null 2>&1
+	mount -o remount,rw /
+	echo "done"
+}
+
+
+nandsave() {
+	echo "$warn1"
+	echo -n "Saving [initrd] to NAND ... "
+	mount -o remount,ro /
+	nandctl -W 16 -k part2 -z 131072 -X -i /dev/ram0 >/dev/null 2>&1
+	mount -o remount,rw /
+	echo "done"
+}
+
+
+flashsave() {
+# Determine the model
+# If this is NOT a 7500, skip
+local model=`ts7500ctl -i | grep "^model=" | cut -d= -f2 | cut -c3-`
+if [ "$model" -ne 7500 ]; then
+	echo "TS-${model} does NOT have ON-board FLASH -- ABORTING"
+	echo "('flash1save' = save to OFF-board FLASH)"
+	echo "('nandsave'   = save to NAND)"
+	return
+fi
+
+	echo "$warn1"
+	echo -n "Saving [initrd] to ON-board FLASH ... "
+	mount -o remount,ro /
+	spiflashctl -W 32 -k part2 -z 65536 -i /dev/ram0 > /dev/null 2>&1
+	mount -o remount,rw /
+	echo "done"
+}
+
+
+flash1save() {
+	echo "$warn1"
+	echo -n "Saving [initrd] to OFF-board FLASH ... "
+	mount -o remount,ro /
+	spiflashctl -l 1 -W 32 -k part2 -z 65536 -i /dev/ram0 > /dev/null 2>&1
+	mount -o remount,rw /
+	echo "done"
+}
+
+
+flashallsave() {
+	flashsave
+	flash1save
+}
+	
+
+# ----------------------------------------------------------
+# Copy from micro SD
+sd2flash() {
+# Determine the model
+# If this is a 7550 or 7551, skip (NO micro SD on these boards)
+local model=`ts7500ctl -i | grep "^model=" | cut -d= -f2 | cut -c3-`
+if [ "$model" -eq 7550 -o $model -eq 7551 ]; then
+	echo "TS-${model} does NOT have micro SD -- ABORTING"
+	echo "(Try: flash2flash, nand2flash)"
+	return
+fi
+
+	echo "$warn1"
+	echo -n "Copying $img mSD --> ON-board FLASH ..."
+	sdctl -R 32 -z 65536 -k part2 > /tmp/image 2>/dev/null
+	spiflashctl -W 32 -z 65536 -k part1 -i /tmp/image > /dev/null 2>&1
+	rm /tmp/image
+	wait
+	
+	sdctl -R 32 -z 65536 -k part3 > /tmp/image 2>/dev/null
+	spiflashctl -W 32 -z 65536 -k part2 -i /tmp/image > /dev/null 2>&1
+	rm /tmp/image
+	echo "done"
+}
+
+sd2flash1() {
+# Determine the model
+# If this is a 7550 or 7551, skip (NO micro SD on these boards)
+local model=`ts7500ctl -i | grep "^model=" | cut -d= -f2 | cut -c3-`
+if [ "$model" -eq 7550 -o $model -eq 7551 ]; then
+	echo "TS-${model} does NOT have micro SD -- ABORTING"
+	echo "(Try: flash2flash, nand2flash)"
+	return
+fi
+
+	echo "$warn1"
+	echo -n "Copying $img mSD --> OFF-board FLASH ..."
+	sdctl -R 32 -z 65536 -k part2 > /tmp/image 2>/dev/null
+	spiflashctl -l 1 -W 32 -z 65536 -k part1 -i /tmp/image > /dev/null 2>&1
+	rm /tmp/image
+	wait
+	
+	sdctl -R 32 -z 65536 -k part3 > /tmp/image 2>/dev/null
+	spiflashctl -l 1 -W 32 -z 65536 -k part2 -i /tmp/image > /dev/null 2>&1
+	rm /tmp/image
+	echo "done"
+}
+
+
+sd2nand() {
+# Determine the model
+# If this is a 7550 or 7551, skip (NO micro SD on these boards)
+local model=`ts7500ctl -i | grep "^model=" | cut -d= -f2 | cut -c3-`
+if [ "$model" -eq 7550 -o "$model" -eq 7551 ]; then
+	echo "TS-${model} does NOT have micro SD -- ABORTING"
+	echo "(Try: flash2nand)"
+	return
+fi
+
+	echo "$warn1"
+	echo -n "Copying $img mSD --> NAND ... "
+	sdctl -R 32 -z 65536 -k part2 > /tmp/image 2>/dev/null
+	nandctl -W 16 -z 131072 -k part1 -X -i /tmp/image > /dev/null 2>&1
+	# sdctl -R 4095 -z 512 -k kernel > /tmp/image 2>/dev/null
+	# nandctl -W 4095 -z 512 -k kernel -X -i /tmp/image > /dev/null 2>&1
+	rm /tmp/image
+	wait
+	
+	sdctl -R 32 -z 65536 -k part3 > /tmp/image 2>/dev/null
+	nandctl -W 16 -z 131072 -k part2 -X -i /tmp/image >/dev/null 2>&1
+	rm /tmp/image
+	echo "done"
+}
+
+# ----------------------------------------------------------
+# Copy from FLASH
+flash2flash() {
+# Determine the model
+# If this is NOT a 7500, skip (only the 7500 has ON-board FLASH)
+local model=`ts7500ctl -i | grep "^model=" | cut -d= -f2 | cut -c3-`
+if [ "$model" -ne 7500 ]; then
+	echo "TS-${model} does NOT have ON-board FLASH -- ABORTING"
+	echo "(Try: sd2flash, nand2flash)"
+	return
+fi
+
+	# Determine the boot media, so we can copy from there
+	local dev=`ts7500ctl -i | grep bootdev | cut -d= -f2 | cut -c3-`
+	echo "$warn1"
+	if [ $dev -eq 0 ]; then
+		echo -n "Copying $img ON-board FLASH --> OFF-board FLASH ... "
+		spiflashctl -R 64 -z 65536 > /tmp/image 2>/dev/null
+		spiflashctl -l 1 -W 64 -z 65536 -i /tmp/image > /dev/null 2>&1
+	elif [ $dev -eq 2 ]; then
+		echo -n "Copying $img OFF-board FLASH --> ON-board FLASH ... "
+		spiflashctl -l 1 -R 64 -z 65536 > /tmp/image 2>/dev/null
+		spiflashctl -W 64 -z 65536 -i /tmp/image > /dev/null 2>&1
+	fi
+
+	rm /tmp/image
+	echo "done"
+}
+
+
+flash2sd() {
+# Determine the model
+# If this is a 7550 or 7551, skip (NO micro SD on these boards)
+local model=`ts7500ctl -i | grep "^model=" | cut -d= -f2 | cut -c3-`
+if [ "$model" -eq 7550 -o $model -eq 7551 ]; then
+	echo "TS-${model} does NOT have micro SD -- ABORTING"
+	return
+fi
+
+	# Determine the boot media, so we can copy from there
+	local dev=`ts7500ctl -i | grep bootdev | cut -d= -f2 | cut -c3-`
+	# Assume FLASH-0
+	local lun=""
+	local flash="ON-board"
+	if [ $dev -eq 2 ]; then
+		lun="-l 1"
+		flash="OFF-board"
+	fi
+	
+	echo "$warn1"
+	echo -n "Copying $img $flash FLASH --> mSD ... "
+	spiflashctl ${lun} -R 32 -z 65536 -k part1 > /tmp/image 2>/dev/null
+	sdctl -W 32 -z 65536 -k part2 -i /tmp/image >/dev/null 2>&1
+	rm /tmp/image
+	wait
+	
+	spiflashctl ${lun} -R 32 -z 65536 -k part2 > /tmp/image 2>/dev/null
+	sdctl -W 32 -z 65536 -k part3 -i /tmp/image >/dev/null 2>&1
+	rm /tmp/image
+	echo "done"
+}
+
+
+flash2nand() {
+# Determine the model
+# If this is a 7500, skip (NO NAND on this board)
+local model=`ts7500ctl -i | grep "^model=" | cut -d= -f2 | cut -c3-`
+if [ "$model" -eq 7500 ]; then
+	echo "TS-${model} does NOT have NAND -- ABORTING"
+	echo "(Try: flash2flash, flash2sd)"
+	return
+fi
+
+	echo "$warn1"
+	echo -n "Copying $img OFF-board FLASH --> NAND ... "
+	spiflashctl -l 1 -R 64 -z 65536 > /tmp/image 2>/dev/null
+	nandctl -W 32 -z 131072 -X -i /tmp/image > /dev/null 2>&1
+	rm /tmp/image
+	echo "done"
+}
+
+
+# ----------------------------------------------------------
+# Copy from NAND
+nand2flash() {
+# Determine the model
+# If this is a 7500, skip (NO NAND on this board)
+local model=`ts7500ctl -i | grep "^model=" | cut -d= -f2 | cut -c3-`
+if [ "$model" -eq 7500 ]; then
+	echo "TS-${model} does NOT have NAND -- ABORTING"
+	echo "(Try: flash2flash, sd2flash)"
+	return
+fi
+
+	echo "$warn1"
+	echo "Copying $img NAND --> OFF-board FLASH ... "
+	nandctl -R 32 -z 131072 -X > /tmp/image 2>/dev/null
+	spiflashctl -l 1 -W 64 -z 65536 -i /tmp/image > /dev/null 2>&1
+	rm /tmp/image
+	echo "done"
+}
+
+
+nand2sd() {
+# Determine the model
+# If this is a 7550 or 7551, skip (NO micro SD on these boards)
+local model=`ts7500ctl -i | grep "^model=" | cut -d= -f2 | cut -c3-`
+if [ "$model" -eq 7550 -o "$model" -eq 7551 ]; then
+	echo "TS-${model} does NOT have micro SD -- ABORTING"
+	echo "(Try: nand2flash)"
+	return
+fi
+
+	echo "$warn1"
+	echo "Copying $img NAND --> mSD ... "
+	nandctl -R 16 -z 131072 -k part1 -X > /tmp/image 2>/dev/null
+	sdctl -W 32 -z 65536 -k part2 -i /tmp/image >/dev/null 2>&1
+	rm /tmp/image
+	wait
+	
+	nandctl -R 16 -z 131072 -k part2 -X > /tmp/image 2>/dev/null
+	sdctl -W 32 -z 65536 -k part3 -i /tmp/image >/dev/null 2>&1
+	rm /tmp/image
+	echo "done"
+}
+
+
+recover() {
+# 'Un-brick" a board
+# [try to] copy the kernel/initrd images from the boot device to ...
+
+# Scenarios:
+# Model	Boot		Recover
+#==============================
+# 7500	FLASH-1	(2)	FLASH-0/mSD
+# 7500	FLASH-0	(0)	mSD
+# 7500	mSD		(1)	FLASH-0
+# 7550	FLASH-1	(2)	NAND
+# 7550	NAND	(0)	-----
+# 7551	FLASH-1	(2)	NAND
+# 7551	NAND	(0)	-----
+# 7552	FLASH-1	(2)	NAND/mSD
+# 7552	mSD		(1)	NAND
+# 7552	NAND	(0)	mSD
+# 7553	FLASH-1	(2)	NAND/mSD
+# 7553	mSD		(1)	NAND
+# 7553	NAND	(0)	mSD
+
+# 	media		dev
+#--------------------
+# NAND/FLASH-0	0 (NOTE: must determine model also!)
+# mSD		1
+# FLASH-1	2
+#--------------------
+# 
+	# Determine the boot device and model
+	local dev=`ts7500ctl -i | grep bootdev | cut -d= -f2 | cut -c3-`
+	local model=`ts7500ctl -i | grep "^model=" | cut -d= -f2 | cut -c3-`
+	local device
+	if [ $dev -eq 0 ]; then
+		if [ $model -eq 7500 ]; then
+			device="ONboard FLASH"
+		else
+			device="NAND"
+		fi
+	elif [ $dev -eq 1 ]; then
+		device="micro SD"
+	elif [ $dev -eq 2 ]; then
+		device="OFFboard FLASH"
+	fi
+	
+	echo "(TS-${model}, booted from ${device}) "
+
+	# Determine what to recover
+	# 7500
+	if [ $model -eq 7500 ]; then
+		# from FLASH-1 --> FLASH-0/mSD
+		if [ $dev -eq 2 ]; then
+			echo -n "Recover FLASH-0 ? --> [y/n]: "
+			read ans
+			if [ "$ans" = "y" ]; then
+				flash2flash
+			fi
+			echo -n "Recover micro SD ? --> [y/n]: "
+			read ans
+			if [ "$ans" = "y" ]; then
+				flash2sd
+			fi
+		# from FLASH-0 --> mSD
+		elif [ $dev -eq 0 ]; then
+			echo -n "Recover micro SD ? --> [y/n]: "
+			read ans
+			if [ "$ans" = "y" ]; then
+				flash2sd
+			fi
+		# from mSD --> FLASH-0
+		elif [ $dev -eq 1 ]; then
+			echo -n "Recover FLASH-0 ? --> [y/n]: "
+			read ans
+			if [ "$ans" = "y" ]; then
+				sd2flash
+			fi
+		fi
+	# 7550/7551
+	elif [ $model -eq 7550 -o $model -eq 7551 ]; then
+		# from FLASH-1 --> NAND
+		if [ $dev -eq 2 ]; then
+			echo -n "Recover NAND ? --> [y/n]: "
+			read ans
+			if [ "$ans" = "y" ]; then
+				flash2nand
+			fi
+		# from NAND --> nothing to recover!
+		elif [ $dev -eq 0 ]; then
+			echo "NOTHING to recover -- try \"nand2flash\""
+		fi
+	# 7552/7553
+	elif [ $model -eq 7552 -o $model -eq 7553 ]; then
+		# from FLASH-1 --> NAND/mSD
+		if [ $dev -eq 2 ]; then
+			echo -n "Recover NAND ? --> [y/n]: "
+			read ans
+			if [ "$ans" = "y" ]; then
+				flash2nand
+			fi
+			echo -n "Recover micro SD ? --> [y/n]: "
+			read ans
+			if [ "$ans" = "y" ]; then
+				flash2sd
+			fi
+		# from mSD --> NAND
+		elif [ $dev -eq 1 ]; then
+			echo -n "Recover NAND ? --> enter [y/n]: "
+			read ans
+			if [ "$ans" = "y" ]; then
+				sd2nand
+			fi
+		# from NAND --> mSD
+		elif [ $dev -eq 0 ]; then
+			echo -n "Recover micro SD ? --> enter [y/n]: "
+			read ans
+			if [ "$ans" = "y" ]; then
+				nand2sd
+			fi
+		fi
+	fi
+}
+
+
+#Usage: setdiopin <pin> <1,0,Z> <b>
+# Second arg:
+#	1= ON, 0= OFF, z= input mode
+# Third arg:
+#	if present, print DIO reg in binary
+setdiopin() {
+	if [ -z "$dio_out" ]; then
+		eval `ts7500ctl --getdioreg`
+	fi
+	case $2 in
+	0)
+		let diodir="diodir | (1<<$1)"
+		let dio_out="dio_out & ~(1<<$1)"
+		;;
+	1)
+		let diodir="diodir | (1<<$1)"
+		let dio_out="dio_out | (1<<$1)" 
+		;;
+	z|Z)
+		let diodir="diodir & ~(1<<$1)"
+		;;
+	esac
+	ts7500ctl --setdio $dio_out --setdiodir $diodir
+	
+	if [ "$3" = "b" ]; then
+		local dir=`ts7500ctl --getdioreg | grep diodir | cut -dx -f2`
+		echo -n "DIR= "
+		printbin $dir
+		echo
+		local out=`ts7500ctl --getdioreg | grep dio_out | cut -dx -f2`
+		echo -n "OUT= "
+		printbin $out
+		echo
+	fi
+	#return $dionum
+}
+
+
+#Usage: getdiopin <pin>
+getdiopin() {
+	local x dio
+	eval `ts7500ctl --getdio`
+	let x="(dio >> $1) & 0x1"
+	echo $x
+	return $x
+}
+
+
+#TS-752 utility functions
+setrelay() {
+	local x
+	let x="$1"
+	setdiopin 39 $((x & 0x1))
+	setdiopin 37 $(((x >> 1) & 0x1)) 
+	setdiopin 35 $(((x >> 2) & 0x1)) 
+
+# Return the value given
+# NOTE: maybe we can return the ACTUAL relay status?-JW
+return $x	
+}
+
+
+setout() {
+	local x
+	let x="$1"
+	setdiopin 33 $((x & 0x1))
+	setdiopin 31 $(((x >> 1) & 0x1)) 
+	setdiopin 29 $(((x >> 2) & 0x1)) 
+	
+# Return the value given
+# NOTE: maybe we can return the ACTUAL pin status?-JW
+return $x
+}
+
+
+getin() {
+	local x dio
+	eval `ts7500ctl --getdio`
+	let x="(dio >> 40) & 1"
+	let x="x | (((dio >> 38) & 1) << 1)"
+	let x="x | (((dio >> 36) & 1) << 2)"
+	let x="x | (((dio >> 34) & 1) << 3)"
+	let x="x | (((dio >> 32) & 1) << 4)"
+	let x="x | (((dio >> 30) & 1) << 5)"
+	let x="x | (((dio >> 28) & 1) << 6)"
+	let x="x | (((dio >> 26) & 1) << 7)"
+	if [ -z "$1" ]; then
+		printf "0x%x\n" $x
+		return $x
+	else
+		echo $(((x >> ($1 - 1)) & 1))
+		return $(((x >> ($1 - 1)) & 1)) 
+	fi
+}
+
+
+tshelp() {
+	echo "usbload:"
+	echo -e "\tLoad USB kernel drivers"
+	echo "setdiopin <pin> <1,0,Z> <b>:"
+	echo -e "\tSet DIO header pin 1-44 (b=dump binary)"
+	echo "getdiopin <pin>:"
+	echo -e "\tGet DIO input state"
+	echo "setrelay <val>:"
+	echo -e "\tTurn on/off TS-752 relays according to 3-bit val"
+	echo "setout <val>:"
+	echo -e "\tSet 3-bit TS-752 output val"
+	echo "getin:"
+	echo -e "\tReturn 8 bit TS-752 inputs"
+	echo "gettemp:"
+	echo -e "\tReturn Temp. Sensor reading"
+	echo "save:"
+	echo -e "\tSave initrd back to boot device (NANS, SD or SPI flash)"
+	echo "sd2nand/nand2sd, sd2flash/flash2sd, nand2flash/flash2nand, etc:"
+	echo -e "\tCopy kernel+initrd images from one media to another"
+	echo "recover:"
+	echo -e "\tRecover kernel+initrd images"
+	echo "sbcTest:"
+	echo -e "\tRun TS production tests (NOTE: need loop-back testers)"
+	echo "exit:" 
+	echo -e "\tBoot SD card (if present) or filesystem mounted at /mnt/root"
+}
+
+
+gettemp() {
+# Determine the board model
+# If 7500 or 7550, use local function
+# For all other boards, use "ts7500ctl --gettemp"
+local model=`ts7500ctl -i | grep "^model=" | cut -d= -f2 | cut -c3-`
+if [ "$model" -ne 7500 -a $model -ne 7550 ]; then
+	ts7500ctl --gettemp
+	return
+fi
+
+	local n x val
+	setdiopin 22 0
+	setdiopin 12 Z
+	n=0
+	while [ $n -lt 13 ]; do
+		setdiopin 14 0
+		setdiopin 14 1
+		x=`getdiopin 12`
+		if [ "$x" -eq 0 ]; then
+			let val="val << 1"
+		else
+			let val="(val << 1) | 1"
+		fi
+		let n="n + 1"
+	done
+	setdiopin 22 Z
+	setdiopin 14 Z
+	if [ $((val & 0x1000)) -ne 0 ]; then
+		val=$(((~(val & 0xfff) & 0xfff) + 1))
+		val=$((val * 62500))
+		printf "-%d." $((val / 1000000))
+		printf "%d\n" $(((val % 1000000) / 100000))
+	else
+		val=$((val * 62500))
+		printf "%d." $((val / 1000000))
+		printf "%d\n" $(((val % 1000000) / 100000))
+	fi
+	
+	return $val
+}
diff --git a/recipes/ts7500/spictl_0.0.1.bb b/recipes/ts7500/spictl_0.0.1.bb
new file mode 100644
index 0000000..bc0a392
--- /dev/null
+++ b/recipes/ts7500/spictl_0.0.1.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "TS 7500 spictl scripts"
+PR = "r0"
+DEPENDS = ""
+SRC_URI = " \
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/spictl.tar.gz \
+"
+
+SRC_URI[md5sum] = "8144833fecbf9162ec47a7ec7e6695a5"
+SRC_URI[sha256sum] = "5ebdb995b58a7c914ab8c9213a41789095285139ee82a89a4fb73bfc3e0f7a13"
+
+S = "${WORKDIR}/spictl"
+
+do_compile () {
+	   ${CC}${CFLAGS} -g -c -o spictl.o spictl.c
+	   ${CC}${CFLAGS} -g -c -o sock.o sock.c
+	   ${CC}${CFLAGS} -g -c -o peekpoke.o peekpoke.c
+	   ${CC}${CFLAGS} -g -c -o opt.o opt.c
+	   ${CC}${CFLAGS} -g -c -o cavium.o cavium.c
+	   ${CC}${CFLAGS} -g -c -o file.o file.c
+	   ${CC}${CFLAGS} -g ${LDFLAGS} -o spictl spictl.o sock.o peekpoke.o opt.o cavium.o file.o
+}
+
+do_install () {
+	   install -d ${D}${base_sbindir}/
+	   install -m 0755 ${S}/spictl ${D}${base_sbindir}/
+}
diff --git a/recipes/ts7500/ts-initrd_0.0.1.bb b/recipes/ts7500/ts-initrd_0.0.1.bb
new file mode 100644
index 0000000..8954bd9
--- /dev/null
+++ b/recipes/ts7500/ts-initrd_0.0.1.bb
@@ -0,0 +1,46 @@
+DESCRIPTION = "TS 7500 initrd scripts"
+PR = "r0"
+DEPENDS = ""
+SRC_URI = " \
+	file://linuxrc-sdroot \
+	file://linuxrc-sdroot-readonly \
+	file://linuxrc-fastboot \
+	file://linuxrc-sdmount \
+	file://linuxrc-usbroot \
+	file://linuxrc-nandmount \  
+	file://passwd \
+	file://group \
+	file://ts7500_opencore_can.vme.comp \
+	file://ts7500.subr \
+"
+
+S= "${WORKDIR}"
+
+do_install () {
+	   install -d ${D}/ts7500
+	   install -m 0755 ${WORKDIR}/linuxrc-sdroot ${D}/ts7500
+	   install -m 0755 ${WORKDIR}/linuxrc-sdroot-readonly ${D}/ts7500
+	   install -m 0755 ${WORKDIR}/linuxrc-fastboot ${D}/ts7500
+	   install -m 0755 ${WORKDIR}/linuxrc-sdmount ${D}/ts7500
+	   install -m 0755 ${WORKDIR}/linuxrc-usbroot ${D}/ts7500
+	   install -m 0755 ${WORKDIR}/linuxrc-nandmount ${D}/ts7500
+	   install -m 0755 ${WORKDIR}/ts7500_opencore_can.vme.comp -T ${D}/ts7500/ts7500_opencore_can.vme.gz
+	   install -m 0755 ${WORKDIR}/ts7500.subr ${D}/ts7500
+	   install -d ${D}/${sysconfdir}
+	   install -m 0755 ${WORKDIR}/passwd ${D}/${sysconfdir}/passwd
+	   install -m 0755 ${WORKDIR}/group ${D}/${sysconfdir}/group
+	   
+}
+
+FILES_${PN} = "/ \
+	    /ts7500/linuxrc-sdroot \
+	    /ts7500/linuxrc-sdroot-readonly \
+	    /ts7500/linuxrc-fastboot \
+	    /ts7500/linuxrc-sdmount \
+	    /ts7500/linuxrc-usbroot \
+	    /ts7500/linuxrc-nandmount \
+	    /ts7500/ts7500.subr \
+	    /ts7500/ts7500_opencore_can.vme.gz \
+	    ${sysconfdir}/passwd \
+	    ${sysconfdir}/group \
+	    "
\ No newline at end of file
diff --git a/recipes/ts7500/ts-utils_0.0.1.bb b/recipes/ts7500/ts-utils_0.0.1.bb
new file mode 100644
index 0000000..bd7a72e
--- /dev/null
+++ b/recipes/ts7500/ts-utils_0.0.1.bb
@@ -0,0 +1,60 @@
+DESCRIPTION = "TS 7500 Utility Scripts"
+PR = "r0"
+DEPENDS = ""
+SRC_URI = " \
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/jed2vme.c;name=jed2vmec \
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/sdcore2.c;name=sdcore2c \
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/sdctl.c;name=sdctlc \	
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/vmopcode.h;name=vmopcodeh \
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/ispvm.c;name=ispvmc \
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/ts7500ctl.c;name=ts7500ctlc \
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/spiflashctl.c;name=spiflashctlc \
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/xuartcore.c;name=xuartcorec \
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/xuartcore.h;name=xuartcoreh \
+	ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7500-linux/sources/xuartctl.c;name=xuartctlc \
+	file://ts-utils.patch \
+"
+
+S = "${WORKDIR}"
+
+do_compile () {
+	   ${CC}${CFLAGS} -g ${LDFLAGS} -o jed2vme jed2vme.c
+	   ${CC}${CFLAGS} -g ${LDFLAGS} -o sdctl sdctl.c
+	   ${CC}${CFLAGS} -g -c -o ispvm.o ispvm.c
+	   ${CC}${CFLAGS} -g -c -o ts7500ctl.o ts7500ctl.c
+	   ${CC}${CFLAGS} -g ${LDFLAGS} -o ts7500ctl ts7500ctl.o ispvm.o	
+	   ${CC}${CFLAGS} -g ${LDFLAGS} -o spiflashctl spiflashctl.c
+	   ${CC}${CFLAGS} -g -c -o xuartcore.o xuartcore.c
+	   ${CC}${CFLAGS} -g -c -o xuartctl.o xuartctl.c
+	   ${CC}${CFLAGS} -g ${LDFLAGS} -o xuartctl xuartctl.o -lutil
+}
+
+do_install () {
+	   install -d ${D}${base_sbindir}/
+     	   install -m 0755 ${S}/jed2vme ${D}${base_sbindir}/
+   	   install -m 0755 ${S}/sdctl ${D}${base_sbindir}/
+	   install -m 0755 ${S}/ts7500ctl ${D}${base_sbindir}/
+   	   install -m 0755 ${S}/spiflashctl ${D}${base_sbindir}/
+   	   install -m 0755 ${S}/xuartctl ${D}${base_sbindir}/
+}
+
+SRC_URI[ispvmc.md5sum] = "99d3a017c52fd9cbb0c97f4a829eda0b"
+SRC_URI[ispvmc.sha256sum] = "548b0b53861ee6cdb4f13859ec428ad2f3aa53e8237fbca54463c1eb6f47be9d"
+SRC_URI[jed2vmec.md5sum] = "65ca2ecada2c6d1bbb489561f2f5f039"
+SRC_URI[jed2vmec.sha256sum] = "7351011403b6254b2cdb46d9958f4be81023565fcd91d21fbf51d5cce0491d4a"
+SRC_URI[sdcore2c.md5sum] = "3ad3f7ed650cf140b2ed2d83f0fc05b2"
+SRC_URI[sdcore2c.sha256sum] = "1246031ab3715ece923c276a180c2322851b625ad27b13241cd6219daf16dc99"
+SRC_URI[sdctlc.md5sum] = "4e0b1cd33afd0da7babeca66b03b5d5e"
+SRC_URI[sdctlc.sha256sum] = "9760853e2f04724116f0bef6786a4d2ac5e532fedcd53ae42a16bce528fbbeaa"
+SRC_URI[spiflashctlc.md5sum] = "e42e593409000451e7d6c0c61d5827c8"
+SRC_URI[spiflashctlc.sha256sum] = "c221ff69f905d793698afcdf5d4212d60685bb11adf8b128a4947088958695f4"
+SRC_URI[ts7500ctlc.md5sum] = "52ca09f12aa09d8271e699f471761ff5"
+SRC_URI[ts7500ctlc.sha256sum] = "8ee9b6af97d7632c089c837a763e5fca5976c4e13607028cd181d55ec0fb1a8e"
+SRC_URI[vmopcodeh.md5sum] = "64b1ae9de8e0e059ad06e9bd777f3edb"
+SRC_URI[vmopcodeh.sha256sum] = "7c55ea5854b481c1b09fca38f89a6d3ca24199f931509cd2756d9931f21c4be2"
+SRC_URI[xuartcorec.md5sum] = "376e7aff2fc724681599711f34922eb4"
+SRC_URI[xuartcorec.sha256sum] = "88c1d619cad4c675c068857cac189a2838adf84d8340f298e8b279dd414abfef"
+SRC_URI[xuartcoreh.md5sum] = "1ccd2b36c06718224925e1ff4c5cd293"
+SRC_URI[xuartcoreh.sha256sum] = "a0a5021513659ab069b8507fdedd835b5b47c962cd30ea68d1a017d94c1210ba"
+SRC_URI[xuartctlc.md5sum] = "a5825b26b9fef3af1532915f2bba2b43"
+SRC_URI[xuartctlc.sha256sum] = "0897a08ac7bbab07592ce41e664ce1c3887b23318a21f42b8ad3a0d06286c6c9"
diff --git a/recipes/ts7500/ts7500_0.0.1.bb b/recipes/ts7500/ts7500_0.0.1.bb
new file mode 100644
index 0000000..de4f398
--- /dev/null
+++ b/recipes/ts7500/ts7500_0.0.1.bb
@@ -0,0 +1,7 @@
+DESCRIPTION = "TS 7500 Utility Scripts"
+MAINTAINER = "Sachin Kamboj"
+PR = "r0"
+# ALLOW_EMPTY = 1
+DEPENDS = "canctl ts-utils  dioctl  dmxctl  spictl nbd"
+RDEPENDS = "canctl ts-utils  dioctl  dmxctl  spictl nbd-client"
+PROVIDES = "ts7500"
-- 
1.7.3.4



