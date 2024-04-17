Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7948C04FF8
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:59 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2728.1713318107261032609
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S1ym0sgO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318112; x=1744854112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CYlB8Kkea/aAPuYphVBCH42HAzMxClnRwK/yDKlzUYA=;
  b=S1ym0sgO8bJvEcEHQpEo98jz26uOecM7CImBNbir6uUruLGyT0e8ZGeh
   LzNgLy8s9knuEi4C/KQZI9sVehgYT60Gflob26dgxOj8U38X4KZKAhzZO
   QBnMIFYJvuKvJX0LgFFJ7GoxabvjIB+EQWH90Kwov4MrccInhWnundfzi
   relIyVb96CxuzY5eyD1FnJAHE/HMOEUtBE8/FcoT3DAFzyWN/VqYKwmmG
   l+Y2exY0b11avQQ3Haqk9zzctknjU+Zx5/gZrEMo6/AB2NwXKbK/zsRuO
   JenvrQyPC6NUjgVvyof0ZN/4QKQcMKYQVNolgNu1uKnCB/x7ljDu4E0s6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="157724969"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="157724969"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:51 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D764107D2D
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 54A25FD90A
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B25912007473D
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5F13D1A0002;
	Wed, 17 Apr 2024 09:41:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 48/49] webkitgtk3: upgrade 2.44.0 -> 2.44.1
Date: Wed, 17 Apr 2024 09:41:00 +0800
Message-Id: <1713318061-17128-48-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--11.219600-10.000000
X-TMASE-MatchedRID: ZsQmnj20Xtajz0nOeth/yTo39wOA02LhQRlUSJjs8Z/9wRnyxuPjhHw6
	H06bMgivhERFxtSZDQ9gppcApyC7PsEQdgi1dcDAM10nOFd6RPa2SlZsf8SKLt9RlPzeVuQQli+
	BaqMwTNo1gIHPPGxSe9nl43V4kx2lWkIi5GvRHEo/QdUh6LEl0ME5XPQnBzGXR/IzlV+CMbbT0P
	pHDbMis/GreLFhOYYLiDr8NZlCTwNdInhzedP5B9DcymdiVMdWSLyuC617NWnj7F/ald2q5PC1l
	a2SSTU0tq8tSSiZF/1dHUsY0PVOlK6Y+EQjpQa46nHbeBu5Lnn8KWLAt/9AoVGJGXffuLdva7bP
	g6zgbaVbJcQH3furV07NMOR+KVhPkfRhdidsajMURSScn+QSXsSO8hqxE9lWM6seg7X1WbaOhzO
	a6g8KrdI0oLyybUotlivSLw7mG5md+hz4YVtmMgquLvWOyCUwN8/dodYkzaI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110034

From: Wang Mingyu <wangmy@fujitsu.com>

2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
removed since it's included in 2.44.1

Changelog:
==========
- Fix handling of lifetime of web view child dialogs in GTK4.
- Do not schedule layer flushes when drawing area size is empty.
- Fix videos with alpha when using the DMA-BUF sink.
- Fix the build with USE_GBM=OFF.
- Fix the build in 32bit platforms
- Fix several crashes and rendering issues.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...af379dc70b4b1a63b01d67179eb431f03ac4.patch | 36 -------------------
 ...kitgtk3_2.44.0.bb => webkitgtk3_2.44.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.44.0.bb => webkitgtk3_2.44.1.bb} (98%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
deleted file mode 100644
index 0f6b9a633..000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2922af379dc70b4b1a63b01d67179eb431f03ac4 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Mon, 18 Mar 2024 11:14:54 -0700
-Subject: [PATCH] REGRESSION(274077@main): failure to build on i586 (and likely
- other 32bit arches): static assertion failed: Timer should stay small
- https://bugs.webkit.org/show_bug.cgi?id=271108
-
-Unreviewed build fix. This changes SameSizeOfTimer to ensure it matches
-the size of Timer on 32-bit platforms.
-
-* Source/WebCore/platform/Timer.cpp:
-
-Canonical link: https://commits.webkit.org/276282@main
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2922af379dc70b4b1a63b01d67179eb431f03ac4]
----
- Source/WebCore/platform/Timer.cpp | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Source/WebCore/platform/Timer.cpp b/Source/WebCore/platform/Timer.cpp
-index 4f7c0f5c39ca9..0f3734cca2474 100644
---- a/Source/WebCore/platform/Timer.cpp
-+++ b/Source/WebCore/platform/Timer.cpp
-@@ -263,7 +263,11 @@ struct SameSizeAsTimer {
- 
-     WeakPtr<TimerAlignment> timerAlignment;
-     double times[2];
--    void* pointers[3];
-+    void* pointers[2];
-+#if CPU(ADDRESS32)
-+    uint8_t bitfields;
-+#endif
-+    void* pointer;
- };
- 
- static_assert(sizeof(Timer) == sizeof(SameSizeAsTimer), "Timer should stay small");
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb
similarity index 98%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb
index 34afaed9d..fc96d5dc3 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb
@@ -15,9 +15,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
-           file://2922af379dc70b4b1a63b01d67179eb431f03ac4.patch \
            "
-SRC_URI[sha256sum] = "c66530e41ba59b1edba4ee89ef20b2188e273bed0497e95084729e3cfbe30c87"
+SRC_URI[sha256sum] = "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


