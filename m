Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017D6CAC5B8
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:11:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12468.1758874271329717688
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 01:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZBaRMsbW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364979e65=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q69rT01767034
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Dv9EKKGSawaPr3cSgJEE
	VqDGTXTeRvh4uRySpqR4xbY=; b=ZBaRMsbW6yXC3iCPOCma+9o3yb+DLBm+KjhO
	GJ9RDKabAn4nJm8SR0HXDaSjQC2xHPCbVuh5pqS7kMznjKtDwppES9HRG1Wyvi+N
	iboCa7+Sn2FEgsBMvvBMSqxlhjh38J043Vo2NZ94qgF4NAAOBZV/q91t1Z4mFtjQ
	RgQ27mSRBYmyaOAbl7A7QBoH+2PKCfm0JxXhnawOdfYE8PrQ0xB15fSNEUAMiODB
	glNnCoAjaFXHpLMYax07P0jeIrPz4wLFbSczVPpaAh41fBWMgVQHkFkc8NDniKyx
	DXAPOP1d/ekOJ7bQnP7I1n9kIGmPr53bU5B1VEeDqcpZOSMXqg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsm8j1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:11:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 01:10:28 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 26 Sep 2025 01:10:27 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 1/3] python3-mlcommons-loadgen: support reproducibility
Date: Fri, 26 Sep 2025 16:10:24 +0800
Message-ID: <20250926081026.3104475-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tkz8bUSZPOqxBZW9hUf3nnTtETO8k-9B
X-Authority-Analysis: v=2.4 cv=TJhIilla c=1 sm=1 tr=0 ts=68d64a9e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=SsMK-6ewAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=y3uUKTl_r5acGo3yIGgA:9 a=49hUO6naoDravHwzbBTq:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: tkz8bUSZPOqxBZW9hUf3nnTtETO8k-9B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA3NCBTYWx0ZWRfX4cuPV8i3X4BA
 HJ7YjgMnB0XeqZQoViqysaO6z8FwmkTv2JPSdwvgK5MzT+baDWXGyTmWhVc+6QSkQuc9SBUhk4M
 MTUa2QVfcEcKUs1F1RBZnSYEUmS2Wxx2AF/bJ4Yfm8uijkQ5ORZ38Ps62fswHyxUkjDq+A6BVdW
 qOBh9RL4a7WEcB5Z04UgyQlvh9oCbOeXxH0LeHKQsWKYvL2wZGjqWpt09jrsJR5pA/zwQLZIOAT
 Ojl86B4PGFAWVpZi+Myz3ZxxTBaqW7OjjL40m+PBlslClf/HgZJiqoJKRlY1575dhvuJjG7hBT8
 J/tYMJhxOoxvxaZa8pgcHrKpCco5r5iUTncRsUaO5uNXFwiIGkmnYmNwB5ukmXJ8+5LDEp7/WVD
 E/0G1JGe5WFMsNew7528BrK1P6wtbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119895

Implement the SOURCE_DATE_EPOCH specification[1] for reproducible
builds. If SOURCE_DATE_EPOCH is set, use it as timestamp instead of the
current time.

[1] https://reproducible-builds.org/specs/source-date-epoch/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/source-date-epoch.patch             | 41 +++++++++++++++++++
 .../python3-mlcommons-loadgen_5.1.0.bb        |  4 ++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-mlcommons-loadgen/files/source-date-epoch.patch

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/files/source-date-epoch.patch b/meta-python/recipes-devtools/python3-mlcommons-loadgen/files/source-date-epoch.patch
new file mode 100644
index 0000000000..32e529d483
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/files/source-date-epoch.patch
@@ -0,0 +1,41 @@
+From dd7925397b84c2a327cd4594edba9f7ca5acef61 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 Sep 2025 14:02:23 +0800
+Subject: [PATCH] Honor the SOURCE_DATE_EPOCH variable
+
+Implement the SOURCE_DATE_EPOCH specification[1] for reproducible
+builds. If SOURCE_DATE_EPOCH is set, use it as timestamp instead of the
+current time.
+
+[1] https://reproducible-builds.org/specs/source-date-epoch/
+
+Upstream-Status: Submitted [https://github.com/mlcommons/inference/pull/2345]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ version_generator.py | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/version_generator.py b/version_generator.py
+index 2e75243..5202da9 100644
+--- a/version_generator.py
++++ b/version_generator.py
+@@ -110,8 +110,13 @@ def generate_loadgen_version_definitions(cc_filename, loadgen_root):
+     # Write the version into the function definition
+     ofile.write(func_def("Version", f"\"{version_contents}\""))
+ 
+-    date_time_now_local = datetime.datetime.now().isoformat()
+-    date_time_now_utc = datetime.datetime.utcnow().isoformat()
++    if os.environ.get('SOURCE_DATE_EPOCH', False):
++        source_date_epoch = int(os.environ['SOURCE_DATE_EPOCH'])
++        date_time_now_local = datetime.datetime.fromtimestamp(source_date_epoch).isoformat()
++        date_time_now_utc = datetime.datetime.fromtimestamp(source_date_epoch, tz=datetime.timezone.utc).isoformat()
++    else:
++        date_time_now_local = datetime.datetime.now().isoformat()
++        date_time_now_utc = datetime.datetime.utcnow().isoformat()
+     ofile.write(func_def("BuildDateLocal", '"' + date_time_now_local + '"'))
+     ofile.write(func_def("BuildDateUtc", '"' + date_time_now_utc + '"'))
+ 
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.0.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.0.bb
index abc47172c1..7bb2e9d4dd 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.0.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.0.bb
@@ -14,6 +14,10 @@ DEPENDS = "python3-pybind11-native"
 
 inherit setuptools3 pypi
 
+SRC_URI += " \
+    file://source-date-epoch.patch \
+"
+
 PYPI_PACKAGE = "mlcommons_loadgen"
 UPSTREAM_CHECK_PYPI_PACKAGE = "mlcommons_loadgen"
 
-- 
2.34.1


