Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BB5D29F9C
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.40134.1730874682798240877
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Mf8iSNeE;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874683; x=1762410683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NXdKnG0mpEhWWjshNINA6K8HWAKQHRf6wbMzuz6U6KA=;
  b=Mf8iSNeEoaM2Qb5qnw1LD/IoU5tY8K+tOCdFfj4y6LNAdhkUjLppKitv
   MgT4Ui7wK3m7YDkJYHaYlpVXF6FzAzoBn2sxkzSxwQKMYbYMssEaGZGyx
   xfQKotzNZmEcuxYF1FTh2pTUWDFQOmObs4MV2KVcf8wFJvFX6NccTevUg
   aYC+jzkB6NDH+G+9baXCjgNjIu6lkhK2iJ0cmPjuSx1JyNEjAFXzMExKU
   7TNxTIZkxNxmvItKF6Dr9YV90MTIsWVJWM4I/XP49XrhYMJqZma4D8+a/
   KJUsuFXlIpmDAHNn2lyozYiEvGQ1aN8wgiDZKgAycN65QfGVWoo9YdI2P
   A==;
X-CSE-ConnectionGUID: O0wprKajTnCdClp9qzYB7A==
X-CSE-MsgGUID: KW2BFgx0SYe7TQB6YEA8ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="166653953"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="166653953"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:20 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 545832F619
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 914D7D968F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 34A7340A71
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D6A1B1A000A;
	Wed,  6 Nov 2024 14:31:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/46] python3-et-xmlfile: upgrade 1.1.0 -> 2.0.0
Date: Wed,  6 Nov 2024 14:30:35 +0800
Message-Id: <1730874660-2364-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-2.316400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJon585nKQczq7uce7gFxhKa3BF2OdN6oAAQdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLpwakKky3KEmMKtLmg3tveOauX81LThRLaUN
	lxyQE4bwhaal0E8cjo3I4cUOSwSjWs1GEpC0DOc0SQnwN7Y7bytXDGySDjgZP+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113707

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Implement proper incremental writing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-et-xmlfile_1.1.0.bb => python3-et-xmlfile_2.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-et-xmlfile_1.1.0.bb => python3-et-xmlfile_2.0.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb b/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
index 50ae7fa5e..1f119c6bd 100644
--- a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-et-xmlfile_2.0.0.bb
@@ -8,7 +8,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "8eb9e2bc2f8c97e37a2dc85a09ecdcdec9d8a396530a6d5a33b30b9a92da0c5c"
+SRC_URI[sha256sum] = "dab3f4764309081ce75662649be815c4c9081e88f0837825f90fd28317d4da54"
 
 RDEPENDS:${PN} += " \
     python3-compression \
-- 
2.34.1


