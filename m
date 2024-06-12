Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87ACC2D0D1
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2439.1718161129589719728
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tsEaDwxP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161130; x=1749697130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2Mu0wPLpHJxpzrfQ/bd0L5qycBYr+KDzTSdaeSjT42o=;
  b=tsEaDwxPECDgtNhmuOOfeUhD/rMF14mkM/80tKSl5kxB37CZqBGy4NOq
   l3vlkGZ9aMck/DWef4OD4epwuB1zm1jtxViVe1nG+Wx5Js9GJvLDBSY3y
   csKYGblMvObFPfKVVn6bcBeffo61vWudvr87towos00MEPYv352JWHfgP
   HDucO43uJ6CIJ1eQDHCVprLnoGIyFPieMPWZWTZ30+nEeUf9ZDiqnUVsW
   ZF8dbpG7QPnkwrTpi4yd4jBdKYqqbJGssnKzFWQulGxvrhNQJ/7So+LUW
   lKfgk+XNS3TLIdpN/xrw2j2BVy2hC3ibFm6ImClKsaQ/xcqm/CwLr6YKX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="161975293"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="161975293"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:47 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 51006C9444
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 97EC4D0900
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B8B2401E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BDEE71A0002;
	Wed, 12 Jun 2024 10:58:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/43] python3-pyroute2: upgrade 0.7.10 -> 0.7.12
Date: Wed, 12 Jun 2024 10:57:58 +0800
Message-Id: <1718161096-29710-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--2.713100-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrXKb6k/oWKMJ3Y7kpVKWrn0JL
	NSh4QSBd1c08Dpdkv0bz0H4PmSyBaf12TsqRMnfHxDiakrJ+SpkUi4Ehat05499RlPzeVuQQ7v0
	MlFSLfmlNDQmQ8bbzvxr4VwoL73EneBzEkCCpnRm3D7EeeyZCM6fsLRmAbkUumyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1Pk3z4QFFAMai32/KcMY1BUW6XezZ2ftiBnm/e1O/gR50DtqovdAI8ZLyg
	OGO+HkRu3oAd5ORw0soukCbdlauwwwSJFNjeEUhgle0oHY5RttTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110861

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- cli: move readline import to the script
- ci: update tools versions
- ci: generic make test target, update docs
- ci: rename Linux python sessions in nox
- nl80211: decoder improvements
- remote: fix dump() on RemoteIPRoute
- ndb: add ensure() call
- ethtool: ring support
- ndb: fix FDB records index
- ndb: fix sources objects counting

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyroute2_0.7.10.bb => python3-pyroute2_0.7.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.7.10.bb => python3-pyroute2_0.7.12.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
index 740a6d7f7..3ea980f44 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
                     file://LICENSE.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache-2.0;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "cc2f90aad1517cb0b301041f678cc8d3c3427c26e53f15c78c93c67928d89a02"
+SRC_URI[sha256sum] = "54d226fc3ff2732f49bac9b26853c50c9d05be05a4d9daf09c7cf6d77301eff3"
 
 inherit setuptools3 pypi ptest
 
-- 
2.34.1


