Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDD7C38A2B
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:36:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.4600.1668069391648451969
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=epiE93vo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA7K8Zd003579
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=ztEOMaBGkB5YyE5Sz7HHZS7QXw+KI1KafVVuf7dPX3w=;
 b=epiE93volRDfM6dP24GwO7kJIEwXfyR/FBDlS0vEQV1gGA8tl8ETtmxM8wezmGWhYchm
 4c5nDJ8yx9QZ4GAxKgn3LRQPvm5hzVuIjm7tlt8qXGQXfJptP8OkXjOxDvLEE9Mml6Oi
 QXqI1t0bp7W7HgJfA+MPlMQiNuRH/AwG2y4DX6peLmdN/yP0NMLedrb0MMKqWvNtc+EJ
 0Qreyp7Cl0tRVJGGUVBQcSaNEuK04h5nWH0zvIx8+t0b8xl4bmHYWwO4RrtpcNnzgMBF
 kcZoCRSiqBCnXHryLr4ZLGbkE/4osbMAXQfmrN0ts+ONGOxWQkcEz/SuXyQ3kBGNXZ3M vw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21mhu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:30 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 10 Nov 2022 00:36:29 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:36:29 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 03/14] libnma: add opengl to REQUIRED_DISTRO_FEATURES
Date: Thu, 10 Nov 2022 16:36:14 +0800
Message-ID: <20221110083625.840996-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110083625.840996-1-mingli.yu@windriver.com>
References: <20221110083625.840996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Qs5lbPNq0K93nYy-9DalV1i55DZXPTmF
X-Proofpoint-ORIG-GUID: Qs5lbPNq0K93nYy-9DalV1i55DZXPTmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=772 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99520

From: Mingli Yu <mingli.yu@windriver.com>

libnma depends on gtk4 which needs opengl DISTRO_FEATURES enabled.

Fixes:
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/meta-openembedded/meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb DEPENDS on or otherwise requires it)
  gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'network-manager-applet', 'libnma', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb
index 75c704bc2..341e29c08 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb
@@ -7,7 +7,7 @@ DEPENDS = "glib-2.0 gtk+3 gtk4 networkmanager"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gobject-introspection gtk-doc gettext vala features_check
 
-REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG','gcr','x11','',d)}"
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG','gcr','x11','',d)} opengl"
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI[archive.sha256sum] = "5ed93eae18456ff5a8a4f408178c1ee198dc8d3a46c65f9075b101916e64e8b4"
-- 
2.25.1


