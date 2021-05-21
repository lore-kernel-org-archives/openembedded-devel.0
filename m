Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web10.3773.1621561221140785942
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 18:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pcCyFfrC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621561219; i=@fujitsu.com;
	bh=AfrjsLJndPXG5pfflfLxjWqnLRBA5X8blKETYGNzm7s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pcCyFfrCmQGNkkzcmxK0aiqPbSbDWgrzNggOP7Ti6GEKVsi1990E/wRBdUPk6Edxa
	 nPC0SJVpSpaxCIwxsQxXbeOFJ97GdA9WZmJzqagVuSo9MnosIQiqik5qgkGb2PNXFq
	 Pz5NdhTCps1DBJdst6VYntOoj8+zCBbzzDED2V4zCTeEY3yfan2KlP2HF0wQ5nviyT
	 25JpX7fQXaZxqaGirWlZ687VNb02yDGGT9/7cvS/OY2jyeXCkZLkWNmzvpoytAAsl5
	 PMisi/LVMpHCywrd2a8qGoK272jjgH4ZarbyAsF26WYn5+h3kc162VVg28EX+ziqYF
	 2QNehpUEcjFcw==
Received: from [100.112.195.21] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 32/EF-34775-38F07A06; Fri, 21 May 2021 01:40:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxVbeJf3m
  CQe8nfYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePx8X3MBWe5KhY+OMPWwHiPs4uRi0NIYDaT
  xPz+SWxdjJxAzglGia2X/EFsNgEdiY4X3SwgtoiAvsTS2XuYQWxhAV+Jpx83sILYLAKqEvvbz
  4PFeQXcJO7c2M0OYksIKEhMefgeKi4ocXLmE7A5zAISEgdfvGCGqFGU2L7zDAuEXSExY8Y2tg
  mMPLOQtMxC0rKAkWkVo0VSUWZ6RkluYmaOrqGBga6hoZGuoSUQG5npJVbpJuqlluqWpxaX6Br
  qJZYX6xVX5ibnpOjlpZZsYgSGUUrBgbodjA9ef9A7xCjJwaQkyst0eVmCEF9SfkplRmJxRnxR
  aU5q8SFGGQ4OJQleL97lCUKCRanpqRVpmTnAkIZJS3DwKInwMnMApXmLCxJzizPTIVKnGF05n
  q1dsoiZY8O8pUDy/927QLJ/wcHVzBw32w+tZhZiycvPS5US590FMlsApDmjNA9uNCweLzHKSg
  nzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5pXmA5rCk5lXAnfBK6DjmICOcy9fBnJcSSJCSqqByXl
  1nkTVPmtvt9dOzUHvIu+dkLO/sNZQ6oJx4ZbmKd7rFjz89OsFO+OFb4XL3p/ZvbM1uMFW4/Dt
  G11l3JdeX/90b967jvTvd3L4pWIOZW2UbpqmnavSPuERe3ye+rEFckV8JnbJK51NbrR5Gr6MN
  c6VWDnbMWVOaVFeUlStsFDhK03PPqNyrvcCtwKdTq3s5X1vEHLpQNyGrW5yd/t1EtKu3fJYvP
  acTtGtD/8E5q7b5/ggYk178omi2s7LcT4hQZ51K2TTs2u2mRd0yt7bOePBkkqzz93WX/Yxs1b
  USwnOTz/eLlB7cbKWk5qEnX3ah5/Ln8QJFfBeW93WtzZ4lUjBmVlxGmvdX8Yyl+5RYinOSDTU
  Yi4qTgQAr17oLkIDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-265.messagelabs.com!1621561218!336878!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6557 invoked from network); 21 May 2021 01:40:18 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-2.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 May 2021 01:40:18 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14L1eI9N014336
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 02:40:18 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 21 May 2021 02:40:17 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-engineio: upgrade 3.13.0 -> 4.2.0
Date: Fri, 21 May 2021 21:40:10 +0800
Message-ID: <1621604410-7149-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Add runtime dependency to resolve errors that occurred when import engineio.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...-engineio_3.13.0.bb => python3-engineio_4.2.0.bb} | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_3.13.0.bb => python3-engineio_4.2.0.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.13.0.bb b/meta-python/recipes-devtools/python/python3-engineio_4.2.0.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-engineio_3.13.0.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.2.0.bb
index 51f853390c..15b321c359 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_3.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.2.0.bb
@@ -9,5 +9,13 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-engineio"
 
-SRC_URI[md5sum] = "822b5dba0308dde6b8cbfd022daae0e4"
-SRC_URI[sha256sum] = "2da5e1e5565e170a17169d1a76eb6a099cc96f0a25a5b1e0f9785f151485daea"
+RDEPENDS_${PN} += " \
+	python3-netclient \
+	python3-json \
+	python3-logging \
+	python3-compression \
+	python3-asyncio \
+"
+
+SRC_URI[md5sum] = "1fa937ec2a9f6feac27e9f65824c5781"
+SRC_URI[sha256sum] = "4e97c1189c23923858f5bb6dc47cfcd915005383c3c039ff01c89f2c00d62077"
-- 
2.25.1

