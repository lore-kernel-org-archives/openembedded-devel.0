Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB625C02185
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:12 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.40584.1736843345993561557
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C1+oa8dW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843346; x=1768379346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IbQ5qHL7oysiEGxnaGI1zFe8Yqg1nsg5cIXR8RsK9xU=;
  b=C1+oa8dWc69nwsrEDw74S2o4oUB6PexpUQgts8TDLe62V5us2e94zCtU
   RwEUj7bfO0HItwMSgg1j6O61Y3gyZ9W4sKvT8MU6aWF7jm6rrh6wZW7uA
   6odmRD6LlHEiB/cPg20ZyWMj6xFfrUmQBVTBCoDWFrrPkoHamAzvQY/Sx
   pFLch3YV/kioReEaqxnJFlDh+uJVqCLhuZiG1Bsl9ho2WJy+vItH2dqa0
   brsTf3FFRmtU8iODhKrLppnTmvXPhklESPKofSDHHiqd0RqAJ1KHm+erb
   IRTfuhxXJcHC+fzyvzft1WRPzNHKFF2pBEzIVYqol1wLlPtyr2MrizuN1
   A==;
X-CSE-ConnectionGUID: go5Pd3IBQnCqQRwzR2Vi5g==
X-CSE-MsgGUID: jRlOHXF0TQi5FdDVPc/7NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="186491587"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="186491587"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:04 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B2A5BE8525
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 88ABFD5093
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AAFA20071A35
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A9E731A000B;
	Tue, 14 Jan 2025 16:29:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/30] jsoncons: upgrade 1.0.0 -> 1.1.0
Date: Tue, 14 Jan 2025 16:28:26 +0800
Message-Id: <1736843329-4131-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--0.598000-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrNNNNLDf7bemU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KVws5GlXF672zo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKxpWDHX+xqGLb+iA8qU5c8R7ftJh+ix5FUzf
	7SsXPxskAytJYObVY2Mk8P5LeuMOvaFNM2A82qqZEYlmk111zuF8aF452XIPz+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114851

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Reverted changes to 'basic_json_parser' API introduced in 1.0.0, cf Git issue #576
- Git Issue #554: Made headers self-contained

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jsoncons/{jsoncons_1.0.0.bb => jsoncons_1.1.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.0.0.bb => jsoncons_1.1.0.bb} (89%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.0.0.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.1.0.bb
similarity index 89%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.0.0.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.1.0.bb
index e556aaf2ef..bafbbd2042 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.0.0.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master"
-SRCREV = "853219aad6f5f049f9b7f6dcf2ff47db7990cdbd"
+SRCREV = "eee098be8f774f64527281d5beb9e90aa9b73e06"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


