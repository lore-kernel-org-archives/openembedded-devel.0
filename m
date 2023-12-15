Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E8BC4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 05:56:15 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.53865.1702619768303784756
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 21:56:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="131163920"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="131163920"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 14:56:05 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E1C2E05A7
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 14:56:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C9B8851912
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 14:56:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 041F420097E67;
	Fri, 15 Dec 2023 14:56:01 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pkcs11-helper: upgrade 1.29.0 -> 1.30.0
Date: Fri, 15 Dec 2023 13:55:45 +0800
Message-Id: <1702619745-4200-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28058.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28058.005
X-TMASE-Result: 10-0.008200-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mregIHHX2L4YwXC9p0ThKQ4Y3E
	akIoHWNd6ICHZtu5eJDbCHv011Gy9e1a16oqp8B1/HTKStsDGMJyGvikEsYi8BqB+wKK9uZevwU
	evDt+uW6pByRBJ91zJIqzhSsGiK9tYwDOL7t3RyHdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtsfpBG+7WGjYFk37W26I9wJq0RpIMCzE5XEreKFJpVJ6/aquSvoTZ/xphX
	uv2cPCcWsfdfcXHCFzTPcW0rU/V+2e2uehPHfAbHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 05:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107489

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* core: add dynamic loader provider attribute
* openssl: support DSA in libressl-3.5.0
* openssl: fix openssl_ex_data_dup prototype

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{pkcs11-helper_1.29.0.bb => pkcs11-helper_1.30.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/pkcs11-helper/{pkcs11-helper_1.29.0.bb => pkcs11-helper_1.30.0.bb} (95%)

diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.29.0.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
similarity index 95%
rename from meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.29.0.bb
rename to meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
index d17ac1e7e..df6ca7546 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.29.0.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/OpenSC/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 # master
-SRCREV = "f23911037d9790a3f3a3447a78d31a6362358e21"
+SRCREV = "8bed16034f629a0361fa8ff89deed2b43dc45d8b"
 PV .= "+1.30.0+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "pkcs11-helper-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


