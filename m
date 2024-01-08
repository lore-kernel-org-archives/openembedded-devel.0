Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352A8C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:19:45 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.6252.1704719983393658304
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="133841392"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="133841392"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:19:40 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E3D53D6187
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:19:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F30716632
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:19:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C8E56202CFE9F
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:19:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 571801A0072;
	Mon,  8 Jan 2024 21:19:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] ghex: upgrade 45.0 -> 45.1
Date: Mon,  8 Jan 2024 21:19:31 +0800
Message-Id: <1704719971-29844-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--5.309100-10.000000
X-TMASE-MatchedRID: ZsQmnj20Xtajz0nOeth/yTo39wOA02LhQRlUSJjs8Z8H4DTIEE89jKri
	LyBzWEx9OuzeNmOGKnOYPFKdyy8HNtGETJv1/WyOuce7gFxhKa2XBPRemiwRNb5/tqn0MloN7v0
	MlFSLfmmiJGJGoluOFgFd21k9Z8naL/tBTZzO5Q0ZgmFGHqyx6x+KaaVwAG43tXl9IxEPXOq/iI
	ZoI+jcVhZn42C5xjIaH6FmqkQO4so2sw58eWE/mgXtykVcrvpNxdJI2FZaHKEkpxv/P70C7aLoS
	LE/BAxZE4ULOzI4e898YEvEcZIFwuborC6rlhrMr06FtoyeujbxuhkRWK22GJcx2APW55mAH/wC
	OdeVsvmplj9R8pyiRTSIuxBvPrpzCbm0451GVI3dCok3ibXlQX0tCKdnhB589yM15V5aWpj6C0e
	Ps7A07fyjtizU0rhjcVkqs3Yc+xlwbcNzfpwJMfGB1kqAW0yxsfYSfGTzmFY=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108132

From: Wang Mingyu <wangmy@fujitsu.com>

0001-gtkhex-Local-variables-in-switch-statement-should-be.patch
removed since it included in 45.1

Changelog
========
- gtkhex: Local variables in switch statement should be in own scope (ie, fix
  clang build issues)
- appwin: Mark error message string properly translatable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...iables-in-switch-statement-should-be.patch | 50 -------------------
 .../ghex/{ghex_45.0.bb => ghex_45.1.bb}       |  3 +-
 2 files changed, 1 insertion(+), 52 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/ghex/ghex/0001-gtkhex-Local-variables-in-switch-statement-should-be.patch
 rename meta-gnome/recipes-gnome/ghex/{ghex_45.0.bb => ghex_45.1.bb} (71%)

diff --git a/meta-gnome/recipes-gnome/ghex/ghex/0001-gtkhex-Local-variables-in-switch-statement-should-be.patch b/meta-gnome/recipes-gnome/ghex/ghex/0001-gtkhex-Local-variables-in-switch-statement-should-be.patch
deleted file mode 100644
index 61cd3b180..000000000
--- a/meta-gnome/recipes-gnome/ghex/ghex/0001-gtkhex-Local-variables-in-switch-statement-should-be.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From b00b8332ab19e41c75ce143f45ab4585502c020b Mon Sep 17 00:00:00 2001
-From: Logan Rathbone <poprocks@gmail.com>
-Date: Tue, 24 Oct 2023 14:06:04 -0400
-Subject: [PATCH] gtkhex: Local variables in switch statement should be in own
- scope
-
-Fixes: #74
-
-Thanks to: David C. Manuelda
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/ghex/-/commit/b00b8332ab19e41c75ce143f45ab4585502c020b]
----
- src/gtkhex.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/gtkhex.c b/src/gtkhex.c
-index b401cd9..18e0433 100644
---- a/src/gtkhex.c
-+++ b/src/gtkhex.c
-@@ -1941,6 +1941,7 @@ key_press_cb (GtkEventControllerKey *controller,
- 			break;
- 
- 		case GDK_KEY_Home:
-+		{
- 			gint64 line_beg = self->cursor_pos;
- 
- 			while (line_beg % self->cpl != 0)
-@@ -1948,9 +1949,11 @@ key_press_cb (GtkEventControllerKey *controller,
- 
- 			hex_widget_set_cursor (self, line_beg);
- 			ret = GDK_EVENT_STOP;
-+		}
- 			break;
- 
- 		case GDK_KEY_End:
-+		{
- 			gint64 line_end = self->cursor_pos;
- 
- 			while (line_end % self->cpl != self->cpl - 1)
-@@ -1958,6 +1961,7 @@ key_press_cb (GtkEventControllerKey *controller,
- 
- 			hex_widget_set_cursor (self, MIN (line_end, payload_size));
- 			ret = GDK_EVENT_STOP;
-+		}
- 			break;
- 
- 		default:
--- 
-2.42.0
-
diff --git a/meta-gnome/recipes-gnome/ghex/ghex_45.0.bb b/meta-gnome/recipes-gnome/ghex/ghex_45.1.bb
similarity index 71%
rename from meta-gnome/recipes-gnome/ghex/ghex_45.0.bb
rename to meta-gnome/recipes-gnome/ghex/ghex_45.1.bb
index 42c53471b..2b6adaf91 100644
--- a/meta-gnome/recipes-gnome/ghex/ghex_45.0.bb
+++ b/meta-gnome/recipes-gnome/ghex/ghex_45.1.bb
@@ -15,7 +15,6 @@ GIR_MESON_DISABLE_FLAG = 'disabled'
 
 inherit gnomebase gsettings gtk-icon-cache gnome-help gettext gobject-introspection vala gi-docgen
 
-SRC_URI += "file://0001-gtkhex-Local-variables-in-switch-statement-should-be.patch"
-SRC_URI[archive.sha256sum] = "05cecc4561ca40b257c5db31da9f68d696133efc0ae427ed82fb985a986e840e"
+SRC_URI[archive.sha256sum] = "fb2b0823cd16249edbeaee8302f9bd5005e0150368b35f1e47c26680cacac2fa"
 
 FILES:${PN} += "${libdir} ${datadir}/metainfo"
-- 
2.34.1


