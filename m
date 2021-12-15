Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73D7C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 09:48:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.38438.1639561731108056877
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 01:48:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F/Il+9SV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639561729; i=@fujitsu.com;
	bh=LAutl4R7L9hg63NAe1c3c2CrBwnjU//khsFFoAj3mu0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=F/Il+9SVvDDizjkxB/mFw1HIzO+RN7GnABbdO216E3Fjpx5Z2CyU+244CCcogFm/R
	 8IRxpOv2wly/5TQRiXeEmpy0BD7OMPFWMeL6Bv1BtOe1TyWNNt01xeHTTBTV04RwJ4
	 46BzF046fdHt7X14GOepNMNHaZ7qI8bRudBJIDYw3Zr5lXHSMx5EJdAYDvCQ0nIpfF
	 w2XV4QDWab9ZZet+Mc1eMm/2l8yLu7Z6sv7Xy160b7j4L3gDdnODjIGdDL9UtpQlCg
	 1J1ZjtIJKUUqltdA/pXdGt+EEgRl8uy0/3rlbslYzXf2PfwjYXuQPezFCForaVCY5E
	 MoxmqUDIbY5lw==
Received: from [100.115.3.179] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 14/8A-14524-10AB9B16;
 Wed, 15 Dec 2021 09:48:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqMuwa2e
  iQd9kHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP3+scsBb85Kl7Nn8PYwLiIo4uRi0NI4Amj
  xJozDSwQzgUmiY0dt1khnJOMEmfPfWDqYuTkYBNQl3h88zUjiC0ioC+xdPYeZhCbWUBVovviG
  nYQW1jAQ+LPzkYwmwUofnfRJaBeDg5eAXeJ3v2aIGEJAQWJKQ/fg7XyCghKnJz5hAVijITEwR
  cvmCFqlCROrPjIBGFXSLw+fAkqriZx9dwm5gmM/LOQtM9C0r6AkWkVo1VSUWZ6RkluYmaOrqG
  Bga6hoamuga6RoaleYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgUKYUM1zf
  wTix76feIUZJDiYlUd68TTsThfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwcuwEygkWpaanVqRl5
  gAjBCYtwcGjJML7djtQmre4IDG3ODMdInWKUVFKnPfqDqCEAEgiozQPrg0WlZcYZaWEeRkZGB
  iEeApSi3IzS1DlXzGKczAqCfO+AZnCk5lXAjf9FdBiJqDFx3K3gywuSURISTUwCctbWgQ93iq
  28dmfS90d9U4qHM6i7w7/XLVvS/a8x9FeIs75uUo+kz++C34VoCBvl1zLsMHPKFttbcW5f9H6
  uotNqut6i5kyj2lV/t5fr+9reNRvVqzctkOLlD+KL1dZO00zR36GNbdrYpxBnWpOzNI7AWUsi
  5doXvqUWLtT4VzbY7MlYtOYvrKY1bmGR3Y6T7ZdeZdbX/DbpT9X/9rlrtHXtuYKfXHYYFFTgN
  NJF4G/rK+uzjZr4dqsN4f/CnfAstORbNqHrnf0vS7Vbcx0dVEMssu34lilHDrF7NXmtJebdz3
  TON7uefn2Jq6LT3sL43hcGY4Z70twd97+QTo1fxrPku+t6pdLdvc3zFBiKc5INNRiLipOBABY
  IwxsRQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1639561728!11010!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27359 invoked from network); 15 Dec 2021 09:48:48 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Dec 2021 09:48:48 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2FC431009EC
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 09:48:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2268E100243
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 09:48:48 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 15 Dec 2021 09:48:33 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gnupg: upgrade 0.4.7 ->0.4.8
Date: Wed, 15 Dec 2021 17:47:46 +0800
Message-ID: <1639561666-12124-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Dec 2021 09:48:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94365

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-gnupg_0.4.7.bb => python3-gnupg_0.4.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gnupg_0.4.7.bb => python3-gnupg_0.4.8.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.4.7.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.4.8.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-gnupg_0.4.7.bb
rename to meta-python/recipes-devtools/python/python3-gnupg_0.4.8.bb
index 83ee57926e..b42225b620 100644
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.4.8.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b0b7ac63b60085b23fa9f7e1951daa1d"
 
 PYPI_PACKAGE = "python-gnupg"
-SRC_URI[sha256sum] = "2061f56b1942c29b92727bf9aecbd3cea3893acc9cccbdc7eb4604285efe4ac7"
+SRC_URI[sha256sum] = "b64de1ae5cedf872b437201a566fa2c62ce0c95ea2e30177eb53aee1258507d7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


