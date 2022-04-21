Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B662C7114B
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.19071.1650531615787210817
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 02:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y0k6GHmq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650531613; i=@fujitsu.com;
	bh=VlbpYVLL0nx5pdgHzmvFHrUu+Im32LShXKd+M3ssEfc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Y0k6GHmqzBa4sPhLh9pa7hZF7VMdpSc0lxNRFa/ReOLGjp0UTCZlGr0Ao7YpA7rU9
	 I3EE+FMGX2S+NDIALcNQOIFH6kc9C98hG4y6RfudtgbtkOc1AeIGsqkq8VhvHL0O4x
	 54xqxfaveyn/zaBzxEkH8dg5WbY+ZPUh2UN0Nf368JcZKTKmDKOUz/rPs1kOI5kxK4
	 c4UKYT8w/Yg4uly6Lv6YWIjqCScboKJceNHZboFz1To123b6nPMAwsdFKClJD5RlaD
	 Lj5iDnbJL4RZDCSg7R6TciF6/j4OPAjCRMB8/JIiOwGcE3ZGXSasR3RFrKw1OgP+n5
	 2pXUC0OhPmJZA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSVdWNjH
  J4OQbGYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPXzsOMBbO5KvrXH2VsYFzB2cXIySEk8IRR
  4lV7dRcjF5B9gUmic84OdgjnJKPEmznr2EGq2ATUJR7ffM0IYosI6Essnb2HGcRmFlCV6L64B
  qxGWMBH4kf7XjYQmwUovvHDLxYQm1fAXeLNohlgvRICChJTHr4H6uXg4BTwkFj30gfiCHeJ03
  +62CDKBSVOznzCAjFeQuLgixfMEK1KEidWfGSCsCskXh++BBVXk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRKqkoMz2jJDcxM0fX0MBA19DQVNdE18jYUi+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gy
  NzknRS8vtWQTIzCEU4pZ3u9gbOr7qXeIUZKDSUmUN18iMUmILyk/pTIjsTgjvqg0J7X4EKMMB
  4eSBO9cKaCcYFFqempFWmYOMJ5g0hIcPEoivPXSQGne4oLE3OLMdIjUKUZFKXFedXGghABIIq
  M0D64NFsOXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzLpIBmsKTmVcCN/0V0GImoMXVU2J
  BFpckIqSkGpjs02a8Kf8aek76gI6tnlrEl+7io1L6xdXPOqU0rjtkLfS8FP7D+oRg/I20uLi2
  D49vblfpFL1158wNw13J9W1b4jMe/amQUWmMnW9WeGHenpVtPcH5LTN2f1sV/PXYurm8nQX/+
  NY1SRjcinXM3lM45WBsFIvcaqWwhSz+6kf0L9RP3hWcueaAk/IHBWdXp843Hzp8fh5Un7lvhs
  SiGcm3FFZt2PCWdafgh3fbnkhfObS409RlB8NG3U9pr2SkWl/5/yreG/LHKt/amu3w95NKR6u
  vSk5NCa5u4fRaN/v5Cv7zTRoc+2KfM7iXywuprtda8MV1CrcnyxopiccPWzt2TZgaXqXYMpm5
  zla65pMSS3FGoqEWc1FxIgAPm5OXXAMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-587.messagelabs.com!1650531613!12907!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18029 invoked from network); 21 Apr 2022 09:00:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Apr 2022 09:00:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id EF2131009AC
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 10:00:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E21071009A4
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 10:00:12 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 21 Apr 2022 09:59:50 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 3/5] python3-cmd2: upgrade 2.4.0 -> 2.4.1
Date: Thu, 21 Apr 2022 16:59:22 +0800
Message-ID: <1650531564-26234-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650531564-26234-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1650531564-26234-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96724

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:

-Bug Fixes
Fixed value for ansi.Bg.YELLOW.
Fixed unit tests for ansi.allow_style.

-Enhancements
async_alert() raises a RuntimeError if called from the main thread.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-cmd2_2.4.0.bb => python3-cmd2_2.4.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.4.0.bb => python3-cmd2_2.4.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.4.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.4.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.4.1.bb
index bc3fedd37e..8e3883b4f9 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.4.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=209e288518b0668115f58c3929af9ff1"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "090909ab6c8ecee40813cec759e61dd6e70c8227a1a8e96082f5f2b0d394bc77"
+SRC_URI[sha256sum] = "f3b0467daca18fca0dc7838de7726a72ab64127a018a377a86a6ed8ebfdbb25f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


