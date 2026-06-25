Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B243CDE00B
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:50 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7030.1782378168243009514
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fZYeIa+N;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378168; x=1813914168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rhfdsp5Qby+U2kcb7SAvL1cr38YbwmdtYtqjfDR1d48=;
  b=fZYeIa+NLoI/P2jj26spz5l4Np0mTxtJlyyS5rtVsKKU1NzcWPIsNIPM
   HQW6jz/NQle6u4SBC9N/ej31yqg6pfPClTUNcMQJT/vLzQhRJJUtY4UCF
   n729WBMoNDLz5hfOsU43YQkEynqjT+ZU8ontA15dz5w7sxd0ReL6WXZYs
   Yltg3A4UzzbI/SL70deO/Qnpn0bgnDsh5joqHkrBoFUeybblUfEs+3ZP8
   1VAUkwhm1ARtLwRI5U/aRg/Q7YArKfNep3aemK6EFkEXTSNXHY2o+RmFm
   7L4n8Wynci/WfW6r1qiBUKvfdm70JL/tjAqSGWsWX7NJBDQJQea33bVVs
   w==;
X-CSE-ConnectionGUID: qY6ishdvTzGB7mKw1OCwsg==
X-CSE-MsgGUID: AQBvrrXmSZmW78CSHGrqQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="248685619"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="248685619"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:46 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A1BB61C1C704
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:46 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5CA308267B0
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 652391017328;
	Thu, 25 Jun 2026 09:02:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-xfce] [PATCH 47/47] xfce4-settings: upgrade 4.21.1 -> 4.21.2
Date: Thu, 25 Jun 2026 17:01:27 +0800
Message-ID: <20260625090127.1563-47-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127778

From: Wang Mingyu <wangmy@fujitsu.com>

0001-build-Do-not-display-full-path-in-generated-headers.patch
removed since it's included in 4.21.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...splay-full-path-in-generated-headers.patch | 36 -------------------
 ...ngs_4.21.1.bb => xfce4-settings_4.21.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.21.1.bb => xfce4-settings_4.21.2.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
deleted file mode 100644
index 50006b1710..0000000000
--- a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 93fa2ed9a987c0f03c9f5aa0f31cb770d1cc5f17 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
-Date: Mon, 16 Mar 2026 16:44:43 +0100
-Subject: [PATCH] build: Do not display full path in generated headers
-
-Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-settings/-/commit/93fa2ed9a987c0f03c9f5aa0f31cb770d1cc5f17]
-
-Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
----
- dialogs/mime-settings/meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/dialogs/mime-settings/meson.build b/dialogs/mime-settings/meson.build
-index b7ca8dc7..5ac9a936 100644
---- a/dialogs/mime-settings/meson.build
-+++ b/dialogs/mime-settings/meson.build
-@@ -30,7 +30,7 @@ enums += gnome.mkenums(
-   install_header: false,
-   sources: 'xfce-mime-helper.h',
-   fhead: '#ifndef __XFCE_MIME_HELPER_ENUM_TYPES_H__\n#define __XFCE_MIME_HELPER_ENUM_TYPES_H__\n#include <libxfce4ui/libxfce4ui.h>\nG_BEGIN_DECLS\n',
--  fprod: '/* enumerations from "@filename@" */\n',
-+  fprod: '/* enumerations from "@basename@" */\n',
-   vhead: 'GType @enum_name@_get_type (void) G_GNUC_CONST;\n#define XFCE_MIME_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n',
-   ftail: 'G_END_DECLS\n\n#endif /* !__XFCE_MIME_HELPER_ENUM_TYPES_H__ */',
- )
-@@ -39,7 +39,7 @@ enums += gnome.mkenums(
-   install_header: false,
-   sources: 'xfce-mime-helper.h',
-   fhead: '#undef GTK_DISABLE_DEPRECATED\n#define GTK_ENABLE_BROKEN\n#include "xfce-mime-helper.h"\n\n#include "xfce-mime-helper-enum-types.h"',
--  fprod: '\n/* enumerations from "@filename@" */',
-+  fprod: '\n/* enumerations from "@basename@" */',
-   vhead: 'GType\n@enum_name@_get_type (void)\n{\n\tstatic GType type = 0;\n\tif (type == 0) {\n\tstatic const G@Type@Value values[] = {',
-   vprod: '\t{ @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
-   vtail: '\t{ 0, NULL, NULL }\n\t};\n\ttype = g_@type@_register_static ("@EnumName@", values);\n  }\n\treturn type;\n}\n',
---
-2.51.2
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.1.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.2.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.1.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.2.bb
index 16b90840c7..df60f8c40d 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.21.2.bb
@@ -12,8 +12,7 @@ inherit xfce features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += "file://0001-build-Do-not-display-full-path-in-generated-headers.patch"
-SRC_URI[sha256sum] = "e57a33d0bb9d63d0ef6f469c2d42cbf66e37d9127cc204de411b7385274e26d0"
+SRC_URI[sha256sum] = "064f72fb5ead25d9bd1724bea803f1017fc2287b32dc55eacf4f6e3d78e2b7e8"
 
 PACKAGECONFIG ??= " \
     notify \
-- 
2.43.0


