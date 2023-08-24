Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571E1C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:16:04 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.6205.1692864958272692544
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="129408987"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="129408987"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:15:55 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B9F31D7737
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:15:53 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BFD3CF7D6
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:15:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 172E7885FA;
	Thu, 24 Aug 2023 17:15:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.24.0 -> 4.24.1
Date: Thu, 24 Aug 2023 16:15:14 +0800
Message-Id: <1692864914-2748-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27832.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27832.005
X-TMASE-Result: 10-4.369900-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrzxWuskk9boYsXXGeXdbzx7MI
	TuvBC7Pa4dmYvpvlVkniyUbmCt6k6MRBLZ5x+SkXP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAsSh9atRkcwf0iF5TZPPO8Zca7SN08UZJHUt5D5Wmcl/rvCkqsgk0E6tN
	XWm3vJYvOGImoNbpXYeTjw/FyRX6QfE8yM4pjsDxZ4ylU2GwzAxEHRux+uk8hxKpvEGAbTDj8eh
	MNMA6HDaSsQ3d12TvKMMjbiBE1ofEMOc98rgEGGyUrEIMi3arsJmw1xbzL2Nn+MpF6cdc0QnpHQ
	0q6CwuE2uuCezMf9KYK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104575

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Protobuf News may include additional announcements or pre-announcements for
 upcoming changes.
-Revert CopyFrom() optimization that was causing crashes back to
 Serialize/Parse (protocolbuffers/upb@78e9694)
-Ruby: Fix object cache lookups on 32-bit platforms

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.24.0.bb => python3-protobuf_4.24.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.24.0.bb => python3-protobuf_4.24.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.24.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.24.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.24.0.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.24.1.bb
index 4f7fdf7599..6322ec1f30 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.24.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 SRC_URI += "file://0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch"
-SRC_URI[sha256sum] = "5d0ceb9de6e08311832169e601d1fc71bd8e8c779f3ee38a97a78554945ecb85"
+SRC_URI[sha256sum] = "44837a5ed9c9418ad5d502f89f28ba102e9cd172b6668bc813f21716f9273348"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


