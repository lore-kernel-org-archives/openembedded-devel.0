Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EE6C2BA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.2486.1718161119342277914
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NXelWL94;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161119; x=1749697119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yxhc6anzGC4inIB6/77U55PUt5oLcDl9vVp/BuK8IuU=;
  b=NXelWL94vU8G2tTPPmtTCO/HXdeoGWpW/WYinoncPDruCf05n+XBUJus
   fQ0r6D9dYncV0TApgrUTc5WmH/tfP63ww+H7/u8P7AnUwrLLblOAkFY1e
   8hS6DbXbVFJsuFelM7549/GcLK5XA1zBpSJsBg0a4dM0o3AhqUlsvUeGZ
   YD9JOsMEY4lJtbBtPOZnWNDhfTdJw6H35nCcz75rXp+7YeqoTXFo41J+M
   V9kIDert3lWOHMoGcdABoHrl1thDTlvfn95ME73KPIsWKO5mbKD9C3R8d
   2CbVG0IHTjGJMrquO22jRb/UES04wytS+gWe6wVMlQQkWUn3oeFBt0tFq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="150161142"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="150161142"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:36 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 724E8C3F81
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B2D3811C5B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4960B20071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EBFA71A0002;
	Wed, 12 Jun 2024 10:58:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 04/43] python3-cantools: upgrade 39.4.4 -> 39.4.5
Date: Wed, 12 Jun 2024 10:57:37 +0800
Message-Id: <1718161096-29710-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-1.499100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNR+ovg8NDYPAr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFJNobd0vzydYOoNVxm+R7/qVAD
	/yk8plqvCWR/L1Cpdw5j1T5S5JhxUc6N2EOtlotn2lf0em+hEOLuTonEXzI2iRABgES1dM0ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110841

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix J1939 SPN parsing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_39.4.4.bb => python3-cantools_39.4.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_39.4.4.bb => python3-cantools_39.4.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_39.4.4.bb b/meta-python/recipes-devtools/python/python3-cantools_39.4.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_39.4.4.bb
rename to meta-python/recipes-devtools/python/python3-cantools_39.4.5.bb
index ebae6b63e..f4f16c155 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_39.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.4.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "6e8e918b6671a62a9f3990546ece5623e1deb71defb1cef85a9955ac301da99e"
+SRC_URI[sha256sum] = "594f2ae80deadb8c6b08e8e1322d42e258f40d42c80d6886d84e0143f90b5a23"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.34.1


