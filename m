Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 274996BEF3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:36:21 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc17so818431pbc.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7g51CU4jbQ+RlCVu6TBylWNNEUa/HKy/l3ok2fQCwYA=;
	b=U7DndGauSKjB5YGfOJnUakFFAagjPEnq7OATn0jD7fplGknwUIy/k14lWhfVhO0PL2
	602fhCMmj9RBPLhq4VnGEdOivIdxO2Z20C19TFWzKgd+8QwzjNcuNemYEztdCXJhjKQv
	t4ysWNSBgTU0Wu0h3cRpfC5tlNKMmy8VmyNfZWegnS2DpCt971RANgw6sbmST90mpjqU
	MoHc0jDMpHLBaBU+p9Hl3djqX93HQRmTAOqf/aoyDhIPHG83D7w5Gkl1bYSpopnvk6+j
	e3natO+cM6HguJ4JAavGfeB2GDUgY69hj5YOOYsR4FeIPaordxVQWWJAXRv8PObzQ4sI
	HI9g==
X-Received: by 10.68.196.202 with SMTP id io10mr5200876pbc.178.1377801382201; 
	Thu, 29 Aug 2013 11:36:22 -0700 (PDT)
Received: from titan.du.ae ([94.205.106.26]) by mx.google.com with ESMTPSA id
	zi1sm39412487pbb.28.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 11:36:21 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 22:35:58 +0400
Message-Id: <1377801358-3942-5-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1377801358-3942-1-git-send-email-elvis.dowson@gmail.com>
References: <1377801358-3942-1-git-send-email-elvis.dowson@gmail.com>
Cc: bruce.ashfield@windriver.com, Elvis Dowson <elvis.dowson@gmail.com>
Subject: [oe-core 5/5] qemu: runqemu: Add support for launching qemuarmv7 and qemuarma9 machine configurations.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 18:36:21 -0000

This commit
- adds support for launching qemuarmv7 and qemuarmv9 machine configurations.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 scripts/runqemu          |   14 ++++++++---
 scripts/runqemu-internal |   58 ++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 65 insertions(+), 7 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 04dc3b0..3282893 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -39,6 +39,8 @@ usage() {
     echo ""
     echo "Examples:"
     echo "  $MYNAME qemuarm"
+    echo "  $MYNAME qemuarmv7"
+    echo "  $MYNAME qemuarma9"
     echo "  $MYNAME qemux86-64 core-image-sato ext3"
     echo "  $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial"
     echo "  $MYNAME qemux86 ramfs"
@@ -107,7 +109,7 @@ KVM_ENABLED="no"
 while true; do
     arg=${1}
     case "$arg" in
-        "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemumipsel" | \
+        "qemux86" | "qemux86-64" | "qemuarm" |  "qemuarmv7" | "qemuarma9" |"qemumips" | "qemumipsel" | \
         "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
@@ -224,13 +226,13 @@ fi
 
 if [ -z "$MACHINE" ]; then
     if [ "x$FSTYPE" = "xvmdk" ]; then
-        MACHINE=`basename $VM | sed 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
+        MACHINE=`basename $VM | sed 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemuarmv7\|qemuarma9\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from vmdk filename [$VM]"
         fi
         echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
     else
-        MACHINE=`basename $KERNEL | sed 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
+        MACHINE=`basename $KERNEL | sed 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemuarmv7\|qemuarma9\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from kernel filename [$KERNEL]"
         fi
@@ -294,6 +296,12 @@ QEMUX86_64_DEFAULT_FSTYPE=ext3
 QEMUARM_DEFAULT_KERNEL=zImage-qemuarm.bin
 QEMUARM_DEFAULT_FSTYPE=ext3
 
+QEMUARMV7_DEFAULT_KERNEL=zImage-qemuarmv7.bin
+QEMUARMV7_DEFAULT_FSTYPE=ext3
+
+QEMUARMA9_DEFAULT_KERNEL=uImage
+QEMUARMA9_DEFAULT_FSTYPE=cpio
+
 QEMUMIPS_DEFAULT_KERNEL=vmlinux-qemumips.bin
 QEMUMIPS_DEFAULT_FSTYPE=ext3
 
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 8a6e551..3f35054 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -50,6 +50,12 @@ else
         "qemuarm")
             mem_size=128
             ;;
+        "qemuarmv7")
+            mem_size=1024
+            ;;
+        "qemuarma9")
+            mem_size=1024
+            ;;
         "qemumicroblaze")
             mem_size=64
             ;;
@@ -267,6 +273,8 @@ fi
 
 case "$MACHINE" in
     "qemuarm") ;;
+    "qemuarmv7") ;;
+    "qemuarma9") ;;
     "qemumicroblaze") ;;
     "qemumips") ;;
     "qemumipsel") ;;
@@ -325,7 +333,7 @@ if [ "$NFS_SERVER" = "" ]; then
     NFS_DIR=$ROOTFS
 fi
 
-if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarmv7" ]; then
+if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" ]; then
     QEMU=qemu-system-arm
     MACHINE_SUBTYPE=versatilepb
     export QEMU_AUDIO_DRV="none"
@@ -347,8 +355,50 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     if [ "$MACHINE" = "qemuarmv6" ]; then
         QEMUOPTIONS="$QEMUOPTIONS -cpu arm1136"
     fi
-    if [ "$MACHINE" = "qemuarmv7" ]; then
-        QEMUOPTIONS="$QEMUOPTIONS -cpu cortex-a8"
+fi
+
+if [ "$MACHINE" = "qemuarmv7" ]; then
+    QEMU=qemu-system-arm
+    MACHINE_SUBTYPE=beagle
+    export QEMU_AUDIO_DRV="none"
+    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
+    # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
+        KERNCMDLINE="root=/dev/sda rw console=ttyO2,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -cpu cortex-a8 -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
+    fi
+
+    if [ "$FSTYPE" = "nfs" ]; then
+        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
+            echo "Error: NFS mount point $ROOTFS doesn't exist"
+            cleanup
+            return 1
+        fi
+        KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} --no-reboot $QEMU_UI_OPTIONS"
+    fi
+fi
+
+if [ "$MACHINE" = "qemuarma9" ]; then
+    QEMU=qemu-system-arm
+    MACHINE_SUBTYPE=vexpress-a9
+    export QEMU_AUDIO_DRV="none"
+    QEMU_UI_OPTIONS="-show-cursor -usb"
+    # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
+    if [ "${FSTYPE:0:3}" = "ext" -o "${FSTYPE:0:4}" = "cpio" ]; then
+        KERNCMDLINE="earlyprintk root=/dev/ram0 rw console=ttyAMA0,38400n8 rootwait vmalloc=256MB devtmpfs.mount=0 console=tty mem=$QEMU_MEMORY highres=off"
+        QEMUOPTIONS="-M ${MACHINE_SUBTYPE} -cpu cortex-a9 -m 1024 -initrd $ROOTFS"
+        #QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
+    fi
+
+    if [ "$FSTYPE" = "nfs" ]; then
+        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
+            echo "Error: NFS mount point $ROOTFS doesn't exist"
+            cleanup
+            return 1
+        fi
+        KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} --no-reboot $QEMU_UI_OPTIONS"
     fi
 fi
 
@@ -522,7 +572,7 @@ fi
 
 if [ "x$RAMFS" = "xtrue" ]; then
     QEMUOPTIONS="-initrd $ROOTFS -nographic"
-    KERNCMDLINE="root=/dev/ram0 debugshell"
+    KERNCMDLINE="earlyprintk root=/dev/ram debugshell"
 fi
 
 if [ "x$ISOFS" = "xtrue" ]; then
-- 
1.7.10.4


