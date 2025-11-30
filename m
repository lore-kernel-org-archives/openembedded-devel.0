Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6C4CFD376
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 11:21:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2450.1764501690052527470
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 03:21:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BKtLflVd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4429d7dc3a=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUB26ZN219969
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=gRsR/XiypM68YEy42+tD
	HMXAgRabiH1dljhJsEYrRuM=; b=BKtLflVdNX5lCbSVKVzbduPxkt+ILXpsljAK
	RnVBraNhPJTRP34Yf5ANGMKrwtxN8jwg9JwiQxgVPS7gXIv9jghMgB78dqqKH/FO
	d2vpbhhGZnAOtm67YW+ZW/h8zT0fuo15C5HheARcShv9hxQTWHOBhCAR3GebYe7j
	PqkC8TG1bnqVY41kOr7aRZhtGbXw4qD5PqDf56EHgCadFciOeqQIrNB4HQavAq5l
	ROF4iKlDZwdoMxydVUMKhLrPaE7r++g6iblsMsDnVpnEE2yADE3tY8ooicpEGqvv
	5KgBlfFG5V6dbjy7UZOlIHtrlPsCyny70RYgIGw5i2MjlwcQpQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt68u6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:21:28 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 03:21:27 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 03:21:26 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: upgrade 4.2.17 -> 4.2.26
Date: Sun, 30 Nov 2025 16:51:25 +0530
Message-ID: <20251130112125.3009450-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDA5NyBTYWx0ZWRfX/wZNbkPzqtgC
 jR3lw4eSBCymTkFJYQZ75EMZx0fteEgS7Gl0vRSfqvQtExZ7aUsJtZDplqydyoTdlRWCUoaB7yt
 MApU9ElIIJGsKtM1RCSYlsnEKxS0oy5OnbNS201ka1SfarUbKBbGQ2wzUl7X9EG9aMoxYQorWTY
 TCp9u9RahWs120IQjdJ/BrX5VLzI267KEoHheJC385VSVUc/65hCoRaYBkE/uXsHoFlTGnXBaTU
 0vf0smkaWNha1TLr2ZwSQ18Wu689eWecJUTX4j+o571iUrRr9BVifvul7fcwCRLAdW3lsTypmNV
 jPOhvg3Z4XNvyPyL0vkvNugm8Olktf03RAb1ulbMZOh9mUoN02w2sJ9negMcK8/uK/qiiyO1y4t
 oIjkwSVOOPddekQmzP4FSIUMqOk0Gw==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692c28b8 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ArP49Si0AAAA:8 a=t7CeM3EgAAAA:8
 a=hncqJlgY6T_089Ulig8A:9 a=glZLBWN_5F3qvmUqPDV8:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VXsyMI0qMcyapqhhrfHx2F3R916BT9Mq
X-Proofpoint-GUID: VXsyMI0qMcyapqhhrfHx2F3R916BT9Mq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122163

Fixes CVE-2025-64459, CVE-2025-64458, CVE-2025-59682, CVE-2025-59681,
CVE-2025-57833, CVE-2025-48432, CVE-2025-32873, CVE-2025-26699, CVE-2024-56374
and other bug fixes.

Release notes:
https://docs.djangoproject.com/en/dev/releases/4.2.18/
https://docs.djangoproject.com/en/dev/releases/4.2.19/
https://docs.djangoproject.com/en/dev/releases/4.2.20/
https://docs.djangoproject.com/en/dev/releases/4.2.21/
https://docs.djangoproject.com/en/dev/releases/4.2.22/
https://docs.djangoproject.com/en/dev/releases/4.2.23/
https://docs.djangoproject.com/en/dev/releases/4.2.24/
https://docs.djangoproject.com/en/dev/releases/4.2.25/
https://docs.djangoproject.com/en/dev/releases/4.2.26/

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../recipes-devtools/python/python-django.inc   |  6 +++++-
 .../python/python3-django_4.2.17.bb             | 13 -------------
 .../python/python3-django_4.2.26.bb             | 17 +++++++++++++++++
 3 files changed, 22 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_4.2.17.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_4.2.26.bb

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index e030ff4087..7021eb842d 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -3,7 +3,11 @@ HOMEPAGE = "http://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-PYPI_PACKAGE = "Django"
+# From 4.2.21 onwards package name changed to "django". This common include file
+# is used across 2.x, 3.x and 4.x variants hence making this as a weak variable 
+# which can be overwritten in 4.x recipe
+PYPI_PACKAGE ?= "Django"
+
 inherit pypi
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
deleted file mode 100644
index dfce4b85c2..0000000000
--- a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require python-django.inc
-inherit setuptools3
-
-SRC_URI[sha256sum] = "6b56d834cc94c8b21a8f4e775064896be3b4a4ca387f2612d4406a5927cd2fdc"
-
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-sqlparse \
-"
-
-# Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-# default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.17" can be added to local.conf
-DEFAULT_PREFERENCE = "-1"
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.26.bb b/meta-python/recipes-devtools/python/python3-django_4.2.26.bb
new file mode 100644
index 0000000000..7f0b1c9239
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.26.bb
@@ -0,0 +1,17 @@
+require python-django.inc
+#From 4.2.22 onwards setuptools configuration migrated to pyproject.toml
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "9398e487bcb55e3f142cb56d19fbd9a83e15bb03a97edc31f408361ee76d9d7a"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-sqlparse \
+"
+
+# PYPI package name changed from Django -> django
+PYPI_PACKAGE = "django"
+
+# Set DEFAULT_PREFERENCE so that the LTS version of django is built by
+# default. To build the 4.x branch, 
+# PREFERRED_VERSION_python3-django = "4.2.26" can be added to local.conf
+DEFAULT_PREFERENCE = "-1"
-- 
2.35.5


