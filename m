Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9745C77B7C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:50 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.8560.1685518840418269184
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="106992310"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="106992310"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:37 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A8C71D29EE
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D374BBF4B6
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:34 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5812568957;
	Wed, 31 May 2023 16:40:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] evolution-data-server: upgrade 3.48.1 -> 3.48.2
Date: Wed, 31 May 2023 15:40:02 +0800
Message-Id: <1685518820-20028-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10--2.166900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrG24YVeuZGmMBpn1EQkoCQfMf
	SlQesyLe3eSQrynh0LU+bQJZ4PBQd8RBLZ5x+SkXTuctSpiuWyU3l2plwgrtWCD1HdXyqDnERBg
	61kSK4DiBkESMI05d4jMuZ8ZjqIORtf5fXQXsAq7dCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtRGVxND3lu3zfMe+101JrnjDOalG2w7S3bX+Rw5fP4zw4V7STKXsL+LFNA
	elp+qbHDxUxo+L2XffnAD3iT5GtJyqGOmpqzXCbHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102908

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Bug Fixes:
  I#474 - Camel: Set proper S/MIME signature verification status
  I#478 - IMAP: Cannot remove labels added in Thunderbird
  I#479 - WebDAV: Fails to discover iCloud address book
  evo-I#2345 - Wrong S/MIME certificate selection for encrypted email

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 59d3b5a294..9f113df403 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "5ce62c1e67f2789342a7f4a035b102f74e62ed85f60e81a5b7f3e04165404dff"
-PV = "3.48.1"
+SRC_URI[archive.sha256sum] = "1f3243df12b4f1d3298c9977d6221a6565fd279efc984e1ccf255245d04cffd5"
+PV = "3.48.2"
-- 
2.34.1


