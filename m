Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6543C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:18:06 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.10813.1639401485948723739
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sqxUH048;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639401478; i=@fujitsu.com;
	bh=kgUDJaw2Oginj+oEOglJPMVycGF47+XyTEupgjLgXns=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sqxUH0486prvgKnFwKD97DWCs/Kv+Ez6hZ7PmH0OVbAsDmySVWPDqO1wIHLELMj6U
	 1AEAbG9xSoquq+RJSU+GCsj59a3t/8h4d2m8vdmAY3bQ+RYQm0DxlSEs1pvsiszGgs
	 Rpf4FuEZ+FhC+JIat1urnP4LAOdqcFTGGAbxhy7LDV9JmACPeBGmZIAfmn3ikzPxWJ
	 E5IiUm+g39Zwy2NNGrGccDxuKh+Z9xoNoL4a03Vcmflw05t/7RKMC+z6RMhkoQyIt1
	 ZuIDBOQUG86KLAYt53+ICMlImYLXo5zTJza9vjYxRxxUj4KBwztF/833I+MNuLMpr7
	 ic7h/JK0kLiSA==
Received: from [100.115.34.181] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 31/2C-28974-60847B16;
 Mon, 13 Dec 2021 13:17:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORqMvqsT3
  RYEWHrMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtG2q4m94AR3xfOXHYwNjMe5uhi5OIQEnjBK
  PHq+igXCucAksbDjNyuEc4JRYt7tN8xdjJwcbAJqEtNv3WAFsUUE9CWWzt4DFmcWUJF48buHH
  cQWFvCVeLfrMVCcg4NFQFViwmk3kDCvgJPEsaPPGUFsCQEFiSkP3zNDxAUlTs58wgIxRkLi4I
  sXzBA1ihKzLzezQNgVErNmtTFB2GoSV89tYp7AyD8LSfssJO0LGJlWMVonFWWmZ5TkJmbm6Bo
  aGOgaGprqGlsAmZZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBYZlSrJa7
  g3HKyp96hxglOZiURHmDWbcnCvEl5adUZiQWZ8QXleakFh9ilOHgUJLg/W0OlBMsSk1PrUjLz
  AHGCExagoNHSYS32xEozVtckJhbnJkOkTrFqMux6sD0VcxCLHn5ealS4ryz3ICKBECKMkrz4E
  bA4vUSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeZJBVPJl5JXCbXgEdwQR0BGPlZpAjShI
  RUlINTL2vH05jdl/kNI9R3Nly3ZX7FakFCs05iRKd3GvsL/pkuOwUfWFec+Ov0IPPSaw3VQ/o
  xpmHXQ9MfrOcO7B1345HBz1S1/h5fl162MEpPK7lAxubjXDNMm0Xk8Lgxa9S5kkwy0kHXOhzC
  nLZ2XRddPmn8+mKz5pWGE68qeFbncf76O3T3rO/J9x31HPP5nzroO21msOXqyxNq/QJd6hJtf
  fn7zfD/+px3BNy5FQyKixoyeBXfaXVIXxllpudxyaH55tZ9y6dG7x7WZbw3kesCTU1p69yyTV
  q2m3MUKln3DRF6o/L8/LsUNMDd9S+PBb7omQecViw9utn5WdqAf89V2eeWp9jzr7t2PZyg6lK
  LMUZiYZazEXFiQCOmuhyUgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1639401477!27080!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28523 invoked from network); 13 Dec 2021 13:17:57 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 13:17:57 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EE632100242
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:17:56 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E20E8100239
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:17:56 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 13:17:34 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-diskcache: upgrade 5.2.1 -> 5.3.0
Date: Mon, 13 Dec 2021 21:17:25 +0800
Message-ID: <1639401446-27788-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 13:18:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94329

License-Update: year updated to 2022.

Changelog:
==========
* Add support for Python 3.10
* Update copyright to 2022
* Bump version to 5.3.0
* Add Python 3.10 to the README

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-diskcache_5.2.1.bb => python3-diskcache_5.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.2.1.bb => python3-diskcache_5.3.0.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.3.0.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.3.0.bb
index 4a028d7694..85e2807634 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.3.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Disk Cache -- Disk and file backed persistent cache."
 HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a3e7dd5bc8f0053fee7c5fe9692b932d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c60ef82f0f40155453f6d5f2c94b6e8e"
 
-SRC_URI[sha256sum] = "1805acd5868ac10ad547208951a1190a0ab7bbff4e70f9a07cde4dbdfaa69f64"
+SRC_URI[sha256sum] = "3f1fa30b29fdff26cfddcb3ee7d61376903f82c769ea2907a2b82a5bfb8abbe2"
 
 PYPI_PACKAGE = "diskcache"
 
-- 
2.25.1


