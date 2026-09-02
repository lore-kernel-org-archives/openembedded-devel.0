Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF54C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:28 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9722.1788344963491590276
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O0YiWwE0;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344963; x=1819880963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QhzMxLIToW7myBOWGXgKD8pUjuK2HHUPBASTO1CWXYQ=;
  b=O0YiWwE0ATFuZYdysaGdJB1cWbfXWDw/0paS4vBwV3dWxXznlf1Z3wxJ
   0BNQh6EtnSobezkJoMXSdg+tYDt2opxD+6Kh4mlLhjrtQxQMXx8xCfBMa
   tgMKVt2Txhvp+WxJyxkI0HSCgiCHbisryqK22MVOuqFjZnKHS0AzSAFd2
   WP0aBjgrsGIR3UtKYq65zNurj+XjKekOOVcQd4HPzaPlUJDIJyfTAbp6O
   EBr4TqJqvwTquvgpzFhcRYLxyuJP1ROJ6L8QBOawBm3NmWP2BpmMFrnE1
   7Z4JBGqlJo3v54tKJZSh/0tJJcZ1XRcMrfiGX8JTKeZ/6dSdA8agvhTW1
   A==;
X-CSE-ConnectionGUID: Zb31wy2oQ9C8XKeEk2rloQ==
X-CSE-MsgGUID: yp+5yr9QRrOjb18nb+P9GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="241545542"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="241545542"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:21 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C02361002B8B
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:21 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 73F031400389
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 6FCA82000224;
	Wed,  2 Sep 2026 10:29:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/34] pstack: upgrade 2.17.7 -> 2.18.4
Date: Wed,  2 Sep 2026 18:28:35 +0800
Message-ID: <20260902102900.1296-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129668

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pstack/{pstack_2.17.7.bb => pstack_2.18.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/pstack/{pstack_2.17.7.bb => pstack_2.18.4.bb} (94%)

diff --git a/meta-oe/recipes-devtools/pstack/pstack_2.17.7.bb b/meta-oe/recipes-devtools/pstack/pstack_2.18.4.bb
similarity index 94%
rename from meta-oe/recipes-devtools/pstack/pstack_2.17.7.bb
rename to meta-oe/recipes-devtools/pstack/pstack_2.18.4.bb
index a45d6b69ad..8a1e1c6664 100644
--- a/meta-oe/recipes-devtools/pstack/pstack_2.17.7.bb
+++ b/meta-oe/recipes-devtools/pstack/pstack_2.18.4.bb
@@ -12,7 +12,7 @@ DEPENDS = "tcl virtual/libx11 libxt zip-native"
 SRC_URI = "git://github.com/peadar/pstack;branch=master;tag=v${PV};protocol=https \
            file://0001-reader.h-include-cstdint-for-uintmax_t-intmax_t.patch \
           "
-SRCREV = "a7b64eca7a0a57b6f38de770388013a4fb3be739"
+SRCREV = "b78d16e9497fd36350e4e8bd37f31f8dab5b5651"
 
 PACKAGES =+ "${PN}-lib"
 
-- 
2.43.0


