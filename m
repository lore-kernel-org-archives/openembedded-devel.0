Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140CCED7BA5
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:39:29 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15965.1776163163067952168
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jDrDlCU7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163161; x=1807699161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AmXrpBBXHvUjVbHFnkvlnOwJXOSZTUEYGncuam782r8=;
  b=jDrDlCU7APbpi9uYEFDie6nfGykhR1a/v+n3G5+HUVOP+wcjHUu5Db0l
   RJFXzuGSkk4szosfMiW9Ijy4SOnGUUZpmySzwiMqNNSUWdNGjaNv4pWM5
   wAzWpmVX/F4wRg/3d3sxHt5L3ZBmFHcFPj9M83Hg64YvdwDaB3E/GTodO
   dCV73cqkL6ZeQSZ6lIKo9QfpomLHkcgVUEtfzVa2ICmC1yNg/ikV83a5G
   aQHth0m1Czi22u8u12psNbhxwVxDMzp7VPuQDoILRTQg47XRsU2tAOZHe
   ujBYKbDFNFMmo/YowZBQ3MY++mmXh7wHKx1x40mo01n4pKH1iYzgQNz4S
   Q==;
X-CSE-ConnectionGUID: kULselVxSjOM66X2NHTyCA==
X-CSE-MsgGUID: rrBmZToaSuyXKIp3T3lOpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236908201"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236908201"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:39:20 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5D4FBC0009E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:21 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 17D2E8D65DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9847614000E2;
	Tue, 14 Apr 2026 10:39:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/32] geoclue: upgrade 2.8.0 -> 2.8.1
Date: Tue, 14 Apr 2026 18:38:17 +0800
Message-ID: <20260414103845.1728-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126308

From: Wang Mingyu <wangmy@fujitsu.com>

Fixes:
- Accept NMEA GGA sentences with 11 or more parts (needed 14 or more
  previously)
- Use async D-bus 'Set' methods to set client properties in libgeoclue to
  improve robustness
- Do not change Client Location property on updates which are below threshold
  to avoid leaking location to D-bus
- Ignore wired WPA interfaces when finding an interface for WiFi scanning

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../geoclue/{geoclue_2.8.0.bb => geoclue_2.8.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-navigation/geoclue/{geoclue_2.8.0.bb => geoclue_2.8.1.bb} (95%)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.8.0.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.8.1.bb
similarity index 95%
rename from meta-oe/recipes-navigation/geoclue/geoclue_2.8.0.bb
rename to meta-oe/recipes-navigation/geoclue/geoclue_2.8.1.bb
index 54c938c908..4769ed033a 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.8.0.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.8.1.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 dbus json-glib libsoup-3.0 intltool-native"
 
 inherit meson pkgconfig gtk-doc gobject-introspection vala
 
-SRCREV = "f59a42a9fbbcfcb341708e5efd6edfe72a9da768"
-SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;branch=master \
+SRCREV = "81ddcb11208a59328a04bf022542504ac80602f5"
+SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;branch=master;tag=${PV} \
     file://0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch \
 "
 
-- 
2.43.0


