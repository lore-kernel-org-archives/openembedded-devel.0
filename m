Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3236BC71133
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.78436.1749526427996707314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i8Doolm9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526440; x=1781062440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rmEnWratWKbAY88iyRRtlp2FT+eDcBxkmqcWTYXVTdk=;
  b=i8Doolm9PcNmYL3rBOiBBznlZMolXsfrjSgRxhUuyxMknG45OZqkhw9X
   vkjRvmNGxehlSU42GJG4Y6lFESO2OjMbcWadKVUxCwjqqaHL8GN6/74J1
   9Zo05VpXottASQDrXqtrvl6FbBfeF9zXfcI/YGJFYLtQdGwxBXMQWcxR+
   81+JtvUwpRHLYa0isp6sVYPYI+EHjGU379xegIdJ5q3wLGO8oAgMzfwxM
   uLSfcENLlerzLgihvT9brC/Hzxa7+OwWtzA1qOuoTME2c2tPid1Ne8lsU
   I3m/FfxxewkaIe+9dJ4c6P1srDhRJ+1YTz3viKhBdsb7YXFHJnRjds/zu
   g==;
X-CSE-ConnectionGUID: ov3vGf98TZC34Y3as4FV1A==
X-CSE-MsgGUID: vSXSIctbQtCDibpBZGhjTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202680498"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202680498"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:59 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E9284C68FB
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 94663D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:56 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1CA291A0071;
	Tue, 10 Jun 2025 11:33:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 60/64] tesseract: upgrade 5.5.0 -> 5.5.1
Date: Tue, 10 Jun 2025 11:33:26 +0800
Message-ID: <20250610033330.924-60-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117850

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tesseract/{tesseract_5.5.0.bb => tesseract_5.5.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/tesseract/{tesseract_5.5.0.bb => tesseract_5.5.1.bb} (91%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.0.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
similarity index 91%
rename from meta-oe/recipes-graphics/tesseract/tesseract_5.5.0.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
index 33d928fa2c..213dfada23 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.0.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "64eab6c457b2337dd690746a5fde5c222b40d5f8"
+SRCREV = "3b7c70e34dea179549ed3e995872e2e019eb8477"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


