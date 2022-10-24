Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2154C3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:52:45 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.16575.1666594359010263200
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZC1i4Hkz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666594356; i=@fujitsu.com;
	bh=+XmxSSOvrR1s2nauy1DsEnLknM70uof0nGgCg/S2zl8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZC1i4HkzKjWKc72dTQbnB0QgNjBm3Ch07jJfY6RkO1Q/5slDiD+L5XRM4ko5cB7Yo
	 DtbE8FqLQezWcQQrOeo1caJfqpdj61+okUTXfPn5fDZj9SbqA7VD2woatC9Qlxudfb
	 lVNaBqa3qnR6SswmOIySR6AO/6d5cv8BQhnJlWuQ1Zv5f28qz9qkvs09a+1qr/RDI2
	 a0LNuMy71wf//mWC0TWo8ZIsaaB6JTQlngC7y4uO5U+LHh7bCtTcP1rt8n0oZomGfo
	 Wn4NLnUZo4LF/ezXU2Z49mMOWW8BtXrDHbDkic2Ep4S1CKfeN6qsmxSLsvlMAgUNEA
	 5A/T/xsLMcpJQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxSdfYLCz
  ZYNoiI4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPKuk6mgh6uisl9h9kaGOdydjFycQgJPGGU
  mLr9JyuEc51J4veancwQzh5GiZ7r84AynBxsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3D3
  sXIwSEsECSx4qMRSJhFQFWip2sDC4jNK+AksXdZGzuILSGgIDHl4XtmiLigxMmZT1ggxkhIHH
  zxghmiRlFi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkaz4tSistQiXUNjvaS
  izPSMktzEzBy9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAYEwpZti6g7Fj
  +R+9Q4ySHExKorwM4mHJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4a7SAcoJFqempFWmZOcDIg
  ElLcPAoifDOMgJK8xYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS8/L1VKnFfNBKhIAKQoozQPbgQsSi
  8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub1MwWawpOZVwK36RXQEUxAR1xaEQRyREkiQkq
  qgWkWy+vZiyX2Oygx3Zb+6FmV/I3tlP6qBSZlQjdu7uXPcLFreuK7eUXdXuFHXacupX7apBh7
  VW2mrqfSjN6f5zOur4h6z7SJ+9rug9ysO25ab7lcOmXftFptZzb58JOSASlfbz0w7O8/GC7q4
  FfLt9lWW5TXWH5WGtcvtdWX7DL0tE1WPjT9vZnrs204o9/c86JRLOELD9xX5Qk9urNJ/VH/fI
  vTgsclJpvNKWQ5kjlrY2i1pMbaGoH2O7vaJ2c4rxJZ5mAwjXfn7RO39EPm5Dw4HFiemlaxLmJ
  SvGFCnGTgao2bJqWLX6w2b3piMnVKYoqpnt7C1zqb01o6jvTWNh+dWGd6ckemjfwzvsUeM5RY
  ijMSDbWYi4oTAXFemYFNAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1666594355!251607!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23170 invoked from network); 24 Oct 2022 06:52:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:52:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6CBC71000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:52:35 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5F3701000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:52:35 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:52:33 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.49.1 -> 1.50.0
Date: Mon, 24 Oct 2022 14:52:18 +0800
Message-ID: <1666594338-29061-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99280

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.49.1.bb => python3-grpcio-tools_1.50.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.49.1.bb => python3-grpcio-tools_1.50.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.50.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.50.0.bb
index e1b8a755d5..dbedd4913b 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.50.0.bb
@@ -12,7 +12,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "84cc64e5b46bad43d5d7bd2fd772b656eba0366961187a847e908e2cb735db91"
+SRC_URI[sha256sum] = "88b75f2afd889c7c6939f58d76b58ab84de4723c7de882a1f8448af6632e256f"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1


