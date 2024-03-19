Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F93C54E78
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:26 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8148.1710827176933255811
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nCNkjXlY;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827177; x=1742363177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=q+XsLOp6ofGfectBC0gUc57HuioVYTxDQHTDjQRDU80=;
  b=nCNkjXlYJBdeQH2i1RE5rpCywOYG5n2+Q4NM3asGXcpLipNiCDKIb8oc
   F6YLu7Zw7eB2Nry6kIud9sYzPniBg6vuYS5EzI2FO45HY6RijR3bVmI2H
   pAqlhyo6+jcGtwywaceTAwW00AubHma2LvIUcpMmjuk5B9HQPzQsC6SvZ
   XXeVcodcuVyGKf9N2CbInbtW+9qhlxld1oD9RvUyRzsLJOBNkUB9JzkCv
   GG7w7vfHbocMj0amL4xL+O+eP4MuL0CEHsW5F5jj7bJxgXAsJv2Jjbyty
   u4iPp1Qu2LULs/TMYQHQJ7c1fxkjMkOYAX56ky5UcTd1dwHq6edY5cRqP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="141150142"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="141150142"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:16 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 724C7D4804
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6267130D9D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E7F5A21BD45
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 90EE91A006B;
	Tue, 19 Mar 2024 13:46:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 08/50] libdnet: upgrade 1.17.0 -> 1.18.0
Date: Tue, 19 Mar 2024 13:44:57 +0800
Message-Id: <1710827139-30056-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-2.491900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrUHn9z1BhYYmU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KVzuaHY1N40eUA6J
	UWkXudIl/AGK4wInBMi5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO28bR
	Ued1HGArwzK5Ko32ZcyFl07KXoxLTgU807JnujSqrH/xRhPu3MRQ47lY5PruXTn+MprpvNULLNw
	fYJF31Lug6nnQGwctUkynrryLxb5fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109428

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-update to autotools build chain
-rebuild Python bindings with latest Cython

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdnet/{libdnet_1.17.0.bb => libdnet_1.18.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/libdnet/{libdnet_1.17.0.bb => libdnet_1.18.0.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.17.0.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/libdnet/libdnet_1.17.0.bb
rename to meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
index a42d014f6..75aaf521c 100644
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.17.0.bb
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
 
 SRC_URI = "git://github.com/ofalk/libdnet.git;nobranch=1;protocol=https"
 
-SRCREV = "912f7848bfff4ebc6d610f802a3144f84880cbe4"
+SRCREV = "3dfbe889b1f65077efe579da34fc1d6819fcb7f3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libdnet-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


