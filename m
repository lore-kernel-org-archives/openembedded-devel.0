Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BE1C352A1
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:16:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.101897.1670066212108279770
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=M4DwY42n;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066210; i=@fujitsu.com;
	bh=R0s1xgnt6KraT+blXmgG6sIuP4KhacYVWWEMAwaPOMw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=M4DwY42n5WV/Ei1BoZVsplippJWvfYPiz7XHBeUC2k8UxpgxHfvS+gz/kYiJxtqgA
	 sCMX2vgkpD9YxTrxUOV/ikOL53cZ7p6L9WWlXJHdcztU+j0qNA+pCPI7uSTttdbEpX
	 U01sgcG5FKtEAiDBq/Vffbyg3uu4iIh8xGoh6zwlg2ShtL/YgK+blQOBHq9+YFWh7J
	 Z7YzOfN64bLopR6gd1vJcduym+HhBTaSmJCH6kaKBU3eqkUH/trQOLzrlEcXmocKij
	 j/UCB1NMwSABYOKdDFzRJJdA+wF+mz0UC6QpVtcu3Na8LnqmLYwi0m+St7MzWMBgJO
	 mrP9tCLlhIdjQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORpKto0J1
  s8L1f3OLi4aXMDowe5zauYAxgjGLNzEvKr0hgzfgx8x5LwXPOiqPLPjM3MF7h6GLk4hASeMgo
  0fzzHyOEc5lJor3hDROEs5tR4sb+CUAOJwebgJTEjfv/2UBsEQF9iaWz9zCD2MwCKhIvfvewg
  9jCAs4Scx99YgSxWYDiDSv2sYDYvAJOEhPvbQSbIyGgIDHl4XuwXk6g+j29N4FqOICWOUm8vS
  kCUS4ocXLmExaI8RISB1+8YIZoVZSYfbmZBcKukJg1qw1qpJrE1XObmCcwCs5C0j4LSfsCRqZ
  VjObFqUVlqUW6hiZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiB4ZtSnB6zg/H3sj96hxglOZiURHmPhXUlC/El5adUZiQWZ8QXleakFh9ilOHgUJLgD
  dTvThYSLEpNT61Iy8wBxhJMWoKDR0mEt0sVKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKX
  HeTXpARQIgRRmleXAjYHF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwrxjIFJ7MvBK4Ta+
  AjmACOmIjfxfIESWJCCmpBia5/i3/Dm8pfd0qovQi0OdskNY+nwrhlUEXj6WFHGN/ln8pycDv
  8ZfsPSp20UYlMeHRr34svG+5z/m7M9tnvxkvHl1OiPXWTur1etzg/PXG1BPdQaJ8389OllR1u
  GaYbrr89AJT277FR+PmWFuLfnqol8Iwz+x4PeP1gAipl8tfPT2h0th0Ov6Z4R0mHi+3bSc+/p
  9RvbDnQ/rf8knPLRvdC5dtNn159eXdsLPtcqabZ12Y9nr79G/l2n/kLh3b4Lr4hWbV/I4Vu+4
  cOvrw49OUk90rf9v4RuZWXjkd1/fsWOOZw7MVG9LEnyvK2S5LO/73dOFDB6eFljZe4vwsov/e
  mkpz/lfesStG/N2i1pRnSizFGYmGWsxFxYkA9k5XFGYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-728.messagelabs.com!1670066209!41300!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13673 invoked from network); 3 Dec 2022 11:16:49 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:16:49 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D69AC1AC
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:16:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id CAA767B
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:16:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:16:47 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 22.11.0 -> 22.12.0
Date: Sat, 3 Dec 2022 19:16:15 +0800
Message-ID: <1670066176-24685-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066176-24685-1-git-send-email-wangmy@fujitsu.com>
References: <1670066176-24685-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99929

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
* Form::addFontToDefaultResources: Be stubborn in finding a font we can use. Issue #1272

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_22.11.0.bb => poppler_22.12.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_22.11.0.bb => poppler_22.12.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_22.11.0.bb b/meta-oe/recipes-support/poppler/poppler_22.12.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_22.11.0.bb
rename to meta-oe/recipes-support/poppler/poppler_22.12.0.bb
index 5ba1b2f0c..fb00b489a 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.11.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.12.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "093ba9844ed774285517361c15e21a31ba4df278a499263d4403cca74f2da828"
+SRC_URI[sha256sum] = "d9aa9cacdfbd0f8e98fc2b3bb008e645597ed480685757c3e7bc74b4278d15c0"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1


