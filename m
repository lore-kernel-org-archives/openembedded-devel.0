Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A13C369A8
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 05:23:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18400.1744349010987193198
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 22:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=619666345e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B3xoc9021713
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 05:23:30 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8qvck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 05:23:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 10 Apr 2025 22:23:28 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 10 Apr 2025 22:23:28 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] lsscsi: update PV to the real version
Date: Fri, 11 Apr 2025 13:23:25 +0800
Message-ID: <20250411052327.2144966-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: VLKchI0NpZUf6AH_U8a2F_7UHmyXTMVn
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f8a751 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=WlipjNdbNRiiHrLAJJ0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VLKchI0NpZUf6AH_U8a2F_7UHmyXTMVn
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116791

From: Changqing Li <changqing.li@windriver.com>

Update PV to the real version 0.30, this can make PV aligned with the
runtime version

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.30.bb} (92%)

diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb
similarity index 92%
rename from meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
rename to meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb
index 63b94e9d6e..ba52bdaf12 100644
--- a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
+++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb
@@ -10,4 +10,4 @@ SRC_URI[sha256sum] = "619a2187405f02c5f57682f3478bffc75326803cd08839e39d434250c5
 
 inherit autotools
 
-S = "${WORKDIR}/lsscsi-${PV}r154"
+S = "${WORKDIR}/lsscsi-030r154"
-- 
2.34.1


