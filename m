Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A6EC25B7F
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.10788.1715677835757955020
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jE8HKKfB;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677835; x=1747213835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Kjabdc380oYNh5UB9zUNLnbd2D8PZmNb/kLMDkMidio=;
  b=jE8HKKfBVfIxFIYX0qgMU9vyyXBgKVt0B7KaOhZ6Ni5T+L6tJ8RPxcJ1
   NfaEqLRLcf03rNzQQ9zTmTtCBjMfi8XCyr4/pxRxZ+QOmhoJMtahIIv40
   UxrZslKOEftK7+Ha4rqGVjjvnJx8FoshtkEWF5yLM0QZTl6XMZIDQL5dG
   ZBxitzbI5lF7Ujp5i5H4eSVFEU8bEZJvbka/tnuAnII67pSkiu61gqzyc
   TnnzD7jFCswyejryeYwbX79TxqssOs30NRJX/q4edZLIQCNCbArpwjk+Q
   m6+Gy2h0DyxElx8/Q3qwz93DLEriXGmAJ890zc65LX/jzJ/M51S8ZWlL7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="146707021"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="146707021"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:33 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 707B5D64AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A0F2AD9495
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 37B1A70BFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D92E31A000C;
	Tue, 14 May 2024 17:10:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/44] python3-bitstring: upgrade 4.2.1 -> 4.2.2
Date: Tue, 14 May 2024 17:09:50 +0800
Message-Id: <1715677817-2223-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-1.873100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLlKisHUuyTwi/33TWoSUH6uce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFMdhpsSzsZJetOqibTM/PNwpEM
	Nbody40jb7wk6ewAm4/Vuysh98KDZf9EY2x8+ZlH1pSgJTaFk3p0k/7dEfweaGtDRi6srQiOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110364

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 file type changed from "ASCII text, with CRLF line terminators" to "ASCII text"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-bitstring_4.2.1.bb => python3-bitstring_4.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_4.2.1.bb => python3-bitstring_4.2.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.2.1.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.2.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitstring_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_4.2.2.bb
index 8485e2e8f..feeed55c3 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.2.2.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Simple construction, analysis and modification of binary data."
 HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f7f2fd3f1cd52b5ccd39d76fb3568d3f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=661f450e2c0aef39b4b15597333444a7"
 
-SRC_URI[sha256sum] = "8abb5a661588c764bacf1a23d64c7bb57517d2841e3e6f54fb8c057119e0540d"
+SRC_URI[sha256sum] = "b40b01d911eebaea6efff40d826580806dced5e04b9d3cbad6aebf9422f4b643"
 
 PYPI_PACKAGE = "bitstring"
 
-- 
2.34.1


