Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B55CD1288
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.39488.1711983109308055610
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ldyxAUeg;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983111; x=1743519111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KQH4aud8McNfSpSmyQfLtMDTLO2IaR2fokIahUIPixA=;
  b=ldyxAUege02zsvZXCk4Iev0lg3fXjFttPl7UWhL7hlWcbW8pCHcHu1qH
   DFLYjhzUF4f2lHx9sCHHFOyj53Eg2CFTMTWY+MKV//k0i3et3PlMb6KFi
   TTaeRyh081+XmK27zT8WCCTKqAYnpVY5Mf4NFZCWJbrIvquJwCIKCT+4L
   8O4kJKZGPBfPIYz7h9tssMKYUDKka/GElOR/ZwKvnfFNs+pNX0lnZC7G2
   9YePQcY+NhAN8CqXzrfVq05vABLLbLALQxpJ5pMuxsUwDSdpHdScUpp4E
   Y3+4nH52dEJMfd8LG2slNgGFrSXFFkTbAn3bPxMDM7WA73CS4hf9lttSY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="141867307"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="141867307"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:50 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E5892C3041
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D9114BF3CC
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7569F20093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2B3A11A000A;
	Mon,  1 Apr 2024 22:51:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 47/47] wolfssl: upgrade 5.6.6 -> 5.7.0
Date: Mon,  1 Apr 2024 22:51:19 +0800
Message-Id: <1711983079-16849-47-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--3.185800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xJoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74A98wLbdeI5WKB5jk2TXXjF1+0
	KsXaxWz7i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFDASVOJRx9Zaak1UK/rd9Liuce
	tghxLB/4E3ZHGvoWc4DivI/iyi59DU10anvPN0PmYXtwwdQgi/SXwe+9CnW3QFil+gC2nYTex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109764

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
https://github.com/wolfSSL/wolfssl/releases/tag/v5.7.0-stable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wolfssl/{wolfssl_5.6.6.bb => wolfssl_5.7.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.6.6.bb => wolfssl_5.7.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.6.6.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.6.6.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb
index 4f7c6c357..47c14dd1a 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.6.6.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
-SRCREV = "66596ad9e1d7efa8479656872cf09c9c1870a02e"
+SRCREV = "8970ff4c34034dbb3594943d11f8c9d4c5512bd5"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


