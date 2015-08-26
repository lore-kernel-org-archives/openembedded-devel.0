Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3586271633
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 01:29:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7Q1Tmc2021365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 18:29:48 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 25 Aug 2015 18:29:48 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Aug 2015 09:25:24 +0800
Message-ID: <1440552325-29335-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] libhugetlbfs: avoid search host library path for cross compilation
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
X-List-Received-Date: Wed, 26 Aug 2015 01:29:51 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

There was a patch fixing the same issue:
libhugetlbfs-avoid-search-host-library-path-for-cros.patch

but missed the elf_i386.xB*, this patch fixes for it.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...s-elf_i386-avoid-search-host-library-path.patch | 40 ++++++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch
new file mode 100644
index 0000000..1566488
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch
@@ -0,0 +1,40 @@
+From 889e52753d30179ba4ac940023cb4ed561436ab8 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Tue, 4 Nov 2014 00:49:11 -0800
+Subject: [PATCH] libhugetlbfs/elf_i386: avoid search host library path for cross compilation
+
+Upstream-Status: Inappropriate [cross compile specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ ldscripts/elf_i386.xB   |    1 -
+ ldscripts/elf_i386.xBDT |    1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/ldscripts/elf_i386.xB b/ldscripts/elf_i386.xB
+index 43fe51c..eae0fa8 100644
+--- a/ldscripts/elf_i386.xB
++++ b/ldscripts/elf_i386.xB
+@@ -3,7 +3,6 @@ OUTPUT_FORMAT("elf32-i386", "elf32-i386",
+ 	      "elf32-i386")
+ OUTPUT_ARCH(i386)
+ ENTRY(_start)
+-SEARCH_DIR("/usr/i486-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
+ INPUT(-lhugetlbfs);
+ /* Do we need any of these for elf?
+    __DYNAMIC = 0;    */
+diff --git a/ldscripts/elf_i386.xBDT b/ldscripts/elf_i386.xBDT
+index d72aebe..3bac1b1 100644
+--- a/ldscripts/elf_i386.xBDT
++++ b/ldscripts/elf_i386.xBDT
+@@ -3,7 +3,6 @@ OUTPUT_FORMAT("elf32-i386", "elf32-i386",
+ 	      "elf32-i386")
+ OUTPUT_ARCH(i386)
+ ENTRY(_start)
+-SEARCH_DIR("/usr/i486-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");
+ INPUT(-lhugetlbfs);
+ /* Do we need any of these for elf?
+    __DYNAMIC = 0;    */
+--
+1.7.9.5
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index a2d3922..ae5e46a 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
     file://tests-Makefile-install-static-4G-edge-testcases.patch \
     file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
+    file://libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


