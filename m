Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C25BC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 12:45:06 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web09.25879.1646657104543851747
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 04:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uCos12wz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646657102; i=@fujitsu.com;
	bh=IXXZrVWKEDmfMQPnsbu8cUq1WzG/WoCI7QjEIjH4nOo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uCos12wzEcB6vo3tgq1MHU9Yo2C6nD0SOBB2NUcEX4yn8QtERov/HUR1oF2F2OX+B
	 mM0AuYzIyO5EAaxbKiUa/Wy/sjmwQ44WYowKWmV8ej3v+vgIoHHCQMqijdjODGVyaR
	 Rt6uyWKa04Br9y97peCMlc6+vUIzk/0LP4CE8cUW1UME+JnviQr+PkbIh1g4y1BMTX
	 bkyP+3mzf6tni/6Nixyf/Au6Vh5akFTqY1zqRrlIcpDh8L1JiGpcOm9PM5l5n1nT28
	 ZcmZh88zAzgNciV2eD3IiO6hs9HGJ9m+qAJMKNs+QHe1Cc7lQjxYqYQ05sqioRGjur
	 r/gcH4ivlPp0g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8ORqOv3TzX
  JYNYBHouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPDxCuMBcdEKy7Ou8XUwLhbuIuRk0NI4Amj
  xNkzeV2MXED2BSaJxacvMEI4xxklnnScZQSpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jATmLnzb9gNgtQvGP3cZYuRg4OXgEniRsreUHCEgIKElMevgdr5RRwlnj09CYzxBFOEk
  /uv2MCsXkFBCVOznzCAjFeQuLgixfMEL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+yw
  k7QsYmVYxWiUVZaZnlOQmZuboGhoY6Boamuoa6hoZGOslVukm6qWW6panFpfoGuollhfrpRYX
  6xVX5ibnpOjlpZZsYgSGcEox4+kdjJv6fuodYpTkYFIS5U1ZoJokxJeUn1KZkVicEV9UmpNaf
  IhRhoNDSYL36x+gnGBRanpqRVpmDjCeYNISHDxKIrwhX4DSvMUFibnFmekQqVOMxhw7t1zey8
  zx4dCVvcxCLHn5ealS4rw/QCYJgJRmlObBDYLF+SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIx
  Kwrzuf4Gm8GTmlcDtewV0ChPQKVW2SiCnlCQipKQamGKmvHzqJFHdXyMUF/bHhC1zAvu/2y3n
  3y80lvzz6d6FlgMTXvku6D/Em1KQrv/wUP98xedP4h+71h8V3Tvl1p1kh3tmifYqC3Xqi8tep
  l9MtkpKTJZaKinudnCl6wWBIsU7F7RnTOPgUEs5YqqkuWSays2Jf59n7kh5oXzBZMUpn1VRtx
  nf8B/NlTh99Mdvn1ki/YySJd8OOk0ofCmxcuKr0Ne/hLa69E5LrD2atngu/71zys+/Cj9elqR
  xTknE6tZpd46YS3e+LCwSmTN35qbytXOFUorXu++74Hhl/fbVa3piNwV3vOJvXfJ9r5hhWoRR
  uc2y1r6C0Clde7wMBdRbZ+XvN94jX6pU4p6lnK7EUpyRaKjFXFScCABwyp2ebgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1646657101!20749!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14473 invoked from network); 7 Mar 2022 12:45:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 12:45:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8436810019D
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 12:45:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7693B100185
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 12:45:01 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 12:44:42 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poco: upgrade 1.11.0 -> 1.11.1
Date: Mon, 7 Mar 2022 20:44:27 +0800
Message-ID: <1646657069-56146-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646657069-56146-1-git-send-email-wangmy@fujitsu.com>
References: <1646657069-56146-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 12:45:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95856

0001-fix-missing-expat-definition.patch
removed since it's included in 1.11.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-fix-missing-expat-definition.patch   | 27 -------------------
 .../poco/{poco_1.11.0.bb => poco_1.11.1.bb}   |  3 +--
 2 files changed, 1 insertion(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poco/poco/0001-fix-missing-expat-definition.patch
 rename meta-oe/recipes-support/poco/{poco_1.11.0.bb => poco_1.11.1.bb} (97%)

diff --git a/meta-oe/recipes-support/poco/poco/0001-fix-missing-expat-definition.patch b/meta-oe/recipes-support/poco/poco/0001-fix-missing-expat-definition.patch
deleted file mode 100644
index 625aa3191..000000000
--- a/meta-oe/recipes-support/poco/poco/0001-fix-missing-expat-definition.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3f288fefbd683d687bde3fc63964da64bc3c8a40 Mon Sep 17 00:00:00 2001
-From: Pascal Bach <pascal.bach@siemens.com>
-Date: Wed, 11 Aug 2021 15:11:49 +0200
-Subject: [PATCH] fix missing expat definition
-
-Upstream-Status: Submitted [https://github.com/pocoproject/poco/pull/3414]
-Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
----
- XML/src/ParserEngine.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/XML/src/ParserEngine.cpp b/XML/src/ParserEngine.cpp
-index 82d477478..6213e555b 100644
---- a/XML/src/ParserEngine.cpp
-+++ b/XML/src/ParserEngine.cpp
-@@ -504,7 +504,7 @@ void ParserEngine::init()
- 	XML_SetParamEntityParsing(_parser, _externalParameterEntities ? XML_PARAM_ENTITY_PARSING_ALWAYS : XML_PARAM_ENTITY_PARSING_NEVER);
- 	XML_SetUnknownEncodingHandler(_parser, handleUnknownEncoding, this);
-
--#if XML_MAJOR_VERSION > 2 || (XML_MAJOR_VERSION == 2 && XML_MINOR_VERSION >= 4)
-+#if XML_DTD && (XML_MAJOR_VERSION > 2 || (XML_MAJOR_VERSION == 2 && XML_MINOR_VERSION >= 4))
- 	if (_maximumAmplificationFactor > 1.0)
- 	{
- 		XML_SetBillionLaughsAttackProtectionMaximumAmplification(_parser, _maximumAmplificationFactor);
---
-2.32.0
-
diff --git a/meta-oe/recipes-support/poco/poco_1.11.0.bb b/meta-oe/recipes-support/poco/poco_1.11.1.bb
similarity index 97%
rename from meta-oe/recipes-support/poco/poco_1.11.0.bb
rename to meta-oe/recipes-support/poco/poco_1.11.1.bb
index 027ff6469..3cfd49fcd 100644
--- a/meta-oe/recipes-support/poco/poco_1.11.0.bb
+++ b/meta-oe/recipes-support/poco/poco_1.11.1.bb
@@ -10,10 +10,9 @@ DEPENDS = "libpcre zlib"
 
 SRC_URI = " \
     git://github.com/pocoproject/poco.git;branch=master;protocol=https \
-    file://0001-fix-missing-expat-definition.patch \
     file://run-ptest \
    "
-SRCREV = "f81a38057f1d240fe7b7a069612776f788bc88ea"
+SRCREV = "de61f0049175a941cc83c2615c3bdc5e947b89f9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


