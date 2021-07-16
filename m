Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.959.1626461263102107520
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 11:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ttasciog@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 16GIlfsq020311
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 11:47:41 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 16GIlfen010969
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 11:47:41 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 16 Jul 2021 11:47:40 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Fri, 16 Jul 2021 11:47:40 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21862)
	id D588B9020FC; Fri, 16 Jul 2021 11:47:40 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <randy.macleod@windriver.com>,
        Tony Tascioglu
	<tony.tascioglu@windriver.com>
Subject: [meta-oe][hardknott][PATCH 2/2] redis: fix CVE-2021-29478
Date: Fri, 16 Jul 2021 11:47:33 -0700
Message-ID: <20210716184733.37797-2-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210716184733.37797-1-tony.tascioglu@windriver.com>
References: <20210716184733.37797-1-tony.tascioglu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch backports the fix for CVE-2021-29478

CVE: CVE-2021-29478
Upstream-Status: Backport
[https://github.com/redis/redis/commit/29900d4e6bccdf3691bedf0ea9a5d84863fa3592]

An integer overflow bug in Redis 6.2 could be exploited to corrupt the heap and
potentially result with remote code execution.

The vulnerability involves changing the default set-max-intset-entries
configuration value, creating a large set key that consists of integer values
and using the COPY command to duplicate it.

The integer overflow bug exists in all versions of Redis starting with 2.6,
where it could result with a corrupted RDB or DUMP payload, but not exploited
through COPY (which did not exist before 6.2).

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../redis/redis/fix-CVE-2021-29478.patch      | 42 +++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch

diff --git a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch
new file mode 100644
index 000000000..ebbf6e1b9
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch
@@ -0,0 +1,42 @@
+From 29900d4e6bccdf3691bedf0ea9a5d84863fa3592 Mon Sep 17 00:00:00 2001
+From: Oran Agra <oran@redislabs.com>
+Date: Mon, 3 May 2021 08:27:22 +0300
+Subject: [PATCH] Fix integer overflow in intset (CVE-2021-29478)
+
+An integer overflow bug in Redis 6.2 could be exploited to corrupt the heap and
+potentially result with remote code execution.
+
+The vulnerability involves changing the default set-max-intset-entries
+configuration value, creating a large set key that consists of integer values
+and using the COPY command to duplicate it.
+
+The integer overflow bug exists in all versions of Redis starting with 2.6,
+where it could result with a corrupted RDB or DUMP payload, but not exploited
+through COPY (which did not exist before 6.2).
+
+CVE: CVE-2021-29478
+Upstream-Status: Backport
+[https://github.com/redis/redis/commit/29900d4e6bccdf3691bedf0ea9a5d84863fa3592]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+
+---
+ src/intset.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/intset.c b/src/intset.c
+index 1a64ecae8..9ba13898d 100644
+--- a/src/intset.c
++++ b/src/intset.c
+@@ -281,7 +281,7 @@ uint32_t intsetLen(const intset *is) {
+ 
+ /* Return intset blob size in bytes. */
+ size_t intsetBlobLen(intset *is) {
+-    return sizeof(intset)+intrev32ifbe(is->length)*intrev32ifbe(is->encoding);
++    return sizeof(intset)+(size_t)intrev32ifbe(is->length)*intrev32ifbe(is->encoding);
+ }
+ 
+ /* Validate the integrity of the data structure.
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
index e89bb50f1..a36c190af 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            file://fix-CVE-2021-29477.patch \
+           file://fix-CVE-2021-29478.patch \
            "
 SRC_URI[sha256sum] = "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
 
-- 
2.31.1

