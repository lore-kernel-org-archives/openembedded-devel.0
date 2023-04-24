Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A147C77B73
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:21:59 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.42786.1682306509922091098
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SUgTM1Cl;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306507; i=@fujitsu.com;
	bh=01h6fldkULyssDueQyh6vSpfRMOUP6ogQoVOVZUV5sY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SUgTM1CliNfZXlauVO7ZOH7nsWxA2EZuwapnnErl10D9DagSmYGJgFNnFgYRZBiVd
	 4pd5BeDa1MEpEJJc7wrTO/1QRC+RQXsOSQ5OcKwwU0aMgmhRYqAEWrQy2HwO7i8Pkq
	 UMaQRGRP2ioUmVjRlUvOEbLsDg8d3Pz4T3zSUWO425bniMrrS2kP2R9eVVusYavQQt
	 00j/DpifzNPIakg63wXUzRjeIarFXkp848fKYzRM+2DIHRXub2xeFjfzl5ouaqOKbC
	 GBJlsP09UXm8IJmWNL8Laj1vteplmLdbO+YVUej5ua6HNz5Y5NgtaPrwxUbP/h9Dh5
	 YvdeW675xem3g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8OxWffUV9c
  Ug6PPzCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyVxz4zFTzjqXg86SVrA+M+7i5GTg4hgYeM
  Eg3LUiHsq0wSLYvUuxi5gOy9jBITVt5hBkmwCUhJ3Lj/nw3EFhHQl1g6ew9YnFlAReLF7x52E
  FtYIEBix8a3LCA2i4CqxIsbj4HqOTh4BZwk1u+pBwlLCChITHn4HqyVV0BQ4uTMJywQYyQkDr
  54wQxRoygx+3IzC4RdKdH64ReUrSZx9dwm5gmM/LOQtM9C0r6AkWkVo1lxalFZapGumV5SUWZ
  6RkluYmaOXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFlbnJOil5easkmRmAgphQn2+1g/LLz
  r94hRkkOJiVR3iUbXFKE+JLyUyozEosz4otKc1KLDzHKcHAoSfAWfXJNERIsSk1PrUjLzAFGB
  UxagoNHSYR32RegNG9xQWJucWY6ROoUo6KUOG8gSEIAJJFRmgfXBovES4yyUsK8jAwMDEI8Ba
  lFuZklqPKvGMU5GJWEeSU/AE3hycwrgZv+CmgxE9DiXdwuIItLEhFSUg1MXmeV7P49YpgndV3
  E1ML/xNYNN0PtC6xnPXmUtHGJpZxJ6evtjcuC5m3dxzynJUtn8V1NR683PuH3GjZ0qL47suSQ
  37lXkTvfhM+PyOifoM7EcpfhQbR2VVLlpkJe3a2yau5ST15t8jzAeqvmow/jxJfhJrcXbVL2T
  4vo11g9rVXWP6p/xly2rOWTWx9FPbmU8T1usqyU4fIT6o8MDkz2TDhvuKz8rXMAXz3rNd2Kt9
  5nNkjum9Hxc+Z2dSuLajuLNLU9AoFLy8NCpEWLOg9y51xWO/60WPB4nrvQ9esfzY9Yr65799H
  X79uTRB/91ptnGCY9cLzjvvL/r93l2w3m1Ql3PMudc9qaXZTzt9BtJZbijERDLeai4kQAIRNV
  LD8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1682306506!290213!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17014 invoked from network); 24 Apr 2023 03:21:46 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:21:46 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 4838E155
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:21:46 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3B6C6142
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:21:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:21:44 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] networkmanager: upgrade 1.42.4 -> 1.42.6
Date: Mon, 24 Apr 2023 11:21:23 +0800
Message-ID: <1682306487-11783-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102154

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Emit the dhcp-change dispatcher event also after a lease renewal.
* Fix assertion failure on DHCP renewal.
* Add support for EC2 IMDSv2 in nm-cloud-setup.
* Allow setting tunnel flags for ip6gre & ip6gretap connection
  profiles.
* Improve the Wi-Fi hotspot functionality.
* Fix setting the Wi-Fi roaming policy based on the number of seen
  BSSIDs.
* Support the "no-aaaa" resolv.conf option.
* Some oFono fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.42.4.bb => networkmanager_1.42.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.42.4.bb => networkmanager_1.42.6.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.6.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.4.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.6.bb
index 5ff90be22..31687a30b 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.6.bb
@@ -31,7 +31,7 @@ SRC_URI = " \
     file://enable-iwd.conf \
 "
 
-SRC_URI[sha256sum] = "86ee16a2f7f525629133fa0c3dc060caf96ae4f34084eda1c24551951abe5a3c"
+SRC_URI[sha256sum] = "8c388ac3775ac6bceb605fae21be2c3e261cafe6067994a89f0dfa4610ed0279"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.34.1


