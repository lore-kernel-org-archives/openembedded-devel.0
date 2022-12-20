Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E6CC4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:24:53 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.48761.1671539085464139123
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dftxibml;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671539083; i=@fujitsu.com;
	bh=2CWuTin3OER3h6JeudQr2W84V7loJ7+uykv6jmunZXY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dftxibmlEvs02eic1jmfiSiOehrOoNEVtNUAxa5mMDEjCqsQ15PHcA7y26mxdQTRX
	 ARgsl4WSAD02z57rKKmMIdc1Ye37O4dVGBXQqPICB/DVj/K9kO7e+OjRmaVRFeErPs
	 bRLCYSSrlue+ymaceDRlgFMne/kQkoX0GSFqmWqQxn9WnQe/TEQcBNBjHiFfSdNaP/
	 8o5PmpF/zJtyfaaYgfM4hFbQe8+KsxafTZmRnAA0AySz1DkxbaTfz6hhvBmj7jR/EQ
	 Umo9YSlpXECOnyTmVxPS4DawkVFWR4nmVfTEr49c6fYkk80DxkTwI1+LZWAg7/P2Dz
	 ZXANv99Fpi4IQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWbdr5cJ
  kgxXdBhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bbbzuYC6ZzVZz+u4SpgXE3ZxcjJ4eQwENG
  idfLnbsYuYDsy0wSk8/9ZYVw9jBKdN6fwQJSxSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  exdjBwcwgIBEr/WFYCEWQRUJZbtX80OYvMKOEosmrMJbIyEgILElIfvmSHighInZz5hgRgjIX
  HwxQtmiBpFidmXm6HqKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWI0K04tKkst0jU010s
  qykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDMWUYnaBHYxH
  lv3RO8QoycGkJMobFr4wWYgvKT+lMiOxOCO+qDQntfgQowwHh5IE74xFQDnBotT01Iq0zBxgX
  MCkJTh4lER4368ASvMWFyTmFmemQ6ROMVpyTJ39bz8zx3IwOfNr2wFmIZa8/LxUKXHeDJAGAZ
  CGjNI8uHGw2L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3FsgUnsy8Eritr4AOYgI66NC
  luSAHlSQipKQamJZP2N+gbfmUWzHirrHm8/WNUXxXtjrt2c2Qam0xo9yI56dWoJYqk/48hZud
  l68+u5Up4shtE7FKQj7XXSTo4FuWw2YRRfPehi1/6NfMI+r+Mdj7lChzZhWrYPXzPUzBrTMrX
  v35szrj8gluuyklpV3Bkk+2GDW9tWZj+v6ldprOl47rv7/9CtOYk3eqcPubNaxS9/yNGX/eqY
  7fXv3k9skpYqmLM2enlp0/9Nw1vDdv5WmnR1V7+KNc86ff8J+TseHSS7m+dfEcSW0aiaZr3Pa
  43ubllmLZb1Tda6RdU3XTY/2EO/17Fu3SOlS0ObZ5bsGKbTk1gde0zWUFT35c9Ktt64MDPkxN
  yWzFYjd2KLEUZyQaajEXFScCAC11TatYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1671539082!269896!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28434 invoked from network); 20 Dec 2022 12:24:42 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:24:42 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 6A774150
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:24:42 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5DA1373
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:24:42 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:24:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.44 -> 1.4.45
Date: Tue, 20 Dec 2022 20:24:00 +0800
Message-ID: <1671539043-7306-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100150

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://docs.sqlalchemy.org/en/20/changelog/changelog_14.html#change-1.4.45

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.44.bb => python3-sqlalchemy_1.4.45.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.44.bb => python3-sqlalchemy_1.4.45.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.44.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.45.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.44.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.45.bb
index 1c318e6ce..d5f7b3064 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.44.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.45.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "2dda5f96719ae89b3ec0f1b79698d86eb9aecb1d54e990abb3fdd92c04b46a90"
+SRC_URI[sha256sum] = "fd69850860093a3f69fefe0ab56d041edfdfe18510b53d9a2eaecba2f15fa795"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


