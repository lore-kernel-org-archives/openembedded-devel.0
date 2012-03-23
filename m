Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4J5-0002dA-Vx
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 14:13:28 +0100
Received: by mail-wg0-f43.google.com with SMTP id dr12so1857378wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 06:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=KWIVXGTUYhcv0C3TBmpE5EAFLeXfDN8dYAMp6GaGeiI=;
	b=eI+Nh66wGo2h+Br2ChE+6feXY4deZCVfAnQAi1X9JRw9Ma82Cj3cJnnwsECBRrUpJK
	+UQ2d6crviXwYxL9uvGEht7AHj0BIYyqi0wro37fvsLRqj2sLvcxUgm/CKyFsr3imoWC
	0X88iW4yPxjMk6+z9O9W7hzp+KmI89arCCLlPhCEqTbMm3DYserJTOIslYRREEXLwd4w
	Tip0Tc4fzeUR80W5M2XLP3gNk2Csfjf5otFbcnZWOoPgHNyt3S8y1JFS1IGd4ZmvpR9g
	4AldV+JWYgTdHdfaRfWPlTEuuAucfpYC3HAaA5w1/7LSdH+fb01Pv+ufSDJLSDGXwd61
	Dbbw==
Received: by 10.180.89.9 with SMTP id bk9mr6396519wib.11.1332507874207;
	Fri, 23 Mar 2012 06:04:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm22877081wib.0.2012.03.23.06.04.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 06:04:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 14:04:12 +0100
Message-Id: <b16115c16837e5aa6a3ad556a37832192c128f43.1332507730.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <3fca50b933c63bab6cff938db607bcecde86fd3d.1332507730.git.Martin.Jansa@gmail.com>
References: <3fca50b933c63bab6cff938db607bcecde86fd3d.1332507730.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332507730.git.Martin.Jansa@gmail.com>
References: <cover.1332507730.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/5] linux: import shared linux.inc so we have just one copy
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
X-List-Received-Date: Fri, 23 Mar 2012 13:13:28 -0000

* in my env I have 7 copies now
  ./meta-smartphone/meta-htc/recipes-kernel/linux/linux.inc
  ./meta-smartphone/meta-nokia/recipes-kernel/linux/linux.inc
  ./meta-smartphone/meta-openmoko/recipes-kernel/linux/linux.inc
  ./meta-smartphone/meta-samsung/recipes-kernel/linux/linux.inc
  ./meta-smartphone/meta-palm/recipes-kernel/linux/linux.inc
  ./meta-ti/recipes-kernel/linux/linux.inc
  ./meta-handheld/recipes-kernel/linux/linux.inc
  meta-smartphone's are 100% identical, meta-handheld is slightly
  different (ARM_KEEP_OABI can be set in recipe after require .inc) and
  meta-ti seems like much older version of linux.inc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-kernel/linux/linux.inc |  131 ++++++++++++++++++++++++++++++++
 1 files changed, 131 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/linux/linux.inc

diff --git a/meta-oe/recipes-kernel/linux/linux.inc b/meta-oe/recipes-kernel/linux/linux.inc
new file mode 100644
index 0000000..2b2fbf3
--- /dev/null
+++ b/meta-oe/recipes-kernel/linux/linux.inc
@@ -0,0 +1,131 @@
+DESCRIPTION = "Linux Kernel"
+SECTION = "kernel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+INC_PR = "r0"
+
+inherit kernel siteinfo
+
+# Enable OABI compat for people stuck with obsolete userspace
+ARM_KEEP_OABI ?= "0"
+
+# Set the verbosity of kernel messages during runtime
+# You can define CMDLINE_DEBUG in your local.conf or distro.conf to override this behaviour
+CMDLINE_DEBUG ?= "loglevel=3"
+
+# Kernel bootlogo is distro-specific (default is OE logo).
+# Logo resolution (qvga, vga, ...) is machine-specific.
+LOGO_SIZE ?= '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen", "vga", "qvga", d)}'
+# To use this, add file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 or similar
+# to your kernel recipe, and then structure your logos for each resolution
+# accordingly.
+
+LOCALVERSION ?= ""
+
+#kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\""
+kernel_conf_variable() {
+	CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1[ =]/d;"
+	if test "$2" = "n"
+	then
+		echo "# CONFIG_$1 is not set" >> ${S}/.config
+	else
+		echo "CONFIG_$1=$2" >> ${S}/.config
+	fi
+}
+
+do_configure_prepend() {
+        echo "" > ${S}/.config
+	CONF_SED_SCRIPT=""
+
+        #
+        # logo support, if you supply logo_linux_clut224.ppm in SRC_URI, then it's going to be used
+        #
+        if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
+                install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm drivers/video/logo/logo_linux_clut224.ppm
+		kernel_conf_variable LOGO y
+		kernel_conf_variable LOGO_LINUX_CLUT224 y
+        fi
+
+        #
+        # oabi / eabi support
+        #
+	kernel_conf_variable AEABI y
+	if [ "${ARM_KEEP_OABI}" = "1" ] ; then
+		kernel_conf_variable OABI_COMPAT y
+	else
+		kernel_conf_variable OABI_COMPAT n
+	fi
+
+        # When enabling thumb for userspace we also need thumb support in the kernel
+        if [ "${ARM_INSTRUCTION_SET}" = "thumb" ] ; then
+		kernel_conf_variable ARM_THUMB y
+        fi
+
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
+
+        # Newer inits like systemd need cgroup support
+        if [ "${KERNEL_ENABLE_CGROUPS}" = "1" ] ; then
+            kernel_conf_variable CGROUP_SCHED y
+            kernel_conf_variable CGROUPS y
+            kernel_conf_variable CGROUP_NS y
+            kernel_conf_variable CGROUP_FREEZER y
+            kernel_conf_variable CGROUP_DEVICE y
+            kernel_conf_variable CPUSETS y
+            kernel_conf_variable PROC_PID_CPUSET y
+            kernel_conf_variable CGROUP_CPUACCT y
+            kernel_conf_variable RESOURCE_COUNTERS y
+        fi
+
+        #
+        # root-over-nfs-over-usb-eth support. Limited, but should cover some cases.
+        # Enable this by setting a proper CMDLINE_NFSROOT_USB.
+        #
+        if [ ! -z "${CMDLINE_NFSROOT_USB}" ]; then
+                bbnote "Configuring the kernel for root-over-nfs-over-usb-eth with CMDLINE ${CMDLINE_NFSROOT_USB}"
+                kernel_conf_variable INET y
+                kernel_conf_variable IP_PNP y
+                kernel_conf_variable USB_GADGET y
+                kernel_conf_variable USB_GADGET_SELECTED y
+                kernel_conf_variable USB_ETH y
+                kernel_conf_variable NFS_FS y
+                kernel_conf_variable ROOT_NFS y
+                kernel_conf_variable CMDLINE \"${CMDLINE_NFSROOT_USB} ${CMDLINE_DEBUG}\"
+        fi
+
+        sed -e "${CONF_SED_SCRIPT}" \
+		< '${WORKDIR}/defconfig' >>'${S}/.config'
+
+	yes '' | oe_runmake oldconfig
+}
+
+do_configure_append() {
+        if test -e scripts/Makefile.fwinst ; then
+		sed -i -e "s:-m0644:-m 0644:g" scripts/Makefile.fwinst
+	fi
+}
+
+do_install_append() {
+	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix}/src/linux-${KERNEL_VERSION} ARCH=$ARCH
+}
+
+PACKAGES =+ "kernel-headers"
+FILES_kernel-headers = "${exec_prefix}/src/linux*"
-- 
1.7.8.5



