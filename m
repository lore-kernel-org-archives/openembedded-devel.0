Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABF1C02192
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.40068.1736843353793597239
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qB6zXxpx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843353; x=1768379353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=sRRu+NBna1x+hgj3ylryhMb+OxA2i0zYNGwfSh5Hp+g=;
  b=qB6zXxpxpaGrNMArJwh0CDMc6iOK7NIi2/AakD8zD4tQU/Z8Da/Un/UY
   kFVa78tnu12OXRtRue4lyQHaDYKJaiJzvX/QWsc1ALz6gYFoleuZqovSG
   y2dVACHONl05t1209EYQaLYODiNCsmWhbvO9VlMsh/SOLEF5rSnxQrawb
   RyK53wHGCEF4WIlThVsYFUiOv8Xa+ZGx2U2G0/OlP3PDFu4qyohXdjgdb
   PeJy5qm3juz8NuItWlNz3PXEDv4xapM/PnqZ37KLcIfR39oeK+4bw0dXy
   P2+3fLuq158B0GQDeYkIc+ZyBbu8kFJNyKNxkrmLtFJj3x7Euak2mdiwb
   g==;
X-CSE-ConnectionGUID: 9YcM7Z7IR+WvUuTgS+UjOA==
X-CSE-MsgGUID: v1P2gMhqQ+23OPfNJ5xPfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="188950517"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="188950517"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:01 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C9ED2DE67A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A18FAD4BC3
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3529620071A35
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D71C51A000B;
	Tue, 14 Jan 2025 16:28:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/30] gtk-vnc: upgrade 1.3.1 -> 1.4.0
Date: Tue, 14 Jan 2025 16:28:24 +0800
Message-Id: <1736843329-4131-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--6.114300-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwYdZqQlzVQvB+g
	pVI2n9LRO4RENSYkdvGkulA7P59GuubviKMxuy8uzG0LtXz4gg9ceVBIhfwO9WcLXVVpB5pub3Z
	n1RjX6ykutltZB7O9WZrLuu/rn2jQ7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5AKYs
	Q1UtbN91g82fo850ElX311rflycGGNrDtqmaiQXrGWmeVAULKHfS0Ip2eEHnwj/1Rbkzl1EymDn
	I5x2hWCjoczmuoPCq2i+HsYwqENFF57VybxCTz0I6cWX8AS/hkcL6TjOcszqDifcQCwL6fv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114865

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Support g_autoptr for exported allocated types
- Require meson >= 0.56
- Replace gtk-doc with gi-docgen for API docs
- Add missing vnc_color_map_lookup method sym to exports
- Speed up coroutine switching with setjmp/longjmp
- Improve valgrind compatibility with coroutines
- Add native winfiber coroutine for Windows
- Add support for libucontext coroutines
- Refuse to use broken native ucontext support on macOS aarch64
- Raise fatal error on impossible conditions / OOM in coroutines
- Many other misc coroutine bugs / improvements
- Add support to pass CA cert data for TLS
- Allow ungrabbing keyboard in gvncviewer demo
- Fix leak of socket address in SASL auth
- Avoid mandating SASL SSF over UNIX sockets
- Don't assume SASL out data is NUL terminated
- Fix rendering artifacts on HiDPI displays
- Don't expose server auth types to apps that are not implemented
- Convert more code to use GNUTLS for ciphers/hashes
- Replace remaining use of gcrypt with gmp
- Add unit testing of VNC, ARD, MS logon auth types

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gtk-vnc/{gtk-vnc_1.3.1.bb => gtk-vnc_1.4.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/gtk-vnc/{gtk-vnc_1.3.1.bb => gtk-vnc_1.4.0.bb} (88%)

diff --git a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.4.0.bb
similarity index 88%
rename from meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
rename to meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.4.0.bb
index 8bd37f754c..016874c6a9 100644
--- a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
+++ b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.4.0.bb
@@ -27,4 +27,4 @@ inherit pkgconfig gnomebase gettext gobject-introspection vala features_check
 
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
-SRC_URI[archive.sha256sum] = "512763ac4e0559d0158b6682ca5dd1a3bd633f082f5e4349d7158e6b5f80f1ce"
+SRC_URI[archive.sha256sum] = "1be64c4e4760c52b3ec33067290d1efa40ad4cecab6c673813804e3c559d9683"
-- 
2.43.0


