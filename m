Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62004C0015E
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 10:04:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.39318.1691748250512835660
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Aug 2023 03:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lswS/M0F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7587f097e0=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37B9928r002997
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 10:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=B9klV
	5Xc2BamqtmWf8nT1233vusdImGogn0uvkf3l0E=; b=lswS/M0Fs2hghpPEp5lj9
	s4q/lIE1guV8DSN240ityKG6pmkjY9R55BUIWo9VV9fLboLJMPcQLjHll5lTfHMn
	8lFRi697mwGcvHukhj/46QFaJ6OdAGCQCQOh1+A6nwCHNcQ8W/5FrU14Y0YyqipE
	aMI6EaTRM29LSGHTVY1auZElugqJ26NySNgNzdGVS0OUSXZEYth2DhQirKqhzWML
	ZI3PAT9j+C7lpmHiU5etLmk8zx/V1yKs+JvcirNocPPNggToFUoGSGNhF7Y1G2NI
	UwCLukYU1CbrfB+FkqnCc1sL/9l+64dtmUGg/mWFghGC++AYZWCf4ZNu32liNPTW
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sd926rd1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 10:04:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 03:04:08 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 03:04:07 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [mickledore][PATCH] yajl: Fix CVE-2023-33460
Date: Fri, 11 Aug 2023 18:04:06 +0800
Message-ID: <20230811100406.3490196-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: gQCYJK_8upVc1RJCJTZXy8TsMpA6aEWv
X-Proofpoint-ORIG-GUID: gQCYJK_8upVc1RJCJTZXy8TsMpA6aEWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_20,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308110091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 10:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104335

From: Mingli Yu <mingli.yu@windriver.com>

Backport 2 patches [1] [2] to fix CVE-2023-33460.

[1] https://github.com/openEuler-BaseService/yajl/commit/3d65cb0c6db4d433e5e42ee7d91d8a04e21337cf
[2] https://github.com/openEuler-BaseService/yajl/commit/23a122eddaa28165a6c219000adcc31ff9a8a698

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../yajl/yajl/CVE-2023-33460_1.patch          | 43 +++++++++++++++++++
 .../yajl/yajl/CVE-2023-33460_2.patch          | 31 +++++++++++++
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb   |  5 ++-
 3 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_1.patch
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_2.patch

diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_1.patch b/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_1.patch
new file mode 100644
index 000000000..c53899112
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_1.patch
@@ -0,0 +1,43 @@
+From 3d65cb0c6db4d433e5e42ee7d91d8a04e21337cf Mon Sep 17 00:00:00 2001
+From: wujing <wujing50@huawei.com>
+Date: Thu, 14 Feb 2019 03:12:30 +0800
+Subject: [PATCH] yajl: fix memory leak problem
+
+reason: fix memory leak problem
+
+CVE: CVE-2023-33460
+
+Upstream-Status: Backport [https://github.com/openEuler-BaseService/yajl/commit/3d65cb0c6db4d433e5e42ee7d91d8a04e21337cf]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/yajl_tree.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/yajl_tree.c b/src/yajl_tree.c
+index 3d357a3..4b3cf2b 100644
+--- a/src/yajl_tree.c
++++ b/src/yajl_tree.c
+@@ -143,7 +143,7 @@ static yajl_val context_pop(context_t *ctx)
+     ctx->stack = stack->next;
+ 
+     v = stack->value;
+-
++    free (stack->key);
+     free (stack);
+ 
+     return (v);
+@@ -444,6 +444,10 @@ yajl_val yajl_tree_parse (const char *input,
+              snprintf(error_buffer, error_buffer_size, "%s", internal_err_str);
+              YA_FREE(&(handle->alloc), internal_err_str);
+         }
++        while(ctx.stack != NULL) {
++             yajl_val v = context_pop(&ctx);
++             yajl_tree_free(v);
++        }
+         yajl_free (handle);
+         return NULL;
+     }
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_2.patch b/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_2.patch
new file mode 100644
index 000000000..6e9b119b5
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_2.patch
@@ -0,0 +1,31 @@
+From 23a122eddaa28165a6c219000adcc31ff9a8a698 Mon Sep 17 00:00:00 2001
+From: "zhang.jiujiu" <282627424@qq.com>
+Date: Tue, 7 Dec 2021 22:37:02 +0800
+Subject: [PATCH] fix memory leaks
+
+CVE: CVE-2023-33460
+
+Upstream-Status: Backport [https://github.com/openEuler-BaseService/yajl/commit/23a122eddaa28165a6c219000adcc31ff9a8a698]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/yajl_tree.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/yajl_tree.c b/src/yajl_tree.c
+index b9e6604..0e7bde9 100644
+--- a/src/yajl_tree.c
++++ b/src/yajl_tree.c
+@@ -456,6 +456,9 @@ yajl_val yajl_tree_parse (const char *input,
+              yajl_tree_free(v);
+         }
+         yajl_free (handle);
++	//If the requested memory is not released in time, it will cause memory leakage
++	if(ctx.root)
++	     yajl_tree_free(ctx.root);
+         return NULL;
+     }
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
index cf8dbb183..aae3c6f3a 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
@@ -8,7 +8,10 @@ HOMEPAGE = "http://lloyd.github.com/yajl/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=39af6eb42999852bdd3ea00ad120a36d"
 
-SRC_URI = "git://github.com/lloyd/yajl;branch=master;protocol=https"
+SRC_URI = "git://github.com/lloyd/yajl;branch=master;protocol=https \
+           file://CVE-2023-33460_1.patch \
+           file://CVE-2023-33460_2.patch \
+"
 SRCREV = "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


