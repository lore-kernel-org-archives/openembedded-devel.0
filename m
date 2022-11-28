Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228F2C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:14:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.111398.1669616060755358282
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lD7LquPu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616058; i=@fujitsu.com;
	bh=DaTefyosKmYnxM+HuWEgo8atA1EV5PTAwL7oUjohDkg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lD7LquPumspZztqXdN3Mh+YbJNVQ/2M37ZmV/Y3ggvcfOQkWApi1Zbg4hmpQrNWT9
	 efZApxBIKTM99FRe5+wiDTq26LO+cS9iU9EZO2uZJN4ttrXA4RyDajPUduHMPnoq/i
	 VnDaUpKyu6zxTWH+KbHRFt5WPbSyqJA+nEpa7hmlPgooC60mKBhzbfZTCfRl/jCjmV
	 65LzFzFN5Bb65d3bqH4LE/YgrNGYA/OJAuSRJzhaA80Gjoy5gc69A9WHQskFdXKuvy
	 x+f4bVvLR/EHgH7EDK2I+miLmToApvzyzYKvjcdb+d4/+0l9PuiBl6HKZkeLnEMyE4
	 B3nrDqWsHqN4g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqLsrsCX
  Z4NlLfouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNp+0TmgnOcFb96T7M2ML7h6GLk4hASeMIo
  MevKRyYI5zqTxPXmu4xdjJxAzh5GiatbqkBsNgEpiRv3/7OB2CIC+hJLZ+9hBrGZBVQkXvzuY
  e9i5OAQFvCW2NhQDBJmEVCVeNa4hwnE5hVwkrg1eQU7iC0hoCAx5eF7sFZOAWeJ23uPskKscp
  Jofn2YBaJeUOLkzCcsEOMlJA6+eMEM0asoMftyMwuEXSExa1YbE4StJnH13CbmCYyCs5C0z0L
  SvoCRaRWjWXFqUVlqka6hXlJRZnpGSW5iZo5eYpVuol5qqW5eflFJBlAqsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwdFOKk9l3ML5Z8kfvEKMkB5OSKO/CS03JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR413u2JAsJFqWmp1akZeYA4wgmLcHBoyTCu9geKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/L
  xUKXHec/5ARQIgRRmleXAjYDF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7zaQKTyZeSV
  wm14BHcEEdMQmxSaQI0oSEVJSDUxa2TM/PpT4siuj2O7NPp5LsasbzVRDdMsKty/yOt26Z41Q
  YeWG2OyvR+ccfTknNXKZE3/Sgi2N/n+8y58v/a641Ur9Cn9KnY7r3b2n7v+sqrhkM7nHjXtFX
  5LXw7ctrAdEF9kwG/x1fVYS8/vXrC8Jd1yvBFxXXcrC/5vJr6x/8ZEjfk6LQ5yqLs5j4pbLbr
  WYdoJti+FGFiajvWkfnnGf6ip5dVS8nPvdFLOdoQcerzcVsHgiz9VgpP218mfj2XC/0zL68lI
  5344vKp+k7/DV4Fnmu7dXq7/zZKu7sS6c2sw9JTPxVeiDpNVn676e5zk2bwXTnah5NtkL/6TJ
  JkbNyLhQuP/H8yMvCgROMl9QYinOSDTUYi4qTgQAX+rGP2QDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1669616057!284725!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15461 invoked from network); 28 Nov 2022 06:14:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:14:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B512110019A
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:17 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A8CE7100197
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:14:16 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.2.0 -> 8.6.0
Date: Mon, 28 Nov 2022 14:13:44 +0800
Message-ID: <1669616024-13194-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616024-13194-1-git-send-email-wangmy@fujitsu.com>
References: <1669616024-13194-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99805

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://ipython.readthedocs.io/en/stable/whatsnew/version8.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.2.0.bb => python3-ipython_8.6.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.2.0.bb => python3-ipython_8.6.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.6.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_8.2.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.6.0.bb
index 35af7dd4d..74fe986c9 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.6.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "70e5eb132cac594a34b5f799bd252589009905f05104728aea6a403ec2519dc1"
+SRC_URI[sha256sum] = "7c959e3dedbf7ed81f9b9d8833df252c430610e2a4a6464ec13cd20975ce20a5"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.25.1


