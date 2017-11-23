Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5299B786F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vANC9MTM025782
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Nov 2017 04:09:22 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:21 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:02 -0500
Message-ID: <450a951915c73d5460a2f8dba205336ede63da52.1511437793.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/15] meta-installer: add kernel config
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
X-List-Received-Date: Thu, 23 Nov 2017 12:09:22 -0000
Content-Type: text/plain

The set of kernel scc/cfg are required by target build and host build.

- For target build, add anaconda_support_kernel to KERNEL_CLASSES

- For host build, add anaconda_kernel to KERNEL_CLASSES

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-installer/classes/anaconda_kernel.bbclass            | 14 ++++++++++++++
 meta-installer/classes/anaconda_support_kernel.bbclass    |  8 ++++++++
 meta-installer/recipes-kernel/linux/files/crypt.cfg       |  2 ++
 meta-installer/recipes-kernel/linux/files/crypt.scc       |  1 +
 meta-installer/recipes-kernel/linux/files/dmthin.cfg      |  1 +
 meta-installer/recipes-kernel/linux/files/dmthin.scc      |  1 +
 meta-installer/recipes-kernel/linux/files/efivars.cfg     |  1 +
 meta-installer/recipes-kernel/linux/files/efivars.scc     |  1 +
 meta-installer/recipes-kernel/linux/files/ide.cfg         |  5 +++++
 meta-installer/recipes-kernel/linux/files/ide.scc         |  1 +
 meta-installer/recipes-kernel/linux/files/liveinstall.cfg |  5 +++++
 meta-installer/recipes-kernel/linux/files/liveinstall.scc |  1 +
 meta-installer/recipes-kernel/linux/files/multipath.cfg   |  3 +++
 meta-installer/recipes-kernel/linux/files/multipath.scc   |  1 +
 14 files changed, 45 insertions(+)
 create mode 100644 meta-installer/classes/anaconda_kernel.bbclass
 create mode 100644 meta-installer/classes/anaconda_support_kernel.bbclass
 create mode 100644 meta-installer/recipes-kernel/linux/files/crypt.cfg
 create mode 100644 meta-installer/recipes-kernel/linux/files/crypt.scc
 create mode 100644 meta-installer/recipes-kernel/linux/files/dmthin.cfg
 create mode 100644 meta-installer/recipes-kernel/linux/files/dmthin.scc
 create mode 100644 meta-installer/recipes-kernel/linux/files/efivars.cfg
 create mode 100644 meta-installer/recipes-kernel/linux/files/efivars.scc
 create mode 100644 meta-installer/recipes-kernel/linux/files/ide.cfg
 create mode 100644 meta-installer/recipes-kernel/linux/files/ide.scc
 create mode 100644 meta-installer/recipes-kernel/linux/files/liveinstall.cfg
 create mode 100644 meta-installer/recipes-kernel/linux/files/liveinstall.scc
 create mode 100644 meta-installer/recipes-kernel/linux/files/multipath.cfg
 create mode 100644 meta-installer/recipes-kernel/linux/files/multipath.scc

diff --git a/meta-installer/classes/anaconda_kernel.bbclass b/meta-installer/classes/anaconda_kernel.bbclass
new file mode 100644
index 0000000..bc73210
--- /dev/null
+++ b/meta-installer/classes/anaconda_kernel.bbclass
@@ -0,0 +1,14 @@
+FILESEXTRAPATHS_prepend := "${LAYER_PATH_meta-installer}/recipes-kernel/linux/files/:"
+SRC_URI_append = " \
+    file://dmthin.scc \
+    file://crypt.scc \
+    file://liveinstall.scc \
+    file://efivars.scc \
+    file://multipath.scc \
+    file://ide.scc \
+"
+
+KERNEL_FEATURES_append = " \
+    features/overlayfs/overlayfs.scc \
+    cfg/systemd.scc \
+"
diff --git a/meta-installer/classes/anaconda_support_kernel.bbclass b/meta-installer/classes/anaconda_support_kernel.bbclass
new file mode 100644
index 0000000..ee37106
--- /dev/null
+++ b/meta-installer/classes/anaconda_support_kernel.bbclass
@@ -0,0 +1,8 @@
+FILESEXTRAPATHS_prepend := "${LAYER_PATH_meta-installer}/recipes-kernel/linux/files/:"
+SRC_URI_append = " \
+    file://dmthin.scc \
+    file://crypt.scc \
+"
+
+KERNEL_FEATURES_append = " cfg/systemd.scc"
+
diff --git a/meta-installer/recipes-kernel/linux/files/crypt.cfg b/meta-installer/recipes-kernel/linux/files/crypt.cfg
new file mode 100644
index 0000000..2594462
--- /dev/null
+++ b/meta-installer/recipes-kernel/linux/files/crypt.cfg
@@ -0,0 +1,2 @@
+CONFIG_CRYPTO_AES_NI_INTEL=m
+CONFIG_CRYPTO_AES_X86_64=m
diff --git a/meta-installer/recipes-kernel/linux/files/crypt.scc b/meta-installer/recipes-kernel/linux/files/crypt.scc
new file mode 100644
index 0000000..daeab36
--- /dev/null
+++ b/meta-installer/recipes-kernel/linux/files/crypt.scc
@@ -0,0 +1 @@
+kconf non-hardware crypt.cfg
diff --git a/meta-installer/recipes-kernel/linux/files/dmthin.cfg b/meta-installer/recipes-kernel/linux/files/dmthin.cfg
new file mode 100644
index 0000000..1ac07c0
--- /dev/null
+++ b/meta-installer/recipes-kernel/linux/files/dmthin.cfg
@@ -0,0 +1 @@
+CONFIG_DM_THIN_PROVISIONING=y
diff --git a/meta-installer/recipes-kernel/linux/files/dmthin.scc b/meta-installer/recipes-kernel/linux/files/dmthin.scc
new file mode 100644
index 0000000..38cfac7
--- /dev/null
+++ b/meta-installer/recipes-kernel/linux/files/dmthin.scc
@@ -0,0 +1 @@
+kconf non-hardware dmthin.cfg
diff --git a/meta-installer/recipes-kernel/linux/files/efivars.cfg b/meta-installer/recipes-kernel/linux/files/efivars.cfg
new file mode 100644
index 0000000..b9206d9
--- /dev/null
+++ b/meta-installer/recipes-kernel/linux/files/efivars.cfg
@@ -0,0 +1 @@
+CONFIG_EFI_VARS=y
diff --git a/meta-installer/recipes-kernel/linux/files/efivars.scc b/meta-installer/recipes-kernel/linux/files/efivars.scc
new file mode 100644
index 0000000..25bd34d
--- /dev/null
+++ b/meta-installer/recipes-kernel/linux/files/efivars.scc
@@ -0,0 +1 @@
+kconf non-hardware efivars.cfg
diff --git a/meta-installer/recipes-kernel/linux/files/ide.cfg b/meta-installer/recipes-kernel/linux/files/ide.cfg
new file mode 100644
index 0000000..9d973ce
--- /dev/null
+++ b/meta-installer/recipes-kernel/linux/files/ide.cfg
@@ -0,0 +1,5 @@
+CONFIG_BLK_DEV_IDEDMA_SFF=y
+CONFIG_BLK_DEV_IDEPCI=y
+CONFIG_IDEPCI_PCIBUS_ORDER=y
+CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_IDEDMA=y
diff --git a/meta-installer/recipes-kernel/linux/files/ide.scc b/meta-installer/recipes-kernel/linux/files/ide.scc
new file mode 100644
index 0000000..81e57f5
--- /dev/null
+++ b/meta-installer/recipes-kernel/linux/files/ide.scc
@@ -0,0 +1 @@
+kconf non-hardware ide.cfg
diff --git a/meta-installer/recipes-kernel/linux/files/liveinstall.cfg b/meta-installer/recipes-kernel/linux/files/liveinstall.cfg
new file mode 100644
index 0000000..37c9f47
--- /dev/null
+++ b/meta-installer/recipes-kernel/linux/files/liveinstall.cfg
@@ -0,0 +1,5 @@
+CONFIG_ISO9660_FS=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_XATTR=y
+# CONFIG_BLK_DEV_PIIX is not set
diff --git a/meta-installer/recipes-kernel/linux/files/liveinstall.scc b/meta-installer/recipes-kernel/linux/files/liveinstall.scc
new file mode 100644
index 0000000..042e047
--- /dev/null
+++ b/meta-installer/recipes-kernel/linux/files/liveinstall.scc
@@ -0,0 +1 @@
+kconf non-hardware liveinstall.cfg
\ No newline at end of file
diff --git a/meta-installer/recipes-kernel/linux/files/multipath.cfg b/meta-installer/recipes-kernel/linux/files/multipath.cfg
new file mode 100644
index 0000000..39cf942
--- /dev/null
+++ b/meta-installer/recipes-kernel/linux/files/multipath.cfg
@@ -0,0 +1,3 @@
+CONFIG_DM_MULTIPATH=y
+CONFIG_DM_MULTIPATH_QL=y
+CONFIG_DM_MULTIPATH_ST=y
diff --git a/meta-installer/recipes-kernel/linux/files/multipath.scc b/meta-installer/recipes-kernel/linux/files/multipath.scc
new file mode 100644
index 0000000..36a4cdd
--- /dev/null
+++ b/meta-installer/recipes-kernel/linux/files/multipath.scc
@@ -0,0 +1 @@
+kconf non-hardware multipath.cfg
-- 
2.8.1


