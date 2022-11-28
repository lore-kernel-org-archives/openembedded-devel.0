Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FF6C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:21:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.111544.1669616470573540157
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v8+q1Lyg;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616468; i=@fujitsu.com;
	bh=Z5mGUUmL9fO5rky1vdkuzIR6jzfKQJkaJ4ReYPXmdI4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=v8+q1LygXskofN+Nc4Pi7YYMZLZ4gRWYw0e0rkUSbfHXAlqKypMAbWueJS0vDY3FY
	 G0e1obVk861LC0lVG7PC9qFGKjshe0VQY9kyKnX/Ij56pRxuW1ZVpOpLGN4NAsZRA7
	 ZGgI+gabttPXHgpggjAhIh9FLL/PEeZv0jlS3HLH43olXGw7ocNU9ImbsQdgNrpQlm
	 Z9ozVf2Wvu4GoBv6EG3uNQCUDko04VbechywEikDT3MULYy/eicZ9/1Qdt80uUz1tH
	 2gHaU0oONXa8dK1sCeZBDd7Y3/rDg8Tnhm7ZusYtCsQsVRJJo7JfhZLs1OCT3n5YO0
	 cJS8Jpno4aIfg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxSTckuCX
  Z4GgTt8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHy2gGWgslCFRP+P2VvYPzP38XIxSEk8IRR
  4u3NO0wQznUmidN7/rFAOHsYJZbePAbkcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPe
  xcjB4ewgJfErSZTkDCLgKpE07c/rCA2r4CTRM+mSWC2hICCxJSH75kh4oISJ2c+YYEYIyFx8M
  ULZogaRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGE2LU4vKUot0TfSSijL
  TM0pyEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAkMxpVjVcwfjn6V/
  9A4xSnIwKYnyfgxsSRbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwTsXJCdYlJqeWpGWmQOMC5i0B
  AePkgjvYnugNG9xQWJucWY6ROoUoy7HzK9tB5iFWPLy81KlxHlDQGYIgBRllObBjYDF6CVGWS
  lhXkYGBgYhnoLUotzMElT5V4ziHIxKwryXQabwZOaVwG16BXQEE9ARmxSbQI4oSURISTUwdcx
  yNKiz8P4Rttoj/OYUo8K+vIOcEasE2SzvsnS1Lqj+t0152XNDqzlqik91r77hnH2uX77ddJOL
  4p/2i/EX5nhpf3TWc/wlK7VSxS9/vVRd4kb3FcWWzPXOL3iE0o/H1L5+vSnYcEmA94Vuhp9Pv
  Z63tLSoad79Z+F9sd2PKyJuXVMFT7zvlw+Ba+93tX32Yzt3JWv927IbFy4WqvmV/Li87dtMrX
  D9n852GzZKPowX+na75udHrbcGddsPP9untnPVDZ93vtKKphMyl2Wk1Yo/kz7jfpb9eqHSzW6
  2hXuP2X20cUzdvPHHOvUPTyN+lFh+36Wmbup46NHcC/d3LS3O6vtg8O7iz4rTd37WKbEUZyQa
  ajEXFScCAFaTcZ9MAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1669616468!222443!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24635 invoked from network); 28 Nov 2022 06:21:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:21:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E06121000E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:07 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D3ABE1000DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:07 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:21:06 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pandas: upgrade 1.5.1 -> 1.5.2
Date: Mon, 28 Nov 2022 14:20:40 +0800
Message-ID: <1669616444-13316-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99811

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fixed regressions
------------------
    Fixed regression in MultiIndex.join() for extension array dtypes (GH49277)
    Fixed regression in Series.replace() raising RecursionError with numeric dtype and when specifying value=None (GH45725)
    Fixed regression in arithmetic operations for DataFrame with MultiIndex columns with different dtypes (GH49769)
    Fixed regression in DataFrame.plot() preventing Colormap instance from being passed using the colormap argument if Matplotlib 3.6+ is used (GH49374)
    Fixed regression in date_range() returning an invalid set of periods for CustomBusinessDay frequency and start date with timezone (GH49441)
    Fixed performance regression in groupby operations (GH49676)
    Fixed regression in Timedelta constructor returning object of wrong type when subclassing Timedelta (GH49579)

Bug fixes
---------
    Bug in the Copy-on-Write implementation losing track of views in certain chained indexing cases (GH48996)
    Fixed memory leak in Styler.to_excel() (GH49751)

Other
---------
    Reverted color as an alias for c and size as an alias for s in function DataFrame.plot.scatter() (GH49732)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pandas_1.5.1.bb => python3-pandas_1.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.5.1.bb => python3-pandas_1.5.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.5.1.bb b/meta-python/recipes-devtools/python/python3-pandas_1.5.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.5.2.bb
index 65cd29d9b..15709b604 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.5.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c1cc9ab35a8b2aabf933cd6d245b5db3"
 
-SRC_URI[sha256sum] = "249cec5f2a5b22096440bd85c33106b6102e0672204abd2d5c014106459804ee"
+SRC_URI[sha256sum] = "220b98d15cee0b2cd839a6358bd1f273d0356bf964c1a1aeb32d47db0215488b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


