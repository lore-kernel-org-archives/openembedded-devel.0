Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23073C7EE32
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:56:37 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.6063.1684997792865584192
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="96646704"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="96646704"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:56:30 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EFFEFD772B
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4146DD3F37
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B37392008FF89;
	Thu, 25 May 2023 15:56:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libirecovery: upgrade 1.0.1 -> 1.1.0
Date: Thu, 25 May 2023 14:56:13 +0800
Message-Id: <1684997777-2061-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
References: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10--2.978600-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yUIIxwDaU5mrMVx/3ZYby79BDVeC8J7uwX65
	Kljee65HA/oe4NwFf2oQS1IvrrqoTLtTy6WGGDaTNc05u0K9Si18xLLlQC/2g54Q+L3BXIWuYFd
	MCgUN6LmKbJjRgBP8qeYUgrf7xhtX5FkPPdpxU8zaHU/pMDSkGxtuGFXrmRpjvn+2qfQyWg0C7Q
	L/G+H9KIHA6IBd3vQsgGVeIpxwxYA8g1fEYZ382yrLqyE6Ur/jN5dqZcIK7Vgg9R3V8qg5xL8FH
	rw7frluf146W0iUu2s0FJKIRy8cWueKNmNNd29XaDCzqDR7DPZOdKnCeVjjIZsoi2XrUn/JQYMO
	RuDWAmTfaY87m2dqxydET58jp62SBYt8xq76hORc4jiULMkvqXihz4G1S7IgMe6Tt/i8xu4Um6e
	Z9r6kARnjqO/wFSm6zUl8Rbw9gFXHOZWSsTBOZnz+oMysWlBjS7+RMq/2CK6rA4c7UV2fQpvi2P
	QO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102813

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Changes:
  - Remove duplicated thread/collection code and use new libimobiledevice-glue instead
  - Add new `irecv_send_command_breq` (for M1 restoring)
  - Add new `setenvnp` command
  - Add support for iPad 8 and iPad Air 4 models
  - Add all current Apple Watch models (device lookup)
  - Add support for HomePod and HomePod mini (device lookup)
  - Add support for Apple Silicon/M1 Macs (device lookup) and remaining T2/iBridge devices
  - Add iMac 24-inch M1 models
  - Add iPad Pro 11-inch (3rd gen) and iPad Pro 12.9-inch (5th gen) devices
  - Add Apple TV 4K (2nd gen)
  - Add iPhone 13 family
  - Add 9th gen iPad devices
  - Add 6th gen iPad mini
  - Add Apple Watch Series 7
  - Add MacBook Pro 2021 models (device lookup)
  - Add iPad Air (5th gen)
  - Add iPhone SE (3rd gen)
  - Add Mac Studio
  - Add Studio Display (device lookup)
  - Add device ID for macOS 12 Apple Silicon VMs
  - Add M2 MacBook models
  - Add iPhone 14 family
  - Add Apple Watch SE 2, Series 8 and Ultra family
  - Add iPad (10th gen)
  - Add iPad Pro 11-inch (4th gen) and iPad Pro 12.9-inch (6th gen)
  - Add Apple TV 4K 3rd gen
  - Add January 2023 Macs and 2nd generation HomePod models
  - [Windows] Add support for newer drivers
  - irecovery: Add new "--devices" option to list internal device data
  - irecovery: Output product, model and marketing name for device information

* Bug Fixes:
  - Send a ZLP in recovery mode if the buffer size is a multiple of 512
  - Make sure DEVICE_ADD events are sent to additional event listeners
  - [Windows] Use ANSI versions for SetupDI and CreateFile API to prevent errors when compiling with unicode support
  - irecovery: Fix sending certain commands

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
index dcce52424..240019597 100644
--- a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
@@ -8,9 +8,9 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libimobiledevice-glue libusb1 readline"
 
-PV = "1.0.1+git${SRCPV}"
+PV = "1.1.0"
 
-SRCREV = "ab5b4d8d4c0e90c05d80f80c7e99a6516de9b5c6"
+SRCREV = "98c9f7055ec1f2e09fac69ef1413a8757113b838"
 SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


