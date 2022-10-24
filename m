Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2176C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:38:55 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.16430.1666593525623324952
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ND3m4soS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666593523; i=@fujitsu.com;
	bh=IgWiN5arUBaj9QiRyEbXDyloqlxUUJPi3pevHKIejKw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ND3m4soSDW7OEJ+i0siL0xAjDale81WRekFIO498YG9cE8ZQcyC2gtQNIBTXKLouD
	 YEAhl+RFJXD6MOwNHmzO4QIxcYyGUgFPj1DZItS65KyQnI5BPHRRvSd1nMmx3xOyrY
	 1UPau9dXr18ctr+qx/InbKR0yoSqzGGcItTSAL9+f/WjqoBzyelnAGiTluf1WsMEqF
	 umV6UI66vtAHPqoA6edg65UrGI0tJ36G6EMqWQyzrJTepAkKaIoL8f9JREsydXrsxe
	 RUzPm3ynLMlJ/5ND1bmt76a6GF3Me3drkz2NHWM+aVmJfWqZMK4q9LKyjijfqwOCM0
	 bgoNPC6mMFTyQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxSfezUVi
  ywfFf0hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a+hZUF6zkrHna3szcwnuHoYuTiEBJ4wiix
  b8l8ZgjnOpPEg5enWSGcA4wSd1ousnQxcnKwCShILNx6hhXEFhHQl1g6ew8ziC0s4CVxfNJRs
  DiLgKpE2/xmMJtXwF1i7aoJ7CC2BFDvlIfvmSHighInZz4Bm8ksICFx8MULoDgHUI2ixOzp8h
  DlFRKzZrUxQdhqElfPbWKewMg3C0n3LCTdCxiZVjGaFacWlaUW6Rqa6CUVZaZnlOQmZuboJVb
  pJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEhlxKMduqHYy/lv3RO8QoycGkJMrL
  IB6WLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCt0YLKCdYlJqeWpGWmQMMf5i0BAePkgjvM0OgN
  G9xQWJucWY6ROoUoyXH1Nn/9jNzLAeTM7+2HWAWYsnLz0uVEueNAmkQAGnIKM2DGweL0UuMsl
  LCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlnGwBN4cnMK4Hb+groICaggy6tCAI5qCQRISXVwGS
  16ahW/1fp1xdElbL8AnviFmW9WJBtWb59goNS08lJKx7sn3LsyiJ+/2hloU9zV38Oi/v657Jw
  jbfoTmV5IeUdWf8XOS0yabaYrMywJfvS4do7c2c/X3XP+XSFa8i5LR0fOp7kxRlYv1/SV/rV0
  EQs62LQxBVnWNzudjqzl25lKg8+a7v4qmza8vopxycv4V1eP1NuY0prm5iKuOmrOxIcS6J6y5
  +o5ZjeruNz/uqz6qWj0uavLYrfj/4IiFIQP32jKeObY7Wv72dG5y1TI1lM1lmK/vggdNV65k8
  3rkNH77Xueac6ZfLEX3Ny5tWt2cL33WDCv423DBgqUwM3Xw09na5vrWH4wnndKW4BoQtKLMUZ
  iYZazEXFiQC+DbzMTAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1666593523!250586!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27904 invoked from network); 24 Oct 2022 06:38:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:38:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1B5D01000DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:38:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0E4951000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:38:43 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:38:41 +0100
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-xxhash: upgrade 3.0.0 -> 3.1.0
Date: Mon, 24 Oct 2022 14:38:33 +0800
Message-ID: <1666593513-2652-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99272

Changelog:
=========
 Type annotations.
 Enabled muslinux wheels building.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-xxhash_3.0.0.bb => python3-xxhash_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_3.0.0.bb => python3-xxhash_3.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.0.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xxhash_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_3.1.0.bb
index ca8ed3b01e..bb7bdd3141 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_3.1.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a9dab7f159514231249aa3e108ab26b"
 
-SRC_URI[sha256sum] = "30b2d97aaf11fb122023f6b44ebb97c6955e9e00d7461a96415ca030b5ceb9c7"
+SRC_URI[sha256sum] = "ac21b1e21dc6fdfee9a57b53f4777539d53a84f2e1546a3f802f159f9966bdc1"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.25.1


