Return-Path: <nat.bailey@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB027C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 22:41:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.468.1685572906170952291
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 15:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=prdDY2Pk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55156f2d67=nat.bailey@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34VMfjvY029219
	for <Openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 22:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=kboxlY1ErZ4NiGqXKuDjlUBSr7r68Kqml2i6ByVovk8=;
 b=prdDY2Pkbfz3eXuMNAyCtiCyXGma/MRSdkjKGfbMqo0oqYyeQO/OORHtsbynSFmTMG7p
 hINx1YzKF69W227l8qAVSxMsse6JQ9L7UfXUTxh5F3u3Sbc84cC3b/I9mVj4uvPf4cd1
 2k//tkZN3N6RVeIreI8swjNiXrLINjMLnEjpToKD+AuvnuODp2NIYn/3lkbQc8INCXv3
 lj2X8L4Ajj9sZKM9xkpFbWXuICJhH60pknIMiKyKH6x1uzaA5s5FGs7GXBj9pWyJybw/
 VLnkuTyVwZVC02T368/xtvqWxpPJ40oIml53w9UYVOLNkIJohvbw/4SzZ2NYm6JQec2d GQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qu8u8m996-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <Openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 22:41:45 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 15:41:43 -0700
Received: from dreyna-dlerner-T5600.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 15:41:43 -0700
From: Nat Bailey <nat.bailey@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
CC: <nat.bailey@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH] libyang: backport a fix for CVE-2023-26916
Date: Wed, 31 May 2023 15:34:35 -0700
Message-ID: <20230531223435.2927651-1-nat.bailey@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qG1dg4WwltcODGBWskoDyScUu7WyDuuV
X-Proofpoint-GUID: qG1dg4WwltcODGBWskoDyScUu7WyDuuV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_16,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 mlxlogscore=772 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305310191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 22:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103075

From: Natasha Bailey <nat.bailey@windriver.com>

This patch fixes a bug in libyang which could cause a null
pointer dereference from a call to strcmp.

Since this recipe includes ptests, the tests were run twice
(once before the patch and once after) with the same results:
all tests passing except utest_types, which is skipped.

Signed-off-by: Natasha Bailey <nat.bailey@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../libyang/libyang/CVE-2023-26916.patch      | 57 +++++++++++++++++++
 .../libyang/libyang_2.0.164.bb                |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch

diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch
new file mode 100644
index 000000000..f3af3dbff
--- /dev/null
+++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch
@@ -0,0 +1,57 @@
+From dc668d296f9f05aeab6315d44cff3208641e3096 Mon Sep 17 00:00:00 2001
+From: Michal Vasko <mvasko@cesnet.cz>
+Date: Mon, 13 Feb 2023 10:23:13 +0100
+Subject: [PATCH] schema compile UPDATE do not implement 2 same modules
+
+CVE: CVE-2023-26916
+Upstream-Status: Backport [https://github.com/CESNET/libyang/commit/dc668d296f9f05aeab6315d44cff3208641e3096]
+
+Refs #1979
+---
+ src/schema_compile.c | 20 +++++++-------------
+ 1 file changed, 7 insertions(+), 13 deletions(-)
+
+diff --git a/src/schema_compile.c b/src/schema_compile.c
+index ed768ba0..68c0d681 100644
+--- a/src/schema_compile.c
++++ b/src/schema_compile.c
+@@ -1748,7 +1748,7 @@ lys_has_compiled_import_r(struct lys_module *mod)
+ LY_ERR
+ lys_implement(struct lys_module *mod, const char **features, struct lys_glob_unres *unres)
+ {
+-    LY_ERR ret;
++    LY_ERR r;
+     struct lys_module *m;
+ 
+     assert(!mod->implemented);
+@@ -1757,21 +1757,15 @@ lys_implement(struct lys_module *mod, const char **features, struct lys_glob_unr
+     m = ly_ctx_get_module_implemented(mod->ctx, mod->name);
+     if (m) {
+         assert(m != mod);
+-        if (!strcmp(mod->name, "yang") && (strcmp(m->revision, mod->revision) > 0)) {
+-            /* special case for newer internal module, continue */
+-            LOGVRB("Internal module \"%s@%s\" is already implemented in revision \"%s\", using it instead.",
+-                    mod->name, mod->revision ? mod->revision : "<none>", m->revision ? m->revision : "<none>");
+-        } else {
+-            LOGERR(mod->ctx, LY_EDENIED, "Module \"%s@%s\" is already implemented in revision \"%s\".",
+-                    mod->name, mod->revision ? mod->revision : "<none>", m->revision ? m->revision : "<none>");
+-            return LY_EDENIED;
+-        }
++        LOGERR(mod->ctx, LY_EDENIED, "Module \"%s@%s\" is already implemented in revision \"%s\".",
++                mod->name, mod->revision ? mod->revision : "<none>", m->revision ? m->revision : "<none>");
++        return LY_EDENIED;
+     }
+ 
+     /* set features */
+-    ret = lys_set_features(mod->parsed, features);
+-    if (ret && (ret != LY_EEXIST)) {
+-        return ret;
++    r = lys_set_features(mod->parsed, features);
++    if (r && (r != LY_EEXIST)) {
++        return r;
+     }
+ 
+     /*
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
index 2817be7c8..7875c1ef7 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
@@ -11,6 +11,7 @@ SRCREV = "a0cc89516ab5eca84d01c85309f320a94752a64c"
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
            file://libyang-add-stdint-h.patch \
            file://run-ptest \
+           file://CVE-2023-26916.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


