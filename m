Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43B5CF64A3
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:58 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.48958.1727682233776334568
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VgJAi9XQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682234; x=1759218234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rXKUW60TOde7myyNeKkcD5UoFbvQwPU0AL5/72hIiP0=;
  b=VgJAi9XQAcy/nxy0OqlUN8oonp4pa2XkNmYXlOYZ+WtIjJaclDmpaYcX
   pSNRiXBmGfxFozJeJ3MXChGbdOP7v2oVxg08hlPp7RHSlyVHRMO28v/tk
   BSHaL/IRfvaZEYBUj7HyrTDYwp5nu8QJ1hgJblmgskwF1pWomIQAyhwPQ
   DgIvFVpk5CgBDvoGjton4q9ZOUWRDxpNXO46ipcY/XpdZ7UDok/D4B5+m
   BxRyxjRtLUYNEhV255QkM936cjsC5ceklZlCgc7tEa8reK44Sy7CLCeyO
   xGnvIKBdJXixBhw1IMQj2ZMSdkIlMrDdjI4Z1lNEDGr2WILYjsM+5zz8i
   A==;
X-CSE-ConnectionGUID: Av+dAkRGSIGTltvjGrDROg==
X-CSE-MsgGUID: hjiBFrN0TDWBl0qkcpzpig==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="175268005"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="175268005"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:51 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 87658D5A47
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CC9BCD5098
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B6CA6B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B7641A000A;
	Mon, 30 Sep 2024 15:43:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/40] python3-pymongo: upgrade 4.8.0 -> 4.9.1
Date: Mon, 30 Sep 2024 15:42:51 +0800
Message-Id: <1727682185-12664-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--4.427100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrKQNhMboqZlpzQVxkK1K6tm4g
	Ilffn9SY4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054zP3WYNhkszllNc
	WZ7137CiBkESMI05d4uuLFZZYlisfHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDXRqM
	t8od8RYesKmWuVCrcyMKCaDm9ymWHasG2W/TBL1qzi5CnmOcjYlAlGgqEFzfbak2dhTgkSUbwlY
	1oXsdhaX5ayDI8juA2qBBhtzPlTslPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112586

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added support for MongoDB 8.0 and Python 3.13.
- A new asynchronous API 19 with full asyncio support.
- Added support for In-Use Encryption range queries with MongoDB 8.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.8.0.bb => python3-pymongo_4.9.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.8.0.bb => python3-pymongo_4.9.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.8.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.9.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.9.1.bb
index fcce456d8..5064032bc 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.9.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "454f2295875744dc70f1881e4b2eb99cdad008a33574bc8aaf120530f66c0cde"
+SRC_URI[sha256sum] = "b7f2d34390acf60e229c30037d1473fcf69f4536cd7f48f6f78c0c931c61c505"
 
 inherit pypi python_setuptools_build_meta python_hatchling
 
-- 
2.34.1


