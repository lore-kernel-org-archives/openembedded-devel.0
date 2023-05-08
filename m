Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441B6C7EE26
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:03:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.103566.1683540178697970087
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cKHPPUgo;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540176; i=@fujitsu.com;
	bh=KItzsdx664QMCC2zyi+dop5rcw0GP1r1VVNBaL9Oj10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=cKHPPUgoXytiRt2VejKAeaYjY/HwSAumsCJy0iS3rEL1K4ckzgr7FWM1u4D34TnaN
	 XoKMorCyiiTYQt3zVQNXbokov9j3p5a9sl/eSoOketci6qM6xhYgBwo3jbmSv+D//Y
	 +OzyuZm8W+HsLEhX7Q8Pm7AAukvCTPWHAyiZ8JRP/INEWI2jbvolaGmB0op1WOJaYG
	 W0F3Bh95tyELn47J34tAw5mUOWC/DuZclUP4qU/p6RJhYgqJkul2CY/NQFw8/dTU37
	 U8x9oRNxdHGWHt15wLrjHQtS9FMXC08WjArtfqBsCM6IQ7snqrZnxr5fs43Qdt79Aw
	 v+Hm/kEWeeCLA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRWlGSWpSXmKPExsViZ8ORpHvhRES
  KwdbfUhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aWG50sBac5Kpb+3M/YwPiVvYuRi0NIYCOj
  xLWNjYwQzjQmiTsf9zJ1MXJysAlISEzfe5IdxBYR0JX4+GEuI4jNLKAiMWPyEbAaYQEPiXktL
  4BqODhYBFQl1m1PAgnzCjhJPP+yBKxcQkBBYsrD98wgNqeAs8TZGw/A4kJANY9+n2GDqFGTuH
  puE/MERp4FjAyrGM2LU4vKUot0DS31kooy0zNKchMzc/QSq3QT9VJLdfPyi0oydA31EsuL9VK
  Li/WKK3OTc1L08lJLNjECgyKlOO33DsavO//qHWKU5GBSEuU1PRiWIsSXlJ9SmZFYnBFfVJqT
  WnyIUYaDQ0mCt21bRIqQYFFqempFWmYOMEBh0hIcPEoivLJHgNK8xQWJucWZ6RCpU4yKUuK8p
  ceBEgIgiYzSPLg2WFRcYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMWw0yniczrwRu+iugxU
  xAi/0vh4MsLklESEk1MPHbmGYcSr/Td/BYp3eucsDfN9X3Uuuqa6qvzb345UTaqc9Hnj+8Piv
  YdEmbkuPyqzYxLbL3N/a971+39dhJF9Fjm3P/NZq56rR1PrySZXFrnZfv2QkWl1NttgQ5X5O5
  ZP9GRyi9bkNYJcvTXQ/FxaqMf2tXi1lf1z3Ys3bCZ5Xpx7Z/u7v2478lAjxnuW9k8vfNt4jze
  702YtYux0dPpsovk7zd/fb3njfv+N59sHPlOHFX54Li/eQ7XyuXFGen12izf6he4MKsvSrUn/
  WtmKBB/XuGP+33FilLrz9y8ctU4aN7AuqfpH51etvColKgMn/+/w08E+e3aHkujYt60mShUvT
  2ZlDW4vBCdcWCmu1KLMUZiYZazEXFiQD71G17BQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1683540176!496190!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7007 invoked from network); 8 May 2023 10:02:56 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:02:56 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DA81B1D2;
	Mon,  8 May 2023 11:02:55 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0B8691C2;
	Mon,  8 May 2023 11:02:54 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] etcd-cpp-apiv3: upgrade 0.14.2 -> 0.14.3
Date: Mon,  8 May 2023 18:02:40 +0800
Message-Id: <1683540162-25172-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540162-25172-1-git-send-email-wangmy@fujitsu.com>
References: <1683540162-25172-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102387

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../etcd/{etcd-cpp-apiv3_0.14.2.bb => etcd-cpp-apiv3_0.14.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/etcd/{etcd-cpp-apiv3_0.14.2.bb => etcd-cpp-apiv3_0.14.3.bb} (91%)

diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.14.2.bb b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.14.3.bb
similarity index 91%
rename from meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.14.2.bb
rename to meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.14.3.bb
index 2994df322d..71744026da 100644
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.14.2.bb
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.14.3.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eae7da6a2cd1788a5cf8a9f838cf6450"
 
 SRC_URI += "git://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3.git;branch=master;protocol=https"
-SRCREV = "91c64e18d325f4b63f0dfbd795c50c9c3ec3d3e0"
+SRCREV = "5e2884f36276e44f683fa02fca39807716fdbc16"
 
 inherit cmake
 
-- 
2.34.1


