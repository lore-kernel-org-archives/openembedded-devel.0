Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84508C4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:36:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.37616.1670830586243081015
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mdK2sAGs;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830584; i=@fujitsu.com;
	bh=BMl3f/RBacT4GLrXZoRCr5lKLwJbT/0DgYyD92Szycw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mdK2sAGsU/m5eOHKqnBiLgKKZaFemtRq99LSCUv8ZroQBG7fRXw8XyFgw32upuVYF
	 aTp9ePKX8gNyYar3pOf+TtwElTCBxONKyRGQdJfC19RIEsUjklpGVWx1rGevdYJLTt
	 nckOZbw6p48neY9+W7QgqJ/HR673HN5P0FYLMMWZ8fJidvf/6OOQPmZHOukT8Vm7wJ
	 6f492W+ON9nJ79Mqdk2Hh+GHrHYMCVJAp8zMvqAVTvwjRtc5pyQ8nrmlaWLXqYKXmz
	 UUfx3RrQ/zTVIAh0gOJQ2jLB7uPVbqwGyNrNsJM07cEMlfVYPkuCN09E2YnFT3r4HS
	 G5UKu9HdM983Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWffHzWn
  JBj/e8VhcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBm/J99hKnjBWfHi9F3mBsZ+zi5GLg4hgYeM
  Epd/trNCOJeZJN6fOsHWxcgJ5OxhlJi9ywnEZhOQkrhx/z9YXERAX2Lp7D3MIDazgIrEi9897
  CC2sECAxLvvi8FsFgFVidXPFgLVcHDwCjhK7FymBRKWEFCQmPLwPVgrp4CTxL3N3cwQqxwlmv
  ZvYASxeQUEJU7OfMICMV5C4uCLF8wQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjGaFacWlaUW6Rqa6iUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym
  56To5aWWbGIEhm5KscKlHYxvlv3RO8QoycGkJMpbeWVashBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3g3XgHKCRanpqRVpmTnAOIJJS3DwKInwuoG08hYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS8/L1
  VKnJf9BlCRAEhRRmke3AhYTF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxrcx1oCk9mXgn
  cpldARzABHRH1cirIESWJCCmpBiZDDo9PB9WNSvN1eLysQ3xmJMWrX7ld+1FvUqWzov20A48l
  jZUPzhSYcbDlk/RNF2emkrVFhQf/lotYCgUuvClUdmmTmtAiFrMJZqVepZlm4R/1Zl9v3LAkI
  cAl6LuCyGsZqWKzfUttxD75PVo1V2+Zvln4Kq/dby40bPyuFR/Zt+JQaHf1qcOihtc6r3s803
  ZWzVdZssYj/Mr/iMPGBxlNc2OO5jupf1afMNcz+I+vmpUdx7ofmzzcmj+s4W/aafVlT9TU7Q/
  cWkU3yl5fwuakqhK0Q0Qj9e7tG3ufHORz12ps9T7V6n9UV4Zd+f0+168SSb+XaratnCYuxZ+z
  w/nub7lHNbtnyc5ePlusR4mlOCPRUIu5qDgRAC3g1nJkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1670830584!152551!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12729 invoked from network); 12 Dec 2022 07:36:24 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:36:24 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E7ADE142
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:23 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id DAE0D7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:23 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:36:22 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.10 -> 4.21.11
Date: Mon, 12 Dec 2022 15:35:46 +0800
Message-ID: <1670830548-3059-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830548-3059-1-git-send-email-wangmy@fujitsu.com>
References: <1670830548-3059-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100042

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-protobuf_4.21.10.bb => python3-protobuf_4.21.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.10.bb => python3-protobuf_4.21.11.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.10.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.11.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.10.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.11.bb
index 0ddd49cfe..9d44c161e 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.10.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.11.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4d97c16c0d11155b3714a29245461f0eb60cace294455077f3a3b8a629afa383"
+SRC_URI[sha256sum] = "2c6a4d13732d9b094db31b3841986c38b17ac61a3fe05ee26a779d94c4c3fb43"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


