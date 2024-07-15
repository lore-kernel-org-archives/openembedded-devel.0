Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68A9C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.33826.1721034177807152453
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LG3qzBWy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034182; x=1752570182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=x62qoG/+4Cw7+PTjjwrKo9ql5Wj3iajSygWeZj9MzaA=;
  b=LG3qzBWyrUdEL+7dor1UW24x+wZwpGHZI82M3qztA8RjXvQK7w9SQt4B
   5TXRvtWlsnhSBSIWlEbynvyAl1h39MS8X0I6QIPZDg3COT1l4DSqcDEKb
   x9w2shNs9ipvosSmZtsvFnn1hWxoVJavUjx5zJfpIz1igZa5z88A36SZw
   xoSBKJqqCCxTxpgfvOZM7nJzd/JYMdxtfRML1clnuxQukXssfgNLl4nVl
   fDL0YNQzsOJD9nXNoz0kvYW+YO22xgLc8KX4tKvuxH3ozM+Wis21364yN
   dZQ0LYIFCpwGxUInF3yowvjBQZJpaKvkv8w0o2kttAkaWfTds//plIktx
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="168833506"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="168833506"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:00 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B9BED29E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 65543D7483
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E91FC20071A3B
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B57501A000C;
	Mon, 15 Jul 2024 17:02:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/38] python3-portalocker: upgrade 2.10.0 -> 2.10.1
Date: Mon, 15 Jul 2024 17:02:17 +0800
Message-Id: <1721034151-540-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10-1.538400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvNuS8Amg5D32c8L
	GTNFqWKa4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFHUM+8CzIVw4dC3z7M6PFX01IM
	2KnX7VprMxIHJoNPxz14yHL+r9fpgTu+MTrVakCys4rULcjaW57MnzUe84KCCzTRtE1cX+eOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111340

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- increasing the timeouts to make the osx tests less flaky
- Fix spelling error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-portalocker_2.10.0.bb => python3-portalocker_2.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python3-portalocker/{python3-portalocker_2.10.0.bb => python3-portalocker_2.10.1.bb} (89%)

diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.10.0.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.10.1.bb
similarity index 89%
rename from meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.10.0.bb
rename to meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.10.1.bb
index 12d1025d0..8c03398ed 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.10.0.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.10.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=152634da660a374ca18c0734ed07c63c"
 
-SRC_URI[sha256sum] = "49de8bc0a2f68ca98bf9e219c81a3e6b27097c7bf505a87c5a112ce1aaeb9b81"
+SRC_URI[sha256sum] = "ef1bf844e878ab08aee7e40184156e1151f228f103aa5c6bd0724cc330960f8f"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


