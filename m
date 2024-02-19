Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF82CC54798
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.37321.1708333364536851969
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZShwoq4w;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333364; x=1739869364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+jjtzFLpOfDqX4V3qRlG6v73rqGtA0VFx5qnIWAteGc=;
  b=ZShwoq4wOCjB4jzy2vOdMctSrDD0KVC/s+lXJRQLrPW0A5HFuvcoe9OC
   0x8u4uj9hwEQtJJGTwtUZ7kc4duPvfhODrcHPnYUPt34yMuF5S46QJeRF
   JKho8rWDM55HZzw1f5VilOwRf3lKEFMXAfT9rRqfhbxCZijsTu2T6cirD
   tiUT0OHeNENn37xvhtoUkJu5H8IhAwYIyp4+lgeCc0TJhIOchEYQFIgMn
   7qYqINr6dbdLJiMTdrWbWFQ5UCo8pCXpui5i5+horQMCUVabr6i8/vfnM
   Qiz02pnYJblsb9JzrulMKGJPdat5fUvRjz+5uxtdRlG/Ap70Si2oXHhlD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="129150083"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="129150083"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:42 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 40998153E13
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BAE22E9FA
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 19DA020099594
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BE04F1A00A0;
	Mon, 19 Feb 2024 17:02:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/23] libei: upgrade 1.2.0 -> 1.2.1
Date: Mon, 19 Feb 2024 17:02:11 +0800
Message-Id: <1708333346-17704-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10-1.302200-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmLHBvqhRdA8sja7IBuOPthE3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrfpplZTJTKOIz3ABUHBnPoW1meaw21tG7wIlHahXaasT6zeWF2X9Y5zFIO
	qh6rZxhNuAlAjc1SYfO3NK6U77aUiEO+d05wiZKR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108854

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/wayland/{libei_1.2.0.bb => libei_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/wayland/{libei_1.2.0.bb => libei_1.2.1.bb} (92%)

diff --git a/meta-oe/recipes-graphics/wayland/libei_1.2.0.bb b/meta-oe/recipes-graphics/wayland/libei_1.2.1.bb
similarity index 92%
rename from meta-oe/recipes-graphics/wayland/libei_1.2.0.bb
rename to meta-oe/recipes-graphics/wayland/libei_1.2.1.bb
index aba49de7e..807dcea1e 100644
--- a/meta-oe/recipes-graphics/wayland/libei_1.2.0.bb
+++ b/meta-oe/recipes-graphics/wayland/libei_1.2.1.bb
@@ -17,7 +17,7 @@ DEPENDS = " \
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libei.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "493631688437657a87e9169a76f14a3216c0024f"
+SRCREV = "08f1d41085a6ae4bac7bc52abe2955d3354342cb"
 
 inherit meson pkgconfig
 
-- 
2.34.1


