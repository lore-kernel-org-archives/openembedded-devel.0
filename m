Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF81810A3D60
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45650.1774526248918547343
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BnfzvBtg;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526249; x=1806062249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jlAvNkjsHesyRj9a7ex+tOLqfYqKrjEkb1KiWt+olKg=;
  b=BnfzvBtgHBPupCINWsSfC9hIPXY6YcCwdlbx8H3g4BW9jWsnMZ3SK4pn
   ERp6ehYvynHRucY+hrv+aahtt1DXa7eSZBgBt1sVZ8aLNBdiyCt9QvMUM
   P6u2QdheMT8lbWJakfxDgv5JPDi+UwKj9W6c7bQB8yfIsHZu5RQIuM4v6
   iIYHVrsj1qoUipLzMp1jHSe/b+cVEYZkd45jx6P6wS0jNiRogESXV0InP
   TkF0X0KXcRX/KwzgSgozLEAeBxooerd4NjRhCP7BNjrBLk8+FmoywwbKP
   YAtNByIEethEMxKDI2u+JU0imp3WFHcnQlpsPEP3vajd6GlgDSw2dU8TR
   w==;
X-CSE-ConnectionGUID: CrlIPCd9QmGDPkEclk1XHg==
X-CSE-MsgGUID: K1eKyiqdRNaKVq2O+hbSkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="223371862"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="223371862"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:27 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7F29782008F
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:27 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 37FD48D29C9
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id D6B8B180714D;
	Thu, 26 Mar 2026 11:57:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/63] python3-bleak: upgrade 2.1.1 -> 3.0.0
Date: Thu, 26 Mar 2026 19:55:59 +0800
Message-ID: <20260326115634.1199-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125684

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Added adapter attribute to bleak.args.bluez.BlueZClientArgs and
  bleak.args.bluez.BlueZScannerArgs.
- Added bluez keyword argument to BleakClient.
- Added new bleak.args.bluez.BlueZClientArgs class.
- Added bleak.exc.BleakGATTProtocolError and
  bleak.exc.BleakGATTProtocolErrorCode classes.
- Added type hints and documentation for use_cached kwarg for read_gatt_char()
  and read_gatt_descriptor() methods in BleakClient.
- Added support for "use_cached" kwarg to read_gatt_char() and
  read_gatt_descriptor() methods in BlueZ backend.
- Deprecated adapter keyword argument in BleakScanner and BleakClient.
- Changed GATT read and write methods to raise BleakGATTProtocolError when a
  GATT protocol error occurs.
- Changed start/stop scanning on CoreBluetooth so that the isScanning property
  is not checked anymore.
- Changed BleakClient.write_gatt_descriptor() to raise ValueError when
  attempting to write to the descriptor 0x2902 (Client Characteristic
  Configuration Descriptor, CCCD). Use start_notify() and stop_notify() instead.
- Fixed occasional EOFError when disconnecting in BlueZ backend.
- Fixed a potential deadlock when turning off Bluetooth manually while starting
  scanning on CoreBluetooth.
- Fixed reading descriptors 0x2900, 0x2902 and 0x2903 on CoreBluetooth backend.
- Fixed cyclic references problem in CoreBluetooth backend causing memory
  leaks.
- Fixed typehint for BleakScanner.__aexit__().
- Removed undocumented/deprecated device keyword argument from
  BleakScannerBlueZDBus and BleakClientBlueZDBus.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bleak_2.1.1.bb => python3-bleak_3.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bleak_2.1.1.bb => python3-bleak_3.0.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_2.1.1.bb b/meta-python/recipes-devtools/python/python3-bleak_3.0.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-bleak_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-bleak_3.0.0.bb
index 03f2ed062c..d4cae1b418 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_3.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "5d76a62a549a4674c64ee151d38e2339e8ba948a"
+SRCREV = "f137b19257abe27b4700b5ab0f5303a1461f6c70"
 PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop;destsuffix=${S};tag=v${PV}"
 
 SRC_URI:append = " file://run-ptest"
-- 
2.43.0


