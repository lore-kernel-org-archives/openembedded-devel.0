Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8FAC02198
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:32 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.30369.1735032451362737997
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cSGF/qpt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032451; x=1766568451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iNHkfwZkeqHoO1i03CQ3+Gl5Z4LqQQPb5Q+71kfo9oM=;
  b=cSGF/qptvQSbiSGe6nS4sb9nYhA5mAqR41Q7QX/SjgZvFLgxe4C7tKAx
   iVSnylOTw95rnmR0f0p0ZTPiIPSOdUxlPxlvk2tRmzfdOz2GCp/f0ETMD
   2zeahMLiW9tCbRLz4sJ/wwsIF4FlU6XVu34sYQ6mnJlzJGERunKfBmcgt
   0C8gBlRpVrvo2nhvXiuzIcRx7jSmJcYr7xdIiKzFazNG63r+3wli7vyOe
   lyM8cTnKTPDbSZg+v4kyY//C4qAkm6B7CivscutTAcUtoPj6CmwPpqAMz
   /3CX0CMToeou0GihRa5cBtKziiafAuW0FGg0n7sVPbvAqpnb8QHqu5vA3
   w==;
X-CSE-ConnectionGUID: phG5CijcQx+rNqIjgU5aRQ==
X-CSE-MsgGUID: tAAYS/M7TJeqcEcbZFCl1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="187212826"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="187212826"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:29 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A746D4F43
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E273011C58
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7716220071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1F9111A006C;
	Tue, 24 Dec 2024 17:27:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 54/67] python3-redis: upgrade 5.1.1 -> 5.2.1
Date: Tue, 24 Dec 2024 17:26:48 +0800
Message-Id: <1735032421-13513-54-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--18.226500-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrf6yIJ/9AolP7fZJfDdCIXC1+
	4nCRr2jQEFRfkXUcAJktDsEAeY7amGTFilzGBdRxPPov5T+l6PGUctRw0zzl2pzve0VBLqQUBjM
	Zi1W1qsGaPyWEyuxOvSqDtWK5GDuNkLaevrJcClAD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpienmD2BglYMt4HMSQIKmdGbGWmeVAULKH9avse85ISVrzU/LdwgI2FKPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrZRMZUCEHkRt
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114529

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Extend AggregateRequest with scorer argument (#3409)
- Pin pytest-profiling version due to the bug
- Fixed unsecured tempfile.mktemp() command usage (#3446)
- Fixed bug with SLOWLOG GET response parsing on Redis Software (#3441)
- Fixed issue with invoking _close() on closed event loop (#3438)
- Migrate test infrastructure to new custom docker images (#3415)
- Fixed flacky test with HEXPIREAT command

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_5.1.1.bb => python3-redis_5.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_5.1.1.bb => python3-redis_5.2.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_5.1.1.bb b/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-redis_5.1.1.bb
rename to meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
index a7ccc95588..8e6df79385 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 # Prefix archive to avoid clashing with the main redis archives
 PYPI_ARCHIVE_NAME_PREFIX="pypi-"
 
-SRC_URI[sha256sum] = "f6c997521fedbae53387307c5d0bf784d9acc28d9f1d058abeac566ec4dbed72"
+SRC_URI[sha256sum] = "16f2e22dff21d5125e8481515e386711a34cbec50f0e44413dd7d9c060a54e0f"
 
 inherit pypi setuptools3
 
-- 
2.43.0


