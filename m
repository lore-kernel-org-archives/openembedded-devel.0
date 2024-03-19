Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32070C54E79
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:47 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.8219.1710827197679791938
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DdWHQJME;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827199; x=1742363199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZPCGnpvj7BOxAgCcj7GLcO7TzSifx9ePOQnmVp/i92c=;
  b=DdWHQJMEAx7m8sOGuELK5NfOUzc2JfB1SzHVUmzeiWTdjzZvT2IJv5Xx
   fRGjYKU7SU9XMXxfhRsH9iA34Q8FOWf6wu6+N19pzzPzudS6//J6qWWKg
   q7MradH8hPXy9HTWIGeTzYT1BT/tV2yNbBMG+jNQ/aSAh5Ima39MmllHM
   2TUQQVXcUezlamJ1O+Hg1/32dEtpo5k39I8v3LJA9YuVv2DARJRHBebr5
   Pq7CRo/xOMdAyBQEnv6oYqxNHAuFG+vud4IYDz1+aiHW+qii7e/bvcaRI
   l1X98kmeXd/VQem0oz8T4sm0V8rAcRaIO3HfeH2oqwdgquesnlVfamUIL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="140681184"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="140681184"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:38 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AC2FD3EB4
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BD031D7B8C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 45B7C21BD45
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E137D1A006B;
	Tue, 19 Mar 2024 13:46:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/50] python3-elementpath: upgrade 4.3.0 -> 4.4.0
Date: Tue, 19 Mar 2024 13:45:13 +0800
Message-Id: <1710827139-30056-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-2.950700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mriNxSV//57l9s1Ir4NZzFmuTF
	6zNmXbRm4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7MlV
	E60A/o2X+/cQfF2SKUbo47iU1jMsRAI4lIJFVyAKs/eBHl82fi8tQHFw1E1JPOEjC+SjpMDvBte
	iw0uwaZSzek632NA8eCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109442

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Improve stand-alone XPath functions builder
-Update tokens and parsers __repr__
-Fix static typing protocols to work with etree and XSD elements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_4.3.0.bb => python3-elementpath_4.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.3.0.bb => python3-elementpath_4.4.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.3.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.4.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.4.0.bb
index 3e7f70f04..e095cb8a3 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "8d25db9150f5a6aa978c9f58e607fcd5ab6e6e3017140563439a9884ab1eb304"
+SRC_URI[sha256sum] = "dfc4b8ca3d87966dcb0df40b5b6d04a98f053683271930fad9e7fa000924dfb2"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.34.1


