Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1A4CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:01 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76244.1781000996589781803
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mfRlOf0b;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000996; x=1812536996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=88E0Z6gdlkemuc491WBCr1ck75HDjEiKh6WQK61lLbA=;
  b=mfRlOf0bO3swzO5vm6o80rP5VcepZGiWxWclccoTWKooHClCRCMM4wxf
   puKRUT0w+Rxgvz1gPwfeQ0By+vPijO7K8+9NNy1VWQ9fqXKGP8hfz5pxe
   eofpmCMqaOW2xzxpktQ14aKwotsLXrMK2oTfThJVlnQEW8BMmjlAztKya
   KYSg81eQaprgIij+wcY9SfjFop5ZCqf0Y5SsKPM1GLuT3KAMcd+1tCyoL
   kOzqFuLZ5YhWehutti07MKCAVkGTbZXIXykgihOPAMogSSGuMfm8nFoYr
   thVBom90bUoI1PFk+Nkn8ka9RaZ1CMvdU+U5vAEjiQRQ9ENWgDbczk4oa
   Q==;
X-CSE-ConnectionGUID: 5sXPchmOTLya4loysfs8tw==
X-CSE-MsgGUID: 6qUQ9DDLT82NzHLJRitvAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="242941906"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="242941906"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:55 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 26F6A1002B85
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:55 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D00ABC170A9
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 078BC10003C5;
	Tue,  9 Jun 2026 10:29:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/30] python3-cbor2: upgrade 6.1.1 -> 6.1.2
Date: Tue,  9 Jun 2026 18:28:57 +0800
Message-ID: <20260609102913.2204-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127468

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed incorrect tracking of string references for definite-length text
  strings of length greater than 65536
- Fixed cbor2.load() crash caused by incorrect handling of internal read buffer
  extension during stream deserialization.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cbor2_6.1.1.bb => python3-cbor2_6.1.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_6.1.1.bb => python3-cbor2_6.1.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_6.1.1.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.1.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cbor2_6.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_6.1.2.bb
index 4b4406ffbf..b8e92ca361 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_6.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.1.2.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "6f0644869e0fdcd6f3874330b8f1cebd009f33191de43acf609dc2409cd362c4"
+SRC_URI[sha256sum] = "6b43037a66947dee5af0abb1a4c3a13b3abac5a4a3f32f9771efbbcd030fd909"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 
-- 
2.43.0


