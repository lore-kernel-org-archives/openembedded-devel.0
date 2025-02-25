Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277D1C021BF
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2201.1740525897971903896
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n1lRVT2e;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525898; x=1772061898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jg8NANhZCc9VF3/TG2djjVuP8RGSHplUBoeHM16ewlc=;
  b=n1lRVT2eTRwq1c5avAL0zK2Ol150NN2SEDBJDHS6GlnPb0jkSr0xtUJG
   wGlZGrdlOX4Pcq+vBjaPVxjxZFVZLkiyjXQtTqj+VUDO+cCUOhj/ZWKAU
   3fYAD1XsEZEbms3an/m5e/AHg+VefUb8o03QI/kqIOJDKwejdE0erxw8P
   uWWhoDvqQzTMedvKi15mCCgHra+EOkB0yP2I/oYL7RqogtOB1XzjOoNT7
   2tmyiFQQIeqjIunFmbfcU2Pe7XkseJMQaJ7kMs0WccKhEiQV+AYVQ6t9m
   +YwMiantUStbsKLZ8R4Th1ELZ5Towv4D8xy0bBrByG0t9zc9FyCS7cAm8
   Q==;
X-CSE-ConnectionGUID: HaDIo6PrQOW4DgMBt92Oag==
X-CSE-MsgGUID: WJxQ2nK4RyWb4WdE/DE23A==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="193783213"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="193783213"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:55 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 717DD96741
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 39CCCC8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:53 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F37F11A0073;
	Wed, 26 Feb 2025 07:24:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 08/51] gtk-vnc: upgrade 1.4.0 -> 1.5.0
Date: Wed, 26 Feb 2025 07:23:58 +0800
Message-Id: <1740525881-21103-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115606

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add API to allow forcing a visible cursor when remote
  cursor is empty/fully transparent
- Fix regression handling unknown auth types which should
  be ignored
- Fix double free in SASL auth error path
- Fix alpha cursor encoding by reversing pre-multiplication
  of alpha channel
- Preserve colour map across desktop resizes
- Remove undefined symbols from linker version script
- Remove obsolete wiki links
- Expand refusal to use ucontext to all macOS platforms
- Improve debug messages for pixel encoding
- Fix compiler complaint about overflow in challenge
  buffer in test suite.
- Add testing of cursor encodings (temporarily disabled
  on big endian systems due to undiagnosed failures)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gtk-vnc/{gtk-vnc_1.4.0.bb => gtk-vnc_1.5.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/gtk-vnc/{gtk-vnc_1.4.0.bb => gtk-vnc_1.5.0.bb} (88%)

diff --git a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.4.0.bb b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.5.0.bb
similarity index 88%
rename from meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.4.0.bb
rename to meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.5.0.bb
index 016874c6a9..e9cb53c97c 100644
--- a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.4.0.bb
+++ b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.5.0.bb
@@ -27,4 +27,4 @@ inherit pkgconfig gnomebase gettext gobject-introspection vala features_check
 
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
-SRC_URI[archive.sha256sum] = "1be64c4e4760c52b3ec33067290d1efa40ad4cecab6c673813804e3c559d9683"
+SRC_URI[archive.sha256sum] = "c0beb4747528ad931da43acc567c6a0190f7fc624465571ed9ccece02c34dd23"
-- 
2.43.0


