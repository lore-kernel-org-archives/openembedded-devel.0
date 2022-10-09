Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14876C433FE
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 00:37:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.9541.1665275849412161254
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 17:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qYQt2EFV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665275847; i=@fujitsu.com;
	bh=8tYnAOWbMCTcF1/3JVOCgWYrepup/2gS5tEDWSezbEI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qYQt2EFVGvq+9Ujyh2+FK0A22CIWGvoIrlgfhTeAIShpvKyJJT1XXwqrizd3ifPYx
	 ZpXBF2P8kV6dzZQmkrfoNKvfyvFRtV+eN0qjTUWAi++kWnjzlQoFIpmr4UjT4SE7pK
	 9hOFEnoEQwQ+gvqBXhmaVrnEdvn9sn1KvRYdO05G+Z8+omkfsiRdirpXdv32gttEU0
	 hOj/bs/vrBFo268FfUASROb571ODyNcvy/kOb2naWdPhER5L3SBAGRZSSohEBKp8tT
	 oYgRt8CAiLp89lHcyZt7Z5kjz/0hKM7m5GWZu2x3Hd7trbR7/HCIvr8KYrxcATRwgd
	 3+SXOwmhBrg8Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSfeYuFO
  yweUfuhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bKU+wFE3grjjWfZWlgXMjdxcjFISTwhFFi
  yZQnzBDOdSaJk19msUA4uxklNk5pBcpwcrAJqElMv3WDFcQWEdCXWDp7D1icWUBF4sXvHnYQW
  1jAWeLN1IVgcRageOf21WD1vAJOEm8eNzCB2BICChJTHr4Hq+EEqn+4Zj9YjRBQTfuup+wQ9Y
  ISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiVmz2qBmqklcPbeJeQKj4Cwk7bOQtC9gZFrFaJ1
  UlJmeUZKbmJmja2hgoGtoaKpraaZraKaXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOi
  l5dasokRGMYpxQkCOxj37vuld4hRkoNJSZT36VaHZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  E7sTslCgkWp6akVaZk5wJiCSUtw8CiJ8Ib9c0wW4i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+Xq
  qUOG+sMNAMAZCijNI8uBGw+L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3gwDQFJ7MvBK
  4Ta+AjmACOsLqoR3IESWJCCmpBib/KjtXprtWd1TD/57de//9p4deGQt+BtgUiG/8F2zca2Lx
  8HuJxaQXmj53Vmn/edq9oP1+st2Vq22TEzeWnD3yzyks8e6WCau/bjJ1fL+RcWJCZ73Ap4XVa
  nkNbZcb5+SHf3nx4uDuL+EyfTMOzThqtG/np1OSX0We3b3Inf5Ip6uxz22//px900wbimK25z
  e0BEeV7xRNvr2S57S56JE/V+fObMmpkl2zOt+67NznkBzGsxMtbkutMJivt8u2404PW2DTmqU
  2v9zbqnKV7DzPXe8ouxm2bOL/i+7OtjmSDLKcp1hss+dv9HlUYx5qHbjn1b9y/t9LX3gJf1L/
  rPUxbzHHZLlVJ1iZORZIt0kqsRRnJBpqMRcVJwIAYNIj7WoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1665275846!180216!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19845 invoked from network); 9 Oct 2022 00:37:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Oct 2022 00:37:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 309C81000CE
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:37:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 23D661000CD
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:37:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 9 Oct 2022 01:37:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 22.09.0 -> 22.10.0
Date: Sun, 9 Oct 2022 08:36:58 +0800
Message-ID: <1665275818-29173-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665275818-29173-1-git-send-email-wangmy@fujitsu.com>
References: <1665275818-29173-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Oct 2022 00:37:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99108

Changelog:
==========
  core:
   * SplashOutputDev::tilingPatternFill: Properly restore CTM on failure. Issue #1292
   * Protect against malformed files
   * Refactor code to not use strndup
   * Other small code refactoring

  utils:
   * pdftoppm: Avoid round-off errors when determining raster dimensions
   * pdftocairo: Avoid round-off errors when determining raster dimensions
   * pdftotext: Simplify memory handling

  qt:
   * Take into account flagNoView when getting/setting the visible status. KDE bug #456313

  build system:
   * Fix sed invocation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_22.09.0.bb => poppler_22.10.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_22.09.0.bb => poppler_22.10.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_22.09.0.bb b/meta-oe/recipes-support/poppler/poppler_22.10.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_22.09.0.bb
rename to meta-oe/recipes-support/poppler/poppler_22.10.0.bb
index 2cae897d7a..0a15088d00 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.09.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.10.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "d7a8f748211359cadb774ba3e18ecda6464b34027045c0648eb30d5852a41e2e"
+SRC_URI[sha256sum] = "04e40fad924a6de62e63017a6fd4c04696c1f526dedc2ba5ef275cedf646292a"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1


