Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9BBCD129E
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:43 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.39475.1711983096554025796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V7eo0nf8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983098; x=1743519098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cr7gB99w4m9pPwEJpuan69QsOkDBzFoZqwqTxGHQm24=;
  b=V7eo0nf8yGsk9Iv1mUxG83QcZXuz1vG8RaI6D7jWrvS5VU2LqItGGy5B
   VtcfuwM7VO0z3pSkI0IZiCq4C6F0X/t+xVhp2jZMYPj3CT7elJEhR1Oue
   Rcp5vQgYE9L32Y5Ph/okKfFB9SahEQHqyjhJWWh3oTbvNy+IJEg8lpQY0
   AbbcnZUIApQjPy/+0iwxaguvbZSUcBKMW+j4hE5VpZCqZKYgJWgpqnZFz
   MEH8WDcz6O5KOZ+r4RejuEQ3wGViSPzLRwbjmERmVuUndebir6bwgGUzC
   FN0uoBaOXCnUl+fJcaSTKX6163WLcX1vaqBRrqYrEObQ3SseCi3lquAHC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="142720326"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="142720326"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 78FD5C2264
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A6D47D620F
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4249640FF7
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EC8F41A000A;
	Mon,  1 Apr 2024 22:51:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/47] python3-google-api-core: upgrade 2.17.1 -> 2.18.0
Date: Mon,  1 Apr 2024 22:50:52 +0800
Message-Id: <1711983079-16849-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--1.049600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqz765Bqk4l3OYPc
	XuILVCba0GUB0XWiSWQF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6wir
	vaAkMLCevFI5aHTccrjmFUd/valI4FldvYiiUwRaIxvycvGzBMfvTLb40PYg1m27Ur7niMv/LMa
	WxhRHP7q1CUMYtIdUqCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109736

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add common logic for supporting universe domain
-Add _registered_method to grpc ChannelStub
-deps: Require proto-plus >= 1.22.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gle-api-core_2.17.1.bb => python3-google-api-core_2.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.17.1.bb => python3-google-api-core_2.18.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.17.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.18.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.17.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.18.0.bb
index f9df8cf2a..b4cbafa85 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.18.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9df18a1f87ee0df0bc4eea2770ebc4228392d8cc4066655b320e2cfccb15db95"
+SRC_URI[sha256sum] = "62d97417bfc674d6cef251e5c4d639a9655e00c45528c4364fbfebb478ce72a9"
 
 RDEPENDS:${PN} += "\
     python3-asyncio \
-- 
2.34.1


