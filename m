Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CF0F3D61E
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 08:30:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46876.1774859433742680243
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 01:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Q0dWHwmi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=854954bd2e=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U51ZsE2024214
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 08:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=IbnNnLrRdE39v2DM6GNm
	CnG2NuWBLXuhOP4TB2G0csE=; b=Q0dWHwmicXzcAPBbxHDjvmhtBhYsNWfSu7rU
	3RE1JNlQ7e7k7wIOtxXbo6a290Ziw04oJ1JGSudsEVVCQc6bnpf+Ba5JyX26woIv
	/ZyJTZRzNKwqPKzK9hHBCH+SI4d0I8NmK35StH43WPl+Fo9YE69vhImZD++p3f1j
	sgI+QTNHeHfvnfQaWy/dJcUXCqDzyIxe8HOXQkyJyABJzO1UfOgmGl235w5j6oEQ
	0YUnteytbBgjvAsTartClvN3N2YTS2NhoBhr7owDSFd3dZ83kNfW2uUN1Wa2X7Bd
	iHFn/UajE0HweY5vBKtBTSj9kCfIqGRgE1Tc68TO/C4033/dRQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d65y49tcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 08:30:32 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 30 Mar 2026 01:30:31 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 30 Mar 2026 01:30:30 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH] xfce4-session: Make gdk-pixbuf-csource available
Date: Mon, 30 Mar 2026 16:30:30 +0800
Message-ID: <20260330083030.1895759-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QaZrf8bv c=1 sm=1 tr=0 ts=69ca34a8 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=Vw2tKvLmz8EzdhCFevAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX6NxFLxVUjE/y
 hmz+35QdLog/TQucwDhO42uzdYqbg/xFvJ1mautG6BjoYnBxJin0PoxoLlusQHAP00kwlDBMhR7
 VQC3zAjp9113MQksIZiuGx7xD3Vi04c/UpfpVclwct8xyJXvyBESlmjVqHggDRB3LrNudYudSMG
 1fvpGc9BwqeKBCkPyo7KOGy1SM2W+u43h2ltLXwwl+Pr7c0qVy0Ug79bmh658hkd6IZgSGbZsim
 7aHgCulkBMKQBR7/ZvknuIOqdSQ49iSy/tEZtKNLHYCiO7PViGWvwNg5Bsq57a4F67j+ohQNhvc
 zzdFZt/HoSIYwFtKDaznp3LAg1uVV8uh5PQX6z1u9hyRSLTXWP1O2d4aENFf6X1nmRQakaWx1Vl
 SVpzNrIl79J6UxZ8u2Cz4t70IJOiXk5tu3BxLOQiLqGTInTYjiqEijyKdSECCvkqeQUtC8/wEU0
 QIGDJnqPdZZP/ycFapw==
X-Proofpoint-GUID: jqr3iXaVhzKHTuKNfEK5eNNjkUJ3QJ_H
X-Proofpoint-ORIG-GUID: jqr3iXaVhzKHTuKNfEK5eNNjkUJ3QJ_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 08:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125837

From: Mingli Yu <mingli.yu@windriver.com>

Fixes the below error during do_configure:
  ../sources/xfce4-session-4.21.1/meson.build:50:21: ERROR: Program '/usr/bin/gdk-pixbuf-csource' not found or not executable

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ld-Make-gdk-pixbuf-csource-available.patch | 31 +++++++++++++++++++
 .../xfce4-session/xfce4-session_4.21.1.bb     |  6 ++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meson.build-Make-gdk-pixbuf-csource-available.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meson.build-Make-gdk-pixbuf-csource-available.patch b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meson.build-Make-gdk-pixbuf-csource-available.patch
new file mode 100644
index 0000000000..6cc77262f7
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meson.build-Make-gdk-pixbuf-csource-available.patch
@@ -0,0 +1,31 @@
+From ca9457673128b4024250fe43716c6bbdfad96e96 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 30 Mar 2026 01:09:33 -0700
+Subject: [PATCH] meson.build: Make gdk-pixbuf-csource available
+
+Fixes:
+  ../sources/xfce4-session-4.21.1/meson.build:50:21: ERROR: Program '/usr/bin/gdk-pixbuf-csource' not found or not executable
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 6f372e0..633a5c5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -47,7 +47,7 @@ libxfce4util = dependency('libxfce4util-1.0', version: dependency_versions['libx
+ libxfce4windowing = dependency('libxfce4windowing-0', version: dependency_versions['libxfce4windowing'])
+ xfconf = dependency('libxfconf-0', version: dependency_versions['xfce4'])
+ 
+-gdk_pixbuf_csource = find_program(gdk_pixbuf.get_variable(pkgconfig: 'gdk_pixbuf_csource'), required: true)
++gdk_pixbuf_csource = find_program('gdk-pixbuf-csource', required: true)
+ 
+ # Feature: 'x11'
+ x11_deps = []
+-- 
+2.49.0
+
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.1.bb
index 61a059f051..77ae5da6b8 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.1.bb
@@ -4,14 +4,16 @@ SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libwnck3 libsm libxfce4ui libxfce4windowing virtual/libx11"
+DEPENDS = "libwnck3 libsm libxfce4ui libxfce4windowing virtual/libx11 gdk-pixbuf-native"
 
 XFCE_COMPRESS_TYPE = "xz"
 XFCEBASEBUILDCLASS = "meson"
 
 inherit xfce update-alternatives features_check
 
-SRC_URI += "file://0001-meson.build-hard-code-path-to-iceauth.patch"
+SRC_URI += "file://0001-meson.build-hard-code-path-to-iceauth.patch \
+            file://0001-meson.build-Make-gdk-pixbuf-csource-available.patch \
+"
 SRC_URI[sha256sum] = "a8fe873fdb20366a44f1345400bfb29c2ff0cfe89dfefd852e2575464b80567c"
 
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.34.1


