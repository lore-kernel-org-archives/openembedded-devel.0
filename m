Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04402C25B79
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:52 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.10794.1715677849464717020
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B1+viA3Y;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677850; x=1747213850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LW/+SKsCgoZ1m7cvfe2M1FfkvY8uqZSQgGsL9OT7QQs=;
  b=B1+viA3YUf9ouPYjrhuC7iV9+rz5JYOkcQwI0cYMxg1sllRbSOixvl/c
   FCrP3hcmbZeYWANuJwRRIkfi6NZNf6qK5fIiieYRjKz6u2+HVfhbl+INd
   nRDIZd5Xkpw+3QVPQhE7P+e5l/CSVAbjX58bf2mDEDzLjO0COUGb7NVmJ
   61blRn8PrZNKo/9byI7ynSreuvpAYo3o+ixuHyp/qNK/NarN1Ctf1yicu
   jxfoBIYIPK4GtjJA62VWgVAtZSIR/h9AgcjlkAfMxo3hcKIC7EcpxZINK
   kU5siuLgXgGRzTpH98mgIWl02IrbflU2TiAANRbYduVsfveOKErvbWSyZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="145839693"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="145839693"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:41 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 109EDDB61A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C07DBF4AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 78FCE70BFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 224311A000C;
	Tue, 14 May 2024 17:10:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/44] python3-sqlalchemy: upgrade 2.0.29 -> 2.0.30
Date: Tue, 14 May 2024 17:10:08 +0800
Message-Id: <1715677817-2223-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-2.535300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xIKo7vFXsOIEr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeEukIs3g1Hje1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDUI2s
	SI6zz7kX6X7kmFQ4CSo7kwhMbG/d383tGEY2Le+DAWYDs/r9vFMbgPu6dBitrDAtaZNiLX4Mbzp
	v8X1q4xauqPbUknFgnyvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110390

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.30

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.29.bb => python3-sqlalchemy_2.0.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.29.bb => python3-sqlalchemy_2.0.30.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.29.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.30.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.29.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.30.bb
index e646bd0d9..1a42aa1b4 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.29.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.30.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
 
-SRC_URI[sha256sum] = "bd9566b8e58cabd700bc367b60e90d9349cd16f0984973f98a9a09f9c64e86f0"
+SRC_URI[sha256sum] = "2b1708916730f4830bc69d6f49d37f7698b5bd7530aca7f04f785f8849e95255"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


