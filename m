Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928F2C05024
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2720.1713318095004054633
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R1VBzloO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318095; x=1744854095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IUy0wWZoX47C2pI8ws1pIfU8IAitKSCqAeGWLH6aRDE=;
  b=R1VBzloO65G1AiHF8pDqXq9diljl90jIWfk13cRWMRaH+XdLH+2YZkJU
   eN/X4W4ATgotsoo7Z/57KpQaKOQY4zloxCA2KzYr8hGPRK8FpxFt6+j7A
   AYsW6Ddm2Dx9nPkY+QuV3OhHJZEPS+uf1UKkUJYKUXLF8OS1fBBzOxHw/
   xFtJAJhbpUCuCRMTmIKDff0gRqG/GIPArn/m6ZJxPqQD2k8/yR6PxME81
   b5R1eS7NvMokwTqDuvQ+yU2Ule4agEVHZoeQI6hmVB8PMW4RvMnSN8/0L
   JM/88NQeNuawnI61ZZvDeC547hnfMGuNGK+D2Tf28faEgGc8J+MS/V5tB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="157724931"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="157724931"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A6FAD2E9B5
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E74A2D5627
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CD0F6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 081001A0002;
	Wed, 17 Apr 2024 09:41:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/49] python3-filelock: upgrade 3.13.3 -> 3.13.4
Date: Wed, 17 Apr 2024 09:40:35 +0800
Message-Id: <1713318061-17128-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--2.069300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mruHhIuIeXPm90Vj5gY98rDIq1
	R+8yFV4m4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0548icqvB+icULOOp
	5xxUy7oaBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNf4y3cCAvZydZRnXiAHD1WNAsXDDHzZX7UmYlf0aRg0YEih8O/ELGK6+h1Oiz9PqzCsE9
	ZY4cWIfFXzhQ0qXRM447Mb7uK28cmOCjzW1o6/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110009

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Raise error on incompatible singleton timeout and mode args

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.13.3.bb => python3-filelock_3.13.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.13.3.bb => python3-filelock_3.13.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.13.3.bb b/meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-filelock_3.13.3.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb
index f1477d1dc..4d6d19551 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "a79895a25bbefdf55d1a2a0a80968f7dbb28edcd6d4234a0afb3f37ecde4b546"
+SRC_URI[sha256sum] = "d13f466618bfde72bd2c18255e269f72542c6e70e7bac83a0232d6b1cc5c8cf4"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


