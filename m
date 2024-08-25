Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEF1C5320E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 15:59:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.33983.1724601579999790206
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Aug 2024 08:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8967a4d043=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47PFiROp016014
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 15:59:39 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41754q94m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 15:59:39 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 25 Aug 2024 08:59:37 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 25 Aug 2024 08:59:36 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: Upgrade 4.2.10 -> 4.2.15
Date: Sun, 25 Aug 2024 15:59:33 +0000
Message-ID: <20240825155933.2845236-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OkUuz91bgUkyyXTQL6LKIwfasr8jZlZC
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=66cb54eb cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=ArP49Si0AAAA:8 a=GyBaeeDn-W7M0Qku6jcA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=glZLBWN_5F3qvmUqPDV8:22
X-Proofpoint-ORIG-GUID: OkUuz91bgUkyyXTQL6LKIwfasr8jZlZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-25_13,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408250128
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 15:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111934

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fixes for - CVE-2024-42005, CVE-2024-41991, CVE-2024-41990, CVE-2024-41989

Release Notes:
https://docs.djangoproject.com/en/dev/releases/4.2.15/
https://docs.djangoproject.com/en/dev/releases/4.2.14/
https://docs.djangoproject.com/en/dev/releases/4.2.13/
https://docs.djangoproject.com/en/dev/releases/4.2.12/
https://docs.djangoproject.com/en/dev/releases/4.2.11

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{python3-django_4.2.10.bb => python3-django_4.2.15.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.10.bb => python3-django_4.2.15.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.10.bb b/meta-python/recipes-devtools/python/python3-django_4.2.15.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-django_4.2.10.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.15.bb
index a9f25ac2b..bf19e91e0 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.15.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "b1260ed381b10a11753c73444408e19869f3241fc45c985cd55a30177c789d13"
+SRC_URI[sha256sum] = "c77f926b81129493961e19c0e02188f8d07c112a1162df69bfab178ae447f94a"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -9,5 +9,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.7" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.15" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.40.0


