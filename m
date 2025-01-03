Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6DEE77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 11:00:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.28054.1735902011435362754
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jan 2025 03:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3098d3c6e9=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503AhVl4012710
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Jan 2025 03:00:11 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43thqq4u7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 03:00:10 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 3 Jan 2025 03:00:08 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] grpc: upgrade 1.66.1 -> 1.68.0
Date: Fri, 3 Jan 2025 10:58:44 +0000
Message-ID: <20250103105844.94019-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.31.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=RoI/LDmK c=1 sm=1 tr=0 ts=6777c33a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=t-pu356xMUfFXEa17XsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: TjqK6gTiNPWst2m_kqh-p2D7yhn57jka
X-Proofpoint-ORIG-GUID: TjqK6gTiNPWst2m_kqh-p2D7yhn57jka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 mlxlogscore=967 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501030097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 11:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114625

From: Divya Chellam <divya.chellam@windriver.com>

This includes CVE-fix for CVE-2024-11407

Changelog:
==================================
https://github.com/grpc/grpc/releases/tag/v1.68.0
https://github.com/grpc/grpc/compare/v1.66.1...v1.68.0

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../recipes-devtools/grpc/{grpc_1.66.1.bb => grpc_1.68.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.66.1.bb => grpc_1.68.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.66.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/grpc/grpc_1.66.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
index 7968d63a8..caf355bb5 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.66.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
@@ -20,8 +20,8 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "e821cdc231bda9ee93139a6daab6311dd8953832"
-BRANCH = "v1.66.x"
+SRCREV_grpc = "6b49ae626bc9cd7033e062f89dbe0e0576b1110e"
+BRANCH = "v1.68.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            "
-- 
2.40.0


