Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B19FC433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:04:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.7500.1637593494528523746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:04:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=shYZbckM;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593491; i=@fujitsu.com;
	bh=6s6URAWrSDKtnN9H1+V7g7pvlJE9IX/Tk+LXQCCvuQ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=shYZbckM/JmIhMQY9JX7dOSZHwX+U1FU7b+8+e1W3GNLP8uhCErN+K3w/E2NAO8+N
	 EbrQ4Iyz0drLTZV9ricS412VFjfFnm6Y7tPGlVYnWevULLFqrpmj6fU2p+crAlltJO
	 pR7ttcp8WdrxPLmet+v2b5MjZ3GTRdalbZrurpOYyWDatMYf1+r2XBVttGyj6veThy
	 m1G0Mnz/FzQGXBjM7TgDio2BYpsEaOuOfac6lD4s6WPWBx2zDnZZxPXXNOmwE/QRrU
	 LSeWs8RvEvEFioz6Pv+qDXtL2fae6x7vImyTXEemdU3uNlMPUx/eFRcVrH/ud2kLaf
	 21QMiF3uUJWMg==
Received: from [100.115.36.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 9C/B2-02703-391BB916;
 Mon, 22 Nov 2021 15:04:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8MxSXfyxtm
  JBrMmSVlcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBl/N59mK5jBWfH80gO2BsZFHF2MXBxCAk8Y
  JSbN6WWDcC4wSfSdesEI4ZxglDjUuZi5i5GTg01ATWL6rRusILaIgL7E0tl7wOLMAioSL373s
  IPYwgKOEhMb3gJN4uBgEVCVmPrcE8TkFXCSuLojGKRCQkBBYsrD92CdvAKCEidnPmGBmCIhcf
  DFC2aIGkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxitkooy0zNKchMzc3Q
  NDQx0DQ1NdY0tdQ1N9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAkMypVid
  bwdj1+VveocYJTmYlER5jWbPThTiS8pPqcxILM6ILyrNSS0+xCjDwaEkwft4HVBOsCg1PbUiL
  TMHGB8waQkOHiURXgeQNG9xQWJucWY6ROoUoy7H65afO5iFWPLy81KlxHkPbgAqEgApyijNgx
  sBi9VLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5V4FM4cnMK4Hb9AroCCagI04fnw5yREk
  iQkqqgaliUuhLXdb6+Qq/nx6z0fz2wKtA1WrNZ7NHCvdcLz9Yf73+4iTumM0yx3asWrr6f0vI
  Cp1LeTM7d/6r+saT+ylmh33SlCyr1sVWTArvIidedCs+0PRqQ8G82imXv8/xay2TFNk9wXjjp
  pJ5Xl5fjC+2GUwR+5d66Nt2147ShHW1DsktqjvaKnNPPrmfz7qsp1e8ZSrHss/OdWGcV//PL0
  o9sXPH77W8TTwKn72nfVm6NLwk10pp0uvwVYkzMziPPL/PpvReNj2oO+mOe9Jqm1+n/7Tv10n
  5b3jJreV88DfhP9M//TwiN/3JjxMJc8ziU2Y/EIi6bTvpjLiEirv6PsWF9mmr6m9t+1ku/fxX
  TSGDEktxRqKhFnNRcSIA71vzqFADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1637593491!312690!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3437 invoked from network); 22 Nov 2021 15:04:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 15:04:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 04FE910045E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:04:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EC3CC100451
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:04:50 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 15:04:29 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tesseract: upgrade 4.1.1 -> 4.1.3
Date: Mon, 22 Nov 2021 23:04:18 +0800
Message-ID: <1637593460-99443-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 15:04:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94100

Fix broken autoconf build
(https://github.com/tesseract-ocr/tesseract/issues/3642)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tesseract/{tesseract_4.1.1.bb => tesseract_4.1.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/tesseract/{tesseract_4.1.1.bb => tesseract_4.1.3.bb} (92%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_4.1.1.bb b/meta-oe/recipes-graphics/tesseract/tesseract_4.1.3.bb
similarity index 92%
rename from meta-oe/recipes-graphics/tesseract/tesseract_4.1.1.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract_4.1.3.bb
index 0c21685b19..6f92679682 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_4.1.1.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_4.1.3.bb
@@ -6,7 +6,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 BRANCH = "4.1"
-SRCREV = "f4ef2f2050f4c25b28bdbf0063b7d2eb30f41cf7"
+SRCREV = "f38e7a7ba850b668d4505dd4c712238d7ec63ca8"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=${BRANCH};protocol=https \
            file://0001-include-sys-time.h.patch \
           "
-- 
2.25.1


