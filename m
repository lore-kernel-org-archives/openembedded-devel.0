Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1D9C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 05:13:12 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web09.5734.1634620390344932474
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 22:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oHpRJd3o;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634620388; i=@fujitsu.com;
	bh=uTucaq5bNA82XSfTL8CRcyB83KU4cTAOYUnf9CiJ454=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oHpRJd3oXFKYAHR/d7DohKkPdunpCoEfsXmxYGxIrCNzDpQCqWCN1ubNXOJkkdzbK
	 wrSk09SJRtm+BtGS/U2fnSylErprtPvtAQ8EyNI82GJkTEGnJ3PQRHdfw2vSbciVdS
	 M6UqeK5h4o/KhIuyMuvlAX3SJQ4mnCDRKQRpXCg0Q6rq49Z6KZ2D61LrV1BTVL6BQr
	 9fQfDnkQARxENm7FIGNfPmwEv7V1691BFSX5YPgb3DbU2bVdQx/kPGE/fhR//ru8f8
	 pZyA698BMrf+kMPCwN/6WBBDtT8oMtd2/RdbRkXkyZ39DYFpGYNI6ePWaluChMbopT
	 xbIIW4oSbhKhA==
Received: from [100.112.195.149] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 4B/1B-17143-4E35E616;
 Tue, 19 Oct 2021 05:13:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MxRfdxcF6
  iwc7nOhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bOK5wFnZwV+/8vZ2xg/M3excjFISQwm0ni
  /pwPjBDOHkaJzu7jbF2MnBxsAroS5x6vZQexRQT0JZbO3sMMYgsL2ElMeL0WrIZFQFVi2sULY
  HFeAXeJoxM3gNkSAgoSUx6+h4oLSpyc+YQFxGYWkJA4+OIFUJwDqEZRYvZ0eYjyConXhy8xT2
  DkmYWkYxaSjgWMTKsYLZKKMtMzSnITM3N0DQ0MdA0NjXQNLU11jQxN9RKrdBP1Ukt1y1OLS3Q
  N9RLLi/WKK3OTc1L08lJLNjECgyil4PD1HYy3Xn/QO8QoycGkJMp70TUvUYgvKT+lMiOxOCO+
  qDQntfgQowwHh5IEb2wAUE6wKDU9tSItMwcY0DBpCQ4eJRHe//5Aad7igsTc4sx0iNQpxnCON
  2uXLGLmeAsm2+7dBZLtYHLmgoOrmTlmgcn77YeA5AMQKcSSl5+XKiXOKxIENE4AZFxGaR7cMl
  jEXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzJsDMoUnM68E7qZXQOcyAZ171TkH5NySRIS
  UVANTzz3BiYKCG8y2pLBOOX/+xJLusH0J2jpFWZIue9mlJ0mvE0v8rzlrr/yMRXnKvW38K8Qe
  bbhdoloecLClbeF+063LNfz7bK5KtfwITlOvNzZ2SX2Yp8VntyVH8v6NLj8VC8mrN7/LRtQuW
  rbt/qSuhluWu8Re3H056ZCdL4Or001lpjVcp6c4rdF6HKnjob5x3e9cw8WPpxSdFw8tkOR5zv
  DzOz//ia3T9n/r9O/naK46O7liwtJbUzpvHBfeOPF2dhH/caZu9tgb0Q+EFnQ/WFeYMNXaY3N
  Lk6p5uph8V7Sbn5RLepuXfPucnivCQfM0g9lnqX9s/W0osONotvvrb4emaypUfbqpszz780kl
  luKMREMt5qLiRABpCaA/UwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-265.messagelabs.com!1634620387!376246!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31595 invoked from network); 19 Oct 2021 05:13:07 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-17.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Oct 2021 05:13:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19J5D2bX007714
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 06:13:07 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 19 Oct 2021 06:13:00 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.2.9 -> 2.3.1
Date: Tue, 19 Oct 2021 22:12:50 +0800
Message-ID: <1634652770-3505-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 05:13:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93457

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../gensio/{gensio_2.2.9.bb => gensio_2.3.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.2.9.bb => gensio_2.3.1.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.2.9.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.3.1.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.2.9.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.3.1.bb
index fb83361856..0410b15fda 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.2.9.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.3.1.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "343ccf17ce656203b6b5513f4b7962f45d37b589"
+SRCREV = "c500d8705c517f96e591c060105a789f053d2b7a"
 
-SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=2.2.x"
+SRC_URI = "git://github.com/cminyard/gensio;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


