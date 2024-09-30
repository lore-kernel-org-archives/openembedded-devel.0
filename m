Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D789CF64A8
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:59 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.49302.1727682229491166126
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CUDuXvmL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682230; x=1759218230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kUKAHUG312GKRJ80HrvjzhuF5M5WhZItmT3gxBDqu6E=;
  b=CUDuXvmLMyxoaa9d7jpJLE4TJxBnMd737WdP1QDn7+BgnAEdXUJH9l+L
   URnBA4RTaPQx5OdrxSw1FIi3WS9ew205cJ6r8FIC/NjoWdvptKYYL9bf1
   rpOLjErXvqYCxYvzd9wkm7nTPzHU8GM7QxwLAu5vm+C1UhW9ysbgdcvw/
   6K1CWr0qcHqhQra0XYbf8wgcbyM4q7yF82Ur+MFzq3FO+K3YbWJyYeAp+
   d0z2spKWcjivAam/LESkCmgzcXGUKORP2keAlGpQVNjrRljNEDB6uJNj6
   B6oK98xure7S/oADwydA7f9HQLxMydtb6TchqdStLZCSGNirkCB8Wnfnw
   w==;
X-CSE-ConnectionGUID: 4DiQSBflSiq/JupMnvTfSQ==
X-CSE-MsgGUID: zTNk/zJ+Sx2lCZMmyqu5TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="162602076"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="162602076"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:49 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 24367D9224
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 630A1D4C1D
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EB58020076D01
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9C2991A000A;
	Mon, 30 Sep 2024 15:43:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/40] python3-prompt-toolkit: upgrade 3.0.47 -> 3.0.48
Date: Mon, 30 Sep 2024 15:42:50 +0800
Message-Id: <1727682185-12664-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--1.476600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yaoXHZz/dXlxtAQ1UAnR9neZt08TfNy6OOaq
	OLvWCjS6xmXDKxPRwmYNKu6sdFLYue1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKJY5Eh/SzoiVnVgf6iGPAIAeBzEkCCpnRmeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDkXTH2hPAAxZxedG8Ns/CkHwgdNjiQx606u2xymPc00Vgygf3nuesQv2kR1MBtIRM/eUK
	OYaqSgtp7Y+EAo8OJYTepVhD1wDb4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112584

From: Wang Mingyu <wangmy@fujitsu.com>

- Typing improvements:
  * Add '@overload' to 'contrib.regular_languages.compiler.Variables.get'.
  * Use 'Sequence' instead of 'list' for 'words' argument in completers.
- Improve 'ModalCursorShapeConfig':
  * Display an "underscore" cursor in Vi's "replace single" mode, like
    "replace" mode.
  * Display an "beam" cursor in Emacs (insert) mode.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rompt-toolkit_3.0.47.bb => python3-prompt-toolkit_3.0.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.47.bb => python3-prompt-toolkit_3.0.48.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.47.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.47.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb
index 9997785dc..3ed18905f 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.47.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "1e1b29cb58080b1e69f207c893a1a7bf16d127a5c30c9d17a25a5d77792e5360"
+SRC_URI[sha256sum] = "d6623ab0477a80df74e646bdbc93621143f5caf104206aa29294d53de1a03d90"
 
 inherit pypi setuptools3
 
-- 
2.34.1


