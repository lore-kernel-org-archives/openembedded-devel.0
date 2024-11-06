Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D45D29F92
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:44 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.40144.1730874699370932820
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tZLOzsVJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874699; x=1762410699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LhIUkUG2+nMPRrzgdRB6RcS6fwSlA1ViaIOnWY3Y620=;
  b=tZLOzsVJCEfO10/J6b1O0yVgOXOTUCHsg1XXUgjSSkklUgsKgAt0G0LQ
   oTqH5GSBc3BNqbKz8uC4/emmpXG77fw+rH5/MOoTwqchly9GOhQqRuHiR
   7jZPCtlbTYIkZrmLfgmE29CRIaG64Cw6XpFFZv6aGsdq5J3A5qzEFvgli
   QT3cb0WvaOsC7BuDUY7dFnRamnTVyMgYTK2QIk7ncdGGj6cxFBuaDFYS5
   aVs7pLf5Nc/iG+kOPhukCteJbzbmUsGMW5oedsxItC2xAt897p1Y1pSy+
   adrXOkEz3iO0sNMzrCm7lF9tQauU2tWrlbZfV0SCC7QKD/oRSyg3FFreX
   Q==;
X-CSE-ConnectionGUID: Knby49gfSNyyco3pZ+LhKA==
X-CSE-MsgGUID: jwCBzrN1SX+aSQ7Ikr/6oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="158275463"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="158275463"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:36 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F2C4D4F58
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FAE0D3F08
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3533F6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D84FD1A000A;
	Wed,  6 Nov 2024 14:31:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/46] python3-tqdm: upgrade 4.66.5 -> 4.66.6
Date: Wed,  6 Nov 2024 14:30:52 +0800
Message-Id: <1730874660-2364-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--0.693600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mr1MQptE5i65CU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKqJFezBs6Xg0vmXYP8Qs0Q/dsYy9mZYMsGR/
	nO9xRIgAJIC8Ky9NdQIcAgPvjYm7M0pNhcPX/X7dLxPQtq+USgnWz2dI0Z1pb+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113724

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- cli: zip-safe --manpath, --comppath
- misc framework updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.66.5.bb => python3-tqdm_4.66.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.66.5.bb => python3-tqdm_4.66.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.66.5.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.66.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.66.5.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.66.6.bb
index 409936d5c..3e91a63b2 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.66.5.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.66.6.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=42dfa9e8c616dbc295df3f58d756b2a1"
 
-SRC_URI[sha256sum] = "e1020aef2e5096702d8a025ac7d16b1577279c9d63f8375b63083e9a5f0fcbad"
+SRC_URI[sha256sum] = "4bdd694238bef1485ce839d67967ab50af8f9272aab687c0d7702a01da0be090"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


