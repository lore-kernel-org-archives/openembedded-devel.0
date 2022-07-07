Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32553C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 07:55:43 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.3036.1657180534964510174
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 00:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xG5r8z1B;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657180533; i=@fujitsu.com;
	bh=9I6MEwIgW34xNXmZGYEsziCGdSsH/Zze1l4dGNsNaAU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xG5r8z1BuSeJjrJBIFxQufN0rZXS4zGTLREvWL7gP2FqbmLLQ2PuQ/hPAGupPI360
	 RUBcOY7ZoXm/UMsgWfE2oJ+jmSpJtMr7JbN1jzmlMFmWQU2PKx92/6i+vgpTgmg7bk
	 KQNvh5RfAln2MDPUEsW0sSiWQueVCjG8z11LqXfEdxuv3mK8jVd1DWFGn4YV/aD56k
	 njeony2c3UJGzIRplBCYg2rxHYDnywNrBs1qH05WI7XEMKStHcVYj3iInYI/yaUM8T
	 gaDeQEDuYv2qxvFzV0fQtpjGvv3qYxg2dmKb2uizbIoqHQ3M+rnNyUjvZO2rd/nz1n
	 1qpq87lup5lRQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8OxWbdk4rE
  kgwvztS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ow3p3qYCg5xVyx98IKtgXE7VxcjF4eQwENG
  if/TdjNBOFeYJO7OuMsG4exnlDh4bhZzFyMnB5uArsSLH4tZQGwRAX2JpbP3gMWFBYIlmluuM
  4HYLAIqEp2774LZvAIeErOO97CB2BICChJTHr5nhogLSpyc+QRsDrOAhMTBFy+A4hxANYoSs6
  fLQ5RXSLw+fIkZwlaTuHpuE/MERr5ZSLpnIelewMi0itE6qSgzPaMkNzEzR9fQwEDX0NBU19J
  M19BML7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzD8UooTBHYw7t33S+8Q
  oyQHk5Io7+qeY0lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgP9wHlBItS01Mr0jJzgLEAk5bg4
  FES4V0C0spbXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKXFe+X6gIgGQoozSPLgRsLi8xCgrJc
  zLyMDAIMRTkFqUm1mCKv+KUZyDUUmYtwlkCk9mXgncpldARzABHbEs/wjIESWJCCmpBqby6ju
  64lPeLAyx7WvoTzuQoLWjw9W+g6tdYGfto3xnLRmZkLVp4tVpwc6XWEWCUq587/5fpup+6J2R
  9V0BwZkFv+aXlHs4JLtuMagp51EwZ73EoRfZtijGhPX88Tn/bZ0SzthH8blZxXxmFL9YbXNym
  p9TcmIKW2HtkRnfPn/erGLlq9jQvPT7EWaXEqN1yn1Pe5xmPFY4vSjh97b8VVM0vp6qZtm9dM
  WKIxWd154bTPvF+/Nq+EuW/TPa7lzmruFg/cSW0x/r9kU28d6Ux7+vaX3nOB15yH1jodcTVqa
  Nokdv3mlXjdlxUsK24Vq0wGexBtXkrPBZ9wXNlpa+X9RlbHfusKjbH1vjjxMtlFiKMxINtZiL
  ihMB2u4kiEYDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-732.messagelabs.com!1657180532!65228!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29729 invoked from network); 7 Jul 2022 07:55:32 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 07:55:32 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 24440150
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:55:32 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 17DA8142
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:55:32 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 08:55:30 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-api-core: upgrade 2.8.0 ->
 2.8.2
Date: Thu, 7 Jul 2022 15:55:20 +0800
Message-ID: <1657180520-23922-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 07:55:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97752

Changelog:
=========
Bug Fixes
---------
    deps: allow protobuf < 5.0.0 (#400) (8f73d2e)
    drop support for grpc-gcp (#401) (5da6733)

Documentation
-------------
    fix changelog header to consistent size (#394) (ac266e9)
    Fix typo in the BackgroundConsumer docstring (#395) (0eb727f)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...oogle-api-core_2.8.0.bb => python3-google-api-core_2.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.8.0.bb => python3-google-api-core_2.8.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.8.0.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.8.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.8.2.bb
index b7ff8bc29..a2df7fb48 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.8.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "065bb8e11c605fd232707ae50963dc1c8af5b3c95b4568887515985e6c1156b3"
+SRC_URI[sha256sum] = "06f7244c640322b508b125903bb5701bebabce8832f85aba9335ec00b3d02edc"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


