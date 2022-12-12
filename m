Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5EDC2D0CB
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:37:58 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.37634.1670830675786025501
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DkLBi0ya;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830674; i=@fujitsu.com;
	bh=33QPk1iILFiuVG8S57kn/sWAVD0lMf8DK+Cq6O6jLRQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DkLBi0yaNNV6EuPeNAx2lgob117RZq/3jiH8MehOJzReN+6Wl75RinlVWMvE85emu
	 nZwT2AEjJ3zHBRMxGWFKmrgiBz4g79BGP4XW0PvXQqvBZWKmwYK2vwJBrOxzNqzH3U
	 mtYWwH/v0ydypcG62nWS6g+tkm6YOaVk11V3Bh7F0aIub+5g8xAQe8Siil1qTixdPf
	 JdaHstbbpZpf/io32m+WwZa+pLDlqEJzp/iORsgmln6zL94PyeKN6pKtazAPAbosDe
	 63ZL+Crxcoep1HbJGeo4UqCFuysnLHoYvFweAGKZt4m71ZoANzjiSC89j+bqJ4pe4Q
	 H4Q/YbOofysiA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORpBt4a1q
  ywccN6hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aHd7fYCmZwV8y/P4utgXELVxcjF4eQwENG
  iUt/djFDOFeYJBqnnGWFcPYwSjybM5Gxi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGGBeIlFc6+C1bAIqErcXzcPrJdXwFHi6OWdYDUSAgoSUx6+B+vlFHCSWNq9HqxGCKjmVd
  c5Voh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMZsWpRWWpRbqGJnpJRZnpGSW5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgeGbUsy2agfjr2V/9A4xSnIwKYnyVl6ZlizEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  nfDNaCcYFFqempFWmYOMJZg0hIcPEoivG4grbzFBYm5xZnpEKlTjJYcU2f/28/MsRxMzvzado
  BZiCUvPy9VSpyX/QZQgwBIQ0ZpHtw4WLxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMa3M
  daApPZl4J3NZXQAcxAR0U9XIqyEEliQgpqQamgJczZ50TWnS9XuXOGUmnn/dePtkx+5+tSmG5
  yxzXpE+blZZ35qlU+t/vPdpYPjHhU4T3Pl8r9p+iTYLubpVq/oGt39rLnGwXut/9+l4se+Vyt
  Z1aBl9SxOInfWsr0u/rXbXq0WYpj4yLUif0bqh3HIgtszzhtUZ3ccV8pT38gZWfLnB9n8Jwuf
  Vm/MNdd4tfFPtIS3nUp1xXy445E57TMO3WlJB5Hfx2Jp3fzdZvd3v/9bVJzrmGOYJCnJsfGa2
  VaTedkK528NuhnC69Sb9CjTuzJotf9ptz7APLVqGEs9ceyYU9s0x70vSmNSM98ufx1RtfZ3ze
  mxbRY7bDXPOMZpO+f3B0lsHWfWxTFk1QYinOSDTUYi4qTgQACat4pnIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-585.messagelabs.com!1670830673!316696!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26149 invoked from network); 12 Dec 2022 07:37:53 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:37:53 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 42B9D1AE
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 37E031AD
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:53 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:37:51 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [[PATCH] python3-google-api-python-client: upgrade 2.68.0 -> 2.69.0
Date: Mon, 12 Dec 2022 15:37:15 +0800
Message-ID: <1670830635-3098-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830635-3098-1-git-send-email-wangmy@fujitsu.com>
References: <1670830635-3098-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100049

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fix media upload URI when API endpoint is overridden with client_opions.api_endpoint

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.68.0.bb => python3-google-api-python-client_2.69.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.68.0.bb => python3-google-api-python-client_2.69.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.68.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.69.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.68.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.69.0.bb
index e6ca3ba98..b66709045 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.68.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.69.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "19177411b7dcf8fcd66bff085c6838ecea5fd6b598998d594be1f7290dfc34b4"
+SRC_URI[sha256sum] = "03624a28b5ba94f3c3d44761081f5dbf8cabaa20c5c3a96c046457c5713efb9b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


