Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679BAC0218B
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.32643.1737360860755505135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ohNOL9zW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360861; x=1768896861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yS4bnYDbTV7HPyvwooaMwN6DFOZKs6IEelcR06VczUw=;
  b=ohNOL9zW0gJx7hA82ZzuHxx1dSKhHZKH7KkL+Q4QdAU5H0OIiOfBQvmY
   gqWqUCnqgxm2fRDSVAbiKxeS83WNvGm7iDo2yEGcIQiHEC0jivCx2E0PW
   u42dm0TxrnfDRA+ZniXuS94NuQale3I9BdokQSDL4sPddZ5hhOp4bHkeF
   xwZF8eIvEo6OwkPpCsVSlmlupHJOBC7y5VvafEdywjd+kQWJIqF3JxLBt
   lkdu7xvILdIxs3XzYAA0O2Dri0ysjr8Q5Rmvty3FjXgJ6i/Lo9GPUMmLr
   HHbCVM+tfuSRsSsJ8L2nKZ+kYTbLUd7v2j0MNDUO4r0VHumw+5VCCW7Ws
   Q==;
X-CSE-ConnectionGUID: RitMfrjpTAqyxBRLfGXR+Q==
X-CSE-MsgGUID: bfT4UseuTXytvaJZYrRkeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="187354167"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="187354167"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:18 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A89CCDBB80
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8224FD88A1
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 16AAA20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BA9B01A0074;
	Mon, 20 Jan 2025 16:14:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/32] python3-cantools: upgrade 40.0.0 -> 40.1.1
Date: Mon, 20 Jan 2025 16:13:49 +0800
Message-Id: <1737360846-4824-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-1.061700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwwAYdq1VTXo3w6
	H06bMgivuwgtUgLUDM8Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7wrj
	XAJniWtfYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzwnEQol1GllYlaM
	zG6q0O4exuVg4f9SBe4l98Shjg6JLKxjx5lv4N6tjixOZw23uG2DCkw7sp7AS23vbpvQ20CEkyl
	ScYOhzIiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114979

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add option for displaying unit from dbc in the plot legend
- Fix CI
- monitor: signals filtering
- Make generated src files more Doxygen-compatible

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_40.0.0.bb => python3-cantools_40.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_40.0.0.bb => python3-cantools_40.1.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_40.0.0.bb b/meta-python/recipes-devtools/python/python3-cantools_40.1.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_40.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_40.1.1.bb
index 285cf1a12d..0267e895e1 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_40.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_40.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "5b2d2d7c501ed8903bbc8104e288cef4c29dee6f58bb662bc74bd8be03d59ac2"
+SRC_URI[sha256sum] = "b1731da5e6997661084c6019d6cdcb3773868c035ed8a728126cf8c6f31a2368"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.43.0


