Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2544BCFD37B
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:13:18 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13208.1764061996922692852
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:13:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JAUB8qRa;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764061997; x=1795597997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KCdheCi3nKRSmGfrlbXZ9DITxYknQWENZKBndQcO4wg=;
  b=JAUB8qRa2WVarBl/Vxd3h8ERjHJQO8a1mb7gmlZAfM8WMeurfHvrADjp
   HsgKljiFb4kPLacufsfus/Q1Jof4zMLD1pr+CfmhPxL9TUHYUqMiZGRgB
   bsYfa9jnxskJUFwFzQc7AHIZIxIKJJXCfy8y74yy6WL6t8ofZKjs4lULM
   zGmTxWZ5eWiWSsqp4jCC4FgFcyLRAu4GJoCD30hACqh3gVrHc0oChXMIt
   X91hacI4wjxHvvzSKX1uZV9XrqM2ufpaCvom0zbUCRMVqjucBa3qo7Qvo
   c4lWvGV7WccTHlpAnKIgJvIYRQgq3xhbD/VGfGKM3pQ7Ko/fUgtyw4oII
   g==;
X-CSE-ConnectionGUID: ZN401k/VQ6C8qpsji82QMg==
X-CSE-MsgGUID: rAP7e5U2TCGPf0oWKgsFIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="224149505"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="224149505"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:13:16 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 73A261407
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:15 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2E4FDC01283
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id BB9E114001E4;
	Tue, 25 Nov 2025 09:13:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/26] python3-bleak: upgrade 1.1.1 -> 2.0.0
Date: Tue, 25 Nov 2025 17:11:43 +0800
Message-ID: <20251125091156.1376-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122037

From: Wang Mingyu <wangmy@fujitsu.com>

Added
------
- Added bleak.backends.get_default_backend() and BleakBackend enum for a
  centralized backend detection.
- Added BleakClient().backend_id and BleakScanner().backend_id properties to
  identify the backend in use.

Changed --------
- Use "AcquireNotify" rather than "StartNotify" for Linux backend on supported
  characteristics
- Allow multiple calls to disconnect() on Windows to align behavior over all
  backends.
- Raise new BleakBluetoothNotAvailableError when Bluetooth is not supported,
  turned off or permission is denied.

Fixed ------
- Fixed potential race condition causing timeout while connecting in WinRT
  backend.
- Fixed file handle leak in BlueZ backend when D-Bus connection is lost and
  re-established.
- Fixed crash in CoreBluetooth backend if an ObjC delegate callback is called
  after the asyncio run loop stops.
- Fixed possible deadlock when starting scanning on Windows when Bluetooth is
  turned off.
- Fixed "Bluetooth device is turned off" Exception on macOS, when a Bluetooth
  permission request popup is shown to the user by the OS.

Removed ---------
- Removed support for Python 3.9.
- Removed support for macOS < 10.15.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bleak_1.1.1.bb => python3-bleak_2.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bleak_1.1.1.bb => python3-bleak_2.0.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_1.1.1.bb b/meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bleak_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb
index a532a520e7..161b21b88c 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "2564f9162c46f451db8067930637f30487315f7a"
+SRCREV = "718e5d76cd051910a9d5266266af632c2529c03c"
 PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop;destsuffix=${S}"
 
 inherit pypi python_poetry_core ptest-python-pytest
-- 
2.43.0


