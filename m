Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D791DC54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:17:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.3055.1663064254565176644
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uUMivjcb;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064252; i=@fujitsu.com;
	bh=mKJks1KflWZzMOgHP5eNHsHq8WmP3qMN9QqTkQgPE8c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uUMivjcb0OeTpQcTc8XQD2O2qlsAbNaHsHsVWKv/cCz6AfhCXs6uLGqs8ECiJlfaF
	 7FJTRqrEJ4Osew7BGtL7vjju+6MkdOAhLDSdaLjZZOxzWmB2xIMJka6Bz19agCj5rX
	 9zl8PAJIMlYnxwG39iNB9gyCXSFEzHanqFNSamLDvJdHor0VKwzW+DJTnmFPmr/Oyf
	 EOe9pZ7y6QQc8MBXUu+5aP1zG0wvgFB5V5CMNK3CN/CuRqTa3AQ36PXQoArHODpppA
	 YytOBm4Hssz/Xa585mpCg0cfhYmAUDDc9ySOOXLetk7qptWIwdcAkg278HTxaVZcUf
	 aVOWSZiMPW7OQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWXdPhEK
  ywcnFEhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bvVv+C3xwVM/fOYW1gXM7RxcjJISTwkFHi
  wsKSLkYuIPsyk0TfsRvsEM4eRomj+/+xgFSxCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPU
  AMHh7CAr8TP3yYgYRYBVYn1W9eDlfMKOEpc2dTPBGJLCChITHn4HqyVU8BJYv3zhSwQRzhKLN
  yylxmiXlDi5MwnLBDjJSQOvnjBDNGrKDH7cjMLhF0h0Tj9ENRMNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYbZOKMtMzSnITM3N0DQ0MdA0NTSG0pbleYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVu
  ck6KXl5qySZGYBinFKcc3cF4bN8vvUOMkhxMSqK8kV4KyUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeONDgHKCRanpqRVpmTnAmIJJS3DwKInw8gQDpXmLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5
  cqJc470xuoSACkKKM0D24ELL4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmlQgDmsKTmVc
  Ct+kV0BFMQEcYWcuDHFGSiJCSamDaNGfWwWylhS4ON4K3bdD2tZ8Y/crhUrLFzgNVu75tN15o
  cfh2n5mWltWpCavLf8jLtjyRuDtz0k77VrEPK6YdzZ6yzWmu51znD+bp9gITVa9Wm8ZFr51d0
  VF5gKF6g2/x/I8W/+fUHHDkFbwU9WKy5Umlhh9iprd6JwctWfNiU1XBF7Pj05YudlyS0vHgT1
  OquM5DF91jq6w+tU/i8q5kUIpILbyWOr/6SZeOzQWWRxmtzV2hM60Tncx3JDup2Rc/To76t+P
  FH7ErLwX619yZl37s1fx9G4UvfFv/z9i2sOfgnrqA/Vs4f00RWcDCfrRKJvaz+HY+Lrt3ITk1
  njySCwT4Gfr4Dur+VXm43FhLiaU4I9FQi7moOBEAaCoD+GoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-745.messagelabs.com!1663064252!493108!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20574 invoked from network); 13 Sep 2022 10:17:32 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:17:32 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CC2D6142
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:31 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BF95E73
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:31 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:17:29 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiofiles: upgrade 0.8.0 -> 22.1.0
Date: Tue, 13 Sep 2022 18:17:12 +0800
Message-ID: <1663064233-3236-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064233-3236-1-git-send-email-wangmy@fujitsu.com>
References: <1663064233-3236-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:17:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98771

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiofiles_0.8.0.bb => python3-aiofiles_22.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiofiles_0.8.0.bb => python3-aiofiles_22.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_22.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-aiofiles_22.1.0.bb
index d50cb8e6f4..40ac76efd5 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_22.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[sha256sum] = "8334f23235248a3b2e83b2c3a78a22674f39969b96397126cc93664d9a901e59"
+SRC_URI[sha256sum] = "9107f1ca0b2a5553987a94a3c9959fe5b491fdf731389aa5b7b1bd0733e32de6"
 
 PYPI_PACKAGE = "aiofiles"
 
-- 
2.25.1


