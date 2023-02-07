Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0FFC636D6
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 11:19:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.80971.1675768758257777087
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Feb 2023 03:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RZd+IKGQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675768758; i=@fujitsu.com;
	bh=nJbZ11zqpCUcU5Q4rw9gnCl63kg6x+ws4x03P+hxNA8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RZd+IKGQTBzccyOSUBCZLOBCD6YaXmRpwULOzV8ns0BGPlZ82l2VrPwSc2/UQgk8K
	 mP/R5UIq132e6hVdKrX65Iv6iZmJsB78h9Yu3AGWa3zGshRrSzNb4HnDfqOPL21haG
	 52PFTT/5NQOb4vXweky+rsmbTtfkRKSrK9L2+yJB4hDsD0H2a3+SAz4pMrco4OkyPn
	 QEjB8flbdE7sbd5ZVEsT+s9V8oTWh7Kwx5bFmsKwajXSDEr4/H4c3HNCnD+9nqdTHc
	 bBsvWcEoYZFS1tV8abIxaJfFei/3LDASDaKv7DgCCS+osgal7boVNdu8J53FWKvzz6
	 ofiG7DDwmqCDg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSXeb8aN
  kg9UHhC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozra/4yF2znqni/dSVLA+Mszi5GLg4hgSeM
  Eo+bV7NDODeYJC78aWWCcPYwSsxun8fWxcjJwSYgJXHj/n8wW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICNxJ5bj1hBbBag+Pfr88FqeAUcJW7NbAWzJQQUJKY8fA9mcwo4SWz72ws2Uwio5sGcNk
  aIekGJkzOfsEDMl5A4+OIFVK+ixOzLzSwQdqVE64dfULaaxNVzm5gnMArOQtI+C0n7AkamVYy
  mxalFZalFuoZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5KXp5qSWb
  GIHBm1KsPHEH44rev3qHGCU5mJREee+rPEoW4kvKT6nMSCzOiC8qzUktPsQow8GhJMHrZQSUE
  yxKTU+tSMvMAUYSTFqCg0dJhPceSCtvcUFibnFmOkTqFKOilDivK0ifAEgiozQPrg0WvZcYZa
  WEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMm6AFN4cnMK4Gb/gpoMRPQ4hDVhyCLSxIRUlINTN5
  fjxpvKT8lEFNT9Mal7f//eWdSXgpdiukq2rt1UuFmQz6h0LsHfdzDHNw8tf5M+N8Z7Tjxc7fB
  AT69Q2Z1hxIntfxhYNq+PO9Prvxyidz88qmTrLTtdyslLNxyu23/7ImHToXxFExYL6iRVzzDW
  7Hf+6N/qoK79KbHog+TbzXUrt6z/PfOZIZp/js8JvyJ/ehy9UNchTOXm4xqDc+t+BjrI0V7z2
  ROKVyTZn+2I/LmwSlHZ3/MDkorUea/V3t1Qq/9vNwXxs+W+8svv/XZbfvm9XzllQavr71e7eO
  78+wjiy0JtmtqE8zU1rq9en1zpfqaGffClHZwPtb9dr7h+fczKz7Oyb+0tY5Tc8fmbwpKLMUZ
  iYZazEXFiQB6xi1dWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1675768758!371748!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3831 invoked from network); 7 Feb 2023 11:19:18 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Feb 2023 11:19:18 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0D7561000D5
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Feb 2023 11:19:18 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 015AE1000D2
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Feb 2023 11:19:18 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 7 Feb 2023 11:19:16 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ccid: upgrade 1.5.1 -> 1.5.2
Date: Tue, 7 Feb 2023 19:19:01 +0800
Message-ID: <1675768744-3871-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675768744-3871-1-git-send-email-wangmy@fujitsu.com>
References: <1675768744-3871-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 11:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100957

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add support of
   KAPELSE KAP-LINK
   LDU LANDI
   Sensyl SSC-HV Reader
   TOKEN2 MFA NFC Reader
   TOKEN2 Molto2
   Thales RF Reader
- Alcor Micro AU9560: Remove high speeds since they are not supported
- Hack for AlcorMicro AU9560 and Acos-ID card
- configure.ac: disable the use of --disable-usbdropdir

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/ccid/{ccid_1.5.1.bb => ccid_1.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.5.1.bb => ccid_1.5.2.bb} (85%)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.5.1.bb b/meta-oe/recipes-support/ccid/ccid_1.5.2.bb
similarity index 85%
rename from meta-oe/recipes-support/ccid/ccid_1.5.1.bb
rename to meta-oe/recipes-support/ccid/ccid_1.5.2.bb
index 42bc95772..0802e80f7 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.5.1.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.5.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
     file://0001-Add-build-rule-for-README.patch \
 "
 
-SRC_URI[sha256sum] = "e7a78c398ec0d617a4f98bac70d5b64f78689284dd0ae87d4692e2857f117377"
+SRC_URI[sha256sum] = "13934487e6f8b48f699a16d367cc7a1af7a3ca874de721ac6e9633beb86e7219"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


