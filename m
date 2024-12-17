Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CEEE77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 11:34:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.79307.1734435289507900226
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 03:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20816660d6=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHB0YTs020065
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 03:34:49 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq2rw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 03:34:49 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 17 Dec 2024 03:34:48 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 17 Dec 2024 03:34:47 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 5/5] xfce4-power-manager: 4.18.2 -> 4.20.0
Date: Tue, 17 Dec 2024 19:34:34 +0800
Message-ID: <20241217113434.2082270-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217113434.2082270-1-kai.kang@windriver.com>
References: <20241217113434.2082270-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tqQKYFK-qFWJ17JjQa67tac5fLlmNvlz
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=676161d9 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=O24Aq5uEAAAA:8 a=t7CeM3EgAAAA:8 a=AKEFA3eWkFvmdrGO2UUA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: tqQKYFK-qFWJ17JjQa67tac5fLlmNvlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-17_06,2024-12-17_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=777 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412170095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 11:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114371

From: Kai Kang <kai.kang@windriver.com>

Upgrade xfce4-power-manager from 4.18.2 to 4.20.0:

* remove configure option `--enable-network-manager` which has been
  removed from upstream
  https://gitlab.xfce.org/xfce/xfce4-power-manager/-/commit/cc9921a
* set variable GDBUS_CODEGEN for configure
* add PACKAGECONFIG wayland

The change log is at:

https://gitlab.xfce.org/xfce/xfce4-power-manager/-/blob/master/NEWS

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...r-manager_4.18.2.bb => xfce4-power-manager_4.20.0.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4.18.2.bb => xfce4-power-manager_4.20.0.bb} (78%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.2.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.20.0.bb
similarity index 78%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.2.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.20.0.bb
index bb69f11e9..46f70e6e0 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.20.0.bb
@@ -11,15 +11,18 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libnotify libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[sha256sum] = "e1608fd534b6b07529c0840ffc731cb93347ee6deb547a9933215b1816dcdf4d"
+SRC_URI[sha256sum] = "971391cef63352833bdd92df28957392e17e1f2b3d486c0f57294fd204d6ed29"
 
 EXTRA_OECONF = " \
-    --enable-network-manager \
+    GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen \
     --enable-panel-plugins \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
+                   "
 PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
+PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland, wayland-native"
 
 PACKAGES += "xfce4-powermanager-plugin"
 
-- 
2.34.1


