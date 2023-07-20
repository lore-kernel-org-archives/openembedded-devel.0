Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8C1EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 11:36:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10702.1689852972020047721
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jul 2023 04:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UEPz+Er9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6565af9f31=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36KATLFT020141
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jul 2023 11:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=VUEAK
	etZqHOxhsYRR8GWp8XhQp8uxITWMQqNS3hNvGo=; b=UEPz+Er9loix8IA6UbUxL
	2bpwHwWepCwEy209nlojSmQKkC1WUY1lnJnG3oqwSAj875F7F+tH5kvhLltsqzKX
	G3oTqiYpvODJhVKtNyYYSbAb+NMiF9Z4KAvL2jrBbu0HQ5GDtcepbi+K2+UV5tCv
	akK65aq7yUejdV1rGWkf/XZxJJ01+N8cIhjvgCg46wE9hb8iTMdvx/iaU0xzseh4
	sxAsdXV/JNg8Z2L2wLHoOMsrSWn0ig9sV2Y7RLbXV+msefiLybKQV8e5+8HBau7B
	I2ZTCd+02jqIwjbhco8/TF3bXK9CidfwKpu4JzTwMiDQtN+P/Hp+FeKEsNtaSf9h
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run9jvjt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jul 2023 11:36:10 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 04:35:55 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][master][mickledore][kirkstone][PATCH 1/1] yasm: fix CVE-2023-31975
Date: Thu, 20 Jul 2023 11:35:41 +0000
Message-ID: <20230720113541.3632386-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: dBLL3GSriTlRMbE6ocHIBzbiCiUZJY6Y
X-Proofpoint-ORIG-GUID: dBLL3GSriTlRMbE6ocHIBzbiCiUZJY6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_04,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxlogscore=782 phishscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307200098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jul 2023 11:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103969

yasm v1.3.0 was discovered to contain a memory leak via the function
yasm_intnum_copy at /libyasm/intnum.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-31975
https://github.com/yasm/yasm/issues/210

Upstream patches:
https://github.com/yasm/yasm/commit/b2cc5a1693b17ac415df76d0795b15994c106441

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../yasm/yasm/CVE-2023-31975.patch            | 29 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch
new file mode 100644
index 000000000..ae10e99c2
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch
@@ -0,0 +1,29 @@
+From b2cc5a1693b17ac415df76d0795b15994c106441 Mon Sep 17 00:00:00 2001
+From: Katsuhiko Gondow <gondow@cs.titech.ac.jp>
+Date: Tue, 13 Jun 2023 05:00:47 +0900
+Subject: [PATCH] Fix memory leak in bin-objfmt (#231)
+
+Upstream-Status: Backport [https://github.com/yasm/yasm/commit/b2cc5a1693b17ac415df76d0795b15994c106441]
+
+CVE: CVE-2023-31975
+---
+ modules/objfmts/bin/bin-objfmt.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/modules/objfmts/bin/bin-objfmt.c b/modules/objfmts/bin/bin-objfmt.c
+index 18026750..a38c3422 100644
+--- a/modules/objfmts/bin/bin-objfmt.c
++++ b/modules/objfmts/bin/bin-objfmt.c
+@@ -1680,6 +1680,10 @@ static void
+ bin_section_data_destroy(void *data)
+ {
+     bin_section_data *bsd = (bin_section_data *)data;
++    if (bsd->align)
++        yasm_xfree(bsd->align);
++    if (bsd->valign)
++        yasm_xfree(bsd->valign);
+     if (bsd->start)
+         yasm_expr_destroy(bsd->start);
+     if (bsd->vstart)
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 3dd382be1..19686ff27 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -12,6 +12,7 @@ PV = "1.3.0+git${SRCPV}"
 SRCREV = "ba463d3c26c0ece2e797b8d6381b161633b5971a"
 SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0001-Do-not-use-AC_HEADER_STDC.patch \
+           file://CVE-2023-31975.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.40.0


