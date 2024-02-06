Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99B8C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:02:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.16482.1707202938101225693
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ReW4rmrf;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707202938; x=1738738938;
  h=from:to:cc:subject:date:message-id;
  bh=jUUPl4Qegyo8ebxuOzxDQIwEM5kLUGYG8li0FrAvuHc=;
  b=ReW4rmrfb8wjfXeB0ItXTbE+a0QvIa+7+q4efH9iYxghPLVQQDG5+CII
   u1J6m33jQxKaW4gRt8qZFYX1sOkyA9tm351cAtm3kyTTzJNc2+wCVjPGP
   ZmxtjKnu3CGuqmk2sUh8Rr5ON5ZGprKUaKy+e0HKJBWOZ0ODvKtQ4ycZE
   /lcbp8uO26HPLkOOA9Htux/P9tl8NJFHLeqDc4hX9X90SeX4jD8b0Uo4U
   nZJXQcjMY3nWnsa57BHF8gk+O1STQqFlbnQCuvYDhIakWQby1uaSsTgDR
   Q1k1xjNQ1IWcA5NUf6WC7W/yfGyk9XK7vF2r1mkMC/l2ougHA5zu3PneU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="136537453"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="136537453"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:02:15 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 95BC31EDB9B
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:02:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C3016BF4AB
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:02:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B6416BD68
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:02:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0FDFC1A009A;
	Tue,  6 Feb 2024 15:02:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.8.2 -> 2.8.3
Date: Tue,  6 Feb 2024 15:01:48 +0800
Message-Id: <1707202908-4205-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXIrbi0lq5gNRA4lvU6ozZZHxcqQl3rXg1huPf
	lY8x/2hXNoEppGd7RF8G0yNrJzm90q4cz5SArKcKTnh/8Upk92mJpkUFb3MTL+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108588

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.8.2.bb => gensio_2.8.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.8.2.bb => gensio_2.8.3.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.8.2.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.8.3.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.8.2.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.8.3.bb
index fb9c5c7b1..533b79f47 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.8.2.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.8.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "f24f1d954cfb602c45c5b563b9fbe3418630fb59"
+SRCREV = "c8e0d722794e35c71bc9bb1d79e98f926aad19e0"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.34.1


