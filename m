Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD290C352A1
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:15:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.101879.1670066143413524901
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:15:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PsDD5nm7;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066141; i=@fujitsu.com;
	bh=OJvb9KYpoImv11PbDHzjIxwKnbGVC9x++IA6ajElMpk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PsDD5nm7IcQ5Ooo+1beBK26QnxeXT+pa/4RPz6a/zojZcipcGEQrA0FYTEmoDXIg2
	 iewZaqAt9e+ZA1zkFQhcJHXxy3miDP3Ckgy7J8VgurlFsMCbSyJjOFKNVQ0aoRhuz7
	 MPTvU0ZjWiNrSV0HgWw/lr1O5QTJX8TIy6KD7dEXe4TaQ+QgJ0KCeNLz6hQzbTgi0x
	 IE3Rne5b4Yv/NT2xTh8ZwygGdFf6uv5ELG+KswkzfiazXd9AoGc4WZLnLAIviYh0r2
	 mUz18pT7Jfdu7aqLlDg3nX3/BKGk6ZXhQ2vFqo0+iovT/dAaWhkwoKzGJqP+syDIdx
	 a5mjZBIKR4x1w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqHtXvzv
  ZYOVEFouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPtlAOMBd84Kg6/9mxgnM7RxcjFISTwhFFi
  UUMnK4RznUni5sS/bBDObkaJjpermboYOTnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCX2Nj0DKyeBSj+csFisDivgJPE6geHGEFsCQEFiSkP34P1cgo4S3yfMhtsphBQzZbnX5
  kh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMZoVpxaVpRbpGhrpJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjl
  pZZsYgQGb0qxUvMOxr/L/ugdYpTkYFIS5T0W1pUsxJeUn1KZkVicEV9UmpNafIhRhoNDSYI3W
  rs7WUiwKDU9tSItMwcYSTBpCQ4eJRHeLlWgNG9xQWJucWY6ROoUoy7HzK9tB5iFWPLy81KlxH
  nl9ICKBECKMkrz4EbAovoSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeMZApPJl5JXCbXgE
  dwQR0xEb+LpAjShIRUlINTHnXW1PMFj5Mni2QMuHAB9Ov2W4/1/OrXM7uSN5/pnr11Ko27Uzt
  9gdvr7Om+cqeTWE6HRldu9HuhEKRUZDwtM41p7aqhts9D3p5+a/QarUETc9lxZflcyQ3vQv58
  SExYu6lpyLdMzMZ1rFlfr3C+K1K4WWcstyhv/FTZxU9mvg7PeKgluzuKcVz5GY/dS/021zryM
  ytu3PGnfd39kx1et5lo1RgKLGJseSRjtSy00X7XRaejrKK3PPx6q4VUmrKcy1fGnisSzvYe3X
  dbUa5/zNdZPYIuD+68MFH+su87TeZP525+kPD/dhnP9FNW/bzGDw5oLMmS6/yg0zPBK10vd0X
  tfviXslpTY5UfVwstFOJpTgj0VCLuag4EQAHjHaVZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-548.messagelabs.com!1670066140!65112!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32256 invoked from network); 3 Dec 2022 11:15:41 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:15:41 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C1D59100191
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:15:40 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B619F10018D
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:15:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:15:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20221120.0 -> 5.9.20221127.0
Date: Sat, 3 Dec 2022 19:15:10 +0800
Message-ID: <1670066113-24646-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066113-24646-1-git-send-email-wangmy@fujitsu.com>
References: <1670066113-24646-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99922

From: Wang Mingyu <wangmy@fujitsu.com>

Python: add more weak keywords

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20221120.0.bb => ctags_5.9.20221127.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20221120.0.bb => ctags_5.9.20221127.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221120.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221127.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20221120.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20221127.0.bb
index 269d9141b..6646b57dc 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221120.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221127.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "08fd0c4d931e929e21ae46568c603727e44b897f"
+SRCREV = "30df9f6e5154f89a73fb59a95362a62fd8c7abdf"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


