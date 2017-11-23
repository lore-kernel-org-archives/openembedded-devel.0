Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0627878706
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vANC9XFL014615
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 23 Nov 2017 04:09:33 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:31 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:07 -0500
Message-ID: <344a855ac2b00566988db2abd3e74f503f970000.1511437793.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/15] meta-installer: add initramfs-live-boot bbappend
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Nov 2017 12:09:33 -0000
Content-Type: text/plain

Customize init-live.sh to override the one in oe-core

- Add option to enter a debug shell in initrd

- Add option to run anaconda installer from initrd.
  (required by PXE install)

- Remove -c while invoking switch_root which
  is not supported by util-linux

The bbappend works only if DISTRO = "anaconda".

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../initrdscripts/files/init-live.sh               | 249 +++++++++++++++++++++
 .../initrdscripts/initramfs-live-boot_1.0.bbappend |   5 +
 2 files changed, 254 insertions(+)
 create mode 100644 meta-installer/recipes-installer/initrdscripts/files/init-live.sh
 create mode 100644 meta-installer/recipes-installer/initrdscripts/initramfs-live-boot_1.0.bbappend

diff --git a/meta-installer/recipes-installer/initrdscripts/files/init-live.sh b/meta-installer/recipes-installer/initrdscripts/files/init-live.sh
new file mode 100644
index 0000000..965375b
--- /dev/null
+++ b/meta-installer/recipes-installer/initrdscripts/files/init-live.sh
@@ -0,0 +1,249 @@
+#!/bin/sh
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+
+ROOT_MOUNT="/rootfs"
+ROOT_IMAGE="rootfs.img"
+MOUNT="/bin/mount"
+UMOUNT="/bin/umount"
+ISOLINUX=""
+
+ROOT_DISK=""
+
+# Copied from initramfs-framework. The core of this script probably should be
+# turned into initramfs-framework modules to reduce duplication.
+udev_daemon() {
+	OPTIONS="/sbin/udev/udevd /sbin/udevd /lib/udev/udevd /lib/systemd/systemd-udevd"
+
+	for o in $OPTIONS; do
+		if [ -x "$o" ]; then
+			echo $o
+			return 0
+		fi
+	done
+
+	return 1
+}
+
+_UDEV_DAEMON=`udev_daemon`
+
+early_setup() {
+    mkdir -p /proc
+    mkdir -p /sys
+    mount -t proc proc /proc
+    mount -t sysfs sysfs /sys
+    mount -t devtmpfs none /dev
+
+    # support modular kernel
+    modprobe isofs 2> /dev/null
+
+    mkdir -p /run
+    mkdir -p /var/run
+
+    $_UDEV_DAEMON --daemon
+    udevadm trigger --action=add
+}
+
+read_args() {
+    [ -z "$CMDLINE" ] && CMDLINE=`cat /proc/cmdline`
+    for arg in $CMDLINE; do
+        optarg=`expr "x$arg" : 'x[^=]*=\(.*\)'`
+        case $arg in
+            root=*)
+                ROOT_DEVICE=$optarg ;;
+            rootimage=*)
+                ROOT_IMAGE=$optarg ;;
+            rootfstype=*)
+                modprobe $optarg 2> /dev/null ;;
+            LABEL=*)
+                label=$optarg ;;
+            video=*)
+                video_mode=$arg ;;
+            vga=*)
+                vga_mode=$arg ;;
+            console=*)
+                if [ -z "${console_params}" ]; then
+                    console_params=$arg
+                else
+                    console_params="$console_params $arg"
+                fi ;;
+            shelltimeout*)
+                if [ -z "$optarg" ]; then
+                        shelltimeout=30
+                else
+                        shelltimeout=$optarg
+                fi ;;
+            debugshell)
+                debugshell=y
+        esac
+    done
+}
+
+boot_live_root() {
+    # Watches the udev event queue, and exits if all current events are handled
+    udevadm settle --timeout=3
+    killall "${_UDEV_DAEMON##*/}" 2>/dev/null
+
+    # Allow for identification of the real root even after boot
+    mkdir -p  ${ROOT_MOUNT}/media/realroot
+    mount -n --move "/run/media/${ROOT_DISK}" ${ROOT_MOUNT}/media/realroot
+
+    # Umount other media for anaconda
+    for dir in `awk '/\/dev.* \/run\/media/{print $2}' /proc/mounts`; do
+        umount $dir
+    done
+    mount -n --move /proc ${ROOT_MOUNT}/proc
+    mount -n --move /sys ${ROOT_MOUNT}/sys
+    mount -n --move /dev ${ROOT_MOUNT}/dev
+
+    cd $ROOT_MOUNT
+
+    exec switch_root $ROOT_MOUNT /sbin/init $CMDLINE ||
+        fatal "Couldn't switch_root, dropping to shell"
+}
+
+fatal() {
+    echo $1 >$CONSOLE
+    echo >$CONSOLE
+    exec sh
+}
+
+early_setup
+
+[ -z "$CONSOLE" ] && CONSOLE="/dev/console"
+
+read_args
+
+if test x$debugshell = xy ; then
+        echo "Entering debug shell..."
+        exec /bin/sh
+fi
+
+case $label in
+    initrd-install)
+    # Watches the udev event queue, and exits if all current events are handled
+    udevadm settle --timeout=3
+    killall "${_UDEV_DAEMON##*/}" 2>/dev/null
+    for dir in `awk '/\/dev.* \/run\/media/{print $2}' /proc/mounts`; do
+        umount $dir
+    done
+    echo "" > /etc/udev/scripts/mount.sh
+    echo "init_bin /sbin/init"
+    [ -x /sbin/init ] && exec /sbin/init
+    ;;
+esac
+
+
+echo "Waiting for removable media..."
+C=0
+while true
+do
+  for i in `ls /run/media 2>/dev/null`; do
+      if [ -f /run/media/$i/$ROOT_IMAGE ] ; then
+		found="yes"
+		ROOT_DISK="$i"
+		break
+	  elif [ -f /run/media/$i/isolinux/$ROOT_IMAGE ]; then
+		found="yes"
+		ISOLINUX="isolinux"
+		ROOT_DISK="$i"
+		break
+      fi
+  done
+  if [ "$found" = "yes" ]; then
+      break;
+  fi
+  # don't wait for more than $shelltimeout seconds, if it's set
+  if [ -n "$shelltimeout" ]; then
+      echo -n " " $(( $shelltimeout - $C ))
+      if [ $C -ge $shelltimeout ]; then
+           echo "..."
+	   echo "Mounted filesystems"
+           mount | grep media
+           echo "Available block devices"
+           cat /proc/partitions
+           fatal "Cannot find $ROOT_IMAGE file in /run/media/* , dropping to a shell "
+      fi
+      C=$(( C + 1 ))
+  fi
+  sleep 1
+done
+
+# Try to mount the root image read-write and then boot it up.
+# This function distinguishes between a read-only image and a read-write image.
+# In the former case (typically an iso), it tries to make a union mount if possible.
+# In the latter case, the root image could be mounted and then directly booted up.
+mount_and_boot() {
+    mkdir $ROOT_MOUNT
+    mknod /dev/loop0 b 7 0 2>/dev/null
+
+    if ! mount -o rw,loop,noatime,nodiratime /run/media/$ROOT_DISK/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
+	fatal "Could not mount rootfs image"
+    fi
+
+    if touch $ROOT_MOUNT/bin 2>/dev/null; then
+	# The root image is read-write, directly boot it up.
+	boot_live_root
+    fi
+
+    # determine which unification filesystem to use
+    union_fs_type=""
+    if grep -q -w "overlay" /proc/filesystems; then
+	union_fs_type="overlay"
+    elif grep -q -w "aufs" /proc/filesystems; then
+	union_fs_type="aufs"
+    else
+	union_fs_type=""
+    fi
+
+    # make a union mount if possible
+    case $union_fs_type in
+	"overlay")
+	    mkdir -p /rootfs.ro /rootfs.rw
+	    if ! mount -n --move $ROOT_MOUNT /rootfs.ro; then
+		rm -rf /rootfs.ro /rootfs.rw
+		fatal "Could not move rootfs mount point"
+	    else
+		mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
+		mkdir -p /rootfs.rw/upperdir /rootfs.rw/work
+		mount -t overlay overlay -o "lowerdir=/rootfs.ro,upperdir=/rootfs.rw/upperdir,workdir=/rootfs.rw/work" $ROOT_MOUNT
+		mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
+		mount --move /rootfs.ro $ROOT_MOUNT/rootfs.ro
+		mount --move /rootfs.rw $ROOT_MOUNT/rootfs.rw
+	    fi
+	    ;;
+	"aufs")
+	    mkdir -p /rootfs.ro /rootfs.rw
+	    if ! mount -n --move $ROOT_MOUNT /rootfs.ro; then
+		rm -rf /rootfs.ro /rootfs.rw
+		fatal "Could not move rootfs mount point"
+	    else
+		mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
+		mount -t aufs -o "dirs=/rootfs.rw=rw:/rootfs.ro=ro" aufs $ROOT_MOUNT
+		mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
+		mount --move /rootfs.ro $ROOT_MOUNT/rootfs.ro
+		mount --move /rootfs.rw $ROOT_MOUNT/rootfs.rw
+	    fi
+	    ;;
+	"")
+	    mount -t tmpfs -o rw,noatime,mode=755 tmpfs $ROOT_MOUNT/media
+	    ;;
+    esac
+
+    # boot the image
+    boot_live_root
+}
+
+if [ "$label" != "boot" -a -f $label.sh ] ; then
+	if [ -f /run/media/$i/$ISOLINUX/$ROOT_IMAGE ] ; then
+	    ./$label.sh $i/$ISOLINUX $ROOT_IMAGE $video_mode $vga_mode $console_params
+	else
+	    fatal "Could not find $label script"
+	fi
+
+	# If we're getting here, we failed...
+	fatal "Target $label failed"
+fi
+
+mount_and_boot
+
diff --git a/meta-installer/recipes-installer/initrdscripts/initramfs-live-boot_1.0.bbappend b/meta-installer/recipes-installer/initrdscripts/initramfs-live-boot_1.0.bbappend
new file mode 100644
index 0000000..4a644ad
--- /dev/null
+++ b/meta-installer/recipes-installer/initrdscripts/initramfs-live-boot_1.0.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS_append_anaconda := ":${THISDIR}/files"
+
+SRC_URI_append_anaconda = " \
+    file://init-live.sh \
+"
-- 
2.8.1


