Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R1Inr-0004r1-Cm
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 16:08:35 +0200
Received: by mail-bw0-f47.google.com with SMTP id zu17so214337bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=A0v/mjRxrJIn+cXySWRY264LccAG+nJ3DRfx7uPPjtk=;
	b=FbdpXgzV5QJNmUd9gHRtaukiezAE0IybSpoL3mra6Og2KNFvjoHnlFD3HD6NVzGQt5
	mzD1ds5DiKpDHoPpYs1FyUkBnHoahnhkHp6+A1ds1ga02Zdq/fNLKTU2f5aznX0xHlij
	JY4B3shYr+6rLxUhgf8vrZ3wWlUe3Q5mQCWKA=
Received: by 10.204.150.203 with SMTP id z11mr152205bkv.237.1315404215232;
	Wed, 07 Sep 2011 07:03:35 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l11sm440069bkb.1.2011.09.07.07.03.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 07:03:34 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 18:03:07 +0400
Message-Id: <1315404187-18176-13-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
References: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld 12/12] linux.inc: clean up handling of config variables
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
X-List-Received-Date: Wed, 07 Sep 2011 14:08:36 -0000

Provide a simple way to set a kernel config variable, ignore original
value from defconfig, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-kernel/linux/linux.inc |  141 +++++++++++++++++-----------------------
 1 files changed, 59 insertions(+), 82 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index d08cf5a..7a25b59 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -22,94 +22,76 @@ LOGO_SIZE ?= "."
 
 LOCALVERSION ?= ""
 
+#kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\""
+kernel_conf_variable() {
+	CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1/d;"
+	if test "$2" = "n"
+	then
+		echo "# CONFIG_$1 is not set" >> ${S}/.config
+	else
+		echo "CONFIG_$1=$2" >> ${S}/.config
+	fi
+}
+
 do_configure_prepend() {
         echo "" > ${S}/.config
+	CONF_SED_SCRIPT=""
 
         #
         # logo support, if you supply logo_linux_clut224.ppm in SRC_URI, then it's going to be used
         #
         if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
                 install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm drivers/video/logo/logo_linux_clut224.ppm
-                echo "CONFIG_LOGO=y"                    >> ${S}/.config
-                echo "CONFIG_LOGO_LINUX_CLUT224=y"      >> ${S}/.config
+		kernel_conf_variable LOGO y
+		kernel_conf_variable LOGO_LINUX_CLUT224 y
         fi
 
         #
         # oabi / eabi support
         #
-	echo "CONFIG_AEABI=y"                   >> ${S}/.config
+	kernel_conf_variable AEABI y
 	if [ "${ARM_KEEP_OABI}" = "1" ] ; then
-		echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
+		kernel_conf_variable OABI_COMPAT y
 	else
-		echo "# CONFIG_OABI_COMPAT is not set"  >> ${S}/.config
+		kernel_conf_variable OABI_COMPAT n
 	fi
 
         # When enabling thumb for userspace we also need thumb support in the kernel
         if [ "${ARM_INSTRUCTION_SET}" = "thumb" ] ; then
-            sed -i -e /CONFIG_ARM_THUMB/d ${WORKDIR}/defconfig 
-            echo "CONFIG_ARM_THUMB=y" >> ${S}/.config
+		kernel_conf_variable ARM_THUMB y
         fi
 
-        echo "CONFIG_CMDLINE=\"${CMDLINE} ${CMDLINE_DEBUG}\"" >> ${S}/.config
-
-        sed -e '/CONFIG_AEABI/d' \
-            -e '/CONFIG_OABI_COMPAT=/d' \
-            -e '/CONFIG_CMDLINE=/d' \
-            -e '/CONFIG_CPU_BIG_ENDIAN/d' \
-            -e '/CONFIG_LOGO=/d' \
-            -e '/CONFIG_LOGO_LINUX_CLUT224=/d' \
-            -e '/CONFIG_LOCALVERSION/d' \
-            -e '/CONFIG_LOCALVERSION_AUTO/d' \
-	    < '${WORKDIR}/defconfig' >>'${S}/.config'
-
-        echo 'CONFIG_LOCALVERSION="${LOCALVERSION}"' >>${S}/.config
-        echo '# CONFIG_LOCALVERSION_AUTO is not set' >>${S}/.config
-
-        # Newer versions of udev mandate that sysfs doesn't have deprecated entries
-        sed -e /CONFIG_SYSFS_DEPRECATED/d \
-                -e /CONFIG_SYSFS_DEPRECATED_V2/d \
-                -e /CONFIG_HOTPLUG/d \
-                -e /CONFIG_UEVENT_HELPER_PATH/d \
-                -e /CONFIG_UNIX/d \
-                -e /CONFIG_SYSFS/d \
-                -e /CONFIG_PROC_FS/d \
-                -e /CONFIG_TMPFS/d \
-                -e /CONFIG_INOTIFY_USER/d \
-                -e /CONFIG_SIGNALFD/d \
-                -e /CONFIG_TMPFS_POSIX_ACL/d \
-                -e /CONFIG_BLK_DEV_BSG/d \
-                -i '${S}/.config'
-
-        echo '# CONFIG_SYSFS_DEPRECATED is not set' >> ${S}/.config
-        echo '# CONFIG_SYSFS_DEPRECATED_V2 is not set' >> ${S}/.config
-        echo 'CONFIG_HOTPLUG=y' >> ${S}/.config
-        echo 'CONFIG_UEVENT_HELPER_PATH=""' >> ${S}/.config
-        echo 'CONFIG_UNIX=y' >> ${S}/.config
-        echo 'CONFIG_SYSFS=y' >> ${S}/.config
-        echo 'CONFIG_PROC_FS=y' >> ${S}/.config
-        echo 'CONFIG_TMPFS=y' >> ${S}/.config
-        echo 'CONFIG_INOTIFY_USER=y' >> ${S}/.config
-        echo 'CONFIG_SIGNALFD=y' >> ${S}/.config
-        echo 'CONFIG_TMPFS_POSIX_ACL=y' >> ${S}/.config
-        echo 'CONFIG_BLK_DEV_BSG=y' >> ${S}/.config
-        echo 'CONFIG_DEVTMPFS=y' >> ${S}/.config
-        echo 'CONFIG_DEVTMPFS_MOUNT=y' >> ${S}/.config
+	kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\""
+
+	kernel_conf_variable LOCALVERSION "\"${LOCALVERSION}\""
+	kernel_conf_variable LOCALVERSION_AUTO n
+
+	kernel_conf_variable SYSFS_DEPRECATED n
+	kernel_conf_variable SYSFS_DEPRECATED_V2 n
+        kernel_conf_variable HOTPLUG y
+        kernel_conf_variable UEVENT_HELPER_PATH \"\"
+        kernel_conf_variable UNIX y
+        kernel_conf_variable SYSFS y
+        kernel_conf_variable PROC_FS y
+        kernel_conf_variable TMPFS y
+        kernel_conf_variable INOTIFY_USER y
+        kernel_conf_variable SIGNALFD y
+        kernel_conf_variable TMPFS_POSIX_ACL y
+        kernel_conf_variable BLK_DEV_BSG y
+        kernel_conf_variable DEVTMPFS y
+        kernel_conf_variable DEVTMPFS_MOUNT y
 
         # Newer inits like systemd need cgroup support
         if [ "${KERNEL_ENABLE_CGROUPS}" = "1" ] ; then
-            sed -e /CONFIG_CGROUP_SCHED/d \
-                -e /CONFIG_CGROUPS/d \
-                -i '${S}/.config'
-            
-            echo 'CONFIG_CGROUP_SCHED=y' >> ${S}/.config
-            echo 'CONFIG_CGROUPS=y' >> ${S}/.config
-            echo 'CONFIG_CGROUP_NS=y' >> ${S}/.config
-            echo 'CONFIG_CGROUP_FREEZER=y' >> ${S}/.config
-            echo 'CONFIG_CGROUP_DEVICE=y' >> ${S}/.config
-            echo 'CONFIG_CPUSETS=y' >> ${S}/.config
-            echo 'CONFIG_PROC_PID_CPUSET=y' >> ${S}/.config
-            echo 'CONFIG_CGROUP_CPUACCT=y' >> ${S}/.config
-            echo 'CONFIG_RESOURCE_COUNTERS=y' >> ${S}/.config
+            kernel_conf_variable CGROUP_SCHED y
+            kernel_conf_variable CGROUPS y
+            kernel_conf_variable CGROUP_NS y
+            kernel_conf_variable CGROUP_FREEZER y
+            kernel_conf_variable CGROUP_DEVICE y
+            kernel_conf_variable CPUSETS y
+            kernel_conf_variable PROC_PID_CPUSET y
+            kernel_conf_variable CGROUP_CPUACCT y
+            kernel_conf_variable RESOURCE_COUNTERS y
         fi
 
         #
@@ -118,25 +100,20 @@ do_configure_prepend() {
         #
         if [ ! -z "${CMDLINE_NFSROOT_USB}" ]; then
                 bbnote "Configuring the kernel for root-over-nfs-over-usb-eth with CMDLINE ${CMDLINE_NFSROOT_USB}"
-                sed -e '/CONFIG_INET/d' \
-                    -e '/CONFIG_IP_PNP=/d' \
-                    -e '/CONFIG_USB_GADGET=/d' \
-                    -e '/CONFIG_USB_GADGET_SELECTED=/d' \
-                    -e '/CONFIG_USB_ETH=/d' \
-                    -e '/CONFIG_NFS_FS=/d' \
-                    -e '/CONFIG_ROOT_NFS=/d' \
-                    -e '/CONFIG_CMDLINE=/d' \
-                    -i ${S}/.config
-                echo "CONFIG_INET=y"                     >> ${S}/.config
-                echo "CONFIG_IP_PNP=y"                   >> ${S}/.config
-                echo "CONFIG_USB_GADGET=y"               >> ${S}/.config
-                echo "CONFIG_USB_GADGET_SELECTED=y"      >> ${S}/.config
-                echo "CONFIG_USB_ETH=y"                  >> ${S}/.config
-                echo "CONFIG_NFS_FS=y"                   >> ${S}/.config
-                echo "CONFIG_ROOT_NFS=y"                 >> ${S}/.config
-                echo "CONFIG_CMDLINE=\"${CMDLINE_NFSROOT_USB} ${CMDLINE_DEBUG}\"" >> ${S}/.config
+                kernel_conf_variable INET y
+                kernel_conf_variable IP_PNP y
+                kernel_conf_variable USB_GADGET y
+                kernel_conf_variable USB_GADGET_SELECTED y
+                kernel_conf_variable USB_ETH y
+                kernel_conf_variable NFS_FS y
+                kernel_conf_variable ROOT_NFS y
+                kernel_conf_variable CMDLINE \"${CMDLINE_NFSROOT_USB} ${CMDLINE_DEBUG}\"
         fi
-		yes '' | oe_runmake oldconfig
+
+        sed -e "${CONF_SED_SCRIPT}" \
+		< '${WORKDIR}/defconfig' >>'${S}/.config'
+
+	yes '' | oe_runmake oldconfig
 }
 
 do_configure_append() {
-- 
1.7.2.5



