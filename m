Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFF1A65C91
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Nov 2014 09:22:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA49MJR0014795
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Nov 2014 01:22:19 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 4 Nov 2014 01:22:18 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 4 Nov 2014 04:22:17 -0500
Message-ID: <1415092937-12036-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libhugetlbfs: avoid search host library path for cross compilation
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
X-List-Received-Date: Tue, 04 Nov 2014 09:22:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

There was a patch fixing the same issue:
libhugetlbfs-avoid-search-host-library-path-for-cros.patch

but missed the elf_i386.xB*, this patch fixes for it.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libhugetlbfs/libhugetlbfs_git.bb               |    1 +
 ...s-elf_i386-avoid-search-host-library-path.patch |   40 ++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index c2262ea..9469639 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://0001-aarch64-fix-page-size-not-properly-computed.patch \
     file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch \
     file://0001-Extend-arm32-support-to-include-BE-variants.patch \
+    file://libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
 "
 
 S = "${WORKDIR}/git"
diff --git a/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch b/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch
new file mode 100644
index 0000000..8a34e9d
--- /dev/null
+++ b/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch
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
-- 
1.7.9.5


