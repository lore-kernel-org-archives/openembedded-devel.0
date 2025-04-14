Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FF8C369B6
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 08:27:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45058.1744619243175281512
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Apr 2025 01:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61995c6f5e=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E5wep1011889
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 01:27:23 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yqpkhfd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 01:27:22 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 14 Apr 2025 01:27:22 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 14 Apr 2025 01:27:21 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 4/6] version-check.conf: mute bridge-utils version mismatch warning
Date: Mon, 14 Apr 2025 16:27:15 +0800
Message-ID: <20250414082717.2827252-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414082717.2827252-1-changqing.li@windriver.com>
References: <20250414082717.2827252-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lH1c6g9doSpRLFSYxmihtVITACtCOco0
X-Proofpoint-GUID: lH1c6g9doSpRLFSYxmihtVITACtCOco0
X-Authority-Analysis: v=2.4 cv=UZBRSLSN c=1 sm=1 tr=0 ts=67fcc6ea cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=10jXTBzrRSFXKBWK1TwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 08:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116848

From: Changqing Li <changqing.li@windriver.com>

Runtime version of brctl is 1.7.1, but the configure.ac set version as
1.7 (AC_INIT([bridge-utils],[1.7])). And refer [1], this utility is
DEPRECATED, only critical bug fixes only, so it is nearly not possible
to correct from upstream, so mute this warning since it has no critical
influence.

[1] https://git.kernel.org/pub/scm/network/bridge/bridge-utils.git/commit/?h=main&id=ab8a2cc330253321be7bc69dea88bfaa3d48415e

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/conf/version-check.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.conf
index 130f2f6058..ecc8802565 100644
--- a/meta-oe/conf/version-check.conf
+++ b/meta-oe/conf/version-check.conf
@@ -21,3 +21,4 @@ CHECK_VERSION_PV:pn-can-utils = "%"
 CHECK_VERSION_PV:pn-luajit = "${PV}.%"
 CHECK_VERSION_PV:pn-sg3-utils = "%"
 CHECK_VERSION_PV:pn-netperf = "2.7.%"
+CHECK_VERSION_PV:pn-bridge-utils = "1.7%"
-- 
2.34.1


