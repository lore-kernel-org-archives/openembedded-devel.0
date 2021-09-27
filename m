Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9090EC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:54:32 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.30533.1632747271121309445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 05:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ETtnchdr;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632747269; i=@fujitsu.com;
	bh=Y3ZRTUnmM89C7kzOYOqBWZEEH3VknKDwa8g1u1jYOSU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ETtnchdrD5bkmjFV1hWi8ypvFNzIrhm+JZx3JiG/e8lFFZXH6qvgkLlfVcSOv3pbK
	 bEdSEp2Wz7VcR2dJmbbBUnlwnRSr7k9hPSZK22b8cMdyAbX0Sd+5R7agNvTcKBR1ll
	 eI1dB+Ev9aSgJupxESUXrG39JObZY55PQrlg84xcI/ppCD/il/2xdgym8FbssNelQb
	 D8aJkWLOennZqO88goBxJ1w0ORs4qQGXV/TlhcYHOnF8A8JbOtDlaVYX0mS/MUmU3I
	 Js+fPULdOCujWD5KP2dVfqDB4vn0vL4ropinNygzle+qoHRd8oKVLp2ZELMjE99SUF
	 xoO+b57FUpFMw==
Received: from [100.113.4.108] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id C5/34-15923-50FB1516;
 Mon, 27 Sep 2021 12:54:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRWlGSWpSXmKPExsViZ8MxRZd5f2C
  iwbk+bYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPLmq+MBWe4K6Y8vMPcwHiIq4uRi0NIYDaT
  xIf5X9khnBOMEt2rv7J2MXJysAmoSUy/dQPMFhHQl1g6ew8ziM0soCLx4ncPO4gtLGAjsf/+J
  BYQm0VAVeL/pLtANgcHr4CTxMPFJiBhCQEFiSkP34O1cgo4S2y8e4QNxBYCKtnWvA7M5hUQlD
  g58wkLxHgJiYMvXjBD9CpKzL7czAJhV0jMmtXGNIGRfxaSlllIWhYwMq1itEwqykzPKMlNzMz
  RNTQw0DU0NNY11zUyNdJLrNJN0kst1U1OzSspSgTK6iWWF+sVV+Ym56To5aWWbGIEBmRKIfuf
  HYzXX3/QO8QoycGkJMobsjYwUYgvKT+lMiOxOCO+qDQntfgQowwHh5IE74w9QDnBotT01Iq0z
  BxgdMCkJTh4lER4nfcCpXmLCxJzizPTIVKnGMM53qxdsoiZ4y2YbLt3F0i2g8mZCw6uZuaYBS
  bvtx8Ckg9ApBBLXn5eqpQ4rwHIOAGQcRmleXDLYNF/iVFWSpiXkYGBQYinILUoN7MEVf4Vozg
  Ho5IwbzbIFJ7MvBK4m14BncsEdG7tpACQc0sSEVJSDUypLnzHNBNvOGry3vJYcuykSxPz/7u/
  rz18q18ZF1uwb1GxK3vVrHXyNmH6IpbnA86s+7z018PKvWrr/y5MZFjDpBWt+Vy3QEB94auDL
  U5pyQdSIlnmzD3HI8Xh/Wy6gtKkV3su8DEaS0WsulbodUtn0dkvCQs+zI/SfOVyZ0/qT5slZi
  +uG+1NZJkbodZcc+tM+uQHUh0N8aWnJ3y22XZg+/lwW+bqFSfuXc5dLCSzSEou3nWq9stoqZp
  D0w18N7UalS17HeTc8f1r7NIXQtc1Wnga66Q77/7zv+o27/BhETOB/H6GM7zlXgYeHta5uj3R
  E4qe2LTO17/xxSjPTL8rd3XfmrWFPsd1Nwlfe6jEUpyRaKjFXFScCAA8uMkJeQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-245.messagelabs.com!1632747267!356269!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31616 invoked from network); 27 Sep 2021 12:54:27 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-22.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 12:54:27 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18RCsRXh008506
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 13:54:27 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 13:54:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] valijson: upgrade 0.5 -> 0.6
Date: Mon, 27 Sep 2021 20:54:15 +0800
Message-ID: <1632747255-70836-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1632747255-70836-1-git-send-email-wangmy@fujitsu.com>
References: <1632747255-70836-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 12:54:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93147

This release includes several new contributions,
such as support for URN document references (thanks to @rayvincent2)
and a new Boost.JSON adapter (thanks @matty0ung).
Loading sub-schemas from other files is also now supported.

This release also includes some minor bug fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../valijson/{valijson_0.5.bb => valijson_0.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/{valijson_0.5.bb => valijson_0.6.bb} (96%)

diff --git a/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.5.bb b/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.6.bb
similarity index 96%
rename from meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.5.bb
rename to meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.6.bb
index 9b6f19f58f..a57aaf08a8 100644
--- a/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.5.bb
+++ b/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.6.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
 
 SRC_URI = "git://github.com/tristanpenman/valijson.git"
-SRCREV = "c5487c39eb900b97535f8b3a38a17af098c784e3"
+SRCREV = "2dfc7499a31b84edef71189f4247919268ebc74e"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


