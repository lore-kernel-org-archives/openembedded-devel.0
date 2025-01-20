Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617ADC02188
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.32749.1737360864974979421
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QsMnz8nS;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360866; x=1768896866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wZEpF/1CAlL0f8Sjnh26KPTCLU8DYfsDAXvuf/Vg6PE=;
  b=QsMnz8nSnMfkNxh3ARDbaJOuUe8Zx4iLTc/ccVtHaqIH4sfp792DnNG8
   tW98D7Y72gbK9xQCWrkI+sJvL9B818hDXUL32I1nZEjHa+W7ZQ/e8LxFz
   kgSbrYcBFFZNhJbSvF9WuDsHU54VmgVEp/IjB5NmCOQp46YB+opXsUZki
   /JZ+iuim5EE2Eqao2IejsTEniHqPj2tMzODimY3dqTrqiBU7nA/kE4QV+
   3Y+EMGwlkUbZGVFmlIu3nonza6w4cu9B6rn4bP30ir+2hYxS28LZ7NS1G
   t+K7nHbChWH/TI/6oGSjB7m0ytzld4gyOlaKVRpU/6Nb/c898+0YXwZFD
   A==;
X-CSE-ConnectionGUID: FPJ3zAWaR7SYV1sAwYM4CA==
X-CSE-MsgGUID: j3NOauVJTTW5zyn01YcgQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="189605714"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="189605714"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:23 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A0CDE076E
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 71DF0CFBC2
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id F091E20074705
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B1C6A1A0074;
	Mon, 20 Jan 2025 16:14:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/32] python3-web3: upgrade 7.6.1 -> 7.7.0
Date: Mon, 20 Jan 2025 16:14:04 +0800
Message-Id: <1737360846-4824-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX9z4cH5hW96YOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrTDNAouYQNpyGNYEq15zqa+hKFox4cTtwv0QKEkCFqku5IY8tkwvWou/ea
	wLZ/eRqsqBbKP6T9fMzgq07jYJhrCixMlBo8RYAh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114994

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_7.6.1.bb => python3-web3_7.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_7.6.1.bb => python3-web3_7.7.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_7.6.1.bb b/meta-python/recipes-devtools/python/python3-web3_7.7.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_7.6.1.bb
rename to meta-python/recipes-devtools/python/python3-web3_7.7.0.bb
index 9c0db28b3e..3d8acd9d28 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.7.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c8694da5a97575618474d9caf8c812da"
 
-SRC_URI[sha256sum] = "0cce0f33bef9096fc976ee00c38e71cdd10a61d4302a6b13b56ab58327764f9a"
+SRC_URI[sha256sum] = "4d0332b9a78b855e57ccebd9e1e74c8e855b95869ac7b8fe5878731593e76408"
 
 inherit pypi setuptools3
 
-- 
2.43.0


