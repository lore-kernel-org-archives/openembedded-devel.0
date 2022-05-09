Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67330C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 09:01:53 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.29785.1652086906839911158
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 02:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GeiTp9vr;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652086905; i=@fujitsu.com;
	bh=tw3V6N6p/JzI0uwccFAJUHCeBjjhejH3KRQYvJ+KwCk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GeiTp9vrWpzTC/lifmc1M7mTNKRXM58niD9f/8NnQ7cM2xISUMeRwvVzicjdQSPGr
	 g52bhB8UFsf+K6eKMlYa+d1h+MeZS6SCCeXSiFFFCIuEcj3zdQk2eS6LEsiZLAtjVU
	 ePXRGzWCKURrsr77xR7gGX6mTSjVR5zHbNdR77YefUjAEil2908ubCtujueaLi0Ing
	 3fuXJ32cqkzP6EfhrCm4BPmq7JcbaV/dv5uiEPaaB57WsFdhQYL7g0X/kpPfr0j4xq
	 362vyXeHYkUtQt+JZavYNUhUj8AThae8+j+az8gzZkQPFfnSUoJnukClfZqY49dbku
	 c5phtqsQSTP5w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MxSbfiRkW
  SwdNtxhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bz2qPsBS/4KtZ0f2VsYHzA08XIxSEk8IRR
  4uaC/0wQzgUmia27jjBCOPsZJc7cWcjaxcjJwSagK/Hix2IWEFtEQF9i6ew9zCC2sICNxLpr3
  5lAbBYBFYk9X7aAxXkF3CUuzNkAFpcQUJCY8vA9VFxQ4uTMJ2BzmAUkJA6+eAEU5wCqUZSYPV
  0eorxC4vXhS8wQtprE1XObmCcw8s1C0j0LSfcCRqZVjHZJRZnpGSW5iZk5uoYGBrqGhqa6Zma
  6hpaGeolVuol6qaW6yal5JUWJQGm9xPJivdTiYr3iytzknBS9vNSSTYzAIEwpdtq/g/Fp30+9
  Q4ySHExKorzrr1YkCfEl5adUZiQWZ8QXleakFh9ilOHgUJLg/QiSEyxKTU+tSMvMAUYETFqCg
  0dJhLcLJM1bXJCYW5yZDpE6xWjM8fHPxb3MHH8//d3LLMSSl5+XKiXOm3gdqFQApDSjNA9uEC
  xSLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5g0HmcKTmVcCt+8V0ClMQKd8DCgFOaUkESE
  l1cCk9Gb9bOn5KzTDbePtTnFFB9ltNlboENsZPfURtyWPee5fcdb8i2FH1ctckpU9TMOKUmbN
  nHgkYNr/BUeMfy1v3j5/kwszx8fGFTUvjl4x/2jxI72gT6LrxuzkcDGxMIFdZanT/76b95Tz9
  VfLzkO7BNlE/rsov/udWNZU+XN257+W6r26f/cUWMxaf+BYfk6a48ybdmuMJHgudM6fNmkJ2z
  63cyevnziV+28h65/0VxanVq0UVNF6U5oULd/ev/NRf2rmtw+Ct/7475c59/2DevfqJ1oCKT9
  0UxL7ltvFVzz8brvqyYW0lctL1k3ap57+86j1hWvlCn57r6351/KtzJvxzswNjl6hzu/kXZj+
  KbEUZyQaajEXFScCAB1b9dZPAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-528.messagelabs.com!1652086904!6683!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24328 invoked from network); 9 May 2022 09:01:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 09:01:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5402E10044F
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 10:01:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 462EC1000FF
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 10:01:44 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 10:01:39 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gpsd: upgrade 3.23.1 -> 3.24
Date: Mon, 9 May 2022 17:01:30 +0800
Message-ID: <1652086890-2773-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 09:01:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97016

3.24: 2022-04-22
  NTRIP 2.0 now works.  But still only plain HTML, not RTP, etc.
  Remove ntrip option and NTRIP_ENABLE.  Always build.
  Remove passthrough option and PASSTHROUGH_ENABLE.  Always build.
  Remove nmea0183 option and NMEA0183_ENABLE.  Always build.
  Remove netfeed option and NETFEED_ENABLE.  Always build.
  gpsd will retry ntrip:// and tcp:// connections
  cgps can expand to show more sats. Added --rtk option.
  maidenhead() checks for input errors.
  Better SHM logs.
  PPS and TOFF JSON now include shm used, and real precision.
  Add initial, untested, TSIPv1 support
  split debug messages into different syslog() levels.
  New ppscheck options, and can use /dev/ppsX devices.
  First try at TSIPv1 protocol decodes.
  Decode Quectel $PQVERNO for firmware version
  Decode Skytrak PX1172RH_DS messages.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-navigation/gpsd/{gpsd_3.23.1.bb => gpsd_3.24.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.23.1.bb => gpsd_3.24.bb} (98%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
similarity index 98%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
index 410db92bd..245f8728c 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
@@ -8,7 +8,7 @@ PROVIDES = "virtual/gpsd"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
            "
-SRC_URI[sha256sum] = "0b991ce9a46538c4ea450f7a8ee428ff44fb4f8d665fddf2ffe40fe0ae9a6c09"
+SRC_URI[sha256sum] = "00ee13f615655284874a661be13553abe66128e6deb5cd648af9bc0cb345fe5c"
 
 inherit scons update-rc.d python3-dir python3native systemd update-alternatives pkgconfig
 
-- 
2.25.1


