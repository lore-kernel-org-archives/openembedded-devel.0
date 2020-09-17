Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5411.1600305853410724782
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 18:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,434,1592841600"; 
   d="scan'208";a="99331777"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Sep 2020 09:24:12 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A3B1748990C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2020 09:24:11 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 17 Sep 2020 09:24:11 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] memtester: upgrade 4.3.0 -> 4.4.0
Date: Thu, 17 Sep 2020 21:24:13 +0800
Message-ID: <1600349053-4561-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A3B1748990C1.A02D8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../0001-Define-mword16-and-mword8-once.patch | 57 -------------------
 ...{memtester_4.3.0.bb => memtester_4.4.0.bb} |  5 +-
 2 files changed, 2 insertions(+), 60 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/memtester/files/0001-Define-mword16-and-mword8-once.patch
 rename meta-oe/recipes-benchmark/memtester/{memtester_4.3.0.bb => memtester_4.4.0.bb} (76%)

diff --git a/meta-oe/recipes-benchmark/memtester/files/0001-Define-mword16-and-mword8-once.patch b/meta-oe/recipes-benchmark/memtester/files/0001-Define-mword16-and-mword8-once.patch
deleted file mode 100644
index ffd9b9f266..0000000000
--- a/meta-oe/recipes-benchmark/memtester/files/0001-Define-mword16-and-mword8-once.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 01f1c05702eb534271777648c976ab6402a5145b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Aug 2020 23:18:30 -0700
-Subject: [PATCH] Define mword16 and mword8 once
-
-Defining them in .h meant they are defined in all .c files including
-this .h file
-
-Fixes build with gcc 10+
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests.c | 9 +++++++++
- types.h | 9 ---------
- 2 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/tests.c b/tests.c
-index be1b350..4305bed 100644
---- a/tests.c
-+++ b/tests.c
-@@ -27,6 +27,15 @@ char progress[] = "-\\|/";
- #define PROGRESSOFTEN 2500
- #define ONE 0x00000001L
- 
-+union {
-+    unsigned char bytes[UL_LEN/8];
-+    ul val;
-+} mword8;
-+
-+union {
-+    unsigned short u16s[UL_LEN/16];
-+    ul val;
-+} mword16;
- /* Function definitions. */
- 
- int compare_regions(ulv *bufa, ulv *bufb, size_t count) {
-diff --git a/types.h b/types.h
-index ad7ce73..e14ea32 100644
---- a/types.h
-+++ b/types.h
-@@ -25,12 +25,3 @@ struct test {
-     int (*fp)();
- };
- 
--union {
--    unsigned char bytes[UL_LEN/8];
--    ul val;
--} mword8;
--
--union {
--    unsigned short u16s[UL_LEN/16];
--    ul val;
--} mword16;
--- 
-2.28.0
-
diff --git a/meta-oe/recipes-benchmark/memtester/memtester_4.3.0.bb b/meta-oe/recipes-benchmark/memtester/memtester_4.4.0.bb
similarity index 76%
rename from meta-oe/recipes-benchmark/memtester/memtester_4.3.0.bb
rename to meta-oe/recipes-benchmark/memtester/memtester_4.4.0.bb
index 3d29055781..646ff90ba1 100644
--- a/meta-oe/recipes-benchmark/memtester/memtester_4.3.0.bb
+++ b/meta-oe/recipes-benchmark/memtester/memtester_4.4.0.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://pyropus.ca/software/memtester/old-versions/${BP}.tar.gz \
            file://Makefile.patch \
-           file://0001-Define-mword16-and-mword8-once.patch \
            "
-SRC_URI[md5sum] = "598f41b7308e1f736164bca3ab84ddbe"
-SRC_URI[sha256sum] = "f9dfe2fd737c38fad6535bbab327da9a21f7ce4ea6f18c7b3339adef6bf5fd88"
+SRC_URI[md5sum] = "e1883b69cd7c0bb74ef6a475c93a4fbf"
+SRC_URI[sha256sum] = "6ffe23e6e6449b42c577c7953778fb6f698050196797a94fc619d9badc59f8e8"
 
 do_compile () {
     echo '${CC} ${CFLAGS} -DPOSIX -c' > conf-cc
-- 
2.25.1



