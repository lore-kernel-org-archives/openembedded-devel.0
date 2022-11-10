Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A86BC43219
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:47:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.4951.1668070025748862193
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=p9VZ3umm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA81BG4021145
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=ZSQIn+y5u1Y6ry8HCG+MrY86SXxwe+TyCabd+aZ/NgE=;
 b=p9VZ3ummd0T351EzrJde7ytqNZ+N3c5m/CDEKPJ3HozhHDhbGpcNpkPxGC6MwCBh8pbk
 HN8Y7BGxq/6EWMGKhpVRwRd/nG+tM5ox3+16Q4+NV3Iu0apFQkkHazhxw5+KIPZUmq+r
 a03+txNyS5eyDyDaVD+NNuv93Qd9mu5wR7raXj0nUWePyIzrkvflYdIMXQwSa+lToQWw
 ZWscGUvbpeJ+GO+STPM3x5d3UcrICXDl+G+BCKxLkmmDcePziGw+Zp0+BZD3uQ3hLppP
 W92IEOSPZO5AjAayZy682fJ1Uc6/0QXTu70WhQrUAjB+lF1zBjoPf4h0t7uyjrUK3APx qQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knet9mfvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:05 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 10 Nov 2022 00:47:03 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:47:03 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH 07/14] gnome-font-viewer: add opengl to REQUIRED_DISTRO_FEATURES
Date: Thu, 10 Nov 2022 16:46:48 +0800
Message-ID: <20221110084655.1714051-7-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110084655.1714051-1-mingli.yu@windriver.com>
References: <20221110084655.1714051-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XxahJyT07we8xPeg5Ws1wVrw9x_bum92
X-Proofpoint-ORIG-GUID: XxahJyT07we8xPeg5Ws1wVrw9x_bum92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=758 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99538

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


