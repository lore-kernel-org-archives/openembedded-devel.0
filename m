Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA16D44011
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:26 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.37267.1731922213179768646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TyoCiqC5;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922221; x=1763458221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2iVXvjIRxab7RwkWbiYdIV6YxCLw6ohvrc6uoyeJ0BY=;
  b=TyoCiqC53C/tIYQ/kxL4aDFm9EJRpjqan5uaHIQjr0NRmSWqfM8AV7wl
   QtcbTGouuLO9UjdeC5vaLQmQjGNqgmViG2Rd/MGpnMRmKbxAEJKt6fuQS
   1n30nSg1RCZj7BxXbMWbcKl6evLdK7uWbCn6i/6Xn+Dsyqw/IdSN9rh4f
   mNOf2BizMTPr/3SELDpZ8R0/tjXeKdS1UmSTq4p+W+MtLM1DyPvB3JBJU
   4ednu/wR2uFWFXqieOovf12mbyXSXEaotu7YZ0CUBJMKKsoKGVLS23Tkg
   KYfwWSSUxT/3NWFbkOPpnRk/kS0nx0kb0KM7u0YlJ51gvhz1t+p8KtRIm
   w==;
X-CSE-ConnectionGUID: LsDmAN5HSjyYvTT9zEsHFA==
X-CSE-MsgGUID: tLu5cstHS1itZYnaCnOviA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="168136732"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="168136732"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:19 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 99FE496741
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 36104F87F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C3D0C21FD58
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6FDC91A000B;
	Mon, 18 Nov 2024 17:30:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 30/32] swagger-ui: upgrade 5.17.14 -> 5.18.2
Date: Mon, 18 Nov 2024 17:29:53 +0800
Message-Id: <1731922195-5266-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10-1.813000-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrGngTdFfYoLyr8za0Nuds276p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUrBh
	yv2DtHP/i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFGCsSC2vKe2ciHe926dygXe0zw
	ycDVxS3B2HJ0R9iMCBzwEClnNObai4IlOrlebUa4ssgzpHGH1i2EacTvGvObB6ZdEmjAeqE+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113894

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- update Scarf.js to v1.4.0 to avoid breaking Vitest
- docker: return explicit Node.js installation
- analytics: use Scarf.js to provide anonymized installation analytics

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.17.14.bb => swagger-ui_5.18.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.17.14.bb => swagger-ui_5.18.2.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.17.14.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.17.14.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
index de5437027..5add32db4 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.17.14.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https"
 
-SRCREV = "74ed0adebfc9c8dd0de2bf8e81495b022a66c083"
+SRCREV = "3c7e281d97fd3e70b25f7ff4a001eabd56e375d7"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


