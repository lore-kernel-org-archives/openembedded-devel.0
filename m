Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EC5C74A5B
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:36:33 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.90636.1679618192105682678
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FtCw0O2A;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679618190; i=@fujitsu.com;
	bh=VF+RD1mDB6sB67b9VzVCCWnXOYXSbkABKWfAjSR+f0Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FtCw0O2AMzzrQqcNrKIFv4gfUwzWFruUoQezCfS4+wEsnq/Cr1RPOKJFpJHblDzxv
	 SavmGBH+0XHehkSHU1EHTcAqYu8/oRncf9UsLsVLOSUJHDAy8+BsG8y/URzON+aC/M
	 xN4qpiAlv33yRKDmo48BGHBRzlM502weqkFReG7prcTTOlH68nGkjijf6eZqc921rH
	 9qa0w7vqk1r+a0heYzN//D6Q+9zPGcRZCq6ydnFh7cQmAg+3y/Xe9AxpiYpJBtfTqd
	 ey4nsmHC4f8T84DFaJPho/KZ7R0evemMdFxbN7Ca1yXhyrd1qKocmo7MWq06W4Gr74
	 +WZ2gnwrJEpeg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSbf3g0y
  Kwe1XXBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bnn8NMBRM4K/Y8vsLewLiCo4uRi0NI4Amj
  xJwP95i7GDmBnOtMEi8+WUAk9jBK7Ot7zwSSYBOQkrhx/z8biC0ioC+xdPYesAZmARWJF7972
  LsYOTiEBZwlXl3WBgmzCKhKLD78lgkkzCvgJPHpUSRIWEJAQWLKw/dgnZxA1Qs3TmOBWOskcb
  95Hth0XgFBiZMzn7BATJeQOPjiBTNEr6LE7MvNLBB2hUTj9ENMELaaxNVzm5gnMArOQtI+C0n
  7AkamVYxmxalFZalFuoYGeklFmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBgZtSzJi8g/Fq31+9Q4ySHExKorwSodIpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4P7+RSRESLEpNT61Iy8wBRhFMWoKDR0mE99BZoDRvcUFibnFmOkTqFKOilDjvjvdACQGQRE
  ZpHlwbLHIvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm9XsHNIUnM68EbvoroMVMQIuda8A
  WlyQipKQamGr3mpyNzp4o5fs6LjrFvMhupWfbst3+Jof0jraaxSqYPn+9Rdb0o88eXQ+mmQcU
  rsTV/jGZve345MmySxO63krWu2h6SW1VebDip2jdE/UKpecd0SstbrfO1zjicDnrrYvyYwapg
  idXg6U/6l9V/zvhIoeKfqmK/grb7mcxxxieCDLnmYasz1H1252+XjppcWqi9HeFpTF3pvK/Pf
  NT58TfqmMSLYdmFkxwUp76yVN1sVrRvclcyVVl+63Xmyu/PSLFH2dQeynBsMvULjtF9aJn/7Q
  fjxbZXUyylPr/bEJhQhTLjWIj6Y29IX9P+7GaXp2zzFvOPKZqcaVhu1uK8Rv1xD6/L1/ZV+sr
  /WZWYinOSDTUYi4qTgQA3ubGWFcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1679618188!254102!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27195 invoked from network); 24 Mar 2023 00:36:29 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:36:29 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C5C8D1000F5
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:28 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B90231000E9
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:36:27 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcgi-perl: upgrade 4.55 -> 4.56
Date: Fri, 24 Mar 2023 08:36:05 +0800
Message-ID: <1679618167-27390-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679618167-27390-1-git-send-email-wangmy@fujitsu.com>
References: <1679618167-27390-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101695

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- add new cookie field 'Priority' to CGI::Cookie code

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.55.bb => libcgi-perl_4.56.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.55.bb => libcgi-perl_4.56.bb} (93%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.55.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.56.bb
similarity index 93%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.55.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.56.bb
index 2278d14f6..341d348f9 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.55.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.56.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "67895e94b13fdf46a3893c9a17c2d0d4c3d4cd2550e1f41e26696c10cb8c64b2"
+SRC_URI[sha256sum] = "2d36d930b89ecdfbcc7d6d4740821bd466a0218abf1bd413568640b2f43799b7"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.34.1


