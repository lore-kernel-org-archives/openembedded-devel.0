Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6607CCE8D47
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.11283.1726716762494441925
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s07zCeOj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716764; x=1758252764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VWXNc6NE4JVnl+8QGANS8hjEtUVbqg0RSjegJTgTi7I=;
  b=s07zCeOj0DpZzf/dH4bS5oEX4oqvuvPQM936WW0NL/cHithwLLPRgRpe
   WxCYgccsTQe6ayPUWE3cCYb1/3JP9lTYTa9bqVNLWR/1Cr74tV4DxWnFL
   JJMlFRy/Xj0UUtc8HHdaYdqFJa8zxgFHSycUS12dTH9N7cFAlABQ9x//V
   clpaUYHluTti3RLV3H2Rwmz56kSKDZGQjz7xgehpIdPujqj1i08wgDRmc
   g9cHBj+0HJ3dM8ZdlQh7sTFfRzoWZMBOEIIYuH0PHbLr6h0uLKqRVvVFN
   28uxj7Nx5sI7rEbi+TqTmt0Xx1h9xDg2TlCaAR1LBgad91fBx/ajxshGv
   Q==;
X-CSE-ConnectionGUID: qxnlXyEpTcG51wVwaS2VXQ==
X-CSE-MsgGUID: G1yvoUNKRJy62qeaSGu0nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="174141281"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="174141281"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:42 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 69722CC14C
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BBB6BF3D8
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FCF420086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CFA911A01E9;
	Thu, 19 Sep 2024 11:32:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 28/28] traceroute: upgrade 2.1.5 -> 2.1.6
Date: Thu, 19 Sep 2024 11:32:13 +0800
Message-Id: <1726716733-14548-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-0.550000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrSxj0b9FncUKdAuliTV06Ygbo
	TDS3zulA5gnrN1x1BGZBAiJopeTv0O1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ9v/
	ESKTjvdDSrIpwqACpfopB8fOwwjt1LxEFvMLiU99YKMMlFh4BnX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtNYgE/gtOle/0H241CeHz8ez3iMuC1OnYGfEr1UYM+4XKdYmqR6HRadYUy
	vG4sGYLpNLX3Q0sb5kNWN7IhyiT6OAfK1cLWG24HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112388

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Let getaddrinfo(3) select the default IPv4 or IPv6 protocol version
  when it is not explicitly specified on the command line

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../traceroute/{traceroute_2.1.5.bb => traceroute_2.1.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.1.5.bb => traceroute_2.1.6.bb} (94%)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.5.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.6.bb
similarity index 94%
rename from meta-networking/recipes-support/traceroute/traceroute_2.1.5.bb
rename to meta-networking/recipes-support/traceroute/traceroute_2.1.6.bb
index 862cba91e..b72c37540 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.5.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.6.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/traceroute/files/tracerou
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
 "
-SRC_URI[sha256sum] = "9c6c260d96eaab51e3ce461b0a84fe87123ebc6dd6c9a59fab803f95b35a859e"
+SRC_URI[sha256sum] = "9ccef9cdb9d7a98ff7fbf93f79ebd0e48881664b525c4b232a0fcec7dcb9db5e"
 
 EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
 LTOEXTRA += "-flto-partition=none"
-- 
2.34.1


