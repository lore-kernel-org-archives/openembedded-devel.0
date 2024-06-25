Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48167C41513
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.167244.1719305852975534140
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hARQDCKb;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305855; x=1750841855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eQVZ5gI/JeIbNM4O42w+BZwMIp7kLy2sWvbQ0MOHJfA=;
  b=hARQDCKbZNawK71nUSAnl92z5TlX3RoNryFEjdRzfO3g0X+BuQKkIF/p
   q0AkHuY5MWzDpZ8zI5pYhYz5gFMvXgY3DU28luFudl6pYgMVb0TpbooLQ
   neu4k5p4/EnA7p2w/4oQoOOHCeZv2vvdkDQDPMsiHHbSgrbmUIgu7oYa8
   PwL2kk7A+AnUKZcHeS4Z0OWeKS2bvKGtk9B6uuQphGYqVtuGhuemZ8tp3
   nA9pZV5LnLSk+0LzwBIc6IIm31rCeymflMV28/gaPDm9uzaAMDSNjIVy0
   6GB3oAGkhHdo5GhnTf+4B6bqvepzLKf7/02s8OLtzNGGQdKuYyXVxkA05
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="152254733"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="152254733"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:33 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E4D3AC68E5
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 28DA4CFAB1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id ABF8B2007CDD9
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 769B21A000D;
	Tue, 25 Jun 2024 16:57:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 49/57] python3-robotframework: upgrade 7.0 -> 7.0.1
Date: Tue, 25 Jun 2024 16:56:22 +0800
Message-Id: <1719305790-11484-49-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-0.532500-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDUIy2+6rlJrlp86jaIHTbswxtCZWfqt3bgqOZvqzwTxzYrSJ1o8igQe0LId6iPU/mRtvV
	yM0VozuMkk7RGXieT5X9CdiyufEl+qBBhtzPlTslPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111063

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-7.0.1.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-robotframework_7.0.bb => python3-robotframework_7.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_7.0.bb => python3-robotframework_7.0.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.0.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.0.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_7.0.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_7.0.1.bb
index beb71e6a1..9e81e8e7b 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.0.1.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "04623f758346c917db182e17591ffa474090560c02ed5a64343902e72b7b4bd5"
+SRC_URI[sha256sum] = "58d01b84cd7eccea69f2dbe13cbcbff1299e551168d3b88c25617b0c9d6ddc75"
 
 RDEPENDS:${PN} += " \
     python3-shell \
-- 
2.34.1


