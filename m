Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE176C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:17:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.2924.1663064247993265790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S4s2Y7JK;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064246; i=@fujitsu.com;
	bh=C6FAeWoqDwvpgj+ITCy02EjfOEcvi63zu/4PoWI/eXM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=S4s2Y7JKlxlKBVhHOTegQStbo4Z6zgP1uL+R3h5+DMNsS187u8zm9i6FfkAPHzQk7
	 WkMxjqkZh9fKKCuttldmZejc9m5Aehoa+EEfVVKmlCzhM7Zti06nABUPVuUtQv482o
	 YglHYzc6G5Ogjdf0cJCgYH4wU7v5vYGFwFCBjO6NVXu7adiFeraI5Vhab96E7ImCMK
	 LgwkcF1wNNxOz9c+O2mg5fzGEeL/9lUBrUMsKCVOHYL3q9xiLs4FeoHnfJKBEos4xX
	 xcjukZcJ2g6LGIEbrtXNiNaqSUXiDYXHHATmRuUX7shhp21yqvB95vnG1F4YQGFO6s
	 sh8WUgWW2kS1g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8OxWXdrhEK
  ywa8jNhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bm38tZCt5yVvTsvsDWwNjP2cXIxSEk8IBR
  YuKkW4wQzmUmie/TX0A5BxglHi3fzdzFyMnBJqAr8eLHYhYQW0RAX2Lp7D1gcWEBP4nuo/PYQ
  WwWAVWJbWt+gdm8Au4SV1feZwSxJQQUJKY8fM8MEReUODnzCdgcZgEJiYMvXgDFOYBqFCVmT5
  eHKK+QaJx+iAnCVpO4em4T8wRGvllIumch6V7AyLSK0TqpKDM9oyQ3MTNH19DAQNfQ0FTX2AL
  ItNRLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMv5RitdwdjFNW/tQ7xCjJ
  waQkyhvppZAsxJeUn1KZkVicEV9UmpNafIhRhoNDSYI3PgQoJ1iUmp5akZaZA4wFmLQEB4+SC
  C9PMFCat7ggMbc4Mx0idYpRl2Pm17YDzEIsefl5qVLivDO9gYoEQIoySvPgRsDi8hKjrJQwLy
  MDA4MQT0FqUW5mCar8K0ZxDkYlYV6JMKApPJl5JXCbXgEdwQR0hJG1PMgRJYkIKakGJuPgpmd
  zhKbP5U7/ELz28GSfTDk9b96LcyMMFEtLfR4eed8Z9HzTKrVDe3cpbFGayi3fLd1psfvlFvu8
  nYwM/PdPNMROYdFa2ym67f2qFeVLt3gyWRg4LF+9fPGxj9umTYyVW7Qx7dtz4wuCxbmfIw8ci
  2xY3BTJ+JbrU1CC84QpN3fr8IaJzHVyPVbAWXjT9MX+f9vvcV8S7Q5pf8606oCaVun0DWnCb0
  VYpCIqXY8/D0nIbtLe1rlk+4e+s3u0hDsuN5VxmuX90LzkKK+/e/O2Xz8e7ovSqjly5nGp3Bu
  +bb7r77oJbZvr8ZHfWLW2M9SL0fNU1SMbo0vhAiwrlXUSLFtFHGvcP5r9mHN2lxJLcUaioRZz
  UXEiAPYGgiZGAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1663064245!256234!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31545 invoked from network); 13 Sep 2022 10:17:25 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:17:25 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id B09607C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:25 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A41287B
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:25 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:17:24 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.39.0 -> 0.39.1
Date: Tue, 13 Sep 2022 18:17:16 +0800
Message-ID: <1663064236-5144-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:17:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98768

Changelog:
=========
Performance improvements for constructing outgoing packet data (#1090)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-zeroconf_0.39.0.bb => python3-zeroconf_0.39.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.39.0.bb => python3-zeroconf_0.39.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.39.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.39.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.39.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.39.1.bb
index 9b1576372c..6f442481f0 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.39.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.39.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "7c0d8257b940ee43e637fb560c2f9bd79da0638f37af162eb4f506f7274ef8e4"
+SRC_URI[sha256sum] = "b83cff68a0c8dcd2705b5e792796239accba2bfddb09bc8d05badc642f64e7f6"
 
 inherit pypi setuptools3
 
-- 
2.25.1


