Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1317C54757
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8719.1724833541946562947
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JrC0UXjj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833546; x=1756369546;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=v4+voVE/VksJ2D9JuRNh8IVkB4WsTfz5VkuJc8hNwqs=;
  b=JrC0UXjj83x2aHBpRimzUyxGMX3WmgjfRiAhjUzCUCo+LWyNXj9BkfBD
   Uoayuj2xXjI1zfX1bNBXOLjP1TJT3NG/VZyO45HpQ11Fp5NZSqlEX6WtI
   yCHmP9Xjk0ACqp+yrnHrvsGOIXQEYoWg3oyizXLeAxlcaezI+6gdCDv4+
   UpvjMhov32LlPJyrqYPVOsG6iQhf7wSqxIsY7EPNwm7vGmL4rkTqbemdn
   kZeOG4Ln2dLwsLNr1XFOkBEg8OBuUply7vpBgvxxFwPmVktySarDdOI2T
   J5lzzkdaz4XIVi0uubAexLK27vT8LOutHZSvAHwFGJI9pmzQMkO0UHMqZ
   A==;
X-CSE-ConnectionGUID: Jkf5ZGGOS5WJQxUX7nyagg==
X-CSE-MsgGUID: MWo+mwXnQVCZlgO9py1ZIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="172039569"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="172039569"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:45 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 43C84D64AF
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 76E49D4BF9
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FC9F20079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AD1121A0002;
	Wed, 28 Aug 2024 16:25:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/46] python3-aiohue: upgrade 4.7.2 -> 4.7.3
Date: Wed, 28 Aug 2024 16:24:58 +0800
Message-Id: <1724833525-2162-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--6.895400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/Jt7aD46KTuwYz
	GYtVtarBMyGUfnyOo9Ty9zcRSkKate1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWdkA+xaE9xZg+xMERr0NZeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNQFJ3oetKKrRCQ7iP8E2DbtbUF88Wn5JxN71Ng0/3n/veOV13lLQj20=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111994

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Remove use of deprecated last_event for button events
- Add missing sunset timed effect

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aiohue_4.7.2.bb => python3-aiohue_4.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.7.2.bb => python3-aiohue_4.7.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.7.2.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.7.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.7.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.7.3.bb
index 57c40bdcc..bc4e4016f 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.7.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "8107f6fa9ad06eb91aef987a68bea7d3450510a433aed3a111e2827d37a37586"
+SRC_URI[sha256sum] = "9a50dfed1174dfc901ebbd29f1d0da5ce02c9704282ece004de40fce20774783"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


