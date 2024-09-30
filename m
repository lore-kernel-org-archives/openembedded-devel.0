Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05410CF64A5
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:59 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.48956.1727682227416337757
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n6/ec1F/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682230; x=1759218230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MMfOB4XpZ7WtnKO9JmPbsHpoByLU2cv5pAh/DmeDDbc=;
  b=n6/ec1F/xx3H3AUiEoVLxJTi0AK9wRstNbE97nt/3ftOWJvYsSSZkEBE
   RaJdRCaeEzpujlGqPr/wAS3lhrBO4rBhyQjJivvO37JJg/BEmB3u5qXL5
   lK1noJToZ4/rUsLk/XWWpY6AZvEC6VceNcc7kupurVtBY4iQCBLWm2qiZ
   U0PmDkbjs26PBHHxe/tA7TTsZq9w/F69/zOGB/hnWoElwYvpg8JgbV/FD
   sON8BFQXBNNvx7YhyreGTMLTnTpCbkXc6DFHFb1TBqVhB+xHtAKADvm8R
   XWHiE4o1VcB3+qYJU93P+xm0BJquUfLzBiZgS7uKJeP9XiAV37tG7SbfA
   Q==;
X-CSE-ConnectionGUID: BoPYVPA6Rqi4dErii9tDmA==
X-CSE-MsgGUID: t8DezMDgQqCAiumD1mOiEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="162602066"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="162602066"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:44 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CB665D29FC
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1413DD4C0E
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A3606B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4A2081A000A;
	Mon, 30 Sep 2024 15:43:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/40] python3-gnupg: upgrade 0.5.2 -> 0.5.3
Date: Mon, 30 Sep 2024 15:42:45 +0800
Message-Id: <1727682185-12664-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--2.883800-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvozDhGeQC9EnxT
	CDOp7liI8gY29qvMyB/ak7L6aIQwzPUWMvmk6jMFEhGH3CRdKUU2hINq/IswlNfWSbpQA4g3vqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgBCE2NlBjIjcB1VGYAjOG0CjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipco7auTXq4qYjV9ZPoBUpAn4mugXp+NIJBUgnG
	5Y++JMTHN597RKQ2khePXz59S28Td6G+duvoepD7lkrxxmOvRqreqHHCWTkLP6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112581

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix #117: Add WKD (Web Key Directory) support for auto-locating keys. Thanks to Myzel394 for the patch.
- Fix #237: Ensure local variable is initialized even when an exception occurs.
- Fix #239: Remove logging of decryption result.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gnupg_0.5.2.bb => python3-gnupg_0.5.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gnupg_0.5.2.bb => python3-gnupg_0.5.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.5.2.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.5.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gnupg_0.5.2.bb
rename to meta-python/recipes-devtools/python/python3-gnupg_0.5.3.bb
index b69e2c465..8c231dce1 100644
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.5.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dabe659eadd6d97325b1582e41cfc11"
 
 PYPI_PACKAGE = "python-gnupg"
-SRC_URI[sha256sum] = "01d8013931c9fa3f45824bbea7054c03d6e11f258a72e7e086e168dbcb91854c"
+SRC_URI[sha256sum] = "290d8ddb9cd63df96cfe9284b9b265f19fd6e145e5582dc58fd7271f026d0a47"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


