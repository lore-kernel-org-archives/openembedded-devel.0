Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445A8C47088
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:36:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4502.1668069393270014212
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Hte4gaUy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA8T1GG013348
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=JQcVavaNL8dRZy1RMfW8XtyJ48zSOLLrhhXCPqJoF+A=;
 b=Hte4gaUyM8lrIaX3nO8sstl17lNcfPfkXipHWiOKh7lSXVLvsP1PkeozRQKqdKfoTgLE
 2yqdlqr10LmBFVGCxjtYjU8qXO8nmWByj52EUyhiq9snjbGGaQ4cYaFplRvaWYkhUYQC
 V4YuaLHAruO6MhFMOGsXL/LPTHnGC3N6Uc3fDwgDvIKnOiMvr552c7kZLNAolMEo8ykn
 kBb9lkGhR6P6HJB+emWxAP4WhRjJaFziigiHi7QXhWq6qxBCtimdVAcTAbguR2/9fv7H
 YaGZpev1v7EOr2fxLUTH1XqLLFyREOGQJ92aMuRX9oXb72BwCBkc0IjA/8MMgGhUjycJ ZQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knet9mfj4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:32 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 10 Nov 2022 00:36:31 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:36:31 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 05/14] gssdp: check opengl is enabled or not
Date: Thu, 10 Nov 2022 16:36:16 +0800
Message-ID: <20221110083625.840996-5-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110083625.840996-1-mingli.yu@windriver.com>
References: <20221110083625.840996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Ihd5OCVwYK4DPPYGfYoJFv6bCEixhNnX
X-Proofpoint-ORIG-GUID: Ihd5OCVwYK4DPPYGfYoJFv6bCEixhNnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=719 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99523

From: Mingli Yu <mingli.yu@windriver.com>

The sniffer PACKAGECONFIG will make gssdp depend on gtk4 as below.
PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk4,"

But gtk4 needs the opengl DISTRO_FEATURES enabled, so also check
opengl in gssdp recipe to keep consistent.

Fixes:
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb DEPENDS on or otherwise requires it)
  gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gssdp', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
index 1d8cbb1ae..ad99bbffa 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
@@ -16,14 +16,16 @@ DEPENDS = " \
     libsoup-2.4 \
 "
 
-inherit meson pkgconfig gobject-introspection vala gtk-doc
+inherit meson pkgconfig gobject-introspection vala gtk-doc features_check
 
 SNIFFER = "${@bb.utils.contains("BBFILE_COLLECTIONS", "gnome-layer", "sniffer", "", d)}"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', "${SNIFFER}", "", d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', "${SNIFFER}", "", d)}"
 
 PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk4,"
 
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'sniffer', 'opengl', '', d)}"
+
 PACKAGES =+ "gssdp-tools"
 
 FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
-- 
2.25.1


