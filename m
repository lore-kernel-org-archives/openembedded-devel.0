Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1012AC0502C
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:32:24 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.67691.1661754742421933325
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dECfmBw3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661754740; i=@fujitsu.com;
	bh=zzahZfVZH/zlXI62nkSwMUKXEOIP80w028vC7GK/6AU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dECfmBw3BY3QPCLPC0cBUBX9lbZ5AkWHvEOmY7I+4PCvjecz9pTqPOTwW3UNWKm9c
	 6FXo4TljxdwenOEkaTikibwb+ZjqYYqY0ZrNgepD97wTUmoszO5xKkOxRALZVEMuQW
	 E9ar3FETE+IRNg8rcvUQ1D3XY9yvoVWjc3JUqfkGzCmToFegEIHM9VvpB0x5HJwWX9
	 zieMjRu4ZTw2rTAbe2PVj+zqedaJu3UjXcAGYZoz/vBpqUCt8cF+4YugJPvwLReLaR
	 z6aBwTUtJ4MsS6MTT98SnJEs+DJfFKzgfCl7I0m+Y6CMM4Key0ahgsh3M+/IG0KceZ
	 4xYpQrJqhYigQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8ORqFscy5N
  scKJB0+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzbjybStbwXXOiusvJrI2MJ7j6GLk4hASeMIo
  sevjRhYI5waTRMuJO4wQzl5GiT83FrF2MXJysAmoSUy/dQPMFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAgsbLlCguIzSKgKnH46AYwm1fAUWLF1rdgvRICChJTHr4H6+UUcJJo2fUWrFcIqObgtr
  VMEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsSok9s/qZIGw1iavnNjFPYBSchaR9FpL2BYx
  Mqxhtk4oy0zNKchMzc3QNDQx0DQ1NgbSxrpGhmV5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgMKcUp9/Ywbhr3y+9Q4ySHExKorwm5jzJQnxJ+SmVGYnFGfFFpTmpxYcYZ
  Tg4lCR4HYHxISRYlJqeWpGWmQOMLJi0BAePkgjvKwegNG9xQWJucWY6ROoUozHH1StX9jJzzP
  zadoBZiCUvPy9VSpx3SwxQqQBIaUZpHtwgWMRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCT
  MKxwFNIUnM68Ebt8roFOYgE55uIQb5JSSRISUVAOTj+kT5UOvYnsW7/q7wU33uH5P2bpAgaWz
  n+y8KXS0JlCrpirqwd/LvS0TJ3MJnDu3e534z/ePo5O3c/M82K24/NaXxqKzKewnxU5WqLZ3L
  TNc79m6VOrJAc9LXTeL73+f//tmF7+D6vSE24U3KpuCPV6UriiNvLCv5ovmz+VBKesS0111Ky
  q0nhmfcdVTruivfMWUPMmajz1ALqSLWS98VW7+fHdxu0mdSbnaVknBPWw/NdqXLvy0Zb65qdz
  ME1PPzDj150LZYx7blU7bEyKqsr8/+Rj52bFRZNoqdon+v5t2fj9463eA2MXJ/JblFgr5s3nK
  p5bMPDrn9b9D4kuuzlc1/vnd+ZBzb3HOZ9n/SizFGYmGWsxFxYkAuurkW3MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-728.messagelabs.com!1661754739!139439!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26721 invoked from network); 29 Aug 2022 06:32:19 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Aug 2022 06:32:19 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 18E6A10019A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:32:19 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0C91D100191
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:32:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 29 Aug 2022 07:32:17 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hunspell: upgrade 1.7.0 -> 1.7.1
Date: Mon, 29 Aug 2022 14:31:42 +0800
Message-ID: <1661754703-4722-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661754703-4722-1-git-send-email-wangmy@fujitsu.com>
References: <1661754703-4722-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:32:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98503

Changelog:
==========
 Merge chromium fix for OOB string write in hunspell
 Merge firefox fix for various issues parsing incomplete aff files
 Fix crash with hunspell -l -r
 Merge in weblate translations
 Includes fix for CVE-2019-16707

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hunspell/{hunspell_1.7.0.bb => hunspell_1.7.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hunspell/{hunspell_1.7.0.bb => hunspell_1.7.1.bb} (90%)

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.1.bb
similarity index 90%
rename from meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb
rename to meta-oe/recipes-support/hunspell/hunspell_1.7.1.bb
index 8d4dd5254e..54bbc2f22c 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LESSER;md5=c96ca6c1de8adc025adfada81d06fba5 \
 "
 
-SRCREV = "4ddd8ed5ca6484b930b111aec50c2750a6119a0f"
+SRCREV = "1180421f50f211984211e968eb6801ffd3390b8f"
 SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


