Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6717C4332F
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:15:58 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.101881.1670066154694908172
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cdNKzK4U;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066152; i=@fujitsu.com;
	bh=XU6E4mt/kAOPRScQ/d2y8zBWi6r/Tg7ShwyfGLQ7Qak=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cdNKzK4UQyOzzQ8WKc50gko69oYkFmFqtMPGfb0a9DGm9RYn+5CPBNhJRTewFKA++
	 nDB0Zj/Xnmz04ZstUFYhrJ3d/bScFrIo/h+PqA1rjz9p4ZT95VgbztWIkmCLgJNkVE
	 gSBUzM3OGMpQ+vdMbk3/s3mYwfUiIQySF57j7E38JwjSJiCTmodBHqt79P22KABjLX
	 HmohkHF7WCz/ZW/cLbz+p84C5jhKMhyPkkpRL+Bx8Q3Ie2QiUWwGM4HFP/dRFUlgYJ
	 d0s+aMPm7jLZDT3o3rZHV3dFbOC8TlJ8yUPD1zROeZ3CR7hV+FkoZKIqna5QkKIDya
	 wwZDtFGVF04tw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqPtcvzv
  ZYP0FS4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPvtWnsBTs4K36/2sPSwPiQo4uRi0NI4Amj
  xN5Za9ggnOtMEld+X2XvYuQEcnYzSrRdDwSx2QSkJG7c/88GYosI6Essnb2HGcRmFlCRePG7B
  6xeWCBAYumuuWA1LEDxaeuuMILYvAJOEuf2doPZEgIKElMevgfr5RRwlvg+ZTYbxC4niS3Pvz
  JD1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQrTi0qSy3SNTTWSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3pRihq07GDuW/9E7xCjJwaQkynssrCtZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvt
  HZ3spBgUWp6akVaZg4wkmDSEhw8SiK8XapAad7igsTc4sx0iNQpRl2OmV/bDjALseTl56VKif
  PK6QEVCYAUZZTmwY2ARfUlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8YiBTeDLzSuA2vQI
  6ggnoiI38XSBHlCQipKQamFZ3rnBwW5z1fltb0M2uo7v0PvoqvV5bIC8ZMUfu+gerVS4av5Sn
  chc3fGvqXfb4aWBqdgdzU3NpZFtDs0xfZGBIoXVtdp34kbNbVZNq/pzdoa3Wvsxkzzq+LuE0/
  nDpE7uOT7pn5Pucv9w/pCJzs4D5nAq7dFOuE69uGgv93/HNJL+aM67xLO+L8DwbnQdv1ooGa/
  w2Sflzs+h2+cGQoLiQOruNy6sr/Vx9ZJZvPh94jU2ut+j39WOVTAJJBjYZ/O0NExXvVMbkPCw
  Q3uyRdHPO/GuurS/POOhODb479YeNqP7BpWv/V6+U7ORXuT3zivmklI7Hi/7PerbNRer32cJ4
  ibxNn/sqlmU66TEqsRRnJBpqMRcVJwIARYM132UDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-587.messagelabs.com!1670066151!249537!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4670 invoked from network); 3 Dec 2022 11:15:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:15:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8FEA810018D
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:15:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 842D6100182
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:15:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:15:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-asyncinotify: upgrade 2.0.8 -> 3.0.1
Date: Sat, 3 Dec 2022 19:15:11 +0800
Message-ID: <1670066113-24646-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066113-24646-1-git-send-email-wangmy@fujitsu.com>
References: <1670066113-24646-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99923

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-asyncinotify_2.0.8.bb => python3-asyncinotify_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_2.0.8.bb => python3-asyncinotify_3.0.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.8.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_2.0.8.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb
index a34f947c5..2f4adcea7 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_3.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec941a1cd6616454970d03cb9c9e8f8"
 
-SRC_URI[sha256sum] = "3a621eff75d37402d27648ec06874cd7fdf62128dc5c4f458f5bb88a32d87763"
+SRC_URI[sha256sum] = "da812bf2be6a76aac6670b766eec4564d9484da6595d3ce1f9bba8ba78c30445"
 
 inherit pypi setuptools3
 
-- 
2.25.1


