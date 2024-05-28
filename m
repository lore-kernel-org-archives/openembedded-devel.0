Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BFDC25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:48 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.12694.1716860984234472027
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jpzJWViN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860985; x=1748396985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YqpRmMN2DIQ8oaPKRvmQqMGo2SL7ePsuy0S8dp07Of8=;
  b=jpzJWViNWW4ZQBqK4dMqHVycEe0/Yj+7EBKHc0hFZfw67JZ4XkVfwEda
   1Z46eCa0v2arrG5oGrwp+E35mqQJsSH3nhleUel7GlontpmtVFIJ84gdq
   l0bII4XxHOmXrBVphU8X6m1hwbY2OMTNEWQcsSQxiEJi+CJBEJCvEmYe8
   o7NSH/qDpvQ5C614hwBdhS5qq3k9YXkSz9hssGhQmyfbvJ+AtDVGU7NTu
   gE68LSylO4diOnI1/TGPV5djzWy0906f3v69bKfCsfn1YgzW97VUDsK4q
   TMDqoWnKdBBC9Fl/10Xqqk4diLDvQmkZ0qKwcdKrWruSST2EbbboZyagI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="139925647"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="139925647"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:34 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F2EFDE56F
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4539FD73C3
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CD9AE411AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 799A81A000C;
	Tue, 28 May 2024 09:49:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/40] python3-bitstring: upgrade 4.2.2 -> 4.2.3
Date: Tue, 28 May 2024 09:47:55 +0800
Message-Id: <1716860901-863-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-1.627700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTSz0JdEAJbSbOhzJnf8pOL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6VsM
	hq385Ay85IUWD1xyzqGiCizQ3fjD21q9E3XRz9xJKcuQvXRvXP5onE3iv1+q3Agv5iGStLN0fWE
	LLV7+pUS/yWfaP1M8qCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110555

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Some codes representing exotic float negative zero converted to positive zero.
- Auto-scaling rounding the wrong way on occasion.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitstring_4.2.2.bb => python3-bitstring_4.2.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_4.2.2.bb => python3-bitstring_4.2.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.2.2.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.2.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-bitstring_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_4.2.3.bb
index feeed55c3..4d86ce7df 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=661f450e2c0aef39b4b15597333444a7"
 
-SRC_URI[sha256sum] = "b40b01d911eebaea6efff40d826580806dced5e04b9d3cbad6aebf9422f4b643"
+SRC_URI[sha256sum] = "e0c447af3fda0d114f77b88c2d199f02f97ee7e957e6d719f40f41cf15fbb897"
 
 PYPI_PACKAGE = "bitstring"
 
-- 
2.34.1


