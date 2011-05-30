Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3uy-0007ud-4M
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:58:09 +0200
Received: by mail-gw0-f47.google.com with SMTP id 11so1569218gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=HxBo8ovzNlBQBiJGNV1s8zzBJCLhZlzlwpZDKjFOKFk=;
	b=pQ2hNsKl26QW9lht5IJt9krlOtz4vIGex3EmeJdVZOJ9TDjZwOlICxVCECQixDtIQQ
	wlCpzt8JLKq9IL5fZcuoozfU+ESUJykdr4bHtxqBFpBXrXjBC4tBycVFwVvseKLszkSW
	jyPKh1tyrWoN6hJVzUm7i7MDnyabF5Cc43yZE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=mpLv+Dab4mRyeR+UQGCgMRRPtHscLn8s1e1ef2Xb5e6ceGSDf8cDyfGqvNL4foViNz
	sAf9V9PHcSc6tr7Od2jKJkyHbUa0imih4p9ktOQt+9T/AAKmEtNfhCyy1moDJ7AAwlUj
	fvHOuNGflcqjXEpdJBidGahjfLCogmVoQKgsI=
Received: by 10.236.66.35 with SMTP id g23mr6088364yhd.196.1306767301013;
	Mon, 30 May 2011 07:55:01 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.54.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:55:00 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:15 +0000
Message-Id: <1306767263-29895-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 09/17] initramfs-uniboot: be quiet and avoid code duplication
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
X-List-Received-Date: Mon, 30 May 2011 14:58:11 -0000

 * add getarg method to parse /proc/cmdline and return the option
   value;
 * refactor readargs to use getarg API;
 * avoid printing when 'quiet' boot param is used;

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/initrdscripts/files/init.sh            |   60 ++++++++++++++---------
 recipes/initrdscripts/initramfs-uniboot_1.0.bb |    2 +-
 2 files changed, 37 insertions(+), 25 deletions(-)

diff --git a/recipes/initrdscripts/files/init.sh b/recipes/initrdscripts/files/init.sh
index 26fd57f..00fec0d 100644
--- a/recipes/initrdscripts/files/init.sh
+++ b/recipes/initrdscripts/files/init.sh
@@ -3,6 +3,7 @@
 MODULE_DIR=/initrd.d
 BOOT_ROOT=
 ROOT_DEVICE=
+VERBOSE=
 
 early_setup() {
     mkdir -p /proc /sys /mnt /tmp
@@ -13,34 +14,45 @@ early_setup() {
     modprobe -q mtdblock
 }
 
+info() {
+	[ -n "$VERBOSE" ] && echo $*
+}
+
 dev_setup()
 {
-    echo -n "initramfs: Creating device nodes: "
+    info -n "initramfs: Creating device nodes: "
     grep '^ *[0-9]' /proc/partitions | while read major minor blocks dev
     do
         if [ ! -e /dev/$dev ]; then
-            echo -n "$dev "
+            info -n "$dev "
             [ -e /dev/$dev ] || mknod /dev/$dev b $major $minor
         fi
     done
-    echo
+    info
 }
 
-read_args() {
-    [ -z "$CMDLINE" ] && CMDLINE=`cat /proc/cmdline`
-    for arg in $CMDLINE; do
-        optarg=`expr "x$arg" : 'x[^=]*=\(.*\)'`
-        case $arg in
-            root=*)
-                ROOT_DEVICE=$optarg ;;
-            rootfstype=*)
-                ROOT_FSTYPE=$optarg ;;
-            rootdelay=*)
-                rootdelay=$optarg ;;
-            debug) set -x ;;
-            shell) sh ;;
-        esac
+getarg() {
+    local o
+
+    [ -z "$cmdline" ] && cmdline=`cat /proc/cmdline`
+    for o in $cmdline; do
+        test "$o" = "$1" && return 0
+        if test "${o%%=*}" = "${1%=}"; then
+            echo ${o#*=}
+            return 0
+        fi
     done
+    return 1
+}
+
+read_args() {
+	ROOT_DEVICE=$(getarg root=)
+	ROOTFS_TYPE=$(getarg rootfstype=)
+	rootdelay=$(getarg rootdelay=)
+
+	getarg debug && set -x
+	getarg quiet || VERBOSE=1
+	getarg shell && sh
 }
 
 do_depmod() {
@@ -49,7 +61,7 @@ do_depmod() {
 
 load_module() {
     # Cannot redir to $CONSOLE here easily - may not be set yet
-    echo "initramfs: Loading $module module"
+    info "initramfs: Loading $module module"
     source $1
 }
 
@@ -71,22 +83,22 @@ fatal() {
 }
 
 
-echo "Starting initramfs boot..."
 early_setup
+read_args
+
+info "Starting initramfs boot..."
 load_modules '0*'
 do_depmod
 
 [ -z "$CONSOLE" ] && CONSOLE="/dev/console"
 
-read_args
-
 if [ -z "$rootdelay" ]; then
-    echo "rootdelay parameter was not passed on kernel command line - assuming 2s delay"
-    echo "If you would like to avoid this delay, pass explicit rootdelay=0"
+    info "rootdelay parameter was not passed on kernel command line - assuming 2s delay"
+    info "If you would like to avoid this delay, pass explicit rootdelay=0"
     rootdelay="2"
 fi
 if [ -n "$rootdelay" ]; then
-    echo "Waiting $rootdelay seconds for devices to settle..." >$CONSOLE
+    info "Waiting $rootdelay seconds for devices to settle..." >$CONSOLE
     sleep $rootdelay
 fi
 
diff --git a/recipes/initrdscripts/initramfs-uniboot_1.0.bb b/recipes/initrdscripts/initramfs-uniboot_1.0.bb
index 79650aa..e90d268 100644
--- a/recipes/initrdscripts/initramfs-uniboot_1.0.bb
+++ b/recipes/initrdscripts/initramfs-uniboot_1.0.bb
@@ -1,5 +1,5 @@
 SRC_URI = "file://init.sh"
-PR = "r12"
+PR = "r13"
 DESCRIPTION = "A modular initramfs init script system."
 RRECOMMENDS_${PN} = "kernel-module-mtdblock"
 
-- 
1.7.1



