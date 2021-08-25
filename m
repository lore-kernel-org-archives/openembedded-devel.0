Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web12.27430.1629962330486410116
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 00:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U6LHgj9c;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629962317; i=@fujitsu.com;
	bh=4zaNWlfD5IUxmNVylcF+xlbXHS2ZOgiP3WqZ5c2rydU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=U6LHgj9cnf7NZi/V1p5Oz8joPLsYZNrS9WPaafOii/hkMhikaHyR/oNzHJenOcK7H
	 fkIJUNl/iWJUjRlJLepG9bAnCENoqCV/bmS7nky2MVOzB8Q2I2aUKvsUr7G/KeqPoE
	 MVSR1IDnWNJd3HD5B9lp1r7B8JAycPxwhYeO/v7SnYL06RgThGvVMqd8uzlY+WRoeE
	 dParpmOb0uq8JIzoZNjVQaPqCHTbWjBES0xqiAC+m8oeCFWPBCfBbW8dBXY/un8kv6
	 oBAMGnECA6Ol5kjXTxwoQAFieUPcKn7iCOGrNUMZqO645Auw75EQdFxytYfrZg3mPA
	 kzE5G0xgZemsQ==
Received: from [100.112.197.4] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 49/EC-28459-D4047216; Thu, 26 Aug 2021 07:18:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxRdfXQT3
  RYNtkfouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePKthtsBV/ZK1Yt3MrawLiKvYuRi0NIYDaT
  xLmDDUwQzh5GieZlU1m6GDk52AR0Jc49XssOYosI6Essnb2HGcQWFrCROLP2LFgNi4CqxJspm
  9m6GDk4eAU8JfZ+8QAJSwgoSEx5+B6snFdAUOLkzCdg5cwCEhIHX7xgBimXEFCUmD1dHqK8Qu
  L14UvMExh5ZiHpmIWkYwEj0ypGi6SizPSMktzEzBxdQwMDXUNDI11DSwtdQ3NjvcQq3SS91FL
  d8tTiEl1DvcTyYr3iytzknBS9vNSSTYzAIEopOLZ2B2PPmw96hxglOZiURHk3KKknCvEl5adU
  ZiQWZ8QXleakFh9ilOHgUJLgfWcLlBMsSk1PrUjLzAEGNExagoNHSYR3nx1Qmre4IDG3ODMdI
  nWKUZfj8vV5i5iFWPLy81KlxHlNzYCKBECKMkrz4EbAousSo6yUMC8jAwODEE9BalFuZgmq/C
  tGcQ5GJWHeYyCreDLzSuA2vQI6ggnoiAI+VZAjShIRUlINTLI7kl0sle/JNb8J7fP+xHwgNDL
  v126llYzrV4t3Bty+ELRMSuridDMNYQGNlpnyAbmT/neK9vmWSN9K2t68j1c6LTs++8HmrhvH
  tPx2LVHZldx+Q0q/ok4gLe/RXOPFH2R3PJh3bkrdDoOWL7+5OK4f0D6WdItXV//R7y1rpz+vt
  F/5bcH7T9+dgmwWFF5dO7GFf1V1u572Zu93hXqz5Te+u7ZE7sO1zdtXBjIeMVasKLUo31fqz5
  1wb85hzmm3qmJtG4QMTt44+4sv6tDjL5e8Pl2Iclkj9KlvVdG8l6fCLjlvfxe8QGm94rbbs6e
  Z3RcW5N7O0nbSMG0uzw/Ww27Or159W6rAXy2bqWH0O12JpTgj0VCLuag4EQC35LF/KQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-37.tower-287.messagelabs.com!1629962316!250649!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17730 invoked from network); 26 Aug 2021 07:18:37 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-37.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Aug 2021 07:18:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17Q7IZfg017676
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 08:18:36 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 26 Aug 2021 08:18:33 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] xrdb: upgrade 1.2.0 -> 1.2.1
Date: Wed, 25 Aug 2021 12:29:03 +0800
Message-ID: <1629865743-121832-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xrdb_1.2.0.bb => xrdb_1.2.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xrdb_1.2.0.bb => xrdb_1.2.1.bb} (60%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.0.bb b/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.1.bb
similarity index 60%
rename from meta-oe/recipes-graphics/xorg-app/xrdb_1.2.0.bb
rename to meta-oe/recipes-graphics/xorg-app/xrdb_1.2.1.bb
index c5e0e88ed3..a8c5b3d0a4 100644
--- a/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.0.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.1.bb
@@ -5,5 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1167c4f586bd41f0c62166db4384a69"
 
 DEPENDS += "libxmu"
 
-SRC_URI[md5sum] = "34ae801ef994d192c70fcce2bdb2a1b2"
-SRC_URI[sha256sum] = "f23a65cfa1f7126040d68b6cf1e4567523edac10f8dc06f23d840d330c7c6946"
+SRC_URI[sha256sum] = "4f5d031c214ffb88a42ae7528492abde1178f5146351ceb3c05f3b8d5abee8b4"
-- 
2.25.1

