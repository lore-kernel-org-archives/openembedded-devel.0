Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E648EC4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:16:33 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.45938.1702599392037690115
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="143420155"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="143420155"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:16:29 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 59186D9DAB
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:16:27 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C63BD2BA8
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:16:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BE3C2FC6EFB;
	Fri, 15 Dec 2023 09:16:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-keyfile: upgrade 0.6.1 -> 0.7.0
Date: Fri, 15 Dec 2023 08:16:17 +0800
Message-Id: <1702599377-1503-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28058.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28058.003
X-TMASE-Result: 10-1.534200-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhKoG
	E2MCfRXoeNwTkAnhVbMEzrb9UGg5KwciPhpYUztE031Nfxfj2zPFmmMdIwjrDqILsEPieIGYBAV
	MudebvJjgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZDr5YGKfVA0WIwP
	rAH8iLMhab+AC2MJ3sBhQWw3lZ+IU7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTt+gmVy5VdZklCUNdMiSOqSgdUOtAqXnnEYgRo5FRoWxFkOD1FNa0DkBl4zQ4mGjvGvavW
	8pVJYfPZloEnz8Sjbp0br/p8IGdpDKguxNCuYnLyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 00:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107468

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
    Copyright year updated to 2023.

Changelog:
============
-Use correct default parameters for scrypt
-Drop python 3.7 support
-Checksum address when creating a keyfile
-Merge project template updates, including using pre-commit for linting.
 Add typing.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-eth-keyfile_0.6.1.bb => python3-eth-keyfile_0.7.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-keyfile_0.6.1.bb => python3-eth-keyfile_0.7.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.1.bb b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.7.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-keyfile_0.7.0.bb
index 55ab1a78d..2afc288bc 100644
--- a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.7.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "A library for handling the encrypted keyfiles used to store ethereum
 HOMEPAGE = "https://github.com/ethereum/eth-keyfile"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2beaef1b1764f4d6b46084c885b4bcad"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "471be6e5386fce7b22556b3d4bde5558dbce46d2674f00848027cb0a20abdc8c"
+SRC_URI[sha256sum] = "6bdb8110c3a50439deb68a04c93c9d5ddd5402353bfae1bf4cfca1d6dff14fcf"
 
 inherit pypi setuptools3
 
-- 
2.34.1


