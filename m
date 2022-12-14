Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD28C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 04:28:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.95034.1670992123385741138
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Dec 2022 20:28:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DWfFRnmo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93477fe25d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BE4KeDk021123
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 04:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=7fpEmr4rR2VCTdJKfcyaubOLamUMX2zmBFGhuP2Q3ck=;
 b=DWfFRnmooCGhdt65D6WqtUMLs7dSKQyb/urGB7KjCdGXDjvAmsH8EFXy5wuXbT7CsJam
 rwMSRW/Ai+3pa+lb0cHA1mb8ZV0ytOfxuWmwk4BZDYpxCTaNCShz7s/CZNWOLhpAnunh
 zchy2uGZhJmMxuPRI25ALDWxWSA6a8DHYC1Sm7qaWPBPr4mzlMMUUn16x4WuogB0DPkx
 fskg0Kb0xbCyumQWUVQKqVwJSXM/ktE2vRl6Po91ssQNxa4fK9FqAoBGfbBwHcDpWRIV
 JJeFi+GNrNrJN763SX8SzuQJl7Ls/vWWckASRCkFXr9IL1BQC0lIP0HjxyhOt80GvEge Xg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3meyg5g9qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 04:28:42 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 13 Dec 2022 20:28:41 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 13 Dec 2022 20:28:39 -0800
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>,
        Archana Polampalli
	<archana.polampalli@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: 4.16.2 -> 4.16.5
Date: Wed, 14 Dec 2022 04:28:35 +0000
Message-ID: <20221214042835.2690149-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 0S6dx0aWpdl3TYKsmDwIaRzSSTxvg1AK
X-Proofpoint-GUID: 0S6dx0aWpdl3TYKsmDwIaRzSSTxvg1AK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_01,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=524 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212140033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 04:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100073

It fixes CVE-2022-45062 in xfce4-settings 4.16.5.

CVE: CVE-2022-45062

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


