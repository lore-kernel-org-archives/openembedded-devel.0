Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE2FC433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 09:44:05 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.6673.1642067043993266235
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 01:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U1OijJ44;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642067041; i=@fujitsu.com;
	bh=X85DgcKH5euXAfxKbBZtdeW32YNLRka96kpze9RoCAc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=U1OijJ44GFcHRlTgRwNyHxfGx/wIUMEoYmiyrB+hCkXtPyHgVySZX4cZRfGkr4gZd
	 QvMI84Zdf/YrvEORW3lfXzAztfKP9inJBhgR4AR1KJMLGzSaqAIrWnHP/RWlEziiiP
	 5K8AU5k3bJSnO7PrZ0w6/1o/LA7h7gP0m24RKNZzhVuKbcNY+XpqeMr2CmvJdPCVlF
	 7Yiti+2RPUcCbMZ/ruwDgS/BZR4TMJAJyOFiHgWHWMTiA0gJwgaSBM7xb8P5E1S4bU
	 GBpWOHnWNObKAI56ndTTmB0Q6u0w6Fn+rpYoHUUO4oX0t2w9pJVdMXo4j5I4EYiT/5
	 N9xrKIxgFI8Hw==
Received: from [100.115.65.13] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 E9/AD-24146-064FFD16; Thu, 13 Jan 2022 09:44:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxSTfhy/1
  Eg6+3VCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozW62/YCjbzVFyd+J6pgXELdxcjF4eQwBNG
  ifPXe5i7GDmBnAtMEhePmkIkTjJKfDu/gx0kwSagLvH45mtGEFtEQF9i6ew9YA3MAqoS3RfXg
  NUIC/hIrP54lw3EZgGKH+ncyQpi8wq4S7T8aQSzJQQUJKY8fM8MEReUODnzCQvEHAmJgy9eME
  PUKEmcWPGRCcKukHh9+BJUXE3i6rlNzBMY+WchaZ+FpH0BI9MqRtukosz0jJLcxMwcXUMDA11
  DQ1NdMxNdYxO9xCrdRL3UUt3k1LySokSgrF5iebFeanGxXnFlbnJOil5easkmRmBophQ7KO1g
  PNv3U+8QoyQHk5Ior9Cn+4lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgffwDKCRalpqdWpGXmA
  OMEJi3BwaMkwjvvI1Cat7ggMbc4Mx0idYpRUUqcN/gzUEIAJJFRmgfXBovNS4yyUsK8jAwMDE
  I8BalFuZklqPKvGMU5GJWEecNBpvBk5pXATX8FtJgJaPHbP/dAFpckIqSkGpjEj4T17vXvvpZ
  65fWrVIm+6uVNPw49W8lp4dMk4XPwkq3ciXiGcr73UXPstZf+EWzZwXNot/n/OqmXN0La4178
  sYqczCS6O0i0bUb2pN+xKTOy4zbunXZJKTvUxVHIf1ax3JSUjamTUw+ZsD15fUMvk6m/Z2rNQ
  3HHBq/17/6G8LCdKl9Vuztp3bT/RTN/T9olc3f+9T2L3qRLXJu3xvm90DXhq8FvzvyZaKtTqN
  tfskygNUVO3amdc9NenoKrv97G2xYyxZef1/rb89b+2ISJlyo/7Be2qtGvs58Z9Trv6Nmc18f
  eRrzkLzyR2hiVcv0RX+fl/23fIw5/c7i1egrXvu7Zwf6OpZUCnJMVrv9WYinOSDTUYi4qTgQA
  6jmGBEgDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-545.messagelabs.com!1642067040!10415!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15875 invoked from network); 13 Jan 2022 09:44:00 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Jan 2022 09:44:00 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 21C01100457
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 09:44:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 14B0210044F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 09:44:00 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 13 Jan 2022 09:43:42 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pystache: upgrade 0.5.4 -> 0.6.0
Date: Thu, 13 Jan 2022 17:43:33 +0800
Message-ID: <1642067014-26574-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 09:44:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94805

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================
Bump spec versions to latest => v1.1.3
Modernize python and CI tools, update docs/doctests
Update unicode conversion test for py3-only
Add pep8speaks cfg, cleanup warnings
Remove superfluous setup test/unused imports
Add conda recipe/CI build

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pystache_0.5.4.bb => python3-pystache_0.6.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pystache_0.5.4.bb => python3-pystache_0.6.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb b/meta-python/recipes-devtools/python/python3-pystache_0.6.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb
rename to meta-python/recipes-devtools/python/python3-pystache_0.6.0.bb
index 0ae5a19115..d64b806600 100644
--- a/meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pystache_0.6.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb4417802c56384aac71b34505528a60"
 
 SRC_URI += "file://0001-Modernize-python-versions-remove-py2x-and-fix-tests-.patch"
 
-SRC_URI[md5sum] = "485885e67a0f6411d5252e69b20a35ca"
-SRC_URI[sha256sum] = "f7bbc265fb957b4d6c7c042b336563179444ab313fb93a719759111eabd3b85a"
+SRC_URI[sha256sum] = "93bf92b2149a4c4b58d12142e2c4c6dd5c08d89e4c95afccd4b6efe2ee1d470d"
 
 inherit pypi setuptools3
 
-- 
2.25.1


