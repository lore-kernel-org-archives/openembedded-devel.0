Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEBFCD12A3
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:44 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.39473.1711983094575666180
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qdkc/ADu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983095; x=1743519095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1YVnL4qHSjpkcFiuZyJWis7b9dKGhCOIGVolNW1Cpsc=;
  b=qdkc/ADu2M2xuXWSJpYt5E1DalHQqn+BZUwHne0T6OEZzW/FOWgsJMRi
   Hpd7iKe72339mJTED9SKXzdjlYqFGWKwphzDMFmGb3CO3Nd3KV0o2N3kF
   vGFRdAwRfgmawDJQQNmpcnHCYC3/ZgXknUW+J4fLymW+B+SWZJWvEpu8a
   hDITDIJk2sxoy8jdLfi/j1Aeo4cFFfD4J71F/xTH/n5pqlCdCyw4Q8GRM
   VxH05e/khU88YRL9Mtaeg9bpWxgIn8gqai0Un5t6QaYNRHdaVTGJtD3GA
   j4Uy9RIx68oWjgIz/7fiC+4FuZxAuIcwpfLTBtU1exfJ17rHKouCYCY8x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="153710753"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="153710753"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:32 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C1E5AE8CC0
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F131CCF7C2
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8269620093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 38DAF1A000A;
	Mon,  1 Apr 2024 22:51:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/47 v2] mcelog: upgrade 197 -> 198
Date: Mon,  1 Apr 2024 22:50:41 +0800
Message-Id: <1711983079-16849-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-0.083600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2ud6Lv9qI8wH8OJmY4XRXkVuce7gFxhKa0BQOqUsWgx5sEguqiGeZ5Jo8W
	MkQWv6iUCY+lsYFiWG+TCMddcL/gjxlblqLlYqXIrar/4VDoGOCHMFdUKCoVQwvBrgiNeLg4J2+
	vP0wYGM/2UsEuX0bP7A31kBaW8rLEY++cP/sq+sL5dAWAIgDOiZ0UV+BEzJwD+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109727

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_197.bb => mcelog_198.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_197.bb => mcelog_198.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_197.bb b/meta-oe/recipes-support/mcelog/mcelog_198.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_197.bb
rename to meta-oe/recipes-support/mcelog/mcelog_198.bb
index 51d96b56f..e302f4175 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_197.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_198.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     file://run-ptest \
 "
 
-SRCREV = "20dc4373b7e04b00a6bd9f55446486df194b82ef"
+SRCREV = "ab58f07b9b1a4456fca0f5f41639d5cbecc80e36"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.34.1


