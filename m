Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E66CCA48B
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:31:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.2509.1658806273444404004
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=u/oBUJ2U;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806271; i=@fujitsu.com;
	bh=b73aKrYzL2JCxVM0tmErkKEe4XuxV8BcBILWTNzLDgg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=u/oBUJ2UZD/aNA0AEhNhzJzgFAwlBHPuwlkDjcs2jfb057HeOmZN2hiQg0JcU4DgK
	 Likrop9P+eT/8wcY97+OtLQK2AufpravkLBswSrUsGGnzjQ78vXFEyEdG1azCSrOuC
	 3W0EmWmx6q6vZcxCDZ99hEPluGZtb8//WaDJcsgWBsi7pynSgfl5RymrhoIikO8MBN
	 OLvtuVi9oro0prinrR2MeQVWEwzHuYwotUA2LJylN9nRehCXrDR1oNBkeBtFBTB5IY
	 wZi4skzEC+cpjBh4PllAJ2+VN8xWO0JIitRgRxv7nJHxYfx4b1bz7rVlzpzEVSGWcy
	 uyQlWUJsUZuuw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqPs//n6
  SwaxXAhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bRLZPZC/ZxV+z59pWtgfEwVxcjF4eQwBNG
  iYvvLrNDONeZJHruXYdy9jBKrH3xn7WLkZODTUBNYvqtG2C2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhAXeJPRtPMoHYLAKqEhe2TGAEsXkFHCV2f9sIZksIKEhMefgerJdTwEni/LKTLCC2EFDNlr
  tfmCHqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIFRcBaS9llI2hc
  wMq1itE4qykzPKMlNzMzRNTQw0DU0NNU1ttA1MjTSS6zSTdRLLdUtTy0u0QVyy4v1UouL9Yor
  c5NzUvTyUks2MQIDOaVY7coOxj2rfuodYpTkYFIS5d3SeS9JiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgTv67j7SUKCRanpqRVpmTnAqIJJS3DwKInwlsYApXmLCxJzizPTIVKnGBWlxHlXgPQJgC
  QySvPg2mCRfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG8qMC0I8WTmlcBNfwW0mAlo8Sf
  tOyCLSxIRUlINTGENmzXqfZ0C3tfOqFtZfftSvu8rxbkLOCYddNA8s0Z82zLHnD3dyQyGZhdm
  bCqat2rV/Hd+kw5tPlAn7JniarJnY1yHb53hH5flizOXxiacsJbsd6m5cqDyZs82zpUR509KH
  P2TFbmgTNnpaPSz5QWSMwUN5509+bHu0BXLtGt/Z6Rcennw5CfLd4lLdjA/P/q3Y6feRvOkeS
  EpjDnpb6yuXD74f52m710r64vuTU9NJDxfbY3rP5Pdfjr4ZkhIXuPUK7kPHgXMFFT/clDzbhG
  z9u5W5V8NO06w9X3kYVh5R/8i+2xxLe1FZztWrP+7SUqq4OCaVS4Wc311j9T6umz2fWnOrslY
  bOg/PT2qeqMSS3FGoqEWc1FxIgA2uf0qXwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1658806271!119420!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28637 invoked from network); 26 Jul 2022 03:31:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:31:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E31D8100192
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:31:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D60AD100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:31:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:31:09 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] googlebenchmark: upgrade 1.6.1 -> 1.6.2
Date: Sat, 23 Jul 2022 13:36:07 +0800
Message-ID: <1658554568-9257-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658554568-9257-1-git-send-email-wangmy@fujitsu.com>
References: <1658554568-9257-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:31:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97976

License-Update: 
Update LICENSE file to clearly state which file needs BSD 3
Only benchmark/config/generate_export_header.bzl depends on BSD 3-Clause License:

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{googlebenchmark_1.6.1.bb => googlebenchmark_1.6.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.6.1.bb => googlebenchmark_1.6.2.bb} (76%)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.2.bb
similarity index 76%
rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb
rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.2.bb
index b44d3bee27..11f09c6fd6 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.2.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "A microbenchmark support library"
 HOMEPAGE = "https://github.com/google/benchmark"
 SECTION = "libs"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0f6f3bbd074b822ddbb3b4d0e7f8d652"
 
 SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main"
-SRCREV = "0d98dba29d66e93259db7daa53a9327df767a415"
+SRCREV = "d845b7b3a27d54ad96280a29d61fa8988d4fddcf"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


