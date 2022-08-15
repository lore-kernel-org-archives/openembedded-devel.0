Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DAAC00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:40:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.13633.1660545595803009640
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=y9xZ8pmD;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660545594; i=@fujitsu.com;
	bh=aGuQhZmQuq3hnvzUK6sU1m8Ifvm4b4zJi2Alkmk+zX8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=y9xZ8pmD6ZtZN/k8WZNy0CXceAf3+NU+sFJjM9SYiC4eJIbPAIc8LwDZA/+435FfU
	 YTa3LeVw5oH5ixtBUwb63LwWVqFPgDf+zchR+n2Fv0AG4MeuVIzZ4Okg4EbUP2pF8P
	 bTP9Pu5gw+Bz6/7USDRAcKA7onuVI+DH6hM+4834a28Pf1dsI8wPW0cgBdqGdp8WGI
	 2pXlxXHX30kiz0LqayX46iOeuMJpTje4yGDrfhrQWunlSJx036BjxZK3eehRngIy7v
	 Tun6im/6hXuf4bG1x4wf2JnVUQP6SmJRgFGH5GGvnuttHMHZFB+L4kY0OlsI2NSu3j
	 z0L6ZgNmtxnDw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpGv56me
  Swc0dphYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bFVZ8ZC75wVuxcVdrAeJuji5GLQ0jgIaPE
  3t2TWLoYOYGcy0wSy1exQyT2MEr8bp7IBJJgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBZYvrePWwgNouAqsSEIw/AbF4BR4lD16aBzZEQUJCY8vA9WC+ngJPEnMZFbBCLHSXmbv
  nODlEvKHFy5hMWiPkSEgdfvGCG6FWUmH25mQXCrpCYMWMbG4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjdVJRZnpGSW5iZo6uoYGBrqGhqa6xpa6RgYFeYpVuol5qqW55anGJrpFeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgEKcUq5/Ywfh05U+9Q4ySHExKorzXLv5MEuJLyk+pzEgszogvKs1JLT7EK
  MPBoSTBW/ocKCdYlJqeWpGWmQOMKJi0BAePkghv3wugNG9xQWJucWY6ROoUoy7HzK9tB5iFWP
  Ly81KlxHmjXgIVCYAUZZTmwY2ARfclRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8l0Cm8GT
  mlcBtegV0BBPQEXp3v4McUZKIkJJqYFq4NO300UuN562Dd1ldf6arFCuaea0mrfpK4+SKc+2r
  stPv/NO9fi+EpU0nx01xp6eYpLFBd886t+f6982y9iSLt3fun3vpndHsvUGnlNsf7pnua5X63
  P/K0ik7Nj4yWdLtkRf34qTxG1mPl+c2nO/UaNw9N961qIZTx43rwakGZrX0HVPkHzDfspj+IY
  v/hMuBooerWl5mMi6/dkSxuHn55bIbOhenSm6sjFuiW3r6qKZGWnHAjss8c7/vEo9RPnD9Z9J
  zidZ6QU/rM14VEY+7TKP2Pw5d6bNA8UnszQqrrVe+rGOW13j3ZXclR0NwXkXbYtWmeXvry/ZJ
  F/yaGhSsUvi+7cis/Tf/CjxLMlJiKc5INNRiLipOBAD0swS4aQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1660545593!482144!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16117 invoked from network); 15 Aug 2022 06:39:53 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:39:53 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 951831A3
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:39:53 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 89BA97C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:39:53 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:39:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 22.07.0 -> 22.08.0
Date: Mon, 15 Aug 2022 14:39:22 +0800
Message-ID: <1660545563-1580-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660545563-1580-1-git-send-email-wangmy@fujitsu.com>
References: <1660545563-1580-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:40:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98252

Changelog:
=========
 * Fix rendering text on some forms
 * CairoOutputDev: Support Type3 charprocs having Resources
 * Fix crashes on malformed files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_22.07.0.bb => poppler_22.08.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_22.07.0.bb => poppler_22.08.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_22.07.0.bb b/meta-oe/recipes-support/poppler/poppler_22.08.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_22.07.0.bb
rename to meta-oe/recipes-support/poppler/poppler_22.08.0.bb
index 33723a560d..c75bf79e47 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.07.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.08.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "420230c5c43782e2151259b3e523e632f4861342aad70e7e20b8773d9eaf3428"
+SRC_URI[sha256sum] = "b493328721402f25cb7523f9cdc2f7d7c59f45ad999bde75c63c90604db0f20b"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1


