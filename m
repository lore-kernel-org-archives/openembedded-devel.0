Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3095610A3D7F
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:25 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45673.1774526298348238116
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sMujsogh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526300; x=1806062300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u4lE8Mbo44+hufKvSQV5xgKgN8mSEvalBpBslztN6xg=;
  b=sMujsoghF7Tew71zKqahnHQ3BWFSbnd2bD0KWOMYBNMmCHKEp4DxPDkg
   VYLw9iKcgyEq7kLaOFrC2J0DfKO8xVXjkXBRvQYbwuL8R0vRQE8GTBljm
   1p31p0bFL3lKtKRWFWDJfXuUSBfcnGHXcBqp1SGdbhI1tX45c0D4waQKW
   ea/7uaCvweTjC0sce/LCBqdh1lNVCAeeoG3pQLgzCml9E3hEmAkrpeaqn
   8BTstgR6xdsks5jGL2+GYaG30BiztEwyTGoZu23GyI+5tgNvIQHrI5jAl
   u424COn03cGn4solJk0CtAruA7o/BMZXbvVPxq3XzEgG5glRIze2qK89l
   g==;
X-CSE-ConnectionGUID: mV5ReuQBRnWp50c2bmz/AQ==
X-CSE-MsgGUID: 2CecQegSSTG00iN3DiNmzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234652681"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234652681"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:20 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 891031002B82
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:19 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 463D6181AA4C
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 24D191807148;
	Thu, 26 Mar 2026 11:58:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 62/63] tinysparql: upgrade 3.10.1 -> 3.11.0
Date: Thu, 26 Mar 2026 19:56:32 +0800
Message-ID: <20260326115634.1199-62-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125717

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tinysparql_3.10.1.bb => tinysparql_3.11.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tinysparql_3.10.1.bb => tinysparql_3.11.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql_3.10.1.bb b/meta-gnome/recipes-gnome/tracker/tinysparql_3.11.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/tracker/tinysparql_3.10.1.bb
rename to meta-gnome/recipes-gnome/tracker/tinysparql_3.11.0.bb
index aba8f12976..522cfb3d23 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql_3.10.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql_3.11.0.bb
@@ -20,7 +20,7 @@ inherit gettext gnomebase gobject-introspection vala gi-docgen bash-completion
 
 SRC_URI += "file://0001-fix-reproducibility.patch"
 SRC_URI += "file://0001-src-libtracker-sparql-meson.build-dont-create-compat.patch"
-SRC_URI[archive.sha256sum] = "5a7f3e789db6671a550ed6280ed4f60a60bea77368da92be68dc7d8d7e230265"
+SRC_URI[archive.sha256sum] = "011e758a53f31112a8c45700fd6039ae55617f0dac70119d9eddafc03cf68fe5"
 
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
-- 
2.43.0


