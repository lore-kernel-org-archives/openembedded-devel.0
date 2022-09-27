Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6EFC6FA90
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:20:22 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.8542.1664266815541757527
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bYvpnnwC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664266813; i=@fujitsu.com;
	bh=JrXkC8u6ajLI/Pg+XgbK2mKmIP7+fMV7/5+UWhB3zvQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bYvpnnwC5bzgOtJKjWOeCLTCRZnl4jCgPGj0QdvJfhj6E1x+LJcRBNExEa2ErdlR0
	 ZYa16gLVvqqqkmzyCOoaa3yS+uHfvcicZwr1WWmMJJQ42RHF95L8L25qlraG2QXvfO
	 pU/futGxboP7L40AqdbE6aqeXbB60amOCeiTuAKkmyOr1FIP2x1mL8Pf4DNVXjAZjq
	 b4274/1pIILS41w1jAPKhYgZzXgaWmaAfqEK76aEkf7FspJR7zgwsnam/qv8YYlWxg
	 YRRc6sB6YfvWJBQkLd3V5CRsuRZZskxFH6jw2uFZ6vYoBlq9/iW94XANbXcC1b/KMK
	 ZeHeu733Brx5A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpGu7ySj
  ZYMZnUYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPerbVsBf/ZK7YteszewDidvYuRi0NI4CGj
  xNu139ggnCtMErdW90A5exglGma8Zu1i5ORgE1CTmH7rBpgtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwEFi/pF1TCA2i4CqxLdJ7xlBbF4BR4l1i3aB1UgIKEhMefgeqJeDg1PASeLk8jAQUwiopH
  eJPkS1oMTJmU9YIKZLSBx88YIZolNRYvblZhYIu0KicfohJghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGm6SizPSMktzEzBxdQwMDXUNDUyBtqGtoqpdYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYxinFqfw7GG/s+6V3iFGSg0lJlNd+kVGyEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQlepvVAOcGi1PTUirTMHGBMwaQlOHiURHjXLQFK8xYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS
  8/L1VKnHfmRqAiAZCijNI8uBGw+L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh36VqgKTy
  ZeSVwm14BHcEEdIQdnz7IESWJCCmpBiaBFa5pds6Ryx2FHe3jjlkftfoy6efjTmkWdm6LE6bX
  r3zPCdSwzql3ip/xoOBqLct2gZT1d1Waljl1Juf33RGVenXlea/ZUaPHS94xTC9yc59/bvL5z
  ffeuVlzBQtyTf1hLiG+MGT7jEdXNuns9Ometa1cRJdt0QmOSXV22eHdry49rA1vfpTtINfAlZ
  LR9Fdj1tbmmRO0gxS2n1pyaIprUoXk47AdK1T/uxZwfbisbnay8tfPPXbLYj+9yvrDN79RP9F
  WMN/osMIpvryMX5/Ntsel+V1rmc9kEfIsbJ33vd0Tg06HfTVuXSPy09it5lLr0QgNwa69VyZO
  anzMoLjhziYFNp+lG/M32P4zTlJiKc5INNRiLipOBABitNuKagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-745.messagelabs.com!1664266812!376197!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 920 invoked from network); 27 Sep 2022 08:20:13 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-16.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:20:13 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BFBA11AE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:20:12 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B4DE91AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:20:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:20:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libgee: upgrade 0.20.5 -> 0.20.6
Date: Tue, 27 Sep 2022 16:19:50 +0800
Message-ID: <1664266791-2194-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664266791-2194-1-git-send-email-wangmy@fujitsu.com>
References: <1664266791-2194-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:20:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98962

Changelog:
==========
 * Fixes for newer valac
 * Keep the original exception in Future.map/flat_map

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgee/{libgee_0.20.5.bb => libgee_0.20.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/libgee/{libgee_0.20.5.bb => libgee_0.20.6.bb} (85%)

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.5.bb b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
similarity index 85%
rename from meta-oe/recipes-devtools/libgee/libgee_0.20.5.bb
rename to meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
index adf73d4914..f7b54b9b09 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.20.5.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
@@ -18,4 +18,4 @@ do_configure:prepend() {
     done
 }
 
-SRC_URI[archive.sha256sum] = "31863a8957d5a727f9067495cabf0a0889fa5d3d44626e54094331188d5c1518"
+SRC_URI[archive.sha256sum] = "1bf834f5e10d60cc6124d74ed3c1dd38da646787fbf7872220b8b4068e476d4d"
-- 
2.25.1


