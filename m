Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714BAC7EE2D
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:18:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.103805.1683541112849143439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jdUjy0Jz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541116; i=@fujitsu.com;
	bh=e0ClZeu6kjAUwhSADy57pOdX+pAHTFFtXqIxvtsYEhM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=jdUjy0JzXs6NbqlfwVNEeRNwLFVfwGsfOVSGNg1s87rrUt68XvQ+qAeadGljgnzbO
	 +QTg5/SlXdWlkudR57FfOfx8i6FfG0Rv06LEuL3MYic1foUE6PJCI5zXAWYBc0dd8e
	 Jrn+b0Y/wz5q8DOep8cZ3L3umWmcL0gMmtOHBigARUjEMyHZ8rXfzg0f3EFh5CZ8Ui
	 H5A0iX4Xt6xaT7eJ3wrPaHYT3caXwOIy7B1S7eNNS/4ZHWfo3cMaN6x97RX1866PDr
	 8Pf+OxmhHrhkWdTcih+ffQUlh+piVaOrFKQiib/4NQTGbENtaBP35f8ryPsIUcpNsG
	 qoJ38v1kAeNfA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRWlGSWpSXmKPExsViZ8ORpFtzJiL
  FoPcmi8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnH08xa2gslcFYfvdjA2MG7h7GLk4hAS2Mgo
  8aTzODuEM41JYlvPb9YuRk4ONgEJiel7T7KD2CICuhIfP8xlBLGZBVQkZkw+wgRiCwuESazfd
  I4FxGYRUJX4938KWD2vgJPEwhkfwGwJAQWJKQ/fM4PYnALOEs2zboDVCwHVvN7SygxRoyZx9d
  wm5gmMPAsYGVYxmhenFpWlFukaGuglFWWmZ5TkJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRY
  X6xVX5ibnpOjlpZZsYgSGRUpxgu0OxjW7/uodYpTkYFIS5TU9GJYixJeUn1KZkVicEV9UmpNa
  fIhRhoNDSYK3bVtEipBgUWp6akVaZg4wRGHSEhw8SiK8skeA0rzFBYm5xZnpEKlTjIpS4rz/T
  gElBEASGaV5cG2wuLjEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3MsgUnsy8Erjpr4AWMw
  Et9r8cDrK4JBEhJdXAtFzavrm5+dvKNwIV2xOZmpb9mBRZruX9SjNO94NUmH6F502vvl/7y9w
  f5GoYVSRf7UmOd2rlWsT09Oea/sD+LTMZ5Uv8OWXtM2+8ZHpw4Y/i822Hfv7L7TOSXSGbX+7U
  M/f7i49PXtcfrvxqufv/0yKzoG1Hph983G4UeW2/m/DpFDaBGYcizzPK7ssSUL942WrJpV8Hg
  h793ffHn//pJ9Oje4xSFYp2iFyoiX+7vV7AYO5Pvjbm7bPW1Kj47E2NvnQ66YUo1/urphfmiJ
  2LC9e/MG3G57qtvTZB+yf6LNM3NGw7Klq8vyxqC9dnxcdlW9TC01ysfor48kxZ+OCnbuhdJS5
  F49iHR/1t+x4dV2Ipzkg01GIuKk4EAG4nA9gGAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-732.messagelabs.com!1683541115!498367!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27003 invoked from network); 8 May 2023 10:18:36 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:18:36 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 842F11D5;
	Mon,  8 May 2023 11:18:35 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id AB2051D2;
	Mon,  8 May 2023 11:18:34 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cassandra-driver: upgrade 3.26.0 -> 3.27.0
Date: Mon,  8 May 2023 18:18:20 +0800
Message-Id: <1683541101-25407-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541101-25407-1-git-send-email-wangmy@fujitsu.com>
References: <1683541101-25407-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102409

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Add support for client-side encryption (PYTHON-1341)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ndra-driver_3.26.0.bb => python3-cassandra-driver_3.27.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.26.0.bb => python3-cassandra-driver_3.27.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.26.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.27.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.26.0.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.27.0.bb
index 4c5c781052..679b51f750 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.27.0.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[sha256sum] = "425338478c14324704f6973451f3c54f7ffa65b49be045ad1de19628ab6e9492"
+SRC_URI[sha256sum] = "3f43b6023d3d2b34ceaea0a33abf9d9602c41cf316f283f651d835d0c4924124"
 
 inherit pypi setuptools3
 
-- 
2.34.1


