Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F27C88CB4
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:43 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.3847.1686620442071140221
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="121527720"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="121527720"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:40 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E79EC6811
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A3AE8D3F21
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3393A20074724;
	Tue, 13 Jun 2023 10:40:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gjs: upgrade 1.76.0 -> 1.76.1
Date: Tue, 13 Jun 2023 09:39:51 +0800
Message-Id: <1686620422-29962-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--0.514000-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrG24YVeuZGmNOuRi6fMc6u1FY
	wb6XIMLmXNMMjpO6mhWykidumpmDjWtBsvqOY75sHWRJEfGP5nlJ86oXuPDXceRkD0FFm1pJeAT
	bS37YnZiwcLLU2//UpYDcKe8nL3eUWkIi5GvRHEo/QdUh6LEl0ME5XPQnBzGXq8KsbROd9VQs8m
	1alsmNjVg82fo850ElCLsa6HeVb+e1/l9dBewCrgk3qL3jdFBN1QQ6Jx/fflbozDhGeQC9EkaF+
	/5G+w6gkpCFGclEFCd5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFOb8OZ36wMyICN4O
	h+7dXKy9hIM1uMztukCztGZQEtEcoeb2JUDokni+Jg3ImSZyThIpX7ZI/M3Wu2mGffOegCWA1Pc
	c+u7WAux9n1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103221

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Various fixes ported from the development branch.

- Closed bugs and merge requests:
  * gnome-shell crashes on exit in js::gc::Cell::storeBuffer
  * Memory leak with GError
  * GVariant return values leaked
  * GBytes's are leaked when passed as-is to a function
  * Transformated GValues are leaking temporary instances
  * GHash value infos are leaked
  * "flat" arrays of GObject's are leaked
  * Gjs console leaks invalid option errors
  * gjs can't print null

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.76.0.bb => gjs_1.76.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.76.0.bb => gjs_1.76.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.76.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.76.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.76.0.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.76.1.bb
index e6d377cb3..93711bc3b 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.76.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.76.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "mozjs-102 cairo"
 
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even pkgconfig
 
-SRC_URI[archive.sha256sum] = "a63f156964b136053eab51ea013114e7d7c193b7518d28c040b6b02c3c933a6d"
+SRC_URI[archive.sha256sum] = "7b867c18a9b30333ebbcff9ad3f20299f0372ffad439d49b87d40a1d1798b78d"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
-- 
2.34.1


