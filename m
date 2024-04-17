Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BAAC071DB
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2754.1713318085926072046
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JOsZo/ER;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318085; x=1744854085;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wPuN2aYhKy9M0e9zafDLUHgLCcP2Q0+YTcx+4zKkDuw=;
  b=JOsZo/ER8jeGK9xHxvUs/skfVXyrOIxODo8rkw98n1XARDPAAhLFZi0L
   Ushq8+4wvrSs1bqsj0i3Gy7c3yhxqwoc2pAPCu/CKnzajpyVBaRHlh/l3
   EbllRLS3O+lt8qVVVz1CNSW3hOJB3OEOSn/DNLXlZe7rFHvj2I/U7fa77
   8z33U31SSSEYZiJS7rL8PbZLjFbLM5Qj8v7sYVuVOwyBj7/x+S3M+/DU3
   tykbtToSIs5BPR8YUI9ppkJfjjTBE0BrIAAB3MNM35cytezi3nYRY/Uu+
   ZKmYjsfmH6NU1xTQhV1S1ITJANSG6DaLxcA/fLMt3xdrwT3vmp82FpL6W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="143393367"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="143393367"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:23 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 41FE7E9604
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B9E91660B
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 03BFE6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A57441A0002;
	Wed, 17 Apr 2024 09:41:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/49] hwdata: upgrade 0.380 -> 0.381
Date: Wed, 17 Apr 2024 09:40:21 +0800
Message-Id: <1713318061-17128-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-0.353800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTJDl9FKHbrkwcMedHxxRAtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJon585nKQczq746cXaPycFZvzWEMQjooUzWAN6i+va16ukWN
	Ccn0XQOLegKf/r6b46i5rYfHE0OO95UcZtwNsCroURSScn+QSXpjDMT0TyDk5+gtHj7OwNO1FwN
	IqCPogbUkBAF+9y/ce1jjY9+Xg8wJODJLkdNWOrzwrME8CoyN04OiOEkXKnTgmX9AtWdjB9ijuW
	0Kavtf7DscsKtQp0mCg33WVKhDanvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109995

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Update pci, usb and vendor ids

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.380.bb => hwdata_0.381.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.380.bb => hwdata_0.381.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.380.bb b/meta-oe/recipes-support/hwdata/hwdata_0.381.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.380.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.381.bb
index e9b5afe47..291b27372 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.380.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.381.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "d0cbfddb1fec4bb1a395373396c972e5f210bcf8"
+SRCREV = "4463530857af32d9dbfcfa9939c2304b51e5e58d"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


