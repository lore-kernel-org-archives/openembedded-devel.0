Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1733C54799
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8726.1724833550442503744
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T+MLr9Va;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833553; x=1756369553;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JS5b9L3EzCfCW8mk2Zt3b7JwdH6NZ9sI3xwP+i8hUR4=;
  b=T+MLr9Va7acNBObGjgB9KHgXa9QVixoKJWwetX77LLEwbX4lwB5qyOC5
   fLulZPja6pZ2MkfWDhFmgH2m7An4OIEltLwo/mtPGYACxF6unKphpAD1g
   roQzqD/lLQZ96heVpTYWNiT9/7GX6qTE2rxS2GOhEfzK6NIEGScSjnpz6
   mbFgQ3M+KvCDD6S/cJwTJDnQCVkfYdWsRP5aHOb+hwhvyKYe0zfbFpykZ
   k6eUkfyy7+62pkWrA/s3HzqB4eOOzyQ/sOcUdyDXih5z1TGV8P+Y2uUyb
   +2HSlHz3buDiW2/WOzlq2NRM9oiiWBgxIrv3/OHhUIC8s3mASccMQOrqO
   A==;
X-CSE-ConnectionGUID: pkawjMYNReu9954C54vlcg==
X-CSE-MsgGUID: oJKxrPFMSwuR8R+7HltPZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="150902410"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="150902410"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:51 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B247CDB3AE
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id F0833D3F14
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 636BA2007B700
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0D8451A0002;
	Wed, 28 Aug 2024 16:25:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/46] python3-nocaselist: upgrade 2.0.2 -> 2.0.3
Date: Wed, 28 Aug 2024 16:25:07 +0800
Message-Id: <1724833525-2162-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--1.025300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mra9qiaDSLgo3DZ+9HI5nLbL4z
	fTpGjdba20BBp6/VCg91VEmx7sTk/+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKJY5Eh/SzoiVvu5Fhmz13fD3PhwfmFb3pg7Cl8sx4HBG30tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqth6/wq6FhmfUQ0vxFOn6kgETambQIGiyxOmfrtk4tSV42vub1QivVxsoFg
	xKpv5K6WdzoEmIorUMbYxJHC3XP4smKdAvldoKSHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112006

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Test: Fixed new issues from pylint 3.2.
- Docs: Fixed missing Python 3.12 in Trove classifiers.
- Test: Increased vrsions of GitHub Actions plugins used, to eliminate warnings about node v16.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-nocaselist_2.0.2.bb => python3-nocaselist_2.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocaselist_2.0.2.bb => python3-nocaselist_2.0.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_2.0.2.bb b/meta-python/recipes-devtools/python/python3-nocaselist_2.0.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-nocaselist_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-nocaselist_2.0.3.bb
index 913b8ac5e..a86945387 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_2.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "32708b700a1a53133e6bb5cc53332c9775b0c7c959a5f9725793171fd2f4c8a5"
+SRC_URI[sha256sum] = "55714da8433fb4843ce797404977e4385d5e3df9e4aa00f7dde983fd87410fef"
 
 inherit pypi setuptools3
 
-- 
2.34.1


