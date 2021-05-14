Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.3629.1620958496038579810
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 19:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dYWv5Gz/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620958493; i=@fujitsu.com;
	bh=NHOkH7HQ3+zNJneSsZS82civM1mcdK1r07PSzjTP+qU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dYWv5Gz/pP7TsTepx1GOe8s0piXfLiuc0BRYzs6rPBGQLDAcLgsHwDH7pFor8xNj3
	 JKjkNyn8vbxGjelUyA72wJ7/IF0l66xW6/Xf3O3jC/Lo0Bg17nAERsIbuWYnFYMni3
	 xi2LneIrGcQzPeiTMLh0C0cyzWYRGCRCq+Tt0/Xru7/dboXd0aJRtMNsOs+QWyG4GY
	 LyUChWg1CWi43lu3IvrCT2wHCFCWtUJ0JNHeDwGpeC5U+bTWuNKwdrJJCc4duFxVoN
	 Z6x6ZH445wsgkNsGsZxUHzj3GIIgAHhs4Nhw7L4eOAickZiaPH1NjEfXXHFLTdz02c
	 tyvCU/hEvFgRw==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id E5/12-37841-C1DDD906; Fri, 14 May 2021 02:14:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MRoitzd26
  CwbND6hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bKS9EF69gq9nb7NjDeYu1i5OAQEpjNJPE7
  v4uRC8jczSgxdddHpi5GTg42AV2Jc4/XsoPYIgL6Ektn72EGsYUF3CV6Tl1jAbFZBFQlNk65w
  Api8wp4SKw+84YNxJYQUJCY8vA9M0RcUOLkzCdg9cwCEhIHX7xgBtkrIaAoMXu6PER5hcSMGd
  vYJjDyzELSMQtJxwJGplWMlklFmekZJbmJmTm6hgYGuoaGxrqGukZGZnqJVbqJeqmlusmpeSV
  FiUBZvcTyYr3iytzknBS9vNSSTYzAAEopZHy0g/H06w96hxglOZiURHlPes5OEOJLyk+pzEgs
  zogvKs1JLT7EKMPBoSTB+/3W3AQhwaLU9NSKtMwcYDDDpCU4eJREeP+ApHmLCxJzizPTIVKnG
  MM53qxdsoiZ4y2YbLt3F0i2g8mZCw6uZuaYBSbvtx8Ckg9ApBBLXn5eqpQ4b+sdoHECIOMySv
  PglsGi9RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd6rIEfxZOaVwN30CuhcJqBzb0yfBXJ
  uSSJCSqqBaer+HG+zqPBD7/ouy6b6SS5u2x/22T5M57z4Lo8Nv/y2V25PsLeyvXM0c4rtmwZL
  73luqya0BrH8X9yx1jxzycprx11Pmq9lkS7QMGIosOUyya0KYvMMWPm48037lgXxR7XPnTHic
  9lw8dj/9mn7tX5y3jJ0UOxec9jQVSkio3on9+OvYWtaq2zqJOMneVoUltrU+53ImXpAtUYukb
  05InyPxpOpD1dWSD//97NvbRmb3cufuQob1s/dLrGlsk250HKbsWzNp1zWl2edT6iFzCnbYad
  cdKVActGf/CvNd38cX8aYtjIg2adKo/jh+a9/ioRSflWnT1jU5cB4RUh2pXze1xlW2aenxGoG
  r5JSYinOSDTUYi4qTgQAemgnVFEDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-228.messagelabs.com!1620958492!334316!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10360 invoked from network); 14 May 2021 02:14:52 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 02:14:52 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E2EpXl000940
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 03:14:51 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 03:14:50 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libdivecomputer: upgrade 0.6.0 -> 0.7.0
Date: Fri, 14 May 2021 10:14:33 +0800
Message-ID: <1620958473-16415-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-extended/libdivecomputer/libdivecomputer_git.bb   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
index b7c1958eef..116ecd84a8 100644
--- a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
+++ b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
@@ -8,9 +8,9 @@ DEPENDS = "libusb1"
 
 inherit autotools pkgconfig
 
-PV = "0.6.0"
+PV = "0.7.0"
 
-SRCREV = "1195abc2f4acc7b10175d570ec73549d0938c83e"
+SRCREV = "47cbed5355ffda7b952193a770a9a9fa9f89b25b"
 SRC_URI = "git://github.com/libdivecomputer/libdivecomputer.git;protocol=https \
           "
 
-- 
2.25.1

