Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96142C7618D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:09:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.9017.1678889355191875105
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XIuXkOl5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889353; i=@fujitsu.com;
	bh=vahXN8A6VML+mK8WQAbm0uLCuFOaMcbbLc2PUXP82jQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XIuXkOl5wyo3uF0lvwzVbm1CXJ+vmuIM964Vfc/1HRF5GWj1JJsG+vil0PF7NWuNg
	 W6/RseAzs3OoVy1HrbaepVAlBy7WxGNl+XpRp7om0w48/Q/DSXBeWctKp0/kOHZhVw
	 iG8LF4AnnFP/6c/7lOJ4Dkt4MqeJnPt2OFbqzHBd97FHC4wT/rYQ73t5sfYaW5py1A
	 BgX6iiSNblwBsEROKeiJ8eAFkS4QdWIUPyqXrHpZVZgu3poUjI7XxNn04/uSIwVTrh
	 M2U5RWwmBS/z0jV4HUQJl96h0KOZwjseKYRBjR8OEuElxCyzURJRzHm4FJk1hSr76n
	 oQsUt6nYJxeKA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpNt5UTD
  FYM4XIYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPhyS9MBR85K67e0Wxg7OfsYuTiEBJ4yCjx
  ZO0RVgjnCpPEr1crWSCcPYwSnzbNYOpi5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBX4uG/i2BxFgFVic2LNrCC2LwCThJz3s1iAbElBBQkpjx8D1bDKeAsce36c6A4B9AyJ4
  kDd+sgygUlTs58wgIxXkLi4IsXzBCtihKzLzdDjamQaJx+iAnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0aw4tagstUjX0FQvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzB0U4oVJ+xgvNj3V+8QoyQHk5Io7581AilCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  HiLLgimCAkWpaanVqRl5gDjCCYtwcGjJMKbeh4ozVtckJhbnJkOkTrFqCglzpsL0icAksgozY
  Nrg8XuJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvA9ApvBk5pXATX8FtJgJaDHvPAGQxSW
  JCCmpBqZ+z5Cn2qdKJj89o7rWvdBSUDDkjSb3z+J9igkqZ+s9dOf25dwJCH1mWPfdpnOr4a7j
  Iskx9jsXyP48ddST03X2Hv4v5d//6Al17JK/HSghufscb765l4T+eiOZeTP8foqt1b6x49ipj
  yUBUUs7lmhs2P+cZ7r9sq3bgt1SyyK9uq8UMiwvZnONuTjFtZjVq3/OBgkLpvzZrxVO/p8+V/
  HHltds8y48KE5k3i+YejOFcZrHnGkCayfv3fmHqafK+PcWz5/L7PiEDGNePv7Cdr/u42e+U3n
  zr7qa3rzgzrPj+q0nz2665NiEFC+f98ho2gkr2bbShW91jh57/EScy/TM8qsiP8KLL3Uwmxzw
  lmBRYinOSDTUYi4qTgQAkUb6L1gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-565.messagelabs.com!1678889353!117205!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18389 invoked from network); 15 Mar 2023 14:09:13 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:09:13 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 07BF71AE
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:09:13 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id F0C801AC
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:09:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:09:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-twitter: upgrade 4.12.1 -> 4.13.0
Date: Wed, 15 Mar 2023 22:08:36 +0800
Message-ID: <1678889317-20778-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889317-20778-1-git-send-email-wangmy@fujitsu.com>
References: <1678889317-20778-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101556

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/tweepy/tweepy/releases/tag/v4.13.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-twitter_4.12.1.bb => python3-twitter_4.13.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_4.12.1.bb => python3-twitter_4.13.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.12.1.bb b/meta-python/recipes-devtools/python/python3-twitter_4.13.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-twitter_4.12.1.bb
rename to meta-python/recipes-devtools/python/python3-twitter_4.13.0.bb
index addbe16e0..e780a753e 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.13.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python module to support twitter API"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=9;endline=9;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "5e4c5b5d22f9e5dd9678a708fae4e40e6eeb1a860a89891a5de3040d5f3da8fe"
+SRC_URI[sha256sum] = "097425335f9f6674826ba7e72b2247bbca39c9ca0a0bd82f30a38a5bef8c6c88"
 
 PYPI_PACKAGE = "tweepy"
 
-- 
2.34.1


