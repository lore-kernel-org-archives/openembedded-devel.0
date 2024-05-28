Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A445AC25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:48:58 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.12674.1716860935808592565
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VLWp90Cl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860937; x=1748396937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nIOpMUOy2p6P5g09tPXT0pqohNb3yBbpAPgd+HtxHA8=;
  b=VLWp90ClNDP2iA6rLo0M5cCLpFoX5dP+KfRqrtaY3G4srjYRTRqV7y/g
   nVQ5288VNkv0hmfspc2VIUADhIIrhaTwaYWuj0fHfy5xmrHcRH8bfq1gG
   ECQLL1ck+YzJ1/fjknu0Zg6WevYkqBuqXolphCQ1uUjxsBYQKRWaOUXzB
   EDyJG4Q9+FiVfTbAI8bxNVemdQPG84fQNJ5z7siXppYbKn8Lj0yvE+/7s
   KgmpEiviB4mSlEgZ1aS3PYXkGGTEca/TZ/Mz87/++EiVmpTs8k8Kzet36
   Ue/5kkr+zeK5BOYxApgIGfUXvADc++FqTuno0eHSXb6CBeCzZKXtpgW4d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160573415"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160573415"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:48:54 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C0CED3EA3
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:48:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 451F4D7B6C
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:48:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C40242008BCCC
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:48:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 71F761A000A;
	Tue, 28 May 2024 09:48:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/40] cjson: upgrade 1.7.17 -> 1.7.18
Date: Tue, 28 May 2024 09:47:43 +0800
Message-Id: <1716860901-863-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--0.165500-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqw1L0DdfW644E8J
	U10YmY3Bp7V+pIANDRpO+o7Dw7WB4dS9oJl2R9IciV0ptmwZhq2R3FxNiThSbeX3QlUHePIKu+l
	p6DMJ7P6N/ziTW5bneOpe9co8GDkGbRev5+PfDD9O5y1KmK5bJTZlY6a4lRLZYA3qL69rXq6RY0
	JyfRdA4jhvgt8hlMsuLWHV5Rz6nryR9GF2J2xqMxRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07X1Hh
	KzShSYnP/BCJ6Ic5nHXLMpmYUfxxPdkOy23QAIw6BQ1quwCaCRj/cXrgwb0UFYukEVEVimYipu1
	pBEfdsWfJ7mBpeW4NKWABUtrVACt8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110537

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Add NULL check to cJSON_SetValuestring()(CVE-2024-31755)
* Remove non-functional list handling of compiler flags
* Fix heap buffer overflow
* remove misused optimization flag -01
* Set free'd pointers to NULL whenever they are not reassigned immediately after

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/cjson/{cjson_1.7.17.bb => cjson_1.7.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.17.bb => cjson_1.7.18.bb} (96%)

diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
similarity index 96%
rename from meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
rename to meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
index 6c8934b34..5e992845a 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
            file://run-ptest \
          "
-SRCREV = "87d8f0961a01bf09bef98ff89bae9fdec42181ee"
+SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


