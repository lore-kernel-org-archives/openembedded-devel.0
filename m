Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0550FC63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:19:53 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.191289.1673939982674062349
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IYljhF0D;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939981; i=@fujitsu.com;
	bh=srSgAq4R1aCrToikgolEfC4QLCWOLRhs4n45TPy2n4k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IYljhF0DjlZQg4HFCUuTVH6y7F4PTIqTwEj+NIIwa9hMyiTG2IMPqLjzBmidl+zFG
	 FmvYghPsSnPvrTjjkcFM1RJUfUsXzDD2fQSAFFTTRWzw3OTJ+/Y+/NQsLnalYT+J9f
	 vhc/tuIelm7x9VXEH+gVUUT0aShCDh1mSlE1Y+UZ9sg2vSn6p3kNx+smpMRCqTYKMK
	 wdXNTgllKX3PnYnlosz2cN/zMu+SOzc9WoeFtv8yImN2iA9e7iiC2x2Td0fQy0GKO9
	 BifHH2DWEcqxYhHOnegNf/uYDOTvifzH4q2epu5NyP+mo7XZlBHMaiD01Es1Bzyafr
	 XI12BjY4ZJRwA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWZfH51i
  yway5GhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a5i1vZCo5xVWzuPMHUwHiNs4uRi0NI4CGj
  xP/Tv5ghnCtMEl8mrmeEcPYySqw6coOpi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBb4kpy4+B2SwCqhJLt7eA1fMKOEksO3IErF5CQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  VUjaLE7MvNLBB2pUTrh19QtprE1XObmCcw8s9C0j4LSfsCRqZVjKbFqUVlqUW6RnpJRZnpGSW
  5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgcGYUswyewdjz9I/eocY
  JTmYlER5T5oeSxbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwXvKCygnWJSanlqRlpkDjAyYtAQHj
  5IIb7glUJq3uCAxtzgzHSJ1ilFRSpz3GkifAEgiozQPrg0WjZcYZaWEeRkZGBiEeApSi3IzS1
  DlXzGKczAqCfM+8QCawpOZVwI3/RXQYiagxR4lR0EWlyQipKQamOI4z3P8Dz/5c2lgflrgEel
  wuyitZ7nsB47vySjzX/xxIvMHDoWby9sNj7xKU10Q++6nDevU74bWTWeXSvLp3anJ1ThSM/9A
  2oPcu5qMFYIzmif+iGqo7Ky64Ncuk5F++464X8jVgpql307+XP9k/qnQmsArxwwZ5h6+oicv/
  CDCsV1v7Qn+j1vCVq3csFuYISrkw1Tz6KnPdQUXTC1ddCPn/kKG/n/PtU6Iq1k93Cw3USJxbY
  zTjub3DFfq16d7vEvZI+b/pknD0OTs33fT7Zimzp1Zskqknf9T88+7RUvWec72v7Apy+xbYsf
  O66pih36ayjVsEnCYcDhI+OuL6iLzdZpWJlWGryTSGZ5LxiuxFGckGmoxFxUnAgA7z6h5QQMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-587.messagelabs.com!1673939980!381993!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8165 invoked from network); 17 Jan 2023 07:19:40 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:19:40 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 48928150
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:19:40 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3CDA373
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:19:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:19:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-txaio: upgrade 22.2.1 -> 23.1.1
Date: Tue, 17 Jan 2023 15:19:26 +0800
Message-ID: <1673939970-20246-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100609

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright changed from "Crossbar.io Technologies GmbH"
to "typedef int GmbH"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-txaio_22.2.1.bb => python3-txaio_23.1.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-txaio_22.2.1.bb => python3-txaio_23.1.1.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb b/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb
rename to meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
index e2102695ec..7559accf41 100644
--- a/meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3e2c2c2cc2915edc5321b0e6b1d3f5f8"
 
-SRC_URI[sha256sum] = "2e4582b70f04b2345908254684a984206c0d9b50e3074a24a4c55aba21d24d01"
+SRC_URI[sha256sum] = "f9a9216e976e5e3246dfd112ad7ad55ca915606b60b84a757ac769bd404ff704"
 
 inherit pypi setuptools3
 
-- 
2.25.1


