Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F2FC54788
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:28:37 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.13956.1708612107493363625
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:28:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U08N6ahI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708612107; x=1740148107;
  h=from:to:cc:subject:date:message-id;
  bh=EhKsmewKYEbNqaMAX6GJBO8RzVXWgu1QIVuKLxWDWaY=;
  b=U08N6ahI/go7MKwqGqsGHflDSK3ZagHViZ7MSoeF8lmxEIGr3Z60OkDS
   jsFE2TwCbtAGJGPFW7WNrKhgL9idNIqucgIvVOcyGpedxzPgyPN3x6LbS
   WTKo84OyX5bEpJtAPGgBpzJNmllf8zuhxhpdc25CrN4WHsw+hNay6UDjr
   UQQoY/70FbRo5gViQJlggLJ8fLO4PvQKxUbidA8WsrJcfoslh1ZEPBtCB
   82pbbpe1bR3DSD6N/lAgEn0e4HXAxO9aqNipe2gcxOpXo7phk2DYQGDqv
   a7uttkUQmoVwMzwCLif4/8vPOPPzJWCwQ9j0WQuHLg2RupPiOV/hijy/1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="149633544"
X-IronPort-AV: E=Sophos;i="6.06,179,1705330800"; 
   d="scan'208";a="149633544"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 23:28:24 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E508D63CE
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 23:28:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B5E9D3F72
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 23:28:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 228EE70BFD
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 23:28:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A1BDB1A009A;
	Thu, 22 Feb 2024 22:28:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH V2] webkitgtk3: upgrade 2.42.4 -> 2.42.5
Date: Thu, 22 Feb 2024 22:28:15 +0800
Message-Id: <1708612095-7256-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28206.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28206.007
X-TMASE-Result: 10--6.119800-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yaoXHZz/dXlxTfK5j0EZbysyKRnX9xPs4J6j
	qg90kb/2sRovwaIGbRcMtZdk//12bgzlifXGuD0lHWRJEfGP5nmfmd9HsjZ0UyWxD2S0xfx/4bK
	KzrJaqbMAjPE9XBt9MfL3NxFKQpq1iCsqewnUZGDNgrlT5Ajc7jeXamXCCu1YMHDHnR8cUQIhS0
	ofkAkz2Vhh+cFQJYahNDYPBpSwW5qN6MoIzHiu3krOO5m0+0gEGbJMFqqIm9zk++hGM2nSe6bgJ
	3ym+c0eFnrnG5LOkLYep5R/z/M+R/9ehdaP6yTur7+qhZS/khnExmr5hqNL1nXHQq6zBeSUSexP
	oTd4iBbxgwYhHpmqNe8EXzJfARL1rWL/xQJnm46eAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8h+ICq
	uNi0WJO4aCp0tNFpWUrarCLxdSt/42qtlhio7BpHsPZQWiRFTftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 14:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108988

From: Wang Mingyu <wangmy@fujitsu.com>

Add 01-Fix-build-error.patch to fix build error.

Changelog:
=========
- Fix webkit_web_context_allow_tls_certificate_for_host to handle IPv6 URIs produced by SoupURI.
- Ignore stops with offset zero before last one when rendering gradients with cairo.
- Write bwrapinfo.json to disk for xdg-desktop-portal.
- Fix gamepads detection by correctly handling focused window in GTK4.
- Fix several crashes and rendering issues.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webkitgtk3/0001-Fix-build-error.patch     | 33 +++++++++++++++++++
 ...kitgtk3_2.42.4.bb => webkitgtk3_2.42.5.bb} |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-error.patch
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.4.bb => webkitgtk3_2.42.5.bb} (98%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-error.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-error.patch
new file mode 100644
index 000000000..6cbd10c05
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-error.patch
@@ -0,0 +1,33 @@
+From ff00bb783bf1d921e38dcefaa2b709a41d6a3ff8 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Thu, 22 Feb 2024 03:14:57 +0000
+Subject: [PATCH] Fix build error.
+
+Error message:
+LowLevelInterpreter.cpp:339:21: error: 't6' was not declared in this scope
+LowLevelInterpreter.cpp:340:21: error: 't7' was not declared in this scope
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/3d5373575695b293b8559155431d0079a6153aff]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ Source/JavaScriptCore/llint/LowLevelInterpreter.cpp | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
+index 5064ead6..9a2e2653 100644
+--- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
++++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
+@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
+     UNUSED_VARIABLE(t2);
+     UNUSED_VARIABLE(t3);
+     UNUSED_VARIABLE(t5);
+-    UNUSED_VARIABLE(t6);
+-    UNUSED_VARIABLE(t7);
+ 
+     struct StackPointerScope {
+         StackPointerScope(CLoopStack& stack)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
similarity index 98%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
index 3c6b7db81..9999bc162 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
@@ -14,8 +14,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://no-musttail-arm.patch \
+           file://0001-Fix-build-error.patch \
            "
-SRC_URI[sha256sum] = "52288b30bda22373442cecb86f9c9a569ad8d4769a1f97b352290ed92a67ed86"
+SRC_URI[sha256sum] = "b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39f74e8953fe61e749"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


