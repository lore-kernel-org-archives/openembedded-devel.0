Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB1BCFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:51:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4283.1764669100669032610
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=byODjB0k;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669100; x=1796205100;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8jS5f0RJg7AeFahKBghbRq4putCxQisHjcqHtdCLXX4=;
  b=byODjB0kDwF9OEpxuzJeImz+700zRB8Bdb3m8h/YHsj/3lIni74v7pui
   ezwBUA0L63Aipoc5p250eZBx88/gPVj3yX7M6Tg46mbuwBxhzIAuUZWAj
   jQ5pP/KKQ2BmvKHpt3KyJkVSknZ2nTKF8nnZTNq70ogMB9O+iZOIuO7N7
   Ecqs2By+wyN2N4QfFM2CNGC4lr+D2TJ+mVn2NLhJNA0TK2zQyRrt+TdS+
   Nqx7ThZ+RZdl9dLHQvH04Bz9LxL9JCdboFYR1QWMicNCtWxXcxsUM3lci
   dhvUmQYdgGPRKslQuDG4VS3v8u88+zpV3KcFqFwwWuRNQYrVOJnPkJtze
   g==;
X-CSE-ConnectionGUID: EJps/bqFSDKGgjIDX47B7g==
X-CSE-MsgGUID: mgfi0XtoQJKuWLYO2XssZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="220569767"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="220569767"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:51:38 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id ECC281C00086
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:38 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 990141C002F1
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 3B3A0101A430;
	Tue,  2 Dec 2025 09:51:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/25] asyncmqtt: upgrade 10.2.5 -> 10.2.6
Date: Tue,  2 Dec 2025 17:51:08 +0800
Message-ID: <20251202095132.652-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122234

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
* Removed unintentional copy requiment from some of async functions parameter.
* Fixed Heap-use-after-free during broker shutdown.
* Rifined documents.
* Added TLS Websocket verify none port to broker for browser.
* Added Cerfiticate file's digitalSignature to keyUsage.
* Fixed wss connection from Web Browser handshake failed problem.
* Changed trial broker on `async-mqtt.redboltz.net` ws and wss port.
  * ws was 10080 but Chrome block it by default. Updated to 80.
  * wss was 10443 but Chrome doesn't block it by default. But for consistency, updated to 443.
  * system_test still uses 10080 and 10443 to avoid conflict.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../asyncmqtt/{asyncmqtt_10.2.5.bb => asyncmqtt_10.2.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_10.2.5.bb => asyncmqtt_10.2.6.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.5.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.5.bb
rename to meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
index 82c657fc17..6a73543821 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.5.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https;tag=${PV}"
-SRCREV = "deeb7e36df859af0e90d2462012c48465ba49f0f"
+SRCREV = "cb3d37dc3432b9c03fe631eeba2d548de7457bf9"
 
 DEPENDS = "openssl boost"
 
-- 
2.43.0


