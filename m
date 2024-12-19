Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10FAE7718D
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 10:52:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.126725.1734605564772202415
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 02:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=208387d3b6=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ6wNW7018323;
	Thu, 19 Dec 2024 02:52:43 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq5dmw-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Dec 2024 02:52:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 19 Dec 2024 02:52:34 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 19 Dec 2024 02:52:33 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 4/6] libxfce4windowing: add recipe
Date: Thu, 19 Dec 2024 18:52:23 +0800
Message-ID: <20241219105225.555464-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219105225.555464-1-kai.kang@windriver.com>
References: <20241219105225.555464-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fNoLEUOfOXTrSyhXxxI-vxH4V2ZXyl8T
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=6763fafb cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=zBl5grT4JcIo_Isjp0sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fNoLEUOfOXTrSyhXxxI-vxH4V2ZXyl8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_04,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412190088
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 10:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114391

From: Kai Kang <kai.kang@windriver.com>

Add recipe for libxfce4windowing 4.20.0 which is required by other xfce4
components such as xfce4-session, xfdesktop etc.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libxfce4windowing_4.20.0.bb               | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.0.bb

diff --git a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.0.bb b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.0.bb
new file mode 100644
index 000000000..e16997ca1
--- /dev/null
+++ b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Windowing concept abstraction library for X11 and Wayland"
+SECTION = "x11/libs"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"
+
+DEPENDS = "xfce4-dev-tools-native libdisplay-info libwnck3"
+
+SRC_URI[sha256sum] = "56f29b1d79606fb00a12c83ef4ece12877d2b22bf1acaaff89537fbe8e939f68"
+
+inherit features_check gobject-introspection gtk-doc xfce
+
+# Currently, X11 is fully supported. Wayland is partially supported
+REQUIRED_DISTRO_FEATURES = "x11"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
+PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland, wayland-native"
+
+EXTRA_OECONF = "--enable-x11 \
+                WAYLAND_SCANNER=${STAGING_BINDIR_NATIVE}/wayland-scanner \
+                "
+
+do_compile:prepend() {
+    export GIR_EXTRA_LIBS_PATH=${B}/libxfce4windowing/.libs
+}
-- 
2.34.1


