Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D5DE27F93F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 07:20:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,250,1569254400"; d="scan'208";a="77731034"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 15:20:30 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id A91AE4CE1513
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 15:12:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 31 Oct 2019 15:20:29 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 23:14:54 +0800
Message-ID: <1572534894-51167-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: A91AE4CE1513.A7E65
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libhugetlbfs: upgrade 2.21 -> 2.22
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
X-List-Received-Date: Thu, 31 Oct 2019 07:20:30 -0000
Content-Type: text/plain

1) Upgrade libhugetlbfs from 2.21 to 2.22.

2) Update two patches for new version.
   0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
   0005-Include-dirent.h-for-ino_t.patch

3) Add RDEPEND python3-core for libhugetlbfs-tests to fix the do_package_qa error as follows:

ERROR: libhugetlbfs-1_2.22-r0 do_package_qa: QA Issue: /usr/lib/libhugetlbfs/tests/run_tests.py contained in package libhugetlbfs-tests requires /usr/bin/python3, but no providers found in RDEPENDS_libhugetlbfs-tests? [file-rdeps]

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch | 13 +++++++++----
 .../files/0005-Include-dirent.h-for-ino_t.patch             |  9 +++++++--
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb  |  6 +++---
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
index 53f35ab..34a6220 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
@@ -10,15 +10,17 @@ Upstream-Status: Submitted
 
 Signed-off-by: Ting Liu <b28495@freescale.com>
 
+Update for 2.22.
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
  tests/run_tests.py | 12 +++++++++++-
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/tests/run_tests.py b/tests/run_tests.py
-index 3c95a03..560df6b 100755
+index 018264d..0aabcd1 100755
 --- a/tests/run_tests.py
 +++ b/tests/run_tests.py
-@@ -234,9 +234,19 @@ def get_pagesizes():
+@@ -245,9 +245,19 @@ def get_pagesizes():
      Use libhugetlbfs' hugeadm utility to get a list of page sizes that have
      active mount points and at least one huge page allocated to the pool.
      """
@@ -36,6 +38,9 @@ index 3c95a03..560df6b 100755
 +        return sizes
 +    out = p.stdout.read().strip()
 +
-     if rc != 0 or out == "": return sizes
+     if rc != 0 or out == "":
+         return sizes
  
-     for size in out.split("\n"): sizes.add(int(size))
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
index 0817420..e736cbc 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
@@ -8,12 +8,14 @@ error: unknown type name 'ino_t'; did you mean 'int'?
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+Update for 2.22.
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
  tests/hugetests.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/tests/hugetests.h b/tests/hugetests.h
-index 8b1d8d9..056042c 100644
+index bc4e16a..fbe4dc0 100644
 --- a/tests/hugetests.h
 +++ b/tests/hugetests.h
 @@ -22,6 +22,7 @@
@@ -21,6 +23,9 @@ index 8b1d8d9..056042c 100644
  #include <errno.h>
  #include <string.h>
 +#include <dirent.h>
+ #include <unistd.h>
  
  #include "libhugetlbfs_privutils.h"
- #include "libhugetlbfs_testprobes.h"
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 66fd8e2..f258122 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "sysfsutils"
 RDEPENDS_${PN} += "bash python python-io python-lang python-subprocess python-resource"
-RDEPENDS_${PN}-tests += "bash"
+RDEPENDS_${PN}-tests += "bash python3-core"
 
-PV = "2.21"
+PV = "2.22"
 PE = "1"
 
-SRCREV = "73d06e69108f231696e9c5c44f4b42690fc5d752"
+SRCREV = "e6499ff92b4a7dcffbd131d1f5d24933e48c3f20"
 SRC_URI = " \
     git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https \
     file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
-- 
2.7.4




