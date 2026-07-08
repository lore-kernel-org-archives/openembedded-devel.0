Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C70C43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:30 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4899.1783503921656860898
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HVYdvq9g;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503921; x=1815039921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a8zz0Mil+TfeHKbEmZXQnX1lSkWHSHv0pJ6xDSoQg1E=;
  b=HVYdvq9guCqhnglDhxVUnX5EIM1yU3ZUQNiF1t/pyOxsuw7CwIiivE1I
   CEbjXJHyEGdIuXtmQvFVhuOcRFOvhSuM9VXtJ+NUa4iJOYlGvBvc7X/Xr
   onv1hiXvV2HsjLEWWD2C902MqjCAsG3YdIbHWG5YG/sz5a9Hdc31v2Wpo
   tk/sBvsFk7pjT3Q07l601VruK2lqf16EOZ2bzGMkfhKil+NFTy8L4bBFF
   BB6pIqpEEVnXBgYwCny/zYYo3ET8E1t0piubNqFZoqoZULFqE1Rdmvd8m
   rruSA5KDPdRpoovM70fNUN1I6cVG3giQiT3xmt4e9G8MNMJZe2EY94FYg
   A==;
X-CSE-ConnectionGUID: tudTOBqHSCGN8wjNNhtDCQ==
X-CSE-MsgGUID: PeeaVO5HRfqfvPOlBuBfIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="250142706"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="250142706"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:20 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A884742A313
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:19 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 536B51C2DF7D
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 67CB51801114;
	Wed,  8 Jul 2026 09:45:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/37] geoclue: upgrade 2.8.1 -> 2.8.2
Date: Wed,  8 Jul 2026 17:44:13 +0800
Message-ID: <20260708094508.2060-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128074

From: Wang Mingyu <wangmy@fujitsu.com>

Fixes:
- Accept NMEA GGA sentences with 11 or more parts (needed 14 or more previously)
- Use async D-bus 'Set' methods to set client properties in libgeoclue to improve robustness
- Do not change Client Location property on updates which are below threshold to avoid leaking location to D-bus
- Ignore wired WPA interfaces when finding an interface for WiFi scanning

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../geoclue/{geoclue_2.8.1.bb => geoclue_2.8.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/geoclue/{geoclue_2.8.1.bb => geoclue_2.8.2.bb} (97%)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.8.1.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.8.2.bb
similarity index 97%
rename from meta-oe/recipes-navigation/geoclue/geoclue_2.8.1.bb
rename to meta-oe/recipes-navigation/geoclue/geoclue_2.8.2.bb
index 4769ed033a..fa05a06609 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.8.1.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.8.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 dbus json-glib libsoup-3.0 intltool-native"
 
 inherit meson pkgconfig gtk-doc gobject-introspection vala
 
-SRCREV = "81ddcb11208a59328a04bf022542504ac80602f5"
+SRCREV = "97df14726a95a06e0e3f1b3c9c4388ed1aff7e8c"
 SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;branch=master;tag=${PV} \
     file://0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch \
 "
-- 
2.43.0


