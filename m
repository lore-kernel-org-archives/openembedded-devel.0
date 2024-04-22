Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4466C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.14070.1713777366801755262
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EvZCh8PQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777366; x=1745313366;
  h=from:to:cc:subject:date:message-id;
  bh=mdeOqVf9Msep/eaSbVd9ZEqBSCGCFrMCwf5zUa6xY5g=;
  b=EvZCh8PQWwfxBEMJxUW667JKYv2XfDO1PnIjATb0OyJMEeNVshOglrEX
   6XITyIV5YgvvhUiC5G0Qvko96nyhIbis6BBmu6Dx9PKc4pUT2be7ewle2
   zEWNaxBSEbLI7CvQxMFRYHoonKa9Q5WkoOYps9A8k7kS+WXq5S5xKyb5I
   MzW5knRpFEvPwnRoQQtunF9Nr7on3Jd8aqd5l72I/HSm6GhE+pmBbJoSi
   H60tUwSZ1YMBiorkPOOFB1/cCZgETHqO7gzqtk7uFQ7DLXbRgi9IdArKt
   9VpAHiG7QWE3/ohLEtScJp4wYe6iTv0eFvJlfWPskWMNABhytEKVVS/0C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="135129190"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="135129190"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:04 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 26CE3C68B4
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 68ED9D974A
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CE41B20093277
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 786BD1A000B;
	Mon, 22 Apr 2024 17:16:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/15] asio: upgrade 1.28.0 -> 1.30.2
Date: Mon, 22 Apr 2024 17:15:31 +0800
Message-Id: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10--9.368300-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yXg2y0j5vXZGK2GKtdiFmTnozDhGeQC9EkKJ
	Pvbg1+THKqrQ7lLcMnyK8WnR386CVm0Xr+fj3ww/8t4fUUGeErSXBPRemiwRNb5/tqn0MloNvwU
	evDt+uW76cPlvDR88KWYhScJET1Is6WZ8G/zxUhMZgmFGHqyx6wb0cUpeyaMplXq0ftyjch1meC
	LE2iu14MGVcf4H/4NZfJL38u1VtO5bYReiGIHp2t0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTteLhcSg9d5zFyf7yzkAqGDL6Hm+FV6pheIlxH/tzUSsFtu4YGky7opg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110084

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

0001-Add-the-pkgconfigdir-location.patch
included in 1.30.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../asio/{asio_1.28.0.bb => asio_1.30.2.bb}   |  9 ++----
 .../0001-Add-the-pkgconfigdir-location.patch  | 30 -------------------
 2 files changed, 3 insertions(+), 36 deletions(-)
 rename meta-oe/recipes-support/asio/{asio_1.28.0.bb => asio_1.30.2.bb} (67%)
 delete mode 100644 meta-oe/recipes-support/asio/files/0001-Add-the-pkgconfigdir-location.patch

diff --git a/meta-oe/recipes-support/asio/asio_1.28.0.bb b/meta-oe/recipes-support/asio/asio_1.30.2.bb
similarity index 67%
rename from meta-oe/recipes-support/asio/asio_1.28.0.bb
rename to meta-oe/recipes-support/asio/asio_1.30.2.bb
index 84074400a..6930381ec 100644
--- a/meta-oe/recipes-support/asio/asio_1.28.0.bb
+++ b/meta-oe/recipes-support/asio/asio_1.30.2.bb
@@ -8,18 +8,15 @@ LICENSE = "BSL-1.0"
 
 DEPENDS = "openssl"
 
-SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2 \
-    file://0001-Add-the-pkgconfigdir-location.patch \
-"
+SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
 
 inherit autotools
 
 ALLOW_EMPTY:${PN} = "1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=ff668366bbdb687b6029d33a5fe4b999"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2bfc909e030aeafefa72f764165b8d07"
 
-SRC_URI[sha256sum] = "d0ddc2361abd2f4c823e970aaf8e28b4b31ab21b1a68af16b114fc093661e232"
+SRC_URI[sha256sum] = "9f12cef05c0477eace9c68ccabd19f9e3a04b875d4768c323714cbd3a5fa3c2b"
 
 PACKAGECONFIG ??= "boost"
 
diff --git a/meta-oe/recipes-support/asio/files/0001-Add-the-pkgconfigdir-location.patch b/meta-oe/recipes-support/asio/files/0001-Add-the-pkgconfigdir-location.patch
deleted file mode 100644
index 75f083b0e..000000000
--- a/meta-oe/recipes-support/asio/files/0001-Add-the-pkgconfigdir-location.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 248e87869d748cfb72d3a5d3b2b91ad178172e30 Mon Sep 17 00:00:00 2001
-From: Vasileios Anagnostopoulos <anagnwstopoulos@hotmail.com>
-Date: Tue, 9 May 2023 12:48:29 +0200
-Subject: [PATCH] Add the pkgconfigdir location
-
-This change is necessary, because while building asio in yocto the
-compilation is failing and is complaining because the variable is
-undefined
-
-Signed-off-by: Vasileios Anagnostopoulos <anagnwstopoulos@hotmail.com>
-Upstream-Status: Submitted [https://github.com/chriskohlhoff/asio/pull/1294]
----
- asio/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index b7760851..bc4f75b3 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,6 +1,7 @@
- AUTOMAKE_OPTIONS = foreign dist-bzip2 dist-zip
- 
- pkgconfig_DATA = asio.pc
-+pkgconfigdir = $(libdir)/pkgconfig
- 
- SUBDIRS = include src
- 
--- 
-2.34.1
-
-- 
2.34.1


