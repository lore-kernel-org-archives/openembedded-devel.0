Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF316C25B0D
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:39:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.13657.1660545581294974185
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hhwsfAr5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660545579; i=@fujitsu.com;
	bh=ZVStWPXcKgoCnP8NFBrXqj3xzpOwk6XezcdvaHDd3B4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hhwsfAr5Lw0rtE+U+NxEhaYELGiNCSHeWumYhjkZnqLd+fgCE6QqqjGuTFtcpGO/p
	 fmP5J8VmFD6v5w3VJfy/xYvUi/u3MaW8U9ZqIChHXXhDmXbvlKpzdLGnpFz6lzjiOR
	 xAkLSWRm3nhhrintzg+O7SbDfnryGKAdV6mFiwFwPOnjeBIpuUE2H3lB2k0vuSd99p
	 nk1oLcSeIpyQo9lvJq4Fo4Ls3ci4iU9qR3H3/oS8+D0k7YEsaFoBBDb29Koce5Hf46
	 WSnvNuzpyEDtnIGY99hAVBvuBcC1vsFtJOCKogTnl36y4cDwoHx2H7RDoLGkmK49lE
	 aEREjTNyRBZ2Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORpKv96me
  SQfMzTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP2oqnsBdPZK/bem8XUwHiErYuRi0NI4CGj
  xJyOC8wQzhUmiau3X7BCOHuAMq3vgMo4OdgE1CSm37rBCmKLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYWsJRo7p4MZrMIqEpMvHgQrJ5XwFHi47pdjCC2hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZo
  gaRYnZl5tZIOwKiRkztrFB2GoSV89tYp7AyD8LSfssJO0LGJlWMVolFWWmZ5TkJmbm6BoaGOg
  aGprqGhvrmpvoJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEhmVKsaLXDsZX
  K37qHWKU5GBSEuW9dvFnkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3tLnQDnBotT01Iq0zBxgj
  MCkJTh4lER4+14ApXmLCxJzizPTIVKnGBWlxHmjXgIlBEASGaV5cG2wuLzEKCslzMvIwMAgxF
  OQWpSbWYIq/4pRnINRSZj3EsgUnsy8Erjpr4AWMwEt1rv7HWRxSSJCSqqBaebOlw5b3+k915B
  m3vErmXN5/2T7uF0zPhjG1vxh2BLH80Vi1wG/+P3P2mcxRPUYu7gaL+LT6zPQ+W+gq+Are/Qm
  /z52j0yumW42+wv77ml3/txTFZjOvuSTvGzSn4tLuiIOnzRZu73ySrz+Q8dDNlsrGfREK6oni
  0zZKSO5yf3Kl6beI4fZLeqXBCfnes46sqCkcaGfLeuTI50Om3+1lS1c37pB+FnzBhOdS/MVy0
  Ile7ItwhcvS1vVmLd2jeOc0/2R1bZb5y3g4FIIcm51kJp+qq9i6dlUc4X1025sYM/95CF7tfw
  /lwj/J1sT1v+FDOwlTraTRXcfkdSxldN845/0duX0tNV7Xkzh+LRQiaU4I9FQi7moOBEAQu02
  TEYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-571.messagelabs.com!1660545579!48358!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15678 invoked from network); 15 Aug 2022 06:39:39 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:39:39 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D9D2D1AC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:39:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id CEF3A1A3
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:39:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:39:37 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fio: upgrade 3.30 -> 3.31
Date: Mon, 15 Aug 2022 14:39:19 +0800
Message-ID: <1660545563-1580-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:39:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98249

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.30.bb => fio_3.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.30.bb => fio_3.31.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.30.bb b/meta-oe/recipes-benchmark/fio/fio_3.31.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/fio/fio_3.30.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.31.bb
index f97a1b899d..b166fe5b32 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.30.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.31.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG_NUMA:armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "a3e48f483db27d20e02cbd81e3a8f18c6c5c50f5"
+SRCREV = "6cafe8445fd1e04e5f7d67bbc73029a538d1b253"
 SRC_URI = "git://git.kernel.dk/fio.git;branch=master \
 "
 
-- 
2.25.1


