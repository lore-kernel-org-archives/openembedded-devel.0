Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81ABC52D7B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.33836.1721034184852008469
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gTCaNaDN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034186; x=1752570186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XLomZ2z+z7LWl56+rUCFR/tzLivF7uMt5eyfLsMno1g=;
  b=gTCaNaDNNtVReOzqVHHklAIUUAmGq5SWDAaUDke57XB2h7kORYHX06hz
   aGPphS+P0yYFeG2Fo/sL1w5kkf7HWyVRhbSRN10cKtjGbA5ZLjvtAOqGK
   wQz5YQ2GprGSO25A/CnPARhG0u1u3DJNU7EzHbFUFfYo9qaVgQJ7R5AxR
   mFw6d6kbpt6gYFH3MjJCff2pBhRjVizmxsH1KUb1A+hiYyTqQxOVaLM6n
   NIAR0fzAcK/tWHxjbMo4uIzMyKwdF99q7fZpaN2qHO/8856LMD45kNoXL
   FjJTbcyFnCgSmizWIfzNIF3OOF2EFLEtCe1p/WVJB4lG2vPMvE7KxAw+9
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="166909676"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="166909676"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:03 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F2C1DD64B9
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:03:00 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 422ECD7487
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:03:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C64BB6BE53
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 747D91A000E;
	Mon, 15 Jul 2024 17:02:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 36/38] wolfssl: upgrade 5.7.0 -> 5.7.2
Date: Mon, 15 Jul 2024 17:02:29 +0800
Message-Id: <1721034151-540-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10--4.320900-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74A98wLbdeI5WAs5GlXF672zo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJ7OKuj8SBKdVHvaIIAEblhC5k7QRBcvYLlnZ
	+GwHfj3pBPBi302jQ1YatVIz1ASuR0KHul25iHbWJWnidnU/KmW2ZTisMYPDD+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111359

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/wolfSSL/wolfssl/releases/tag/v5.7.2-stable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wolfssl/{wolfssl_5.7.0.bb => wolfssl_5.7.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.7.0.bb => wolfssl_5.7.2.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
index 47c14dd1a..d45f1f69d 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
-SRCREV = "8970ff4c34034dbb3594943d11f8c9d4c5512bd5"
+SRCREV = "00e42151ca061463ba6a95adb2290f678cbca472"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


