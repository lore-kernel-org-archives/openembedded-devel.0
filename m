Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454C1C43219
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:36:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.4545.1668069400041118162
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EyobtFjl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA7K8Zf003579
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=MRYImXpBjf4dm11dpIBnLIhbnl8g0tSj5qbRCpvwkFg=;
 b=EyobtFjlXwr2kq9XceRQH0oM4FCSfCphxN7x/kazkz1y7JiSJDsyaZzBj5PK0AwG33aq
 BqDet/pyArzfD/Wc0xvqvRz/F76KQ9m53AkzNY742c9K/Mc3+Fuz0/GkBv9DS0Kc6wJi
 KlSmEleULskMV+810cdfvwB1klEAYmo8vKrF+y/oDT93Ds6pNSyz7yBOzTSnq+hCtbck
 vDxBZoyuFwP4yTMhNUceFX40OUwqYN9s935Cr5WeKSCLb72RTxhV2wBMEAvFtvTDQTzQ
 lDkB/OAOesq19sKsAfSy4hcpU5cyr+fjjv6a5H4YIVXNXTNPdSfsPIQxaUiLoybpmGox eg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21mhue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:39 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 10 Nov 2022 00:36:38 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:36:37 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 12/14] gnome-bluetooth: add opengl to REQUIRED_DISTRO_FEATURES
Date: Thu, 10 Nov 2022 16:36:23 +0800
Message-ID: <20221110083625.840996-12-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110083625.840996-1-mingli.yu@windriver.com>
References: <20221110083625.840996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mOQ5yxkmrAiHoeMyvW6r6gjRX5kOr_Ew
X-Proofpoint-ORIG-GUID: mOQ5yxkmrAiHoeMyvW6r6gjRX5kOr_Ew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=932 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99529

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'gtk4-native' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.4.bb DEPENDS on or otherwise requires it)
  gtk4-native was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gnome-bluetooth', 'gtk4-native']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.4.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.4.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.4.bb
index 75e1244f8..1c3180f9d 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.4.bb
@@ -24,7 +24,7 @@ GTKIC_VERSION = "4"
 
 inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI[archive.sha256sum] = "1d6fcf1cdb6cc9923ab334a2c0bc37a2c1bba9d18de153d484eedc04f3c0bcdc"
 
-- 
2.25.1


