Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9DCC0218D
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.40068.1736843353793597239
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nm4L8R0C;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843358; x=1768379358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=atb0EoHiDF8lDefHvWIZaNNSopci6l83CwT8JJ7Yvn8=;
  b=nm4L8R0CAM1qf1yDDtyut7hYG5Uv7N9NIIkSEktfmNr7UK1AULitDaxL
   rJZNcPkx5gL1f6oOduqdpTp4WFjnt4dZSuyyoqDIM1eZTNOYfaDCcLksm
   A/nNKxBVvVxTJGducbXgV1ceShZ/jj8GyRYyMJdGh84xxW/RbcvTDuGDY
   f8AAimd2rW+6oRcr2l8K9N7tsYWNuI/VW2k0Toalf0kCzC4SG/rXywZzC
   JOJrtNLa1wY0KqGl4iC23qmZHw3bGlM65dogRSswla5H8V1WapCvq5eWH
   nkmHU26qHQ6zDwHREmUy8jRnsSjBnRRvODmrTo4sZSuQuvE/WNwGXe4qn
   w==;
X-CSE-ConnectionGUID: awAjpMFZSgGnrCCj/Z0ctw==
X-CSE-MsgGUID: YZT+7EU9S5marpdh2mTxdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="188950534"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="188950534"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:10 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F342D6EA5
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EFF3AD3F08
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 887C420071A35
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 377461A000B;
	Tue, 14 Jan 2025 16:29:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/30] paho-mqtt-c: upgrade 1.3.13 -> 1.3.14
Date: Tue, 14 Jan 2025 16:28:32 +0800
Message-Id: <1736843329-4131-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--3.391500-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mre7Z0UyQO5TNqTj+cW75OIPUt
	SCGaNXOr+YkHSKhexAaB7QrLnZYdTPRr52i2NSUs1l+BjLM8lsppTj662wZmoBcL2nROEpDhyPZ
	WszY8usA8X8UnZedZPFkqYV0ykLN5HY/bzRmIaZE/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlkRdAlp93HnNw3KXWd30Ii3RRFJJyf5BJeGEkIgdGU7nX6C0ePs7A07fH8X
	RQwShO7XD6jytlBe+U/sFT+y+a7lJKjjMsq2KThwn5UGdPUt8X0Wzo9QiN/wj9TS7J9edUqrmzO
	HY/lksLMxx1Nc1n98ZOMoanrLygq8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114871

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Update CMake toolchain link in README file
- CMake cleanup, bump to v3.5, and submodule improvements
- Fix usage of memset
- Assigned Client Identifier constant misspelled
- Exporting the -static CMake targets when both shared and static libraries built.
- Some minor hardening of MQTTProperties functions
- Zero out MQTTProperty before reading
- Fix doc comment for MQTTAsync_disconnected
- Small cleanup of OpenSSL/LibreSSL CMake
- Fix usage of realloc
- Fix compiler warnings
- Small cleanup of OpenSSL/LibreSSL CMake (2nd try)
- Fix IpV6 link local address connections
- Added support for UNIX-domain sockets for v1.3.x
- Build all the sample applications for the static library
- Fix possible memory leak

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{paho-mqtt-c_1.3.13.bb => paho-mqtt-c_1.3.14.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.13.bb => paho-mqtt-c_1.3.14.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.13.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.13.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
index 6f229001f6..7b76f86db6 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.13.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=https;branch=master"
 
-SRCREV = "07a875788d8cc6f5833b12581d6e3e349b34d719"
+SRCREV = "2150ba29d9df24ad1733c460eb099f292af84ee5"
 
 DEPENDS = "openssl"
 
-- 
2.43.0


