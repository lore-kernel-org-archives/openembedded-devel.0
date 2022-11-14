Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF61C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 03:21:16 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.1729.1668396068490190159
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Nov 2022 19:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KUaOY+8z;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668396067; i=@fujitsu.com;
	bh=vuv1YiR6ERsrMixOT8zU6adw7Yn2FOpVjSXuSLrz6R0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KUaOY+8zeUIQkxioULGtT6CdiNW0fG6E/rQeS0t28WtMptdYVcaUVE3FBJ0+RTU5K
	 mK7wRBpL1CWkTN9K9aJH3Yp5DezWCBpt4pwOLzH4CZh5TV940YFl+HxxGCTM+HKEEc
	 4bY+Z54F7rDSQuNSXDk5D5xUqemZRsiyX4waAP24mZJ5QU5JjKIMxhK8CbL58xT2nr
	 yBmnByUtZgRbNpYzXRIkNgj2eSYs5ZRD4JeWiGiYDaCwmmuerLq4cfTEdaCCE1Ug2b
	 yecYD/wMmj8byT0inZ4iS7GoZFjbe50w8+Rv4ZAu1rcai7MJwxgG5cLyMvQdE4yNaE
	 rIFC0XeroU/ZA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxSVdpS2G
  ywbvJHBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bP7gtsBUc4K553fWRrYPzE0cXIxSEk8IRR
  onHtQjYI5zqTRMO36SwQzgFGibNzO1m7GDk52AQUJBZuPQNmiwjoSyydvYcZxBYW8JeYfWgik
  M3BwSKgKtHwSwEkzCvgIfGk/RhYuQRQ65SH75kh4oISJ2c+YQGxmQUkJA6+eAHWKiGgKDF7uj
  xEeYXErFltTBC2msTVc5uYJzDyzULSPQtJ9wJGplWMZsWpRWWpRbqGBnpJRZnpGSW5iZk5eol
  Vuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkpenmpJZsYgSGXUqzSt4Px7bI/eocYJTmYlER5
  +dcXJgvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4L2wGSgnWJSanlqRlpkDDH+YtAQHj5IIb+kmo
  DRvcUFibnFmOkTqFKMux8yvbQeYhVjy8vNSpcR5VUBmCIAUZZTmwY2AxeIlRlkpYV5GBgYGIZ
  6C1KLczBJU+VeM4hyMSsK8d0BW8WTmlcBtegV0BBPQEd8j80COKElESEk1MKWK9328tCXk9es
  u1bDTC5x3irw3KDk98WW6bnZJbua1ps+qT6ekW2oe/iR1JVjz4Zcs88QvVbyl66oTnW69e7z2
  uG3GAt2TDgHr6gr/h/kW7xFqU7vGurRMIE573lfekF8fzC+t+bi/dL2XY+mzb3WC8fxBz9d85
  7xveM3oirRgnT4vf1qtzrxGFeMpNpYplfda44/O5D+Z5X1ZrvGcynzBKVNu+f/7VnHmyO7FJ1
  fMLLR2L43b5vGM69PLug8Mqyb6bLv3qPJ5dpvP1hdJWz1usF6rnT6ncP26Tyq70vtfclmt+dq
  5+MTLWQGPTl/s/njT9KeJQVqd8ZKw/y+fh8pYfORUF5vm23FT5LD3rjIlluKMREMt5qLiRAA3
  wl/YQAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-565.messagelabs.com!1668396066!260297!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8357 invoked from network); 14 Nov 2022 03:21:06 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Nov 2022 03:21:06 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D79E610032B
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:21:05 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CB50D100323
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:21:05 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 14 Nov 2022 03:21:04 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pywbemtools: upgrade 1.0.1 -> 1.1.0
Date: Mon, 14 Nov 2022 11:20:56 +0800
Message-ID: <1668396056-24421-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99580

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-pywbemtools_1.0.1.bb => python3-pywbemtools_1.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_1.0.1.bb => python3-pywbemtools_1.1.0.bb} (92%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.0.bb
similarity index 92%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.1.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.0.bb
index ea9d6528d..e02485dde 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.1.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[sha256sum] = "3fd2fec6a11992afb8a34c0181b76c8d36c6fae1b79d83fb4542ce08e0fb4127"
+SRC_URI[sha256sum] = "5428169d9704f98519666cc81a33bfbb813612108979d4c9ce10d6202faf621e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


