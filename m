Return-Path: <Pengyu.Ma@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5B31B6FE3B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 10:38:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8JAc8FF029532
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 03:38:08 -0700 (PDT)
Received: from pek-bsp-build1.wrs.com (128.224.179.105) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 19 Sep 2014 03:38:08 -0700
From: Pengyu Ma <pengyu.ma@windriver.com>
To: <pengyu.ma@windriver.com>, <Bruce.Ashfield@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Sep 2014 18:33:37 +0800
Message-ID: <1411122818-121055-3-git-send-email-pengyu.ma@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1411122818-121055-1-git-send-email-pengyu.ma@windriver.com>
References: <1411122818-121055-1-git-send-email-pengyu.ma@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] kexec/kdump: add metadata for to enable kexec/dump.
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
X-List-Received-Date: Fri, 19 Sep 2014 10:38:11 -0000
Content-Type: text/plain

Signed-off-by: Pengyu Ma <pengyu.ma@windriver.com>
---
 meta/cfg/kernel-cache/features/kdump/e500-kdump.cfg   | 2 ++
 meta/cfg/kernel-cache/features/kdump/e500-kdump.scc   | 1 +
 meta/cfg/kernel-cache/features/kdump/kdump-enable.scc | 4 ++++
 meta/cfg/kernel-cache/features/kdump/kdump.cfg        | 3 +++
 meta/cfg/kernel-cache/features/kexec/e500-kexec.cfg   | 1 +
 meta/cfg/kernel-cache/features/kexec/e500-kexec.scc   | 1 +
 meta/cfg/kernel-cache/features/kexec/kexec-enable.scc | 4 ++++
 meta/cfg/kernel-cache/features/kexec/kexec.cfg        | 1 +
 8 files changed, 17 insertions(+)
 create mode 100644 meta/cfg/kernel-cache/features/kdump/e500-kdump.cfg
 create mode 100644 meta/cfg/kernel-cache/features/kdump/e500-kdump.scc
 create mode 100644 meta/cfg/kernel-cache/features/kdump/kdump-enable.scc
 create mode 100644 meta/cfg/kernel-cache/features/kdump/kdump.cfg
 create mode 100644 meta/cfg/kernel-cache/features/kexec/e500-kexec.cfg
 create mode 100644 meta/cfg/kernel-cache/features/kexec/e500-kexec.scc
 create mode 100644 meta/cfg/kernel-cache/features/kexec/kexec-enable.scc
 create mode 100644 meta/cfg/kernel-cache/features/kexec/kexec.cfg

diff --git a/meta/cfg/kernel-cache/features/kdump/e500-kdump.cfg b/meta/cfg/kernel-cache/features/kdump/e500-kdump.cfg
new file mode 100644
index 0000000..25ac017
--- /dev/null
+++ b/meta/cfg/kernel-cache/features/kdump/e500-kdump.cfg
@@ -0,0 +1,2 @@
+CONFIG_ADVANCED_OPTIONS=y
+CONFIG_DYNAMIC_MEMSTART=y
diff --git a/meta/cfg/kernel-cache/features/kdump/e500-kdump.scc b/meta/cfg/kernel-cache/features/kdump/e500-kdump.scc
new file mode 100644
index 0000000..299742d
--- /dev/null
+++ b/meta/cfg/kernel-cache/features/kdump/e500-kdump.scc
@@ -0,0 +1 @@
+kconf non-hardware e500-kdump.cfg
diff --git a/meta/cfg/kernel-cache/features/kdump/kdump-enable.scc b/meta/cfg/kernel-cache/features/kdump/kdump-enable.scc
new file mode 100644
index 0000000..69a7dd3
--- /dev/null
+++ b/meta/cfg/kernel-cache/features/kdump/kdump-enable.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Enable Kdump - The kexec-based Crash Dumping Solution"
+define KFEATURE_COMPATIBILITY optional
+
+kconf non-hardware kdump.cfg
diff --git a/meta/cfg/kernel-cache/features/kdump/kdump.cfg b/meta/cfg/kernel-cache/features/kdump/kdump.cfg
new file mode 100644
index 0000000..8429ad8
--- /dev/null
+++ b/meta/cfg/kernel-cache/features/kdump/kdump.cfg
@@ -0,0 +1,3 @@
+CONFIG_CRASH_DUMP=y
+CONFIG_PROC_VMCORE=y
+# CONFIG_STRICT_DEVMEM is not set
diff --git a/meta/cfg/kernel-cache/features/kexec/e500-kexec.cfg b/meta/cfg/kernel-cache/features/kexec/e500-kexec.cfg
new file mode 100644
index 0000000..7cf51ea
--- /dev/null
+++ b/meta/cfg/kernel-cache/features/kexec/e500-kexec.cfg
@@ -0,0 +1 @@
+CONFIG_PROC_DEVICETREE=y
diff --git a/meta/cfg/kernel-cache/features/kexec/e500-kexec.scc b/meta/cfg/kernel-cache/features/kexec/e500-kexec.scc
new file mode 100644
index 0000000..6c58fa5
--- /dev/null
+++ b/meta/cfg/kernel-cache/features/kexec/e500-kexec.scc
@@ -0,0 +1 @@
+kconf non-hardware e500-kexec.cfg
diff --git a/meta/cfg/kernel-cache/features/kexec/kexec-enable.scc b/meta/cfg/kernel-cache/features/kexec/kexec-enable.scc
new file mode 100644
index 0000000..54181ab
--- /dev/null
+++ b/meta/cfg/kernel-cache/features/kexec/kexec-enable.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Enable Kexec - live kernel execution"
+define KFEATURE_COMPATIBILITY optional
+
+kconf non-hardware kexec.cfg
diff --git a/meta/cfg/kernel-cache/features/kexec/kexec.cfg b/meta/cfg/kernel-cache/features/kexec/kexec.cfg
new file mode 100644
index 0000000..b45488d
--- /dev/null
+++ b/meta/cfg/kernel-cache/features/kexec/kexec.cfg
@@ -0,0 +1 @@
+CONFIG_KEXEC=y
-- 
1.8.1.2


