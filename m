Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAEBC636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:14:35 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.3834.1675844071511103833
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tmY0LTv9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675844070; i=@fujitsu.com;
	bh=YLhXGcWQBj9cFodXRlrw/wNo26EfzoSifEND7LJxX04=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tmY0LTv9F27MqHjtzPQxNmyARMcpGP4iO6S3MJWqpRM+9C5wXz1/Uh+IQ7R5VhWUX
	 DMCsALCElXit1Nq0ttoDqDRrwufrJB75GSYDKWSaDWV1NSsz/t8n/HDOr/p2hkaZD8
	 6hE81QNvfnQRCrJ5JlLiWikQn/547r3c3Tc1TuwQPMlEo2SWmum5M3062lDFXEfvdc
	 HEBOjC4PgnxyWgFnT66FuPrQGIBAz+ZbhYkSh6hrIw+saSpbDlUZPAXxjSOn6/wrNl
	 u4avLQ5nbsJDy/rpWUIzXhaxBrQZy5aNJ698MPsikdnh4WOVBdPzm2Dvpj0R3RqaE9
	 VaHuZoCvkCUAg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqPs08nG
  ywdKnyhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bSGZMYC6bzVrxrmMTewPiFu4uRi0NI4Amj
  xPKHp5ghnBtMEnenvWSEcPYwStx4P52li5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBX4nt+w4zgdgsQPGWvR1gNbwCThK/++eDzZEQUJCY8vA9WJxTwFni8KnTrCC2EFDN0Z
  4ljBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm6HmVEq0fvgFZatJXD23iXkCo+AsJO2zkLQvYGR
  axWhanFpUllqka66XVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeX
  WrKJERi8KcXKM3cwLuv7q3eIUZKDSUmU11PscbIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6Ic
  KCcYFFqempFWmYOMJJg0hIcPEoivJHAaBLiLS5IzC3OTIdInWJUlBLnPRABlBAASWSU5sG1wa
  L3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3oAwoCk8mXklcNNfAS1mAlocovoQZHFJIkJ
  KqoGpdcvmrBmZOz7FVBxyO73o25UH+W49Zi9u8c/4xxzsGasgn2PxStsz6eWhXRN/pk2d15I4
  x8HK/Aofa92cp/4fJVmFViV7LEhOnzB/3YqWm987PZIPxS/+7RbjILF1x8T71z7Gr9q9QYaF+
  3Xlqv0B1rwTjpnVOk3wffb/tUrTA5Mgy4rLCvcvWywPzb9gN6HCqaZlhyRPXPHh53utL/zR/J
  Sx33AFe7StXIdfUZFXcMPVu7eKf2fkbopiXHNVf8V/sRVxhX48v3/FZjNX3f289vSpOZtXnsw
  vceJa+O/FjxmhYg1xs6U2vtp85cej2zc/y8yc6vR3yY/DInveO+2sXS3wRvuZjsiOyduOlEZN
  kVJiKc5INNRiLipOBADASKg5WQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-571.messagelabs.com!1675844069!443147!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11873 invoked from network); 8 Feb 2023 08:14:29 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:14:29 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 48108100191
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:14:29 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3A73B10018D
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:14:29 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:14:27 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-paramiko: upgrade 2.12.0 -> 3.0.0
Date: Wed, 8 Feb 2023 16:14:11 +0800
Message-ID: <1675844052-11401-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675844052-11401-1-git-send-email-wangmy@fujitsu.com>
References: <1675844052-11401-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100991

From: Wang Mingyu <wangmy@fujitsu.com>

Bubfix:
==========
-A handful of lower-level classes (notably paramiko.message.Message and
 paramiko.pkey.PKey) previously returned bytes objects from their
 implementation of __str__, even under Python 3; and there was never any
 __bytes__ method.

-Streamline some redundant (and costly) byte conversion calls in the packetizer
 and the core SFTP module. This should lead to some SFTP speedups at the very least.

-Remove some unnecessary __repr__ calls when handling bytes-vs-str conversions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-paramiko_2.12.0.bb => python3-paramiko_3.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.12.0.bb => python3-paramiko_3.0.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.12.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.0.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_3.0.0.bb
index 6295c66a2..9e79c3668 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "376885c05c5d6aa6e1f4608aac2a6b5b0548b1add40274477324605903d9cd49"
+SRC_URI[sha256sum] = "fedc9b1dd43bc1d45f67f1ceca10bc336605427a46dcdf8dec6bfea3edf57965"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.34.1


