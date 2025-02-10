Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37BFC0219E
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:17 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.46470.1739178127190769251
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AwryRGpG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178128; x=1770714128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0mHArDBd6yQq5V6fpthOwifZonn7bPvmqQTBOk0tecI=;
  b=AwryRGpGnbD9kdKVu89cF/AJiU9phEmIZ+KDwriHz0qu74ywU48wS9mK
   PBYjkf+xW1NM1BmIQakX77Z1rrwmTHaKCFol28XKhZmCO31F1XAB4otFU
   XuHNDIiViToTagecN2YQuZUUOavzQ+Omx9CEd1s2VtCDsAVhM0IZUWi54
   EoghZXHX0bUX9AbdIVtVAzqQEMq2hA7Ezw2bKg+iqL/6je3hdjqLOatqV
   YMPgeo9n1tEHJPJKfz+pI7LuJiVNY6IAJNoqJzklD3PEs695TOHBTyOKX
   y+DsBK19oq1tSpAeFJ87Ua9KHeS5r74663S7juWBEXRnt8bX1oX/LGdT4
   Q==;
X-CSE-ConnectionGUID: PBuPlgRJQBO2iCfn5VVRDg==
X-CSE-MsgGUID: 5hIBzzv1RKGs7+S0g8pPcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189712448"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189712448"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:05 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 312A3D500F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EDF9715569
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 90E791A000B;
	Mon, 10 Feb 2025 17:02:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/66] python3-lief: upgrade 0.16.2 -> 0.16.3
Date: Mon, 10 Feb 2025 17:01:15 +0800
Message-Id: <1739178095-26432-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115376

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix issue when parsing the dynamic table with an invalid offset
- Fix endianness issue with IA64 binaries
- Fix missing original forwarded function name
- Add support for spdlog compiled with SPDLOG_WCHAR_FILENAMES

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lief_0.16.2.bb => python3-lief_0.16.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lief_0.16.2.bb => python3-lief_0.16.3.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-lief_0.16.2.bb b/meta-python/recipes-devtools/python/python3-lief_0.16.3.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-lief_0.16.2.bb
rename to meta-python/recipes-devtools/python/python3-lief_0.16.3.bb
index 07b54f7068..925baa655c 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.16.3.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     file://0001-build-requirements.txt-Allow-newer-versions.patch \
     file://0002-api-python-config-default.toml-Debug.patch \
 "
-SRCREV = "e2ef1ea6594738d4461e75717a61ae05fb0541d6"
+SRCREV = "646af9f6ced8e827916648f26617998de834db78"
 PV .= "+git"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


