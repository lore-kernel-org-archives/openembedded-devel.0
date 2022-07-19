Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1746AC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 06:15:57 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.37572.1658211343518210625
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 23:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dVGxYlH/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658211341; i=@fujitsu.com;
	bh=eOXFSLh5pZ5QwLhCjUCFVFIpJ4m2csaKUr3FK5exXSA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dVGxYlH/6l7Dgapx2EcNdmv1e6zGsOrJ5dIemSpiiE6A8hK0ZtMTD9WZYZgpwt10I
	 8OGMFo6MgRXQmpIqY3wNMwgdJtotSP2cPaCosPg4YzGU4wgC0kIMZbEt0AebQI1udy
	 WqJr/E7GOg4vZNbZGnNyOFrV0rH7/Gc6CdR9bzd1Z6FZ1b/JCIq16IskVTP1P5v56+
	 hREvHiVDxKvPZYC+7DMfM0LeFD1cqdlHZ9Ava86FTVIq2jC7ZaI4OgUav2TvvYjDum
	 JOQPZgeTMYFkzV6ZHkgKkZkncIqQKgD1WbBe+ntCGT5OJVU+ZXjQNh91ybOsFBUR8+
	 KIEp7r+PdkaWA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORpMvrcy3
  JYOdzGYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP/4yesBT0cFd3f7RoY17N3MXJxCAk8ZJRY
  sHMBE4RzhUmi9+hdKGcPo8SnGy+Zuxg5OdgE1CSm37rBCmKLCOhLLJ29ByzOLKAi8eJ3DzuIL
  SzgJXG3aQFQnIODRUBV4kWzCEiYV8BRYsvy70wgtoSAgsSUh++ZIeKCEidnPmGBGCMhcfDFC2
  aIGkWJ2ZebWSDsCokZM7axQdhqElfPbWKewMg/C0n7LCTtCxiZVjFaJRVlpmeU5CZm5ugaGhj
  oGhqa6prqGhmZ6yVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZkSjHr4x2M
  a/p+6h1ilORgUhLlnap5LUmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO8FT6CcYFFqempFWmYOM
  D5g0hIcPEoivGnOQGne4oLE3OLMdIjUKUZ7jqtXruxl5pg6+99+Zo7lYHLm17YDzEIsefl5qV
  LivIVeQG0CIG0ZpXlwQ2HxfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG8VyBSezLwSuN2
  vgM5iAjprktMVkLNKEhFSUg1M+748nOmt8eNaOLdbm5y7z4L6GVn/16T5TfoU9GzDVqvV5/aL
  3NGqzW3nNnfiMfp9rfh2BfORr7ef/JfS7fwS3h6aJ8cjItthonk1/GjzBZ9L/xwTbh39FeHet
  ItZQPXm9z+p3Mt4NTi/tNnX1BsUeO+9e/1z6Fqbl6dtHLfm30qef/9D9K0an/2bgp+E+9/PZT
  5YcSrhx055m9bP7w72f96/TdSEK4a1cVVf3Yzv7JsFD6ucY0y/bLhF0dr6zratO+cyzC+W06m
  cd+VZ49JPFUt+mPLzmxzzYglmzU0qvB0grH32mHnaFrYJNfpTfa99WnrHVNmflzH8Jl/dhTCJ
  5Y2f8sSn5LLlKhQriLErsRRnJBpqMRcVJwIAkjLz6WIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1658211341!590594!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29750 invoked from network); 19 Jul 2022 06:15:41 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jul 2022 06:15:41 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1D3231AE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:15:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1221E1AC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:15:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Jul 2022 07:15:38 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.31.10 -> 1.31.12
Date: Tue, 19 Jul 2022 14:15:24 +0800
Message-ID: <1658211328-2951-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Jul 2022 06:15:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97891

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.31.10.bb => nbdkit_1.31.12.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.31.10.bb => nbdkit_1.31.12.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.10.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.12.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.31.10.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.31.12.bb
index 07870bb2c0..302e7a2109 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.10.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.12.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
-SRCREV = "1c31e0e5397646ae3709b1fbfd9c3b47b904f254"
+SRCREV = "33cdb16e65c59b5989ad967ec0cccb2ad249cc97"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


