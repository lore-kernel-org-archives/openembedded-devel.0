Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D912C3601E
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 11:37:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9173.1743766652027340026
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 04:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6189cd35df=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534AFl2c000878
	for <openembedded-devel@lists.openembedded.org>; Fri, 4 Apr 2025 11:37:31 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg2dj5pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 11:37:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 4 Apr 2025 04:37:29 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 4 Apr 2025 04:37:28 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][PATCH 1/1] python3-django: upgrade 4.2.18 -> 4.2.20
Date: Fri, 4 Apr 2025 11:37:24 +0000
Message-ID: <20250404113724.2617709-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: z9_vQvIclj0_fVJgPbp3YVKoFFWeOVYf
X-Proofpoint-GUID: z9_vQvIclj0_fVJgPbp3YVKoFFWeOVYf
X-Authority-Analysis: v=2.4 cv=LPFmQIW9 c=1 sm=1 tr=0 ts=67efc47a cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=ArP49Si0AAAA:8 a=t7CeM3EgAAAA:8 a=PFiLK2WLPh3-hb5_xjgA:9 a=glZLBWN_5F3qvmUqPDV8:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504040080
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 11:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116585

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for CVE-2025-26699

Release Notes:
https://docs.djangoproject.com/en/dev/releases/4.2.19/
https://docs.djangoproject.com/en/dev/releases/4.2.20/

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{python3-django_4.2.18.bb => python3-django_4.2.20.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.18.bb => python3-django_4.2.20.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.18.bb b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-django_4.2.18.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.20.bb
index 9e0a908507..8644b282c6 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.18.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "52ae8eacf635617c0f13b44f749e5ea13dc34262819b2cc8c8636abb08d82c4b"
+SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
@@ -10,5 +10,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.18" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.20" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.40.0


