Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7D9C61DB3
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 05:39:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.96876.1673329186321475171
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 21:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f/h3/bmr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673329184; i=@fujitsu.com;
	bh=GccmezZ62yeS+9qC6/gJLJoadHNPDgkHmmBf51Wgslo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=f/h3/bmrRgQ2L29NMUZMKrXqZxNqe+5T1A89OXj5Z79R+LH6np4pvYlYJ/HxMZNqu
	 1FpXtVwEHkKVg5ns3bltcabYnc/gUgUS1CiByCthcqo/ID55R8pa5PKd65DxhywTgC
	 rWy5f6RX8xa1OvRFM4tG5Cfq1l4lj1wKonOgChYLegFfieDhx7oWcFJoyGXKbgqgK1
	 lcnxGzvNi/JNJjyZbiAIfN2zNemVDopk//Vz7JDY1cEieHxjBq2mG/btGe6lWO44Lv
	 FJ0mhAEPwyEqNWRaGExGeGBJ116W8bhf97sfiPI+m9FLW9aOx7+b4QNGGBq1CwCreL
	 bU+tdvJOxRbSQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWVf+155
  kg0N3JC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oztPW3MBdPZKr61fGZqYDzH2sXIxSEk8IBR
  YuW5HewQzhUmidlPT7JAOHsZJb7N+gnkcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAg0f0YooZFQFXiyMpTYDW8Ao4Slx5+ZAKxJQQUJKY8fA8W5xRwkliyuResVwio5s3uNe
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOxKidYPv6BsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YTYtTi8pSi3TN9JKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJL
  NjECgzelWOneDsZpy/7oHWKU5GBSEuUt+rQnWYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr84Po
  JxgUWp6akVaZg4wkmDSEhw8SiK8864DpXmLCxJzizPTIVKnGHU5rl65spdZiCUvPy9VSpx3Kc
  gMAZCijNI8uBGwqL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZjX+ivQFJ7MvBK4Ta+AjmA
  COuLH1J0gR5QkIqSkGpj4RD4oXdRerpgzxU5A6/f0mIt6Z+19Cr++TDhkGBU6Q/2JzXeXnOeP
  XQsDEo6IPX0R72kiKLDtzCeBRYGHLz+5qZO1ZPIf9UXp4d2ilkxt9d09S/0qr669KSh+asJVn
  mJO4b4LZ2dH3J8yTXXfrbx/H7mijLmsrWPPdjovMos9U/xz85aF8jNeci4+t3FnrOIOpWcpXW
  H/am4ecJ4q8WGBwqYvP3j/6z8+3fJ5353ND1rczk9Mnu5nGJXtlzzvQs9xKfuV3je8BDw756V
  uj1M/fLNX+13run7n+fsL5076t/3ki45prmH/n4n76zJOeqbnU5qatdY+5I7RHM0tv9wMQzun
  bjH/VPd32sn+G3J6SizFGYmGWsxFxYkAEq0bFWUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1673329183!341160!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7370 invoked from network); 10 Jan 2023 05:39:43 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jan 2023 05:39:43 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 269B87B
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:43 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 19EE973
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 10 Jan 2023 05:39:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hidapi: upgrade 0.12.0 -> 0.13.0
Date: Tue, 10 Jan 2023 13:39:16 +0800
Message-ID: <1673329158-5189-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673329158-5189-1-git-send-email-wangmy@fujitsu.com>
References: <1673329158-5189-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100501

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/hidapi/hidapi_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recipes-support/hidapi/hidapi_git.bb
index 4aa58ec7f..812a07da3 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_git.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
@@ -12,6 +12,6 @@ RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-utf-16"
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https;branch=master"
-PV = "0.12.0"
-SRCREV = "76108294092c023a4ece99eb3219559cea0d5066"
+PV = "0.13.0"
+SRCREV = "c3a6150d8801f79a59034045275176e9738b13e4"
 S = "${WORKDIR}/git"
-- 
2.25.1


