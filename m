Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5B9C001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:45:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.151852.1692150325359827032
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="107669636"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="107669636"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:45:22 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0345DCA1E6
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:45:21 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 43DE1BF495
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:45:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 35E2C2FC6EAD;
	Wed, 16 Aug 2023 10:45:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.23.4 -> 4.24.0
Date: Wed, 16 Aug 2023 09:44:31 +0800
Message-Id: <1692150271-5638-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10-2.611300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr9pLnYtQ99xJoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AJlr1xKkE5uYMNZlevXKUz0p9
	DaZRzoN3/KVtfZiSDpiIxVB4zVVIz8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62SsnkzCLp2gqXPMCQcEy94ck09U/zKBMVpWy75jcMZO1LYEWOVeRxKYW0My
	qb9TW1g1PXIYEJQtrMKxJjSVPhJ8+Z0gTBah75ES7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104392

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/protocolbuffers/protobuf/releases/tag/v24.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.23.4.bb => python3-protobuf_4.24.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.23.4.bb => python3-protobuf_4.24.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.23.4.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.24.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.23.4.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.24.0.bb
index 8474a43d69..fdc80b7015 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.23.4.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.24.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ccd9430c0719dce806b93f89c91de7977304729e55377f872a92465d548329a9"
+SRC_URI[sha256sum] = "5d0ceb9de6e08311832169e601d1fc71bd8e8c779f3ee38a97a78554945ecb85"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


