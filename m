Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458EFC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:02:04 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.66229.1680516123001235697
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JkEmF9HX;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516121; i=@fujitsu.com;
	bh=z0AjFdh6xhqNTzwB05PA8LVFcRZMxbBekC/rQdM7V8M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JkEmF9HXewx0jnLxME+Eee9poLJv0to/N7/wOuBvHl9ehYYdGhqKzk8uW7ORpAIZ3
	 IXjN+paTYhz3WwCjSIiXpCDtLQ2YH4Kz4Rj7eRkvRj/D8lzSFPHl1QlQTqWwJxNbfr
	 PWJs6a17Pvv+z9YtaV4t4HvxBWCcuHiUWl1bImKvGDHzru8Ni6twTtrECOtWgF2o/V
	 9PA/5p/jBiAnxv6LOgNjvW5xLwFoVm4pJX4KdmEFxvqiparLbOjpxzeA8qcFKBEFF8
	 gi3rsGIFSgr/QrmqU1esOYoSzCAF6aYKQ+MEWBr2q/YdYNT69D6YFU7Dx/5un/XtkC
	 HM6R2tSidSxow==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORpCuxRCv
  FYOoSBYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPl7Q3mgnM8Fb+uXmJsYNzD3cXIxSEk8JBR
  Ys3+8ywQzhUmiavf9jNCOLsZJTovf2HtYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAX+LstbtgNgtQ/N7/KSwgNq+Ak8S1a8/BbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy83Q9VXSDROP8QEYatJXD23iXkCI/8sJO2zkLQvYGRaxWhWnFpUllqka2igl1SUmZ5
  RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYjinFjMk7GK/2/dU7
  xCjJwaQkyitYr5UixJeUn1KZkVicEV9UmpNafIhRhoNDSYJ33iKgnGBRanpqRVpmDjA2YNISH
  DxKIryKC4DSvMUFibnFmekQqVOMilLivKdB+gRAEhmleXBtsHi8xCgrJczLyMDAIMRTkFqUm1
  mCKv+KUZyDUUmYV2wx0BSezLwSuOmvgBYzAS1ujdIAWVySiJCSamBinnLmhdufsn3mU6R/O0d
  k6NoIeB68u7EvwPRVf+rBFb2ZnN9PWtmtEFee8OjOQvYvDSIffLoe1jBVtuwXLVKv3N/I7nmD
  //XxmcZzX3aeNO+66rSkaunTXWGRDj+3Fn//M0/6KF/DrS/yL2o1f+jXvOn+8rDVivHt5WWiK
  22WVzmGqiUVMD5beHG+98oz/hfv/azW/G3SW3up3H3O6wsinL92uG5afLlWcRJriUSLzQl2W4
  P7gou08zm49O7IlF+4d8cuuTrs+gdeZf+E2l17wxkWFwerBUaGPX1qnSrC/fn2lsfzZKaFHQy
  YrM9Wumtxn1jutwKnm2UGXa63DEMETt+LE7jPOO3TrwqFr1JKLMUZiYZazEXFiQBjNSJJQgMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1680516120!1009517!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21098 invoked from network); 3 Apr 2023 10:02:00 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:02:00 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 206621C6
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:02:00 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1575F1B0
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:02:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:01:58 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-argcomplete: upgrade 3.0.0 -> 3.0.5
Date: Mon, 3 Apr 2023 18:01:44 +0800
Message-ID: <1680516108-30896-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101909

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 Call _default as fallback in zsh global completion hook
 Begin support for mapping-emitting completers
 activate-global-python-argcomplete: do not overwrite existing dotfile in user directory
 Add NOTICE file
 Establish long term name for split_line as argcomplete.lexers.split_line
 Re-add split_line to API (#419)
 Fix zsh default completion issues
 Fix zsh autoload issues

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.0.0.bb => python3-argcomplete_3.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.0.0.bb => python3-argcomplete_3.0.5.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.0.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.0.5.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.0.5.bb
index 3ec271bac..1e884f486 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "69db74ba0c72897452f2666267bd76c9cd10829686e99889e6758fac99b23286"
+SRC_URI[sha256sum] = "fe3ce77125f434a0dd1bffe5f4643e64126d5731ce8d173d36f62fa43d6eb6f7"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.34.1


