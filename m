Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F45C369B8
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 08:27:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.45057.1744619242713785202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Apr 2025 01:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61995c6f5e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E4oEHA004452
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 08:27:22 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yf58hr5x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 08:27:21 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 14 Apr 2025 01:27:21 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 14 Apr 2025 01:27:20 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 3/6] lsscsi: revert to version 0.32
Date: Mon, 14 Apr 2025 16:27:14 +0800
Message-ID: <20250414082717.2827252-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414082717.2827252-1-changqing.li@windriver.com>
References: <20250414082717.2827252-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=UPPdHDfy c=1 sm=1 tr=0 ts=67fcc6e9 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=uAKUDkwnAAAA:8 a=t7CeM3EgAAAA:8 a=rEK5Z5o-pH1w9QQzXgAA:9 a=lN7tEWgsE9RogSd6Vyyi:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: n7C57XLx-z-oWGorOLiN55AQL9KiJxck
X-Proofpoint-ORIG-GUID: n7C57XLx-z-oWGorOLiN55AQL9KiJxck
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 08:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116847

From: Changqing Li <changqing.li@windriver.com>

* This commit revert [da92fbe33b lsscsi: upgrade 0.32 -> 030]
* The latest version is 0.32, and upstream URI has lsscsi-030.tgz and
  lsscsi-0.30.tgz for version 0.30 only, they have the same md5sum,
  since 030 sort higher than new version 0.32, make itself 030 the latest
  version.  Add UPSTREAM_CHECK_REGEX to exclude lsscsi-0.30.tgz.

This reverts commit da92fbe33b13c7453f34f214646c7f6d24aca4ef.
---
 .../recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb}    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb} (63%)

diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
similarity index 63%
rename from meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
rename to meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
index 63b94e9d6e..127be8fbfa 100644
--- a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
+++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
@@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
 
-SRC_URI[sha256sum] = "619a2187405f02c5f57682f3478bffc75326803cd08839e39d434250c5518b15"
+SRC_URI[sha256sum] = "0a800e9e94dca2ab702d65d72777ae8cae078e3d74d0bcbed64ba0849e8029a1"
 
 inherit autotools
 
-S = "${WORKDIR}/lsscsi-${PV}r154"
+S = "${WORKDIR}/lsscsi-${PV}"
+
+UPSTREAM_CHECK_REGEX = "lsscsi-(?P<pver>\d+(\.\d+)+)\.tgz"
-- 
2.34.1


