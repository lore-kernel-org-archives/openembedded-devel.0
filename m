Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DE9C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:21:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.85657.1677486097964185026
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:21:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Iibtp3jG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677486096; i=@fujitsu.com;
	bh=vX5Kg6N0w3/YFdGPGA7o41z74SixGWiC5irftmMd3bs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Iibtp3jGVooCbXvK7LwK3/08h4nqlyjyTGE88NeeSRlLkMQPWFXEz+/Mqk/Q5c6fM
	 CVCKnwZhkFglyx8NpiiaSPPitrX3CseihH7HpFK4nvLkPXpP+DVLSgVsk7iSKDYr6l
	 EHSujjARiIE6prJVnBOh7bTt21dpreODX2ASNDJBissVxrtFXj6N199bBPA8h4f+8P
	 QmRWQS6kmNgjUcOuZhX1ur98YUqYVdOtg8BAXq5c3rRQOpUUURHk++YdEqdYaSMPtb
	 Ts/nEajwPJgRlGf4uzgo5dJQzV6z9G0us/Xi0lPcoX6tdKcg81V/rXotH4rBy7YWIT
	 +yzpcY/WyE5XQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORpCuQ8Sf
  Z4H2RxcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCa8bihjbVgkWTFtQ+3mRsYL4p1MXJxCAk8ZJTY
  /P8cC4RzlUli+btFTBDOXkaJ9f27mbsYOTnYBKQkbtz/zwZiiwjoSyydvQcsziygIvHidw97F
  yMHh7BAkMShXiYQk0VAVWLlbTWQCl4BJ4lv248zgtgSAgoSUx6+Z4aIC0qcnPmEBWKKhMTBFy
  +YIWoUJWZfbmaBsCslWj/8grLVJK6e28Q8gZF/FpL2WUjaFzAyrWI0K04tKkst0jU00Usqykz
  PKMlNzMzRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMSUYpUXOxif9f3V
  O8QoycGkJMq7yOlPshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3oNJQDnBotT01Iq0zBxgVMCkJ
  Th4lER4mY2A0rzFBYm5xZnpEKlTjMYcm/Z1HWDmOP1n+gFmIZa8/LxUKXHeJelApQIgpRmleX
  CDYNF6iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwb1QC0BSezLwSuH2vgE5hAjpl+8MfIKe
  UJCKkpBqYHhx7ti5vo8+pr1xtornx1R3L9sg+MoxffvNR7xRNh0u7JLPS9H/xXv/5RZdR/9GV
  Kb1uHy5p+K7LOjLvB08dS1CpTfnSJc1LKkUsVbdYeLgpN2xiaVE8u3dqjv8Z/solzTlLnoibO
  XRdirzPnNoaKs+7vYb3Lf8qu2tHVuvfcKt6IScufLeHj5XlCLNc/Evfv3zvvbojroq5tjWyft
  DuT1+UWMMtUqTtf+kCq+5HnicXZkzw2b5dNnVq+MGjT1nthQOKpCN2XyySDVvykXkH/z8236v
  6BXFJRxbP9DeS/dt7x0U+a8JGlQiPbwJNqXLfzmd9Cd1zo2NJpK6RqcLsCL+tzPHyG95dqvFT
  ua3EUpyRaKjFXFScCABW8usxUQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1677486095!304869!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28803 invoked from network); 27 Feb 2023 08:21:36 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:21:36 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id AE36D1AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:21:35 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A20C11B1
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:21:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:21:34 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH v2] python3-eth-keyfile: upgrade 0.6.0 -> 0.6.1
Date: Mon, 27 Feb 2023 16:21:25 +0800
Message-ID: <1677486085-11824-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101293

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Remove deprecated 'setuptools-markdown' dependency 
 (https://github.com/ethereum/eth-keyfile/pull/37)
- Use twine to upload package to pypi

0001-setup-don-t-use-setuptools-markdown.patch
removed since it's not available in 0.6.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-setup-don-t-use-setuptools-markdown.patch | 36 -------------------
 ..._0.6.0.bb => python3-eth-keyfile_0.6.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-eth-keyfile/0001-setup-don-t-use-setuptools-markdown.patch
 rename meta-python/recipes-devtools/python/{python3-eth-keyfile_0.6.0.bb => python3-eth-keyfile_0.6.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-keyfile/0001-setup-don-t-use-setuptools-markdown.patch b/meta-python/recipes-devtools/python/python3-eth-keyfile/0001-setup-don-t-use-setuptools-markdown.patch
deleted file mode 100644
index 7b8120380..000000000
--- a/meta-python/recipes-devtools/python/python3-eth-keyfile/0001-setup-don-t-use-setuptools-markdown.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4348c72877e049804c7cdb7eec7a6bcd7ac2ea1d Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <brgl@bgdev.pl>
-Date: Wed, 11 May 2022 13:21:30 +0200
-Subject: [PATCH] setup: don't use setuptools-markdown
-
-This project is deprecated and irrelevant for the functionality of
-eth-keyfile. We don't support it in meta-python so just drop it from
-the dependencies.
-
-Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
----
- setup.py | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index cbb7f4c..7702aa4 100644
---- a/setup.py
-+++ b/setup.py
-@@ -51,14 +51,12 @@ setup(
-         "A library for handling the encrypted keyfiles used to store ethereum "
-         "private keys."
-     ),
--    long_description_markdown_filename='README.md',
-     author='Piper Merriam',
-     author_email='pipermerriam@gmail.com',
-     url='https://github.com/ethereum/eth-keyfile',
-     include_package_data=True,
-     install_requires=install_requires,
-     extras_require=deps,
--    setup_requires=['setuptools-markdown'],
-     py_modules=['eth_keyfile'],
-     license="MIT",
-     zip_safe=False,
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.0.bb b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.1.bb
index 9477632e2..55ab1a78d 100644
--- a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.1.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2beaef1b1764f4d6b46084c885b4bcad"
 
-SRC_URI[sha256sum] = "d30597cdecb8ccd3b56bb275cd86fcdc7a279f86eafa92ddc49f66512f0bff67"
-SRC_URI += "file://0001-setup-don-t-use-setuptools-markdown.patch"
+SRC_URI[sha256sum] = "471be6e5386fce7b22556b3d4bde5558dbce46d2674f00848027cb0a20abdc8c"
 
 inherit pypi setuptools3
 
-- 
2.34.1


