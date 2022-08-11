Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A1FC25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:32:02 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.24182.1660703520964408964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BiRBE/A5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703519; i=@fujitsu.com;
	bh=HEQssrR0DqU8VxR8U+0mT16wDRjwkdJR691xr2RwLWI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BiRBE/A5wim4/mcZjoa/U1+PLQm8T7m0LNETWhFKZIZxXExRHiLSmt7KeABa650QR
	 es+B3smrfilNBI7cZ1BPSqpOssIy3yXLRSjqqJJyWw2Bl3xSbP4JS0A2RmYbdhNZV0
	 EL9uiVRbbOQ5IAqRoSxd0KnoHF6hJAwe04rQrFk1t9oYYzN5+k3Eq7ZlKUbRL6jYVF
	 msC4wiBkuKmvyEbf20q8mV+smz8oLjlvQzAPAWQbKJqq5vwuF2nGODj2vLV9eVNviW
	 L/vA6y0lsgS1b2YzQGIMBT+SJ+w+NXhuOP0IwNPhlThUFKE61Dyimoyg8v9yzaevf4
	 Xq5O91cG0RH+w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8MxSVcu+E+
  SQeM9NYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePhso2MBd84Kt6ufsHUwLiYo4uRi0NI4Amj
  RNPka8wQznUmib0dLVDOAUaJVxP/s3UxcnKwCehKvPixmAXEFhHQl1g6ew9QEQeHsICfxP5LV
  SBhFgFViQ3NZ5hAbF4BD4ml/6+D2RICChJTHr5nhogLSpyc+QRsDLOAhMTBFy/AxkgIKErMni
  4PUV4h8frwJWYIW03i6rlNzBMY+WYh6Z6FpHsBI9MqRuukosz0jJLcxMwcXUMDA11DQ1NdY2N
  dQ3NLvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2MwOBLKVbcvINx4sqfeocY
  JTmYlER5+5n+JAnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4L3nD5QTLEpNT61Iy8wBRgJMWoKDR
  0mEVzYAKM1bXJCYW5yZDpE6xWjMcXfh3r3MHDO/th1gFmLJy89LlRLnfesDVCoAUppRmgc3CB
  ahlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8+7zBprCk5lXArfvFdApTECnHLv4G+SUkkS
  ElFQDU8zUrCJnDufnBjN/RJe9uWG3QLA/MktleZLiag2NY9mPzpydnJV8vKr2/McTv/XP2xt7
  s+eqrDQ26v+WsYY1c23bRtaCs/seHl3KyXBk/pwVD469cdhuF16QJDfh/zJuhvzy7cdnnPnEK
  cm+6d8/l5R0b8/3Gcdafpdb/TjIM1ego9ygXWjCjnbxG52rJTdsmmGVu1s8NZet+tZvv5l9ve
  WvYwo16u1PCcS8sP3PveTlx/9lZ6qrjH67dfwxuyRadnMPS7f02zUnNxvnGAYd6XyXtivnFo9
  /7R0W6zVbv998ej/N1dHbVF4j4P3Uzo33yvexJSdNyXUXvsbFd+tlfiCzssDDqAaVn58cky50
  KrEUZyQaajEXFScCADzeYqBLAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1660703518!201988!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25453 invoked from network); 17 Aug 2022 02:31:58 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:31:58 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5A1DD1000C1
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:31:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4D7EC100078
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:31:58 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:31:56 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-autobahn: upgrade 22.6.1 -> 22.7.1
Date: Fri, 12 Aug 2022 04:18:26 +0800
Message-ID: <1660249106-20380-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:32:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98277

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-autobahn_22.6.1.bb => python3-autobahn_22.7.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_22.6.1.bb => python3-autobahn_22.7.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_22.6.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_22.7.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_22.6.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_22.7.1.bb
index 71da18f812..09957ad003 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_22.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_22.7.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "fb63e946d5c2dd0df680851e84e65624a494ce87c999f2a4944e4f2d81bf4498"
+SRC_URI[sha256sum] = "8b462ea2e6aad6b4dc0ed45fb800b6cbfeb0325e7fe6983907f122f2be4a1fe9"
 
 inherit pypi setuptools3
 
-- 
2.25.1


