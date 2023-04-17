Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388ACC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:40:31 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.49025.1681717227012058194
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qUkF1OCR;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717225; i=@fujitsu.com;
	bh=Xalfya0w9l7rcfIVd3CdOn4Vwtjab+ZdF6JjpgvMFlc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qUkF1OCRKuOKKBUKaLLgJtdqGX7rRDYWVtPB4adMwt/yYdDpTO1iIRhRvtweTMcn9
	 oxhOXhK8Y0hLTL1MTSZ9U8/oLowD9AKaR3aZtBpMhz/8SVDfrTSulCp8DiXHGXr/IW
	 E39KtGJDdX3bxwjtN6bB+uYhY629gR3AMaNpmKJZU1JW6HiwcA/woj0gglhedIzBzv
	 1f82gW0G5Vc/XlxWPFHYNhwKOtU3F6QEB1+dMt1yuoWRxeSJUtpBUppO6botDqbhp7
	 E88Baqfy6NF6KRs8uSH723oPtgrR8p4e79DKMte7YHKOx0J29vdpRtEb49GwNzq459
	 3XedNq3DTXU0Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8MxSffld5s
  Ug8cv2S0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyFDSdYCpZzVdw6vZetgXEhZxcjB4eQwBNG
  iaN+XYxcQOYNJon+vmvMEM5eRolz208AOZwcbAJSEjfu/2cDsUUE9CWWzt4DFmcWUJF48buHH
  cQWFvCV2L/2CCuIzSKgKrHwwHawOK+Ak8SKZ0/BbAkBBYkpD9+D9XIKOEs0rH/GCnGEk0RjSy
  lEuaDEyZlPWCDGS0gcfPGCGaJVUWL25WYWCLtSovXDLyhbTeLquU3MExgFZyFpn4WkfQEj0yp
  G0+LUorLUIl1jvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9vNSS
  TYzAsE0pVhPewfil96/eIUZJDiYlUd4XqdYpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4z3+zS
  RESLEpNT61Iy8wBxhBMWoKDR0mE1/gZUJq3uCAxtzgzHSJ1ilFRSpzXHxh5QgIgiYzSPLg2WN
  xeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+wZkO09mXgnc9FdAi5mAFsspgS0uSURISTU
  wRS2absSvoFB1qDKmL3LaJxk9fTHNWzoMzOeT+xf329lNfnn6KMvcIxUv36s8O5zVG20X4L3d
  KOpliB3rj4JM73mX5PSkrV4+Xyll7aaW+e/FqZ2cxVdWOM2zeNIscWt6tmykSsPS85dZHC/+r
  vD6yGEukLZz9WueV+5N+1xu7v7w6rnFu3+Mi89nLjZn2nA74LT1bS3Z3FCV6PccW/hebjKfFe
  6z4arEqtJrfQYOcopZs9YW8W1ufMHV8u1Nxd7yOXNMtvdrNZS8s1k4e72X//rVUUd8J1jZL4i
  7a+ip2DOrfuLrhCM7wvju9TILv2yVLTtje1XppemnpfILn2Rt9QyYFLfPtsOvSPSSWvceJZbi
  jERDLeai4kQACr66X1YDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-565.messagelabs.com!1681717224!434698!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30923 invoked from network); 17 Apr 2023 07:40:25 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:40:25 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C74EE100346
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:40:24 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BB582100337
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:40:24 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:40:23 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-croniter: upgrade 1.3.8 -> 1.3.14
Date: Mon, 17 Apr 2023 15:39:54 +0800
Message-ID: <1681717197-19108-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717197-19108-1-git-send-email-wangmy@fujitsu.com>
References: <1681717197-19108-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102108

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Add check for range begin/end
    restore py2 compat
    Do not expose i into global namespace
    Fix DOW hash parsing
    better error handling on py3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-croniter_1.3.8.bb => python3-croniter_1.3.14.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.3.8.bb => python3-croniter_1.3.14.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.3.8.bb b/meta-python/recipes-devtools/python/python3-croniter_1.3.14.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-croniter_1.3.8.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.3.14.bb
index 691c25017..af8892eb7 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.3.14.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "32a5ec04e97ec0837bcdf013767abd2e71cceeefd3c2e14c804098ce51ad6cd9"
+SRC_URI[sha256sum] = "d067b1f95b553c6e82d95a983c465695913dcd12f47a8b9aa938a0450d94dd5e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


