Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CF7CFC500
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.50330.1728896158310042178
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O8x4Bjlq;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896163; x=1760432163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=m6QQczOPbVXJ8xWS2vJC1Wb/Ndrb43eTjSAo5YaNjFs=;
  b=O8x4BjlqAXSVU2ECYH5+8rD8l3bvwPx2ZGzzeszoz++TtT3F4xgvOZfR
   3w1K7ddDAvrrZnrfzQvLSSSAUuc4ee6NxlbZ+UuyRr8Dc3jxStugUP8o/
   p+Iv1pAWr3MQDhIff62ZGOnStQEBKCRSDM0UVpVaJYIOhAcacUnQFhCmc
   YHcfB5WuuF5SB32JQ4uVRK5Y40TsrHPvwe0oz6VU2cRNgL/atUIBWJwzL
   lyAK4IDxcgg98fgkz0qZleeljjcCYTkfz9yVHLmmErRxTnX09iA5fS8XA
   hUqZ6zAdqrVUB2FkQfpsPqToFmCUyGnLWdNujL+vJblApLsBlMAy6b9it
   Q==;
X-CSE-ConnectionGUID: p1dWZyY2QJ6h2IQJftqZMg==
X-CSE-MsgGUID: ggdJBLQ8SQy7H3lihe4y7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="165031661"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="165031661"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:02 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B7D7DD800F
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:00 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EFA0AD4BC7
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 85EAB6B4D4
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 349451A000A;
	Mon, 14 Oct 2024 16:55:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/54] python3-cantools: upgrade 39.4.8 -> 39.4.9
Date: Mon, 14 Oct 2024 16:54:39 +0800
Message-Id: <1728896115-2944-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--0.747300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrmZiw53dqSN+YOldwn+9MqL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFOkHWsw8aiF0BXzOEfiMIVXXPh
	iOztPClsSilmQgRHQ6TokDFz7A4m1k8TiWItDkWPPVnkxG/gFhU0U/uoTOvtbRqPpAFyv1Fex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112866

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Modify the default version to be an empty string

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_39.4.8.bb => python3-cantools_39.4.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_39.4.8.bb => python3-cantools_39.4.9.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_39.4.8.bb b/meta-python/recipes-devtools/python/python3-cantools_39.4.9.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_39.4.8.bb
rename to meta-python/recipes-devtools/python/python3-cantools_39.4.9.bb
index da4f3b493..bf1b4867c 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_39.4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.4.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "933803afe97de91d927053b027e2a165e4ce891abf8e42d6b409a7b7dfefa80d"
+SRC_URI[sha256sum] = "5559da0a9b7a0f9e68eb8010b27615f7960be19656f4217374c76993c71f9167"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.34.1


