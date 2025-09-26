Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C73ACAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 07:08:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11773.1758870492164427146
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 00:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cMfNgeL2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364797e57=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q6UMTP1801024
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=OAPIOo51atxbJpjIjspC
	xSLpuF0mzgPUxPUWziVYaJE=; b=cMfNgeL2dgFogdneJVcQzn2CoExjDU2SgLjh
	fy2aMIz66jo4/OBGw9OgpCxvEUAQKvIrj0ZaX3Axt8Cy7EpHhM0xSw6KbiCnyruM
	KI11W/aXUt8ex8/2Y4P2TZKhKz7fEKT8dwG9kOlqjn7w9mEqVwyitnRvBYfIF1oQ
	z8N+aCMDqNAPDtAxagPnEQEwO6Zj6UrT8IxuDFcYoHymUk2R/qZbADNO/Hy5cWFi
	8rMFv9kSFGtzNF02BWh6wGO1emi6Mf4oumL+DcaCSO+elBP8s8nvsltoLMb1G91G
	pw+cT+4DbOn+ON3F7J4Ha/0XVCphybp30ibxoT+kHh0K8nN79w==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsm8g8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:08:11 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 00:07:29 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 26 Sep 2025 00:07:28 -0700
From: <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar[PATCH 1/1] polkit: fix CVE-2025-7519
Date: Fri, 26 Sep 2025 12:38:02 +0530
Message-ID: <20250926070802.1046802-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: au5OEQqmrIhF-s-G44AD71kqU6Zyo0Ws
X-Authority-Analysis: v=2.4 cv=TJhIilla c=1 sm=1 tr=0 ts=68d63bdb cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=ThauUFfizAOFXK_lL9MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: au5OEQqmrIhF-s-G44AD71kqU6Zyo0Ws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA2NSBTYWx0ZWRfXydqyIWICm6au
 EuBEhcNNHxV7ltKg632nYdGjr2wD4JsgCIFKzHURKqqOnyvPV/Rgs8noFysZ3TEIp87GJ+g+JdN
 KQLXDGfiImcLEWm4gUjksf1ibSrzt5b7fsaBl9CzNrjL3C4TFGKIA2OhV6EMdJwigwWv4cBwVAp
 NIs28RIEbGMmWgyh1b/y9AjW3sK7TEbdVIMGUvlS92GrGvNRVOGH/8ZtD03BFqO3iTaN1SS8EKp
 oWYG5yNdfHygBbSwINOgDBzTVLcInRtGBfUrBQXqF+j6J8fU+62QKOx3oLwN3oRs5/T/bNT9ugr
 M1SZ5M12Lrs8keEwKALt7v3jzeknNEzyQgydrLInw9Wx6cNHG1cmqA1yOMZRD2/WUjnpUmCCl2c
 7nTEXEjyr7bg7uTtM6Eazrq1PpL9dA==
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
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119892

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
 meta-oe/recipes-extended/polkit/polkit_126.bb |  5 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
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
diff --git a/meta-oe/recipes-extended/polkit/polkit_126.bb b/meta-oe/recipes-extended/polkit/polkit_126.bb
index 64aba7b2dd..82d2ef2e6a 100644
--- a/meta-oe/recipes-extended/polkit/polkit_126.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_126.bb
@@ -5,7 +5,10 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb"
 BUGTRACKER = "https://github.com/polkit-org/polkit/issues"
 
-SRC_URI = "git://github.com/polkit-org/polkit.git;protocol=https;branch=main"
+SRC_URI = "\
+    git://github.com/polkit-org/polkit.git;protocol=https;branch=main \
+    file://CVE-2025-7519.patch \
+"
 
 S = "${WORKDIR}/git"
 SRCREV = "d627b0d1e1108563658dabe3fb8d2a065e64df10"
-- 
2.40.0


