Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E40E98FC7
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:19:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126483.1775715549138480234
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C+VGsW2v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394sSA81739891
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Apr 2026 06:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=A9Ms0tQdkb6ZnKHb5zf4nsTuc9oNwvKPNoJBreSK7+Y=; b=C+VGsW2vObU4
	kqDIj70PuSQWSIvFO8GQdY5JebnCLopADNmH+5JzYWCgp7AQ3QHFZ8haaBdIXwuO
	QtgPZa5UjNPPxBrCKxzvJtdnN34/FDnfZHz726ln54HJqxwRp7uYkn+wJgN9k9Zs
	//1PYpYxvFHm8wI8K3fnM0hR/zQxrBIqcNjmFbRN/e1dIV0RTx4tWRqASup7JU7O
	+xVssd/v/J30OEdk539uopFMuLcSTfxQs6dq9BDLy+kYf8BEkzqfoy6CJTCQxiOE
	gIIfTF9exCsvj6o08D4PhASup8wKHiBY4Axx7xct5yDDtKLOTqnW+ryuYVt1s9H9
	OJT5bLzjPw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrybrbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 06:19:07 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:19:06 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:19:06 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH 01/11] yasm: fix CVE-2021-33454
Date: Thu, 9 Apr 2026 14:18:54 +0800
Message-ID: <20260409061904.1694992-2-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061904.1694992-1-jinfeng.wang.cn@windriver.com>
References: <20260409061904.1694992-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d744dc cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=UqCG9HQmAAAA:8 a=uXtSGE2kdRKVYVFo3EAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zL5ILRFYZ1jpJ99P_aVhMPLgM8xe9y7s
X-Proofpoint-ORIG-GUID: zL5ILRFYZ1jpJ99P_aVhMPLgM8xe9y7s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfXx2LTlhHTAQWp
 n1+ntY4HlBm4zQq9QfSytzdiQFAYWebnXfaZz+nP4Q8Q1ddzUMN3ZjQOqStBejTE7vPJeypynZK
 /K/5j4gIL8Q2Jjh2oehWn9lxebsrDkkpLfMB6Kuvg2o/zJeRLgjbP+Y00ncjOqNeVftW3xbsyJy
 p4FQxoDh0dBo9wLlZ3xOGc3x3SSCkpnhqVGEUgqVODwaSfCdhpCvU9GVo7hb1D4ZN46x/WrPQVP
 LeH7mBorzL8HvJf0eFdbnsaWnoKfOgwrNMdU5scyBXCpvMgAcfIHP4dzcK2NxBzGGU9TnqKSmHA
 CHadi9OwZwsBmaS+JL44DRs5Vn/bpaeo1lc3jfBGap6EkPs1yleDaUgDPbJ73r1fIEprTHyPz5u
 NsvxztGjVMEI3gOpMxRXRnDAqngBHL5V7Zjtd42Q9TUH4cyEBYoC9ioFOPwL1zCvqwNuPFUSVZ1
 hNPwOpYgpofKBQVefcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 06:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126112

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


