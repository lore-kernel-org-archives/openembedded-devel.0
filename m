Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C72C02184
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.30507.1735032443754317723
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cYviSsvg;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032444; x=1766568444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GNKzEtuWTVVgy0l5nmEtCIZKGjp1SF1l3CRjlPyqK4k=;
  b=cYviSsvgVyjBG9YApHCseRnuFOhRdH4RQGybF8hTlZsGNPFyj7rtIfAH
   5PwkIj8sMctxQaA1ZgauWYD2Q30kQtQWnRJRQEyGKest1trknSbg7hPKu
   ebjTyr/FSQOYmK73xNmWsEXTyXbx53C9BF6pGgdMqXVdWgKSCvK+rk7ZZ
   D2Uab801H7VuHR0HMZd0hDbG2G52VnpbsBXU04LniVPqUOZrzfHpVuEEH
   Ou64N544AH0uAS1ANNL5aMRgVR+bchSSdPJweMAJX7NUYl9OyY/YmduX3
   vTcYpzo2+1DQfF2O7tFKF8dXIVyWVB78Xm6APBCionrUspU2HXXgyBuXr
   g==;
X-CSE-ConnectionGUID: u7bcZKCIRueDpYiaELHr1g==
X-CSE-MsgGUID: +4w5gf0mRf2DDHY60I+JKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="173157100"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="173157100"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:23 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CCBD3B406E
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B280D3F36
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 340766B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CDEB81A0071;
	Tue, 24 Dec 2024 17:27:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/67] python3-google-auth: upgrade 2.36.0 -> 2.37.0
Date: Tue, 24 Dec 2024 17:26:22 +0800
Message-Id: <1735032421-13513-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--0.405900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrAWQaZTMSP86jEIt+uIPPOIO6
	RSmGrp3U+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3FCedixYXzOra/1
	DMOwpv9fi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSkgbhiVsIMQKx7KERNgzExGJTLpyNJDQSIs2T
	UPNPAlEFb9TK4yMuZdIQTXavWVkGEg59CbwJJiA5tfyo+BxRhIESiWToJYL6oZC9knGG6JC+6Hw
	lewjzVFiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114502

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Allow users to use jwk keys for verifying ID token

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.36.0.bb => python3-google-auth_2.37.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.36.0.bb => python3-google-auth_2.37.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.36.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.37.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.36.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.37.0.bb
index e36ea4ce54..57621588ce 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.36.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.37.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "545e9618f2df0bcbb7dcbc45a546485b1212624716975a1ea5ae8149ce769ab1"
+SRC_URI[sha256sum] = "0054623abf1f9c83492c63d3f47e77f0a544caa3d40b2d98e099a611c2dd5d00"
 SRC_URI += " \
         file://run-ptest \
 "
-- 
2.43.0


