Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304A1C36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 11:39:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16632.1743507539130491468
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 04:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=618698420d=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5313vrv4013913
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Apr 2025 04:38:58 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45pgckavkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 04:38:58 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 1 Apr 2025 04:38:56 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] mbedtls: 3.6.2 -> 3.6.3
Date: Tue, 1 Apr 2025 11:38:34 +0000
Message-ID: <20250401113834.2912505-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250401113834.2912505-1-yogita.urade@windriver.com>
References: <20250401113834.2912505-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 2uay91P0SR9U3QPC23K1N3_QF210v3fO
X-Authority-Analysis: v=2.4 cv=Paz/hjhd c=1 sm=1 tr=0 ts=67ebd052 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=TBqNoLu6pQ733rAlwCcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 2uay91P0SR9U3QPC23K1N3_QF210v3fO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504010073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 11:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116473

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.3

Remove mbedtls-framework repository, as the framework is now added
as a flat directory rather than a submodule[1][2].

[1] https://github.com/Mbed-TLS/mbedtls/commit/b41194ce7f2fda63bf5959588631eba73c5c621e
[2] https://github.com/Mbed-TLS/mbedtls/commit/2c824b4fe5dab7e1526560be203bf705857e372a

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../mbedtls/{mbedtls_3.6.2.bb => mbedtls_3.6.3.bb}         | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.2.bb => mbedtls_3.6.3.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb
index 63c0bbfaa5..286d5c45f9 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb
@@ -24,12 +24,9 @@ SECTION = "libs"
 
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6 \
-	git://github.com/Mbed-TLS/mbedtls-framework.git;protocol=https;branch=main;destsuffix=git/framework;name=framework \
-	file://run-ptest"
+           file://run-ptest"
 
-SRCREV = "107ea89daaefb9867ea9121002fbbdf926780e98"
-SRCREV_framework = "94599c0e3b5036e086446a51a3f79640f70f22f6"
-SRCREV_FORMAT .= "_framework"
+SRCREV = "22098d41c6620ce07cf8a0134d37302355e1e5ef"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.40.0


