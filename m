Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AB6C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 05:23:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18401.1744349011314676609
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 22:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=619666345e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B3xocA021713
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 05:23:30 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8qvck-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 05:23:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 10 Apr 2025 22:23:29 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 10 Apr 2025 22:23:29 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pyyaml-include: update SRCREV
Date: Fri, 11 Apr 2025 13:23:26 +0800
Message-ID: <20250411052327.2144966-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411052327.2144966-1-changqing.li@windriver.com>
References: <20250411052327.2144966-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: YrlQiVzKzImKQI89bH1atc42kZqn5tfh
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f8a752 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=remAT6IbuIee5chEk9UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: YrlQiVzKzImKQI89bH1atc42kZqn5tfh
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504110037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 05:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116792

From: Changqing Li <changqing.li@windriver.com>

Current SRCREV is v2.2a1, update to v2.2

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-devtools/python/python3-pyyaml-include_2.2.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
index 49e643c710..37abacbcec 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "https://github.com/tanbro/pyyaml-include"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS += "python3-setuptools-scm-native"
-SRCREV = "c5be2b7dfc4aaa91e44dbeb6fa42adc80936ef9d"
+SRCREV = "3e0db562a7b03fa1bf5cbe392c47658042596dd0"
 
 SRC_URI = " \
-            git://github.com/tanbro/pyyaml-include;protocol=https;branch=main \
+            git://github.com/tanbro/pyyaml-include;protocol=https;branch=main;tag=v${PV} \
           "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


