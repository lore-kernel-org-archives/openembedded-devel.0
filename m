Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0C9EFD21A
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:37:41 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42033.1772012256497426779
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SkqMAPpO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012257; x=1803548257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mu060dBLiBil01v+vJXvjnWhDH//CIy02Xdul+Ev0bw=;
  b=SkqMAPpOFLnQFXCin/eb9U6RX3PgeJS+UHNLUWpkBmWfykNeJ6YRty2R
   aHl/LgUX/YjS1pQGWBOefvrdXmkZJGlnW5GMo8H53soAzNDIAI8U8ong/
   8PbaM9YDZTPm3+NCduyeZw2VNB4SO+IETYhd5c3JOOAid6KG5SAGjrgoB
   k3Q2cMJHvX+QXgztL2V0BLLuLzCMx3F3qFbeXY6qWdbhVabFLpa5D4q8f
   2XF8JXilqK01BMQAL0D5V07dAYNBQ8iyp+W1URmlZuSUhTW096gnqGmJC
   s0uqLbn9zJl7VME/VYmCTcxnIcdYvQVih3Y4DnF/XnW+3tbO1w8chSUO0
   Q==;
X-CSE-ConnectionGUID: gNW9nV5zTE+12he+qDQrSA==
X-CSE-MsgGUID: k7ymHt0ET36L1Seycz1nBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="231670363"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="231670363"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id E359740757B
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:36 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 923461C00121
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C4458101BB70;
	Wed, 25 Feb 2026 09:37:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/33] asyncmqtt: upgrade 10.2.6 -> 10.3.0
Date: Wed, 25 Feb 2026 17:36:56 +0800
Message-ID: <20260225093727.1284-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124614

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Added Share Name character check.
- Implemented cmake package version checking.
- Fixed broker tool not delivering all retained messages when wildcard
  subscription matches multiple topics.
- Added get_qos2_publish_handled_pids(), restore_qos2_publish_handled_pids(),
  restore_packets(), and get_stored_packets() to client for convenient.
- get_endpoint() can be omitted now.
- Refined reconnect examples.
- Added websocket async_close timeout.
- Added documentation regarding stream reuse restrictions for TLS-related
  streams.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../asyncmqtt/{asyncmqtt_10.2.6.bb => asyncmqtt_10.3.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_10.2.6.bb => asyncmqtt_10.3.0.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.0.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
rename to meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.0.bb
index 47de7a7344..0e1e155356 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
 CVE_PRODUCT = "async_mqtt"
 
 SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https;tag=${PV}"
-SRCREV = "cb3d37dc3432b9c03fe631eeba2d548de7457bf9"
+SRCREV = "7129d72c1b9adf159bc506206df3fb422bb9fb84"
 
 DEPENDS = "openssl boost"
 
-- 
2.43.0


