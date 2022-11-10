Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441ACC4167E
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:36:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4643.1668069395356692128
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:36:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RSXiNHeP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA7vdd7019680
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=ZSQIn+y5u1Y6ry8HCG+MrY86SXxwe+TyCabd+aZ/NgE=;
 b=RSXiNHeP9z9jm0sy6TTpszNwvWTch8TMdv+pSTe0blIuNEXzUleAiCJZFJq/reQNdVGS
 RpA/XFwfMJXXxV+4Bv7E2lm/om7F+1nkITIenl66rlNg0TWnLVq/kLNT3iPkwTph7P3k
 zyVKGRlQ3gow3qTbtS3T2FTGQ+WMHquuokC9EPoXfBvUTumb96SwmQ7bvkq4LidrcqRP
 5OILagmyRbHeM7asRPMQPiA2BfbIAU2/XUoEcw7/fVQqRLRBEKQF4xxRVNChQ+NpXkx0
 /90/9EOX1TxsARDnDx5jIwfnZwGtdfSpub3ngbn7iS9E3HVYHgiESUrAWy0VwynnEc/A Sg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21mhu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:34 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 10 Nov 2022 00:36:33 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:36:32 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 07/14] gnome-font-viewer: add opengl to REQUIRED_DISTRO_FEATURES
Date: Thu, 10 Nov 2022 16:36:18 +0800
Message-ID: <20221110083625.840996-7-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110083625.840996-1-mingli.yu@windriver.com>
References: <20221110083625.840996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: d2regMJlZRq7cLB71UgP4mQX7OFoP9dJ
X-Proofpoint-ORIG-GUID: d2regMJlZRq7cLB71UgP4mQX7OFoP9dJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=726 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99524

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'libadwaita' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.bb DEPENDS on or otherwise requires it)
  libadwaita was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gnome-font-viewer', 'libadwaita']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.bb
index 50fd034af..130c26924 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.bb
@@ -14,7 +14,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI[archive.sha256sum] = "81c6bffb06d5332346e00eaecaec1bdcfd617c51dfd95bcd058d6c76c76dd2b9"
 
-- 
2.25.1


