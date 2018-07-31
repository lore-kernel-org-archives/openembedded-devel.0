Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 513B9606B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 09:23:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6V9NO99001737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 02:23:24 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 31 Jul 2018 02:23:23 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 31 Jul 2018 17:27:23 +0800
Message-ID: <1533029243-5011-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libfastjson: backport patch to fix compilation error
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
X-List-Received-Date: Tue, 31 Jul 2018 09:23:24 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

I've met the following compilation error.

  | ../git/json_object.c:415:3: error: jump skips variable initialization [-Werror=jump-misses-init]

Backport a patch to fix it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-fix-jump-misses-init-gcc-8-warning.patch  | 46 ++++++++++++++++++++++
 .../recipes-extended/rsyslog/libfastjson_0.99.8.bb |  3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/libfastjson/0001-fix-jump-misses-init-gcc-8-warning.patch

diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson/0001-fix-jump-misses-init-gcc-8-warning.patch b/meta-oe/recipes-extended/rsyslog/libfastjson/0001-fix-jump-misses-init-gcc-8-warning.patch
new file mode 100644
index 0000000..25e5efa
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson/0001-fix-jump-misses-init-gcc-8-warning.patch
@@ -0,0 +1,46 @@
+From d697182f18a421b7f80ea9de4914251b55d82532 Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Sun, 15 Jul 2018 17:24:59 +0200
+Subject: [PATCH] "fix" "jump-misses-init" gcc-8 warning
+
+Actually, that warning is overly conservative, and so we
+have changed the code in a somewhat suboptimal way to "fix"
+it. In this spots, it's not that bad and we wanted to avoid
+totally disabling this warning.
+
+If it were more costly in terms of cleanness, we would probaly
+have done that. Just mention it to tell anyone else the
+cure is not really a good one, just selected due to the
+circumstances in this special case.
+
+Upstream-Status: Backport
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ json_object.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/json_object.c b/json_object.c
+index 35338e1..6e67891 100644
+--- a/json_object.c
++++ b/json_object.c
+@@ -396,6 +396,7 @@ fjson_child_get_empty_etry(struct fjson_object *const __restrict__ jso)
+ {
+ 	struct _fjson_child *chld = NULL;
+ 	struct _fjson_child_pg *pg;
++	int pg_idx;
+ 
+ 	if (jso->o.c_obj.ndeleted > 0) {
+ 		/* we first fill deleted spots */
+@@ -415,7 +416,7 @@ fjson_child_get_empty_etry(struct fjson_object *const __restrict__ jso)
+ 		goto done;
+ 	}
+ 
+-	const int pg_idx = jso->o.c_obj.nelem % FJSON_OBJECT_CHLD_PG_SIZE;
++	pg_idx = jso->o.c_obj.nelem % FJSON_OBJECT_CHLD_PG_SIZE;
+ 	if (jso->o.c_obj.nelem > 0 && pg_idx == 0) {
+ 		if((pg = calloc(1, sizeof(struct _fjson_child_pg))) == NULL) {
+ 			errno = ENOMEM;
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.8.bb b/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.8.bb
index ea089de..b84dde3 100644
--- a/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.8.bb
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.8.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a958bb07122368f3e1d9b2efe07d231f"
 
 DEPENDS = ""
 
-SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https"
+SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https \
+           file://0001-fix-jump-misses-init-gcc-8-warning.patch"
 
 SRCREV = "4758b1caf69ada911ef79e1d80793fe489b98dff"
 
-- 
1.9.1


