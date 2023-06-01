Return-Path: <nat.bailey@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE9BC77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 17:58:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1448.1685642333990493039
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 10:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s0KSeBHi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5516a9a59a=nat.bailey@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351Dc9D4016660
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Jun 2023 10:58:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=kboxlY1ErZ4NiGqXKuDjlUBSr7r68Kqml2i6ByVovk8=;
 b=s0KSeBHiVplE9IVnYUXf91hON+sFlSgqyEHmZtk5k19Yo3o4Z8MOdVnN8BX5rIohpFZl
 b7HlMaFK6ykvp0ijDvfmxu3TU9fR4TiQcOpUQFz8oCnzR9z/rj+9S/rpH0rOLRx93UXd
 UD6hw/t9HrDt3+kgWiCUf+NnvQ+OJoX8xKpWXdgforCCr6ImeHSFs0WivOzlKQL7qU9a
 CwB9rXtPJvPm/u0TBGYnzgPCwTKQRIYN4gSFINKTBTbYVspKqHzcQPzo/3TqqpSqkzDR
 7P+YSq7/5tTuQDN3BV98RmeoJmdH71RgapnOmRX/YmiOHp+qdasrcWxwe+5BHaz7k5mT fg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qud53cx4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 10:58:53 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 10:58:52 -0700
Received: from dreyna-dlerner-T5600.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 10:58:52 -0700
From: Nat Bailey <nat.bailey@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <nat.bailey@windriver.com>,
        <david.reyna@windriver.com>
Subject: [meta-oe][kirkstone][PATCH v2] libyang: backport a fix for CVE-2023-26916
Date: Thu, 1 Jun 2023 10:52:08 -0700
Message-ID: <20230601175208.2942269-1-nat.bailey@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sLbo0crC_ukV2rvgKJUIDOnfTCCAowLC
X-Proofpoint-ORIG-GUID: sLbo0crC_ukV2rvgKJUIDOnfTCCAowLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=775 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010155
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 17:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103084

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


