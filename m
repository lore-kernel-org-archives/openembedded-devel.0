Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EBCC54EBC
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:41:39 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.3742.1672803691662193604
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oD+JAHTg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803689; i=@fujitsu.com;
	bh=UnkhfO7sjrck4maKSSCbi51GHYBIv6xJ79XQnRR6xss=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oD+JAHTgHmHiIMz6XqT9s6UXD9eXx+8+bqmGo2LuI3XMYwEyhl5QvQQApVHaT7Lwy
	 D0veyNVMzw3SYE1iG9ftqRD7jugqGFdkKRU6uKEijqJ9NFYuQoPgwtBo6DnvodveAX
	 mN9S1RfQn1XGWxfllr3m1wasCYSdP+DZTvlIBqTO+89/k6jQeasNAcTI0om7umy4JV
	 YArfFN4fekmo56ARUxY/YRzDBFrrjeOIJkDYDu/MjCFjsYum+KSjs14s/We90cdUxW
	 nM3M53ISuECGHNzCcbCTdFImtvO69/OR0P2hfG9rYgdRiIrfzI6WIbhOdJYDHmZBNt
	 q+5qwlayklipg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8OxWTfj65Z
  kgzXTbSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyDGx+yFzRxVpx99YmpgfEfexcjF4eQwENG
  iXdzt0E5V5gkDs77zgjh7GaU+LOwnbmLkZODTUBK4sb9/2wgtoiAvsTS2XvA4swCKhIvfvewg
  9jCAs4SCxo/soDYLAKqEmt7P4PZvAJOEgtaOllBbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy83s0DYFRKzZrUxQdhqElfPbWKewMg/C0n7LCTtCxiZVjGaF6cWlaUW6Roa6iUVZaZ
  nlOQmZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZkSnGq+Q7G78v+
  6B1ilORgUhLlLfm8JVmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK/6J6CcYFFqempFWmYOMDpg0
  hIcPEoivFkgrbzFBYm5xZnpEKlTjLocdxfu3cssxJKXn5cqJc7r+gWoSACkKKM0D24ELFIvMc
  pKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmXQ2yiiczrwRu0yugI5iAjkhasxHkiJJEhJRUA9O
  Vd3m6qS+3b78xvWnlxZfO/5dwS9mcf9IVfy63YMWPabXf623j5ZkmL3rywepje4hx21zHp6fv
  JiYkrvFzTrr7Ky8y2EZcfIXsnr8HXV3ltr/in7CkWKggUJhNNyErffaGRQWc3083ukfOb7AXP
  2HMWXi1/uKtY7qHjtsLqr0yY1jzkdHh/vU9roc1eu06dT20j7tr791guc81dOvxWxu95VaFst
  RdZZFZUcarkLSgsj/u0L/H6nktc2bP8565oZKt5ETHk3R13zUOPhOXpay6M/vVDZ8Lk9ljOPO
  Z/3qyzZ6oM9VGMM+R45TptNJHvRY5PDvPFP67/aXkQ+rys7sKamPfrhEMct8VGFbKUqXEUpyR
  aKjFXFScCADqvmnzTwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-732.messagelabs.com!1672803688!952718!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24626 invoked from network); 4 Jan 2023 03:41:28 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:41:28 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 76E77152
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:41:28 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6AA3D151
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:41:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:41:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 22.12.0 -> 23.01.0
Date: Fri, 30 Dec 2022 12:57:57 +0800
Message-ID: <1672376281-25331-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100376

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_22.12.0.bb => poppler_23.01.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_22.12.0.bb => poppler_23.01.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_22.12.0.bb b/meta-oe/recipes-support/poppler/poppler_23.01.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_22.12.0.bb
rename to meta-oe/recipes-support/poppler/poppler_23.01.0.bb
index fb00b489a..849c35812 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.12.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.01.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "d9aa9cacdfbd0f8e98fc2b3bb008e645597ed480685757c3e7bc74b4278d15c0"
+SRC_URI[sha256sum] = "fae9b88d3d5033117d38477b79220cfd0d8e252c278ec870ab1832501741fd94"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1


