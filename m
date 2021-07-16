Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.973.1626461261881050977
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 11:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 16GIleKj029350
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 11:47:40 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 16 Jul 2021 11:47:39 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Fri, 16 Jul 2021 11:47:39 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21862)
	id 7DBE09020FC; Fri, 16 Jul 2021 11:47:39 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <randy.macleod@windriver.com>,
        Tony Tascioglu
	<tony.tascioglu@windriver.com>
Subject: [meta-oe][hardknott][PATCH 1/2] redis: fix CVE-2021-29477
Date: Fri, 16 Jul 2021 11:47:32 -0700
Message-ID: <20210716184733.37797-1-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch backports the fix for CVE-2021-29477.

CVE: CVE-2021-29477
Upstream-Status: Backport
[https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af4902789d1ef9]

An integer overflow bug in Redis version 6.0 or newer could be exploited using
the STRALGO LCS command to corrupt the heap and potentially result with remote
code execution.

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../redis/redis/fix-CVE-2021-29477.patch      | 35 +++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch

diff --git a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
new file mode 100644
index 000000000..a5e5a1ba5
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
@@ -0,0 +1,35 @@
+From f0c5f920d0f88bd8aa376a2c05af4902789d1ef9 Mon Sep 17 00:00:00 2001
+From: Oran Agra <oran@redislabs.com>
+Date: Mon, 3 May 2021 08:32:31 +0300
+Subject: [PATCH] Fix integer overflow in STRALGO LCS (CVE-2021-29477)
+
+An integer overflow bug in Redis version 6.0 or newer could be exploited using
+the STRALGO LCS command to corrupt the heap and potentially result with remote
+code execution.
+
+CVE: CVE-2021-29477
+Upstream-Status: Backport
+[https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af4902789d1ef9]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+
+---
+ src/t_string.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/t_string.c b/src/t_string.c
+index 9228c5ed0..db6f7042e 100644
+--- a/src/t_string.c
++++ b/src/t_string.c
+@@ -805,7 +805,7 @@ void stralgoLCS(client *c) {
+     /* Setup an uint32_t array to store at LCS[i,j] the length of the
+      * LCS A0..i-1, B0..j-1. Note that we have a linear array here, so
+      * we index it as LCS[j+(blen+1)*j] */
+-    uint32_t *lcs = zmalloc((alen+1)*(blen+1)*sizeof(uint32_t));
++    uint32_t *lcs = zmalloc((size_t)(alen+1)*(blen+1)*sizeof(uint32_t));
+     #define LCS(A,B) lcs[(B)+((A)*(blen+1))]
+ 
+     /* Start building the LCS table. */
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
index 65b525709..e89bb50f1 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
+           file://fix-CVE-2021-29477.patch \
            "
 SRC_URI[sha256sum] = "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
 
-- 
2.31.1

