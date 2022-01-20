Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE15AC433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 07:24:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.8734.1642663453146030020
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 23:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bDpjQ87J;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642663451; i=@fujitsu.com;
	bh=81oAWZjeh/Vh7ZaKRNTcRq32phMSxj7Gj+G/wGaRvJY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bDpjQ87JtXnGzn/KbN1jAepNJGskxaCCsFTgAPkPJMUt95RZ3IC+l2ZeAhGaErvkI
	 HxBGHAPQykVeQxP7jA66gV/3/TJ3DZdflC/OucrV+YBSWf43p20B4fnM6+YHOhHtHd
	 RIZttCT1AVLCmKNih7J+U9/yim0yLVm04eUkJBswOnenomXD5WTtMK8hKqayyyQq9F
	 bXolY1FoAPXmKjzhUqCP2ZtepuCLwVzObiLIHx9vbxS3Xkf0AteX+fbj8pvU889T4S
	 jypbppDSQAs8ZNaEML09qyKSOGbXX5AV3MGuRRdB11f/XrYuhZlXxfNZz3XX4hmMu9
	 wUqqWmNVNgC8w==
Received: from [100.115.39.105] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id B9/92-28974-A1E09E16;
 Thu, 20 Jan 2022 07:24:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqCvF9zL
  R4OsmbYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP83zmsBb+5K5Z/a2ZrYPzH1cXIxSEk8IRR
  4s3J2ywQzgUmia8/VrBBOCcZJU492cXYxcjJwSagLvH45mswW0RAX2Lp7D3MIDazgKpE98U17
  CC2sEC0xMNXEDUsQPHWRZuBajg4eAXcJXp2hoKEJQQUJKY8fA/WyingIfHq6BIwWwio5MepLW
  CtvAKCEidnPmGBGC8hcfDFC2aIXiWJEys+MkHYFRKvD1+CiqtJXD23iXkCo+AsJO2zkLQvYGR
  axWidVJSZnlGSm5iZo2toYKBraGiqa2yqa2hiqZdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZ
  m5yTopeXWrKJERjGKcXKU3cwnl71U+8QoyQHk5Io70W2l4lCfEn5KZUZicUZ8UWlOanFhxhlO
  DiUJHhLeIBygkWp6akVaZk5wJiCSUtw8CiJ8L4ASfMWFyTmFmemQ6ROMSpKifPy8wIlBEASGa
  V5cG2wOL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZjXBWQKT2ZeCdz0V0CLmYAW9z97BrK
  4JBEhJdXAtI5FMpi/JLnuziw/5107fzzht5dNVp+fta62/LGBcfqRif168orLef89deFy7pvE
  //xIKHvTlu5TXteUIqdtU+V9HRCZsnj3JoNc/l42njuRGaH3bIWWf5JTsdNjMxN9+0E7Jdsn9
  OaGDEG9KVtt3zKf0Tyeeumq76T/AuHxe/xPC5nfseTibc65KtSyPM8zWE2l3+yVmppk1YVXOX
  6zSoz4wnVKGq+2BviwP7p0UsbHwO/e9lmvvvMu239hx/faVFN26wXe+r6Tg3zY/EX4un8cXxS
  dHZfOtuTUtkul367N6/Suv/nV6NHFuFwt73UtL8q8ZvWa6ntUNCr8tDWS2K+bkNz3ZbEQT52h
  hxJLcUaioRZzUXEiALkhGm5eAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1642663450!70273!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10350 invoked from network); 20 Jan 2022 07:24:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Jan 2022 07:24:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 453C410018A
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:24:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 222FE10019E
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:24:10 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 20 Jan 2022 07:24:07 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 2/5] [oe] [meta-python] [PATCH] python3-argcomplete upgrade
 1.12.3 -> 2.0.0
Date: Thu, 20 Jan 2022 15:22:21 +0800
Message-ID: <1642663344-16829-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642663344-16829-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1642663344-16829-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jan 2022 07:24:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94950

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelogs:
=============================================================
Truncate input after cursor. Fixes #351 (#352)
Support of path completion in fish #327 (#359)
Drop support for Python 2.7 and 3.5 (#361)
Add support for Python 3.10 (#356)
Test, documentation, and release infrastructure improvements

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...thon3-argcomplete_1.12.3.bb => python3-argcomplete_2.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_1.12.3.bb => python3-argcomplete_2.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.3.bb b/meta-python/recipes-devtools/python/python3-argcomplete_2.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_1.12.3.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_2.0.0.bb
index aff0c97ec9..4eab34f488 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_2.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "2c7dbffd8c045ea534921e63b0be6fe65e88599990d8dc408ac8c542b72a5445"
+SRC_URI[sha256sum] = "6372ad78c89d662035101418ae253668445b391755cfe94ea52f1b9d22425b20"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.25.1


