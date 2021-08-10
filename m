Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.1524.1628621508681219837
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 11:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ttasciog@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17AIpkIt020012
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Aug 2021 11:51:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17AIpk3R021146
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Aug 2021 11:51:46 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 10 Aug 2021 11:51:45 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 10 Aug 2021 11:51:45 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21862)
	id 896F3900AE9; Tue, 10 Aug 2021 11:51:45 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <tony.tascioglu@windriver.com>
Subject: [meta-oe][hardknott][PATCH] redis: fix CVE-2021-32625
Date: Tue, 10 Aug 2021 11:51:45 -0700
Message-ID: <20210810185145.37642-1-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

CVE: CVE-2021-32625
Upstream-Status: Backport [e9a1438ac4c52aa68dfa2a8324b6419356842116]

Fix integer overflow in STRALGO LCS (CVE-2021-32625) (#9011)
An integer overflow bug in Redis version 6.0 or newer can be exploited using the
STRALGO LCS command to corrupt the heap and potentially result with remote code
execution. This is a result of an incomplete fix by CVE-2021-29477.

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../redis/redis/fix-CVE-2021-32625.patch      | 61 +++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch

diff --git a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch
new file mode 100644
index 000000000..6311a5db1
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch
@@ -0,0 +1,61 @@
+From e9a1438ac4c52aa68dfa2a8324b6419356842116 Mon Sep 17 00:00:00 2001
+From: Oran Agra <oran@redislabs.com>
+Date: Tue, 1 Jun 2021 09:12:45 +0300
+Subject: [PATCH] Fix integer overflow in STRALGO LCS (CVE-2021-32625) (#9011)
+
+An integer overflow bug in Redis version 6.0 or newer can be exploited using the
+STRALGO LCS command to corrupt the heap and potentially result with remote code
+execution. This is a result of an incomplete fix by CVE-2021-29477.
+
+(cherry picked from commit 1ddecf1958924b178b76a31d989ef1e05af81964)
+
+
+CVE: CVE-2021-32625
+Upstream-Status: Backport [e9a1438ac4c52aa68dfa2a8324b6419356842116]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ src/t_string.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/src/t_string.c b/src/t_string.c
+index 490d5983a..587d3aeb8 100644
+--- a/src/t_string.c
++++ b/src/t_string.c
+@@ -797,6 +797,12 @@ void stralgoLCS(client *c) {
+         goto cleanup;
+     }
+ 
++    /* Detect string truncation or later overflows. */
++    if (sdslen(a) >= UINT32_MAX-1 || sdslen(b) >= UINT32_MAX-1) {
++        addReplyError(c, "String too long for LCS");
++        goto cleanup;
++    }
++
+     /* Compute the LCS using the vanilla dynamic programming technique of
+      * building a table of LCS(x,y) substrings. */
+     uint32_t alen = sdslen(a);
+@@ -805,9 +811,19 @@ void stralgoLCS(client *c) {
+     /* Setup an uint32_t array to store at LCS[i,j] the length of the
+      * LCS A0..i-1, B0..j-1. Note that we have a linear array here, so
+      * we index it as LCS[j+(blen+1)*j] */
+-    uint32_t *lcs = zmalloc((size_t)(alen+1)*(blen+1)*sizeof(uint32_t));
+     #define LCS(A,B) lcs[(B)+((A)*(blen+1))]
+ 
++    /* Try to allocate the LCS table, and abort on overflow or insufficient memory. */
++    unsigned long long lcssize = (unsigned long long)(alen+1)*(blen+1); /* Can't overflow due to the size limits above. */
++    unsigned long long lcsalloc = lcssize * sizeof(uint32_t);
++    uint32_t *lcs = NULL;
++    if (lcsalloc < SIZE_MAX && lcsalloc / lcssize == sizeof(uint32_t))
++        lcs = ztrymalloc(lcsalloc);
++    if (!lcs) {
++        addReplyError(c, "Insufficient memory");
++        goto cleanup;
++    }
++
+     /* Start building the LCS table. */
+     for (uint32_t i = 0; i <= alen; i++) {
+         for (uint32_t j = 0; j <= blen; j++) {
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
index a36c190af..a9e6eaffa 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            file://fix-CVE-2021-29477.patch \
            file://fix-CVE-2021-29478.patch \
+           file://fix-CVE-2021-32625.patch \
            "
 SRC_URI[sha256sum] = "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
 
-- 
2.31.1

