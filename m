Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05185C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 07:41:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8320.1752219688099704657
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 00:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9287046cd5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B5UFF4009421
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 07:41:27 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pu19p82b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 07:41:27 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 11 Jul 2025 00:40:56 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 11 Jul 2025 00:40:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] opencv: revert disable sse4.1 and sse4.2 on x86
Date: Fri, 11 Jul 2025 15:41:23 +0800
Message-ID: <20250711074123.4123453-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711074123.4123453-1-hongxu.jia@windriver.com>
References: <20250711074123.4123453-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5K813IFjnTvc8u6H5RzFr8VrZLdCUIZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX67Ki4hkoxQDO jLcYNOC6UCRTLtes63W6RefR7l2xciPUNJy/inarftH2jRgVSDFWtOZKNMACZ5cvrMESIaoNhAE SjiokeNtHC0STvQOIwfg45eY6d0m6//YZX2yPf9ggCrgnbq8mKf8L8UOi2wqwltlGm/sWd9utml
 Pz61TcYHkf0GTDzrSYsL0j6fo4yJM2bIVbrTMfPW0xNd+YULGYQWP/gMJjozOFQhyKf6ie+BVlr yIzIaYiCVxAjN/+Vxf2V7dTz9qJeXjIjN3wB5jwjhPxPzvZAgVwwfgvHBM3h3vgsxBR2q+8QK/J 0USJpukc9OokiHYeAMjN5lz3hva8FHd+cDXxR4xGsKpowGPRUuMHzWx2aShMKT8HQfrV3/TJctW nu8f3LxJ
X-Authority-Analysis: v=2.4 cv=ZrntK87G c=1 sm=1 tr=0 ts=6870c027 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=7lAACdhr0LoIKb20CroA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5K813IFjnTvc8u6H5RzFr8VrZLdCUIZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 07:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118433

Due to upstream has fixed the issue [1], revert [3f26c46cbd opencv:
disable sse4.1 and sse4.2 on x86]

[1] https://github.com/opencv/opencv/pull/21628

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/opencv/opencv_4.11.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
index 0ce47ddf82..208d65725e 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
@@ -86,9 +86,6 @@ LDFLAGS:append:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 LDFLAGS:append:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 
 EXTRA_OECMAKE:append:x86 = " -DX86=ON"
-# disable sse4.1 and sse4.2 to fix 32bit build failure
-# https://github.com/opencv/opencv/issues/21597
-EXTRA_OECMAKE:remove:x86 = " -DENABLE_SSE41=1 -DENABLE_SSE42=1"
 
 PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
     ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)} \
-- 
2.34.1


