Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA90D44017
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:26 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.37271.1731922220514167203
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=adYdCOn7;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922220; x=1763458220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4yYQFwRnIpdiwXVLFVjMUtyXThAH0KNX68RaG8BitOY=;
  b=adYdCOn7znOBgFmly7Z0oYBD0+xrLUKucrnOxHLoXjcJoHaabZasCWR2
   mGTxsD/UNgorEuxwcCOiE8iC5WcMZ7++WXAduZ8Wj/c7N3om4TSxNO6JX
   ThtuEMjduihXdVlbEVzJZ2z6/xD0m/7UZ1ae8E+ZajAtC2PCQul4C5msS
   LJeYDbMSpFEy27HhIkgNKB5B7h7p8dleXj4u3o3TgJD3UiIDS8K3qGxSf
   J4wf0LCzhSQdoeil13PCWRwfqMRBZWy9RQG6bG8y0UAOvn8vNsNlhp39+
   KtDQVmDf1H9Cjr+u4hOLmtESaR+49XyYXvDyc2w15nPAwYbLp1PhS1YlB
   w==;
X-CSE-ConnectionGUID: OaObWVHKQ/Onvbkz54zctg==
X-CSE-MsgGUID: 0uFkiimPRfmueIEnsNMetg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="169137126"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="169137126"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:18 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 51BC196741
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D4D691664E
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DA70E368F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1A8071A000B;
	Mon, 18 Nov 2024 17:30:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/32] python3-sqlparse: upgrade 0.5.1 -> 0.5.2
Date: Mon, 18 Nov 2024 17:29:49 +0800
Message-Id: <1731922195-5266-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--3.778600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/+Aw16GgqpO8V9
	oG95QaA94CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2cwHSQ+yXjTDhV6
	JCMeHAxTi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFG5YE6XrDw6vya1vSPXTX4PUWk
	M5euibn2I3d3CXA44a4nmo9xLSBqnJYH/LDrr9ZHt4yw8B+/nvZUn73Osl3z58IIoyy3n0s+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113892

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- EXTENSION is now recognized as a keyword
- SQL hints are not removed when removing comments

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-sqlparse_0.5.1.bb => python3-sqlparse_0.5.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.5.1.bb => python3-sqlparse_0.5.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.5.2.bb
index daf67607f..a293b0bd9 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.2.bb
@@ -8,7 +8,7 @@ SRC_URI:append = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "bb6b4df465655ef332548e24f08e205afc81b9ab86cb1c45657a7ff173a3a00e"
+SRC_URI[sha256sum] = "9e37b35e16d1cc652a2545f0997c1deb23ea28fa1f3eefe609eee3063c3b105f"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.34.1


