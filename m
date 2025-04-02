Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53879C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:45:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2620.1743579947912371778
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6187dfc01b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5324ZpxI009091
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Apr 2025 07:45:47 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45rtfn0eyt-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 07:45:47 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 2 Apr 2025 00:45:45 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 2 Apr 2025 00:45:45 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v3 3/3] minizip: Make rconflicts with minizip-ng
Date: Wed, 2 Apr 2025 15:45:42 +0800
Message-ID: <20250402074542.2842980-3-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402074542.2842980-1-mingli.yu@eng.windriver.com>
References: <20250402074542.2842980-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=eZo9f6EH c=1 sm=1 tr=0 ts=67eceb2b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=nTNid8njqjJ2sKw7KzwA:9 a=zgiPjhLxNE0A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6jQHqJ379NRrriy_UN57NY5OSwt-WnOO
X-Proofpoint-ORIG-GUID: 6jQHqJ379NRrriy_UN57NY5OSwt-WnOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_02,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=821 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504020048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 07:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116511

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  Error: Transaction test error:
  file /usr/bin/minizip conflicts between attempted installs of minizip-1.3.1-r0.riscv64 and minizip-ng-4.0.8-r0.riscv64
  file /usr/lib/libminizip.so.1 conflicts between attempted installs of minizip-1.3.1-r0.riscv64 and minizip-ng-4.0.8-r0.riscv64

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-core/minizip/minizip_1.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb b/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
index c9c92ad6bd..0d36ffbcf6 100644
--- a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
+++ b/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b
 PACKAGECONFIG ??= "demos"
 PACKAGECONFIG[demos] = "--enable-demos=yes,,,"
 
+RCONFLICTS:${PN} += "minizip-ng"
+
 DEPENDS = "zlib"
 
 inherit autotools
-- 
2.34.1


