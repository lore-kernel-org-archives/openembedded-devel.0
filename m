Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 37874789FF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 01:17:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w271HiX5018565
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Mar 2018 17:17:44 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 6 Mar 2018 17:17:11 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>
Date: Tue, 6 Mar 2018 20:17:32 -0500
Message-ID: <1520385452-205564-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-blivet: fix invoking dd timeout caused partition failed
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
X-List-Received-Date: Wed, 07 Mar 2018 01:17:44 -0000
Content-Type: text/plain

This large timeout is needed when running on machines with
lots of disks, or with slow disks.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0014-invoking-dd-with-infinite-timeout.patch   | 31 ++++++++++++++++++++++
 .../python-blivet/python3-blivet_2.2.0.bb          |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch
new file mode 100644
index 0000000..12a9e4f
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch
@@ -0,0 +1,31 @@
+From 92fe7dfd01131c93a9b2013cabf77d5f46900fab Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 6 Mar 2018 17:28:56 +0800
+Subject: [PATCH] invoking dd with infinite timeout
+
+This large timeout is needed when running on machines with
+lots of disks, or with slow disks.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ blivet/devices/partition.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/blivet/devices/partition.py b/blivet/devices/partition.py
+index a7372fb..8947472 100644
+--- a/blivet/devices/partition.py
++++ b/blivet/devices/partition.py
+@@ -594,7 +594,7 @@ class PartitionDevice(StorageDevice):
+         cmd = ["dd", "if=/dev/zero", "of=%s" % device, "bs=%d" % bs,
+                "seek=%d" % start, "count=%d" % count]
+         try:
+-            util.run_program(cmd)
++            util.run_program(cmd, timeout=-1)
+         except OSError as e:
+             log.error(str(e))
+         finally:
+-- 
+1.8.3.1
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
index cacca67..46dc32d 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/rhinstaller/blivet;branch=2.2-devel \
            file://0011-invoking-fsck-with-infinite-timeout.patch \
            file://0012-invoking-mkfs-with-infinite-timeout.patch \
            file://0013-Revert-Adapt-to-logging-module-name-change.patch \
+           file://0014-invoking-dd-with-infinite-timeout.patch \
 "
 
 inherit distro_features_check
-- 
1.8.3.1


