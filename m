Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB27DC77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:07:25 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.66586.1684069637871887089
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=b6xRFfb6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069636; i=@fujitsu.com;
	bh=ZITIJ1mGc6YH7IjgnZlC8nxAsSAE4TdX01sIH1KF4Ng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=b6xRFfb6ttpd6/27pQGiwNOMQep6CncGg4u18lmmIuVMLjThiYNmOh1AQXiHu9xaj
	 Rb2B5GG3hNhpsmTGYRfRjSg4To2e3/qL8yVDUYUjin+REc3oSo1wkb8vtg6D8W9HHD
	 AoZJ7pttVpHkOUvC6hG10mpOF+UeAS2/x2bgeRpYCVwzptpcrRQ80h6RsGZu4meGNa
	 rrBZITa1VRKR3wMM5NM6AnENxv0efkU/o7bpP8G5ZACLXSmCSgKaFlqNCl/HhELNSH
	 ttn7WRxLLnTdgFs9GAb6dYLH/d1ijO3Gq52LekVCx0v7FXoEMb1pQBJkQhP6nj7AeU
	 nmSszQZ7M+flQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRWlGSWpSXmKPExsViZ8ORpMt8NyH
  FYEqXucXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjH58BnGghucFZOa9zM2MP7g6GLk4hAS2Mgo
  0fboJguEM5VJ4tzcpaxdjJwcbAISEtP3nmQHsUUEdCU+fpjLCGIzC6hIzJh8hAnEFhYIkGh7u
  ogNxGYRUJWY03SMBcTmFXCSeP14D5gtIaAgMeXhe2YQm1PAWeLOrU4wWwio5vbyb8wQNWoSV8
  9tYp7AyLOAkWEVo1lxalFZapGuoYFeUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanG
  xXnFlbnJOil5easkmRmBQpBQzpexgXLXrr94hRkkOJiVR3mslcSlCfEn5KZUZicUZ8UWlOanF
  hxhlODiUJHh1biakCAkWpaanVqRl5gADFCYtwcGjJMIbdxUozVtckJhbnJkOkTrFqCglzqt+B
  yghAJLIKM2Da4NFxSVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrw8N4Cm8GTmlcBNfwW0mA
  lo8a098SCLSxIRUlINTBO4Tifbya/uPqpl3H7r+uToLQrOGw7Me5wsz/l78ZK+Za5vn6goL9u
  yTsm7haXm/1NLodiTm6y2Sb2unXRSdMuzatntV5/deff3e0/15eRVczvFr99Uc2q425vF+vr5
  UpFTp8784fbwyTH4/bRAL+/N5ncKjW9vhdqxMgtOl7j3+GNU44ucABbFKZ49Zh/XNxTXL5j3w
  8TN7ewzj+qrl0/y2nr8WHzf597CLpGwrmw12fCQ7uJfgT3m/Duj5XRjfGy/s/11PHBc38WPTd
  9Gbn/42/kPEtxPn5BMX531auHbiYbi2rs7ZjNNEbXrfCAi+HTN5+c7NSe8i7yXMN0z38/r4X/
  dCKH9R4sXTpM3PaLEUpyRaKjFXFScCABWouKuBQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1684069635!261125!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11048 invoked from network); 14 May 2023 13:07:15 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:07:15 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 85AE61AE;
	Sun, 14 May 2023 14:07:15 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id AC6817B;
	Sun, 14 May 2023 14:07:14 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websockets: upgrade 11.0.2 -> 11.0.3
Date: Sun, 14 May 2023 21:06:56 +0800
Message-Id: <1684069617-12375-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069617-12375-1-git-send-email-wangmy@fujitsu.com>
References: <1684069617-12375-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102584

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fixed the threading implementation of servers on Windows.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-websockets_11.0.2.bb => python3-websockets_11.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websockets_11.0.2.bb => python3-websockets_11.0.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_11.0.2.bb b/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-websockets_11.0.2.bb
rename to meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb
index 1653c7716d..92dbd20ca1 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_11.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b1a69701eb98ed83dd099de4a686dc892c413d974fa31602bc00aca7cb988ac9"
+SRC_URI[sha256sum] = "88fc51d9a26b10fc331be344f1781224a375b78488fc343620184e95a4b27016"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


