Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRrtL-0007YO-Gm
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 22:19:48 +0200
Received: by gwb11 with SMTP id 11so84913gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 13:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=x2H7ifsjQ7Ub+S3s1tJFrBAnn9xsZmGs+9DrtzBQnhY=;
	b=S4H9U6F9keh+Qt3HoL39Y+EMEq117vOlaHy4QEIC47AWjKi2uy134sWxHldCgqVoNk
	uBvI5/IMaJWg9cb0w6wgtlhbzDi1XZzFBHw7RTBv5WQ19slhrhMs325kBQgHa9F+KDD6
	cAKCuxKUZ1OMXRh8soZc9G4wyYRysnRPC6yc4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=SPv7XZQypr0gGQdgOtbaK9Ob4Ctjwk1Im30RXyKa6xAwGfPxtyeRawuU4ZiA4lVMuF
	qkAD296gZ7Jy7eN5VUbZVtpp0ZH/LnfFVxs1nd43UmzBfm3CqNph1xIvLBNHYkthFUHX
	66VmwZtEHqxgikW6kvL8O6iBIkJDwmRNMKTig=
Received: by 10.236.175.99 with SMTP id y63mr10254558yhl.155.1306959395922;
	Wed, 01 Jun 2011 13:16:35 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id t43sm1478016yhm.70.2011.06.01.13.16.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 13:16:34 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jun 2011 20:16:13 +0000
Message-Id: <ebdf8fe6846253d74f1260d65894c54d7e8146c1.1306959338.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306959338.git.otavio@ossystems.com.br>
References: <cover.1306959338.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306959338.git.otavio@ossystems.com.br>
References: <cover.1306959338.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/5] udev-extra-rules: refactor mount.sh script
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
X-List-Received-Date: Wed, 01 Jun 2011 20:19:48 -0000

Avoids a fork for using cat and do a whitespace cleanup.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/udev/udev-extra-rules.bb      |    2 +-
 .../recipes-core/udev/udev-extra-rules/mount.sh    |   28 +++++++------------
 2 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev-extra-rules.bb b/meta-oe/recipes-core/udev/udev-extra-rules.bb
index f114b1a..dfd4080 100644
--- a/meta-oe/recipes-core/udev/udev-extra-rules.bb
+++ b/meta-oe/recipes-core/udev/udev-extra-rules.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Extra udev rules"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = " \
        file://automount.rules \
diff --git a/meta-oe/recipes-core/udev/udev-extra-rules/mount.sh b/meta-oe/recipes-core/udev/udev-extra-rules/mount.sh
index 81bcfba..67c2b4b 100644
--- a/meta-oe/recipes-core/udev/udev-extra-rules/mount.sh
+++ b/meta-oe/recipes-core/udev/udev-extra-rules/mount.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 #
 # Called from udev
-# Attemp to mount any added block devices 
+# Attemp to mount any added block devices
 # and remove any removed devices
 #
 
@@ -10,7 +10,7 @@ PMOUNT="/usr/bin/pmount"
 UMOUNT="/bin/umount"
 name="`basename "$DEVNAME"`"
 
-for line in `cat /etc/udev/mount.blacklist | grep -v ^#`
+for line in `grep -v ^# /etc/udev/mount.blacklist`
 do
 	if ( echo "$DEVNAME" | grep -q "$line" )
 	then
@@ -19,9 +19,9 @@ do
 	fi
 done
 
-automount() {	
+automount() {
 	! test -d "/media/$name" && mkdir -p "/media/$name"
-	
+
 	if ! $MOUNT -t auto -o async,relatime $DEVNAME "/media/$name"
 	then
 		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
@@ -31,7 +31,7 @@ automount() {
 		touch "/tmp/.automount-$name"
 	fi
 }
-	
+
 rm_dir() {
 	# We do not want to rm -r populated directories
 	if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
@@ -46,27 +46,19 @@ if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ]; then
 	if [ -x "$PMOUNT" ]; then
 		$PMOUNT $DEVNAME 2> /dev/null
 	elif [ -x $MOUNT ]; then
-    		$MOUNT $DEVNAME 2> /dev/null
+			$MOUNT $DEVNAME 2> /dev/null
 	fi
-	
-	# If the device isn't mounted at this point, it isn't configured in fstab
-	# 20061107: Small correction: The rootfs partition may be called just "rootfs" and not by
-	# 	    its true device name so this would break. If the rootfs is mounted on two places
-	#	    during boot, it confuses the heck out of fsck. So Im auto-adding the root-partition
-	#	    to /etc/udev/mount.blacklist via postinst 
 
-	cat /proc/mounts | awk '{print $1}' | grep -q "^$DEVNAME$" || automount 
-	
+	# Avoid remounting devices (e.g: rootfs)
+	awk '{print $1}' /proc/mounts | grep -q "^$DEVNAME$" || automount
 fi
 
-
-
 if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
-	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
+	for mnt in `grep "$DEVNAME" /proc/mounts | cut -f 2 -d " " `
 	do
 		$UMOUNT -l $mnt
 	done
-	
+
 	# Remove empty directories from auto-mounter
 	test -e "/tmp/.automount-$name" && rm_dir "/media/$name"
 fi
-- 
1.7.2.5



