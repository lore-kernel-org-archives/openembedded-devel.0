Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D74C71136
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:50 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.78436.1749526427996707314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XEciRE3+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526428; x=1781062428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K1TDU06TL/5AtNXT3VNxmp2Dtfh+5PnAluynSU7f/Sc=;
  b=XEciRE3+BGU/488N2l9DKEWa3pxB+JkZCSy3YD8KYj9BsjBPP4DI7YYJ
   UjC/m7S/EBLktgMZjD6hi5QZLxzci8IxnGK7AeMYhPkupYh2r1ZX3kvVm
   kU61a9pf7+x1VzjXTJM5Ahyywx56MXZKXmv4m+N/gLD1JvQ23ZLGLukQ7
   yb2UY1UvDZ1y3betULnFngGnmVoDUckWVrFsqt5RJSzqSIvB6bxQuJ9xl
   fV3wAsek7vX/3KLGLQgU5BtVtMvETeCGtg9+fcPBz4hQIld1ZB7VvseOi
   scHpMgcf/Euptl5L+eUtviUXmxVjyQy6VFdAtZTCLhjlKoa0wVGs5ndyH
   g==;
X-CSE-ConnectionGUID: 6whk+WvnTi2gBENV26QT7Q==
X-CSE-MsgGUID: UR9p6H5ZSR+vhzZGLVHykQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202680459"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202680459"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:45 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CE9EAD8E65
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BBC4BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:43 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B1681A0071;
	Tue, 10 Jun 2025 11:33:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 25/64] openldap: upgrade 2.6.9 -> 2.6.10
Date: Tue, 10 Jun 2025 11:32:51 +0800
Message-ID: <20250610033330.924-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117816

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Added slapd microsecond timestamp format for local logging
- Fixed libldap ldap_result behavior with LDAP_MSG_RECEIVED
- Fixed lloadd handling of starttls critical
- Fixed slapd syncrepl when used with slapo-rwm
- Fixed slapd regression with certain searches
- Fixed slapo-autoca olcAutoCAserverClass object
- Fixed slapo-pcache caching behaviors

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openldap/{openldap_2.6.9.bb => openldap_2.6.10.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.6.9.bb => openldap_2.6.10.bb} (99%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.9.bb b/meta-oe/recipes-support/openldap/openldap_2.6.10.bb
similarity index 99%
rename from meta-oe/recipes-support/openldap/openldap_2.6.9.bb
rename to meta-oe/recipes-support/openldap/openldap_2.6.10.bb
index 704e879891..9ef4a83584 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.10.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
 "
 
-SRC_URI[sha256sum] = "2cb7dc73e9c8340dff0d99357fbaa578abf30cc6619f0521972c555681e6b2ff"
+SRC_URI[sha256sum] = "c065f04aad42737aebd60b2fe4939704ac844266bc0aeaa1609f0cad987be516"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.43.0


