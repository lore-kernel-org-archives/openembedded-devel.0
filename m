Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98955C43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:34:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.1174.1667810043867084301
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nwsk4D0H;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810042; i=@fujitsu.com;
	bh=NlQEUegWZ1XLGLm3W0TvrqT/NJGGEK9F3rHYAyRm4iE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nwsk4D0H8rYa8W0xHAop7geCmuMmXEJvgZLm+y8eWwgQegLx/aAscu//HNoqfwAM9
	 Er8rIe6rO0cy7zW+tGoHQbSx6OQQyzuOwv/91ul+Fsx73BD+jf4KBUV6A4GMyj1Jk9
	 EPHYMKZjA9tyjoimVFr13VPsLPHfEGE5X+Kad5h+Npapte3VAFiajrd84f/U/IIb2P
	 Xdk1bn/ZKnoqvctJYldB47NSQZkQ0OHWoFrvzTcuyddVFRS56H/KAUgqfCWV0TsZ97
	 S40T6JM1AvXnZi9OBszXBeLl3flxpCuk+9dsIO+DUV+KgRNhUT4tyNLQcuS6oKumvs
	 /OtDxhLPJabjQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8MxSffnoYx
  kg2svDS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxXb9YzFRzkqWg/s52xgfEPVxcjF4eQwBNG
  iaMzHrNCONeZJKY0djBBOLsZJXav+waU4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBd4v6KvWBxFqD4mncbWEBsXgEniaOH+8HmSAgoSEx5+B6shlPAWaJx62agOAfQMieJBe
  +CIcoFJU7OfMICMV5C4uCLF8wQrYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaFacWlaUW6Rpa6iUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To
  5aWWbGIEBm9KseK6HYzTl/3RO8QoycGkJMr7e3lGshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  hsbgXKCRanpqRVpmTnASIJJS3DwKInwhu0DSvMWFyTmFmemQ6ROMVpyTJ39bz8zx3IwOfNr2w
  FmIZa8/LxUKXHea7uBGgRAGjJK8+DGwaL9EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXuY
  9QFN4MvNK4La+AjqICeig6oI0kINKEhFSUg1MS06GPNYTP80T9jnteCVLxOlFDSd/sEg3Ht7+
  OM1yvqyFZl16Sf/OibFPHobPWvNQZJ+Gh0BVfi+LwaV1K+Qi3zRIqf0Xmt3+4iGbrDmzgTDzb
  h3+osTtX9OuuT9iun3ebs6kjwzT5a+Y2QhfkPh8s3DSv/hj7guMqxYI7Nq9SN3cv/XItR1Gy0
  2bzzyec4knnKXBpvJRg/CO83e39bPaC76dMHlecWVdIt/KhKKbvJmW8V29mcffPGR0euzpWV+
  wg01KTOFO8Vv2hp5bKfe03SYe79oaYWP29d61zqdTlsdrR187wcW6UHfbiccFpYp8qlslEvZP
  vHPsmAbjrNNTvAoWMAnJhu1tEe9veHdDiaU4I9FQi7moOBEAJOxGOnEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-548.messagelabs.com!1667810041!167072!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4796 invoked from network); 7 Nov 2022 08:34:01 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:34:01 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 807141000D5
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:34:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 742281000C1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:34:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:34:00 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wolfssl: upgrade 5.5.2 -> 5.5.3
Date: Mon, 7 Nov 2022 16:33:41 +0800
Message-ID: <1667810023-31001-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667810023-31001-1-git-send-email-wangmy@fujitsu.com>
References: <1667810023-31001-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99459

From: Wang Mingyu <wangmy@fujitsu.com>

Fixes
---------
 Fix for possible buffer zeroization overrun introduced at the end of
 v5.5.2 release cycle in GitHub pull request 5743 (#5743) and fixed in
 pull request 5757 (#5757). In the case where a specific memory allocation
 failed or a hardware fault happened there was the potential for an overrun
 of 0's when masking the buffer used for (D)TLS 1.2 and lower operations.
 (D)TLS 1.3 only and crypto only users are not affected by the issue.
 This is not related in any way to recent issues reported in OpenSSL.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wolfssl/{wolfssl_5.5.2.bb => wolfssl_5.5.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.5.2.bb => wolfssl_5.5.3.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.2.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.3.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.2.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.3.bb
index aafb6d370..cef2b1662 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.2.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.3.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
-SRCREV = "0ea0b887a51771cc1668d71b9113bbc286dd4f8a"
+SRCREV = "a7635da9e64a43028d2f8f14bce75e4bed39f162"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


