Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22124D6DDC4
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:27 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.37272.1731922220708912832
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O9nq5QwY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922221; x=1763458221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5ZR5pQr1SAtHWC+WUJRH3W+RQzgd4onGNa4kHJKUNHg=;
  b=O9nq5QwYQyz10rC5EaCGHHwlIxsbMm3WegXnVW3xJfy9o0NYs4qDwWjq
   WKHiXI/ZRXqABQJwkREXhgpL2/y3o/u67CPACZhQ/EnCbKMUTRcTxVk10
   aOncNwj4GTj7AMhIDFKF1SRT5HOA+KGjCw2dGsBr91i6q92Y98lOgbVw8
   fhvyENqwThhDRw08iAiE+v91yUAc4tY+oJbW6+Dys2LfZR7v4FszmtkTn
   ekNZjbd5XQz2uGsA4NM/HkDtsi+HiwIUWhNrS35y7WBlR/MABUtnDPjPB
   /isCRWbQnI0ebsmeAZBlqPPY/Efb3sM1YdEMgUUYb3vmUWnXRDkAZNSSN
   A==;
X-CSE-ConnectionGUID: 5d51dDUbQH6iwQk+6OsCBQ==
X-CSE-MsgGUID: QqQS6DJUReSppAhFPbICEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="180826454"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="180826454"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:19 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D8FFD4809
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 30E7EE42C0
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BA86A20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6B0A51A01E9;
	Mon, 18 Nov 2024 17:30:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/32] python3-tomli: upgrade 2.0.2 -> 2.1.0
Date: Mon, 18 Nov 2024 17:29:50 +0800
Message-Id: <1731922195-5266-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10-0.782200-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mruoYFb0nRiqOawtBEBljY2b6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXI1tL7Qll5nRNYM5cNJuNv835Kxj5TCCZbWfm
	zF12YxdqubnkE1r79CMYxAYc5++PInFNAtwWCV9Jurf9Q16qkRmJwUOJ5Zy1H+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113893

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Instantiating TOMLDecodeError with free-form arguments. msg, doc and pos
  arguments should be given.
- msg, doc, pos, lineno and colno attributes to TOMLDecodeError

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tomli_2.0.2.bb => python3-tomli_2.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomli_2.0.2.bb => python3-tomli_2.1.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-tomli_2.0.2.bb b/meta-python/recipes-devtools/python/python3-tomli_2.1.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-tomli_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-tomli_2.1.0.bb
index 443b2af38..9f27bed9b 100644
--- a/meta-python/recipes-devtools/python/python3-tomli_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tomli_2.1.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "d46d457a85337051c36524bc5349dd91b1877838e2979ac5ced3e710ed8a60ed"
+SRC_URI[sha256sum] = "3f646cae2aec94e17d04973e4249548320197cfabdf130015d023de4b74d8ab8"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


