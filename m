Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.3992.1618541542090530001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 19:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dJM2QijZ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618541540; i=@fujitsu.com;
	bh=RFja6+AvoUgx6JwgTaGmrfZdkAkCv7UWfVNTYVHW/ko=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dJM2QijZjvTquKlkoeTfR/rgLg4OpllvJB1AoPqcwLvMd2zNqgUyvh3HPtXW+mzFv
	 m67aZc0I1kfqfsEhBafLcnQjD2GK8OVgETYiMOBkdF9LN1+E6vneAyXyWbpe4Js/Hv
	 v2eAbknCCk1DKM9bCbLU4JwWdRwWR4PWU1mrzHrI1y62RGtEdn5SuhV2VCIBEymAm4
	 7hA9EWSzIwsmYWihoLRqFeBYuWrgz8B/l2ZUBSvfADOmUtCWrCSHfD+NS1PevGoLgF
	 TuU9wIxj5xiKGYtLCV8MLJCNoaYDHySHtfvEKVf0OZ6J/D4GmKtP016zoJZKDipL7B
	 WikFxKD1vhWbg==
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 50/E5-07430-4EBF8706; Fri, 16 Apr 2021 02:52:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYovv4d0W
  CwYwjxhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b9wx9YC16zVzRt2cDcwNjL3sXIxSEkMJtJ
  YtWZBVDObkaJ2f+OMnYxcnKwCehKnHu8lh3EFhHQl1g6ew8ziC0s4CDR+HU/UA0HB4uAqsScZ
  VEgYV4BD4md/++ClUgIKEhMefieGSIuKHFy5hMWEJtZQELi4IsXzCCtEgKKErOny0OUV0psn3
  aWcQIjzywkHbOQdCxgZFrFaJlUlJmeUZKbmJmja2hgoGtoaKwLJI0N9BKrdBP1Ukt1k1PzSoo
  SgbJ6ieXFesWVuck5KXp5qSWbGIFhlFLI0LSD8d2rD3qHGCU5mJREeQ+tKEsQ4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMG74GdFgpBgUWp6akVaZg4wpGHSEhw8SiK8L38BpXmLCxJzizPTIVKnG
  BWlxHlXgCQEQBIZpXlwbbA4usQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcUZApPZl4J3P
  RXQIuZgBZXrCoFWVySiJCSamBSZ/Rk1ixji+9rPPry/mOxVCW3qXbSFlbcEw1+VbR+Wz3jFl/
  lqxezJqZwXb91avuH5S7zZ5+vYv+gYPTCXfX6Lflz06xy7e3j+HtduBRmnl/7XvLVFMP6cN3p
  wg/5ehwSLRSk42q9wh6/0fKI6TeKu2gn+7aX5ViJw69HUq2RpoIuzH5bN3EpaRotniq2YMtpZ
  8PF687tj1Pxdmi1kslf9yUzl2Hl0TgD6SbDLVV2j8pXPl35MGzC1Ycr//fKSK7dIBd7IXbC9N
  NVXR+n7WbhMltx62l/IVsZr9enr8faJvBfUz34Zfb63crvvHtPS09lzXmzqSDg6Lcjt/YsUlX
  atqfkp8LaWWrMWg9uHS5QYinOSDTUYi4qTgQAolZ/0h4DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-232.messagelabs.com!1618541539!1584996!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11608 invoked from network); 16 Apr 2021 02:52:19 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-10.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Apr 2021 02:52:19 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13G2qJCB020743
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 03:52:19 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 03:52:17 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] librsync: upgrade 2.3.1 -> 2.3.2
Date: Fri, 16 Apr 2021 19:24:07 +0800
Message-ID: <1618572247-69296-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../librsync/{librsync_2.3.1.bb => librsync_2.3.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/librsync/{librsync_2.3.1.bb => librsync_2.3.2.bb} (88%)

diff --git a/meta-oe/recipes-support/librsync/librsync_2.3.1.bb b/meta-oe/recipes-support/librsync/librsync_2.3.2.bb
similarity index 88%
rename from meta-oe/recipes-support/librsync/librsync_2.3.1.bb
rename to meta-oe/recipes-support/librsync/librsync_2.3.2.bb
index 004c93d0f..f1997136a 100644
--- a/meta-oe/recipes-support/librsync/librsync_2.3.1.bb
+++ b/meta-oe/recipes-support/librsync/librsync_2.3.2.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 SRC_URI = "git://github.com/librsync/librsync.git"
-SRCREV = "27f738650c20fef1285f11d85a34e5094a71c06f"
+SRCREV = "42b636d2a65ab6914ea7cac50886da28192aaf9b"
 S = "${WORKDIR}/git"
 
 DEPENDS = "popt"
-- 
2.25.1

