Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76187C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:46:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.17462.1707209155923170612
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kGiLWCan;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707209155; x=1738745155;
  h=from:to:cc:subject:date:message-id;
  bh=WHqKBTyo9VXaelQWWLoZXwPbyvhRTFJIrI6yZP5PLfQ=;
  b=kGiLWCano5ZNOchZCyCeVvpc0pBbQgnE7yWjUWyJKXIOPyuHDa17TY09
   KCecH3FgMOuekU61Acp/hcNbWxMRrd8AGYHQjd2Mrdx5v7pSOaGqSfwyX
   AK0vdKyFEypevmDNXeun88lzJlBmZdFaGxn+2zMpAZzsdGWz/TzwfoVGj
   a3HZlSO3qhHZCm8Sok4H7iFzQc/cfJc9m6Iqs5nVbuNeDEqsvV0RWdwrl
   tShn7vuXyhL62XQyq9d73cC++FnDbjPv0TC4gGMWm6ZRZYZTbGvstOPMz
   OQMEptpJOImytlhF7WRKcYDkf7jnng8cyl4Uwb6TZlJgTzUH7uXirk32y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="136989478"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="136989478"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:45:53 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C5A2F2697
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:45:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A596AD4BDA
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:45:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 46A1EE20FD
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:45:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F1FA71A006A;
	Tue,  6 Feb 2024 16:45:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gspread: upgrade 5.12.4 -> 6.0.0
Date: Tue,  6 Feb 2024 16:44:05 +0800
Message-Id: <1707209045-5919-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--1.026300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzd54B2zeEOCLW8E
	A4eVJDEH2t7O+tcmbNTqya2yxWO3ATDK9LdcrF/wx2koRg+apdHD4XWLbHcUzdLL6Sxf8ht23AM
	7iMtH31iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108616

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/burnash/gspread/releases/tag/v6.0.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gspread_5.12.4.bb => python3-gspread_6.0.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-gspread/{python3-gspread_5.12.4.bb => python3-gspread_6.0.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.12.4.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python3-gspread/python3-gspread_5.12.4.bb
rename to meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.0.bb
index 920ff4d69..c04b1568b 100644
--- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.12.4.bb
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/burnash/gspread"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
 
-SRC_URI[sha256sum] = "3fcef90183f15d3c9233b4caa021a83682f2b2ee678340c42d7ca7d8be98c6d1"
+SRC_URI[sha256sum] = "3b5efe315aeaa290d21befc8ee7bb0239db78c7b495d8831ae29fd1a182292a1"
 
 S = "${WORKDIR}/gspread-${PV}"
 
-- 
2.34.1


