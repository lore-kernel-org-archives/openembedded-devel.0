Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADCACCA48B
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:33:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.2583.1658806388350472902
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ck5Xf8L7;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806390; i=@fujitsu.com;
	bh=mwkLJ1eqculdprkd8qYWe+iis6NOl1K/vyz20p6Yra8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ck5Xf8L7SxPNfcBqp0tU6nP52RaJ4sEYZv1Ah+1spEx56HvDq5jfLF8Q0aDz3s6y7
	 iqB0oPxhFmiMQOVYNWBcqfHQf1bPKVXMTbx131jg9i2c5nZrtDOOMWE/MRfOzc+wD1
	 OOrPLPlSVF+zQhqeN1PfXpgbh4OfQGFfQcS1Zy9UvU7GuJxo1Y0yq5IZqFEvUXOxTL
	 4qoTDLV3iKjVcIFqyFtubTDKvrvxfCTTUSukHZPL5RBZAZHt1Dt3qh1Nv+VizRygl1
	 L5erVWVPnbT51+Bcyusz9rOTuFyhy7EdC8E6ulnJqvEbvl2tYAYuS8OftMyTqcsDW4
	 hQFO1ClvqPvhw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8OxWbc04X6
  SwcJXJhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aJj4eYCg5zVMx4eZupgfEpexcjF4eQwENG
  iScLPgM5nEDOFSaJ6/ODIRJ7GCXuHp8BlmATUJOYfusGK4gtIqAvsXT2HmYQm1lAReLF7x6wG
  mEBe4kdX04ygtgsAqoSxx99BbN5BRwlpvztAbMlBBQkpjx8D9bLKeAk8fH4ZzaIxY4S8x+2MU
  HUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCskZszYxgZhq0lcPbeJeQKj4Cwk7bOQtC9gZFr
  FaJVUlJmeUZKbmJmja2hgoGtoaKprbKlrYaSXWKWbqJdaqlueWlyiC+SWF+ulFhfrFVfmJuek
  6OWllmxiBAZxSrF60A7Gbyt+6h1ilORgUhLl3dJ5L0mILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  O/ruPtJQoJFqempFWmZOcCIgklLcPAoifCWxgCleYsLEnOLM9MhUqcYdTlmfm07wCzEkpefly
  olzrsCZIYASFFGaR7cCFh0X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzJsaDzSFJzOvBG7
  TK6AjmICO+KR9B+SIkkSElFQD01VmTndDa49vlwLOnl2QyOt++5+wmn2545fM8vPL3ohuWmZ3
  fN15g0mPZr4tu/kuhiEx5NjnsJL/OS12ud+ZqsWOddzYe6Q0tkDk6VL2TzfYT19J3Sk53/zTi
  YdbDfvc+SYm8DmteX4lPqJz+rfHnFLX7iq/WuN/sn/hg/T6uKC7Xe8CE8veH9/6end3qki8gi
  dnl9vdaUrL31l+uTjZbaZ8eVw+X11CFOO2Own6b7hsVq5SKzF/d+q7XtuFT8LvoqrMzrl5S6z
  Nm7LOalOQl9JmkbVv9Yv3bBE0YZl0W3LPTBvWhbyrWbYq25/KLzW6foSlNN707wvHd6Wiequ4
  jubsF8vMW8/VOu28g5u+qhJLcUaioRZzUXEiACVPImFpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-571.messagelabs.com!1658806389!119303!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23856 invoked from network); 26 Jul 2022 03:33:09 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:33:09 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 928F8154
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:33:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 86268153
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:33:09 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:33:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.3.6 -> 4.3.7
Date: Sat, 23 Jul 2022 13:38:21 +0800
Message-ID: <1658554703-9317-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658554703-9317-1-git-send-email-wangmy@fujitsu.com>
References: <1658554703-9317-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97980

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.3.6.bb => ser2net_4.3.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.6.bb => ser2net_4.3.7.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.6.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.7.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.3.6.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.3.7.bb
index 21fbdb6844..13ce13a0b9 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.6.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.7.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "65515c7e9a5289167ae64c4032450904449a87ce20653241022af4f5db2e9510"
+SRC_URI[sha256sum] = "542915e240ae8b5c7dcec8d1589e6067818532900d45cfef226cea9f0e671d13"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.25.1


