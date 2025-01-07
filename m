Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29566E77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 15:17:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22892.1736263047270296068
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 07:17:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3102ed5008=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507BkaoJ030000
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Jan 2025 15:17:26 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43xt70k6bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 15:17:26 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 7 Jan 2025 07:17:24 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 7 Jan 2025 07:17:23 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][PATCH 1/1] python3-django: upgrade 4.2.16 -> 4.2.17
Date: Tue, 7 Jan 2025 15:17:19 +0000
Message-ID: <20250107151719.2255959-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: m-QwcDHmOAjgtdc77R4Rqy0RyNNeN9mj
X-Proofpoint-ORIG-GUID: m-QwcDHmOAjgtdc77R4Rqy0RyNNeN9mj
X-Authority-Analysis: v=2.4 cv=T/l2T+KQ c=1 sm=1 tr=0 ts=677d4586 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=ArP49Si0AAAA:8 a=t7CeM3EgAAAA:8 a=K-1nHk4jiglWym-ARJ0A:9 a=glZLBWN_5F3qvmUqPDV8:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_03,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501070127
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 15:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114707

From: Soumya Sambu <soumya.sambu@windriver.com>

Fixes CVE-2024-53907 and CVE-2024-53908

Release Notes:
https://docs.djangoproject.com/en/dev/releases/4.2.17/

Switch to python_setuptools_build_meta

Fix:
WARNING: python3-django-4.2.17-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{python3-django_4.2.16.bb => python3-django_4.2.17.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.16.bb => python3-django_4.2.17.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.16.bb b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-django_4.2.16.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.17.bb
index 564e8741e5..4116eafcd1 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.16.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
-inherit setuptools3
+inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "6f1616c2786c408ce86ab7e10f792b8f15742f7b7b7460243929cb371e7f1dad"
+SRC_URI[sha256sum] = "6b56d834cc94c8b21a8f4e775064896be3b4a4ca387f2612d4406a5927cd2fdc"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
@@ -10,5 +10,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.16" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.17" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.40.0


