Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B6AC071DB
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:38 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2717.1713318090793267641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GqD0iTxS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318092; x=1744854092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=i2RwXpeeALmgoi/7QN2WyFDphKwrdF07RBls4cPAIdY=;
  b=GqD0iTxSAyWfooDNasB4rLGN+JYPJ3XDaPx6tdKOUgVX2XOU8q/bTa9U
   Z1K4H3WEcY8B5NK8WQNKJ8x6YtizuggEuA5deTqKsivUWwxk3OzCaRSgX
   9MyJWD5VUguU9kVSCkelC1bcgogUBH32V6+g1L+AlwFlIAskrdbPrZpOx
   MhghYtQ9XhRc1673RmY8QV/TwiFs1QVzRFGCloLvn7Cl3GGTeForblgIQ
   tq8AEICUb1YxNUIdbAgsuV9xvx/QtiFWEWLoSQwq7E9L/a+qzHrBs8Lu/
   0kNVHnyuMTkvQG+ekW8O4ZjXtnO040EGA3zIbrsekNKjqCnBpVgMdSk3h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="135163779"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="135163779"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E8A5E05A7
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C2F026E034
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 52AA5200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F3D691A0002;
	Wed, 17 Apr 2024 09:41:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/49] python3-eth-account: upgrade 0.11.0 -> 0.12.1
Date: Wed, 17 Apr 2024 09:40:32 +0800
Message-Id: <1713318061-17128-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--0.374600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyUDmAa1yQigJob
	6BGgFvRO4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0HTT
	+SR4FPAFtiD7fHNL4iaPnIO5NPJ7Ge+0+nVVBhAmszAAKHDVaU3Mm2ddPPWkCIuJTdqlKduQRem
	Y+mbKxRIQtyxVtXykFjGHvUBLC3AvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110004

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Update documentation to include blob transaction signing example.
-Import cytoolz methods via eth_utils instead of cytoolz directly
-Add encode_typed_data to list of functions that return a SignableMessage
-Add support for type 3, BlobTransaction, introduced by the Cancun network upgrade.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-eth-account_0.11.0.bb => python3-eth-account_0.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-account_0.11.0.bb => python3-eth-account_0.12.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-account_0.11.0.bb b/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-eth-account_0.11.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
index ce48d9dcf..867aaaf02 100644
--- a/meta-python/recipes-devtools/python/python3-eth-account_0.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=16ffc86adf4293d4cfb204e77d62cfe6"
 
-SRC_URI[sha256sum] = "2ffc7a0c7538053a06a7d11495c16c7ad9897dd42be0f64ca7551e9f6e0738c3"
+SRC_URI[sha256sum] = "0374c5886f35780e1f23e50ce6b0482f3387646eceda544e97d69f17f6c216ee"
 
 inherit pypi setuptools3
 
-- 
2.34.1


