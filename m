Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A24C54F3F
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.2698.1649137341172703366
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OHuN4TL7;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137339; i=@fujitsu.com;
	bh=KbSGIlVc2KcEij3C3mci0eVEEkAdoCaS6rVXRni7WXA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OHuN4TL7AS/IKd/1cmb4ekfJWSJ8V1g8JffcliGtZBcHZC0gliuaWsZw3KaduZEoM
	 S0cGtac7UK0Tj/ZVLmonIR8aunWtHT10eaIXctO4lz/5UXsV22ttlNbMxt5g5YanJv
	 CfPBYhnhARlI4V51LKcebpauGYl+ls/c9BOjjFaTfqQb6zVDRT6uAh8WNAu4Itm30n
	 wxy0We/eWI5/70z3YxBkFTrI6xt/t8u6Y1+zIJMcxWVf9CHv0dbfvZ63cxoC/Ul+na
	 cUSouYy81q0vl7vGeTeCmAaz67JLrgBtBmTrxllNROZMa7Jaf5BZVfdUwKhhoaALxm
	 MLZNx1ZXfzvDw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqLvrmne
  SwdFJOhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0b3usssBcc5KxouvmdsYPzK0cXIySEk8IRR
  omm5TxcjF5B9gUniyeWjjBDObkaJzxObWUCq2ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7h
  x3EFhYIkdj5/hxYPQtQfO6W/0wgNq+Ak8TpU8fAeiUEFCSmPHwP1ssp4Czx+uAzVogrnCQe/+
  hgg6gXlDg58wkLxHwJiYMvXjBD9CpKzL4McY+EQIXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMVklFmekZJbmJmTm6hgYGuoaGprqmukZGpnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIFBnFLM+nAH4+K+n3qHGCU5mJREec+4eicJ8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuA9eRYoJ1iUmp5akZaZA4womLQEB4+SCO+Ri0Bp3uKCxNzizHSI1ClGRSlx3ptXgBICII
  mM0jy4NlgUX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzGt1FWgKT2ZeCdz0V0CLmYAWvzv
  jCbK4JBEhJdXAFHPQY/2suaKrTNT33Weo2rnzWPqNuSsLjQ7MD1hbKlt5+/EerzIV9guajImS
  Kr9lEifduZHLmhcsq9aoLh7AYNCUe010/4PJa1tdJyqG2uzg6JuxZnNGU/iV/kN2a95NqgwLm
  H/lWGXpvjViM2e2/mWQFdlWsCdS3+hDVISErG6hpfbNSZaB/6NPNk7xP1397ueGSRwrw3nONS
  9783zvLZd1m/8dLlzfsqc14ibTsoSvGj91JpTmLxWIe2nBqGZy3mPec9NJ08K0eh7M22uWsU/
  ivNsmFxW7qr7Nl7pXNXYf2m2aP+mq6ZMJs6/0zOFhtV08kc8mYgH/iw3JSacO9xYo3uENPv2g
  4kbEYuF7GkosxRmJhlrMRcWJAMQ0cXpdAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-34.tower-591.messagelabs.com!1649137338!527851!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7076 invoked from network); 5 Apr 2022 05:42:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-34.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:42:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1C14B1001A5
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:42:18 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DB1EC1001AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:42:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:42:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websocket-client: upgrade 1.3.1 ->
 1.3.2
Date: Sat, 2 Apr 2022 20:38:33 +0800
Message-ID: <1648903115-19946-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648903115-19946-1-git-send-email-wangmy@fujitsu.com>
References: <1648903115-19946-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96416

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...socket-client_1.3.1.bb => python3-websocket-client_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.3.1.bb => python3-websocket-client_1.3.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.3.1.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.3.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.3.2.bb
index 166dd0355c..3f09d267de 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.3.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b969e9612325987c823fc0737063ebc8"
 
-SRC_URI[sha256sum] = "6278a75065395418283f887de7c3beafb3aa68dada5cacbe4b214e8d26da499b"
+SRC_URI[sha256sum] = "50b21db0058f7a953d67cc0445be4b948d7fc196ecbeb8083d68d94628e4abf6"
 
 inherit pypi setuptools3
 
-- 
2.25.1


