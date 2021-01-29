Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.7009.1611909499376904664
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 00:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,384,1602518400"; 
   d="scan'208";a="103978940"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jan 2021 16:38:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1F0F14CE6787
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Jan 2021 16:38:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 Jan 2021 16:38:05 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libfastjson: upgrade 0.99.8 -> 0.99.9
Date: Sat, 30 Jan 2021 04:38:03 +0800
Message-ID: <1611952683-3848-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1F0F14CE6787.A22D7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-fix-jump-misses-init-gcc-8-warning.patch
Removed since this is included in 0.99.9.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...1-fix-jump-misses-init-gcc-8-warning.patch | 46 -------------------
 ...stjson_0.99.8.bb => libfastjson_0.99.9.bb} |  5 +-
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/libfastjson/0001-fix-jump-misses-init-gcc-8-warning.patch
 rename meta-oe/recipes-extended/rsyslog/{libfastjson_0.99.8.bb => libfastjson_0.99.9.bb} (71%)

diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson/0001-fix-jump-misses-init-gcc-8-warning.patch b/meta-oe/recipes-extended/rsyslog/libfastjson/0001-fix-jump-misses-init-gcc-8-warning.patch
deleted file mode 100644
index 25e5efa4b..000000000
--- a/meta-oe/recipes-extended/rsyslog/libfastjson/0001-fix-jump-misses-init-gcc-8-warning.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From d697182f18a421b7f80ea9de4914251b55d82532 Mon Sep 17 00:00:00 2001
-From: Rainer Gerhards <rgerhards@adiscon.com>
-Date: Sun, 15 Jul 2018 17:24:59 +0200
-Subject: [PATCH] "fix" "jump-misses-init" gcc-8 warning
-
-Actually, that warning is overly conservative, and so we
-have changed the code in a somewhat suboptimal way to "fix"
-it. In this spots, it's not that bad and we wanted to avoid
-totally disabling this warning.
-
-If it were more costly in terms of cleanness, we would probaly
-have done that. Just mention it to tell anyone else the
-cure is not really a good one, just selected due to the
-circumstances in this special case.
-
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- json_object.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/json_object.c b/json_object.c
-index 35338e1..6e67891 100644
---- a/json_object.c
-+++ b/json_object.c
-@@ -396,6 +396,7 @@ fjson_child_get_empty_etry(struct fjson_object *const __restrict__ jso)
- {
- 	struct _fjson_child *chld = NULL;
- 	struct _fjson_child_pg *pg;
-+	int pg_idx;
- 
- 	if (jso->o.c_obj.ndeleted > 0) {
- 		/* we first fill deleted spots */
-@@ -415,7 +416,7 @@ fjson_child_get_empty_etry(struct fjson_object *const __restrict__ jso)
- 		goto done;
- 	}
- 
--	const int pg_idx = jso->o.c_obj.nelem % FJSON_OBJECT_CHLD_PG_SIZE;
-+	pg_idx = jso->o.c_obj.nelem % FJSON_OBJECT_CHLD_PG_SIZE;
- 	if (jso->o.c_obj.nelem > 0 && pg_idx == 0) {
- 		if((pg = calloc(1, sizeof(struct _fjson_child_pg))) == NULL) {
- 			errno = ENOMEM;
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.8.bb b/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.9.bb
similarity index 71%
rename from meta-oe/recipes-extended/rsyslog/libfastjson_0.99.8.bb
rename to meta-oe/recipes-extended/rsyslog/libfastjson_0.99.9.bb
index b84dde3d3..88ba9edaa 100644
--- a/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.8.bb
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.9.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a958bb07122368f3e1d9b2efe07d231f"
 
 DEPENDS = ""
 
-SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https \
-           file://0001-fix-jump-misses-init-gcc-8-warning.patch"
+SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https"
 
-SRCREV = "4758b1caf69ada911ef79e1d80793fe489b98dff"
+SRCREV = "0293afb3913f760c449348551cca4d2df59c1a00"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



