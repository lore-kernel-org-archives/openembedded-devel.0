Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD2FCAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 07:11:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11854.1758870676013581451
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 00:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mpe+3GPm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364797e57=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q6UMTS1801024
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=cg6My+D7u+Z/YnS5AwgL
	Yu+knlucNnhGm9FMwP/FKfg=; b=mpe+3GPmBkRBbP6vu3v75QCgGCsisBz8ehrj
	NLTd1BrmoMrFGkyKw2xLxb6+7TAbZN7i7bk/8/pli6hlXmEWbPFvB5aLdBd9NC4l
	/WMVh7MbvHzM3QnQCQf0bP+0pSYwgEReBYLf6Kwce+X9H6wXULe3XtWBMOtm+Afr
	SIKULb9g6fxIHkjlvLroRUMEPEzJI+B+C7OibQAVcn1rLn1nl9jv7XQ0JnELLhGi
	vsLf2Kxk+TpGXKwaK4WKOqQ87sTV05gh+8n9MxO/go/2rbVffAdgNBH+8jwmnRJ3
	pRQIALImdbdgLQboKnpENyuk/K1p+puJLxvmxvsz9C6wxfdsXw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsm8gbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:11:14 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 00:10:33 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 26 Sep 2025 00:10:31 -0700
From: <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone[PATCH 1/1] polkit: fix CVE-2025-7519
Date: Fri, 26 Sep 2025 12:41:06 +0530
Message-ID: <20250926071106.1053540-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: JP9scY6GP3K5qlAUDMldXMj8Dy52aEZN
X-Authority-Analysis: v=2.4 cv=TJhIilla c=1 sm=1 tr=0 ts=68d63c92 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=e5mUnYsNAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=ThauUFfizAOFXK_lL9MA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: JP9scY6GP3K5qlAUDMldXMj8Dy52aEZN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA2NSBTYWx0ZWRfXxb3RFSdjhOMz
 BiUuaSUtK0dAn4Q4pbufJ4Iu/JxUL9nEWU5luqMUXJatkeiDHmTGmBw+EK+DH6JVwX5x+Tyr9Kt
 0DDcLmCUjo7Dj6HdOQzIDVa0sc5C9zh/Qqc1FRmSrCG0ePsxeRs0U/hHUaRA4fzL4w7oNVl0rcc
 MuaycIOs6Zr/fQy9hqbMj0+lJZO9J8ZDUvGUVR9n3ACS409ENhDgEhsCIZPHRS/dG1VbUOsb3Fh
 3LYG0Jt/BYuGV4hjEUOm3Pyab1G3+NWxcyH2bty2j01PR7G9rh/wJdz9iiS+NsJz3FSg95jtewe
 UydfjfHIB8m7zgKtSDk4U0v1jyDrdelM7lRCIGSINBKays+Z9B8dbZJtB3L6oi1aMOghx50yVGz
 R8AvLg6WSmgYQZHGgq8EuKNBH/RwIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119894

From: Praveen Kumar <praveen.kumar@windriver.com>

A flaw was found in polkit. When processing an XML policy with 32 or
more nested elements in depth, an out-of-bounds write can be triggered.
This issue can lead to a crash or other unexpected behavior, and
arbitrary code execution is not discarded. To exploit this flaw, a
high-privilege account is needed as it's required to place the
malicious policy file properly.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-7519

Upstream-patch:
https://github.com/polkit-org/polkit/commit/107d3801361b9f9084f78710178e683391f1d245

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../polkit/files/CVE-2025-7519.patch          | 34 +++++++++++++++++++
 .../recipes-extended/polkit/polkit_0.119.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2025-7519.patch

diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2025-7519.patch b/meta-oe/recipes-extended/polkit/files/CVE-2025-7519.patch
new file mode 100644
index 0000000000..78945a88fc
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/CVE-2025-7519.patch
@@ -0,0 +1,34 @@
+From 107d3801361b9f9084f78710178e683391f1d245 Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Fri, 6 Jun 2025 13:25:55 +0200
+Subject: [PATCH] Nested .policy files cause xml parsing overflow leading to
+ crash
+
+CVE: CVE-2025-7519
+
+Upstream-Status: Backport [https://github.com/polkit-org/polkit/commit/107d3801361b9f9084f78710178e683391f1d245]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/polkitbackend/polkitbackendactionpool.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/polkitbackend/polkitbackendactionpool.c b/src/polkitbackend/polkitbackendactionpool.c
+index 43f89cb..f4acca9 100644
+--- a/src/polkitbackend/polkitbackendactionpool.c
++++ b/src/polkitbackend/polkitbackendactionpool.c
+@@ -739,6 +739,12 @@ _start (void *data, const char *el, const char **attr)
+   guint num_attr;
+   ParserData *pd = data;
+
++  if (pd->stack_depth < 0 || pd->stack_depth >= PARSER_MAX_DEPTH)
++    {
++      g_warning ("XML parsing reached max depth?");
++      goto error;
++    }
++
+   for (num_attr = 0; attr[num_attr] != NULL; num_attr++)
+     ;
+
+--
+2.40.0
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.119.bb b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
index eff80cd43d..6f39af9d78 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.119.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.
            file://0002-CVE-2021-4115-GHSL-2021-077-fix.patch \
            file://0003-Added-support-for-duktape-as-JS-engine.patch \
            file://0004-Make-netgroup-support-optional.patch \
+           file://CVE-2025-7519.patch \
            "
 SRC_URI[sha256sum] = "c8579fdb86e94295404211285fee0722ad04893f0213e571bd75c00972fd1f5c"
 
-- 
2.40.0


