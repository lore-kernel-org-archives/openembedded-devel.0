Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178ECEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:07 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.4896.1688699641431048030
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="123141878"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="123141878"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:01 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D2B58E8522
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:13:58 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BE9BEA0BA
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:13:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 298E487E03;
	Fri,  7 Jul 2023 12:13:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] avro-c: upgrade 1.11.1 -> 1.11.2
Date: Fri,  7 Jul 2023 11:13:29 +0800
Message-Id: <1688699627-2519-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10--1.473600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZgyKXAUOPYkQNVHotTvuv64Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXI66kjJW2CbJSUmiQohQbtFGauzjs3bSIWhXF
	5E+NTqYS2fjxZR8eQ/hmbFOGAvMFvQJ4intecJV7lg7ta2Mx/ToqWvwRV1bQb+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103690

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/avro/{avro-c_1.11.1.bb => avro-c_1.11.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/avro/{avro-c_1.11.1.bb => avro-c_1.11.2.bb} (88%)

diff --git a/meta-oe/recipes-support/avro/avro-c_1.11.1.bb b/meta-oe/recipes-support/avro/avro-c_1.11.2.bb
similarity index 88%
rename from meta-oe/recipes-support/avro/avro-c_1.11.1.bb
rename to meta-oe/recipes-support/avro/avro-c_1.11.2.bb
index bb0bd7d752..9b6a52e2e2 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.11.1.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.11.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 DEPENDS = "jansson zlib xz"
 
 BRANCH = "branch-1.11"
-SRCREV = "3a9e5a789b5165e0c8c4da799c387fdf84bfb75e"
+SRCREV = "44d1c4f221ccc4571a4b4b9edb023ed1e89354b7"
 SRC_URI = "git://github.com/apache/avro;branch=${BRANCH};protocol=https \
           "
 
-- 
2.34.1


