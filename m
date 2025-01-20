Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F1FAC0218A
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.32644.1737360863030440152
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F+sejvq0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360864; x=1768896864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jlCtbt6WmZ6Vy0tBThqC3Oyp/xceE95TEZt8qh283CA=;
  b=F+sejvq05FxCJM4J1UiGUWWJGtPP6EQIM+Yuk+ig64VjJO1ha1JmgJRL
   gupHYLF9wdm1eEVjX3dTxc0Is+e5cvFDKIUgfM4ItDUIzxTmVS7Rv8bw4
   2RqnzVwIvfcJbZydbaRd/XJeS6C/B7tO4UPCIemIk97Z2FUqLaO4/qztY
   oMXnchkeOl6XqYQM9/McvW8aFK1+rAwjWNVdKG4KVK+ycxkm3PkR95AMS
   /LRYhiiA48a4VedoUeohHuc28sNfqsJW9ewEVZzvrh839TzxTkwvZ0+OP
   MmxWNZFoxYwSBKpww4wK7wslhRiTcdzKoOrZ+Q5nBRQ8lI4BOmXZDFNjj
   g==;
X-CSE-ConnectionGUID: Db7+b+pkT5ixtGMbkStUyg==
X-CSE-MsgGUID: cp0y6ST9QzeFlk1DJCkA9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="186303500"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="186303500"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:23 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C761E0765
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 029D9D5077
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B28C6BAD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 37D911A0075;
	Mon, 20 Jan 2025 16:14:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/32] python3-twitter: upgrade 4.14.0 -> 4.15.0
Date: Mon, 20 Jan 2025 16:14:02 +0800
Message-Id: <1737360846-4824-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-1.161300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNRUjspoiX02FyYo
	EGemaF5QIL2JuJBXib0Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3iqbs
	+nJ/tFJH/0XMJYfpi/YX7AlQI2uSFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2eVW
	/ZdL52j09IfkwzNwL8T1Xx7g9tLv46N0NIhOX0k9hG2CpXXl1kmHkrLXQBa7drxDdJSETqJXRfB
	ZyGA+v5C8OoPwX3g/TQxBubYXI1wvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114992

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix error "No module named 'imghdr'" due to removed package in Python 3.13+
- Bump requests-oauthlib to allow v2
- Drop support for Python 3.7 and 3.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-twitter_4.14.0.bb => python3-twitter_4.15.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_4.14.0.bb => python3-twitter_4.15.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb
index 23ea996258..19c4b8680c 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python module to support twitter API"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=9;endline=9;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "1f9f1707d6972de6cff6c5fd90dfe6a449cd2e0d70bd40043ffab01e07a06c8c"
+SRC_URI[sha256sum] = "1345cbcdf0a75e2d89f424c559fd49fda4d8cd7be25cd5131e3b57bad8a21d76"
 
 PYPI_PACKAGE = "tweepy"
 
-- 
2.43.0


