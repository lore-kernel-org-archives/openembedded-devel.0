Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE17C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:07:51 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.85522.1677485266985704106
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:07:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ISie1wv9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485265; i=@fujitsu.com;
	bh=h9yhCNb8wZ8VZf6FtoNaYk7ASkr2bTo5mFGGBpZ7ffA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ISie1wv9APRSSSGGEPuWLev94PbkmspHLsE1g7uq5rYAa267vrAsqu5SQyH/ZciUT
	 ZzK4ZDlGw2oP7tdV/do5Tck4Dz88chnF8KdEe4fvgjuXe93v1d2xNyfhR+nGDYejb5
	 s2b6UJiO9xrXGYcT/CKlvYc8qdRsZQnbKd97BUljvtAGEEEfHbw+jSHSIm8GsHGSVh
	 xAdq/PcH6MiKbi7TrWFPy52r6HS8lcrANKfZ7L6okUxSvO4R6qwlOOECheK370GlfG
	 bN3nk3ofRKrPn7tHCBCqcw1TToa/51RKtbu7vT8dUNWGQu5WJwZKsT1NuN6ZPJGJsw
	 yxIBFfKHqRmLw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8ORpHs+5U+
  yQdtEI4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPu25KCX1wV79fvZG1gnMDVxcjJISTwkFFi
  8W6dLkYuIPsKk8TSjkdsEM5eRonlK+czgVSxCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAvMX3KVBYQm0VAVWLH7HVgvbwCThITJ50G65UQUJCY8vA9M0RcUOLkzCcsEHMkJA6+eM
  EMUaMoMftyMwuEXSnR+uEXlK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNpcWpRWWqRroVeUlFmekZ
  JbmJmjl5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5easkmRmAgphSrPd7BuLXvr94h
  RkkOJiVR3kVOf5KF+JLyUyozEosz4otKc1KLDzHKcHAoSfAeTALKCRalpqdWpGXmAKMCJi3Bw
  aMkwstsBJTmLS5IzC3OTIdInWLU5di0r+sAsxBLXn5eqpQ4L18iUJEASFFGaR7cCFiEXmKUlR
  LmZWRgYBDiKUgtys0sQZV/xSjOwagkzBuVADSFJzOvBG7TK6AjmICO2P7wB8gRJYkIKakGppl
  /jD3niZrVSS9Tbf65TUvw5qrIuZKZP7aa+q9dHTS9rlE7NSJcg1Ozb+d9pT0eltcnXr8l8249
  u6HOoRvfi1KPTGSQ5Dbwv3j6h+CakMvrde/0Zvleyu+PYln44uarb6fcJl2byVhcXDHv2d7jw
  S9mfIsPSs5aePPv4bnTBBVEsrYHnf+77nU4x51p/KWz0s9oi7V/r9WzC3wcVme6TnLZlnMXTx
  1UNOfqmyu+bpdzy9/0Hz8Sjz8XOM5z3ON1smu+l5u8YSjfndWr1k3LqfVcVvTnF3egdmW4Q7f
  /FSXPGdc3Ba+c3bqdffslN+E/+9r9P1rIScpVXT8gfa1M/Uz7G8fV9cK/JwV5iTu92KHEUpyR
  aKjFXFScCADviiTOSwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1677485263!408523!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16048 invoked from network); 27 Feb 2023 08:07:43 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:07:43 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 82EE81AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:07:43 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7760B7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:07:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:07:42 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-keyfile: upgrade 0.6.0 -> 0.6.1
Date: Mon, 27 Feb 2023 16:07:29 +0800
Message-ID: <1677485254-11554-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101272

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Remove deprecated 'setuptools-markdown' dependency (https://github.com/ethereum/eth-keyfile/pull/37)
- Use twine to upload package to pypi

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-eth-keyfile_0.6.0.bb => python3-eth-keyfile_0.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-keyfile_0.6.0.bb => python3-eth-keyfile_0.6.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.0.bb b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.1.bb
index 9477632e2..fb2aceb79 100644
--- a/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2beaef1b1764f4d6b46084c885b4bcad"
 
-SRC_URI[sha256sum] = "d30597cdecb8ccd3b56bb275cd86fcdc7a279f86eafa92ddc49f66512f0bff67"
+SRC_URI[sha256sum] = "471be6e5386fce7b22556b3d4bde5558dbce46d2674f00848027cb0a20abdc8c"
 SRC_URI += "file://0001-setup-don-t-use-setuptools-markdown.patch"
 
 inherit pypi setuptools3
-- 
2.34.1


