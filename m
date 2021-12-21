Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80258C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:07:45 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.6342.1640012864848190814
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mTAL6Q76;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012862; i=@fujitsu.com;
	bh=RNFErmB9Xgk5H0HzRB39HNwh5ULQJ7PCjiaVaoFndFo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mTAL6Q76gJJ+osjgTBIeu2cMmn2YYuDsGgFggFM7dszHQBzPIaMzzbUmxZYSrKGFx
	 EUyp7rmS1YgqhgdVx+zxyl7mW1ZZHOfnzuoYr+q/ZP5Ja4fReGRiO/xgY/2708T9Iw
	 D4WIx0VkLLmuUQSCETuIJ4oWKae0JUckmygtg0cVWMXtntlaAH+5eWUbzNwYAnGowN
	 qGxWZRcIxPty+rN6y7iVJCrdMdBWzxpMkbC4W1LwSiUAkFIZscglYWd66ol/7HVZYf
	 90v921upmLw0bBUrpmeO7Wtv/PcamuPPyeoFraG7RQ2sDSw3v57+g7SaaLSFQ0CnQP
	 0WD59hxxpPSZw==
Received: from [100.115.7.142] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id D0/78-10124-E3C90C16;
 Mon, 20 Dec 2021 15:07:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8MxSdd2zoF
  Eg++PDCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owXm46yF5zkqnj4+T1bA+NZzi5GLg4hgSeM
  Eiee/WWBcC4wSTT8O8QI4exhlJj5+gB7FyMnB5uArsS5x2vBbBEBfYmls/cwg9jCAp4S/VOmg
  9ksAqoSf2/vZAKxeQU8JHb/v8kGYksIKEhMefieGSIuKHFy5hMWEJtZQELi4IsXQHEOoBpFid
  nT5SHKKyReH77EDGGrSVw9t4l5AiPfLCTds5B0L2BkWsVolVSUmZ5RkpuYmaNraGCga2hoqmu
  ma2hmqZdYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZm5yTopeXWrKJERh8KcVsK3cwruz7qXeI
  UZKDSUmUl9/3QKIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6fM4BygkWp6akVaZk5wEiASUtw8
  CiJ8DaBpHmLCxJzizPTIVKnGBWlxHm9ZwMlBEASGaV5cG2w6LvEKCslzMvIwMAgxFOQWpSbWY
  Iq/4pRnINRSZg3fRbQFJ7MvBK46a+AFjMBLVYK3w+yuCQRISXVwLTU+Ga7wNqQ/7ytB3JtjyW
  1hst//8x1+lbHp2PTZq2SvnY1/4LTvKDU/ddLtp5f90/p3xz5ivfvLvbvS/tge/30lE2Xb1xL
  6RJ5bJy6V0/XnP+tUEfuD+eHRSu25S2adTTqS/hsh9rGX+L386Oc82fM4474Nclo7z3lPUXfb
  J03vNer47llWzdx/fK8sIxTkllbm2ed2GmdfuzQxcVximkn/me0d+SfWR3+cF/516zaNeytEy
  2st1QFGdyNWmAk+FowXZ9PqfVGl2QQg9KDb5o3Ztu5yplVx+06satIo917jsMkM56rPu9mb+q
  T1N/KeY5jnYzg0a+8yi3mN8vv6uffCE30nXBn3bXNrPyMHROVWIozEg21mIuKEwHxvndAOQMA
  AA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-591.messagelabs.com!1640012861!6299!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7790 invoked from network); 20 Dec 2021 15:07:41 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:07:41 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 49805100353
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:07:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3CE251000FF
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:07:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:07:35 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-ujson: upgrade 4.3.0 -> 5.0.0
Date: Tue, 21 Dec 2021 08:07:29 +0800
Message-ID: <1640045249-88215-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 15:07:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94453

Changelog:
=========
Added
Use cibuildwheel to build wheels (#491)

Removed
Drop support for soon-EOL Python 3.6 (#490)

Fixed
Install Twine to upload to PyPI (#492)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-ujson_4.3.0.bb => python3-ujson_5.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_4.3.0.bb => python3-ujson_5.0.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_4.3.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.0.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ujson_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.0.0.bb
index 7949a636c..fb1bcd761 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.0.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
 
-SRC_URI[sha256sum] = "baee56eca35cb5fbe02c28bd9c0936be41a96fa5c0812d9d4b7edeb5c3d568a0"
+SRC_URI[sha256sum] = "3ff7242816b1d22c08c04c4c6db0f6ba7c16cd624ce38534c1025defa011e50e"
 
 inherit pypi ptest setuptools3
 
-- 
2.25.1


