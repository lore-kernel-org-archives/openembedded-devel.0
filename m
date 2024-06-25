Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48172C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:04 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.166843.1719305815138398035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iGKcLOUa;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305815; x=1750841815;
  h=from:to:cc:subject:date:message-id;
  bh=dugFJP7y3aZdHhuQ3eG1l3yVaGFRGHs3ZuBwtnZ2YXs=;
  b=iGKcLOUastKN8++ffs9IPGw6HiZdZ8grKy7dbUKnlQ5Oi5Hb8TDoxEoA
   cGSAlehy5claocqe7WK3r9FPes/3KGKfcl/RHqKRs9n8pO9TnkiSzMhFj
   4wZcu68IFCpKrDyhN7cBuYT0frgTEBCnpM/uBddWpJC/YmN6ExxExPFMS
   pad0HZSIBllDMjlT0lP0Qoy+0ep6k6QTnpA+6zqoefvrUKp2YydaiysuQ
   6uK2MEJsE4O0zA86VftM95AadwhYnpvewb0xYoiJ6UhgmV4j1meJrZDn1
   rSzS93SlUw93XeognNTddqeBZ+oYjsGYlAG/RMbbeFAJB6GIkc5TsCWAo
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164920885"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164920885"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:56:52 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1691FD29E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 62018BF3D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E963BE2B14
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7758A1A0002;
	Tue, 25 Jun 2024 16:56:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/57] cryptsetup: upgrade 2.7.2 -> 2.7.3
Date: Tue, 25 Jun 2024 16:55:34 +0800
Message-Id: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--13.102200-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfO/u0i6nZyTEUL3
	5k/M4xajkHMaYUOh451mswo0f6meXa+CQswOit7P9DGkDtq4vAzb4QM/D7zGt3U98taw1P0pZw6
	SsjaUpAxEqN7T2mKo7N0nMZghwZG1azRKBa2deCfNgrlT5Ajc7ki8rgutezVpklYYeTornSTfsY
	Bao6qyZd0ye1XPq9U+9OIwD6WVVjdFeIgwm+98D/BvAgExIEumtkpWbH/Eii6U8ftiyKjZrdMjj
	wb9QfV2CC8aAmGeO6koJCyQaDuN7gH3QVwvWrgwEXjPIvKd74CHgDwpGasZ7Zsoi2XrUn/J8m+h
	zBStant2CRFHw6Iz/yAHAopEd76v4OplQxN7gRqtJf2tIJGHDr48Hmb4yDDhMV6veX5GwiSYGTu
	B02PnVw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111014

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Do not allow formatting LUKS2 with Opal SED (hardware encryption)
* Fixes to wiping LUKS2 headers after Opal locking area erase.
* Mention the need for possible PSID revert before Opal format for some
  drives (man page).
* Fix Bitlocker-compatible code to ignore newly seen metadata entries.
* Fix interactive query retry if LUKS2 unbound keyslot is present.
* Detect unsupported zoned devices for LUKS header devices.
* Allow "capi" cipher format for benchmark command and fix parsing
  of plain IV in "capi" format.
* Add support for HCTR2 encryption mode.
* Source code now uses SPDX license identifiers instead of full
  license preambles.
* Fix missing includes for cryptographic backend that could cause
  compilation errors for some systems.
* Fix tests to work correctly in FIPS mode with recent OpenSSL 3.2.
* Fix various (mostly false positive) issues detected by Coverity.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.7.2.bb => cryptsetup_2.7.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.7.2.bb => cryptsetup_2.7.3.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.3.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.3.bb
index 504c718b9..7c83fec43 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.3.bb
@@ -20,7 +20,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "219ebf74e8eddf96624a0376477e5a6f8f350a67aaf36e7dadb114d94b3afef4"
+SRC_URI[sha256sum] = "b772ae4f6df0cee7200b28cea960e4daaff2a203d2fd502beab3c1317b07a456"
 
 inherit autotools gettext pkgconfig
 
-- 
2.34.1


