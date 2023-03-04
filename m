Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0290C678DB
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:05:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.6938.1677927948910482999
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lJ5Vfpqs;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677927947; i=@fujitsu.com;
	bh=psAISaKhbEhurWxnDwy+GlKRBer33GkorR7qYASK0iY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lJ5Vfpqs3+HZJg1s/eBghWbac0BH2bMN8TNOSMWOdnu2J9hgi/xmrKuuG8f3IU5SF
	 xQ+c4YBvrhvm635pqzTGOqT86K5WIXTmXqaghTpbaNmw2skFAu2wy+lh2WrcW4qRQv
	 E33r9m9t7Yw7adP9dZnZzDQbRnjMN0kr7cjvkdR/yHi9qzhW1AAzYoCzy2kkY0KdRA
	 DM2OnxVAgH035DukXN34vZiFzuvOcHUafDSzb8Yn5hZ3Nf08J9iTCVNsnaLhGNQt+f
	 T+ymeZ1rdJ1q/pMrQfdr+EuK9tPDYAknHeM8ESRsKjWrt/js7l0p/LTbelCGX+jZ35
	 91dI4XEn78FBg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSZdTjTn
  FYMMxbYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP261/sBbv4KpquX2NqYLzP08XIxSEk8IRR
  YuaTuUwQzg0miav3vrJBOHsYJX52HmLtYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAX+LrzbeMIDYLUHzCnGdgcV4BJ4mzr++wgNgSAgoSUx6+B+vlFHCW2LLkOdhMIaCaxW
  cWskDUC0qcnPmEBWK+hMTBFy+YIXoVJWZfboaaUynR+uEXlK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNpcWpRWWqRrpFeUlFmekZJbmJmjl5ilW6iXmqpbnlqcQlQJrG8WC+1uFivuDI3OSdFLy+1
  ZBMjMHhTilX7dzCu7f2rd4hRkoNJSZR3EitDihBfUn5KZUZicUZ8UWlOavEhRhkODiUJXhlV5
  hQhwaLU9NSKtMwcYCTBpCU4eJREeLeIAKV5iwsSc4sz0yFSpxgVpcR5BZSBEgIgiYzSPLg2WP
  ReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMu0UFaApPZl4J3PRXQIuZgBZrnGYAWVySiJC
  SamCyvuB+dd4f9QPr/03VXLfh8N0tTDkyPA/nOh2Yfznpd5Px9LYfZ2LtnbeGnm+auvHL7ssx
  CQqHZx7NEuHU7WfYEnPHaafdo/myqtemiQWY3Dyv1X2wLX/Szl86q/Kjpl6aYXRqUqdUpJtQq
  P0hi48Ws7Yc9lk3v1r0eF/C7xdBDg2u91bH1s/sKEhIOKfVP4vlDMO711nLe3ym7U61XJTrV2
  Po/2O38fKomnfJpy1X+T1OSupLueGc2KP7RHqj/4W8WMknF3in/d6oGBQtovAhSu7Xp7b7zxZ
  PfGZlpjpnX8mUzPn+MhtCpkur/tl7+GPL3TVNn+Qu8F8N/G7z08NjA9ecZ0tuZq5gXbo87ZdB
  iBJLcUaioRZzUXEiAIbhnNpZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1677927945!148521!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 635 invoked from network); 4 Mar 2023 11:05:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:05:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 696BB1000FB
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:05:45 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5DD791000F5
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:05:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:05:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-fastnumbers: upgrade 4.0.1 -> 5.0.1
Date: Sat, 4 Mar 2023 19:05:19 +0800
Message-ID: <1677927919-22891-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677927919-22891-1-git-send-email-wangmy@fujitsu.com>
References: <1677927919-22891-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101365

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Added
--------
    Added the map option to all try_* functions to enable very fast conversions of lists or other iterables (issues #61, #63 and #67)
    Added try_array to enable very fast conversions directly to numpy arrays (issues #62 and #65)

Changed
---------
    Move to a model where the return code is a value or error instead of a model where one has to check the error state after getting a value (issue #66)
    Significantly simplified the type annotations (by 4000+ lines!)

Fixed
-------
    Increased code coverage and fixed missing headers in codecov reaport (issue #64)
    Add back missing key option in type hints for deprecated fast_* functions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-fastnumbers_4.0.1.bb => python3-fastnumbers_5.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastnumbers_4.0.1.bb => python3-fastnumbers_5.0.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_4.0.1.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_5.0.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-fastnumbers_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-fastnumbers_5.0.1.bb
index e3a0c6c0f..7494c45f0 100644
--- a/meta-python/recipes-devtools/python/python3-fastnumbers_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers_5.0.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=58db8ac9e152dd9b700f4d39ff40a31a"
 
 PYPI_PACKAGE = "fastnumbers"
 
-SRC_URI[sha256sum] = "3e7d74b1debb44c4803c0fea59a63d0785d6a26ebcb902e2262b3c3fba81b400"
+SRC_URI[sha256sum] = "9e4fd92cdf263a8e0865af19c40ae9df45a9bc0eb5e22fefea871140e7e0262f"
 
 inherit pypi setuptools3
-- 
2.34.1


