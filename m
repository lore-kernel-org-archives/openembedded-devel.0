Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95340C4167B
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.106413.1671917652045444104
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Bil7BjEB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLUt2R027971;
	Sat, 24 Dec 2022 21:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=vg3kQhMOA1vsW+6ie8h3biu9BLHxv0I+jEOJldKG8us=;
 b=Bil7BjEBn0VxHRF+ikRX0YXRZuLJbkop6CIa6FELde+ZcMK79kCN9XrFUuRJCxAauGTR
 BTliWfhQx1HfOjQfxKPaVY7ju625ONhi9LFJLSpOhhT9kSspggV5HuARCGfB9sx1zCeI
 EJ3UrlHeS9iSDJxOXRuocxC4fnxmduD3G34mjXtX1NHv+WrkGoQSQU1V2yzyeYnCR7LS
 H96wWefySxnVX5MmPPpT5ZK/9oWdZA7VR4ql67mpxTZtWaOVClsI+FeVgpRpuduTeG08
 /jYDgNwzZaLwXZIp+GU0Al36fyZcjLNzYV84N7BEvcijKjuy+ajup6jc7IgB8exLueMO YA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn30fd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 21:34:10 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:34:10 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:34:09 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 14/16] xfce4-settings: 4.16.5 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:45 +0800
Message-ID: <20221224213347.39959-15-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2rb2zt7LVRbfdu0OyNNNfpfB8ybfsf-v
X-Proofpoint-GUID: 2rb2zt7LVRbfdu0OyNNNfpfB8ybfsf-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=726 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100223

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-settings from 4.16.5 to 4.18.0

* update license with GPL-2.0-or-later

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-settings_4.16.5.bb => xfce4-settings_4.18.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.5.bb => xfce4-settings_4.18.0.bb} (85%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.0.bb
similarity index 85%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.0.bb
index 4a4e9f188..0692970f7 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Xfce4 settings"
 SECTION = "x11/wm"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "exo garcon libxi virtual/libx11 xrandr libxcursor libxklavier upower"
 
 inherit xfce features_check mime-xdg
@@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
-SRC_URI[sha256sum] = "7a4f74802486d7e77a1c9fa4fda19b13fc8a8dec3e5074f367e34fa82b40d28e"
+SRC_URI[sha256sum] = "ed3f75837cb33cd694610fc87cd569c4782b7ac4e099143a3dbe8fff1f1c6a9d"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.17.1


