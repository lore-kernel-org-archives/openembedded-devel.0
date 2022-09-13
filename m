Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FD0C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:17:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.3056.1663064272512345072
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oqqKzKWy;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064270; i=@fujitsu.com;
	bh=pFw1UhhT1NXOWBd+twOM9Ul8OJk06oEvQss1jp6/X+Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oqqKzKWyh8XVTd0niLV+QGSXp+6xGpfdEMQNftDD4VTCLIOU9wARryjkAqHN6viZ1
	 Wa/W8kSk5H0ZOopmBhhKbtcknDHZLgVM4YSFuuEqaxQg5ff+ACvD/AUzsfg3i96+QN
	 M/mW+4npIUB5lOJ7zjnCq/k7MYFSWCLtKM4LrEVkDwdit6SsaTq3H1gAwuqAf+LVyu
	 75DbJtrFHaguQ/inS5hEzofvQbJU4+SAkjZE5LF3ha5LL20gMGHYYC5nbH+UGtiNEb
	 BZgHPiRv59/ODCPY9P8rJ18gqllQzvlNMsHyKXHanUhIEchw0q2cag5t43rvKtqJAC
	 gGg3hU8n1ghzw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8OxWfdchEK
  ywclpEhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8brD8kF0zkqtrS9Z2pg3MHexcjFISTwkFHi
  T8sjNgjnMpPEum0HoTIHGCX6P+1m6mLk5GAT0JV48WMxC4gtIqAvsXT2HmYQW1jAXeLp1UtgN
  ouAqsSvZ1eBbA4OXqD4ngPcIGEJAQWJKQ/fg5XwCghKnJz5BGwMs4CExMEXL8DKJQQUJWZPl4
  cor5BonH6ICcJWk7h6bhPzBEa+WUi6ZyHpXsDItIrROqkoMz2jJDcxM0fX0MBA19DQVNfYAkg
  Z6iVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek6OWllmxiBIZeSrFa/g7Gvyt/6h1ilORg
  UhLljfRSSBbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwRsfApQTLEpNT61Iy8wBxgFMWoKDR0mEl
  ycYKM1bXJCYW5yZDpE6xagoJc470xsoIQCSyCjNg2uDxd4lRlkpYV5GBgYGIZ6C1KLczBJU+V
  eM4hyMSsK8EmFAU3gy80rgpr8CWswEtNjIWh5kcUkiQkqqgSntZ8nC1Z8Ztm398bLMXaZj5uv
  lL0sXf1246F7Mi0SdErfP1jYRi5n3KshnT8jQWmC4SUuQy+GZ9+vDNXevsNYK9t3VLvm6PaxA
  ylW9kUGn6o2qNEfJHwYN+Y8zLr6+pbnT+LSx+4L1pnfjlJZf333HTvjTg8S/zPfv86t9uXTmg
  TJDQOhCo90a92znKb95wrR26mTONqm6Sfq8/Xo/tig9ZNiv8a+13Dox7bjF1qXVTfERiTEN89
  5Zx2gtXnM2/Jv6n03286xfJam0NZ8+PUW5XbDoxa5rT7iPuQg2tU20VjFlWNbQp3Ewqncah/6
  FluNzb4ssKjK0Wp1u3nK2iNHe+6XAP+3oOwe/qHUcva3EUpyRaKjFXFScCABHVQndOAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1663064270!11164!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21072 invoked from network); 13 Sep 2022 10:17:50 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:17:50 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 2082A150
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:50 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 140F77B
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:50 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:17:48 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wolfssl: upgrade 5.4.0 -> 5.5.0
Date: Tue, 13 Sep 2022 18:17:41 +0800
Message-ID: <1663064261-5183-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98773

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../wolfssl/{wolfssl_5.4.0.bb => wolfssl_5.5.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.4.0.bb => wolfssl_5.5.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.4.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.4.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.0.bb
index 6918ece0b0..3aa4f407af 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.4.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.0.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
-SRCREV = "57aac1c50b45275c7a99eca32ad985998b292dc8"
+SRCREV = "44f81f8bc082319cebf0e37df8470aa5748c1355"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


