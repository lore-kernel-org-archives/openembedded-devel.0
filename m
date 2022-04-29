Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08DDC433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:26:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.29224.1652084771435617582
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WmRcgZbg;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084769; i=@fujitsu.com;
	bh=pYLTl703WLdsdjZW08Ekn+cI9OZYBBu1eRhj7OKSBzQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WmRcgZbgZkxxCzsgR75DAiYPCI40cjLMULZg3jead1m7Is3TI0U51lg8N7BzR1xDv
	 0qA1GQx8tOsvkd6apRzwJQ3UzpJ42uNFtUEP0GQLCc7Rv61HQWc2KdCBujlBvcIHXX
	 MqvZaqEgYPa5Jo6CW7FRgmhuypzbmva9ubKY8uFy2y2RRpBOXiTrkrx9GEiIda2rqp
	 2acVNVt7xtx3nVr2IvwLEJ4peygXJSyStI1Bwj/hgKQOOwZPvpZkxRdUYfCzK+xJRw
	 BXW1M3c4jpLRgtOj1/dm9aSF03kjk/MCsWhwT0cLU3EbZPZqza5KzcUuUZOwmYGYYb
	 XM11Z4FaYoHRQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqKt4oSL
  JYM9rRYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePsy4tMBfP4K27cmsnSwLiat4uRi0NI4Amj
  xJd5U1ggnAtMEu0/b7JCOLsZJf7PWQWU4eRgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBR4sj7JWwgNouAqsT9E+vBbF4BJ4ltn1aD1UsIKEhMefgeyObg4BRwlthxuBIkLARUcv
  b0AxaIckGJkzOfsECMl5A4+OIFVKuixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM1klFmekZJbmJmTm6hgYGuoaGprrGprqGFiZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBYZxSrLxjB2Pbqp96hxglOZiURHkrmyqShPiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwhpwDygkWpaanVqRl5gBjCiYtwcGjJMJ79wRQmre4IDG3ODMdInWKUZfj7sK9e5mFWP
  Ly81KlxHmLQWYIgBRllObBjYDF9yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxK54Gm8GT
  mlcBtegV0BBPQER8DSkGOKElESEk1MPmu9JnYHmI443VBRKbMHeevypGxWxu3Fsyw1l9ltMV/
  x+XlAp3uc9dnpJRpiIpYevaI3jOZf+70KvnqpbqxMr1RKtKL9s9VqGW+ybd0UsZ8v6D3AbmCc
  udvnWe22ni7VjX0xLENm/9flsqbaeHAppDNyfLXJeMC77tdy164iMxae13jhGa4jWfSzFVn1b
  9fqfxWEOJQ9n2zec8rfmOvU3OTXhw5nlY4kXN6XoiVFI9m4YQ5TXFTd3zYcXv3SZ3PC9xLD5Q
  esr9g9PDhScXnDPnxJ0Q/1PmzepTaP5WWNnjYnVe3zuyaRN305Qul67d2HMiNauWKDAwJOl3X
  uCCjMcx2rvMupr15IUXPFt18rcRSnJFoqMVcVJwIAC/5KURqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1652084769!351290!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13673 invoked from network); 9 May 2022 08:26:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:26:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 06F3910018B
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:26:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AEA1110018E
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:26:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:25:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libmbim: upgrade 1.26.2 -> 1.26.4
Date: Fri, 29 Apr 2022 16:08:06 +0800
Message-ID: <1651219689-27457-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219689-27457-1-git-send-email-wangmy@fujitsu.com>
References: <1651219689-27457-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:26:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97000

Overview of changes in libmbim 1.26.4
----------------------------------------

 * build:
   ** meson: force building doc on normal builds, not only during install.
   ** meson: fix 'export_packages' in GIR setup.

 * libmm-glib:
   ** compat: deprecate the MbimLteAttachStatus type.
   ** net-port-manager: use unaligned netlink attribute length.

 * libmm-glib, docs:
   ** include MBIM proxy control service in docs.
   ** codegen: add section doc for each service.
   ** utils: add missing short description in section.
   ** compat: add missing MbimLteAttachStatus doc.
   ** device: add missing mbim_device_list_links() doc.
   ** device: fix MbimDevice 'device-in-session' property doc.
   ** version: add missing MBIM_CHECK_VERSION() documentation.
   ** device: fix wrong reference to QmiDevice

 * Several other minor improvements and fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmbim/{libmbim_1.26.2.bb => libmbim_1.26.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.26.2.bb => libmbim_1.26.4.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.26.2.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.26.4.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.26.2.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.26.4.bb
index 66d55f9c0..97f3f6825 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.26.2.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.26.4.bb
@@ -12,4 +12,4 @@ DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "10c77bf5b5eb8c92ba80e9b519923ad9b898362bc8e1928e2bc9a17eeba649af"
+SRC_URI[sha256sum] = "f688cec4c4586a17575f5e327448ce62f2000ef6a07c9e4589873d4a68568ad9"
-- 
2.25.1


