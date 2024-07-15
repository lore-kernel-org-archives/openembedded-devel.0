Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C9FC3DA5D
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:02:55 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.33823.1721034173910166008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aBfjD39/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034174; x=1752570174;
  h=from:to:cc:subject:date:message-id;
  bh=D7H6fwpFOV2jviuKs7GZzaF92DM826Vw1FxBJviAO78=;
  b=aBfjD39/fsCkkan6JK0CJz5YgOpBna+8usO76dyrJvzyo3uzGQpEx6mr
   OeAAptUeWG643EQOXfYpjDrS8FF/rnhIwNhAq3N0ao3zx6QkrFUuw3UwC
   X+/OoPQrwoJD0hCSeyo/mKFWHohP/I+1Rm+7bjk/rmmaPvgYIQT5iCiHm
   14LNGzO3Z1YMuHJ61pEDifDcAJuUeRr3ZxCYJXGu79TStsPPsJHKI69me
   6ASpqLenchAoyqnlbfjZt8Uwsl45vd9k9Pa2ExWviTzKOPexpS7Ahx2bY
   v5iHBS6HV45ha3xTCaa1nYhsgPzKQwPeyHn9LIeppu/HpI7lou1BFrVSA
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="146374017"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="146374017"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:51 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D0F7CD6DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8CE16EA42
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D91E320076D10
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 87D4C1A000A;
	Mon, 15 Jul 2024 17:02:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/38] botan: upgrade 3.4.0 -> 3.5.0
Date: Mon, 15 Jul 2024 17:01:54 +0800
Message-Id: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10--1.169400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhM8L
	GTNFqWKajf84k1uW53goJCyQaDuN7u1a16oqp8B1/HTKStsDGMLBOVz0Jwcxl6vCrG0TnfVUZYw
	vxnUY2YtlFSORUVE4XplPyeZmj2J3eBzEkCCpnRncgUVP3Cp+vQKA9ZJkcOhmmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1qEIT8PGyW77OL2eZn9SHtp8xDnQ+SK/hLa7HgMXuuujk8FIB00GHQbozc
	HUfT7dYYsoXip3H+LyDc8hSHeZ5/VbL3nEL9WVdjiDf2NCMWE1TyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111322

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
==========
* CVE-2024-34702: Fix a DoS caused by excessive name constraints.
* CVE-2024-39312: Fix a name constraint processing error, where if
  permitted and excluded rules both applied to a certificate, only the
  permitted rules would be checked.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-crypto/botan/{botan_3.4.0.bb => botan_3.5.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/botan/{botan_3.4.0.bb => botan_3.5.0.bb} (87%)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.4.0.bb b/meta-oe/recipes-crypto/botan/botan_3.5.0.bb
similarity index 87%
rename from meta-oe/recipes-crypto/botan/botan_3.4.0.bb
rename to meta-oe/recipes-crypto/botan/botan_3.5.0.bb
index 8cd1aa64c..d0e9d3e10 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.4.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.5.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Crypto and TLS for C++11"
 HOMEPAGE = "https://botan.randombit.net"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=f5254d3abe90ec5bb82c5694ff751546"
+LIC_FILES_CHKSUM = "file://license.txt;md5=573e74513ae3057b04757df65b537de0"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[sha256sum] = "71843afcc0a2c585f8f33fa304f0b58ae4b9c5d8306f894667b3746044277557"
+SRC_URI[sha256sum] = "67e8dae1ca2468d90de4e601c87d5f31ff492b38e8ab8bcbd02ddf7104ed8a9f"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.34.1


