Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74630D1CDD1
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 10:15:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15071.1729592129216075158
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 03:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0025582c43=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M8t2Yf030413
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 03:15:28 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42cc9ktxt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 03:15:28 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 03:15:27 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 03:15:27 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] mbedtls: Upgrade 3.6.1 -> 3.6.2
Date: Tue, 22 Oct 2024 18:15:26 +0800
Message-ID: <20241022101526.4114268-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ZYlPNdVA c=1 sm=1 tr=0 ts=67177b40 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=dwsXLWY68qBxEHdWnWAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 8qGQ7m589wjyT3UxxZalY3_1PVvSUVyk
X-Proofpoint-ORIG-GUID: 8qGQ7m589wjyT3UxxZalY3_1PVvSUVyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_09,2024-10-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410220066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 10:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113086

From: Mingli Yu <mingli.yu@windriver.com>

Mbed TLS 3.6.2 provides the fix for a security vulnerability [1].

 # ./run-ptest
PASS: test_suite_aes.cbc
PASS: test_suite_aes.cfb
PASS: test_suite_aes.ctr
PASS: test_suite_aes.ecb
PASS: test_suite_aes.ofb
PASS: test_suite_aes.rest
PASS: test_suite_aes.xts
PASS: test_suite_alignment
PASS: test_suite_aria
[snip]

[1] https://github.com/Mbed-TLS/mbedtls/releases

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../mbedtls/{mbedtls_3.6.1.bb => mbedtls_3.6.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.1.bb => mbedtls_3.6.2.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
index 62c3add2a5..168ee1b5de 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
@@ -27,7 +27,7 @@ SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3
 	git://github.com/Mbed-TLS/mbedtls-framework.git;protocol=https;branch=main;destsuffix=git/framework;name=framework \
 	file://run-ptest"
 
-SRCREV = "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
+SRCREV = "107ea89daaefb9867ea9121002fbbdf926780e98"
 SRCREV_framework = "94599c0e3b5036e086446a51a3f79640f70f22f6"
 SRCREV_FORMAT .= "_framework"
 
-- 
2.34.1


