Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210EEC83F12
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.56132.1751879233924486135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SYDg79rC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879233; x=1783415233;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uqL7xTdPXuAAyoLfbH58/RVkB6Fm3sLfJ8II2Fg2/KE=;
  b=SYDg79rCEao6BJU/lsV6+2OenqGTg/1y+oyQzeXzO2BIKM784fcYwZt9
   arxRmJGkqfiqtEyzSYAwprNF81qo1WJ4DL973D2ratOtWBiC8QUR7zhdv
   flnRp90J8oqPX6VozEoNiey/b42amplIClj8NfJX/Gi0v9U8nOaNNM+K8
   /f1py1p7DWVMG+312FDN4xzYogDBOzI7i/4lonmri7G2uztX43jhTsmT4
   Ji4YlasUIH1S7Y3EYvZtULXsUx3JhtHz3jxYCvmwDyyqkepp0YZXADZ7x
   Lg2m/8NCqu9eJbsLG5hT16O7xWMI3rKAhPidhwN94gN7CA2MS7FmPoUSp
   g==;
X-CSE-ConnectionGUID: SKdEX9qNQW6h3A0v80bTVA==
X-CSE-MsgGUID: lebUqYJ5Q+2BmHiLzpadTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="206006866"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="206006866"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:12 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 47AB2C000AB
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:12 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTP id BF4291400381
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:11 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FA7868A0B1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:11 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A3A631A0078;
	Mon,  7 Jul 2025 17:07:10 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/35] libgpiod: upgrade 2.2.1 -> 2.2.2
Date: Mon,  7 Jul 2025 17:06:33 +0800
Message-ID: <20250707090656.1216-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118256

From: Wang Mingyu <wangmy@fujitsu.com>

Bug fixes:
- don't implicity unquote unnamed lines in gpioinfo
- remove useless variable in reconfigure example
- don't let struct line_config balloon out of control and trigger an OOM
- drop python3-config check from configure.ac

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgpiod/{libgpiod_2.2.1.bb => libgpiod_2.2.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.1.bb => libgpiod_2.2.2.bb} (98%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
similarity index 98%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
index 93c3e3b92d..09b0928dfa 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
@@ -13,7 +13,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
 SRC_URI += "file://gpio-manager.init"
 
-SRC_URI[sha256sum] = "0e948049c309b87c220fb24ee0d605d7cd5b72f22376e608470903fffa2d4b18"
+SRC_URI[sha256sum] = "7e3bff0209d75fbca2e9fcff1fd5f07cc58b543e129e08b6d4bb1e4a56cfec0d"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = " \
-- 
2.43.0


