Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF29C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:46:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.47978.1743414397130707936
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6185d269ee=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6KGqM004971
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 02:46:36 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45pnshheak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 02:46:36 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 31 Mar 2025 02:46:36 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 31 Mar 2025 02:46:35 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2 3/3] minizip: Make rconflicts with minizip-ng
Date: Mon, 31 Mar 2025 17:46:32 +0800
Message-ID: <20250331094632.2373216-3-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250331094632.2373216-1-mingli.yu@eng.windriver.com>
References: <20250331094632.2373216-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: hBS5CEzfXP-2NGHexp9LXke4GYhBoSyD
X-Authority-Analysis: v=2.4 cv=I8FlRMgg c=1 sm=1 tr=0 ts=67ea647c cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=nTNid8njqjJ2sKw7KzwA:9 a=zgiPjhLxNE0A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: hBS5CEzfXP-2NGHexp9LXke4GYhBoSyD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=809
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116430

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


