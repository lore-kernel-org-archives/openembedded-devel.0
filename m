Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7A1C3065B
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.167246.1719305853919167889
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d7xw9fb1;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305854; x=1750841854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JqoMfd3CIVYhktqXwTLZir/FQBJfnxuLb4G2BfO2iiA=;
  b=d7xw9fb1fKVN8jvrl2vgxpDI9ydNFSQZzKPXNnqXbb7ilxGwT2RWF2Dq
   2EVu4wBT+/sVxjhDTDYcAkOpuYuel/2pGdjHMtUFYUcesRWx2cgiOC/6o
   sd55p7l+YmIxeRFNGDoCBl9jwq8d+Pn6hv9AUlISVN0VF5GLj8J3sYcgj
   eiU/dMzXEfv6+TS07c2hdR3Bu4H5aI0teHlDKvlxK2zVdQg2OVY0H9Rxe
   yEuxmDmkv7NnSTFu9r23pkjJERpOW9p9kndZy6EYGzeANO8AiwdH9GB27
   LZkZnH08X3LNQka6eiS75Gb5x3h0lPE2d3zcKHFOa7vEawBbNTzls1zV5
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="143913914"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="143913914"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CA0EC68E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C5246D5043
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C853E36BE
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0A2011A0002;
	Tue, 25 Jun 2024 16:57:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/57] python3-redis: upgrade 5.0.4 -> 5.0.6
Date: Tue, 25 Jun 2024 16:56:20 +0800
Message-Id: <1719305790-11484-47-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-3.279300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNR9MesWtSDfshYU
	vvDR01qiY+sRBbQiIF+PQi9XuOWoOO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKJaf/8Uw5sGwgYUFsN5WfiFlwV2iaAfSWcURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrfIuB7DDa73vBSkVdIBIwrOj1sb0DYCy85zdWV4y+xakuI39OuP4vOGyBvgZrjgI0qIXj
	Z45EQhKwuOmAXMiYC5N4yMXUu7rSh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111061

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix parsing of INFO response
- Handle lists in the response of INFO

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_5.0.4.bb => python3-redis_5.0.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_5.0.4.bb => python3-redis_5.0.6.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_5.0.4.bb b/meta-python/recipes-devtools/python/python3-redis_5.0.6.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-redis_5.0.4.bb
rename to meta-python/recipes-devtools/python/python3-redis_5.0.6.bb
index 506e3bc1a..f9bd65dd0 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.0.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 
-SRC_URI[sha256sum] = "ec31f2ed9675cc54c21ba854cfe0462e6faf1d83c8ce5944709db8a4700b9c61"
+SRC_URI[sha256sum] = "38473cd7c6389ad3e44a91f4c3eaf6bcb8a9f746007f29bf4fb20824ff0b2197"
 
 inherit pypi setuptools3
 
-- 
2.34.1


