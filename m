Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC809C07E8C
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2759.1713318098760736329
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ub/z9p7t;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318103; x=1744854103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0iyU4vFndpTxSm3SQBwU1SuMZEqCeMXweK10/oOL3Gg=;
  b=Ub/z9p7tvAPvzRONiPSkW9H23y/iX2eT+PBdV9TZ7iVNlDW3iS0yvU6k
   r0qEduY1t5xVrg18flhxGrcawpmffrhwUypFAeTkoPNydd9AzxwWt9O8P
   2R2Uo1lVS9ZZTTZ+BKVRzu/1N2WzM1JrWTukE0i01pE1csgqkq+UkUI05
   A9PH4y5GROi/WqCSPmqQGeKIoAR6m5YBB5ImfHNGypPPpbtaw0c6wD6yG
   /Q5WCmrpK+Gv5XoLUwG4f9IO8xtozSkEx9+OaPf79cebYl9ZAW4oyoMjt
   MPKi1DfwN/oQCv8F4GS/NFRU2EXAsB/L6lJB9VY7zQLdp5M66qpu4AEjq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="134609876"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="134609876"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:42 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 46B04B001F
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 70CF5105F76
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D54796B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7F9681A0002;
	Wed, 17 Apr 2024 09:41:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/49] python3-sqlalchemy: upgrade 2.0.27 -> 2.0.29
Date: Wed, 17 Apr 2024 09:40:49 +0800
Message-Id: <1713318061-17128-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-1.400200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSAKo7vFXsOIEr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeEukIs3g1Hje1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDWve5
	4LGLpXiyW/g6I33JCyLK2iKzzToRkxX8NEbHm1pYn1lLc9pzL6AsSLmP/SlItCC2QQfiCzlo7JH
	QimrHCFY7G4ed0W/qTyvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110022

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.29

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.27.bb => python3-sqlalchemy_2.0.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.27.bb => python3-sqlalchemy_2.0.29.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.27.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.29.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.27.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.29.bb
index e5a837659..e646bd0d9 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.27.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.29.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
 
-SRC_URI[sha256sum] = "86a6ed69a71fe6b88bf9331594fa390a2adda4a49b5c06f98e47bf0d392534f8"
+SRC_URI[sha256sum] = "bd9566b8e58cabd700bc367b60e90d9349cd16f0984973f98a9a09f9c64e86f0"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


