Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93029C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:34:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.1251.1667810042179456146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:34:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f+vLSmBW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810046; i=@fujitsu.com;
	bh=T2pFd6nfX0jbtDgrBzTJdiDPaExZzM6LHO2gG4jMu04=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=f+vLSmBWcyiAWBGaiLz1pA0xD4+8jG0vrb9wdXOADOmDvKju8ylayOVhz1Fii8/w7
	 HuUnWNy9dseclYYsA64rJyYyJlsRlKlztq32ppJnRee8FIw0uuhrV1hYFM7YggQsRC
	 Wk4/vi0Ix3KzYcxDywmh9yiu9YkaJ4eGqoLHtu67myh0zzfkAcBqdWLy+9Oi1mSmAk
	 rQ4loj/brgvuh1VFkelDi2Y+QQfkkiBNfQBkMDidUTX3AVd3t/JgzeHLk7md9GBCY4
	 hM9CFG8CMFyxacLT8BrT4njSNgPEdpwEl90CxJO9VAHLewVhXeEow2YHx3TwuANEXR
	 bJ1i6kWDXRUoQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORpPvvUEa
  yQc8UVouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPuuWMsBdO5Kp429jE1MK7k7GLk5BASeMgo
  sXZFWRcjF5B9hUli2r57TBDObkaJixv2sYBUsQlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgJnFw3jYmEJsFKP507jVGEJtXwEnidsNNMFtCQEFiysP3YL2cAs4SjVs3s3YxcgAtc5
  JY8C4YolxQ4uTMJywQ4yUkDr54wQzRqigx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK
  +gJFpFaN5cWpRWWqRrqGJXlJRZnpGSW5iZo5eYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVu
  ck6KXl5qySZGYPCmFKfH7GD8veyP3iFGSQ4mJVHe38szkoX4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8N7YCJQTLEpNT61Iy8wBRhJMWoKDR0mEN2wfUJq3uCAxtzgzHSJ1itGYY+O9A3uZOWZ+bT
  vALMSSl5+XKiXOe203UKkASGlGaR7cIFiEX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzMu
  8B2gKT2ZeCdy+V0CnMAGdUl2QBnJKSSJCSqqBKTxcJun23yXz/+xZWn3Xs0a939jEVOvbitxl
  VnHRWy5PCt21tlgnImu73PcmidoLgX9+pT7c0ZojG53Kq5bqW3DRrCd6yaNTK24crPNM9zg85
  Sy/228e+yNP2tWPbJxk+v6Ka1vi5uXC1v3Rr75x7fEPu6GpuTVK8WhmydQm6fWP1ijIPWEv/h
  vOEXhWZXKls8Rx5RabidEHqrZP+Zasesls3jVnHRPu8l8zrvN2uD7V48rW05mTt8I98ozKWib
  hy5ofVFLP7beOvveB4865S/e4zz2TL03oTFc7zROReH/eivbQ4tlf9OVSeJdkxfCufen3Vf3t
  JY7/znka3BodD/4Fa7b6hhm/Yco4KZapxFKckWioxVxUnAgA8JPa+GsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1667810045!155685!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25180 invoked from network); 7 Nov 2022 08:34:06 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:34:06 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 703FC1AF
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:34:05 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6574D1AE
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:34:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:34:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-spidev: upgrade 3.5 -> 3.6
Date: Mon, 7 Nov 2022 16:33:43 +0800
Message-ID: <1667810023-31001-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667810023-31001-1-git-send-email-wangmy@fujitsu.com>
References: <1667810023-31001-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99461

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Added read0 flag to enable reading 0 bytes after transfer to lower CS when cshigh == True

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-spidev_3.5.bb => python3-spidev_3.6.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-spidev_3.5.bb => python3-spidev_3.6.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.5.bb b/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-spidev_3.5.bb
rename to meta-python/recipes-devtools/python/python3-spidev_3.6.bb
index ca5a1eb52..e3fdc435a 100644
--- a/meta-python/recipes-devtools/python/python3-spidev_3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
@@ -10,7 +10,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 SRCNAME = "spidev"
 
-SRC_URI[md5sum] = "7007e4fff2750025e233d8dfe46be670"
-SRC_URI[sha256sum] = "8a7f5c289f161ea2ac4697fa8a10918232c990678dd0053084b3c43b1363910d"
+SRC_URI[sha256sum] = "14dbc37594a4aaef85403ab617985d3c3ef464d62bc9b769ef552db53701115b"
 
 inherit pypi setuptools3
-- 
2.25.1


