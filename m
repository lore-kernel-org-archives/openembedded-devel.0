Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005A3C43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 02:09:33 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.3449.1658455764730232180
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 19:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=g1zNQglD;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658455762; i=@fujitsu.com;
	bh=wKskR/wSnrJpqLTJ9MfqALOW713Y8e/5Chd7EKgTduI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=g1zNQglDyeEa5H1dhrBqoBvSjyj3NAgSaFiCXIJ1LHqRAFVqLiKjxLvhDim7BYFOJ
	 pS40OX3AtPu84wpG4san7UsDbrWetnSPyO0LsC/PRplPeiA01OWLdzeSbyM1pTuzfJ
	 t6jjK51pDYhX/sDdawbWuhfSDkMNai7+P5E/gkvN6nhcXvmCVcpRv19TWLat729q57
	 megpXTHKhfZf8wE4QJU8PTB8x6UJLMumVdJmQgRLrGr9h6kqcpqhYrzsPGoPfpIvZc
	 JM1Q3qeVVHUJWZgZ1U7PrjlUXZTt8YP1BZiR4fwLjFpcQJTQ/jSMuSI6xNikPKRV+K
	 UNnK+Y69hzaSQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORpHuJ7Va
  SwdQX3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bhzduZCq5wVxxrv8TSwLiVq4uRi0NI4CGj
  xN0Vt5ggnCtMEj+nXGGEcPYwSnyZsQrI4eRgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBH4uevb0wgNouAqsS5da/BbF4BJ4mL2z6C1UgIKEhMefgerJdTwFni5ot/YDVCQDUrTj
  RC1QtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJGbM2MYGYatJXD23iXkCo+AsJO2zkLQvYGR
  axWidVJSZnlGSm5iZo2toYKBraGiqa2mma2iml1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZ
  m5yTopeXWrKJERjIKcUJAjsY9+77pXeIUZKDSUmUd9+km0lCfEn5KZUZicUZ8UWlOanFhxhlO
  DiUJHivMN9KEhIsSk1PrUjLzAFGFUxagoNHSYTX4gtQK29xQWJucWY6ROoUoy7HzK9tB5iFWP
  Ly81KlxHnVWYFmCIAUZZTmwY2ARfglRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8bSxAU3g
  y80rgNr0COoIJ6Ahz8xsgR5QkIqSkGpjWveqQ3fHt7bPtyX5ytQLWb541nxAu2686KVGoS2X9
  sfMdfy45nW6q0jjZz7c47fq+CDf1VXw28rOkr5Zo8yWvj9v0pFZlaYm34zfro3fusaTJBfHud
  9I8Pl8hxfHChhzBFY+v7wgM5dh1YPnDxz0Xm5erar+79O/f5Edae5zmr12479Hl9fsu9iuf4Y
  zukVDJMRe/mtPJr6bNfNn53s27rHsYNVOUL82cy5jKUxxTNWGWZ3uUX6/v/u3Sl5lsPTaddGX
  8cNXoW942M8N59/xex00SZzYK9l1WMvHAJs1+987og+c28H531UuqLZ7hwXR4le+0tDTlD6mS
  X+e4xX6axBRxv8c4WGSf75vWNXlKLMUZiYZazEXFiQAbnsGrawMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1658455761!190648!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3008 invoked from network); 22 Jul 2022 02:09:22 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 02:09:22 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9D5211B5
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:09:21 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 918FC1AE
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:09:21 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 03:09:19 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pylint: upgrade 2.14.4 -> 2.14.5
Date: Fri, 22 Jul 2022 10:08:55 +0800
Message-ID: <1658455737-26848-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658455737-26848-1-git-send-email-wangmy@fujitsu.com>
References: <1658455737-26848-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 02:09:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97938

Changelog:
==========
    Fixed a crash in the undefined-loop-variable check when enumerate() is used
    in a ternary expression.

    Fixed handling of -- as separator between positional arguments and flags.

    Fixed the disabling of fixme and its interaction with useless-suppression.

    Allow lists of default values in parameter documentation for Numpy style.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pylint_2.14.4.bb => python3-pylint_2.14.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_2.14.4.bb => python3-pylint_2.14.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.14.4.bb b/meta-python/recipes-devtools/python/python3-pylint_2.14.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pylint_2.14.4.bb
rename to meta-python/recipes-devtools/python/python3-pylint_2.14.5.bb
index 39bd17dfe9..738b9250c0 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.14.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.14.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI[sha256sum] = "47705453aa9dce520e123a7d51843d5f0032cbfa06870f89f00927aa1f735a4a"
+SRC_URI[sha256sum] = "487ce2192eee48211269a0e976421f334cf94de1806ca9d0a99449adcdf0285e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


