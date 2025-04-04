Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D72C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 11:37:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9175.1743766668337670392
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 04:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6189cd35df=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5347x1NG026399
	for <openembedded-devel@lists.openembedded.org>; Fri, 4 Apr 2025 04:37:48 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg0ra6ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 04:37:47 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 4 Apr 2025 04:37:46 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 4 Apr 2025 04:37:45 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][PATCH 1/1] python3-django: upgrade 5.0.11 -> 5.0.13
Date: Fri, 4 Apr 2025 11:37:42 +0000
Message-ID: <20250404113742.2618721-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=HoF2G1TS c=1 sm=1 tr=0 ts=67efc48b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=ArP49Si0AAAA:8 a=t7CeM3EgAAAA:8 a=Ge010zA1tpeolJeXq_4A:9 a=glZLBWN_5F3qvmUqPDV8:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 951I0QvCSUq_wcP4yoB5VuQ-mlkgSNpo
X-Proofpoint-GUID: 951I0QvCSUq_wcP4yoB5VuQ-mlkgSNpo
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504040080
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 11:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116586

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for CVE-2025-26699

Release Notes:
https://docs.djangoproject.com/en/dev/releases/5.0.12/
https://docs.djangoproject.com/en/dev/releases/5.0.13/

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{python3-django_5.0.11.bb => python3-django_5.0.13.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.0.11.bb => python3-django_5.0.13.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.11.bb b/meta-python/recipes-devtools/python/python3-django_5.0.13.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-django_5.0.11.bb
rename to meta-python/recipes-devtools/python/python3-django_5.0.13.bb
index 12d43c5046..801083833c 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.13.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e7d98fa05ce09cb3e8d5ad6472fb602322acd1740bfdadc29c8404182d664f65"
+SRC_URI[sha256sum] = "f9d4b7b87a9dae248d5f20cec940cf7290e07d508d6d8432e3c2cabf09b3b0ff"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
-- 
2.40.0


