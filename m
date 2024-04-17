Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E517AC05023
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:27 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2748.1713318082239657826
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XzZ8BY7n;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318082; x=1744854082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9yUOKeHhNaKR3yhsBmxdvrtaPr1FSPMyIUVxDR0pUbs=;
  b=XzZ8BY7nEZXrDbjOUsmYASWi9Rb9TtxEfAQyxK8ic5scp3xXJHdHPsxH
   nyHI3Joz7x/SP+rigQ98EGIehtlvTIn0Qx9HaDE6/0lFoMegcZpTC5Cpr
   C30Sj3yF4KN4sLRAfvy6KYZTSGyif49X5On+ASFCStkX6fMs2RGUJI2sz
   rMKREMs6UA01yVbtyHY8w8R+ex1576gCG/X1sNVAHc2rdBwUbvz5q2mXj
   Py3w0UDb7kwkxX+pgZTPuSlIea93R/NrhVdT2qZD+SZpQoiHBaKbUzLBM
   Ar+QeH8Selo0pMVK4/OpaGty5k3obhLWyj2SJBqZr7TdEBpa8QupmsmmB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="144252828"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="144252828"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:19 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B6213E4EB6
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E9E7DE6182
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CA3D200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 19D011A0002;
	Wed, 17 Apr 2024 09:41:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/49] cryptsetup: upgrade 2.7.1 -> 2.7.2
Date: Wed, 17 Apr 2024 09:40:16 +0800
Message-Id: <1713318061-17128-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--3.004600-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvTL2GRHAc9cfcw
	yVYGZr7IHhnrN6LbNlGAqJGaQXFQnHYMpxnz5ObKSHCU59h5KrH/j4ZByyZz4gF2VtjSitPIL4i
	WHIqDKz7gK2NiZClvaQXURz+hQhGVWkIi5GvRHEqV4tc/M7dU0cE5XPQnBzGXR/IzlV+CMbZCrn
	SO+wN7nLF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlySIxjyMzYYgUEGzODefRya6yf/
	v3kGpBl8piq+6B5C3KNPf7J/mI5dEYhOCzHrxGOPPRJzTBu+qqGYfE+TZEixhSE3feW6emd/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109990

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix activation of OPAL-only encrypted LUKS device with tokens.
* Fix formatting of OPAL devices with 4096-byte sector size.
* Fix incorrect OPAL locking range alignment calculation if used
  over an unaligned device partition.
* Add --hw-opal-factory-reset option description to the manual page.
* Do not check the passphrase quality for OPAL Admin PIN,
  as this passphrase already exists.
* Update license for FAQ document to CC BY-SA 4.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.7.1.bb => cryptsetup_2.7.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.7.1.bb => cryptsetup_2.7.2.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.1.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.1.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
index 53162cb94..504c718b9 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.1.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
@@ -20,7 +20,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "da5d1419e2a86e01aa32fd79582cd54d208857cb541bca2fd426a5ff1aaabbc3"
+SRC_URI[sha256sum] = "219ebf74e8eddf96624a0376477e5a6f8f350a67aaf36e7dadb114d94b3afef4"
 
 inherit autotools gettext pkgconfig
 
-- 
2.34.1


