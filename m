Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2192DC77B60
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:23:29 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.43118.1682306607890233702
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vWiWK5CL;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306606; i=@fujitsu.com;
	bh=9BW23S7abtJlpyRZAyGWUL4AinjkuSMpn1agVx4DNCs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vWiWK5CLJ+wzkw4EIuDS/maFQwyYkyTJC1+ceat4C5/6mHSh+3ZWdmomrP9FmqKi+
	 Tqkgl8Z00nz8C0Xz4/V/x/iSsFoBERdQdFKS+wJDfh0hKrn+IYPba9dz1uZ9i6xFob
	 Af6+rqExDbi97H9+K6yBeFAxmMxdFGEdFtPz+cku78Ye92d0KRSIOBBBOnR04LNEGz
	 g93kYcT7sEpR8dUHJzLa0qUql2WG+UdfmSGbYaODiR0KtjqQjd5MTTs8Uv4q04E8YP
	 AwhjdHJDVEmRq9iPz77IhhfERcm3K0Fd2hdjHYVsoUH/k6MsW+O9qcrt3UtNk3xR2l
	 ANf9yzgXjVV8g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxSVfnm2u
  KwfrLVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bsez+ZC97xVLQ+n8HUwHiBu4uRi0NI4Amj
  xNHpJ5m7GDmBnBtMEnPv+UEk9jJKtD0+yAiSYBOQkrhx/z8biC0ioC+xdPYesAZmARWJF7972
  EFsYQFfiR2bHrOA2CwCqhJrfs4D6+UVcJJ4vnIlWK+EgILElIfvmSHighInZz5hgZgjIXHwxQ
  tmiBpFidmXm1kg7EqJ1g+/oGw1iavnNjFPYOSfhaR9FpL2BYxMqxhNi1OLylKLdI30kooy0zN
  KchMzc/QSq3QT9VJLdctTi0uAMonlxXqpxcV6xZW5yTkpenmpJZsYgaGYUqzEsIPxwM6/eocY
  JTmYlER5l2xwSRHiS8pPqcxILM6ILyrNSS0+xCjDwaEkwVv0yTVFSLAoNT21Ii0zBxgXMGkJD
  h4lEd5lX4DSvMUFibnFmekQqVOMilLivIEgCQGQREZpHlwbLBYvMcpKCfMyMjAwCPEUpBblZp
  agyr9iFOdgVBLmlfwANIUnM68EbvoroMVMQIt3cbuALC5JREhJNTDNPvKWcbJR3Lz2qxGfrEv
  1/SdeZo9Qu3GkXz1B6/MS68drJJx+rlLwWHnlxdZpO9e9l8r57dTBP0sj0Cp9k6ao/7/ugNIT
  cuzzk/96955MikjveZ2xPM9ol+KeyTGRL9lnduxWdH+t5SnvaSNevChOKqElUMTzS3Xthw/7b
  de8zxQ8lzTj9o/+qyqT9wjbtMTI3I9Q/aOcX1axYdEdAY9v2WEh/GfZlVts++9KHxdi+WW379
  eGlx5eP7skW5iWXVGYEvG13PXyhvluBjru6c55xqvqLdPra+9tqPx2lLd5gcZi819By8VWf7o
  e90ps6y2J1HtRH6+e01221KDr4sZt97Y+5VjLXJnqt8MhfLESS3FGoqEWc1FxIgBN1J9PQAMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1682306604!66493!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25511 invoked from network); 24 Apr 2023 03:23:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:23:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A1BA210032B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:23:24 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 95E2D100329
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:23:24 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:23:23 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-periphery: upgrade 2.3.0 -> 2.4.1
Date: Mon, 24 Apr 2023 11:23:05 +0800
Message-ID: <1682306589-11841-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102159

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  Fix realtime timestamp reporting for line events in gpio-cdev v2 implementation.
  Avoid writing direction and inverted on open to retain existing state with sysfs GPIOs
  Add support for gpio-cdev v2 ABI.
  Add type stubs.

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-periphery_2.3.0.bb => python3-periphery_2.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-periphery_2.3.0.bb => python3-periphery_2.4.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.3.0.bb b/meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-periphery_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb
index 4d81b8d24..e284ccc33 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI
 HOMEPAGE = "http://pythonhosted.org/python-periphery/"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fed1784a083509430580a913df680706"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=30fe6f023a80fb33989fb3b9d773fea0"
 
-SRC_URI[sha256sum] = "8a8ec019d9b330a6a6f69a7de61d14b4c98b102d76359047c5ce0263e12246a6"
+SRC_URI[sha256sum] = "61d461d736982a6f766e878720ab10a68151e2e8c1086600d9389ac47e40e88a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


