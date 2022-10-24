Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88420C3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 08:21:46 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.17052.1666599699469777304
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 01:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tTRq+9bb;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666599697; i=@fujitsu.com;
	bh=zMtnEZcXXu8pMMMAwCnTHLwS3nuDwr2ftIDUm1373bE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tTRq+9bbtbPcZTC39IsErf/tuA09/AxEhdxn7iULMpBE3f53rL4V8VqPDPTglxRAB
	 +q4G7npgpDoT1k+1aS0mOgObB8u0aqfjNHVJM+yzumKSh61Da+M85tfOrdwlpmIS4q
	 WsJc+fBY7wI4kdqmWEZuRoGG1nMCrxAZk1O1Y2ekBeZ5FNN1cCyNnchQCSdl7lHFqV
	 wtZxjSX9ePGhl7vPR+BXXssUYT4f3ZMrrM4C5sCOkYQ3oo0v5XABAgJGRH4Pdpmbhs
	 OrFoO+aFgp/2ixjnztPKq3qbX/5vCQ7m6+YMpMmZjRtdVxvtAolqM6+zgGawKlUhcC
	 l04HL/1mdFM2Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSVfQOyz
  ZYMJKPouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP51++MBZ+4K5ruHGZrYHzF1cXIxSEk8IRR
  4v6738wQznUmiaMf17NBOHsYJY78vsbYxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAj8SS6QfAalgEVCVu96wHi/MKOEnsWDuTFcSWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmM/LOQtM9C0r6AkWkVo2lxalFZapGusV5SUWZ
  6RkluYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYDCmFLNV72B8u/SP
  3iFGSQ4mJVFeBvGwZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvOaeQDnBotT01Iq0zBxgZMCkJ
  Th4lER4I9yA0rzFBYm5xZnpEKlTjJYcU2f/28/MsRxMzvzadoBZiCUvPy9VSpy32QOoQQCkIa
  M0D24cLHovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmPQcyhSczrwRu6yugg5iADrq0Igj
  koJJEhJRUA9OWL6slElkvTKoIUjEK1556YKm5TMhn0Vnr/nzw0rsf+1u9WsdIWyTQ9WvMt++u
  mw9MWx/ALPdcZiPrVKYHYVbJO5/tE1W6snpfyxFu35++Hg7JsYYX7K87OU16c0jvc1yW8UOrF
  oYvmg5TL9csvnXh1qmilRwCFzXvhu1648rp0DuvfsaNxWrFTub7CxKkrz7a0+Ud+m/5q7slE6
  7NUVi7xePQEunIvg0aQYdeX5JkDA5wiCm90Ca7577N0rlbTn/+1ix54i67/72S1Gr9pvzzGUo
  hdXbv9TMV9OzU6qRElYyUf5bX3776oHMjT7Gi8DEHmRssf14bzvmkquF1+vBWLmbHz3znfq4O
  Np42pVmJpTgj0VCLuag4EQDUyenaWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1666599697!207243!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16424 invoked from network); 24 Oct 2022 08:21:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 08:21:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D6A041000EE
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 09:21:36 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C9C2E1000E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 09:21:36 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 09:21:35 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-socketio: upgrade 5.7.1 -> 5.7.2
Date: Mon, 24 Oct 2022 16:21:18 +0800
Message-ID: <1666599678-30675-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99294

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Fixed disconnect implementation when using a message queue #1002 (commit)
 Fixed remote async disconnects via message queue #1003 (commit)
 Support optional payloads in msgpack implementation #981 (commit) (thanks Cromfel!)
 Recommend ASGI integration for Sanic in Documentation (commit)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-socketio_5.7.1.bb => python3-socketio_5.7.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.7.1.bb => python3-socketio_5.7.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.7.1.bb b/meta-python/recipes-devtools/python/python3-socketio_5.7.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.7.1.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.7.2.bb
index f71d4dad64..bfc5437349 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.7.2.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "5011a0cd2545c954d7df09eef7489ec424c93b001cc146599cd72f1dd20f0d46"
+SRC_URI[sha256sum] = "92395062d9db3c13d30e7cdedaa0e1330bba78505645db695415f9a3c628d097"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.25.1


