Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054CDC3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:19:53 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.191292.1673939986077552201
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jBowxM3d;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939984; i=@fujitsu.com;
	bh=I6iuYUDcMp7oE2vBekj8/eZRpqyWcM01bm0ZHTCBtLA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jBowxM3dCFHZpu+4PIsNrY1aifF1A9pWc1PVOMdoXngPFzxYY3dCOMI3KP8BOpKES
	 WJIXIxxhCNVbiutcYnFZM1Ow2EVHcxQhWKIjc6R8IYNCg92LSOL0Wpo1+RVVyG7s36
	 eb44f+aAqJXfbtyt9zsfhjNCjYlIT/HwdB9S0RsWB4v+7NZuc1PtnwQPISQlNGQKR3
	 Sv3+m0nT4LoM9SI3g0xkPJvmk4qBiG9U7aotAmj1chP/xKwlKvTEyfZ+JgYmS9MUxU
	 j0Q/IOJsFqOo938vrPWcYRyW9aI0bh0Gk40Bue1vLgn+NVhDezno5ZOG4c3zC2kA1z
	 MFPuNlt6P4YxQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpMvvcyz
  ZYOchDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePch7nsBVN4K+b/XMHawHiJu4uRi0NI4CGj
  xMM3hxghnKtMEjvXzmeFcPYySlzac4Wti5GTg01ASuLG/f9gtoiAvsTS2XuYQWxmARWJF7972
  EFsYQEPiRUH9gA1c3CwCKhKTH1TBhLmFXCSOHn2AFi5hICCxJSH78FsTgFniYe374ONFAKq+d
  e+mBGiXlDi5MwnLBDjJSQOvngB1asoMftyMwuEXSnR+uEXlK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaN5cWpRWWqRrqGFXlJRZnpGSW5iZo5eYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVuck6K
  Xl5qySZGYPimFKcE7GDctOyP3iFGSQ4mJVHek6bHkoX4kvJTKjMSizPii0pzUosPMcpwcChJ8
  J7yAsoJFqWmp1akZeYAYwkmLcHBoyTCG24JlOYtLkjMLc5Mh0idYlSUEue9BtInAJLIKM2Da4
  PF7yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxPPICm8GTmlcBNfwW0mAlosUfJUZDFJYk
  IKakGpg0RmoJzbpz2nGNrfOlvy7HqPc3RkaefLLf6Nd+D16XW3ePzqugHWnv+iP861NpVwGUj
  dbIwaWNpf8FZazvNhHeSvif9i+JrHQJPnWZ2UZbgW3T9032xw+scJfZ8+nRtQXThm1WvZiZv5
  7tUt2GBNReP6vurU1YHHDin2JJ4Z45BuRWL6/dfky9m2T1eY9oSeOb07eLzWw5I5qe2dmlMlv
  n25f+/Taw3/29OTX74S74yzcJJNPpieI9i89Sg1ZlLnZdOzlDI0lv9XjVf7+yFu2s+2Do/mTV
  Z7+yurKUf7zX2tNokhBkLH+S+fPjRioU/505yWXXhW8HVrbsb5szTyOCeEPYhq/tY7X3fHTI3
  /MqUWIozEg21mIuKEwHKYhdRWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-728.messagelabs.com!1673939983!378362!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32727 invoked from network); 17 Jan 2023 07:19:43 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:19:43 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 261C21AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:19:43 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1AA021AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:19:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:19:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-absl: upgrade 1.3.0 -> 1.4.0
Date: Tue, 17 Jan 2023 15:19:27 +0800
Message-ID: <1673939970-20246-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939970-20246-1-git-send-email-wangmy@fujitsu.com>
References: <1673939970-20246-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100610

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
NEW
---
    (testing) Added @flagsaver.as_parsed: this allows saving/restoring flags
    using string values as if parsed from the command line and will also reflect
    other flag states after command line parsing, e.g. .present is set.

Changed
--------
    (logging) If no log dir is specified logging.find_log_dir() now falls back
    to tempfile.gettempdir() instead of /tmp/.

Fixed
-------
    (flags) Additional kwargs (e.g. short_name=) to DEFINE_multi_enum_class
    are now correctly passed to the underlying Flag object.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-absl_1.3.0.bb => python3-absl_1.4.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-absl_1.3.0.bb => python3-absl_1.4.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_1.3.0.bb b/meta-python/recipes-devtools/python/python3-absl_1.4.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-absl_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_1.4.0.bb
index b37627816..bbea9cacb 100644
--- a/meta-python/recipes-devtools/python/python3-absl_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_1.4.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "463c38a08d2e4cef6c498b76ba5bd4858e4c6ef51da1a5a1f27139a022e20248"
+SRC_URI[sha256sum] = "d2c244d01048ba476e7c080bd2c6df5e141d211de80223460d5b3b8a2a58433d"
 
 PYPI_PACKAGE = "absl-py"
 
-- 
2.25.1


