Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SNmHH-0000Q1-K6
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 16:36:07 +0200
Received: by wera1 with SMTP id a1so501607wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=+a4L7wSXAbHJO3k7r7rgqbi1PJbP7+awgeGe7XWay+s=;
	b=aLWFVGnK4I7NCkVnApejRQEvzGI7ciXCSg0l4eOmwkWyQJwSTxNTZggJ6xzMwTcNp3
	pdpcFBUP9uuKxai0apbrFXZ69Da1Qq7KVINglSLmZSb7HNWLKM1yMKJDExr+v/UFzzEe
	uERvusFDJoqkb5YFkNZcYouBgZqOUtRChgWKpDiYdBGH5jqlw/iXrpAN/OLo/6fD448e
	Vmph3j+usz9Rsac4k9Uu6IOOuLKuYIqmFZtBfyi1c0+f2WFlzEIPR93fz4LWaH2ZD5rs
	djND4Gv2/HDUijcpXg7EavMip6DpPeKVyWj6Phelv/5gZ59lc1b1PVgmeMy3Ec/dEmCK
	ioBA==
Received: by 10.180.89.9 with SMTP id bk9mr2938271wib.11.1335536789572;
	Fri, 27 Apr 2012 07:26:29 -0700 (PDT)
Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
	[85.127.86.115])
	by mx.google.com with ESMTPS id gd4sm7969545wib.6.2012.04.27.07.26.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Apr 2012 07:26:29 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.77)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SNm7v-0000QH-BK; Fri, 27 Apr 2012 16:26:27 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Apr 2012 16:26:25 +0200
Message-Id: <1335536785-1585-5-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1335536785-1585-1-git-send-email-rep.dot.nop@gmail.com>
References: <1335536785-1585-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 5/5] runqemu: minor tweaks
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
X-List-Received-Date: Fri, 27 Apr 2012 14:36:07 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 scripts/runqemu |   40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 231b1bf..000d93a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -104,21 +104,19 @@ while [ $i -le $# ]; do
                 error "conflicting FSTYPE types [$FSTYPE] and [$arg]"
             ;;
         *-image*)
-            if [ -z "$ROOTFS" ]; then
-                if [ -f "$arg" ]; then
-                    process_filename $arg
-                elif [ -d "$arg" ]; then
-                    # Handle the case where the nfsroot dir has -image-
-                    # in the pathname
-                    echo "Assuming $arg is an nfs rootfs"
-                    FSTYPE=nfs
-                    ROOTFS=$arg
-                else
-                    ROOTFS=$arg
-                    LAZY_ROOTFS="true"
-                fi
+            [ -z "$ROOTFS" ] || \
+		error "conflicting ROOTFS args [$ROOTFS] and [$arg]"
+            if [ -f "$arg" ]; then
+                process_filename $arg
+            elif [ -d "$arg" ]; then
+                # Handle the case where the nfsroot dir has -image-
+                # in the pathname
+                echo "Assuming $arg is an nfs rootfs"
+                FSTYPE=nfs
+                ROOTFS=$arg
             else
-                error "conflicting ROOTFS args [$ROOTFS] and [$arg]"
+                ROOTFS=$arg
+                LAZY_ROOTFS="true"
             fi
             ;;
         "nographic")
@@ -144,14 +142,15 @@ while [ $i -le $# ]; do
             ;;
         "audio")
             if [ "x$MACHINE" = "xqemux86" -o "x$MACHINE" = "xqemux86-64" ]; then
-                echo "Enable audio on qemu. Pls. install snd_intel8x0 or snd_ens1370 driver in linux guest.";
+                echo "Enabling audio in qemu."
+                echo "Please install snd_intel8x0 or snd_ens1370 driver in linux guest."
                 QEMU_AUDIO_DRV="alsa"
                 SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -soundhw ac97,es1370"
             fi
             ;;
         "kvm")
             KVM_ENABLED="yes"
-            KVM_CAPABLE=`grep 'vmx\|smx' /proc/cpuinfo`
+            KVM_CAPABLE=`grep -q 'vmx\|smx' /proc/cpuinfo && echo 1`
             ;;
         *)
             # A directory name is an nfs rootfs
@@ -190,7 +189,8 @@ YOCTO_KVM_WIKI="https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qe
 # Detect KVM configuration
 if [ "x$KVM_ENABLED" = "xyes" ]; then
     if [ -z "$KVM_CAPABLE" ]; then
-        echo "You are tring to enable KVM on cpu without VT support. Remove kvm from the command-line, or refer";
+        echo "You are trying to enable KVM on a cpu without VT support."
+        echo "Remove kvm from the command-line, or refer"
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
@@ -199,14 +199,16 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
         exit 1;
     fi
     if [ ! -e /dev/kvm ]; then
-        echo "Missing KVM device. Have you inserted kvm modules? Pls. refer";
+        echo "Missing KVM device. Have you inserted kvm modules?"
+        echo "For further help see"
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
     if 9<>/dev/kvm ; then
         SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm"
     else
-        echo "You have no rights on /dev/kvm. Pls. change the owndership as described at";
+        echo "You have no rights on /dev/kvm."
+        echo "Please change the ownership of this file as described at"
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
-- 
1.7.10



