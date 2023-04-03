Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF94C77B60
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 09:00:33 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.65496.1680512431513728103
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 02:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OiRFZE8G;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512429; i=@fujitsu.com;
	bh=/blsR94SbNit+yXPQMUxPnQ9Q/eIiLBvo1laqjd8QE0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OiRFZE8G4dsaUSD9rSrQk3zmopQpVtEYfK57GG9ZnpxNwqny9wW/fx8d5uQxRWxud
	 FUoZTsYTrAWh6pInBfoR5q5hpLVc+i3dqUmZFY035U1AnH5Ada87ZJ4e89EVFLNNxR
	 c+tArI0McJqji6jc+oJuvcp3r+u1c0DUzVEO73dagr9+Eb8Kl+DDkqBkBX/Wk8OF1Y
	 0Rp2MyxMrqggCdj9KZdHhx2xkrSSoNHvVsGSHqsBDCi7D0JJ4Jgsdz4wSD1emhSyeA
	 l1ZMybZnZbM+U8Vsf6VcMKCiTnhE92TBvmsyhW2ZD4bOmacqWCU1ksqTUM7cilLYZk
	 uXkfd/ubxIJQA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8MxSXftVK0
  Ug6VbpC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owlTedZCpZyVWyb/Ie1gXEhZxcjF4eQwBNG
  if+zDjJ3MXICOdeZJB61ukEkdjNKvHn5mxUkwSYgJXHj/n82EFtEQF9i6ew9YA3MAioSL373s
  HcxcnAIC7hJXJzHBxJmAQo/nnmQBcTmFXCS2HJhA5gtIaAgMeXhe2aQck4BZ4n5W3Qh1jpJ/N
  h1jwmiXFDi5MwnLBDTJSQOvnjBDNGqKDH7cjPUmAqJxumHmCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYTYtTi8pSi3RN9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECwzalmMVsB2N731+9Q4ySHExKoryC9VopQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4D
  04AygkWpaanVqRl5gBjCCYtwcGjJMIb3AuU5i0uSMwtzkyHSJ1i1OW4euXKXmYhlrz8vFQpcV
  6/KUBFAiBFGaV5cCNg8XyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvq4lAU3gy80rgNr0
  COoIJ6IjWKA2QI0oSEVJSDUxii71v7+idvGu6WZWW+LqXfqW7u/98vHnHf9Eu8ZNGJTHfrwSd
  ZZfXS7v6YP2dlCkJi7TuWWybPfXt9QCru62uT1aoGgYfUlgrnPJ7peiOoyyb53Nbbzsosk68I
  fLxD7Y3Kd/qYx6um/b6YLtW8ZqeC8Jy/36qFqxb+8mkeYrmw+l+U045P1wrsrTxcBjrVB6rih
  ShWTpNiU8lv3h6N5Tx/b0gPeHo52sZnvcn/DOq81jFnMj/6PVHn5azGbtz8vZwaX36c4t3Frf
  es+XVDpaL3CZrTYndsqJBQkvYjmeF1YUZmp9zXq2M9314+sjUDV8EA/xemuz7pv6qb3vFhAe2
  pjHftj9e7qK3jDP2NcNvRSWW4oxEQy3mouJEADEQLOBiAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1680512429!287312!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14493 invoked from network); 3 Apr 2023 09:00:29 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 09:00:29 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F350F1009B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:00:28 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E626810047F
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:00:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 10:00:27 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] ndisc6: upgrade 1.0.6 -> 1.0.7
Date: Mon, 3 Apr 2023 17:00:07 +0800
Message-ID: <1680512408-30384-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680512408-30384-1-git-send-email-wangmy@fujitsu.com>
References: <1680512408-30384-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101900

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
# Do not ignore multicast advertisements when discovery was sent as unicast
  (fix regression from 1.0.5).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/ndisc6/{ndisc6_1.0.6.bb => ndisc6_1.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ndisc6/{ndisc6_1.0.6.bb => ndisc6_1.0.7.bb} (98%)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.6.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.7.bb
similarity index 98%
rename from meta-networking/recipes-support/ndisc6/ndisc6_1.0.6.bb
rename to meta-networking/recipes-support/ndisc6/ndisc6_1.0.7.bb
index 6861314a0..a5b9bd08b 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.6.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.7.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.remlab.net/ndisc6/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "7e314b23329f9c24c4c097b8513673fed7e7158a"
+SRCREV = "c308ba5370d66acc44d411f12d59af61d522b91a"
 SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http;branch=master \
            file://0001-autogen-Do-not-symlink-gettext.h-from-build-host.patch \
            "
-- 
2.34.1


