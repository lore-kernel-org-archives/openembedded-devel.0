Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183ABE77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 15:19:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22938.1736263142107321021
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 07:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3102ed5008=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507DSvKr008998
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Jan 2025 15:19:01 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43xuy8k410-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 15:19:01 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 7 Jan 2025 07:19:00 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 7 Jan 2025 07:18:58 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][scarthgap][PATCH 1/1] python3-django: upgrade 5.0.9 -> 5.0.10
Date: Tue, 7 Jan 2025 15:18:55 +0000
Message-ID: <20250107151855.2257216-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: F4KvsL3IHqVWAjKLyef0Ry-C0cernYnC
X-Authority-Analysis: v=2.4 cv=NpYrc9dJ c=1 sm=1 tr=0 ts=677d45e5 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=q7AoBUq9l0gA:10 a=VdSt8ZQiCzkA:10 a=ArP49Si0AAAA:8 a=t7CeM3EgAAAA:8 a=tTOZpf6JrgKh9iEBcb0A:9 a=glZLBWN_5F3qvmUqPDV8:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: F4KvsL3IHqVWAjKLyef0Ry-C0cernYnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_03,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501070128
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 15:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114710

From: Soumya Sambu <soumya.sambu@windriver.com>

Fixes CVE-2024-53907 and CVE-2024-53908

Release Notes:
https://docs.djangoproject.com/en/dev/releases/5.0.10/

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{python3-django_5.0.9.bb => python3-django_5.0.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.0.9.bb => python3-django_5.0.10.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.9.bb b/meta-python/recipes-devtools/python/python3-django_5.0.10.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-django_5.0.9.bb
rename to meta-python/recipes-devtools/python/python3-django_5.0.10.bb
index 60e9c592b..339476a41 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.10.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "6333870d342329b60174da3a60dbd302e533f3b0bb0971516750e974a99b5a39"
+SRC_URI[sha256sum] = "0f6cbc56cc298b0451d20a5120c6a8731e9073330fb5d84295c23c151a1eb300"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
-- 
2.40.0


