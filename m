Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9A4CCA47C
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 04:00:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.2735.1657857593965026278
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 20:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wxCw3hUe;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657857592; i=@fujitsu.com;
	bh=Jn7Mza9wXwrVQx/YV7gxHQf7ZVW4MVjEVPBJ7K4CpR8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wxCw3hUenKC9Urncxe8fs75ngxZlox4E2FRsZzaKRY5RNQdKnDSK4duiAW7KisIEs
	 4XyAflr6Oq70cwaamFL+Aymd7kT1AAEIO3/sprtguI95wgDM/pKZfoMtJimsoFutYZ
	 09s3ZAP9PZmRQI076dLhnEXrtJcUgFCU3LpoEGyBxl1mVO161ffE0fLCbL5JRG/aVs
	 EQ61NRXjSne/yZdtn4XsNwmqwlgpxcvjSDzXYpYvbv3c1cw3pQxVeMqIbav6LCxCs0
	 8q4S9xvaazOLXAQvg4xvAih9jhFs5b+jRIAga2HSTkUJzcA9IpPV2IuqNWqxCp1rPJ
	 F56pp375bCdWQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqGv+7EK
  SwdUp0hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aTy9eYC07yVmy61szWwPiTu4uRi0NI4Amj
  RMv6Z+wQznUmib5Vq1ggnJOMEp0/HjN1MXJysAmoSzy++ZoRxBYR0JdYOnsPM4jNLKAq0X1xD
  TuILSzgKbG44Q0LiM0CFJ94/DxYPa+Au8TULcvB5kgIKEhMefgerJdTwEPizqpesF4hoJpdy9
  pZIOoFJU7OfMICMV9C4uCLF8wQvUoSJ1Z8hJpTIfH68CWouJrE1XObmCcwCs5C0j4LSfsCRqZ
  VjNZJRZnpGSW5iZk5uoYGBrqGhqa6xqa6hhYmeolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5
  yTkpenmpJZsYgYGcUqy8Ywdj26qfeocYJTmYlER5D+VfSBLiS8pPqcxILM6ILyrNSS0+xCjDw
  aEkwXvsMVBOsCg1PbUiLTMHGFUwaQkOHiURXqeHQGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5e
  elSonzloAUCYAUZZTmwY2ARfglRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8S0Au4cnMK4H
  b9AroCCagIx76gh1RkoiQkmpgWqzp8ElW5x6P2uRdFpuPe55cF7GtXaQsOGKj5Otpvw77ufSb
  +u329hFRKFybdOMMxxwdEYfNDu1GCRO6mZZuyPZ8ea7yZHbwTN410z+43bK/wXNM6/7qkC8er
  vMzrnIwLUmsu7/w4Z1p63/Znl/s9XeX4ordS94WzpFsPmsnJcvj5rZHZu2alxkcMyUzzWcZd8
  vdWNhz8pJYjBPTHaXVqX/nqVhnd74/PfG33iOjdZv9Ujf3Kjx66fiFbaNu8rxMg5d6e+7dEy5
  aobJn+7q1tzIYUn6nLJ+25bbqF+0jsxyN9rKHdWx+PcVN5OjWA/emBCVJ2LuaH3F8//rPYf+g
  Jg85kcvXOq7xCouWLXJQuKXEUpyRaKjFXFScCAALAKsgawMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-571.messagelabs.com!1657857591!224479!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10315 invoked from network); 15 Jul 2022 03:59:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jul 2022 03:59:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 21FE310018D
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:59:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 15291100043
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:59:51 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 15 Jul 2022 04:59:49 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ujson: upgrade 5.3.0 -> 5.4.0
Date: Fri, 15 Jul 2022 11:59:36 +0800
Message-ID: <1657857578-19917-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657857578-19917-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1657857578-19917-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 04:00:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97833

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
Added
------
    Add support for arbitrary size integers (#548)

Fixed
---------
    CVE-2022-31116:
        Replace wchar_t string decoding implementation with a uint32_t-based one (#555)
        Fix handling of surrogates on decoding (#550)
    CVE-2022-31117: Potential double free of buffer during string decoding
    Fix memory leak on encoding errors when the buffer was resized (#549)
    Integer parsing: always detect overflows (#544)
    Fix handling of surrogates on encoding (#530)

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-ujson_5.3.0.bb => python3-ujson_5.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.3.0.bb => python3-ujson_5.4.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.3.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.4.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-ujson_5.3.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.4.0.bb
index 4c3ef82c9..15cf80e36 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.4.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5418f0b03302d0a"
 
-SRC_URI[sha256sum] = "ab938777b3ac0372231ee654a7f6a13787e587b1ca268d8aa7e6fb6846e477d0"
+SRC_URI[sha256sum] = "6b953e09441e307504130755e5bd6b15850178d591f66292bba4608c4f7f9b00"
 
 inherit pypi ptest setuptools3
 
-- 
2.25.1


