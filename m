Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B07C53210
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:40:39 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.3827.1672803636939498620
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PsIiQNXi;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803634; i=@fujitsu.com;
	bh=VuwjdQl16n/xrT+yshAmnh4ROPhybtHbC+Za1ivHSbI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PsIiQNXiv3+UQdClSm/FmetoDtWFx7pm8I7/LdQJF706A7UW+Uwzt11CBU2IitZaC
	 y04fuTDHUcDqX8P7vWwSPNrb+HkRhoTWcomha+9ZEkYdXSNrF+oEd31m6+iuQEwT+5
	 s5fM+ezazMZMymH8AlwLvpbdvGOUVy7vYpSOEiHAvVZhB3sQ61XlEdQk28tl3mExud
	 U3zd2RduoOWvJjkOfkIWH1MFFg7zdWaaTrt4I5ltnwmkcYZF9umfgvsZY2vIcwzNTE
	 7WpnQ5y8SKfQZEipGNvtQkZhg+9T8amHdVo0zHsBeyJ9L+g/7MlSQKLRO4uIEKNYQC
	 M1mjzPeYl0xEQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqGv4dUu
  ywdxLOhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bz7EesBT3cFf92nmJqYPzC2cXIxSEk8IRR
  4taa9cwQznUmieM/d7JAOLsZJQ597QbKcHKwCUhJ3Lj/nw3EFhHQl1g6ew9YnFlAReLF7x72L
  kYODmEBJ4mGtlqQMIuAqsTVtT+YQGxeoPCKzS8YQWwJAQWJKQ/fg7VyCjhLfHsNsosTaJeTxJ
  +jT5kh6gUlTs58wgIxXkLi4IsXzBC9ihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMZoVpxaVpRbpmuslFWWmZ5TkJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibn
  pOjlpZZsYgQGb0pxws8djBuX/dE7xCjJwaQkylvyeUuyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  Qle9U9AOcGi1PTUirTMHGAkwaQlOHiURHizQFp5iwsSc4sz0yFSpxiNOe4u3LuXmePqlSt7mY
  VY8vLzUqXEeZ+ClAqAlGaU5sENgkX4JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvKtBpvB
  k5pXA7XsFdAoT0ClJazaCnFKSiJCSamCSeMmp0qgv0nVnheu2iZ8mZ/zhnbAlscz2+WuBrLfH
  vJJkpkTMj2vO/n5v7/3Lt54fNYuoTlTv+7wpfYP5x1nbwzof8Tx5s+Lph7lxMukdd7Xub1Qw5
  3ozqeezIZPFjKQl/WJXJurf5EtYJLjn09KME5028wR/bBH8n3P74uX1vgePCm2MdrRM0v1Tzu
  F1l3Xag6CHnjo61tvtJQxbZBjKMtWTLI6sVyhhc3M6Ntf+nVvP1x+OirHiW2K00nn0096EKjB
  vWni+Zq4uq92mY1JHbuuLGaq2Wu+elXL/UJ78FhU5Vq61DHpSTJMeBaycG2alcbLppn3Yuj1H
  5WbeSVeY5nyF5d1N6w0vzUNDL79VYinOSDTUYi4qTgQAEkPzb2sDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1672803633!358893!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17583 invoked from network); 4 Jan 2023 03:40:33 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:40:33 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2A708100192
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:40:33 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1E635100188
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:40:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:40:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pcsc-tools: upgrade 1.6.0 -> 1.6.1
Date: Fri, 30 Dec 2022 12:56:52 +0800
Message-ID: <1672376212-25291-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376212-25291-1-git-send-email-wangmy@fujitsu.com>
References: <1672376212-25291-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100375

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 196 new ATRs
 use colors on NetBSD ("wsvt25" terminal)
 pcsc_scan: always print the version in verbose mode
 Fix Hungarian eID URL
 Update smartcard_list.txt
 update ATR name
 Fix typos in card list: healt -> health
 Add 6 issuer card ATR descriptions
 Updated Finnish-related info in smartcard_list.txt to make it up to date

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pcsc-tools/{pcsc-tools_1.6.0.bb => pcsc-tools_1.6.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pcsc-tools/{pcsc-tools_1.6.0.bb => pcsc-tools_1.6.1.bb} (89%)

diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.0.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.1.bb
similarity index 89%
rename from meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.0.bb
rename to meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.1.bb
index c9e7eae27..6a2e1b2e0 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.0.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https;branch=master"
 
-SRCREV = "c6e9fa746d00e08fc71c57c79e305669ff2e3106"
+SRCREV = "63e532cfa97932aac76ca5f7473d1ce11602a139"
 
 inherit autotools pkgconfig
 
-- 
2.25.1


