Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3355CCD1A2
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 11:29:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12751.1726658950266651436
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 04:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9991ddb9ec=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48IAnWpO016853
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Sep 2024 04:29:10 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41na0mkqsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Sep 2024 04:29:09 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 04:29:09 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 04:29:07 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] mbedtls: upgrade 2.28.8 -> 2.28.9
Date: Wed, 18 Sep 2024 11:29:04 +0000
Message-ID: <20240918112904.1223049-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Jli0mB-MZL6LrPpJpOTqc3-Nk0-KYvfJ
X-Authority-Analysis: v=2.4 cv=d6+nygjE c=1 sm=1 tr=0 ts=66eab985 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=luwuiPvviD7z1530dmYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Jli0mB-MZL6LrPpJpOTqc3-Nk0-KYvfJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_09,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2408220000
 definitions=main-2409180074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Sep 2024 11:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112357

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.9

Security fix:
CVE-2024-45157

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../mbedtls/{mbedtls_2.28.8.bb => mbedtls_2.28.9.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.8.bb => mbedtls_2.28.9.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
index 301e65598..da984a399 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "5a764e5555c64337ed17444410269ff21cb617b1"
+SRCREV = "5e146adef63b326b04282252639bebc2730939c6"
 SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
            file://run-ptest \
           "
-- 
2.40.0


