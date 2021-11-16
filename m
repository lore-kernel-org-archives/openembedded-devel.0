Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1F7C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:38:37 +0000 (UTC)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.5240.1637033915470141865
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=j78MrpBV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637033913; i=@fujitsu.com;
	bh=iT6PEmvnk/RVoO0L+1iobuVsKXHr/B23fdxXKoxQMMQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=j78MrpBVWVl7UulXW2pPrH8B7xseQabdCSgdjYpJ+H6wXzB7Zr5ucKAIP9XN7xn/h
	 9vKygK+L3tm7AZRNsjnfiu3rnzD/OgZ7Hj3qu7CCkYvREDgUqsZtklKzJYY0polZ+R
	 +eKY0VPyY2fxKzk34nR1MyJPDopuBkqEbOLmtYwK2ieSPIo4ZexY4fgcAPmwC86X4a
	 WrvW4f5C1bIlwrGpVN6QdpXO9GLEcZMjiHzzka6bCmEawIIt+hKPIi811A32PuHEFn
	 mtCrFCRHZd4yAkvQtM9mIIl8XOQuqZTmM44XyOEVDyZsLAGuabffX4eFnYRiAOpumC
	 YVkw1MvhfOWPg==
Received: from [100.112.196.154] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id B7/8F-17294-9B723916;
 Tue, 16 Nov 2021 03:38:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqLtDfXK
  iwcutFhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bRL2cZC9ZwV2zbuJepgXEKVxcjF4eQwBNG
  iWPvdrN0MXICOReYJBZ8y4RInGCU+NHcCpZgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBDYsGka2BxFgFViZVLrjOC2LwCThKnm/YxgdgSAgoSUx6+B6vhFHCW+HSykxFisZPE8e
  75rBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJWbPaoGaqSVw9t4l5AqPgLCTts5C0L2B
  kWsVonlSUmZ5RkpuYmaNraGCga2hopGtoaaZrZqKXWKWbpJdaqlueWlyia6iXWF6sV1yZm5yT
  opeXWrKJERi+KQVHHHYw3n/9Qe8QoyQHk5Iob9yiSYlCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  HgfqUxOFBIsSk1PrUjLzAHGEkxagoNHSYT3sipQmre4IDG3ODMdInWKUVFKnHerGlBCACSRUZ
  oH1waL30uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHl7QKbwZOaVwE1/BbSYCWix/b1+kMU
  liQgpqQampGM/Wi7+k+w25Azfruxrcjdk8811kQlCHI7+C31WipTlzzshtF9PK2mlnddTj56z
  ZaISMjNuTFG/M+N5APeJOxdtzDJK+hP3/xH/mXTIq+mSZb7LzStnDYp3mK/Vk75X/clmxesTR
  lu2b0rzf1tknLn09ULXBw6dSTXHPm4SM/u6jIUvar/0yZi6CzaNpnz68zRP163bKz2/yOrhb4
  f0s30OxxiUQmed1pAxPFbUVNPR9uCswn0lu9d10z5fKtjNpbS/Rqv5xK1X8r1lFUwx3U66F3R
  85+7/v2DjirpJi+Y5fPyeHK8xR+MX7wRxg/uLrHs93h1WP9kmH62QvdpG+fvJe6cWZG405jxe
  nntHiaU4I9FQi7moOBEAC+VkU1oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-285.messagelabs.com!1637033912!541046!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11205 invoked from network); 16 Nov 2021 03:38:32 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Nov 2021 03:38:32 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 73DC710022B
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:38:32 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 66F6E100229
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:38:32 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 16 Nov 2021 03:38:11 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] smcroute: upgrade 2.5.3 -> 2.5.4
Date: Tue, 16 Nov 2021 11:36:41 +0800
Message-ID: <1637033801-81290-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637033801-81290-1-git-send-email-wangmy@fujitsu.com>
References: <1637033801-81290-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 03:38:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93970

Changes:
Automatically extract new version from GIT tag

Fixes:
Avoid trying to delete inactive VIFs. Fixing an annoying bogus error:
"Failed deleting VIF for iface lo: Resource temporarily unavailable"
Fix #171: too small string buffer for IPv6 address causing garbled
output in periodic expiry callback
Fix too small buffer for IPv6 address in mroute display functions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../smcroute/{smcroute_2.5.3.bb => smcroute_2.5.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/smcroute/{smcroute_2.5.3.bb => smcroute_2.5.4.bb} (89%)

diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.5.3.bb b/meta-networking/recipes-support/smcroute/smcroute_2.5.4.bb
similarity index 89%
rename from meta-networking/recipes-support/smcroute/smcroute_2.5.3.bb
rename to meta-networking/recipes-support/smcroute/smcroute_2.5.4.bb
index fc1575d65e..21a3c44264 100644
--- a/meta-networking/recipes-support/smcroute/smcroute_2.5.3.bb
+++ b/meta-networking/recipes-support/smcroute/smcroute_2.5.4.bb
@@ -5,7 +5,7 @@ SECTION = "net"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "d998043dc39cb763c9adec3eda3cc8b1d79f444c"
+SRCREV = "9b6e397595a154c84a329c55bed21e0c43e89ee6"
 SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


