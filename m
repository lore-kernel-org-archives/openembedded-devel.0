Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04225FA3740
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 02:07:17 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.1662.1667268425810706083
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 19:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pv1fFxuf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667268425; i=@fujitsu.com;
	bh=hqKNJCRqw6krrzt3lNUzK7D91BuRIY3x6habxcnU1Rc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pv1fFxufXFPVBZLa1gcZ+HE+mUb9VJTBbIipjUy3BIwNtJzmFL/Me757Pm+blagSV
	 +jLmCCwwE4UpidPMWmZtI0YbNdSMQy9jOjm71PvYUxy4v1jOG+L3uMSca9pN1sHHz8
	 lzacKWyboVYxKX4Qh2fDvjCFvRDs7NOyerQ2KSNJYs2oRfwJ/W4fqdWjNFT46v2O4r
	 sFtgv6Efydi2bAH2PeVN9kHmzGEz8TulxsMqb1kjIleuvNmmlECizhGA27YcSUAYYD
	 3hTr5DBh/9U/Qrw4nuIA8jtPQ63mR1UnOFf47JDx19NY8AkJSMpajk+poqYutULBM4
	 /5vVOcwviPNZw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpOtZn5B
  scOkfs8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjHx3wumgpU8FWsnfmFrYJzO3cXIxSEk8JBR
  Yt+9t+wQzmUmiafbnkI5uxklPk9+A+RwcrAJSEncuP+fDcQWEdCXWDp7DzOIzSygIvHidw9QD
  QeHsICvxLYT6SBhFqDwl75lYK28Ao4SS+9NZgKxJQQUJKY8fM8MUs4p4CSx9EE+SFgIqKTr9j
  ZmiHJBiZMzn7BATJeQOPjiBTNEq6LE7MvNLBB2hcSsWW1QI9Ukrp7bxDyBUXAWkvZZSNoXMDK
  tYjQrTi0qSy3SNdJLKspMzyjJTczM0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3ZTi5LAdjL1L/+gdYpTkYFIS5f0vkZAsxJeUn1KZkVicEV9UmpNafIhRhoNDSYI3s
  gYoJ1iUmp5akZaZA4wjmLQEB4+SCO+vaqA0b3FBYm5xZjpE6hSjLsfMr20HmIVY8vLzUqXEeZ
  1qgYoEQIoySvPgRsBi+hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4GkEt4MvNK4Da9Ajq
  CCegItvY4kCNKEhFSUg1M60pLv10UFhCzCPqvMil7+ua/sjfnuGbzNS1U2uC6VZvx/8elH1SP
  lPgfD1ko9UJ23mcxabuvu7mOJOwILC9kk2p4qXCB5cHaFEb+rmdqj5WCPFLzA38vre56vqQpc
  9LOz3q66YtWXjvFN+um0skXUrozElymWK/LMy6SSLhyVsBB44yN9OJfH5JmW+UeC7vX8vj8R+
  VUicNmzHaudpZfEj6eCk5XPpfN8Uv7Y9j3R823hJlmHDro9uTunFdGpQvnXJ2iyiK503uSY3j
  X1VCmA5z5+911gz36s75pRO16/0e5X+EFp8XN/lk9mbb9oU5VHkyhchm/F+z6aKc970+CvsfF
  0K1y21UW7Wg9/mm9EktxRqKhFnNRcSIA4PnWrGQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-728.messagelabs.com!1667268424!37838!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31592 invoked from network); 1 Nov 2022 02:07:05 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Nov 2022 02:07:05 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8BB3B1AF
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:07:04 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 80CAD73
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:07:04 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 1 Nov 2022 02:07:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-luma-oled: upgrade 3.8.1 -> 3.9.0
Date: Tue, 1 Nov 2022 10:06:45 +0800
Message-ID: <1667268408-9931-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667268408-9931-1-git-send-email-wangmy@fujitsu.com>
References: <1667268408-9931-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 02:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99383

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2022

Changelog:
==========
    Use native namespace package configuration
    Drop support for Python 3.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-luma-oled_3.8.1.bb => python3-luma-oled_3.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.8.1.bb => python3-luma-oled_3.9.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.8.1.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.9.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.8.1.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.9.0.bb
index a551e46fcb..4d34fbb01f 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.9.0.bb
@@ -4,11 +4,11 @@ A small library to drive an OLED device with either SSD1306 , SSD1309, SSD1322,
 SSD1325, SSD1327, SSD1331, SSD1351 or SH1106 chipset"
 HOMEPAGE = "https://github.com/rm-hull/luma.oled"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=20adf60219f02398b350b8bfbdad7a58"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a9b445ecc686e9413ddac655544da21d801bbc6b94612736cf59283e6b92bcbb"
+SRC_URI[sha256sum] = "e51c2ce5b88d591f9c64ab49d6bd5abd26759b87180706d615fec796569b6f6b"
 
 CLEANBROKEN = "1"
 
-- 
2.25.1


