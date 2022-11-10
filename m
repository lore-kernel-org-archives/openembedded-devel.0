Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD46C47089
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:36:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4503.1668069393297781938
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VeALjg/a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA7H64U019697
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 00:36:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=XP8DLWFsoj/WcgLzPMWBoxwJhDDkLLbUHrSyqmkF4bY=;
 b=VeALjg/aZEmHr9wYb7auQY9xFKhdJp20qcMgPhZ+sfMvsjH8dBzf3b+gPAmcWMM2ZMby
 1+AJ3ewOwF+tOzME9gsAiOQzTBQVr0TlK97meQfVRHde+Ux3wC8W8t963BNzfBav9htV
 sjR3T+8gkFqGhia8a+cLxccI7Tbo5I/O75evJReaIWNemxPgk2CKd/CGluM4qk0f4N2m
 CbosoeUJxmiJuEcBx52zklrNQO7e9Ova291b2VZJ4k+afGdu6iEBCmvzdkfMA40ijYHl
 SJMpOqQdQQqZRD++DEIxEJ3MoaY/Djtb2qvDEemDkXl3/BW7TJMR4S/fwRkOHTG4eX5m JA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43ccvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 00:36:33 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 10 Nov 2022 00:36:32 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:36:31 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 06/14] gtksourceview5: add opengl to REQUIRED_DISTRO_FEATURES
Date: Thu, 10 Nov 2022 16:36:17 +0800
Message-ID: <20221110083625.840996-6-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110083625.840996-1-mingli.yu@windriver.com>
References: <20221110083625.840996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: F0n9T-Oe82nWX0YgCHdFp2kWVDkK8D-B
X-Proofpoint-GUID: F0n9T-Oe82nWX0YgCHdFp2kWVDkK8D-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=749 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99522

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb DEPENDS on or otherwise requires it)
  gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gtksourceview5', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb
index 52c270e6a..297f79fe2 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb
@@ -23,6 +23,7 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase lib_package gettext features_check gtk-doc gtk-icon-cache gobject-introspection vala
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://download.gnome.org/sources/gtksourceview/5.4/${PNAME}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "ad140e07eb841910de483c092bd4885abd29baadd6e95fa22d93ed2df0b79de7"
-- 
2.25.1


