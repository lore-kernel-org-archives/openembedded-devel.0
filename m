Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6260BC77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:57:57 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.6209.1684997868112515576
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="105955026"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="105955026"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:45 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CD078E8520
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:43 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1510014156
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C57E2FC91FB;
	Thu, 25 May 2023 15:57:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.23.0 -> 4.23.1
Date: Thu, 25 May 2023 14:57:30 +0800
Message-Id: <1684997851-2098-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
References: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10-4.138900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzZYpED/x+Qhb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AJlr1xKkE5uYMNZlevXKUz0p9
	DaZRzoN3/KVtfZiSDpiIxVB4zVVIz8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62SCaJGOcq2OCBXKBVgDc6i9X8DWcaCWynHHgB2QaCDUr/NWefxAHkq4zDTR
	S+jGaMD11zzx1++mnj3F2crGJIdydkpS2hZnMKKS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102828

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    Add a workaround for GCC constexpr bug (67ecdde)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.23.0.bb => python3-protobuf_4.23.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.23.0.bb => python3-protobuf_4.23.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.23.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.23.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.23.0.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.23.1.bb
index 52f34cfa0..e0c9ef967 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.23.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5f1eba1da2a2f3f7df469fccddef3cc060b8a16cfe3cc65961ad36b4dbcf59c5"
+SRC_URI[sha256sum] = "95789b569418a3e32a53f43d7763be3d490a831e9c08042539462b6d972c2d7e"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


