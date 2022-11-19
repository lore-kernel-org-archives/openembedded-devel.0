Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBE8C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:39:45 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.15930.1668843580236254478
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ebk92DWR;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843578; i=@fujitsu.com;
	bh=yj7+kJCcQlfN7e+c7C8SLnorrJwYxsqUY2TI6VxvSxs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ebk92DWRb79VX5hPijBfopQVJJgl2fiXwPigWe8Woo19Z7R8rvgHLj8DD1sXarRcy
	 rwqdFS1uIk7iZiTJKKDd66xBxD0ac9UJHuVqqj9JWETMbOXgKz/MUQahqX0CgX53zs
	 Ruqdjps/7LIQZQG/WjG7KwIYkcYoRXR7FxG2PeVs8uZIhiK8W86j/rdnEtpEKMf0P2
	 bXzofkBuswuLi38KBdFSrJWmlt71FlQurB43Wm9NlhTEbKT6Wc+0Y/T8AbRJfafGyx
	 sDJfuBaPWA2p87SHIWGjElDUL2OWjOHp8bspqfC0kRxweoQsLDPjMchblJAPlqLv8J
	 jyBdl3fO/wJiw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORpGvZUZF
  s8GKOlMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvF47TXGggUcFW2H9rI3MJ5k72Lk4hASeMgo
  0fBwOiOEc4VJovvYbajMHkaJ9Ru/snYxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLGAhsf3vTjCbRUBV4trDDWD1vAKOEqenNoLVSwgoSEx5+B7M5hRwkng+6xWYLQRUs/jhIU
  aIekGJkzOfsEDMl5A4+OIFVK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJGplW
  M5sWpRWWpRbqGZnpJRZnpGSW5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5KXp5
  qSWbGIEBnFKcyryD8fKyP3qHGCU5mJREefe2lycL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCNa
  6tIFhIsSk1PrUjLzAFGE0xagoNHSYRXxAcozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcd
  4kkBkCIEUZpXlwI2CRfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO90kCk8mXklcJteAR3
  BBHREjnMZyBEliQgpqQamCMUcKdkkie2Vd3Zlqk//VKQ3aTqnY/y/zXXvDxmHvBIu/iN21X9h
  uIRlyJcFl8I//pdVOtFqpnhR0HPOFe6/uz4JZzfyeT692LLJ79V9ncDdHOKfnk9ZUOJ09OCDt
  1+Pnk2MaWhdzau4IyrpdPzV5UZHLHoKkzfs68t6KXlzk/HS/ntaDowrhdfNOHh+G8Ouu6JfOl
  V4TipaVce8Yk+8NC0rOjmh5tyZrjNP7lt9k95498mF037VXVmhx3+0r93Zpt00rzNE7uOBq/2
  nDr3Wd5e7cJDv16TH51IvqIStUpfY7bZ9/qUE0ewfjt/27Sx98DjOdVewQPRT3W9PH09ewGSw
  xTnPjTVt54aL77eaGCuxFGckGmoxFxUnAgBw8PzuZwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-745.messagelabs.com!1668843577!59580!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19750 invoked from network); 19 Nov 2022 07:39:37 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:39:37 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E2A35658
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:39:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D7A3B630
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:39:36 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:39:35 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nano: upgrade 6.4 -> 7.0
Date: Sat, 19 Nov 2022 15:38:06 +0800
Message-ID: <1668843486-2933-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668843486-2933-1-git-send-email-wangmy@fujitsu.com>
References: <1668843486-2933-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99630

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_6.4.bb => nano_7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_6.4.bb => nano_7.0.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_6.4.bb b/meta-oe/recipes-support/nano/nano_7.0.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_6.4.bb
rename to meta-oe/recipes-support/nano/nano_7.0.bb
index d49936230..fe3ed2d34 100644
--- a/meta-oe/recipes-support/nano/nano_6.4.bb
+++ b/meta-oe/recipes-support/nano/nano_7.0.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4199ae8ca78a7796de56de1a41b821dc47912c0307e9816b56cc317df34661c0"
+SRC_URI[sha256sum] = "8dd6eac38b2b8786d82681f0e1afd84f6b75210d17391b6443c437e451552149"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1


