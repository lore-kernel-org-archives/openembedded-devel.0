Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4273CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 13:01:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.31578.1654520466527296185
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 06:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EXO+Q9qa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654520464; i=@fujitsu.com;
	bh=Gi93tbNGRhXz4lMmqSo1/2Im+4AxaoaQPFEd4sxgKB0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EXO+Q9qaLlu7HiCw5JH3IpOVdJ93d/QiwmC9N5NOLavzTncJDiPKZud3KIe3AUNEM
	 dhP1w0xywl5G/8Lg2eDBeA9WlEW48rtBfLA5KwybDz86d4vADyCm7o0Tr3emmX2Qgw
	 dZUX/Ti2x7jJUYNiNYjLrtHLUP8+phIrQoB9FJVVj8pxPr+c9B8AKlpfNHt/t45fel
	 7wqmVndz7iM1jFEnslIBx7UQY/LOcA221EInmgP3K/oyLzAy9+Asmb1mFtza6YKT2L
	 8XChFpJbXCRqI9p3sUOeoVC2k+QAdj929dEUR5vwL2yFyAcMHFZYKs9Kb/uCP/F6MH
	 D+7PPIiSCR34g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORpDvh19w
  kgx/TBC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owlV5+yF3RwVJx9/JOpgXELexcjJ4eQwCNG
  idnPWLoYuYDsc0wSN1dfZIdwdjNKbG7ZBlbFJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi989Y
  DXCAvYSHdtbwOIsQPFXf88wgdi8Ao4Sf65tB6uREFCQmPLwPTNEXFDi5MwnLBBzJCQOvnjBDF
  GjKDH7cjMLhF0hMWPGNjYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRqukosz0jJLcxMwcXUMDA11
  DQ1NdM11DM0u9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAoEwpZlu5g3Fl
  30+9Q4ySHExKorxVn+YmCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgLf0BlBMsSk1PrUjLzAFGC
  ExagoNHSYR3Okiat7ggMbc4Mx0idYpRl2Pm17YDzEIsefl5qVLivOE/gYoEQIoySvPgRsCi9R
  KjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4JIFN4MvNK4Da9AjqCCegInwdzQI4oSURISTU
  w5bw/tjNdLMBdOM5Er0ZD+dnvw1GfGn7xbAm88/TVvRhNl+Sqaa37PcQn+EUctJ28963k2RN/
  +pgTFR9/v7Ktepb5huu2z7vO6zIK5p6/W67cKf3/ZOiu9p0TP6mbG7EXvv2mZqD8aam42uenK
  xusZxprnH5wL/nrOaNohfI70zS4VppUWYZ6LSsWevdmt2qUgMjuyrn3eNt4g9ckL3m+N2zi7q
  O3DulvTUh3Ebs53WDTWSatE5oSCofcq7evdL14maXrpfdPqbncz6V6Qw3PfWK3bIpXnjZr/e5
  0r3kRvV0uZxUbtbYYT7dY+eud/pebz5yrvC3O1Kn9eXwyqHeG2JMFWev3bLVyerNoVvTWICWW
  4oxEQy3mouJEAPxgAAFRAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-591.messagelabs.com!1654520463!384967!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11184 invoked from network); 6 Jun 2022 13:01:04 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 13:01:04 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BE0108B7D
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 14:01:03 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 957428B84
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 14:01:03 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 14:00:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] botan: upgrade 2.19.1 -> 2.19.2
Date: Mon, 6 Jun 2022 21:00:39 +0800
Message-ID: <1654520440-9439-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 13:01:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97429

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-crypto/botan/{botan_2.19.1.bb => botan_2.19.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/botan/{botan_2.19.1.bb => botan_2.19.2.bb} (93%)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.19.1.bb b/meta-oe/recipes-crypto/botan/botan_2.19.2.bb
similarity index 93%
rename from meta-oe/recipes-crypto/botan/botan_2.19.1.bb
rename to meta-oe/recipes-crypto/botan/botan_2.19.2.bb
index 4b072fc5d..5261367db 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.19.1.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.19.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=f4ce98476c07c34e1793daa036960fad"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e26e00cfefda64082afdd540d3c537924f645d6a674afed2cd171005deff5560"
+SRC_URI[sha256sum] = "3af5f17615c6b5cd8b832d269fb6cb4d54ec64f9eb09ddbf1add5093941b4d75"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.25.1


