Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B55CCA47B
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 01:36:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.1724.1654133814214573858
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 18:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xqyCAceD;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654133812; i=@fujitsu.com;
	bh=7OoRtaJbRsrrjPQfFKvlxgTnCg4HPahILt1koNOVYlg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xqyCAceDgZQr9fH5flTj3K99a6gv+eFvIiS2SOdZN8ybGjMIehM6JZYc3KJY0Em5F
	 1o2FI6DagURvkg/pmQMEtLb0Q6IuWj8mYyazKTq3143XMij4XoOOJU5byknwJ6+RBW
	 kTEOkKh9wHAtCPjldt+peUDGpmrRYXTv8WN7oBH4tBV78xoqibIzlARtcuTa7knNHs
	 lSC0p7oRNl58KhafQeaCa8fHn0XXtTDCJhvFzS+UMynZlPZABhGaPtrpQ8lyHI7DTR
	 s2xhzboTp1I9mJHioNaVLS9Sy9sHVZ4NHY5uDj0SDO7HwL8BDZ6mjBniwi7+Dp6dVd
	 bFfRuCrpw0/0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqGssMiP
  JYOcSTYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPm87msBUs5K2ZOOsPUwLiXo4uRi0NI4Amj
  xJnTy9kgnAtMEgsf7mbpYuQEck4wSrza6wliswmoSzy++ZoRxBYR0JdYOnsPM4jNLKAq0X1xD
  TuILSzgIfHk3GIwm0VARWJtfwNYDa+Au8STW7fBZkoIKEhMefgeLM4JVH9i9yOoXe4SH979Y4
  SoF5Q4OfMJC8R8CYmDL14wQ/QqSZxY8ZEJwq6QeH34ElRcTeLquU3MExgFZyFpn4WkfQEj0yp
  G66SizPSMktzEzBxdQwMDXUNDU11jC10jQyO9xCrdRL3UUt3y1OISXSC3vFgvtbhYr7gyNzkn
  RS8vtWQTIzCMU4rVruxg3LPqp94hRkkOJiVR3p2O05OE+JLyUyozEosz4otKc1KLDzHKcHAoS
  fB2889IEhIsSk1PrUjLzAHGFExagoNHSYQ3jxEozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vF
  Qpcd46IaAiAZCijNI8uBGw+L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZhXUhhoCk9mXgn
  cpldARzABHXHt2xSQI0oSEVJSDUzzeK//2aubUXvw/+cQ58u/fGdKiXBd5r4wqfWcQLvYrvSI
  zomTLaqe1k75J39019/GvRfK/Lp+9atvDbq47W+ljn791V13I4qZ27o2X1SYr2Ew+W2/jZVQT
  8OFtntbtvtl1nTu4tXtFDIodb3Md/Lji18Pmc7MLRQ12Xii0/vkJNbn7kwC1nnvbshrCy8UPa
  qrXvHuRKm6f+WzyUsNC02mN6fm+RyLEtohtK4m+1m6ufCjo2cn9TifY1asEgr5d/l/q83KjXf
  nJ0/2kXrSJd/ncKOjs8I9+7HRvIzTM2RdZa/8ZN7DddFgS9GHPVLZlr7/BVfECNfrJLjmfgrO
  65LJWKKzT0cq0H6DXdrVp0osxRmJhlrMRcWJANh/TShqAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-565.messagelabs.com!1654133811!378380!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10923 invoked from network); 2 Jun 2022 01:36:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Jun 2022 01:36:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3F4C3100195
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:36:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 29618100180
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:36:51 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 2 Jun 2022 02:36:34 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-h5py: upgrade 3.6.0 -> 3.7.0
Date: Thu, 2 Jun 2022 09:36:15 +0800
Message-ID: <1654133778-20912-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654133778-20912-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1654133778-20912-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 01:36:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97370

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-h5py_3.6.0.bb => python3-h5py_3.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.6.0.bb => python3-h5py_3.7.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
index 64abe73cb..1153ea32c 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "8752d2814a92aba4e2b2a5922d2782d0029102d99caaf3c201a566bc0b40db29"
+SRC_URI[sha256sum] = "3fcf37884383c5da64846ab510190720027dca0768def34dd8dcb659dbe5cbf3"
 
 SRC_URI:append = " \
            file://0001-setup_build.py-avoid-absolute-path.patch \
-- 
2.25.1


