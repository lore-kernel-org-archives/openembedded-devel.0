Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01338D29F9F
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:24 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.40027.1730874676942858588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iCcq2u5a;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874677; x=1762410677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xJk+KRz6K8atSLj7e+lIo7EzlNpieTKmQuPZyEBYDfU=;
  b=iCcq2u5audLDXlu6yYKaFdJLrmq42+LwiqP8L1MB2CdV/tZN2LATFDTH
   /bhJQ8VCLB+d0Q7oNa39/LAtNBfWsXmM7d8JNMnCiEUbvAjna5J90Yz+o
   kBV4+eBFt3/DVMRcPAHvTB0n2cFY07w+XZedIIuUdN/ikoIGRd3ob1cTR
   7deNJ3MuBRe9zXUrJog2ZW1b9KQhWcsUH5SZIOLycTNl6OB6i7s3cqZ2A
   li0SUUF3xsA99J6Bh136CJ3YlDhQbHa9dkHGSk1Mo/e6FB/yp09zDO98H
   fKUyEgYMSwbukNqBXoNU7APZWilXfgyb8ytIUKSyhAai0pUjOdJiomaJE
   w==;
X-CSE-ConnectionGUID: XBkKrIN6TsGujvvDr5Nagg==
X-CSE-MsgGUID: Bo0QntYhTBqH0FChf8wWTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="181534003"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="181534003"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:15 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 77454DAE08
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BAC27D50F5
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 53FCE20071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 03A681A000A;
	Wed,  6 Nov 2024 14:31:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 12/46] mosquitto: upgrade 2.0.19 -> 2.0.20
Date: Wed,  6 Nov 2024 14:30:26 +0800
Message-Id: <1730874660-2364-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-1.300000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbys6FHRWx2FGsE0Z
	Z3Fa0vyfS+UlUflPGXahaSYOzA/KYE8HitdqBBn7n6y0mNkW0aRUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiDAixBlu3NnBrzsINdopFUpHUt5D5WmclmyiLZetSf8nyb6
	HMFK1qe2hKvDc1vo2QC24oEZ6SpSkgbhiVsIMQKzWruVVsuTGRm/Z+0ZJrdXu7ofV3ePiurzoPY
	HqpNhVfMmCmS4hxFrThyN992vg6wPznRb3ELpgqY99glXOx/Fihcm2SqqWVlS5XgqnXUq4eGCw2
	xDS0aXmCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113698

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Broker:
- Fix QoS 1 / QoS 2 publish incorrectly returning "no subscribers".
  Closes #3128.
- Open files with appropriate access on Windows.
- Don't allow invalid response topic values.
- Fix some strict protocol compliance issues.

Client library:
- Fix cmake build on OS X.

Build:
- Fix build on NetBSD

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mosquitto/{mosquitto_2.0.19.bb => mosquitto_2.0.20.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.19.bb => mosquitto_2.0.20.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.20.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.20.bb
index 3d4c6dce9..75aaf7cf3 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.20.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://2895.patch \
 "
 
-SRC_URI[sha256sum] = "33af3637f119a61c509c01d2f8f6cc3d8be76f49e850132f2860af142abf82a9"
+SRC_URI[sha256sum] = "ebd07d89d2a446a7f74100ad51272e4a8bf300b61634a7812e19f068f2759de8"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
-- 
2.34.1


