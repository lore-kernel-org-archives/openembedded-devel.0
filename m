Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C96BC87FDB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.13468.1754296441141920287
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nwK7vQc/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296442; x=1785832442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ieSkVOgiR5CfFZSpSdqJ6W0wqbtozf0mycEOqsUti7c=;
  b=nwK7vQc/WL39jWICiiNNO2ggSBOHJDh5tHeNWWDMfInCHPLH3VSAxHJJ
   GVvgGTzMuTbkYQnufFgtEyM0NsTgwDbr2IpMxl8rlP2YpVvykU7Z1w8Bd
   mK/nl455/kwH81EC7gtUVP9a42ZZJKv/8mLo3AfJvIUPIJKA9mlT2oVuv
   ubcRffSodhuim4Z5L23L/5FVmqrXG2vAtBfgDM9yYOg78xjTEQlPOnSS0
   RmfJP9P21ruT6/fLHImbfNjXMi80IGztMOwTFyeTOUWp1j8g4pYQvKrV3
   FVIDJ/CLJipv+644CyEWtlrgq3pKjEbCx1R+nugSZYTBbswVZLx2AwLRk
   w==;
X-CSE-ConnectionGUID: FmCWaRPBRayPCmm8e0LvUQ==
X-CSE-MsgGUID: Xa2gXC/QTK+KSD9rws4dAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="211661988"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="211661988"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:34:00 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id A24F4100034B
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:59 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 164921800BE5
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 18B691A008D;
	Mon,  4 Aug 2025 16:33:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/18] python3-pymodbus: upgrade 3.9.2 -> 3.10.0
Date: Mon,  4 Aug 2025 16:33:35 +0800
Message-ID: <20250804083340.1649-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118846

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Changelog:
==========
- Raise runtimeerror if listen() fails.
- Correct values parameter in setValues.
- Correct return from getValues.
- Add request fc to exceptionResponse.
- DummyProtocol is not async
- Handle "little" for multiple values in to_registers
- Remove unused const.
- Add retries to ModbusPDU class
- Don't invoke trace_connect callback twice
- ensure unpacking of proper length during decoding
- README clean-up
- Bump coverage to 95,5%
- Simplify response rejection.
- Bump coverage to 93%.
- Solve ModbusDeviceContext bug.
- Bit handling LSB -> MSB across bytes.
- Change slave to device_id and slave= to device_id=.
- Remove payload.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.9.2.bb => python3-pymodbus_3.10.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.9.2.bb => python3-pymodbus_3.10.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.9.2.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.10.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.9.2.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.10.0.bb
index afede52161..17846ece00 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.10.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A fully featured modbus protocol stack in python"
 HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=12a490c6cffa2e76a6df8aa1fa29e183"
 
-SRC_URI[sha256sum] = "2d08ab7bf6d1abc55a87f4faa3a7b04f74d7310b8c9771c3d66ee5fccf2e25ac"
+SRC_URI[sha256sum] = "5b7ce71f9da2fabd1f8484de564a7e2c56085e94e3d4ee2a0fbc14c59dfa9da7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


