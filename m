Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F58CC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 13:20:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.10794.1648473603285344361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 06:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AqttuATF;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648473601; i=@fujitsu.com;
	bh=JxH06WxvYoXBUU5qWngYUjvSQ6R4HLO6ZbPeLYPqags=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AqttuATFyVqPiyRBL255adT1Y5PCYa95N/B7mYKlm3lWYa5pSxw8O0hNHwGaXkaFo
	 cu8VVp5rFOMSGm8WhP8kvs7G/NNgIiyJ1wHgzwA3AIS+xHdJzxjx0Tf7IjZVaLspqe
	 mGrepgo+Fo268OLmR75In3IhW+hTaQerKF+FAKgZ9hI/NPGBSe0Y58NyAqlqsn22p5
	 0opeGgL/8lM7pIz4/jCGulSNd+9oHAFjEOuXixcUDme7DzPu/f3Qm3W7dow+Wiv+UJ
	 V4sty5wgV9N54GJ3nNu3MOiAhZJ0jyHkTQnvBGz2MalYbbA6Wn85ORGYJCuHq7h3ec
	 abmbrac54hPsw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRWlGSWpSXmKPExsViZ8MxRff/Vsc
  kg1MzpC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oypx6ezFDzmqHhz5wFrA2MfRxcjF4eQwGwm
  iU1zFrNCOHsYJY5u2MPUxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfPewgtrCAj8S22
  9fB6lkEVCW+f3rKCGLzCjhJXOzsB4tLCChITHn4nhkiLihxcuYTFog5EhIHX7xghqhRlJh9uZ
  kFwq6QmDWrjWkCI+8sJC2zkLQsYGRaxWiVVJSZnlGSm5iZo2toYKBraGiqa2ypa2qkl1ilm6i
  XWqpbnlpcogvklhfrpRYX6xVX5ibnpOjlpZZsYgQGWUqxuskOxu6VP/UOMUpyMCmJ8l6c65gk
  xJeUn1KZkVicEV9UmpNafIhRhoNDSYLXZSNQTrAoNT21Ii0zBxjwMGkJDh4lEd6A2UBp3uKCx
  NzizHSI1ClGRSlx3g9bgBICIImM0jy4NliUXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzK
  sAjFkhnsy8Erjpr4AWMwEtXvvOFmRxSSJCSqqBqfKW7crdflk6C78JXD0094D3/5m3Ladwf3T
  Xy7jeZqoZasx7I7zy5U7Pf+rztT7cu/De5uPRx68vPL3k6evYUNtq7JRVL5/7YkH78iWW3xk+
  rfZt2s+6JvnmtXfmPi51j3g/72EW39TBtj5H8OE2o1kK34pzl9q3lszXdJzuzfRP/E9efe4BW
  5U7LUH511L1JqQdW+HH+jHfWHT+5X2v18YcPaHkI9+4Nf1C77RPIl85f5XN+zRl99X+GvWlyy
  anPp+xbxFPVOrntB81CfPczu7zfS4Voig443NF2/4UmUOiqlXT2OtfLr1zeVn3zd8PpzOfUpG
  tifVazD9X/62d9tUpLVfv3w5gWRl8Oej+DEMlluKMREMt5qLiRACdr9yhLQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-571.messagelabs.com!1648473599!47645!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8711 invoked from network); 28 Mar 2022 13:19:59 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-23.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 13:19:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22SDJqsX028058
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 14:19:59 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 14:19:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-watchdog: upgrade 2.1.6 -> 2.1.7
Date: Mon, 28 Mar 2022 21:19:39 +0800
Message-ID: <1648473579-17138-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 13:20:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96244

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-watchdog_2.1.6.bb => python3-watchdog_2.1.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.1.6.bb => python3-watchdog_2.1.7.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.1.6.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.1.7.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.1.6.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.1.7.bb
index 2bb110049f..7e91295fb4 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.1.7.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "a36e75df6c767cbf46f61a91c70b3ba71811dfa0aca4a324d9407a06a8b7a2e7"
+SRC_URI[sha256sum] = "3fd47815353be9c44eebc94cc28fe26b2b0c5bd889dafc4a5a7cbdf924143480"
 
 inherit pypi setuptools3
 
-- 
2.25.1


