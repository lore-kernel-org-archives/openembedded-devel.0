Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C86C7EE2C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:58:17 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.6212.1684997895393455577
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117900111"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117900111"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:58:13 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3661AE8525
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A22ACF7E6
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D7C712007CA8E;
	Thu, 25 May 2023 15:58:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 2.0.13 -> 2.0.15
Date: Thu, 25 May 2023 14:57:57 +0800
Message-Id: <1684997886-2137-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
References: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10-2.535300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xIKo7vFXsOIEr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeEukIs3g1Hje1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDXY/N
	DD1Ui1zY52EtJWoGRplBecDqv5axRg77TSBzLhHzod/JLglVduAsSLmP/SlItCC2QQfiCzlo7JH
	QimrHCFY7G4ed0W/qTyvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102832

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.15

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.13.bb => python3-sqlalchemy_2.0.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.13.bb => python3-sqlalchemy_2.0.15.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.13.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.13.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
index 3963f066c..3af41bed2 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.13.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "8d97b37b4e60073c38bcf94e289e3be09ef9be870de88d163f16e08f2b9ded1a"
+SRC_URI[sha256sum] = "2e940a8659ef870ae10e0d9e2a6d5aaddf0ff6e91f7d0d7732afc9e8c4be9bbc"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


