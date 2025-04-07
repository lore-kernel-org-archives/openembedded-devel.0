Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19093C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 12:16:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45870.1744028153380173287
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 05:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61924415ef=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5376JYka010552
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Apr 2025 12:15:52 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8j8y9-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 12:15:52 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 7 Apr 2025 05:15:49 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 7 Apr 2025 05:15:48 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] luajit: Update to latest on v2.1 branch
Date: Mon, 7 Apr 2025 20:15:46 +0800
Message-ID: <20250407121547.2516285-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407121547.2516285-1-changqing.li@windriver.com>
References: <20250407121547.2516285-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: LIu7gMgqtxIKPbD1j41XORs2q6b5FUf5
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f3c1f8 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=nm2HxRzrAAAA:8 a=t7CeM3EgAAAA:8 a=1TvmxPd2McqRapTlOn0A:9 a=xTkba3CB784Yst2QIEaM:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: LIu7gMgqtxIKPbD1j41XORs2q6b5FUf5
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=853 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504070087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 12:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116665

From: Changqing Li <changqing.li@windriver.com>

License-Update: copyright year updated

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index 6a79ffb897..cbad79f3ae 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Just-In-Time Compiler for Lua"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=076b97f5c7e61532f7f6f3865f04da57"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d421a5e2a24207f5e260537399a9a38b"
 HOMEPAGE = "http://luajit.org"
 
 SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
@@ -9,7 +9,7 @@ SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
            "
 
 PV = "2.1"
-SRCREV = "19878ec05c239ccaf5f3d17af27670a963e25b8b"
+SRCREV = "538a82133ad6fddfd0ca64de167c4aca3bc1a2da"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


