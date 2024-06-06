Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354F5C41513
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.9826.1717664817018311523
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g96YGUWA;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664817; x=1749200817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+fh8GAI61LtfN6iGkhgQVX8NfIS5pQLxwlU2Amf05oM=;
  b=g96YGUWAcimSSDTVtvkN1hToA+Xb/8y9dR2Grr8zbGux23jrRk9/87a3
   jF2lU1CMiHvs3K3puaWUU2gU7ejlPBTWKsdZTlg/yvnzKuL2oYMKcIZFD
   oWq2Zfg0O45V4fkAArFUohBYb3NpEWioI90+HnD5uhhGy5DxFyV8Y6MKF
   AHfvXsoVUAS124d13bTBrLgN/JUakfVwadlAZ5a98+nf+bi75mIFcMkFz
   8ar7q+Lye0X2kVL1z1xBvanrIyNucJM4fSqoQYSX2I2pnrhxoAGeJGJbT
   VD0FEMrG0l/Tz1vQHtKWcr+/CmPle71iurNI9P9SDhp4UiF8eS5SEUEHv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="150175841"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="150175841"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:55 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 71911D647E
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B6751D72A0
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 54EA9E2B12
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 02CC11A000A;
	Thu,  6 Jun 2024 17:06:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/36] hwdata: upgrade 0.382 -> 0.383
Date: Thu,  6 Jun 2024 17:06:11 +0800
Message-Id: <1717664795-13902-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10-0.353800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTJDl9FKHbrkwcMedHxxRAtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJon585nKQczq746cXaPycFZvzWEMQjooUzWAN6i+va16ukWN
	Ccn0XQOLzflyoTkWhRYAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzrBU3HHisLK2p63
	5AcC12krjWtXuKGJ2sSe23GlKnMkKx2+bTsrdHHX/nAwRGQ0ns5bW+DNhBeKwRmrZpH0dLG2sd2
	pf1zYCliB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110720

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Update pci and vendor ids

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.382.bb => hwdata_0.383.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.382.bb => hwdata_0.383.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.382.bb b/meta-oe/recipes-support/hwdata/hwdata_0.383.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.382.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.383.bb
index a2bb7a334..cfa6ae0e4 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.382.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.383.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "94b82b56d6ee7c7ada381b3b02fecfca4ff7af1c"
+SRCREV = "229069b51b488bc776602d82315188cd1fbf4887"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


