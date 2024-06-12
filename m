Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CAFC27C78
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:56 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.2434.1718161121378957902
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YF2+lQX9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161127; x=1749697127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TcTU6ZOn4MUJITaCD+VZ0zUgwwglxTRognMb1pyHPoQ=;
  b=YF2+lQX91GnM2Vf1tqegdaDlU4su0L/FYHDprkusYQBxxHDIvZHpJpKQ
   mWrvdz2hNxXXL/0VGN7D7z3T9pN8p7+VcpVDDJovJRwIEgIjaEHV4H7KG
   tXD28X7UYrL80Q780ASM6KaQkDqfZDyJrmb0uUK22LSY02LysMY0IBinu
   aXQOVIolISsVTBr6orZm/kNDDfkLyqlK73+I5fTN0clNRAitmUvd41c2o
   b7kBdVkj4UznxmYULojbrGHVAf0U6bmBFB1WMGeUuCezTpcuYhR+4JK3y
   YrMU+9P04tRhh9wNENAtiymyBNekUGBvLNIiWLnX+q/efmksX5A+1R+tc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="164690178"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="164690178"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:45 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 95832D7AD6
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D2E75D52B5
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 66E2320071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 110B31A0002;
	Wed, 12 Jun 2024 10:58:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/43] python3-prompt-toolkit: upgrade 3.0.43 -> 3.0.45
Date: Wed, 12 Jun 2024 10:57:53 +0800
Message-Id: <1718161096-29710-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--2.226300-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytfwudzT4nmGcEj
	oFgm7EFK4eoq6tn0zE3OARc7rRfejBgYXvMnhTgb+GYt8f/VhTtLGPRv0WdxQpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/3LhUU/qa4OGYA3qL69rXq5pEX
	AOzwbtMeLzNWBegCW2wgn7iDBesS0nRE+fI6etkund3siyqITbqupS13lGP8is2pUtD85xLTI7k
	GnrxWeCLuf/OwrNDOh2h9rVChyoRFewZeHR9L9VOnBvQItQZjeHkW2azlPH+Eu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110857

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Improve performance of 'GrammarCompleter' (faster deduplication of completions).
- Accept 'os.PathLike' in 'FileHistory' (typing fix).
- Fix memory leak in filters.
- Improve performance of progress bar formatters.
- Fix compatibility when a SIGINT handler is installed by non-Python (Rust, C).
- Limit number of completions in buffer to 10k by default (for performance).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rompt-toolkit_3.0.43.bb => python3-prompt-toolkit_3.0.45.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.43.bb => python3-prompt-toolkit_3.0.45.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.43.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.45.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.43.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.45.bb
index 8b3b70976..e02aafdb9 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.43.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.45.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "3527b7af26106cbc65a040bcc84839a3566ec1b051bb0bfe953631e704b0ff7d"
+SRC_URI[sha256sum] = "07c60ee4ab7b7e90824b61afa840c8f5aad2d46b3e2e10acc33d8ecc94a49089"
 
 inherit pypi setuptools3
 
-- 
2.34.1


