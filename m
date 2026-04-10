Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187B2F364AE
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 07:05:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150881.1775804712932937908
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 00:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZxC/+pqj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8560f54642=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A3mnF11774203
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=A9Ms0tQdkb6ZnKHb5zf4nsTuc9oNwvKPNoJBreSK7+Y=; b=ZxC/+pqjT0qJ
	CajEq5pT7hfMNTPn9kbbfRvsFXkIOb+1+mkHA/rPXJfdocjozqE0suK9QY7p6bsF
	FxgKYbeSbuCdbn3W9GRIw7qLeFol/CR/quvFeMWfZAU4LMeNdpN11+kOKv4CNcTn
	giYbfwYzb8mq0jkpdGQgYHLo5OizfkJHWvKC06wcnPzSgw7uI4sYLSMM1zUA8pid
	aySu0VXzHciM8+WGBTSMNbKFKjHNhwGQ9ntRbTCkQ/g9mXuYAKnxYTDgj88zLlIf
	7KPex6hruhFk9+sS4nkM5/uwKaqu/VZod8ISZsht2F2DFhLms1cnqHFNgGpmoP6x
	jyAt5X4zEA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqn77y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:11 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 10 Apr 2026 00:05:10 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 10 Apr 2026 00:05:09 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH v2 01/11] yasm: fix CVE-2021-33454
Date: Fri, 10 Apr 2026 15:04:58 +0800
Message-ID: <20260410070508.1104455-2-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d8a127 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=UqCG9HQmAAAA:8 a=uXtSGE2kdRKVYVFo3EAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: cv7KwWqgNaIcLU5nVAIj-Di4ZqlrB4ca
X-Proofpoint-GUID: cv7KwWqgNaIcLU5nVAIj-Di4ZqlrB4ca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MyBTYWx0ZWRfX/1N3Ru7khVYK
 c3PMbjEbBq3P0buc2xm6ZgrzCHEu2e3htce4ObiBICHHm77y48xt5Qzdpj+j+UHEa1RBO50RMan
 OG2MEnr0BUJflFcm7Xq14uz3hYJDWOdOK15+dX22E6XiUb/RbnTBNpDbpjP0o6m1f1udTigx6eC
 sPcope7uEFbrPvM8fZqZIewmzS23qxXfOTFbUZP4RIxlJRpdlZp5aUoqFwiSngcq5/fO7KZIE6z
 lgwBVLegEMq19VWQg/32asuc91Cc5wImzDQlHWzoejt5Yyi/bpdaI4GdbPPzJAZX+eMYSXdSprn
 ypCHxK9gS6XqrOEDLtedITY3n5Rxr/pFMJqoEY5B2xfxfxUudizvGJ5T+A6YXuS/4xFzIBBNUZA
 iIl2I/KgjeJftbT2LlgGFtKqEcmiJfBkTHRTmZAh76gjtQiYty6rWxz8mIXT9kqGY1Chglrw8yb
 PYEcLOPUK89ieB6+fhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126223

From: Guocai He <guocai.he.cn@windriver.com>

An issue was discovered in yasm version 1.3.0. There is a
NULL pointer dereference in yasm_expr_get_intnum() in
libyasm/expr.c.

Backport patch to fix CVE-2021-33454 per reference [1].
[1]: https://security-tracker.debian.org/tracker/CVE-2021-33454

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../yasm/yasm/CVE-2021-33454.patch            | 29 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33454.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33454.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33454.patch
new file mode 100644
index 0000000000..735be93a3f
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33454.patch
@@ -0,0 +1,29 @@
+From 9defefae9fbcb6958cddbfa778c1ea8605da8b8b Mon Sep 17 00:00:00 2001
+From: dataisland <dataisland@outlook.com>
+Date: Fri, 22 Sep 2023 00:21:20 -0500
+Subject: [PATCH] Fix null-pointer-dereference in yasm_expr_get_intnum (#244)
+
+CVE: CVE-2021-33454
+Upstream-Status: Backport [https://github.com/yasm/yasm/commit/9defefae9f]
+
+Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
+---
+ libyasm/expr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libyasm/expr.c b/libyasm/expr.c
+index 5b0c418b..09ae1121 100644
+--- a/libyasm/expr.c
++++ b/libyasm/expr.c
+@@ -1264,7 +1264,7 @@ yasm_expr_get_intnum(yasm_expr **ep, int calc_bc_dist)
+ {
+     *ep = yasm_expr_simplify(*ep, calc_bc_dist);
+ 
+-    if ((*ep)->op == YASM_EXPR_IDENT && (*ep)->terms[0].type == YASM_EXPR_INT)
++    if (*ep && (*ep)->op == YASM_EXPR_IDENT && (*ep)->terms[0].type == YASM_EXPR_INT)
+         return (*ep)->terms[0].data.intn;
+     else
+         return (yasm_intnum *)NULL;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 5ba4f67628..84503e9a8a 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://CVE-2023-29579.patch \
            file://CVE-2021-33464.patch \
            file://CVE-2021-33456.patch \
+           file://CVE-2021-33454.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


