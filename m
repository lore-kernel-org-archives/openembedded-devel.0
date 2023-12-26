Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C25CC46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 07:28:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.76794.1703575726844510656
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 23:28:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="133015286"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="133015286"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 16:28:44 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E379C148F
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:28:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AC14AD605E
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:28:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C43B20083891
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:28:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D38FE1A0072;
	Tue, 26 Dec 2023 15:28:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cassandra-driver: upgrade 3.28.0 -> 3.29.0
Date: Tue, 26 Dec 2023 15:28:31 +0800
Message-Id: <1703575711-13218-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.005
X-TMASE-Result: 10--1.751200-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyDKIMJb+j2aGZY
	/RdXrUKNfBmCEiqCinZ/RDv7qBblm9z4cH5hW96YKsurITpSv+NUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmicF2uymn8acU7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJQYnglAWdCYbjaPj0W1qn0TGVuWouVipcue0m9JrGHRovj1OZ1SpEt9Dy6uoBHiXRbjcv
	Ab1pDVQGpwVM9Prh2iw/L3ff3SxQYF3wT08mRG1lhecCGFRy/g0BRwLfM+96RLxyJE4sOe8rslo
	bISoT4SXgJhkGsJwzltjCyRSdIOA4k4JpZi7wBM=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 07:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107798

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Add support for Python 3.9 through 3.12, drop support for 3.7
-Removal of dependency on six module
-Raise explicit exception when deserializing a vector with a subtype that
 isn’t a constant size
-Remove outdated Python pre-3.7 references
-Remove backup(.bak) files
-Fix doc typo in add_callbacks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ndra-driver_3.28.0.bb => python3-cassandra-driver_3.29.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.28.0.bb => python3-cassandra-driver_3.29.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.28.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.28.0.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.0.bb
index 468aa247e..8ec87fa26 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.28.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.0.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[sha256sum] = "64ff130d19f994b80997c14343a8306be52a0e7ab92520a534eed944c88d70df"
+SRC_URI[sha256sum] = "0a34f9534356e5fd33af8cdda109d5e945b6335cb50399b267c46368c4e93c98"
 
 inherit pypi setuptools3
 
-- 
2.34.1


