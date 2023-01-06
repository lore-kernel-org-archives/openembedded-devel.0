Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E71EC5479D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 09:03:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9685.1672995836105477181
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jan 2023 01:03:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0370ea45eb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3068rtmw026050
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Jan 2023 09:03:55 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mxa050670-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 09:03:55 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 01:03:54 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Fri, 6 Jan 2023 01:03:53 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-multimedia][PATCH 3/3] xdg-desktop-portal-wlr: add opengl to REQUIRED_DISTRO_FEATURES
Date: Fri, 6 Jan 2023 17:03:51 +0800
Message-ID: <20230106090351.692314-3-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106090351.692314-1-mingli.yu@eng.windriver.com>
References: <20230106090351.692314-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: B-UtlUTYw74pXSXr2IOMTiuEtXuME8HC
X-Proofpoint-GUID: B-UtlUTYw74pXSXr2IOMTiuEtXuME8HC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_04,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=897
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 09:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100424

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'virtual/libgbm' (but /build/layers/meta-openembedded/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb DEPENDS on or otherwise requires it).
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xdg-desktop-portal-wlr', 'virtual/libgbm']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb
index b8cdf25c1..7e1b7b9d2 100644
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb
@@ -13,7 +13,8 @@ DEPENDS = " \
     virtual/libgbm \
 "
 
-inherit meson pkgconfig
+inherit meson pkgconfig features_check
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;nobranch=1"
 
-- 
2.25.1


