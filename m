Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB30E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 10:52:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.126945.1734605564890237131
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 02:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=208387d3b6=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ6wNW8018323;
	Thu, 19 Dec 2024 02:52:44 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq5dmw-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Dec 2024 02:52:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 19 Dec 2024 02:52:35 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 19 Dec 2024 02:52:34 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 5/6] xfdesktop: 4.18.1 -> 4.20.0
Date: Thu, 19 Dec 2024 18:52:24 +0800
Message-ID: <20241219105225.555464-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219105225.555464-1-kai.kang@windriver.com>
References: <20241219105225.555464-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UT06zCi9_OQyuPF3xGrqPIfw5yP1_t35
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=6763fafb cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=Nt1lHZLk-nvZenycTkAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: UT06zCi9_OQyuPF3xGrqPIfw5yP1_t35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_04,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=752 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412190088
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 10:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114392

From: Kai Kang <kai.kang@windriver.com>

Upgrade xfdesktop from 4.18.1 to 4.20.0:

* add dependency libxfce4windowing
* set variables from glib-2.0.pc in EXTRA_OECONF since paths have been
  removed from the .pc file in oe-core

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfdesktop_4.18.1.bb => xfdesktop_4.20.0.bb}         | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.18.1.bb => xfdesktop_4.20.0.bb} (55%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.1.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.0.bb
similarity index 55%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.1.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.0.bb
index f4d5fef8e..d3360b293 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.1.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.0.bb
@@ -12,6 +12,7 @@ DEPENDS = " \
     libwnck3 \
     libxfce4ui \
     libxfce4util \
+    libxfce4windowing \
     thunar \
     xfconf \
 "
@@ -20,9 +21,15 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "ef9268190c25877e22a9ff5aa31cc8ede120239cb0dfca080c174e7eed4ff756"
+SRC_URI[sha256sum] = "227041ba80c7f3eb9c99dec817f1132b35d8aec7a4335703f61ba1735cd65632"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
 
+EXTRA_OECONF = "GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen \
+                GLIB_COMPILE_RESOURCES=${STAGING_BINDIR_NATIVE}/glib-compile-resources \
+                GLIB_GENMARSHAL=${STAGING_BINDIR_NATIVE}/glib-genmarshal \
+                GLIB_MKENUMS=${STAGING_BINDIR_NATIVE}/glib-mkenums \
+                "
+
 FILES:${PN} += "${datadir}/backgrounds"
-- 
2.34.1


