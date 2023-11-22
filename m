Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACBAC61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:30:25 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.13839.1700634623695934714
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="140003257"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="140003257"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:30:21 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E6346D9D92
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:30:18 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A14CE140A
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:30:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id E8D3C8822B;
	Wed, 22 Nov 2023 15:30:16 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ldap: upgrade 3.4.3 -> 3.4.4
Date: Wed, 22 Nov 2023 14:28:02 +0800
Message-Id: <1700634482-8100-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.005
X-TMASE-Result: 10--4.624800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgvnzTxGtgh+yRM
	9pS/s/NIYGK3LJXf9mO5Zwu3tRBMgGJZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW7v0LMVKXbDRXk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7OD2
	qD/gzzmx23uaVK6kQUHFTzhTFOpv4xbt9gvfr1sRTYinweOiEBvHq2SqAK+YlzzFqcE+ouTGhUV
	RqKgTQkPAiYfWCjn1iCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107000

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
-Reconnect race condition in ReconnectLDAPObject is now fixed
-Socket ownership is now claimed once we've passed it to libldap
-LDAP_set_option string formats are now compatible with Python 3.12
-Security Policy was created
-Broken article links are fixed now
-Bring Conscious Language improvements
-Add testing and document support for Python 3.10, 3.11, and 3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ldap_3.4.3.bb => python3-ldap_3.4.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-networking/python/{python3-ldap_3.4.3.bb => python3-ldap_3.4.4.bb} (90%)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.3.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
similarity index 90%
rename from meta-python/recipes-networking/python/python3-ldap_3.4.3.bb
rename to meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
index 0bf1ff14a..6caf5f37c 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.3.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
@@ -13,7 +13,7 @@ PYPI_PACKAGE = "python-ldap"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ab26c519a0ef2a443a2a10391fa3c5cb52d7871323399db949ebfaa9f25ee2a0"
+SRC_URI[sha256sum] = "7edb0accec4e037797705f3a05cbf36a9fde50d08c8f67f2aef99a2628fab828"
 
 do_configure:prepend() {
     sed -i -e 's:^library_dirs =.*::' \
-- 
2.34.1


