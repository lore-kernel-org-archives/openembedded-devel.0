Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF9AC25B7F
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:52 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10787.1715677833427102751
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uMGyRtJh;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677842; x=1747213842;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9B2UySLQDkvodf4T3M0e1YPAM8qN3iDoRN3obw5vpjQ=;
  b=uMGyRtJhSFaDZSbL2YRwznaJbQJ/hAajlAkTPp7tq/f/cwDZAQkfN4Mz
   lNY4G3N9JXvTVc1zEb9n8puMVcwX5wRbAy2OQ4Ilc36z4KyEjOlpRP1dF
   wq8VqlpdFw2dO2TUTHWg0mOQPjNpsSNNR+PBtIgwSJczLE0Ad+dP3mDGr
   5KL42uwfm68sy6vVZ/h6DnnI1VQVHevR2W27L7xBpcFqfGbfA1VEt3uZ6
   bxdgGQKH8zdVsBbEeQ2rYeUcDf3qith78XGmw64UdUuVS/JLpxoYSYTX4
   Y1w1dqbQWchfCOH8zHMP8dUNV4baTWjDg6QC06t5qguXeNY8d0LUXG+05
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="137527417"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="137527417"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:40 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 51CD2E8520
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BB051590F
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D49020076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BEE0B1A000B;
	Tue, 14 May 2024 17:10:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/44] python3-regex: upgrade 2024.4.28 -> 2024.5.10
Date: Tue, 14 May 2024 17:10:07 +0800
Message-Id: <1715677817-2223-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-0.188400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrHhysWPN3OziU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFMOBxO9BICzcdubxAMtJPeOU5x
	ThYbUyeMHWaJomLMcIndWrCn/mEfHG5brWC0sYU2r/PC5PZXm9+GYeOpatLMcziD3KBi0o7Ox9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110378

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 <time.h> now needs to be included explicitly because Python.h no longer includes it.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2024.4.28.bb => python3-regex_2024.5.10.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2024.4.28.bb => python3-regex_2024.5.10.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2024.4.28.bb b/meta-python/recipes-devtools/python/python3-regex_2024.5.10.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2024.4.28.bb
rename to meta-python/recipes-devtools/python/python3-regex_2024.5.10.bb
index 62c850dcd..a1878f9b3 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2024.4.28.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2024.5.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "83ab366777ea45d58f72593adf35d36ca911ea8bd838483c1823b883a121b0e4"
+SRC_URI[sha256sum] = "304e7e2418146ae4d0ef0e9ffa28f881f7874b45b4994cc2279b21b6e7ae50c8"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.34.1


