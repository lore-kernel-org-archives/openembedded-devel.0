Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFEACAC5AC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:20:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12566.1758874801251578415
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 01:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mrM+vsnz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364979e65=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q6DArv1238173
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Dv9EKKGSawaPr3cSgJEEVqDGTXTeRvh4uRySpqR4xbY=; b=mrM+vsnzZ8QO
	+r/9HY4Vbj0liPrmwie4SedvzAC9d5F9joZFTcp5FSd5RH5ufIBeEtdsenoRfdq1
	4FqWHwobtY1n1S+ESrPFTtSEeci3BgWSIJOXBI6RHZLgxGYI/4Re/kmKeTytmi86
	CTJfVHC2lBTQ7bP6RilObPXPDynCe80DqhTiV4w4XeA6bjEQ0OurFwhBHhecrpOj
	qkso4E9b2Mbpy0u705SWa3hTNrU6QR0pTSRzuZPE+3cFCM7vdkP+EIXeYr0PZfNw
	+LqXhNxa0tnAVTcOXFQP2Nte0/Fs7/91yztR2Q7xfG3xEQHtThdlwLcKnoOLYklq
	zd53LW3odQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsh8j74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:20:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 01:19:18 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 26 Sep 2025 01:19:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v4 4/6] python3-mlcommons-loadgen: support reproducibility
Date: Fri, 26 Sep 2025 16:19:12 +0800
Message-ID: <20250926081914.3127272-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926081914.3127272-1-hongxu.jia@windriver.com>
References: <20250926081914.3127272-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA3NiBTYWx0ZWRfX+QihXPD3fmR4
 T2xbzwhBs0PHx07g3qBt5ICkulVJbz92mzI0u6M4avziyv5v4v8oAAwLx0JoB+zqzl8q3wO3pF6
 06UH/ixpmGa6eQqsHpCubeaqtaam6v4JkKSYrrRgjo0afHkOP6wkvcPZK9knK1gZM4PtFHdUi2U
 GOxKO7AYDUvmYQVS75xe9/lTyCD+RvxnPiCeu4IXrsss3tGSsOWr73cuhCBLjxpRSTApJgt1b1R
 mJGULJlPyg5LHwtOdWcssXWZDzkUhQVj6Sc9kCC7nXXe+mkJnwTUhQTj9nJvCmm9/H9eJPj5ruG
 DHZRFneAnGujO+Op/uz1sXtiEZEfAskwjmMNAdghtzdJt7twwjR1QRjWh4mnN1foSpqGiGwBGlF
 3YAthxtH0liU43YRIpL0u9MB7n9Y2Q==
X-Proofpoint-ORIG-GUID: 35cY5hmv7d2DaDey_ntAzjDY5H_MBBn0
X-Proofpoint-GUID: 35cY5hmv7d2DaDey_ntAzjDY5H_MBBn0
X-Authority-Analysis: v=2.4 cv=U4WfzOru c=1 sm=1 tr=0 ts=68d64cb0 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=SsMK-6ewAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=y3uUKTl_r5acGo3yIGgA:9 a=49hUO6naoDravHwzbBTq:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119902

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


