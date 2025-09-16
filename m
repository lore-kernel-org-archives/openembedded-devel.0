Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F182CAC59A
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.15419.1758015722736300041
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DuoyQk+h;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015722; x=1789551722;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MxR2CGNiaIKS1aOrk+68yR8yhcKp3QbDytROpkx5Lc4=;
  b=DuoyQk+hChJans/Am+y9f8wDHYyRb7HHs6xyZpPOCmFX9EZM+GU1WujC
   DE0bNxO0milyj4YQdGibwpbmT8jdK9tW1UsWrPMQVlg3UPnz0GPijabfa
   plyvujtBTbt3GB9dpKH2JdnpBZOdMn6h1KC7aBtEkfwcNyKQNCklrDRv0
   mDb+JplQ+yqUOB0Pf/o05N6hqa9Z+AbRXEiQZ2cMXwC6+Rubz0xkEh/DK
   0Z00Ftujq0/PY2onnQabblkNiuqOZku41IMVgUNssRGbewQFuHoVJTxvK
   enrbNWiLfFtWJLEzDL5whQDFY6OnM4WiVCajXHtfV4gwvI/+HfjaoXz5H
   g==;
X-CSE-ConnectionGUID: a7430uY7SOGUikJxhCk6Nw==
X-CSE-MsgGUID: bQ+B4qNTRuujXwyYisvh5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="201479420"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="201479420"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:01 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id D4D69C000B9
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:00 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8B9738D9B8F
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:00 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id A0BA320017EE;
	Tue, 16 Sep 2025 09:41:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 252AC1A0074;
	Tue, 16 Sep 2025 17:41:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/42] asyncmqtt: upgrade 10.2.3 -> 10.2.5
Date: Tue, 16 Sep 2025 17:41:11 +0800
Message-ID: <20250916094152.1479-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119423

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../asyncmqtt/{asyncmqtt_10.2.3.bb => asyncmqtt_10.2.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_10.2.3.bb => asyncmqtt_10.2.5.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.3.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.5.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.3.bb
rename to meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.5.bb
index 76f1dca72c..82c657fc17 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.3.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.5.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https;tag=${PV}"
-SRCREV = "008dbe26d1366b1da3dd8bdcc1471f066b567166"
+SRCREV = "deeb7e36df859af0e90d2462012c48465ba49f0f"
 
 DEPENDS = "openssl boost"
 
-- 
2.43.0


