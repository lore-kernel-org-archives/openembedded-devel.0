Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F56EC52D70
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:09 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2892.1722934025757537388
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nQ5vNXex;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934026; x=1754470026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eli37rGEC7jiiFQB6UXSf3FsKobxVSCKVdNyJS6pGqM=;
  b=nQ5vNXexvp5ZIU88fOej1r0AsV00xD3LZ8XNiY/BQkwE1KZQGvbue3D6
   LuAV6rQUomx18BMiHnDDmTZXq73Ldf0SWK/bj1VQ5dyOiZJcpvruofLtQ
   3T+a65AsHPouIgyI0qhfk4IfpHSlMjVSP0EY85nU+kMsqY59eg5+tx++P
   LfrHTq/G/+mtjpu1mQu+kyg8wg+3TOhWy5C9tb6MmzvTerbSSExUc/Hf4
   62oTQcOTd3cxhrU2VVQpXqefpjB+kh6XGXvA70zubq1kx4FbawwPd9zW/
   2wz4qgeaJmPIaPN8QOUTNg6JcAFz3xk+e+T0sOrF0gdzUkj8PeKZPLoSg
   w==;
X-CSE-ConnectionGUID: CK6XNPujQYCbV7RKT2Iqew==
X-CSE-MsgGUID: 7BizWvmIQamWV7tbP/vp/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="170035580"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="170035580"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E67ACC9440
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C24BCFBC1
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CD7C520076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 996BA1A0002;
	Tue,  6 Aug 2024 16:47:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 51/60] python3-tqdm: upgrade 4.66.4 -> 4.66.5
Date: Tue,  6 Aug 2024 16:46:25 +0800
Message-Id: <1722933994-32549-51-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX9z4cH5hW96YOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KreNb8GJl9XLT93VqJ1YNnx+ZpM51ebSLTrT2eDOcSiZtSsq51YfMBWFUxH
	qNWEWYsYHD1vBKjL0sBQIu6p+QjZQ7d61ItgwKSR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111571

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.66.4.bb => python3-tqdm_4.66.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.66.4.bb => python3-tqdm_4.66.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.66.4.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.66.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.66.4.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.66.5.bb
index 485d24f52..409936d5c 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.66.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.66.5.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=42dfa9e8c616dbc295df3f58d756b2a1"
 
-SRC_URI[sha256sum] = "e4d936c9de8727928f3be6079590e97d9abfe8d39a590be678eb5919ffc186bb"
+SRC_URI[sha256sum] = "e1020aef2e5096702d8a025ac7d16b1577279c9d63f8375b63083e9a5f0fcbad"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


