Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED8BC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 00:26:59 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.4756.1644280018720820831
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 16:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WtqQJo6v;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644280016; i=@fujitsu.com;
	bh=soSis8hzKHc9aIs+3G36N8UmJ4ahE+tLO1arp5neuS8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WtqQJo6vlUFNEmqKArj8T9n+Hr+QdVrG9Zs0EM6ySx7QfodnA8Ipcw2iVtVao3oIx
	 IVapZ3QtFk5EtmKA8jrncdEnznig0xM2nCehCGiuyRuZj2UF5rOm+iJ4haEihqEG/e
	 zlgtfQinDZn5solyHIjZ7nUVILSDN75z4bbRRM2ccjTcCJzafn7rTNFVpMj+hCN3R+
	 a4DAt+WyEC7uqp8nzHQyHy8X38avVI6P7fMwbBbJubNtofU2s42vTx+Z3vAx99Kfrp
	 2bjfT4mez//ttvaJ9fu929GoQGJNUvhlNzcAKyDDGtmfNuofZAU75PWYih+V/p9/aO
	 dZ+H8Pr8SZKGA==
Received: from [100.115.34.36] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 04/72-22205-0D8B1026;
 Tue, 08 Feb 2022 00:26:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqHt+B2O
  SQf98U4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP5G76CvXwV72ecYW9gbOTtYuTiEBJ4wiix
  b9FrNgjnApPE5Y7dLBDOcUaJY29XMnYxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAp8WDhBrB6FqB4243XYDW8Ao4Sixa9YQGxJQQUJKY8fA8VF5Q4OfMJC8QcCYmDL14wQ9
  QoSsy+3AxVXyExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjdVJRZnpGSW5iZo6uoYGBrqG
  hqa6xpa6RgYFeYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJJkZgWKYUq5/Ywfh0
  5U+9Q4ySHExKoryZ6YxJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4z24HygkWpaanVqRl5gBjB
  CYtwcGjJMKrDZLmLS5IzC3OTIdInWJUlBLnNQVJCIAkMkrz4NpgcXmJUVZKmJeRgYFBiKcgtS
  g3swRV/hWjOAejkjBvA8gUnsy8Erjpr4AWMwEt/rroXyLQ4pJEhJRUA9PZH18a2qdH3FN6E2N
  /fMrTPY5bQz0PhER+yvMJdPcp/CS365+RlfHfzb4X2/6aq96ulfol7WnXtOdHjcBcLwuV2/y9
  H22OW2v+Nj9Y+E5Ua6Xftrmthqdlwte+NauQfdJz94KuQRS79VW7A9vXC35bJfCsNJBLYoXHx
  oM637zdHIN7u9bs4W1Q2xwltX/2mTUTz7QXXmk4kPgs3ai448fKL2xmCw/2Jdn1ubduMV+it3
  D7Kn1Lu59BGybnHakVi+N5ee/Tax6l4O4HElXNb+U9UpTnBrNVcQSfu7W1N2T/qnkT4o22hmZ
  nCxzwuj0/4teJy/XcMv+OzObgZPzSlnO96PZS97lO+2aFCVg0vVdiKc5INNRiLipOBABS0YqE
  RgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1644280015!41998!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13646 invoked from network); 8 Feb 2022 00:26:55 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 00:26:55 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 795FA1001A7
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 00:26:55 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6CC3F100192
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 00:26:55 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 00:26:33 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] tcpreplay: upgrade 4.3.4 -> 4.4.0
Date: Tue, 8 Feb 2022 08:26:25 +0800
Message-ID: <1644279987-4303-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 00:26:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95256

Changelog:
=========
Update strlcpy.c and strlcat.c
PR #636
Apply #616 fix to flows.c, fix #665
Bug #670: update Travis CI to focal
Bug #669: LINUX installed netmap auto detection
Feature #626 - Support for Q-in-Q VLAN tags
Bug #677 skipbroadcast
Bug #689: add security policy document
Directories of pcaps as arguments
PR #682
Bug #679 fix PPS calc for long-running sessions
Bug #668 Improve SDK selection
Bug #696 fix directory include feature
Bug #695 mac os tests fail
Bug #674 - Revert "send_packet: Avoid clock drift by using time since first packet"
Feature #563 mac update on multicast

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tcpreplay/{tcpreplay_4.3.4.bb => tcpreplay_4.4.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.3.4.bb => tcpreplay_4.4.0.bb} (78%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.0.bb
similarity index 78%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.4.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.0.bb
index eda51bb7f5..48cb045767 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.0.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "305a84d84265705bd28f148698142188"
-SRC_URI[sha256sum] = "ee065310806c22e2fd36f014e1ebb331b98a7ec4db958e91c3d9cbda0640d92c"
+SRC_URI[sha256sum] = "a3b125c0319bd096d68f821c4a08051b2d3d9278bac6fe18cfe3c9201703a567"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 
-- 
2.25.1


