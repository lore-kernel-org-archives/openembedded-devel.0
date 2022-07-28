Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B95C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 02:15:04 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.28076.1658974496118671792
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 19:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S4wo0Wzc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658974494; i=@fujitsu.com;
	bh=MOjOPURU7i2fvWcJYP/GSzJfl9M63Hf6a4F8I2yVoJ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=S4wo0Wzch5mogBqvFPloZRX1H+oOpZZWmylHoga2Q7GMdZpFPx6QI0smfabv0lmjb
	 XIOVUDGy6WQ4kuZko9nJFJplSX5QDmpP56anBWsGbdR0iYPBCT3yc597/PCfcr7c8f
	 ub4o9s5YBN2YThRebMGJ+vzyyztUEYJAAyvT3gBUwPvnBeIr04SzCMLUcR3PNckfI1
	 5qGMMkXlR8Bp+w3pHuD4rnT4nshaPkdWjgSetnYBWWceHW4Whg+kq5rIqq1ruQEgKR
	 6wXL8ZON7tDsaS1TiGgPpjEC++yO6EHRN+wLH20SemqFr7g6lNAHRKF9CCCst04P0W
	 XA/3sECh73TFQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORqCv78WG
  SwZQ2ZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP3xXTGgs9cFac3+jcw3uXsYuTiEBJ4wijx
  ev8cFgjnOpPEm64fzBDOHkaJqY0v2bsYOTnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48bsHr
  EZYwFlixqtfbCA2i4CqxLfOgywgNq+Ak8TXHRuYQGwJAQWJKQ/fg/VyAtWv2T6REcQWAqp5NP
  EyO0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0JixoxtbBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMtklFmekZJbmJmTm6hgYGuoaGpkDaWNfI0EwvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFiv
  uDI3OSdFLy+1ZBMjMJRTitNv7GDcte+X3iFGSQ4mJVHemQsfJgnxJeWnVGYkFmfEF5XmpBYfY
  pTh4FCS4N30CignWJSanlqRlpkDjCuYtAQHj5II74O3QGne4oLE3OLMdIjUKUZdjplf2w4wC7
  Hk5eelSonzfn8PVCQAUpRRmgc3AhbjlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8z5+BzS
  FJzOvBG7TK6AjmICO2KLwAOSIkkSElFQDk+OlewKhqxO/37RapneMJcjfVTss+q7KIu0etXRH
  j+jdy9dG5Edse75A79Lz5d0ft00PZyh3rzZhc7Jv3VlXKnLkm5v88p/dp/ouv3FONr7y9cLZt
  0++hCZ+f7d6s9R5pfqN6/KOCk6z7cjYkj41W13NuyMyZQqjDH9S4ku1zjmfOr/O+l2tZdIUnv
  /fePYk7+rHdW55SySMujf21K0/Fmn5/ujsikPzVA7nzgu9kjmxkNNmvlvx9Mpt3wQSt3f9b7u
  eMvWTtvgay00vTM+a2NYybt1x9nxR/a/defuNZ0y+9F9lUekRb7kuE53iaznHHt42S7VTOb+4
  tuLQ5eVsU98cMpPMDekv+St3x1xgrhJLcUaioRZzUXEiAJi4qWtsAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-728.messagelabs.com!1658974493!143341!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32655 invoked from network); 28 Jul 2022 02:14:53 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Jul 2022 02:14:53 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F2DD1100197
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:14:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E6894100043
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:14:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Jul 2022 03:14:51 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rsa: upgrade 4.8 -> 4.9
Date: Thu, 28 Jul 2022 10:14:28 +0800
Message-ID: <1658974468-10622-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658974468-10622-1-git-send-email-wangmy@fujitsu.com>
References: <1658974468-10622-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 02:15:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98025

Changelog:
==========
    Remove debug logging from rsa/key.py (#194).
    Remove overlapping slots in PrivateKey and PublicKey. (#189).
    Do not include CHANGELOG/LICENSE/README.md in wheel (#191).
    Fixed Key Generation Unittest: Public and Private keys are assigned the wrong way around (#188).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-rsa_4.8.bb => python3-rsa_4.9.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rsa_4.8.bb => python3-rsa_4.9.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.8.bb b/meta-python/recipes-devtools/python/python3-rsa_4.9.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-rsa_4.8.bb
rename to meta-python/recipes-devtools/python/python3-rsa_4.9.bb
index 21b664ddd1..ed5018f49e 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.9.bb
@@ -4,7 +4,7 @@ AUTHOR = "Sybren A. Stuvel"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
 
-SRC_URI[sha256sum] = "5c6bd9dc7a543b7fe4304a631f8a8a3b674e2bbfc49c2ae96200cdbe55df6b17"
+SRC_URI[sha256sum] = "e38464a49c6c85d7f1351b0126661487a7e0a14a50f1675ec50eb34d4f20ef21"
 
 inherit pypi python_poetry_core update-alternatives
 
-- 
2.25.1


