Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC681C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:12 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4919.1783503965461091512
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YBq3NWWC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503965; x=1815039965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tCNTA3yPPQmAfakeGcJI69koMmCpVNyG01+Od9OhySI=;
  b=YBq3NWWCAYPXQHY3k+EIADhM5mrQHF+J6KGsg4jn/1T+lAYJMZwi5sd1
   pBBGgdSQec+e2ODcXSDqEwfSXzqrwYKKp6Z33H02c1eQ5wZUH4vIoI5/o
   ivYBgPvjMtNMnLEBG8/E3qgf2V/TiIdFBn/AlmkvSdXI71Y4qPZmNixR6
   +ii8LUZV0f3n2NQnoifiP3v7kiaUQhTcqUfj7rjyTAo1udSL+CXltIhIk
   oFYdlUNCKef2mXheBXpl7Y3/xwegT2JxM0f/kfmWTZoIc7cZw2jfFYypQ
   XQRGxevVAsMd1ACdYmvHgQg4kwsWN3oyOXgPgugW0TcVtV2QCzhrsvQhE
   w==;
X-CSE-ConnectionGUID: XqplGNZySOCjyyD9dUpV6Q==
X-CSE-MsgGUID: +d5m4vPSSe+cw10MrUSttA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="232866779"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="232866779"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:46:03 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A82981C01686
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:03 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5ED31827751
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8F0631800C26;
	Wed,  8 Jul 2026 09:46:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 31/37] rabbitmq-c: upgrade 0.16.0 -> 0.17.0
Date: Wed,  8 Jul 2026 17:44:41 +0800
Message-ID: <20260708094508.2060-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128102

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix size_t overflow in 'amqp_decode_bytes' bounds check leading to
  out-of-bounds read (GHSA-jgjf-7fwf-f3c7, #888)
- Fix heap buffer overflow in 'amqp_frame_to_bytes' for oversized body frames
  (GHSA-hfjv-vcp3-39wh, #892)
- 'librabbitmq-tools' fall back to the 'AMQP_URL' environment variable when no
  connection options are given on the command line (#887)
- Fix undefined behavior in 'amqp_decode_properties' when decoding
  content-header property flags (#883, #885)
- Fix 'ioctlsocket' type mismatch on Windows (#890)
- Document buffer lifetime requirement of 'amqp_decode_table''s encoded buffer
  to prevent use-after-free misuse (#895)
- 'librabbitmq-tools' now enable default SSL certificate verification paths
  unless '--no-default-cert-paths' is passed (fixes #868, #893)
- Building the tools now requires POPT v1.14 or newer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rabbitmq-c/{rabbitmq-c_0.16.0.bb => rabbitmq-c_0.17.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.16.0.bb => rabbitmq-c_0.17.0.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.16.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.17.0.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.16.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.17.0.bb
index c4428008db..05179c0230 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.16.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.17.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https;tag=v${PV} \
 "
-SRCREV = "800d57c9ca7352181167ec3c6aba66b8518c321c"
+SRCREV = "59df173fff72857896a8257bbfb72d9d29175f1e"
 
 
 DEPENDS = "popt openssl"
-- 
2.43.0


