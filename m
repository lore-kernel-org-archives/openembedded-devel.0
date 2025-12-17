Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815A0D6407E
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 06:55:24 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8703.1765954516544639379
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 22:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=evfqnD2Z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765954516; x=1797490516;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6ce4btlh9UABq6hWxuCZzqYk9mLWb6OPFxestt6hvos=;
  b=evfqnD2ZgFC5Rmh4GcO6QAR++SV9QZY7o2CRgCOU1yidzmR9pNSOAM5a
   PsltfSXPwmbPX6UvoWbrUlKdetPDBM1lg/0S8yugPB/9ElYeUamuWAblH
   kjbBQ30pBW6uJ3HZ8hNwgn5orQRoUFts2lMYmFtu4Dk2WuEc7WYAeqiLw
   QuQgDHi1uxtItSenimuyKiheA4TX9+zinhdOG2+5nWr77hSZb1zwEbLp7
   v1opo/ml/dOgXSLthPFHww66NKz8cV2m6/Uvftuf918Nqjz94w+7UhMh1
   BCHQSwM9lPFLzdhv7j+VeESJt0/3/9lrVEKJdZWEWdTcMIgqhw07hzN6S
   Q==;
X-CSE-ConnectionGUID: w057RG/0SRuEVTpWVZ9zdA==
X-CSE-MsgGUID: e+utVK+FRYOtRD6t4vzRqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="222891922"
X-IronPort-AV: E=Sophos;i="6.21,155,1763391600"; 
   d="scan'208";a="222891922"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 15:55:14 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id B682E8204D6
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:55:14 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 6FE67C060B3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:55:14 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 1E7341022586
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:55:11 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH 1/5] libgsf: upgrade 1.14.53 -> 1.14.54
Date: Wed, 17 Dec 2025 14:54:41 +0800
Message-ID: <20251217065441.33406-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122713

Update 0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch for 1.14.54.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...-drop-a-copy-paste-of-introspection.m4-m.patch | 15 +++++++++------
 .../{libgsf_1.14.53.bb => libgsf_1.14.54.bb}      |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.53.bb => libgsf_1.14.54.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch b/meta-gnome/recipes-gnome/libgsf/libgsf/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
index bc0090e17b..d3a39b3a6a 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
@@ -5,18 +5,21 @@ Subject: [PATCH] configure.ac: drop a copy-paste of introspection.m4 macros
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Update for 1.14.54.
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
- configure.ac | 78 +-----------------------------------------------------------
+ configure.ac | 78 +---------------------------------------------------
  1 file changed, 1 insertion(+), 77 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 54f7663..3038535 100644
+index 5cdb5fe..32df491 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -77,83 +77,7 @@ libgsf_reqs="
- "
+@@ -81,83 +81,7 @@ PKG_CHECK_MODULES(LIBGSF, $libgsf_reqs)
+ AC_DEFINE(GLIB_VERSION_MIN_REQUIRED, [GLIB_VERSION_2_62], [GLib symbol visibility])
+ AC_DEFINE(GLIB_VERSION_MAX_ALLOWED, [GLIB_VERSION_2_62], [GLib symbol visibility])
  
- PKG_CHECK_MODULES(LIBGSF, $libgsf_reqs)
 -# GObject Introspection
 -GIR_REQ=1.0.0
 -AC_ARG_ENABLE(introspection,
@@ -99,5 +102,5 @@ index 54f7663..3038535 100644
  AC_ARG_WITH([gir-dir],
  	AS_HELP_STRING(
 -- 
-2.7.0
+2.43.0
 
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.54.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.54.bb
index b0df3a64b6..8973b3e656 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.54.bb
@@ -9,7 +9,7 @@ DEPENDS = "libxml2 bzip2 glib-2.0 zlib"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gobject-introspection gettext gtk-doc
 
-SRC_URI[archive.sha256sum] = "0eb59a86e0c50f97ac9cfe4d8cc1969f623f2ae8c5296f2414571ff0a9e8bcba"
+SRC_URI[archive.sha256sum] = "d18869264a2513cfb071712486d115dada064ff8a040265b49936bca06f17623"
 SRC_URI += " file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
 PACKAGECONFIG ??= ""
-- 
2.43.0


