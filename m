Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD04C46467
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:36:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.4544.1668069392590368743
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MlakGEx5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA8T1GF013348
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=WBYieZLcTFNCssEangjKhi8iy+cDsRH+NIoib6j/qGQ=;
 b=MlakGEx5+zzxdfJy6E+3/2ytE/0IrnthtqM8PZ93pjbAqkKI6UL+qWuv/qn146OgwpwA
 hntiBrDe4dLXDCh0XdqzBo9R03iB/IgP+hc9ZUmyhHWTCfbuSr1vqyiqiEtLTJe1f5QS
 IoigKEDyWkUSo8AwOFYJhNFXhvcz3q3KcfV+qf4sM0lGXJpiB6G+JIhOO50WM/mjGJzw
 uzrofgIqxup9Rlkl9IRsPULxj5WE4M8urrDXZdPTdXe0N+hvgUFXXvkX8gORQlnX1PJh
 w2+KJ5GCI64TukZjOyRsY/RvA8Nf48mC8/HBmxcIoG44EqCIiOAoLWZ9HrPGZT4cS57a xg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knet9mfj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:31 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 10 Nov 2022 00:36:30 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:36:30 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 04/14] network-manager-applet: add opengl to REQUIRED_DISTRO_FEATURES
Date: Thu, 10 Nov 2022 16:36:15 +0800
Message-ID: <20221110083625.840996-4-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110083625.840996-1-mingli.yu@windriver.com>
References: <20221110083625.840996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7NaDqoXmQQPe3uWDFcg7VQ1SWlakfJ1d
X-Proofpoint-ORIG-GUID: 7NaDqoXmQQPe3uWDFcg7VQ1SWlakfJ1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99521

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'libnma' (but /build/layers/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.26.0.bb DEPENDS on or otherwise requires it)
  libnma was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'network-manager-applet', 'libnma']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../network-manager-applet/network-manager-applet_1.26.0.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.26.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.26.0.bb
index 8046b139c..0c4834c94 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.26.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.26.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "gtk+3 libnma libnotify libsecret libgudev networkmanager iso-codes ns
 GNOMEBASEBUILDCLASS = "meson"
 inherit features_check gnomebase gsettings gtk-icon-cache gettext
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI[archive.sha256sum] = "69611b29064adbd57395fe3e51a9ebde1ea794615f776900453a2bbe3d8cddfd"
 
-- 
2.25.1


