Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13DFD11706
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 06:51:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6285.1729839074693498849
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 23:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00285c868a=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P3K2Di005086
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 23:51:14 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42cc9kyfe0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 23:51:14 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 23:51:13 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 23:51:13 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][kirkstone][PATCH] mbedtls: Upgrade 2.28.8 -> 2.28.9
Date: Fri, 25 Oct 2024 14:51:12 +0800
Message-ID: <20241025065112.3713175-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ZYlPNdVA c=1 sm=1 tr=0 ts=671b3fe2 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=5tl2Ge63AD7ufhzlW4AA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oY0oYFZt8OeLV68Jv2C1-UwtQZMh0Avg
X-Proofpoint-ORIG-GUID: oY0oYFZt8OeLV68Jv2C1-UwtQZMh0Avg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_06,2024-10-25_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410250052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 06:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113225

From: Mingli Yu <mingli.yu@windriver.com>

The mbedtls 2.28.9 includes the security fix for CVE-2024-45157,
bug fixes and minor enhancements [1].

[1] https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.9

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../mbedtls/{mbedtls_2.28.8.bb => mbedtls_2.28.9.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.8.bb => mbedtls_2.28.9.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
index e47092c56..1efc6383d 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "5a764e5555c64337ed17444410269ff21cb617b1"
+SRCREV = "5e146adef63b326b04282252639bebc2730939c6"
 SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28"
 
 inherit cmake update-alternatives
-- 
2.34.1


