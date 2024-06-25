Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34646C3814E
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:05 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.167223.1719305823780712675
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Yfk2W9s0;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305823; x=1750841823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zh6pYk9fW7AgeyvgCZOYavwC0Du2TQGsomf/fqBvYlE=;
  b=Yfk2W9s0eVoa+iLi5PBiuD6O6GmmsKwqOlW7+5ht+a6LucmMOU9wIgFA
   5AomNxC51G5xqrQ+T7q+QwSBGu1yKtDpoa9qBZVfSN3FK5LjaxaFhREJC
   6vQmVhD6eYEOzXDWwGKvZ+AsJCOZ+bJlf/24pPDYkHrWjyeOMxsOTKDQR
   5UQeROI5bvHwfeAT/XIcyg+IzLHhhM5YlBZ0UWB0dWzBoElxp8s02wBHd
   tTpiXCwAHizPGW/flqCpGdcsvdQaysUf1Y64lZVZY9QMWv63/wiySm4oF
   mCIur3gJ2ZCwhJUn7l3lkVRk5zCI8x43miUMfrUhgE5xIEf367e70TDcb
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="143913861"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="143913861"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:01 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 86F7FD2AA6
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D33BED73B6
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D04D2007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B4B61A0002;
	Tue, 25 Jun 2024 16:56:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/57] libfido2: upgrade 1.14.0 -> 1.15.0
Date: Tue, 25 Jun 2024 16:55:48 +0800
Message-Id: <1719305790-11484-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--7.694700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yXg2y0j5vXZGlEDhvi2wR872vZJBkyMEFFQj
	ex2nn0pfOuzeNmOGKnOmvOys6ucZphTfVlVWxWRBA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYg5iBOE74OZf3PhwfmFb3pg7Cl8sx4HBG/ioIsi7Sa0gpS6t4C9cuqajxY
	yRBa/qJcFwgTvxipFajoczmuoPCq3rpwyu/j8hTJ2lmMAuSz4S8YlM631FymnH1ervkfc1kA1Zu
	mpJquMt
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111027

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
============
* 1.15.0 will be the last release to support OpenSSL 1.1.
* bio, credman: improved CTAP 2.1 support.
* hid_osx: fix issue where fido_hid_read() may block unnecessarily
* fido2-token -I: print maxcredbloblen.
* hid_linux: improved support for uhid devices.
* New API calls:
- fido_cred_set_attobj;
- fido_cred_x5c_list_count;
- fido_cred_x5c_list_len;
- fido_cred_x5c_list_ptr.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libfido2/{libfido2_1.14.0.bb => libfido2_1.15.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libfido2/{libfido2_1.14.0.bb => libfido2_1.15.0.bb} (81%)

diff --git a/meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb b/meta-oe/recipes-support/libfido2/libfido2_1.15.0.bb
similarity index 81%
rename from meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb
rename to meta-oe/recipes-support/libfido2/libfido2_1.15.0.bb
index d453d0ab9..74844855d 100644
--- a/meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb
+++ b/meta-oe/recipes-support/libfido2/libfido2_1.15.0.bb
@@ -7,10 +7,10 @@ LICENSE = "BSD-2-Clause"
 SECTION = "libs/network"
 DEPENDS = "libcbor openssl zlib udev"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5f14cb32bdf2b87063e0a2d20c4178d0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=20be19aaa222f71738712b26f7f8717b"
 
 SRC_URI = "https://developers.yubico.com/${BPN}/Releases/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3601792e320032d428002c4cce8499a4c7b803319051a25a0c9f1f138ffee45a"
+SRC_URI[sha256sum] = "abaab1318d21d262ece416fb8a7132fa9374bda89f6fa52b86a98a2f5712b61e"
 
 inherit cmake pkgconfig manpages
 
-- 
2.34.1


