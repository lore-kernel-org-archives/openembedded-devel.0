Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7551CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:23:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.31189.1654518196131836242
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oTwQ+xi6;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518194; i=@fujitsu.com;
	bh=/eTTKlnzVd7ZTIulXWsKQln1XtGx1wAoxnB/AlOKXnw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oTwQ+xi6LigG0bv2IrLmQW+KuU8i1xfx/MudIZ9rlVrJoo6F74WNYwv7Cd3zcxnvg
	 mysO6+Nl0gNQcXltnwjFe4juTwc6MZ99KsGHGwF7eu7TnaTaoNRk37CPNLIwRUnTTp
	 +2yG71UPCGFYZGuXt3tItMJtgJMfK5eY0o4P93Pjfy9Bih3irhAAZYy/UCkEZ+mKpq
	 TKe9RmplWBw7cZRzTNS+d2STWDf1yV7OVqwEaKeRMTn7ZEJymmqXikYRaUSeKVCAO/
	 J3vse6p4usPknwRefg1WJ0HmD0uxnemFZFMHTb20ot4t6PrSE+Xsih+3/mDvI4V2lS
	 XvAHJXsEPtkzQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSXfTx7l
  JBuc3MllcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBkTPj1iK7jBXTFj0SrGBsYuri5GLg4hgSeM
  Eu2rvrFAOBeYJF5N+wPl7GaUeLlqAWMXIycHm4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373s
  IPYwgLOEnsP/QWrYQGK737fxARi8wo4SkyZtghsjoSAgsSUh+/BejkFnCT2rf8IViMEVHNqwn
  JGiHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hcSMGdvYIGw1iavnNjFPYBSchaR9FpL2BYx
  Mqxitkooy0zNKchMzc3QNDQx0DQ1NdY2Ndc1N9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitz
  k3NS9PJSSzYxAsM4pVjRawfjqxU/9Q4xSnIwKYny2l+bmyTEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgrfuA1BOsCg1PbUiLTMHGFMwaQkOHiURXut3QGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5e
  elSonz3noPVCQAUpRRmgc3AhbflxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8y4GuYQnM68
  EbtMroCOYgI7weTAH5IiSRISUVANTovWqkJW5pexZlxJ23rD/Nfd08+OHi157nmM/PO/DvPlL
  5y/eZsayuWT9b87jdRahVnrrZCwbcgJiWhp0bbwCJoQdW/PJw3rmBInH2/0/v5hz5aPXrp07P
  l7uljNrXVC2wo5bYYevIHPow5Xffrz7/fhc5vt3Iifak3jX69ruKptRbFx6vbOt0+2u/LOIHW
  V+4v/WTOVObc4U+TFHvfLxWU7rBWtPPtmw82CNhqfcv9T91/8/eOe359jxySyV1sGXZa2V+65
  5/WfmbvvwsUjYk9lF7FtSqVXeh7evEnm5Tk+5xzH7PHfQYpOVKY8tP7mV6f9jfLLsxJWsjpgp
  STvPL751NeDc2et8QZb/P15bIq7EUpyRaKjFXFScCAAXg1DWagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1654518193!629202!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10007 invoked from network); 6 Jun 2022 12:23:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:23:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9AE3C1009C1
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:23:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8D40D1009B8
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:23:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:22:57 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 22.05.0 -> 22.06.0
Date: Mon, 6 Jun 2022 20:22:41 +0800
Message-ID: <1654518164-9091-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654518164-9091-1-git-send-email-wangmy@fujitsu.com>
References: <1654518164-9091-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 12:23:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97422

Changelog:
==========
 core:
  * Forms: Fix crash in forms with their own DR
  * Refactor CairoFontEngine caching
  * CairoOutputDev: preserve text color when drawing type 3 glyphs
  * Windows: font code simplification
  * Minor code improvements

 cpp:
  * Add missing header

 utils:
  * pdfattach: Assume filename is utf8 encoded
  * pdftohtml: Fix type 3 font size calculation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_22.05.0.bb => poppler_22.06.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_22.05.0.bb => poppler_22.06.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_22.05.0.bb b/meta-oe/recipes-support/poppler/poppler_22.06.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_22.05.0.bb
rename to meta-oe/recipes-support/poppler/poppler_22.06.0.bb
index 9a7d9ef00..989b35a5b 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.05.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.06.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "a969ced458e050d6202367bd7427054e2bd19bae39e8f969910d3b9151abf958"
+SRC_URI[sha256sum] = "a0f9aaa3918bad781039fc307a635652a14d1b391cd559b66edec4bedba3c5d7"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1


