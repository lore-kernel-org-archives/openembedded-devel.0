Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BBBEB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:41 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2314.1687157422040252285
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="120836501"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="120836501"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BE4DDA694
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:28 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FE7DD9498
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id B23852FC5C6B;
	Mon, 19 Jun 2023 15:50:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 2.3.0 -> 2.3.1
Date: Mon, 19 Jun 2023 14:48:25 +0800
Message-Id: <1687157308-17342-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10--0.586300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrN5dqZcIK7Vgyr+EEjz9hsVzz
	JKQ55jKCD7mBlq0ezI+EVRl07FlKfe1a16oqp8B18t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4iiOf1NDnCI+5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO25V9
	z3vqk3KjtVmEeguLZmcpJg7Tr+xfAhKIzh7oKrs5NjIcP8Y7t6Z12lFa30MMVcu1ZwLMAWECZt2
	P/Td1WkgFjCA+rJLtVNu45XebprXfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103375

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Meta-schema elements and groups ignore xsi:type attributes (issue #350)
 Use the meta-schemas only for validating XSD sources otherwise create dummy schemas

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_2.3.0.bb => python3-xmlschema_2.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_2.3.0.bb => python3-xmlschema_2.3.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_2.3.0.bb b/meta-python/recipes-devtools/python/python3-xmlschema_2.3.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_2.3.1.bb
index 48bb3883c..9be7cb555 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_2.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ab20f8e337bea2e6874f372edfd12c0"
 
-SRC_URI[sha256sum] = "c2d583f7d07c6bac157d075889d15c128f34afdc79e4f70b4fb3c6adedc59bfe"
+SRC_URI[sha256sum] = "2eb426c5710833a05610c22c8766713a1b87e9405e3eca0b7c658375bf7ec810"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.34.1


