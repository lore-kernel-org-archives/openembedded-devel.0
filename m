Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866BDCD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:27 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11082.1781686704734369010
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Tj/dnOXZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686706; x=1813222706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GvRR+4VGiqW6zZOYsqT1gUAT7lEYTxtTAeBUoVmF5FI=;
  b=Tj/dnOXZvfTVcaYJhpblnVmAG7uFTtk/vpMiYZ1FcbTxQTmJJMdzQd7o
   Qf8hjHPsVTjbFayNBSMRb6zjQz9nyGZYTgKfgd/aYsn2yx948FW4cV2cS
   YDIEFn/mY4GU5JyiD/L97IZz5RtywPcPS58vpcH7T74RpS5tylbTIvIpu
   Mc0zIQOGlI9/mHUFcru3FeXSvprgyi7+t5G2/a4+I4o/Nza1xyapkRgcU
   n03MtA28Ro+fysrxEPXvO4e0ljU2EfLzgfOTRLUkqSuubgde+ORBbhtK0
   jlgsz+s2mvfjmD/RGLgx6l4Qcc34WrTArfg3O2evkJdfuHggrKXZVefQU
   w==;
X-CSE-ConnectionGUID: PVXCdEQ3QPOLmZEGiaGPcQ==
X-CSE-MsgGUID: eAQoSFl+SmexyFeT5gdxnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="242543039"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="242543039"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:24 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 12C841C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:23 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B7EFD117CC32
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C87441000A79;
	Wed, 17 Jun 2026 08:58:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-xfce] [PATCH 05/17] libxfce4ui: upgrade 4.21.7 -> 4.21.8
Date: Wed, 17 Jun 2026 16:57:55 +0800
Message-ID: <20260617085807.542-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127642

From: Wang Mingyu <wangmy@fujitsu.com>

0001-build-Do-not-display-full-path-in-generated-headers.patch
removed since it's included in 4.21.8

Changelog:
======
- gobject-linter: Fix inconsistent_function_signature
- gobject-linter: Fix unnecessary_null_check
- gobject-linter: Fix g_error_leak
- gobject-linter: Fix g_param_spec_static_strings
- gobject-linter: Fix property_switch_exhaustiveness
- gobject-linter: Fix strcmp_explicit_comparison
- gobject-linter: Fix missing_autoptr_cleanup
- gobject-linter: Fix use_g_steal_pointer
- gobject-linter: Fix matching_declare_define
- gobject-linter: Fix use_clear_functions
- Do not compare gboolean to TRUE or FALSE
- cppcheck: Fix memleak
- cppcheck: Fix knownConditionTrueFalse
- cppcheck: Fix redundantInitialization
- cppcheck: Fix unknownMacro
- gcc-analyzer: Update false positive file after gcc version bump
- cppcheck: Fix varFuncNullUB
- cppcheck: Fix unusedStructMember
- cppcheck: Fix unreadVariable
- cppcheck: Fix invalidPrintfArgType_sint
- cppcheck: Fix nullPointer
- cppcheck: Fix nullPointerRedundantCheck
- cppcheck: Fix knownConditionTrueFalse
- cppcheck: Fix unknownMacro
- scan-build: Update false positive file after clang version bump
- die-editor: Improve Info for unknown icons (#145)
- Add missing chain up to parent class
- die-editor: show icon name in the tooltip (#145)
- shortcuts: Replace Ctrl+Alt+{D,L} with Super+{D,L}
- I18n: Update po/LINGUAS list
- Expose method 'xfce_icon_view_get_cell_area'
- docs: Add missing symbol
- build: Do not display full path in generated headers
- Wording "file name" --> "filename" (#142)
- Downgrade the "no startup notification on Wayland" warning to message
- Translation Updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...splay-full-path-in-generated-headers.patch | 38 -------------------
 ...xfce4ui_4.21.7.bb => libxfce4ui_4.21.8.bb} |  6 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.21.7.bb => libxfce4ui_4.21.8.bb} (82%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch
deleted file mode 100644
index c7ea1e6fe9..0000000000
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b8bf147d621739a1b8a4d1cc8398d1c90288e9d6 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
-Date: Mon, 16 Mar 2026 16:21:51 +0100
-Subject: [PATCH] build: Do not display full path in generated headers
-
-Fixes: #144
-
-Upstream-Status: Backport [https://gitlab.xfce.org/xfce/libxfce4ui/-/commit/b8bf147d621739a1b8a4d1cc8398d1c90288e9d6]
-
-Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
----
- libxfce4ui/meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libxfce4ui/meson.build b/libxfce4ui/meson.build
-index 8cac84eb..ca5ac927 100644
---- a/libxfce4ui/meson.build
-+++ b/libxfce4ui/meson.build
-@@ -102,7 +102,7 @@ libxfce4ui_enums += gnome.mkenums(
-   install_dir: libxfce4ui_install_dir,
-   sources: libxfce4ui_enum_headers,
-   fhead: '#if !defined(_LIBXFCE4UI_INSIDE_LIBXFCE4UI_H) && !defined(LIBXFCE4UI_COMPILATION)\n#error "Only <libxfce4ui/libxfce4ui.h> can be included directly, this file is not part of the public API."\n#endif\n\n#ifndef __LIBXFCE4UI_ENUM_TYPES_H__\n#define __LIBXFCE4UI_ENUM_TYPES_H__\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n\n',
--  fprod: '/* enumerations from "@filename@" */\n\n',
-+  fprod: '/* enumerations from "@basename@" */\n\n',
-   vhead: 'GType @enum_name@_get_type(void) G_GNUC_CONST;\n#define XFCE_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n\n',
-   ftail: 'G_END_DECLS\n\n#endif /* !__LIBXFCE4UI_ENUM_TYPES_H__ */',
- )
-@@ -111,7 +111,7 @@ libxfce4ui_enums += gnome.mkenums(
-   install_header: false,
-   sources: libxfce4ui_enum_headers,
-   fhead: '#include "libxfce4ui-enums.h"\n#include "xfce-gtk-extensions.h"\n#include "libxfce4ui-enum-types.h"\n#include "libxfce4ui-visibility.h"\n\n',
--  fprod: '/* enumerations from "@filename@" */\n\n',
-+  fprod: '/* enumerations from "@basename@" */\n\n',
-   vhead: 'GType\n@enum_name@_get_type(void)\n{\n    static GType type = 0;\n\n    if(!type) {\n        static const G@Type@Value values[] = {',
-   vprod: '            { @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
-   vtail: '            { 0, NULL, NULL }\n\t};\n\ttype = g_@type@_register_static("@EnumName@", values);\n    }\n\n    return type;\n}\n\n',
---
-2.34.1
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.8.bb
similarity index 82%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.8.bb
index 9c86da48e6..70891aaf8d 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.8.bb
@@ -19,10 +19,8 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11','opengl', "", d)}"
 
 # TODO: Check if 0001-... can go
-SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
-            file://0001-build-Do-not-display-full-path-in-generated-headers.patch \
-            "
-SRC_URI[sha256sum] = "a72a7af39cf183819bcfb61b1747d425261e966ccb172b2fc28f1494f524bd17"
+SRC_URI += " file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
+SRC_URI[sha256sum] = "e6caafc6fe5e07765e22dd849a19b21e5aa44f51c66fa1d7db74b94330bd457b"
 
 EXTRA_OEMESON = "-Dvala=disabled -Dvendor-info=${DISTRO}"
 
-- 
2.43.0


