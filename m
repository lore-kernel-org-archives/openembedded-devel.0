Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B2AC4167B
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 05:19:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8972.1670649531370949003
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 21:18:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9343197d5b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BA5IoCu010487
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 05:18:50 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mchn381xg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 05:18:50 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 9 Dec 2022 21:18:42 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 9 Dec 2022 21:18:41 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/3] grail: add opengl to REQUIRED_DISTRO_FEATURES
Date: Sat, 10 Dec 2022 13:18:39 +0800
Message-ID: <20221210051840.103991-2-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221210051840.103991-1-mingli.yu@eng.windriver.com>
References: <20221210051840.103991-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: j1gp26-BzZxdyS3AnerTccYxeJ9AG3HV
X-Proofpoint-ORIG-GUID: j1gp26-BzZxdyS3AnerTccYxeJ9AG3HV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-10_02,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212100044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 05:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100009

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'frame' (but /build/layers/meta-openembedded/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb DEPENDS on or otherwise requires it)
frame was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'geis', 'grail', 'frame']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
index 6646c8bfc..067052c03 100644
--- a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
 "
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig features_check
 
 DEPENDS = "frame"
 CXXFLAGS:append:toolchain-clang = " -Wno-pessimizing-move"
@@ -19,6 +19,8 @@ UPSTREAM_CHECK_URI = "https://launchpad.net/grail/trunk"
 SRC_URI[md5sum] = "0df1b3ec6167920f310e2effe6e2ad44"
 SRC_URI[sha256sum] = "5eed1f650f042481daa3a2de5e7d43261fe343b2a1b1e240f3b7fc26572c9df3"
 
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
+
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = "--with-x11, --without-x11, libxi"
 
-- 
2.25.1


