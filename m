Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D402C10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 15:42:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.160469.1672155744996038398
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Dec 2022 07:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s9i3KkBl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=936063681c=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BRFd4Le002311
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 07:42:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=h8xqS1HS2YJXiDGxv17kfnbm9/7ZYQihAxe9UD4FLKI=;
 b=s9i3KkBlsEVlLSJqRMPS6CB2Wt9dImbogxerVwDbPFPqrYiOd5palYeczyRu11czWoVm
 /AfK08W4/OWxlXhBMTHmPSuxn6d0UQmt8bdbvzE1+rhXAUy7eEzra35t8Ke0+qWyI9hl
 K8ySnmJt4bfR2TjuPME6wNN8286gHYd4ZnTKww7NOC/qvLEKsiO/l2D6PEMsEOp0Q45A
 O89vXHwYGHc5tabBKzl58WWcC6VRuK1BgZPYdZ6wycmXO/bxM0v71SvKZsGH2ZgdIKRC
 IQWLQrs1dcwewdW3qDx9ophknXpjwrjSh3mwpQsnk7nTS2FiduGOGPiGUWUvPX/DrKhD vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk89p49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 07:42:24 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BRFcVIJ032667
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 07:42:24 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk89p47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Dec 2022 07:42:24 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 27 Dec 2022 07:42:24 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 27 Dec 2022 07:42:23 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 5/5] thunar-shares-plugin: Bump GLib minimum required to 2.26
Date: Tue, 27 Dec 2022 23:42:17 +0800
Message-ID: <20221227154217.30842-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221227154217.30842-1-kai.kang@windriver.com>
References: <20221227154217.30842-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: nRPaTkGS6AyoSn5KA09BZG9uc5mYe5Sg
X-Proofpoint-ORIG-GUID: -ncujmVtAt0wlJ-4IMwZzuAum0N8ndqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_11,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=872 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212270129
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 15:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100290

From: Kai Kang <kai.kang@windriver.com>

Backport patch to bump glib minimum required version to 2.26 for
thunar-shares-plugin.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...d-Bump-GLib-minimum-required-to-2.26.patch | 34 +++++++++++++++++++
 .../shares/thunar-shares-plugin_0.3.1.bb      |  2 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-thunar-plugins/shares/files/0001-build-Bump-GLib-minimum-required-to-2.26.patch

diff --git a/meta-xfce/recipes-thunar-plugins/shares/files/0001-build-Bump-GLib-minimum-required-to-2.26.patch b/meta-xfce/recipes-thunar-plugins/shares/files/0001-build-Bump-GLib-minimum-required-to-2.26.patch
new file mode 100644
index 000000000..1cd24572f
--- /dev/null
+++ b/meta-xfce/recipes-thunar-plugins/shares/files/0001-build-Bump-GLib-minimum-required-to-2.26.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Backport [https://gitlab.xfce.org/thunar-plugins/thunar-shares-plugin/-/commit/e4bce21a]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From e4bce21a1bd744ccfde84de4669ac30aa1d72135 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Fri, 2 Dec 2022 20:18:46 +0100
+Subject: [PATCH] build: Bump GLib minimum required to 2.26
+
+This is the minimum required to build since xfce4-dev-tools >= 4.17.1
+set GLIB_VERSION_MAX_ALLOWED to the GLib version found in
+configure.ac.in.
+
+MR: !3
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a458785..bc6d24c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -61,7 +61,7 @@ dnl -------------------------------------------------------
+ dnl Packages checks
+ dnl -------------------------------------------------------
+ XDT_CHECK_PACKAGE([GTK], [gtk+-3.0], [3.22.0])
+-XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.18.0])
++XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.26.0])
+ XDT_CHECK_PACKAGE([THUNARX], [thunarx-3], [1.0.1])
+ 
+ dnl -------------------------------------------------------
+-- 
+2.34.1
+
diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
index fb7589637..d981fe14a 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
@@ -7,7 +7,7 @@ inherit thunar-plugin features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRC_URI[md5sum] = "0884855d60cf1031b9013b6f5b125372"
+SRC_URI += "file://0001-build-Bump-GLib-minimum-required-to-2.26.patch"
 SRC_URI[sha256sum] = "dc1d8c7caa727e76d033d4653dc0742613f57a1711d0050900659c90a84452a0"
 
 RDEPENDS:${PN} += "samba-server"
-- 
2.34.1


