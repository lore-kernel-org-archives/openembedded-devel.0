Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD9AC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:31:50 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.1137.1667809907814321057
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uAJcZ9py;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809906; i=@fujitsu.com;
	bh=Te2w/LVt3g36hv5LaKYMZIVp8hBFFv/waWcc+TKAIDc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uAJcZ9pyw/LmEc8J3Zucu3iRca6hn7WDaIl9NNDfuCRy5XA8cjy6/t2VryQ87HJET
	 EBgCwZORiNnrcbPYArL6kJo1r3jU6Zsz6q0k63Lv6pfxxVEdI9SCgApE7erPePW79r
	 zR23BSZEA8UL+UIvoMsspICzx/MfLqHPCe8eGUY5RfITqh+WjGXM+VtajMKKAkebgE
	 BwE/R0R4Sxom3fo8f3TvbcnZ/EqlmGQiBGHfMx/ZPoAcr+a5+GICGCCGemOXouVurs
	 gH4V5pzsaxjonFdeZpQThO9oBPAHPz61JeesOywa0N9msLsRQyfOQ69BUOMpU8C4xr
	 7KVx5EWVo7OrQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpFt4KCP
  ZYMlzE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePq3qOMBW2cFRtWtbA3MP5n72Lk4hASeMgo
  sXTff2YI5wqTxMVz/UAZTiBnN6PE4X3hIDabgJTEjfv/2UBsEQF9iaWz9zCD2MwCKhIvfveA1
  QsL2En82NPEBGKzAMU3rV4BVsMr4CTx+d9FsLiEgILElIfvoeKCEidnPmGBmCMhcfDFC2aIGk
  WJ2ZebWSDsColZs9qgetUkrp7bxDyBkX8WkvZZSNoXMDKtYjQtTi0qSy3SNdVLKspMzyjJTcz
  M0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzFlGLGsh2M3cv+6B1ilORg
  UhLl/b08I1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO+NjUA5waLU9NSKtMwcYFzApCU4eJREe
  MP2AaV5iwsSc4sz0yFSpxgtOT4curKXmePqFRA582vbAWYhlrz8vFQpcd5ru4EaBEAaMkrz4M
  bBYvcSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFe5j1AU3gy80rgtr4COogJ6KDqgjSQg0o
  SEVJSDUzqKyz4rth8k+sL/h/WvX1X2tObq97Jrmu6/u7w9xdeGw4c2y/6KjOs5ZAE68NJ++VP
  qS34KjKv46fFoVkM3xuLNn/muPOk2U5UMXDF6nJlpYQD/da7OY+FJcsv3SR6sOvD6RVFix5fY
  Xon9vFxPs9aN54wT+V5uv92O9zREo+q277Cz+HOtnXr0m0VW/ql1a8bmrmW6x878s/qhueBCz
  maehrOpZ+1ozkvvY9tLj4snPZG3XhZgNOX00bJ9X+mzOh4uj7h64lut1jb3aXmT9sPXKowWfg
  4Rb7ka/OnjTHmxZPr63fef1D0655zgM9X84NMNU2P9fS2yiQURZm1rvorbah+3zR1j3Jofo+/
  1g0lluKMREMt5qLiRABNDczUWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1667809905!321367!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23620 invoked from network); 7 Nov 2022 08:31:45 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:31:45 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 5DAAC1B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:31:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 5C8DF1AE
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:31:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:31:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poco: upgrade 1.12.3 -> 1.12.4
Date: Mon, 7 Nov 2022 16:31:27 +0800
Message-ID: <1667809891-30889-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99452

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- GH #3849: Upgrade bundled libexpat to 2.5.0 [fixes CVE]
- GH #3852: SocketReactor - 100 % CPU usage on single-core system

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/poco/{poco_1.12.3.bb => poco_1.12.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poco/{poco_1.12.3.bb => poco_1.12.4.bb} (98%)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.3.bb b/meta-oe/recipes-support/poco/poco_1.12.4.bb
similarity index 98%
rename from meta-oe/recipes-support/poco/poco_1.12.3.bb
rename to meta-oe/recipes-support/poco/poco_1.12.4.bb
index 32c57ce97..fc8e4dece 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.4.bb
@@ -11,7 +11,7 @@ DEPENDS = "libpcre2 zlib"
 SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
            file://run-ptest \
            "
-SRCREV = "f1aefe34a46891b09230422bbc37465bc6d0a0d1"
+SRCREV = "1211613642269b7d53bea58b02de7fcd25ece3b9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


