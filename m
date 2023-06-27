Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A21FEB64DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:35 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.7467.1687850065498359756
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="121818338"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="121818338"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:23 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1548DC68E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:21 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CF2ED5E87
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E22D88D20;
	Tue, 27 Jun 2023 16:14:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyzstd: upgrade 0.15.7 -> 0.15.9
Date: Tue, 27 Jun 2023 15:12:15 +0800
Message-Id: <1687849939-19941-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10--9.061600-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxf0yVReoVM7X12
	FqkuKWsgV6Ny+iZr9hcboCivyaDEEhNSYeRE3U64/sUSFaCjTLwejl8XURi8fBtD2wLcqqOwNZo
	vnhxzhac9IzK4Bhydgg3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbbW9n
	uzdghUMnp5QGOMb8EgLmth8cTQ473lRxm3A2wKuhRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07Xi4X
	EoPXecxpEfX4asNtmehYU/X5HJpYi3mSzqvzLIPxqPu/IxEdeo=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103608

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Add SeekableZstdFile class, it's a subclass of ZstdFile, supports Zstandard Seekable Format.
 Add mode argument to ZstdFile.flush() method, now it can flush a zstd frame.
 Add read_size and write_size arguments to ZstdFile.__init__() method, can work with Network File Systems better.
 Optimize ZstdFile performance to C language level.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyzstd_0.15.7.bb => python3-pyzstd_0.15.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzstd_0.15.7.bb => python3-pyzstd_0.15.9.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzstd_0.15.7.bb b/meta-python/recipes-devtools/python/python3-pyzstd_0.15.9.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyzstd_0.15.7.bb
rename to meta-python/recipes-devtools/python/python3-pyzstd_0.15.9.bb
index f132d91a69..81bffac3ab 100644
--- a/meta-python/recipes-devtools/python/python3-pyzstd_0.15.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzstd_0.15.9.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8458383225d7107f3383ee5c521628d2"
 
 PYPI_PACKAGE = "pyzstd"
 
-SRC_URI[sha256sum] = "55e503f28f5a9d225ce9d0639e3f5b1801bacace5aea926ec2998e73c5150fe7"
+SRC_URI[sha256sum] = "cbfdde6c5768ffa5d2f14127bbc1d7c3c2d03c0ceaeb0736946197e06275ccc7"
 
 inherit pypi setuptools3
 
-- 
2.34.1


