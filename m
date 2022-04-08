Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D764AC48BDF
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.26334.1649658015857687963
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 23:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jr1+//NT;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649658014; i=@fujitsu.com;
	bh=uOOfNqx+IM/IJhOIMhL810ZJBSLy4I21PNzLfiX+PHk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jr1+//NTWq12s+U+coTvW1OcKA3LxhHeip9z1kkgZyETqEiAf4tL06YLkqS8Nw+Rx
	 oL3intdB14rI2hZKxs07fHo8oRoTDQYj2O6I/Z4GfpnliDWgIw97kYVKSke4wWSliJ
	 r1ZkJgD9Dwz7sCtFz4ElHCb7obgzUH1/GktzY28obVfEagk0kU0fyW7uwQZDX5r5kX
	 FFzXHtELSg/tmtCQMOBaLHfxVjJRhBfBQKnvpAfK0HoNlR1omSOATP1Ko5rDyoLfbv
	 D3Txm0TPOwh46pt1VL9UZHBKehe7prs3xV+G1aKaPOQ8ZvxBPOTN1tuOps0HJUiPjW
	 wyks+rPdPS2Ow==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSXfuieA
  kg8vd6hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b1aw/YC/q4Kw7vnMfawLiBq4uRk0NI4Amj
  RENPeBcjF5B9gUmi5dB6NghnD6PEuX9nmUGq2ATUJKbfusEKYosI6Essnb0HLM4soCLx4ncPO
  4gtLBAncWDJPrA4C1B8xaovLCA2r4CTxI4tC9lAbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy83s0DYFRKzZrUxQdhqElfPbWKewMg/C0n7LCTtCxiZVjFaJxVlpmeU5CZm5ugaGhj
  oGhqa6hob6xqaW+olVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgSGZUqx4uYd
  jBNX/tQ7xCjJwaQkyhu8KThJiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvzTGgnGBRanpqRVpmD
  jBGYNISHDxKIrzqB4HSvMUFibnFmekQqVOMxhxXr1zZy8xxA0QKseTl56VKifOqHgcqFQApzS
  jNgxsEi91LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5p4NM4cnMK4Hb9wroFCagU0K3BYK
  cUpKIkJJqYCrgbrtwN+ObTJ5l9Zu5Vhsda1xW53BrbkjV5qm6mdkU66FX/qrmS1D274/zeky1
  LXdYlk3/m9cUtEmYQ3iSjZLJVAvHf/Nvs5xJnVv8aWUX7z2mOXx9HWf3/KjZUb9aw8yEJbml8
  KPAvZJP5w0MNkzn2nY5ISJ9WqrJkVvrSozrrI3qXbYscrXcUq32YIntMjFmbssXj4XSt8Z9ry
  tYc/zkqe0nJy9wEs2/MUP2Vs7NLReK7zxLqZadE3W9bwpjWEcU18658yyrK4Uv1LsnZE4oXeV
  4/pfJJtVT7bxH38v42/Is8J9R/8eJS1Iu5PTRHeXaiYrHsuf8f71XpmeeHa9to02Q34F7AbN3
  Fc/VUGIpzkg01GIuKk4EAND1IoFYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1649658013!113670!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 331 invoked from network); 11 Apr 2022 06:20:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Apr 2022 06:20:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3F800100476
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 07:20:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 30FE210044A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 07:20:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Apr 2022 07:19:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] broadcom-bt-firmware: upgrade 12.0.1.1105_p2
 -> 12.0.1.1105_p3
Date: Fri, 8 Apr 2022 21:16:30 +0800
Message-ID: <1649423791-29819-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96545

Changelog:
==========
Fixed #26 (unable to install RPM pacakge), updated documentation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...12.0.1.1105_p2.bb => broadcom-bt-firmware_12.0.1.1105_p3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/broadcom-bt-firmware/{broadcom-bt-firmware_12.0.1.1105_p2.bb => broadcom-bt-firmware_12.0.1.1105_p3.bb} (98%)

diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
similarity index 98%
rename from meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb
rename to meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
index e135b05c82..f45ea5e4a9 100644
--- a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb
+++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
@@ -10,7 +10,7 @@ NO_GENERIC_LICENSE[Firmware-Broadcom-WIDCOMM] = "LICENSE.broadcom_bcm20702"
 
 LIC_FILES_CHKSUM = "file://LICENSE.broadcom_bcm20702;md5=c0d5ea0502b00df74173d0f8a48b619d"
 SRC_URI = "git://github.com/winterheart/broadcom-bt-firmware.git;branch=master;protocol=https"
-SRCREV = "1af1116f73782951bd7bbe2139928e497c3a634b"
+SRCREV = "68a7a8a4f2c4bdd3425c23653a3b9b6609e41d0b"
 
 PE = "1"
 
-- 
2.25.1


