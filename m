Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0747BC433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:38:08 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web10.5237.1637033886487873360
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=A7YfvgDP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637033884; i=@fujitsu.com;
	bh=3JdlxeX5bFpD7ytgmftqWBVgiiQk++dvETF1Bx1N5So=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=A7YfvgDPAvD4tChboOdMPyuidqjnmt0RPygWiYIkJ6uR+BNhJzCRTt2Er20rbMV+l
	 KCBKdeGyqV5KTM6zDbSuS54Euz1pReRIST4By+NemXzEjzLIUxa0P+AvX2KtuXZ0xh
	 ggOWgfEqcdNawUtXTxKUDue9wTbhhTg0Xd5VVmiT7eJ0qT0s6ItY/3KyNc2dhdi9s9
	 /k3ykZHsb5wdh/3XvN96DXrkjjg1iFZKQaUOarYbL3MlX2Wuayr5312eUlkLd/oVkC
	 pum7xUiu3ZK/X4O3go7HwQHEL7omTURt0Wuydio0qhZuKPqG09RrXKOrmOQjjRYtZ3
	 9Jn3OaoVzWXig==
Received: from [100.112.198.7] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 04/0F-09147-B9723916;
 Tue, 16 Nov 2021 03:38:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORqDtbfXK
  iwdxmDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPOzQPsBau4Klbc6mBtYDzL2cXIxSEk8IRR
  YumR4ywQzgUmia7DZ9khnBOMEqvu/2PtYuTkYBNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8ed
  hBbWCBQYsbr92BxFgFVidnv+plAbF4BJ4mrz+6A2RICChJTHkLUcAo4S3w62ckIYgsB1Rzvns
  8KUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJg1qw1qpprE1XObmCcwCs5C0j4LSfsCRqZ
  VjOZJRZnpGSW5iZk5uoYGBrqGhka6hpZmumYmeolVukl6qaW65anFJbqGeonlxXrFlbnJOSl6
  eaklmxiBAZxScMRhB+P91x/0DjFKcjApifLGLZqUKMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC9
  5HK5EQhwaLU9NSKtMwcYDTBpCU4eJREeC+rAqV5iwsSc4sz0yFSpxh1Od79XLyIWYglLz8vVU
  qcd6saUJEASFFGaR7cCFhkX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzNsDMoUnM68EbtM
  roCOYgI6wv9cPckRJIkJKqoFJw3e/+Balmwz7984wZbmzZn0o4+9N02dL8AgJ8S1mcXPqODpp
  V3DWNJ5LUxtWlh5WtP/zsE5aPNVU+tyvd8/CX83+P0U24c+0D485DidWXqs4uZPHP/LQlyzGs
  8cjbGdLyp2e5Ky42jn28ZnCk3N+ekTxbI+q+DRl5qfMoLkLbFcH7uN/Xu+sbnxs34uVFk5BVS
  K9roUs+4oCf6868u50smVWYU9+YXVUxtHXPNb/3nyQafp2Tutf+tGa/cfqDjsIXJo448B136V
  FfKvOCIZun78xtbLQ0/LP005lywWKrzj0js0/9OfsrM1OT46WJJ2651jGf2XKxmTvpIAs514O
  pwB3iRZTk+S5mw7//H4kQ4mlOCPRUIu5qDgRAA5KnqZnAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-287.messagelabs.com!1637033882!548325!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12437 invoked from network); 16 Nov 2021 03:38:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Nov 2021 03:38:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AA0C3100238
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:38:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9B89A10022F
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:38:02 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 16 Nov 2021 03:37:50 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 9.3.1 ->
 10.1.0
Date: Tue, 16 Nov 2021 11:36:39 +0800
Message-ID: <1637033801-81290-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637033801-81290-1-git-send-email-wangmy@fujitsu.com>
References: <1637033801-81290-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 03:38:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93968

Re-add support for passing services to get_device_info + get_multizone_status
(https://github.com/home-assistant-libs/pychromecast/pull/558)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-pychromecast_9.3.1.bb => python3-pychromecast_10.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_9.3.1.bb => python3-pychromecast_10.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_9.3.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_10.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pychromecast_9.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_10.1.0.bb
index 77b032ae2b..d6f72d5c0a 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_9.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_10.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "a1d6807ae0fc455aaeecd2def87c31bb86679a2920cacfa7910db9c9db5085d4"
+SRC_URI[sha256sum] = "ff6e196bd8d46ce648eb3739f3ab04168e287b167fc82abe1216d8fca21772f7"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.25.1


