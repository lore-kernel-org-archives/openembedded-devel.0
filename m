Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7053BC43217
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:47:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.5002.1668070019117761153
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:46:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DrHF5eBw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA8CJPb015851
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=Du4YenBA1GAO/l/SN6S2nwu6dInz8rI33JuM5SVumTY=;
 b=DrHF5eBwCMko3COhluzlBylPAUDv3l0CI3nAEAu/VaaVJbfGbaC4UsISd4Le2DO1MQTc
 O9+HIn6s4Df7ObwG3gJ2sEnVDzE4sySokxGJWj5218lgui13Dd7nVElgvEMD/rFLohFR
 E+5Md/Cj7EJOmf9L+t5FcY7BkVSBzKCeasMe3GKnCdcAqmUBHkVlwgvSRydptiss/U50
 +svZaYDTj5O78x3zpdxCd6xfhKaDT6YILdb159g8LuCdhMlr3hE1p2LIA4wFaE7rNZCF
 qTJYprMOM+gGwnD9A7UP6DzgudbsAGCmqQUQbtK4I8LHaYdT6D768Qb0vHS9QrXLVRdg Rw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21mj75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:46:58 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 10 Nov 2022 00:46:57 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:46:56 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH 01/14] gnome-calculator: add opengl to REQUIRED_DISTRO_FEATURES
Date: Thu, 10 Nov 2022 16:46:42 +0800
Message-ID: <20221110084655.1714051-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vRpQCiMF0tz2GkgLl-4_JHeOqz8ORytF
X-Proofpoint-ORIG-GUID: vRpQCiMF0tz2GkgLl-4_JHeOqz8ORytF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=959 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99532

From: Mingli Yu <mingli.yu@windriver.com>

gnome-calculator depends on gtk4 which depends on libepoxy(an opengl
related library) [1].

Fixes:
   ERROR: Nothing PROVIDES 'gtk4-native' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb DEPENDS on or otherwise requires it)
  gtk4-native was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gnome-calculator', 'gtk4-native']

[1] https://github.com/anholt/libepoxy/

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb
index 31513a5f6..66a29a094 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb
@@ -26,7 +26,7 @@ inherit gnomebase gobject-introspection gnome-help vala gtk-icon-cache gettext f
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI[archive.sha256sum] = "33dab1bca43658d66520958b0f674cb0ad3185cfd30c12e459e7f69481c5c6a0"
 
-- 
2.25.1


