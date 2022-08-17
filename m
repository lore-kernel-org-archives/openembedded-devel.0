Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB53C25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 03:01:02 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.24882.1660705253738632021
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 20:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MGS0PVbe;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660705252; i=@fujitsu.com;
	bh=6HV6qyoESdM1ApLyApgBJM6zp0Lybf4PyXNbdSyc8PA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MGS0PVbeR0PiUQ5mGcGDcAwqqQZG5XmWF9sycgjjeKxM8N+YevA5jxNC07yYXJX5+
	 2+WL2sEhh84aQE7pyxyOwJK5t+JUjFJRpf5uAUf/OPVQMkTw9GnIASN6LosCcZC9Tx
	 CwsjatskqrNQBeXA53OZg5gVVI2H78b2OErrhtbhrSKbn1JsbifgK5xpHfUu4wjpfA
	 YFYlu7zpCz0QNSBuOUR5lN7UK1FrM71aka60qpdhZmaPAUAIssBbMKosh4OQVuCKXY
	 kbi49wy1Ya5bp5Be4oOKOwOoJHb/jsNxSIFaTYH0E5xaMFcnVOfHEqbxO0zLpNXces
	 X79nah2xMTVbQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8ORpPs48k+
  SwcHNahYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bDDz/YCto4K+Z9e8rWwLico4uRi0NI4CGj
  xMTNF1kgnCtMEp/3zWGDcPYwSsx9sZG5i5GTg01ATWL6rRusILaIgL7E0tl7wOLMAioSL373s
  IPYwgKeErdPfWUDsVkEVCW27/nNBGLzCjhJPNu4AqxGQkBBYsrD92C9nALOEucfNwPZHEDLnC
  RaLtVBlAtKnJz5hAVivITEwRcvmCFaFSVmX25mgbArJGbM2MYGYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWiZVJSZnlGSm5iZo2toYKBraGiqa6xrYaaXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYwinFzGE7GP/0/tQ7xCjJwaQkytvP9CdJiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgTvt3CgnGBRanpqRVpmDjCeYNISHDxKIryyAUBp3uKCxNzizHSI1ClGS46ps//tZ+ZYDi
  Znfm07wCzEkpeflyolzvvWB6hBAKQhozQPbhws5i8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52B
  UEub9DnIVT2ZeCdzWV0AHMQEddOzib5CDShIRUlINTMKpkvP9iz8+ur/5aPsElXpphoUss1cc
  OlC0q+1Fj9e+9zt6hP4dnzP5rmy3827/4ytW2MxZsfHu2qizPxR+Nnh6dG89LcKbUOrDquJ0y
  Oi/2ISjQrEGDF1cAj5tt2b7Ppl6Z9UktT/W++N3/1kZekdra45WLaf6/YWPXH+HfUpl8WVxNZ
  z/RHrB/2PB5gUHLqg2zrUxyIzOOB1zcmqG3+ItbEynw/84H83qfWSROmXZPj27W7KZm/ziFhg
  WxXsFXfk/1+tRZWDemVlrxLlVCrqfxCzcazxX8txpYxYt/u2RKSe5zIpsueNzrhXYRSix6Gk4
  Ht75aGFn0SGhzVHsJkazLc+us8yd+2N+8q5T55RYijMSDbWYi4oTAXdzbn10AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1660705251!1187454!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 915 invoked from network); 17 Aug 2022 03:00:51 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 03:00:51 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4578B1AC
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 04:00:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 399C91A3
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 04:00:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 04:00:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-yappi: upgrade 1.3.5 -> 1.3.6
Date: Wed, 17 Aug 2022 10:59:42 +0800
Message-ID: <1660705182-17300-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660705182-17300-1-git-send-email-wangmy@fujitsu.com>
References: <1660705182-17300-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 03:01:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98285

Changelog:
- cibuildwheel integration

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-yappi_1.3.5.bb => python3-yappi_1.3.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yappi_1.3.5.bb => python3-yappi_1.3.6.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.3.5.bb b/meta-python/recipes-devtools/python/python3-yappi_1.3.6.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-yappi_1.3.5.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.3.6.bb
index 9b08f759a2..2f24443194 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/sumerc/yappi"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
 
-SRC_URI[sha256sum] = "f54c25f04aa7c613633b529bffd14e0699a4363f414dc9c065616fd52064a49b"
+SRC_URI[sha256sum] = "0a73c608a2603570a020a32d4369ba744012bc5267f37e5bd8026fb491abba56"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.25.1


