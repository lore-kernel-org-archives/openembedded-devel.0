Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A652C54E5D
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8163.1710827211686371313
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p5ghMXbN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827211; x=1742363211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Lzkm+A5CEi2rIk9GljyR1nB9Zrw+Bxe5ysdPj+PMeqE=;
  b=p5ghMXbNMbX0Y0gmgCifD7XSIog0wmPDCeYstVNFUjWWv9mc+oJWWq2f
   UWGVdZcscnnZpgRiYpw4TZGn94hHz14DI8ytEpt7/u9tCdP+IRyc5kyui
   E1VdihYqHlCGCkleIpg7s3RBLGUju54Ldk8uEXKc4FX8dITw9aFRUm796
   mxkSMZC+ShPZCzKBHoWpvNYkiU8JGbcKirAHpfbkpULoVUk6qpc7+rbMG
   8KzzZ36Fu/ldxP5s1J56v+QQcAkCe87kbBdib8LhiIhRpUxqrfQ1iODwW
   IcgTwka8I7XRuLnHor8J+SfVIT1xiArcoGjSmGLsjoPFYc5Qcq1GudxFU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152144893"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152144893"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:49 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 80B3FD4801
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1C97D6229
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 47A052009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E4A011A006B;
	Tue, 19 Mar 2024 13:46:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/50] python3-pyperf: upgrade 2.6.2 -> 2.6.3
Date: Tue, 19 Mar 2024 13:45:27 +0800
Message-Id: <1710827139-30056-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--0.173800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytQWIO4YO+fPYjT
	aveC8xA/4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzWn/f/btS+dOM70
	OvJ00MxO23GXv2a2e6uGYQMeBt7UDEM/xZI50xzBCis9+JccDdXvkSIom4G3S76jERe0abd0wLe
	plgNLI0iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109455

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix mem_max_rss measurement on macOS
-gh-174: Support free-threading CPython by disabling psutil related
features

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyperf_2.6.2.bb => python3-pyperf_2.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.6.2.bb => python3-pyperf_2.6.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.6.2.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.6.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.6.2.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.6.3.bb
index 84c61ec8b..6b37e1864 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.6.3.bb
@@ -13,7 +13,7 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "64d8fadce6a74f478f29832c1eaa2a04856655ebff17292d5237fc8317c3a3c5"
+SRC_URI[sha256sum] = "9752fe749c21e460a564bb3f52fc319b892c62ee61c5138b4a9bbf94ad2755e6"
 
 DEPENDS += "python3-six-native"
 
-- 
2.34.1


