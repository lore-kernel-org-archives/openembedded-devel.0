Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F96BC25B0E
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:32:39 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.13591.1660545150928752729
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bnWJgZ6n;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660545149; i=@fujitsu.com;
	bh=fY3dasztUzVMOJxLny8eqbc0pAk8+uJ0E9JQDvZ3HoA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bnWJgZ6nrr0IfyD3p2crYsL0+AjgAwAaRoOum5FhYyTcPEu0Dz3N9/3GnuF/zP8iF
	 TTgnJfTliNKjmHjU1+xZe9Bo5sPwhSI+zYWU3AcrYNFA0R3qIqFz/JetkL1srBC30L
	 tbv7PNFVwv6Mqz+K5jEvKeoxjZUwVY7VeC7W27MzljVF78lp1K1R1p6rcxOPhzcZlk
	 0YQbCOlZsFR0fbeI0YAzRqWB1tsKdiI1hJ1IpHJqGCPjwe2c+a1+LBDWvUWtPagzQ1
	 3UmI7Cmc0r5gnVDvCjyce5BGjRXe4UcEBnm+ArzKwexwbH/fljs1+15Z9oiJzkE9vw
	 KK9QRtg3A2FAw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpFvz4me
  SwcajyhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ayJXUFvzgqjj6bxNLAOJ2ji5GLQ0jgIaNE
  54H57BDOZSaJdbdOMEI4exglehomAGU4OdgE1CSm37rBCmKLCOhLLJ29hxnEZhZQkXjxuweoh
  oNDWMBDYscRc5Awi4CqxMc5z8BKeAUcJX7e/80GYksIKEhMefgeLM4p4CRx/G4f2HghoJot87
  ZC1QtKnJz5hAVivITEwRcvmCF6FSVmX25mgbArJGbM2AY1U03i6rlNzBMYBWchaZ+FpH0BI9M
  qRuukosz0jJLcxMwcXUMDA11DQ1NdSzNdQzO9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src
  5JwUvbzUkk2MwCBOKU4Q2MG4d98vvUOMkhxMSqK81y7+TBLiS8pPqcxILM6ILyrNSS0+xCjDw
  aEkwVv6HCgnWJSanlqRlpkDjCiYtAQHj5II74LbQGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5e
  elSonz1j0DKhIAKcoozYMbAYvuS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeXlBpvBk5pX
  AbXoFdAQT0BF6d7+DHFGSiJCSamCqF9j1PDPLK2BmytabCbwVbMfPTUjYxW6ZZNYcwXTntOqO
  TX3TUh6c3i/4OlNrH0PH7TeRjxm47QK27a5ZUJ2zW4F1/blnjpZvOFffZBd9Uu5Y2LzrcdmW6
  TlPT53VYZ67aH6v/Ae3xQpeznsOiEvcypty4tvbvrLpLD/3rXduvPljXhhXGtuPrYfCn/JKsj
  JZ3fWfN0n4zQwp4TuLq/O/ihh0WTz9bub0tVG5IL+e2fnsE0OXRqvf8y1FNZduCo94xuSye7Z
  NaJR0VbFQxNJ/a29PrmtnecTv9U0mbvFv72pHg12XfhyXcsuZm7r7ZEz6Sv7dC3Wu9+/fVG+x
  fpnc9EzDX/3+e+ta9B49YhdUYinOSDTUYi4qTgQArE/d5WkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-728.messagelabs.com!1660545148!136435!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25131 invoked from network); 15 Aug 2022 06:32:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:32:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0877B1AC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:32:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id F17917C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:32:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:32:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] netdata: upgrade 1.35.1 -> 1.36.0
Date: Mon, 15 Aug 2022 14:31:55 +0800
Message-ID: <1660545115-1513-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660545115-1513-1-git-send-email-wangmy@fujitsu.com>
References: <1660545115-1513-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:32:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98248

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../netdata/{netdata_1.35.1.bb => netdata_1.36.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.35.1.bb => netdata_1.36.0.bb} (97%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.35.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.36.0.bb
similarity index 97%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.35.1.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.36.0.bb
index 9decb63ddf..0064702aa9 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.35.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.36.0.bb
@@ -9,7 +9,7 @@ DEPENDS += "libuv util-linux zlib"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "587f6cce421015f8e0a527e3964a4de8cc17085c354498150bc3ade21606bbf9"
+SRC_URI[sha256sum] = "051fce594901b4b77607c97676e91e1645cf37940bccda45ba4bf15e30edc4af"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
-- 
2.25.1


