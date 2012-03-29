Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SD96e-0000LS-Rv
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 08:45:12 +0200
Received: by mail-ey0-f175.google.com with SMTP id e1so616603eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 23:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=UCaejHiE+TPU0se8oKdxeFA2LwpihxSprZz1vUkkcyc=;
	b=KOtNV7UNsB5rDufkSeLauVKevQCWXnioCdDgvK665VOXBjSDMhXpuNAcFEkPwBl9WF
	rOlk7Trg39IgBUiFhjjghaNpgp778GLqqjA2RMFdoWkDBTrS9KJZ/AGXXWaOXI99DmQx
	YKbvWxvF8/OL7Ecj5UawlR38g2IRflWk7sZ1M6MQTj7yNcH2L71OJvVhJT+0/MqEnLSw
	Rj0iLEZ1jcYOfrh83bsItpFYHqj0IQCmMq6qeeZld5j6Atx57S0dZ3lQ07VIApdWa8iG
	ga180Cz8SJmxWVXph+MZ5UkOhWU/TKC9m6bWe2iArvhWZkYDrfUC+HAuu2RTfkQLt4KE
	a5XA==
Received: by 10.180.102.129 with SMTP id fo1mr2532765wib.6.1333002972141;
	Wed, 28 Mar 2012 23:36:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 17sm2996728wis.0.2012.03.28.23.36.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 23:36:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Mar 2012 08:35:58 +0200
Message-Id: <3065bcbfb2b5c24a3e316375b0afbedadf265665.1333002899.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <082c61be8baa1e3b863ef083ff98ac97a6c594aa.1333002899.git.Martin.Jansa@gmail.com>
References: <082c61be8baa1e3b863ef083ff98ac97a6c594aa.1333002899.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1333002899.git.Martin.Jansa@gmail.com>
References: <cover.1333002899.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 2/2] recipes-kernel: use shared linux.inc from meta-oe
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
X-List-Received-Date: Thu, 29 Mar 2012 06:45:12 -0000

* notice that ARM_KEEP_OABI default value is now 0 instead of 1
  but only linux-hackndev and linux-handhelds-2.6-2.6.21 had
  CONFIG_OABI_COMPAT=y in defconfigs so this shouldn't change anything

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux.inc             |  130 ----------------------------
 recipes-kernel/linux/linux_2.6.29.bb       |    2 +-
 recipes-kernel/linux/linux_3.0.1.bb        |    2 +-
 recipes-kernel/linux/linux_3.1.bb          |    2 +-
 recipes-kernel/linux/linux_3.2.bb          |    2 +-
 recipes-kernel/linux/linux_git.bb          |    2 +-
 recipes-kernel/linux/openezx-kernel_git.bb |    2 +-
 7 files changed, 6 insertions(+), 136 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux.inc

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
deleted file mode 100644
index f920b84..0000000
--- a/recipes-kernel/linux/linux.inc
+++ /dev/null
@@ -1,130 +0,0 @@
-DESCRIPTION = "Linux Kernel"
-SECTION = "kernel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-INC_PR = "r0"
-
-inherit kernel siteinfo
-
-# Enable OABI compat for people stuck with obsolete userspace
-ARM_KEEP_OABI ?= "1"
-
-# Set the verbosity of kernel messages during runtime
-# You can define CMDLINE_DEBUG in your local.conf or distro.conf to override this behaviour
-CMDLINE_DEBUG ?= "loglevel=3"
-
-# Kernel bootlogo is distro-specific (default is OE logo).
-# Logo resolution (qvga, vga, ...) is machine-specific.
-LOGO_SIZE ?= '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen", "vga", "qvga", d)}'
-# To use this, add file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 or similar
-# to your kernel recipe, and then structure your logos for each resolution
-# accordingly.
-
-LOCALVERSION ?= ""
-
-kernel_conf_variable() {
-	CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1[ =]/d;"
-	if test "$2" = "n"
-	then
-		echo "# CONFIG_$1 is not set" >> ${S}/.config
-	else
-		echo "CONFIG_$1=$2" >> ${S}/.config
-	fi
-}
-
-do_configure_prepend() {
-        echo "" > ${S}/.config
-	CONF_SED_SCRIPT=""
-
-        #
-        # logo support, if you supply logo_linux_clut224.ppm in SRC_URI, then it's going to be used
-        #
-        if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
-                install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm drivers/video/logo/logo_linux_clut224.ppm
-		kernel_conf_variable LOGO y
-		kernel_conf_variable LOGO_LINUX_CLUT224 y
-        fi
-
-        #
-        # oabi / eabi support
-        #
-	kernel_conf_variable AEABI y
-	if [ "${ARM_KEEP_OABI}" = "1" ] ; then
-		kernel_conf_variable OABI_COMPAT y
-	else
-		kernel_conf_variable OABI_COMPAT n
-	fi
-
-        # When enabling thumb for userspace we also need thumb support in the kernel
-        if [ "${ARM_INSTRUCTION_SET}" = "thumb" ] ; then
-		kernel_conf_variable ARM_THUMB y
-        fi
-
-	kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\""
-
-	kernel_conf_variable LOCALVERSION "\"${LOCALVERSION}\""
-	kernel_conf_variable LOCALVERSION_AUTO n
-
-	kernel_conf_variable SYSFS_DEPRECATED n
-	kernel_conf_variable SYSFS_DEPRECATED_V2 n
-        kernel_conf_variable HOTPLUG y
-        kernel_conf_variable UEVENT_HELPER_PATH \"\"
-        kernel_conf_variable UNIX y
-        kernel_conf_variable SYSFS y
-        kernel_conf_variable PROC_FS y
-        kernel_conf_variable TMPFS y
-        kernel_conf_variable INOTIFY_USER y
-        kernel_conf_variable SIGNALFD y
-        kernel_conf_variable TMPFS_POSIX_ACL y
-        kernel_conf_variable BLK_DEV_BSG y
-        kernel_conf_variable DEVTMPFS y
-        kernel_conf_variable DEVTMPFS_MOUNT y
-
-        # Newer inits like systemd need cgroup support
-        if [ "${KERNEL_ENABLE_CGROUPS}" = "1" ] ; then
-            kernel_conf_variable CGROUP_SCHED y
-            kernel_conf_variable CGROUPS y
-            kernel_conf_variable CGROUP_NS y
-            kernel_conf_variable CGROUP_FREEZER y
-            kernel_conf_variable CGROUP_DEVICE y
-            kernel_conf_variable CPUSETS y
-            kernel_conf_variable PROC_PID_CPUSET y
-            kernel_conf_variable CGROUP_CPUACCT y
-            kernel_conf_variable RESOURCE_COUNTERS y
-        fi
-
-        #
-        # root-over-nfs-over-usb-eth support. Limited, but should cover some cases.
-        # Enable this by setting a proper CMDLINE_NFSROOT_USB.
-        #
-        if [ ! -z "${CMDLINE_NFSROOT_USB}" ]; then
-                bbnote "Configuring the kernel for root-over-nfs-over-usb-eth with CMDLINE ${CMDLINE_NFSROOT_USB}"
-                kernel_conf_variable INET y
-                kernel_conf_variable IP_PNP y
-                kernel_conf_variable USB_GADGET y
-                kernel_conf_variable USB_GADGET_SELECTED y
-                kernel_conf_variable USB_ETH y
-                kernel_conf_variable NFS_FS y
-                kernel_conf_variable ROOT_NFS y
-                kernel_conf_variable CMDLINE \"${CMDLINE_NFSROOT_USB} ${CMDLINE_DEBUG}\"
-        fi
-
-        sed -e "${CONF_SED_SCRIPT}" \
-		< '${WORKDIR}/defconfig' >>'${S}/.config'
-
-	yes '' | oe_runmake oldconfig
-}
-
-do_configure_append() {
-        if test -e scripts/Makefile.fwinst ; then
-		sed -i -e "s:-m0644:-m 0644:g" scripts/Makefile.fwinst
-	fi
-}
-
-do_install_append() {
-	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix}/src/linux-${KERNEL_VERSION} ARCH=$ARCH
-}
-
-PACKAGES =+ "kernel-headers"
-FILES_kernel-headers = "${exec_prefix}/src/linux*"
diff --git a/recipes-kernel/linux/linux_2.6.29.bb b/recipes-kernel/linux/linux_2.6.29.bb
index e1da026..6640004 100644
--- a/recipes-kernel/linux/linux_2.6.29.bb
+++ b/recipes-kernel/linux/linux_2.6.29.bb
@@ -1,4 +1,4 @@
-require linux.inc
+require recipes-kernel/linux/linux.inc
 
 PR = "r0"
 
diff --git a/recipes-kernel/linux/linux_3.0.1.bb b/recipes-kernel/linux/linux_3.0.1.bb
index 38c5196..5eb44d1 100644
--- a/recipes-kernel/linux/linux_3.0.1.bb
+++ b/recipes-kernel/linux/linux_3.0.1.bb
@@ -1,4 +1,4 @@
-require linux.inc
+require recipes-kernel/linux/linux.inc
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/linux_3.1.bb
index 5e9a714..613f9e5 100644
--- a/recipes-kernel/linux/linux_3.1.bb
+++ b/recipes-kernel/linux/linux_3.1.bb
@@ -1,4 +1,4 @@
-require linux.inc
+require recipes-kernel/linux/linux.inc
 
 PR = "${INC_PR}.9"
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz|h1940)"
diff --git a/recipes-kernel/linux/linux_3.2.bb b/recipes-kernel/linux/linux_3.2.bb
index 5379870..2799ab4 100644
--- a/recipes-kernel/linux/linux_3.2.bb
+++ b/recipes-kernel/linux/linux_3.2.bb
@@ -1,4 +1,4 @@
-require linux.inc
+require recipes-kernel/linux/linux.inc
 
 PR = "${INC_PR}.4"
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
diff --git a/recipes-kernel/linux/linux_git.bb b/recipes-kernel/linux/linux_git.bb
index 222df31..f7425ee 100644
--- a/recipes-kernel/linux/linux_git.bb
+++ b/recipes-kernel/linux/linux_git.bb
@@ -1,4 +1,4 @@
-require linux.inc
+require recipes-kernel/linux/linux.inc
 
 PR = "${INC_PR}.0"
 COMPATIBLE_MACHINE = "spitz"
diff --git a/recipes-kernel/linux/openezx-kernel_git.bb b/recipes-kernel/linux/openezx-kernel_git.bb
index 03467d0..d48afa5 100644
--- a/recipes-kernel/linux/openezx-kernel_git.bb
+++ b/recipes-kernel/linux/openezx-kernel_git.bb
@@ -6,7 +6,7 @@ KV = "2.6.38-oe"
 PV = "${KV}+gitr${SRCREV}"
 PR = "r0"
 
-require linux.inc
+require recipes-kernel/linux/linux.inc
 
 # Make sure not to use thumb[-interworking]
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.5



