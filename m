Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BC6C10F1B
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.106409.1671917644599912960
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=N600tzRB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLY3vT018261;
	Sat, 24 Dec 2022 13:34:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=8Ce4Kbg9b7yVoGfXI0Q24w7itgPrAEPx99+i4FfYdlU=;
 b=N600tzRBUQPLrkLWx99KHXYCspzQ3cNVekuwUamHcfvFuAy0+qa9XwNpFsBojF/4KhhA
 oqCccTVm25CIF19QsY603QaneHtpqrSMh7kTnyfaTDCIvAXEE4IkgLioMAdHMh2HPaSJ
 Hk+pbaE7UFylT/UIAJYhRh7N4DMilBpZJDcpqC4FB6qOBL5mLzpb1y24ATL0Zo5Px64v
 xb9QqX3a+iaKwx0/+I25MV5RchddttlEPxhkbxybfun9JR+M6NRJo5afpEIbMySn12uw
 wqUZilo+idFAk1HOsiykPvfrUKh+SkDuQW3/1/X1gEhIQSM73XdzsxELPc3ONYtJRk2n Tw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mp1trg6d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 13:34:03 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:34:03 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:34:02 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 08/16] thunar-volman: 4.16.0 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:39 +0800
Message-ID: <20221224213347.39959-9-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: l0aWo_X9tTlllUhCQxEYFsUIFCz4LyGe
X-Proofpoint-ORIG-GUID: l0aWo_X9tTlllUhCQxEYFsUIFCz4LyGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=819
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100216

From: Kai Kang <kai.kang@windriver.com>

Update thunar-volman from 4.16.0 to 4.18.0
* update license with GPL-2.0-or-later

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{thunar-volman_4.16.0.bb => thunar-volman_4.18.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_4.16.0.bb => thunar-volman_4.18.0.bb} (63%)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.18.0.bb
similarity index 63%
rename from meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
rename to meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.18.0.bb
index 4b72d3a79..f6c6b44b8 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.18.0.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Automatic management of removable drives and media for thunar"
 SECTION = "x11"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "exo libnotify libgudev"
 
 inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "d2c0e719b242b7fd3db70bc6678a2df1abf2cfaa899b775a1591a5efa08a547d"
+SRC_URI[sha256sum] = "93b75c7ffbe246a21f4190295acc148e184be8df397e431b258d0d676e87fc65"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.17.1


