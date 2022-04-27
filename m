Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6594EC433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 06:38:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.6855.1651127874009299149
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 23:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ODWkTjqa;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651127872; i=@fujitsu.com;
	bh=AFQBM6xi9+dokQwRL6cjrC6rkcaDEv6DERUXs2jFUO8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ODWkTjqait+yMDuYH8YwfMj/P7aXpJktoLoFx9HRRZrdfF8g/UKy8VLFDc0ufx5Jr
	 DJhVyJoE5xG7s/do/L3txYaqIAG/YeBkOo8VKevc6g5855bU4M1um/vWGr/wlPcXzi
	 tscnpje4MkWIt+LW4TXtB6/JTUQdPs19XfFAoWA3eeuX8MGUH5TtPyXyZJmkqc4/NM
	 +DPxmsUZp8MtgP/Y6JfyJT7ljfkzR/Nb2zW5WwOEIuB1ctrl5LeEuvmzxkYY89mOPw
	 zVQh3OFztDyeRouBZG0U8+EefKoIIJ/gHCHnaWVaAWEUZzfIScXZPXpN2DDP1Go3hl
	 4W71rX6jcpE8w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSdfeLCv
  J4OUCU4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP/xGy2gsOcFee+8DQwvuPoYuTiEBJ4wihx
  avYDVgjnApPEw1072SGcPYwSFy5/Z+5i5ORgE1CTmH7rBiuILSKgL7F09h6wOLOAisSL3z3sI
  LawQIDE9g+/mEBsFgFViZ3fH7F1MXJw8Ao4SRx6WwkSlhBQkJjy8D1YK6eAs8TPdxPBWoWASv
  omTQJr5RUQlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C
  0L2BkWsVonVSUmZ5RkpuYmaNraGCga2hoqmtspGtoZKaXWKWbqJdaqlueWlyia6SXWF6sl1pc
  rFdcmZuck6KXl1qyiREYxCnFCnU7GK+t/Kl3iFGSg0lJlNfKNCtJiC8pP6UyI7E4I76oNCe1+
  BCjDAeHkgRvtglQTrAoNT21Ii0zBxhRMGkJDh4lEV4ZY6A0b3FBYm5xZjpE6hSjopQ470KQmQ
  IgiYzSPLg2WBRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMGw0yhSczrwRu+iugxUxAi1c
  WZYIsLklESEk1MMkvUrVRyYiN+/JbdunH88GRT5wyUg6kJF/TcfpZ97Fh7+veTXqhl32P3rrD
  ff24hNfCg60zVq8Tlz146mnL9vevqlgqTP4z5Laf5HF5unf73h5D8Z+3jxSVmEgFhq0QWsqjf
  2nHsrM22U7XIy/P/piw+VeTlk/TFh/bgDV7vQwlTz3cLRsRutbvGbeeHM/+zhjbfRHpO74rHf
  ysf3HCbofAyNmPbzbmBDWoixzXfp6YvjHu+3WPRYE3nygsqJMWnhDnNPHeek7zDY/feiw+yza
  75/M3+YyJ99Lnq36sCF5Vs/3/4/2Cem0hjHWla0L3yb25HOJj1dp238XNQaDDt/TEoQXSzgEH
  laTnNySz/FViKc5INNRiLipOBAAXBPWJXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1651127871!7633!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20948 invoked from network); 28 Apr 2022 06:37:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 06:37:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8060A10044A
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:37:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6CAF810032A
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:37:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 07:37:37 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-textparser: upgrade 0.23.0 ->
 0.24.0
Date: Thu, 28 Apr 2022 06:53:27 +0800
Message-ID: <1651100009-17477-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651100009-17477-1-git-send-email-wangmy@fujitsu.com>
References: <1651100009-17477-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 06:38:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96822

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-textparser_0.23.0.bb => python3-textparser_0.24.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-textparser_0.23.0.bb => python3-textparser_0.24.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb b/meta-python/recipes-devtools/python/python3-textparser_0.24.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb
rename to meta-python/recipes-devtools/python/python3-textparser_0.24.0.bb
index 0c626e7aa2..8db949d0dc 100644
--- a/meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-textparser_0.24.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/textparser"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fe9942a8bba5458a9dbd11277bc347ad"
 
-SRC_URI[md5sum] = "d5378eac93406156e9029114aaa1b515"
-SRC_URI[sha256sum] = "f009d0f6f78aa7c1e648dca4e3961f6d67495f7f520f1a705245ffad33f4b470"
+SRC_URI[sha256sum] = "56f708e75aa9d002adb76d823ba6ef166d7ecec1e3e4ca4c1ca103f817568335"
 
 PYPI_PACKAGE = "textparser"
 
-- 
2.25.1


