Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1A3C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:12:29 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.13510.1660543947797101713
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ie+MR2lH;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660543946; i=@fujitsu.com;
	bh=cLa63P8YOI6WQ0hmmjCsI8Dm5/voFuLKyS9DI/73NKw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ie+MR2lHqOh0OJDNeHBm50KoZaoXHUWv7N4N1hZW9p/uerwjxV1JCJfsMjHji7tXR
	 buqpj2MmDrKoZAfuupZdk5hS2K6/dEAf9NRQG0g3acNlv0NNNqF4KcibQO9xGzJnuV
	 zMxHnUr9cfSHksRYmoiPjH9fRu4api1B6sEs0zMOSJZBK97fwYJxvYLBkSdmO7zP0a
	 DqdoXSWTV1EAzOgiz2+QtGw5g4EN1xw2ksqRvGDEBnu6bZtkFKUcLBQZmad257oP/z
	 jlg5SdGMsahnICmB4n8dLxEqXKmYlskZbF6HZwUPojdVjo11F77Zb2mGp6yr24gAvw
	 Jbrvd4iiJMGLg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8ORpHvy8c8
  kg1NrLC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ow50/cyFRziqphz+DFjA+Nuzi5GLg4hgYeM
  EvO+/GCGcK4wSfzd3sYO4exhlPjzegJjFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICDhJ/nlwFq2ERUJXYsns3WJxXwFFi5cW/TCC2hICCxJSH78F6OQWcJC7e2wlWLwRU82
  PbWUaIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHaFxIwZ29ggbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGK2TijLTM0pyEzNzdA0NDHQNDU11jS10jQyN9BKrdBP1Ukt1y1OLS3SB3PJivdTiYr3i
  ytzknBS9vNSSTYzAQE4pVruyg3HPqp96hxglOZiURHmvXfyZJMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mC1wwYG0KCRanpqRVpmTnAqIJJS3DwKInwLrgNlOYtLkjMLc5Mh0idYrTkmDr7335mju
  VgcubXtgPMQix5+XmpUuIQ8wRAGjJK8+DGwSL/EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiV
  hXvdHQFN4MvNK4La+AjqICeggvbvfQQ4qSURISTUwaZ2Lyjk312d/i/bq1Ke/cpy6PA4/9wiZ
  tcY5TG7Xu/x7Lhnzy1Z8i5IPjL23hmfb4wnzE6df2iN6N03df0lA7irZA5+naG7u3c3hkDBh3
  S7jX/PEtSZszJ578FHAKn3H12cs5z9Z8/lIxspP0xb8/vXTwcEnI9hfLEvg9B+fU456iyWm5q
  kduL1s2WYl89mz5E8r9SmICshLbdbRFH0cv15EVzpZ8Wwpj56Bg3Cvy89v3NsqNPhL9G/+a09
  ZFeyVqrr5d/973Q3OB4S1Zll86hStU9q32+1BlUHnC2ETia0l66e8LmW8/vZ7hd2fPdb3k561
  /euWT1IzP17Rq3FgXiybaNsHvrnhRgrlXXWeSizFGYmGWsxFxYkABoul2HcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1660543945!46528!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15554 invoked from network); 15 Aug 2022 06:12:25 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:12:25 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id A45AC1AD
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:12:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 995651A3
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:12:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:12:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gjs: upgrade 1.72.1 -> 1.72.2
Date: Mon, 15 Aug 2022 14:12:03 +0800
Message-ID: <1660543925-1319-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660543925-1319-1-git-send-email-wangmy@fujitsu.com>
References: <1660543925-1319-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:12:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98236

Changelog:
==========
- Various fixes ported from the development branch.

- Closed bugs and merge requests:
  * gi/arg-cache.cpp: Fix building on Visual Studio
  * doc: Reflect support for constructor with GObject

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.72.1.bb => gjs_1.72.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.72.1.bb => gjs_1.72.2.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.72.1.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.72.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.72.1.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.72.2.bb
index 355894073d..3170341560 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.72.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.72.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "mozjs-91 cairo"
 
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even pkgconfig
 
-SRC_URI[archive.sha256sum] = "17c0b1ec3f096671ff8bfaba6e4bbf14198c7013c604bfd677a9858da079c0ab"
+SRC_URI[archive.sha256sum] = "ddee379bdc5a7d303a5d894be2b281beb8ac54508604e7d3f20781a869da3977"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
-- 
2.25.1


