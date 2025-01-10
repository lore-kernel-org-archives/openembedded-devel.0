Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879CBE7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:18:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18356.1736515091335230924
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=310530b8e5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ABmDjV016605
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:10 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fv3twnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 10 Jan 2025 05:18:09 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 10 Jan 2025 05:18:07 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] python3-django: upgrade 4.2.15 -> 4.2.17
Date: Fri, 10 Jan 2025 13:17:54 +0000
Message-ID: <20250110131802.2774557-2-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250110131802.2774557-1-soumya.sambu@windriver.com>
References: <20250110131802.2774557-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: giU5U9pLr4ckHJ4_D4ORQvvIOP6clNSD
X-Authority-Analysis: v=2.4 cv=NIUv+16g c=1 sm=1 tr=0 ts=67811e12 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=wjU5IotzqukA:10 a=VdSt8ZQiCzkA:10 a=ArP49Si0AAAA:8 a=t7CeM3EgAAAA:8 a=9HfSGHa9_q-MMWBDIUkA:9 a=glZLBWN_5F3qvmUqPDV8:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: giU5U9pLr4ckHJ4_D4ORQvvIOP6clNSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_06,2025-01-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501100104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114768

From: Soumya Sambu <soumya.sambu@windriver.com>

Fixes CVE-2024-45230, CVE-2024-45231,  CVE-2024-53907 and
CVE-2024-53908

Release Notes:
https://docs.djangoproject.com/en/dev/releases/4.2.16/
https://docs.djangoproject.com/en/dev/releases/4.2.17/

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{python3-django_4.2.15.bb => python3-django_4.2.17.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.15.bb => python3-django_4.2.17.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.15.bb b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_4.2.15.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.17.bb
index bf19e91e0..dfce4b85c 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.15.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "c77f926b81129493961e19c0e02188f8d07c112a1162df69bfab178ae447f94a"
+SRC_URI[sha256sum] = "6b56d834cc94c8b21a8f4e775064896be3b4a4ca387f2612d4406a5927cd2fdc"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -9,5 +9,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.15" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.17" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.40.0


