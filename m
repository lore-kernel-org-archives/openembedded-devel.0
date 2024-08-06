Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF4BC52D7E
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2886.1722934020635546610
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B+UY9PiA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934022; x=1754470022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MHgp9RidhRLoPjfdg+lrwPjgvxM1CatRHG231vv/L1c=;
  b=B+UY9PiA4tZ1+Dt59zL6MbZn6+dXLrKIFyweN4+BEUkDyWlO27NM25Hs
   PjyiN+OVg8Y7tNvchnb2oRP7ZzWwSFnlw/xKGsYzK5En9XZDkAHz/V5eE
   578SM06P0z/5G6q79O45UAdZRsrKWIvFzT/eiWgvbRa0PhnPpJs6Y7Yta
   AxRPwNQEYXfQfFG0JcCrBd+nf9yXlaPLBLVRtEE4gMr5px9fw6yOXeybi
   r0bDouGyJdLfpV3XhOSUFNtE2sLOP7DikmcMlYmDBYh3kn9go9LgydyQy
   IbhQB6NmYu9MlDu5WskYU+jvzVaYcpP5ye9I2P5QYfQvLvdc2Skz4iC2w
   w==;
X-CSE-ConnectionGUID: L6pGIemBRuGIa9uRvymHQw==
X-CSE-MsgGUID: P+G02ELBSzi+Gj0bA3hmxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169912625"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169912625"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F28D8C68E1
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 45C22D50B7
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D1D8F20076D12
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9BEC01A000C;
	Tue,  6 Aug 2024 16:46:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/60] python3-aiohappyeyeballs: upgrade 2.3.2 -> 2.3.4
Date: Tue,  6 Aug 2024 16:46:07 +0800
Message-Id: <1722933994-32549-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.376400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRtNdaRpWZzMRZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SaMjDtqrJIKpb2r9mhklj5cmBFQV6gPiqcfgXqaqDXtSCy8
	cTXNl5NWoG8A2yo50v5UFiwQ3zR12WWccyWL7fGbPQc/wdc1oES7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111550

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...happyeyeballs_2.3.2.bb => python3-aiohappyeyeballs_2.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohappyeyeballs_2.3.2.bb => python3-aiohappyeyeballs_2.3.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.4.bb
index edad28e77..f9816f6d1 100644
--- a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohappyeyeballs"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
-SRC_URI[sha256sum] = "77e15a733090547a1f5369a1287ddfc944bd30df0eb8993f585259c34b405f4e"
+SRC_URI[sha256sum] = "7e1ae8399c320a8adec76f6c919ed5ceae6edd4c3672f4d9eae2b27e37c80ff6"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


