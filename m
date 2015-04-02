Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9A08665C9C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 15:23:03 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YdgxV-00061y-0M from Dmitry_Eremin@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2015 08:23:05 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Thu, 2 Apr 2015 16:23:03 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Apr 2015 18:23:01 +0300
Message-ID: <1427988182-26274-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH 1/2] initramfs-debug: add simple init script for debugging
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
X-List-Received-Date: Thu, 02 Apr 2015 15:23:03 -0000
Content-Type: text/plain

Add a tiny simple debug script that will mount all available virtual
file systems and then execute a shell.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 .../recipes-bsp/initrdscripts/files/init-debug.sh  | 31 ++++++++++++++++++++++
 .../initrdscripts/initramfs-debug_1.0.bb           | 14 ++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-initramfs/recipes-bsp/initrdscripts/files/init-debug.sh
 create mode 100644 meta-initramfs/recipes-bsp/initrdscripts/initramfs-debug_1.0.bb

diff --git a/meta-initramfs/recipes-bsp/initrdscripts/files/init-debug.sh b/meta-initramfs/recipes-bsp/initrdscripts/files/init-debug.sh
new file mode 100644
index 0000000..7edbd70
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/initrdscripts/files/init-debug.sh
@@ -0,0 +1,31 @@
+#!/bin/sh
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+
+do_mount_fs() {
+	grep -q "$1" /proc/filesystems || return
+	test -d "$2" || mkdir -p "$2"
+	mount -t "$1" "$1" "$2"
+}
+
+do_mknod() {
+	test -e "$1" || mknod "$1" "$2" "$3" "$4"
+}
+
+mkdir -p /proc
+mount -t proc proc /proc
+
+do_mount_fs sysfs /sys
+do_mount_fs debugfs /sys/kernel/debug
+do_mount_fs devtmpfs /dev
+do_mount_fs devpts /dev/pts
+do_mount_fs tmpfs /dev/shm
+
+mkdir -p /run
+mkdir -p /var/run
+
+do_mknod /dev/console c 5 1
+do_mknod /dev/null c 1 3
+do_mknod /dev/zero c 1 5
+
+exec sh </dev/console >/dev/console 2>/dev/console 
diff --git a/meta-initramfs/recipes-bsp/initrdscripts/initramfs-debug_1.0.bb b/meta-initramfs/recipes-bsp/initrdscripts/initramfs-debug_1.0.bb
new file mode 100644
index 0000000..b7defff
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/initrdscripts/initramfs-debug_1.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Extremely basic live image init script"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+SRC_URI = "file://init-debug.sh"
+
+S = "${WORKDIR}"
+
+do_install() {
+        install -m 0755 ${WORKDIR}/init-debug.sh ${D}/init
+}
+
+inherit allarch
+
+FILES_${PN} += " /init "
-- 
2.1.4


