Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51474C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 04:33:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.95092.1670992426018238381
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Dec 2022 20:33:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XP0Iiz/c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93477fe25d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BE4LQnQ023136
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 20:33:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=2yuZ6a4Xg5lKgu4MSfbW/B6rrM/DEM+0EgJwVei/f7k=;
 b=XP0Iiz/cciHor8Qtg/ilYVWpis6/XKvd+2GDQ4V7vviOCDJ7tiGQaQZIZknt/TtwxzDb
 Q98m6L8h31SP/DO+FbDFMAbk5v/n7Kf2J4tJRWZAFCTDwYzlqlwt4A8pfjSX2jx3orab
 YQ7/AnRyqlMua7KiqQCBEeliDnLy9pnDUQIJGINsX9JMk/GcPTr01Fd4NbOVgqIL3QEw
 +kl8i5ml/j3Ni5RqjSbKP6FQi9KHwqYuqu/pxfwjKInSdVGu7IotB3Xs/qBWl6ZSJL/B
 1cCaQIEJcv4VMqfP3V535hr55AVDjwbbvvYg29xQdoydijICDskzRBoMaeUbRbM7BARr yw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3meyg50ae0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 20:33:45 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 13 Dec 2022 20:33:44 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 13 Dec 2022 20:33:43 -0800
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>,
        Archana Polampalli
	<archana.polampalli@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: 4.16.2 -> 4.16.5
Date: Wed, 14 Dec 2022 04:33:37 +0000
Message-ID: <20221214043337.2695189-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sQuoG4Z2gXDfFsit1TQgNRvj_CWQOD2n
X-Proofpoint-ORIG-GUID: sQuoG4Z2gXDfFsit1TQgNRvj_CWQOD2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_02,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=777
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212140034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 04:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100074

It fixes CVE-2022-45062 in xfce4-settings 4.16.5.

CVE: CVE-2022-45062

$ git log --oneline xfce4-settings-4.16.2..xfce4-settings-4.16.5 |  grep -v "Update translation"

83ea11cf Updates for release
f1cb5bda mime-settings: Properly quote command parameters
f7707d8b Revert "Escape characters which do not belong into an URI/URL
(Issue #390)"
b532324f Back to development
b9729c85 Updates for release
55e3c5fb Escape characters which do not belong into an URI/URL (Issue #390)
341443f8 Prefer full command when basic command is env (Fixes #358)
8d4106b3 Back to development
024399b1 Updates for release
af601e32 build: Fix intltool lock file problem during make distcheck
0875cfba xfsettingsd: Fix recursive lock in libX11 (Fixes #369)
20d866dc Back to developmen

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../{xfce4-settings_4.16.2.bb => xfce4-settings_4.16.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.2.bb => xfce4-settings_4.16.5.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
index aa4265f7b..4a4e9f188 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
@@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
-SRC_URI[sha256sum] = "4dd7cb420860535e687f673c0b5c0274e0d2fb67181281d4b85be9197da03d7e"
+SRC_URI[sha256sum] = "7a4f74802486d7e77a1c9fa4fda19b13fc8a8dec3e5074f367e34fa82b40d28e"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.34.1


