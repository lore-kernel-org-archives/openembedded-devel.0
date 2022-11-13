Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFE7C43217
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:17:56 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.320.1668309471198723074
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kuK4+xQk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309469; i=@fujitsu.com;
	bh=jEH6JF3RDcP7JLPslelR+oE72vz8bIaI/NyiZbE49LA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kuK4+xQkQfpkIOlKcVA2RrmmDPXemlxL1c1M3rJAWQQcU4a8LZeYOLk6lKbzcoNYG
	 lMigM56JrxdkHLOEwjlFk6ytytlntDnKsXVhgn7PlkAq/sVqwnnNyjcJhf2w6rrmT3
	 4DqKOZ9j23fbNmweqkknUnqCHQoKaioYjhbC5Zz90xmKhyflXietLagHzemroD2Mv3
	 6MgG0IKZlyOHg0g8duPLIUGPH907ktLdRQ14bK+nOEmU2P05fHnlsjmmPeoEcfmSsO
	 nmbmCSEimfhryYIZuXAQ4X9YDprZ/s7Zfl1eCwVVaql7kNITMVYdIWYFn/qfRG9Z1u
	 ABko7GLHi3zhA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpHs7sSD
  Z4Ot9K4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPH/Fbmgr8cFec33GZsYFzM0cXIxSEk8JBR
  YsW/DiYI5wqTxIXfz1m6GDmBnD2MEoeXyYPYbAJSEjfu/2cDsUUE9CWWzt7DDGIzC6hIvPjdw
  w5iCwv4SBw8cZuxi5Gdg0VAVeJ4JEiUV8BJ4svjPrBOCQEFiSkP34N1cgo4S7w5MoUVYpOTRP
  +Lf8wQ9YISJ2c+YYGYLiFx8MULZoheRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGM2LU4vKUot0DU30kooy0zNKchMzc/QSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OT
  c1L08lJLNjECQzelOD1mB+PvZX/0DjFKcjApifKmXc9PFuJLyk+pzEgszogvKs1JLT7EKMPBo
  STB+zuyIFlIsCg1PbUiLTMHGEcwaQkOHiUR3go7oDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8v
  NSpcR5ZycAFQmAFGWU5sGNgMX0JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGujgabwZOa
  VwG16BXQEE9AR3yPzQI4oSURISTUw+TlvdrCP5gph/DxlZYRce8lWxmfu+bmdEgv6P//Vd9f7
  UPvweorLBS3uDqfzR1S/r9CIe7d434rOyDP/X9rfNcv/IbY1Y/Pf2U68XqkTTx2ZwC92LyPPb
  2rXtsQpHnWNOzZEOl4tepR+WdOI2Ur55bdLz4pbrjq9Vf93xkszxezDJw2ReyzvrC3nr7FTWR
  LEW/Zg1YEKDaf6AwyNXuyZ3bxH23f0HzRTWdRTcK3ZrjL4zV6H7X+e58QnT2BXfPq4LZI7qFT
  hN4P2hfu/mMSWmh11i078JH/6KdeF9Ef/9lpPnvKY67eak17XX/6mj96J8snPjj+X2STRtNch
  7LvPZOdwmRN3ll+9fFDl1W5BJZbijERDLeai4kQAjNkXPGQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1668309467!684083!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20085 invoked from network); 13 Nov 2022 03:17:47 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:17:47 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 730B31B2
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:17:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 67F5E1B1
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:17:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:17:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-hash: upgrade 0.5.0 -> 0.5.1
Date: Sun, 13 Nov 2022 11:17:25 +0800
Message-ID: <1668309448-15438-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668309448-15438-1-git-send-email-wangmy@fujitsu.com>
References: <1668309448-15438-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99573

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-hash_0.5.0.bb => python3-eth-hash_0.5.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-hash_0.5.0.bb => python3-eth-hash_0.5.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.5.0.bb b/meta-python/recipes-devtools/python/python3-eth-hash_0.5.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-eth-hash_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-hash_0.5.1.bb
index 73072706e..10d6695de 100644
--- a/meta-python/recipes-devtools/python/python3-eth-hash_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.5.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
 
-SRC_URI[sha256sum] = "ea0fd4e264c97c8aa739ae1cea7199db2e1f3bdf387cc9b81ef03c660f871335"
+SRC_URI[sha256sum] = "9805075f653e114a31a99678e93b257fb4082337696f4eff7b4371fe65158409"
 
 inherit pypi setuptools3
 
-- 
2.25.1


