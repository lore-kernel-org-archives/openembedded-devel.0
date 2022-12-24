Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9536FC46467
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.106415.1671917653123768766
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=odcuwaEG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLUKT4006112
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=B/7/icfiysciED2NJZgZsK2ulfwxITLle2EcPXTWPR8=;
 b=odcuwaEGm6A2iRS47g8ukkTFd8W2vpEnBBJeefEz6LiOnepHiwwBmUPuHzfHZZvHEIGU
 a2vaYgM3as8E01hpqUsrWDcYAuoHLbvsJ73On7XYMm5s919izxavwhllgoVgrVx1sFDc
 oied+qKwUySe+2cHlWPQTgFWSb7mp96H8iqJJpvElapBmLW22xL+1picIyaqMXrJb3dg
 oAafkeeK0e8prW9+k/f/IVjO88Kib/Prju6qn/VfnKsEkmW7Q2lpd3v1jmHdr967/5h4
 SnTqdVG8Tqqz5170xEHTRTqnt3XNZQOIRNouYL9G/IaKjkKvNGj/Xw9TFhH7SFP6SOzR YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk889s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:12 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BOLYCDQ013036
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:12 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk889rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 13:34:12 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:34:12 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:34:11 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 16/16] xfwm4: 4.16.1 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:47 +0800
Message-ID: <20221224213347.39959-17-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: wZbisrJdBziC-vh0XwwWW_IihJgpUOUp
X-Proofpoint-ORIG-GUID: dbOLRRRECgxXzVqzpAR6crSurM3Do9XD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100224

From: Kai Kang <kai.kang@windriver.com>

Update xfwm4 from 4.16.1 to 4.18.0

* update license with GPL-2.0-or-later

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.16.1.bb => xfwm4_4.18.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.16.1.bb => xfwm4_4.18.0.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
index a32bad47e..839f1c870 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Xfce4 Window Manager"
 SECTION = "x11/wm"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
 DEPENDS = "virtual/libx11 libxfce4ui libwnck3 libxinerama"
 
@@ -8,7 +8,7 @@ inherit xfce update-alternatives features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "b5b24ca04bd73c642db0a4b4df81d262381d758f01b51108257d48b391b8718c"
+SRC_URI[sha256sum] = "92cd1b889bb25cb4bc06c1c6736c238d96e79c1e706b9f77fad0a89d6e5fc13f"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.17.1


