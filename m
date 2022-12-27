Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F870C4167B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 15:42:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.159334.1672155745025283390
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Dec 2022 07:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KiJIfyJc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=936063681c=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BRFgNGG032283;
	Tue, 27 Dec 2022 15:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=/wrPEyXgeuWhzGP2GBX8/7IZz5zt5ENducbMaXY0uM0=;
 b=KiJIfyJcFtn+yymNwp1hzCq7eP3bWHcYtNwyK98w6+Rovfy/1Qr7aC9BoJgZCEMy+Heh
 2JcnuxwnAIRSfaKn9nuYKXSlWFHhXrQcgVGN+IokqXTJSOd9kxYsCKZ108MtrpRL6VOF
 EVTnGqJcrztnY9Q7V5KgnULSYtVchXnANgmCKtkZx9N5XSl67aw1ZmOSHZVD6QXqUtXT
 RMj71ieNpCae+QHfEwMkUOl4OhpLbaNTzz2tZCpISjQO4cUt+0h6Tvjk68t6PO0z5uQT
 Fw/JzaYr9SVegQ1ukWMZ/3N4Ag3yzWlmCmYgF9Ld1ojodGhXibF9YEVHTd+qGrGXTi7X 7Q== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn31u46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Dec 2022 15:42:23 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 27 Dec 2022 07:42:23 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 27 Dec 2022 07:42:22 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 4/5] xfce4-sensors-plugin: 1.4.3 -> 1.4.4
Date: Tue, 27 Dec 2022 23:42:16 +0800
Message-ID: <20221227154217.30842-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221227154217.30842-1-kai.kang@windriver.com>
References: <20221227154217.30842-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WadDPLPJuC2GDj50saCjInabhQ-EpqW2
X-Proofpoint-GUID: WadDPLPJuC2GDj50saCjInabhQ-EpqW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_11,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=838 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212270129
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 15:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100291

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-sensors-plugin from 1.4.3 to 1.4.4

* update license with GPL-2.0-or-later

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ensors-plugin_1.4.3.bb => xfce4-sensors-plugin_1.4.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/sensors/{xfce4-sensors-plugin_1.4.3.bb => xfce4-sensors-plugin_1.4.4.bb} (81%)

diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb
similarity index 81%
rename from meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb
rename to meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb
index 13933b6cd..69996d2a3 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Sensors plugin for the Xfce Panel"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-sensors-plugin"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b94789bed9aec03b9656a9cc5398c706"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "171c0235f70c65f0ffee587e960d9da79b284855df22130239eac26272ec06c9"
 SRC_URI += "file://0001-Do-not-check-for-sys-class-power_supply-we-are-cross.patch"
+SRC_URI[sha256sum] = "6c1605a738e5df40e084d08ac93f962cd445093396de1e9bfadc7ab4588c36b6"
 
 EXTRA_OECONF = " \
     --disable-procacpi \
-- 
2.34.1


