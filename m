Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.3648.1599787553157318816
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114475"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:25:52 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A89CB48990D3
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:25:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:25:46 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libhugetlbfs: upgrade 2.22 -> 2.23
Date: Fri, 11 Sep 2020 21:25:46 +0800
Message-ID: <1599830746-15250-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A89CB48990D3.A6070
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-tests-add-explicit-permissions-to-open-call.patch
Removed since this is included in 2.23

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...dd-explicit-permissions-to-open-call.patch | 41 -------------------
 .../libhugetlbfs/libhugetlbfs_git.bb          |  5 +--
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
deleted file mode 100644
index 9d52b908e..000000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d07d2f9601b49bb72cd4b36838f0c238bd1b0fc1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 15 Jan 2020 18:45:09 -0800
-Subject: [PATCH] tests: add explicit permissions to open() call
-
-Fixes
-gethugepagesizes.c:227:35: error: open with O_CREAT in second argument needs 3 arguments
-|         fd = open(fname, O_WRONLY|O_CREAT);
-|                                          ^
-
-Upstream-Status: Submitted [https://groups.google.com/forum/#!topic/libhugetlbfs/anNtDXbQKro]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/gethugepagesizes.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/gethugepagesizes.c b/tests/gethugepagesizes.c
-index 9551b38..5777265 100644
---- a/tests/gethugepagesizes.c
-+++ b/tests/gethugepagesizes.c
-@@ -223,7 +223,7 @@ void setup_fake_data(long sizes[], int n_elem)
- 		FAIL("mkdtemp: %s", strerror(errno));
- 
- 	sprintf(fname, "%s/meminfo-none", fake_meminfo);
--	fd = open(fname, O_WRONLY|O_CREAT);
-+	fd = open(fname, O_WRONLY|O_CREAT, 0600);
- 	if (fd < 0)
- 		FAIL("open: %s", strerror(errno));
- 	if (write(fd, meminfo_base,
-@@ -233,7 +233,7 @@ void setup_fake_data(long sizes[], int n_elem)
- 		FAIL("close: %s", strerror(errno));
- 
- 	sprintf(fname, "%s/meminfo-hugepages", fake_meminfo);
--	fd = open(fname, O_WRONLY|O_CREAT);
-+	fd = open(fname, O_WRONLY|O_CREAT, 0600);
- 	if (fd < 0)
- 		FAIL("open: %s", strerror(errno));
- 	if (write(fd, meminfo_base,
--- 
-2.25.0
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 4768d7b63..b349096ec 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -7,10 +7,10 @@ DEPENDS = "sysfsutils"
 RDEPENDS_${PN} += "bash python3-core"
 RDEPENDS_${PN}-tests += "bash python3-core"
 
-PV = "2.22"
+PV = "2.23"
 PE = "1"
 
-SRCREV = "e6499ff92b4a7dcffbd131d1f5d24933e48c3f20"
+SRCREV = "6b126a4d7da9490fa40fe7e1b962edcb939feddc"
 SRC_URI = " \
     git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https \
     file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
@@ -24,7 +24,6 @@ SRC_URI = " \
     file://0004-shm.c-Mark-glibc-specific-changes-so.patch \
     file://0005-Include-dirent.h-for-ino_t.patch \
     file://0006-include-limits.h-for-PATH_MAX.patch \
-    file://0001-tests-add-explicit-permissions-to-open-call.patch \
     file://0001-huge_page_setup_helper-use-python3-interpreter.patch \
 "
 
-- 
2.25.1



