Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SNmHG-0000Py-Dd
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 16:36:06 +0200
Received: by wera1 with SMTP id a1so501595wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 07:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gZ3QdL2ROZj6QbfEiBH5jHMVrahlRwIFrohas7w2yjc=;
	b=lDe0MTbqtGc21rj7jvp+JwkMwBzFuEE3F1frsD/VLD/hOjXcB4uAS08I4XxKAkdN3Q
	V9o0jvNxRIJnCgdhF5dSVa/ays56VBC69WZ5dQsFw3YDVCHVReyBt5L/jmOGKK2F2egG
	xCKoglCbE+v/0hedbyxRZl1JsCcxfhWBOMT3ncxfBk24KmSeTAuq7Md5LOaGB9wO2vBb
	X/l+idAtivlHqj/W8H2ELCuSUMSLmGmDyF6F90slchU0WLUHgdBT47LYvkoM1Nz6ML7l
	rzfFWSGZA4FCCAPCGu2uSxYRcYgEgLBDFyXpN4lbzq1v4aVI+rvUOyo/pCB26QZeLa3o
	Dh4Q==
Received: by 10.180.79.72 with SMTP id h8mr2083466wix.1.1335536788313;
	Fri, 27 Apr 2012 07:26:28 -0700 (PDT)
Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
	[85.127.86.115])
	by mx.google.com with ESMTPS id gg2sm7972061wib.7.2012.04.27.07.26.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Apr 2012 07:26:27 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.77)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SNm7u-0000Q6-Pa; Fri, 27 Apr 2012 16:26:26 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Apr 2012 16:26:21 +0200
Message-Id: <1335536785-1585-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.9.1
Subject: [PATCH 1/5] runqemu: Use OE_TMPDIR
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
X-List-Received-Date: Fri, 27 Apr 2012 14:36:06 -0000

The error message erroneously talked about TMPDIR.
Just use OE_TMPDIR everywhere to make the name of the variable obvious.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 scripts/runqemu |   27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index caabf61..7c2c4b3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -55,11 +55,6 @@ SCRIPT_QEMU_OPT=""
 SCRIPT_QEMU_EXTRA_OPT=""
 SCRIPT_KERNEL_OPT=""
 
-# Don't use TMPDIR from the external environment, it may be a distro
-# variable pointing to /tmp (e.g. within X on OpenSUSE)
-# Instead, use OE_TMPDIR for passing this in externally.
-TMPDIR="$OE_TMPDIR"
-
 # Determine whether the file is a kernel or QEMU image, and set the
 # appropriate variables
 process_filename() {
@@ -273,8 +268,8 @@ SPITZ_DEFAULT_KERNEL=zImage-spitz.bin
 SPITZ_DEFAULT_FSTYPE=ext3
 
 setup_tmpdir() {
-    if [ -z "$TMPDIR" ]; then
-        # Try to get TMPDIR from bitbake
+    if [ -z "$OE_TMPDIR" ]; then
+        # Try to get OE_TMPDIR from bitbake
         type -P bitbake &>/dev/null || {
             echo "In order for this script to dynamically infer paths";
             echo "to kernels or filesystem images, you either need";
@@ -282,11 +277,11 @@ setup_tmpdir() {
             echo "before running this script" >&2;
             exit 1; }
 
-        # We have bitbake in PATH, get TMPDIR from bitbake
-        TMPDIR=`bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
-        if [ -z "$TMPDIR" ]; then
+        # We have bitbake in PATH, get OE_TMPDIR from bitbake
+        OE_TMPDIR=`bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
+        if [ -z "$OE_TMPDIR" ]; then
             echo "Error: this script needs to be run from your build directory,"
-            echo "or you need to explicitly set TMPDIR in your environment"
+            echo "or you need to explicitly set OE_TMPDIR in your environment"
             exit 1
         fi
     fi
@@ -303,7 +298,7 @@ setup_sysroot() {
         BUILD_OS=`uname | tr '[A-Z]' '[a-z]'`
         BUILD_SYS="$BUILD_ARCH-$BUILD_OS"
 
-        OECORE_NATIVE_SYSROOT=$TMPDIR/sysroots/$BUILD_SYS
+        OECORE_NATIVE_SYSROOT=$OE_TMPDIR/sysroots/$BUILD_SYS
     fi 
 }
 
@@ -348,7 +343,7 @@ fi
 if [ -z "$KERNEL" ]; then
     setup_tmpdir
     eval kernel_file=\$${machine2}_DEFAULT_KERNEL
-    KERNEL=$TMPDIR/deploy/images/$kernel_file
+    KERNEL=$OE_TMPDIR/deploy/images/$kernel_file
 
     if [ -z "$KERNEL" ]; then
         echo "Error: Unable to determine default kernel for MACHINE [$MACHINE]"
@@ -372,13 +367,13 @@ fi
 # core-image-sato
 if [ "$LAZY_ROOTFS" = "true" ]; then
     setup_tmpdir
-    echo "Assuming $ROOTFS really means $TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE"
-    ROOTFS=$TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE
+    echo "Assuming $ROOTFS really means $OE_TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE"
+    ROOTFS=$OE_TMPDIR/deploy/images/$ROOTFS-$MACHINE.$FSTYPE
 fi
 
 if [ -z "$ROOTFS" ]; then
     setup_tmpdir
-    T=$TMPDIR/deploy/images
+    T=$OE_TMPDIR/deploy/images
     eval rootfs_list=\$${machine2}_DEFAULT_ROOTFS
     findimage $T $MACHINE $FSTYPE
 
-- 
1.7.10



