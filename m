Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1BFC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:48:41 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.49153.1681717712603930582
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s7nSycjb;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717710; i=@fujitsu.com;
	bh=poELQCDcemFgdRqQYN82ngHN0ZurB2qB8zHoEXEWlk4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=s7nSycjbkE4DV39Jmm4isAZndB9yTXAgImhG347YQxf9MWZBCs6SqwLcUaBkWOdzI
	 dT8iCbslP5oA4S2Zh2M0LwDWhKSqmB9iVYSwrH6ahnhZVv56M3fiDQANgIOWu9j6Io
	 +QlufqPgJt5XclY2hcxT4N79j1tUgVJXz0s89tGCi2v7Sf5/Hd1W1QulA4JyqqORuU
	 HdKszPGVOnKTsK3xs6NeWIokEjpD5aMacDgnrM+CCapE64kX1MCQyat+OO4b/gWEEz
	 P16onfo4eo/896Pqp41KZnpqf9XS+m9qddFEge/iGc5RUL/u4gzWhSmCsWXOP1pZul
	 pgk5kidyj4XLQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8OxWffcT5s
  Ugz33FCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oy1b+awFnRyVMw+2crawLiAvYuRi0NI4CGj
  xNKdz5ghnKtMEjPnHmSEcPYySnSebgYq4+RgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8es
  BphAUeJ/yv3MYHYLAKqEvvvTmQEsXkFnCRal91hAbElBBQkpjx8D9bLKeAssfjVd7AaIaCaD9
  M3skPUC0qcnPmEBWK+hMTBFy+YIXoVJWZfboaaUynR+uEXlK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNZcWpRWWqRrqGpXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTope
  XmrJJkZg+KYUs8TvYLzW91fvEKMkB5OSKO+LVOsUIb6k/JTKjMTijPii0pzU4kOMMhwcShK85
  7/ZpAgJFqWmp1akZeYAYwkmLcHBoyTCa/wMKM1bXJCYW5yZDpE6xajLcfXKlb3MQix5+XmpUu
  K8/t+BigRAijJK8+BGwOL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3kk/gKbwZOaVwG1
  6BXQEE9ARckpgR5QkIqSkGpj2a2y467aLR6x8Kvdado5vHYFiau13V0rv9vy8bjvzBLkJC1P3
  3PzXP4+v8Ya12v6LotXTnlUwcW1juz/1QWfTwSWn2Xt5L3zQiJ57K5QjYO/Lc5a7dm83Klhqv
  ZJj9q2p9QKvxPeGbzG3arD5v9Z5pf0rtmeia/YuyNn2+0m5klKO5asjN2bstQm6mxzBwrg75K
  DSr6NW0W2zWSvt/6SWKnFMXXf1xBu5ZP0pWeIanI3MvYye7/fPiIq1ftHpkbfN/uECISlvV5Z
  N8Ts637Bd5bWwnPliQwfPw9k13esnBW67avSwOii74QPH5x0t8a2vSk0Pa/E//HZ11rJD86/X
  2fdzpMs+CrE/kX2OgdtAiaU4I9FQi7moOBEAoIeGFmYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-591.messagelabs.com!1681717710!450416!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14447 invoked from network); 17 Apr 2023 07:48:30 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:48:30 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 18310156
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:48:30 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id F3C99153
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:48:29 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:48:28 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tbb: upgrade 2021.8.0 -> 2021.9.0
Date: Mon, 17 Apr 2023 15:47:45 +0800
Message-ID: <1681717665-19231-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717665-19231-1-git-send-email-wangmy@fujitsu.com>
References: <1681717665-19231-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102121

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/tbb/{tbb_2021.8.0.bb => tbb_2021.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tbb/{tbb_2021.8.0.bb => tbb_2021.9.0.bb} (98%)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.8.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.9.0.bb
similarity index 98%
rename from meta-oe/recipes-support/tbb/tbb_2021.8.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2021.9.0.bb
index 5606d38da..028291c96 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.8.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.9.0.bb
@@ -12,7 +12,7 @@ DEPENDS:append:libc-musl = " libucontext"
 PE = "1"
 
 BRANCH = "onetbb_2021"
-SRCREV = "c9497714821c3d443ee44c732609eb6850195ffb"
+SRCREV = "a00cc3b8b5fb4d8115e9de56bf713157073ed68c"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
             file://0001-CMakeLists.txt-exclude-riscv64-riscv32.patch \
 "
-- 
2.34.1


