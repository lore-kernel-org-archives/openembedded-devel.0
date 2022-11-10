Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F93C4167D
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:36:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4644.1668069397220467697
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:36:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sxBVR4ob;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA7cCsn030330
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=Gzd9nHHgMcblTK3rW8ora0a/0lE+dLuSl/rAp0pR7N8=;
 b=sxBVR4obt8w8Csk0E59YBgZ4o3CC0RNH08xiX3aPf9BUt2qNHsyK+3HBAqQacl6k0kMj
 OhlwHOtErUvTu2Rn3LREfDF6g+OmqboDXeEmtQqd0ZO0OqNz/igBuA8hKEcYPguKZp4I
 NsBavicUW9RZYOSKMceG4apDA6xAucXQ0XHCLAnZiByzSLtV9smyrh3wsBSzG/oEqPFE
 keDYv0bvui1U+5fmSniIuHwPlsBpAX4Ir6gw/2pMRsftDU/LggSxVL71shoG+ihaNt6/
 oWC08orq36G8S9WQ95L+mTRD+A6z3V4nrIhN7zipGAT2D8/o77AUaEkDEnxHbJBerxI0 qw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knet9mfj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:36 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 10 Nov 2022 00:36:35 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:36:34 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 09/14] gnome-desktop: add opengl to REQUIRED_DISTRO_FEATURES
Date: Thu, 10 Nov 2022 16:36:20 +0800
Message-ID: <20221110083625.840996-9-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110083625.840996-1-mingli.yu@windriver.com>
References: <20221110083625.840996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Nul6hBKIk3GcdcFvlpiviKThoypOXFjE
X-Proofpoint-ORIG-GUID: Nul6hBKIk3GcdcFvlpiviKThoypOXFjE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=849 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99525

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb DEPENDS on or otherwise requires it)
  gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'evince', 'gnome-desktop', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
index aae927a70..6eeaed0e1 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
@@ -10,7 +10,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspection features_check gtk-doc
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 
-- 
2.25.1


