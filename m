Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D06C32774
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:40:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.29051.1661244006593145476
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 01:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Yb75YOPj;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661244004; i=@fujitsu.com;
	bh=Zv6JKZSSUMiYQNAIzlcZDBAZcAAJD8X9ocdx13vTrhc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Yb75YOPjz+6DMIoWrEsTXgEJueB5QgGDMLTlb/lz6iggR33oNP8Ae+9IPT6UbQgng
	 kkq8klrMWzs2/iV0P+xQa2lrfr7V4tTfKF7yXF7E/ExEi4YBCgfvW2Mn6hTwt1QJyw
	 iicuLAIBsAG4TnSk42ymUj7ShHZpxz7IxbmLb7ir4S4lmu0qEo/KMAcZRUAYyWpBKx
	 guEFZFHdgTnzFIDk0Ki7UevlHOiIntpxHjCH+q2le/mv36aJho+QA2IS+1FvcFkURk
	 QhzOZ/xRKi0+G2Imoq8zi6kDqx397qQ3mxrfC+bKU1HtIdcJoduFrqJGgBdOJuagpH
	 dMjdm/FTh5OfA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSTdlEku
  ywbZWNYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePvv0/MBW2cFQ/3fmZrYFzM0cXIxSEk8IRR
  Yu+OFcwQzg0mifvPXrB2MXICOXsZJY5vFQKx2QTUJKbfugEWFxHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAtcetfFxOIzSKgKtHcswnM5hVwlHi++yVYvYSAgsSUh+/BbE4BJ4lv19qZIXY5Suz/so
  ENol5Q4uTMJywQ8yUkDr54AdWrKDH7cjMLhF0psWdWPxOErSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo3VSUWZ6RkluYmaOrqGBga6hoamusZGuoZGZXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVu
  ck6KXl5qySZGYBinFCvU7WC8tvKn3iFGSQ4mJVFeh3qWZCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvB79QDnBotT01Iq0zBxgTMGkJTh4lER49ScApXmLCxJzizPTIVKnGBWlxHn1QBICIImM0j
  y4NlgcX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsQZDtPZl4J3PRXQIuZgBYH7WYGWVy
  SiJCSamDq3Kgy/WAcI8/pI3z7cp9s9erRbytb9v6/xgtnoVK1CMa2j1HNay9z2+e5HkrP/ixx
  xstI3OVKUtSbSXwnQkp7frEzn+nLt040sDwge900VGFnrPaVCFUbZvF9nyY8UpFYPLf/1ou5W
  3+tlV74pXZF3uKfc91Equ4xqRtwOm9cuMezzqbRXDC/zYJjbwzbv19d018dYf8o9yvgYsG/kh
  KW0t7Xmmvi9qXd+fVteZ/oLf+15bKLzmqy1pZ/bE9SK5k+d9olrvNW/CcPrdLTmr02zSHSZsM
  O0ZOcjmWn3k4WmWKUFSF2/ZjWnxnZoXyX2I/svdQZVPju6lRFpwtzN8T6CV4KC3cS3LzeOHZ9
  zC0lluKMREMt5qLiRACJ63N9XgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-571.messagelabs.com!1661244004!385445!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19383 invoked from network); 23 Aug 2022 08:40:04 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Aug 2022 08:40:04 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4D8F61000F5
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:40:04 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4138A1000CE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:40:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 23 Aug 2022 09:40:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] mosquitto: upgrade 2.0.14 -> 2.0.15
Date: Tue, 23 Aug 2022 16:39:38 +0800
Message-ID: <1661243978-4657-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661243978-4657-1-git-send-email-wangmy@fujitsu.com>
References: <1661243978-4657-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 08:40:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98384

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mosquitto/{mosquitto_2.0.14.bb => mosquitto_2.0.15.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.14.bb => mosquitto_2.0.15.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.14.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.14.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
index 739b7de625..d06dd2d9ca 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.14.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://1571.patch \
 "
 
-SRC_URI[sha256sum] = "d0dde8fdb12caf6e2426b4f28081919a2fce3448773bdb8af0d3cd5fe5776925"
+SRC_URI[sha256sum] = "4735b1d32e3f91c7a8896741d88a3022e89730a1ee897946decfa0df27039ac6"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
-- 
2.25.1


