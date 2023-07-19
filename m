Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAB9EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 08:58:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9557.1689757130996214748
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jul 2023 01:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iLLWTaKH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=656445e974=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36J8woHZ001852;
	Wed, 19 Jul 2023 08:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=1vYwX
	Zh8iGy/Wye0Dl1t3Wl0rYT6hYHvft93yfgQwr4=; b=iLLWTaKHc3mwHSIxWNcBj
	NVy0MV43zNEBILRU4f4hVO08BRft3wWwCTWfMW0Z77xsvtMWiTMFeNGhTLkq0FF2
	tuWMu/MZikogA5b6MR0NqfodCfgPjEgMQeY3sxo2eU0P0+siR2ZzMK8pSQtxbthd
	6fZx06pnde08xTi+SGAzX8IF3R8BqxROek/lx+uxF57Lk6hZZBayOKZhk6IcG5F5
	9cCbZ9aEOvHzKWwoG4e/4h1C1AT/7M03/cVf9SPxDMYLG4exq7DD9JajUPDfmugW
	EodXNPxEPk0OP+GtkdOp9TLLF3fcjscpQ78WEB6eCgZmPKvHGV8C2A0Q0qTAaUxZ
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run9juf96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jul 2023 08:58:50 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 01:58:47 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] libyang: fix CVE-2023-26917
Date: Wed, 19 Jul 2023 08:58:27 +0000
Message-ID: <20230719085827.1876580-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: MBWohPpJWOAMkCb29qKA4DZgkZ_Akeg4
X-Proofpoint-ORIG-GUID: MBWohPpJWOAMkCb29qKA4DZgkZ_Akeg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_05,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxlogscore=574 phishscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307190082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jul 2023 08:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103958

libyang from v2.0.164 to v2.1.30 was discovered to contain a NULL
pointer dereference via the function lysp_stmt_validate_value at
lys_parse_mem.c.

References:
https://github.com/CESNET/libyang/issues/1987

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libyang/libyang/CVE-2023-26917.patch      | 40 +++++++++++++++++++
 .../libyang/libyang_2.0.164.bb                |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2023-26917.patch

diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26917.patch b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26917.patch
new file mode 100644
index 000000000..d7ba2fb9a
--- /dev/null
+++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26917.patch
@@ -0,0 +1,40 @@
+From cfa1a965a429e4bfc5ae1539a8e87a9cf71c3090 Mon Sep 17 00:00:00 2001
+From: Michal Vasko <mvasko@cesnet.cz>
+Date: Tue, 18 Jul 2023 10:41:21 +0000
+Subject: [PATCH] parser common BUGFIX handle missing YANG strings
+
+Fixes #1987
+
+CVE: CVE-2023-26917
+
+Upstream-Status:
+Backport[https://github.com/CESNET/libyang/commit/cfa1a965a429e4bfc5ae1539a8e87a9cf71c3090]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/parser_stmt.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/parser_stmt.c b/src/parser_stmt.c
+index 81ccbfca6..2ebf822ab 100644
+--- a/src/parser_stmt.c
++++ b/src/parser_stmt.c
+@@ -52,6 +52,16 @@ lysp_stmt_validate_value(struct lys_parser_ctx *ctx, enum yang_arg val_type, con
+     uint32_t c;
+     size_t utf8_char_len;
+
++    if (!val) {
++	    if (val_type == Y_MAYBE_STR_ARG) {
++		    /* fine */
++		    return LY_SUCCESS;
++	    }
++
++	    LOGVAL_PARSER(ctx, LYVE_SYNTAX, "Missing an expected string.");
++	    return LY_EVALID;
++    }
++
+     while (*val) {
+         LY_CHECK_ERR_RET(ly_getutf8(&val, &c, &utf8_char_len),
+                 LOGVAL_PARSER(ctx, LY_VCODE_INCHAR, (val)[-utf8_char_len]), LY_EVALID);
+--
+2.35.5
diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
index 7875c1ef7..eb3f32251 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
            file://libyang-add-stdint-h.patch \
            file://run-ptest \
            file://CVE-2023-26916.patch \
+	    file://CVE-2023-26917.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.40.0


