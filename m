Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7C3C433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 03:23:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.1712.1640057032867788693
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 19:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oF/VQqvU;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640057030; i=@fujitsu.com;
	bh=hQKNJTh9t45NMRyK097pJy7C1qY6IaLLfNjzxrOexNU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oF/VQqvUGXhrbt+ozyHPBcZAuLWvwSH6ro39KZQHwBZBtOIVH3yTQFFtAifXy5RT0
	 SjlIz0vvXGzrTfEv/RomNZ9ITRCjDcA527Uui8ycBPj0LvJXoUs1Jd5TO8CF276HzN
	 r/i0kCaTe6Sl0Eg4nIJHHotwhqNOif4SNMTXw4dXkF5BR6mL9kLArqaNr3SEUXQxbr
	 L0YZzA6rBr2uQMmAHK0kOT/rqzn4anYUvZf0e62eg8ujTulHv3V88+XeNiHYylm8KW
	 OqCja4jFejNl/CP6SkuOK8m4oR8ebyRdAm1N+TiLhuVCUdRLNDZi4qUPofE9JVoMhP
	 L3fA9JkrVkBzw==
Received: from [100.115.32.74] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 8E/FA-28974-5C841C16;
 Tue, 21 Dec 2021 03:23:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSfeox8F
  Eg29bpC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oypq58zF2zkrGi9+pupgfEsRxcjF4eQwBNG
  ibs7rrJDOBeYJA6dXQzkcAI5Jxkljs9iBrHZBNQlHt98zQhiiwjoSyydvQcsziygKtF9cQ1Yv
  bCAj8TzSc1MIDYLUHz9tONgNq+Am8TGT+fAaiQEFCSmPHzPDBEXlDg58wkLxBwJiYMvXjBD1C
  hJnFjxkQnCrpB4ffgSVFxN4uq5TcwTGPlnIWmfhaR9ASPTKkbrpKLM9IyS3MTMHF1DAwNdQ0N
  TXWNjXUNzS73EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK3OScFL281JJNjMCwTClW3LyDceLK
  n3qHGCU5mJREeffeOpAoxJeUn1KZkVicEV9UmpNafIhRhoNDSYJXDhjoQoJFqempFWmZOcAYg
  UlLcPAoifAqg6R5iwsSc4sz0yFSpxgVpcR5DdyBEgIgiYzSPLg2WFxeYpSVEuZlZGBgEOIpSC
  3KzSxBlX/FKM7BqCTMOw1kCk9mXgnc9FdAi5mAFiuF7wdZXJKIkJJqYCrJ9A59wlz4YXGcebs
  Xz70Obn2zhJeTNM4xTYmZ35H4crd6cmb/iZR59Rf7Dr3XnfUhYstXxx7zCYZnrbtSZO1bq5/7
  F/te2cqYu/WS+IZltQtPOzXJWR3y4XlXaH/jwqmve3jnH2yJ5dk++eqWi+d2119duKVw0qWVv
  G8FJ/su+rTybE75HKP47E+R3Jt/TF+U2Popr/6S+BTzlcqXjAOaRLqWS/m+FapavnT6tBxjM5
  96Ebb2fx6Nn6xPPZLv/jc7ZyvfvjOLl8jZC/w41Pm8MPToysivOt1xx91mfk/OuBi64qh0y4u
  4E3IiuUs8dBVOKEnrHU6/MZ1tWy/3zre1tZvnnD9g/PH1hm5ez0QlluKMREMt5qLiRAD/l8PF
  RgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1640057029!44613!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13731 invoked from network); 21 Dec 2021 03:23:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Dec 2021 03:23:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1B0D6100344
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 03:23:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0E8C110032A
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 03:23:49 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 21 Dec 2021 03:23:27 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gmpy2: upgrade 2.1.0rc1 -> 2.1.1
Date: Tue, 21 Dec 2021 11:22:30 +0800
Message-ID: <1640056951-1301-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Dec 2021 03:23:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94458

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-gmpy2_2.1.0rc1.bb => python3-gmpy2_2.1.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmpy2_2.1.0rc1.bb => python3-gmpy2_2.1.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.1.0rc1.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.1.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-gmpy2_2.1.0rc1.bb
rename to meta-python/recipes-devtools/python/python3-gmpy2_2.1.1.bb
index d3150d665d..fc8db9509b 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.1.0rc1.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.1.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 DEPENDS += "gmp mpfr libmpc"
 
 PYPI_PACKAGE = "gmpy2"
-SRC_URI[sha256sum] = "86cb6d8e5837560c32c706d48d6ed25676be6b3c79e6aa5d245965b9e99231b9"
+SRC_URI[sha256sum] = "346f442063c8212c347e330519905591626ea6fa31aa6ccd299ecd5654e1086f"
 
 inherit pypi setuptools3 python3native
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


