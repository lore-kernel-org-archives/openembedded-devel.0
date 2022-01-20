Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC5FC433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 07:24:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.8781.1642663453438515024
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 23:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bfPUEMvd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642663451; i=@fujitsu.com;
	bh=YYcDGXu+no4yAe7HzZ2mn81Jtr1WkQ2t2hfiqm2k1fk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bfPUEMvdCDaZgKve9vVzE+gyDNDbNJA/eFmi806y50VV99LiqW/5DqCLi93LXIpNb
	 TII+bEp9ECw15uhTcVuSruxYQ6Et2DT+cs2PtWtb+x/mYpxEZ94ZGL1DRkXRpo7Nnx
	 3D8RBgn6ut9Y1L+c1wkmOQ6xMTfDUolDjg+IVDCXxJ8sQUMzIxpPDw37fdqv8/RYiA
	 LkdzCWWF09sQKMkAKrngkj06a4/Y1cOcULOGX1Ifk1Bg7lZcIO11NLjQ+WHUgiEqvy
	 lX4NdK3/Car1XmLmuuCrqB5U0+3Ao/5oi1d4DJSllkTVN4tGgo8hL/dGnfBAC/ziQw
	 vdiW0ehvQKwSQ==
Received: from [100.115.1.107] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 67/DA-14524-B1E09E16;
 Thu, 20 Jan 2022 07:24:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORqCvF9zL
  R4MZqPYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP+/W9MBb85K67NWcjewDiZs4uRi0NI4Amj
  xIHDy9ghnAtMEvsWdzJDOCcZJdZ2nWDqYuTkYBNQl3h88zUjiC0ioC+xdPYeZhCbWUBVovviG
  nYQW1ggQuLm3xusXYwcHCxA8SO3wEp4BdwlJve9B2uVEFCQmPLwPVRcUOLkzCcsEGMkJA6+eM
  EMUaMkcWLFRyYIu0Li9eFLUHE1iavnNjFPYOSfhaR9FpL2BYxMqxitkooy0zNKchMzc3QNDQx
  0DQ1Ndc10jQwN9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJSSzYxAoMypZjt0g7G
  uX0/9Q4xSnIwKYnyXmR7mSjEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgreEBygnWJSanlqRlpkDj
  BCYtAQHj5II7wuQNG9xQWJucWY6ROoUoy5H86Tl25mFWPLy81KlxHn5eYGKBECKMkrz4EbAov
  USo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeF5ApPJl5JXCbXgEdwQR0RP+zZyBHlCQipKQ
  amBbOv5/81HCt+IVYTw/eGQebi09EOd/4fGduUxXDm09zWRjvpQgs13/1bdvG1aGVMu1v5m74
  tnP6lswrFl90tUV073tmHuutO9rgMnPB929Zm2dv+KFbyfvT/3+MRknXepueq1lPTzTmLbnyT
  dhTdPuswIbGbyrsNgLXpLeo397vtiWyRvn3FnsRo0stuWul0m7yzVF52uw7+cf9v79ls/cI68
  WwBjMx8Jx6y9C7Y0O69aLDu//08y8/U79xfqd9QucetlV9nObHvB0/W0idW3433N/muN6rmG3
  TJEIOTz7Vt9UjfufmRJW/tV0hB9/O4oz5qX/bpmYJ91Wp4zduNkravFiZ5iI+ZevWmw3ZQnpK
  LMUZiYZazEXFiQAZG6YlUQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-587.messagelabs.com!1642663450!66144!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8678 invoked from network); 20 Jan 2022 07:24:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Jan 2022 07:24:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3D444100185
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:24:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 20A7910019D
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:24:10 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 20 Jan 2022 07:24:04 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 1/5] [oe] [meta-python] [PATCH] python3-socketio: upgrade
 5.5.0 -> 5.5.1
Date: Thu, 20 Jan 2022 15:22:20 +0800
Message-ID: <1642663344-16829-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jan 2022 07:24:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94951

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelogs:
Support multiple Kafka servers
Include example code in flake8 pass

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-socketio_5.5.0.bb => python3-socketio_5.5.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.5.0.bb => python3-socketio_5.5.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.5.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.5.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.5.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.5.1.bb
index 425dadc4f1..ebbb5c047a 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.5.1.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "ce972ea1b82aa1811fa10d30cf0d5c251b9a1558c3d66829b6fe70854bcccf0b"
+SRC_URI[sha256sum] = "ac8e64d59a15d1c31a4fe8434f4ff16d0f640c824ba517dce7ca99e95f0cd36a"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.25.1


