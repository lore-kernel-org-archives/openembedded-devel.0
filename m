Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208E6C32771
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:24:22 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.24170.1660703057797300124
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dZ+Z4Ain;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703056; i=@fujitsu.com;
	bh=WLPrDAjbqeQTx33jr99XnWOoc43CwdJL6/P+0o79cko=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dZ+Z4Ain7Vf25Xh5+kOnqKtCzTdWJIsE1GxMrLSQV9N20wm24+yZa3yMXx4dxqGod
	 6SLV4Sg3rtS521IjXBJrpK2G7PKxGi7xDZpVrgZn6AlE5RIM8JmItxEFg6ZJY1RMBa
	 8t8/MnNJJ3qg6jR2Vq6XK0zpAsf8z0p/xhibak3RIZKtnpDoy7JMxWdVS7NAoXV1px
	 Iwarg7OZ3HO+fVupTnAg3isydQqGjkLJXuuNO7+0NEvRmV6hCxVZd8RKwaxw3oGQHD
	 QoV0DPNxVuCzZIP4ElHMQ++v2XRIR8KB55RBjXCPtS+tnvITRWK59hsSAdHVEuxBA+
	 TGbp+5Up/pkow==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8OxWdc/8E+
  SwaVJnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aUD/fYC7ZzVsz+vJ6tgfERRxcjF4eQwENG
  icXb3jNCOJeZJJq+PmOBcE4ySmw5946ti5GTg01AXeLxzdeMILaIgL7E0tl7mEFsZgFVie6La
  9hBbGEBP4kXqyeC1bAAxRt3rmIBsXkF3CX+N55mArElBBQkpjx8D9bLKeAhsW71EbD5QkA1l1
  +ehKoXlDg58wkLxHwJiYMvXjBD9CpJnFjxEWpOhcTrw5eg4moSV89tYp7AKDgLSfssJO0LGJl
  WMVolFWWmZ5TkJmbm6BoaGOgaGprqGusaWlrqJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym
  56To5aWWbGIEhnFKMfPxHYxT+n7qHWKU5GBSEuXtZ/qTJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mC954/UE6wKDU9tSItMwcYUzBpCQ4eJRFe2QCgNG9xQWJucWY6ROoUo6KUOO9bH6CEAEgioz
  QPrg0Wx5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfPu8waawpOZVwI3/RXQYiagxccu/gZ
  ZXJKIkJJqYNritNGzWGndvv3f03dmBKnFtrneFX41Q3vjzRd1NfvfpOR/+H8pqyaZb0v+Ks82
  m+qg6zfuJWQuzC2c2rXF/YbTjTu81w4IbLNwYe1hlTvlaeF2uPD+rzlz4k9fUvrFlSLGekpaq
  n2HSljwnTM/62UeeywTcP7cU7f8Tp97cFbP0aRr4rVN10Iky2o//bZ+++6b4O1Zejb7v9i6VK
  8IMbD55jfzSOCTl876YZOlHLYYC8Zc7/ylH2f6d97ZFbfXCqU09a+/zq1z+a/qx0/zz1mzHGW
  JYrxd4jbv+d6XP1mnTLmf6h/RbPvD+IeGg6dx9p+i31zzby/aMvNhj8Trv/xPow/sCu2zWBS3
  KeOR6nElluKMREMt5qLiRAA2UAaMXgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1660703054!979434!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20598 invoked from network); 17 Aug 2022 02:24:15 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:24:15 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id BFDC414C
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:24:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B346A73
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:24:14 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:24:13 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-nocaselist: upgrade 1.0.5 -> 1.0.6
Date: Wed, 17 Aug 2022 10:25:18 +0800
Message-ID: <1660703120-15786-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660703120-15786-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1660703120-15786-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:24:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98269

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-nocaselist_1.0.5.bb => python3-nocaselist_1.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocaselist_1.0.5.bb => python3-nocaselist_1.0.6.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.5.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.6.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-nocaselist_1.0.5.bb
rename to meta-python/recipes-devtools/python/python3-nocaselist_1.0.6.bb
index 22b8825801..9e6842961d 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.6.bb
@@ -3,6 +3,6 @@ HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "e1c12ca2ae9d345b34948f2c8f60e3894619e2be2ed28b4ecc5e7f1dea117d1d"
+SRC_URI[sha256sum] = "48f067f8cb841245f34d03120bc1ba9900f13b19cb51bcc6c7bee017f7c874da"
 
 inherit pypi setuptools3
-- 
2.25.1


