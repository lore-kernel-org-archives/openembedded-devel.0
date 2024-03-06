Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBD8C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:17 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7752.1709714652858751245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BfjWb7dX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714653; x=1741250653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RweqmBkA/NZ/7+VlY9moVOkqt8gmqsEinTCwmqNVYQ8=;
  b=BfjWb7dXrqEb4YdP0R5vb6ykdabb4WV6+pXrwSmaFYvfHZzUHfTiL7tG
   umMW3NPXk2Kpa6B/p0IsgBHP/u47bIqmQVlgjxpZxiuMiiWh4JcI5xk08
   eZQ3czN4ZQ1Eih0CYTtpox28EQPQJ9rOtj1kLHyfInC2fJiITk+uof0gb
   pZMTw9aMb7xItZFYzhH0sXuWk6VustbiqzJkokhyQmHC66V/aKaxzbYMZ
   1hFozlY6T6sUoOVRhxFkokKa+mirscc8zenR49Y9CqAEiFQ68KZ7mMFZk
   L3HoBFaDkMhrLKa951TNmmPKBHkGj+qPAEZh6w85eTNMIePlVd1tJFWTB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="151251569"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="151251569"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:11 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 87B80E9BA4
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C8CEDE6159
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 524A341189
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 06AB31A006A;
	Wed,  6 Mar 2024 16:44:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/26] python3-dnspython: upgrade 2.6.0 -> 2.6.1
Date: Wed,  6 Mar 2024 16:43:16 +0800
Message-Id: <1709714608-19296-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10-1.510700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNQpEZ+KiMsGrhUK
	FVP5dMig4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054/67wpKrIJNBkW2
	ooQJksHeBkESMI05d4iiOf1NDnCI+5UcZtwNsCroURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrT/dsB+KXqpbd7UUL3XrY8OltJHQd0nW5RKRnKTGDO/fNv0YYu7kk3BCBokh3757mfcir
	kUyuzGkZXL2pQBMP0PIOibg0Uw7jR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109154

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
-The Tudoor fix ate legitimate Truncated exceptions, preventing the resolver
 from failing over to TCP and causing the query to timeout [#1053].

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dnspython_2.6.0.bb => python3-dnspython_2.6.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_2.6.0.bb => python3-dnspython_2.6.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.6.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.6.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-dnspython_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.6.1.bb
index c01437183..13e31afe7 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[sha256sum] = "233f871ff384d84c33b2eaf4358ffe7f8927eae3b257ad8467f9bdba7e7ac6bc"
+SRC_URI[sha256sum] = "e8f0f9c23a7b7cb99ded64e6c3a6f3e701d78f50c55e002b839dea7225cff7cc"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


