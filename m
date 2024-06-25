Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E5AC3065E
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:47 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.166876.1719305857427917484
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n7bZYZjt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305857; x=1750841857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wZFGYBq5BgwDMjK7Q/xf81u6O0Xc3yTSmNOFKfVzfkc=;
  b=n7bZYZjt1SuGp59vU0VuI7hrGuWEic+sY+BfLmryQAlizkpNuVj1h7Rz
   UUmPcKFtCKFuk5qWKFNMGHgDeU8m62oIm4/V3Z53AnMGFQK4SkZFXbxag
   97rV/hz9zWPcNVvcb6D0SU8vJSbdwtYTsyZDHnwzGF3Q0b4Na/Jit+0ir
   GhfSa1xzZzGw4BJglmD17Npdp5uaiaMwZvDZ3AfF+dS3YUJL/iEKoZF/u
   EWzhpfe5CFiePi1SATHdlc+iQhmwfiK9nMAI1PWxb44spdUtibyz6cnBR
   zOeyWO92obs0Pa0j0PCIBz6JBcJ7ZnXi9mpg+l/mjBuu6lTI1kiIfah/x
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="153145192"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="153145192"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:35 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B5E2D8003
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 74400D52BA
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FB1FE36AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B11AC1A000C;
	Tue, 25 Jun 2024 16:57:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 54/57] python3-virtualenv: upgrade 20.26.2 -> 20.26.3
Date: Tue, 25 Jun 2024 16:56:27 +0800
Message-Id: <1719305790-11484-54-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-0.137700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrjdL0b7DvTG6U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJiVxoWkdJCLeuLYN1HO1KXYDAPW8/pf9nMTs
	19qEeq/iW9y/9oUaBcQgJEOQThSShbaMihf+rGqhI2RoeSUZC6o9UVq+k5x93+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111067

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Bump pypa/gh-action-pypi-publish from 1.8.14 to 1.9.0
- Bump embeded wheels

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.26.2.bb => python3-virtualenv_20.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.26.2.bb => python3-virtualenv_20.26.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.2.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.26.2.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.26.3.bb
index c7c7d4898..6720f50da 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.2.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "82bf0f4eebbb78d36ddaee0283d43fe5736b53880b8a8cdcd37390a07ac3741c"
+SRC_URI[sha256sum] = "4c43a2a236279d9ea36a0d76f98d84bd6ca94ac4e0f4a3b9d46d05e10fea542a"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


