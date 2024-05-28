Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD8DC41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.12717.1716861047804491951
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rdbSIr8M;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861047; x=1748397047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=o3cdElw0Tp/zO/cdtgYI8WOKekqHKiYDfSERskgNY9Y=;
  b=rdbSIr8MS3SMchQkYiT3G/t4mPiePwownNkNwx33En5R8WAnDb6MMKRP
   eMwS8vl2riOK8WTy6X92A+kJwAgaFtgSmWZ1dAonnINXojkppqZEZ36ae
   PSnhwCX3FgXsZyLLZoatlQky3b2x/ag2gmOF2Xceb20poFcv3HIaxwfWs
   BtyM7qg6Meq2saqgjHhyzMJ5uDTCl3J2m7z2abaRi9wu5dnrVdLwSeZbr
   CqBYG8GGLKdvLbUwzb687vDRGnB26gTEF8xT34YWHwhphe7kNXYAPa35i
   c5fw/+75/3eZm+Z1RWGero0rU/8TGzNPMnSlDUDQGofBrpZWMH0Ped5dV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160448625"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160448625"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:45 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B65EDAE08
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C3ED7CFA5C
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A697411AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 095C21A000A;
	Tue, 28 May 2024 09:50:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/40] python3-ujson: upgrade 5.9.0 -> 5.10.0
Date: Tue, 28 May 2024 09:48:12 +0800
Message-Id: <1716860901-863-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-2.854400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN194/5X9VfCxYL/tox9XQkYkvBucr2+3cli+
	BaqMwTNrVuPnsbKmJliiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNZvGupVhCeXSAvEZQSQSX+6yK+RbzlaNhhiBTWrsVAcjwKo4ZHlTl7+AfMChjzjPeLiQS
	c635RgWb03tffvkSDXa2iDN3WFzaNctSarHnY/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110565

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add support for Python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ujson_5.9.0.bb => python3-ujson_5.10.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.9.0.bb => python3-ujson_5.10.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
index b5f6be9f2..c64c80062 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5418f0b03302d0a"
 
-SRC_URI[sha256sum] = "89cc92e73d5501b8a7f48575eeb14ad27156ad092c2e9fc7e3cf949f07e75532"
+SRC_URI[sha256sum] = "b3cd8f3c5d8c7738257f1018880444f7b7d9b66232c64649f562d7ba86ad4bc1"
 
 inherit pypi ptest setuptools3
 
-- 
2.34.1


