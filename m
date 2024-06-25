Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AFFC41513
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:25 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.166857.1719305833269402904
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j8vHR9Wd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305837; x=1750841837;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bphDg1zfxpQoBpLIenP17zVxJSR0Ze6mzkiGm4rJXGI=;
  b=j8vHR9Wd3+SI9sKJoRiHG7sLQbmeI+Pw+5kJZzIfwziS8HKhoyTWiSkQ
   zZh1/JJkZVtNv+69zSxk3IhOAu5j+JkQsmEPIZKYUKe3zD3TA4T7eXTXI
   TcZ5kMsa0IorqIFX80j3waOzWnxGvYgcTxAz1eAXsu+Fkhx9TByb5KWPP
   YcP2MP+bg/U+yy5O5a7t3jl1DTDQ5ymAHYyzQSHbSIbO2yPEuZPwBWE2E
   3ohhhwRltn0GezaWg5dRC9DWRSOFyirf/d9+mq298kfFfMp9w0LtYiwfe
   bpk+BuUiVtFyu3Cuf10cJe/rYQSH8ZA89dSJE2EmXPhq/ZRE9V6Qf1Twx
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164920927"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164920927"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:15 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 05CAEC9440
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E451D50A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1C27E2A0B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5FD751A0002;
	Tue, 25 Jun 2024 16:57:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/57] python3-filelock: upgrade 3.15.3 -> 3.15.4
Date: Tue, 25 Jun 2024 16:56:01 +0800
Message-Id: <1719305790-11484-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOMKPrF7dK57MQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLqlpG1+sj79bu5OjfbU7l5hAXa5sD4Y0ct2j
	NpIknvQlOto1m145egUpfwAX9JXAY5IdkUz4xnl3RWbWDc7S8tZJHb0Ps6A4/+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111040

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Pass file_lock as positional argument

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.15.3.bb => python3-filelock_3.15.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.15.3.bb => python3-filelock_3.15.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.15.3.bb b/meta-python/recipes-devtools/python/python3-filelock_3.15.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-filelock_3.15.3.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.15.4.bb
index 3bbf72319..0f5cd4d9d 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.15.3.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.15.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "e1199bf5194a2277273dacd50269f0d87d0682088a3c561c15674ea9005d8635"
+SRC_URI[sha256sum] = "2207938cbc1844345cb01a5a95524dae30f0ce089eba5b00378295a17e3e90cb"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


