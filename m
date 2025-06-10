Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36A5C678DA
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.78431.1749526425058059186
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dzBPp//C;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526429; x=1781062429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NU5+c0JVhVA+9JiDudJbYYi0CoTVePrpAxjLcZ/uMUo=;
  b=dzBPp//C8WXTqFJB0cZ7Fgr0lvPVujXF/JEaFH9R56Wr/ydmsXa7Z+PG
   WgaVov8JCrGtMtJz/GG1Tol40E48EsaxACODGyOjBpyIN2iqbr1NNTCYT
   GuHCrDRRffU+wog7x73C0FX4OhKGlczlIGSUHjzTq8m0u1gV9BF8bRdUr
   aQxdLaLTo8ePk5in8Vs71M9UU1BxnXq79srRUJ4lm6aPtRwupcfnVjqEH
   tcovFiDRoyiB0dN1GbW1dd5UdaBhGxAG0VoKW4tROqVf3VZVzdpYZejGB
   GRWLxLwz+cVk5SSOBq/ElfIlNEXB2YT9pWGH9IfU2d8gvOSIg69t1I/e2
   A==;
X-CSE-ConnectionGUID: IRDZ0gAcR0mQiFcLxKqIEg==
X-CSE-MsgGUID: +Uqa9X32SgmoPPc7NgY/Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="189595009"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="189595009"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:48 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 01D20E8FE2
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A41D4BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:45 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 37F341A0071;
	Tue, 10 Jun 2025 11:33:45 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/64] python3-frozenlist: upgrade 1.6.0 -> 1.6.2
Date: Tue, 10 Jun 2025 11:32:57 +0800
Message-ID: <20250610033330.924-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117821

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Correctly use cimport for including PyBool_FromLong
- Exclude _frozenlist.cpp from bdists/wheels
- Updated to use Cython 3.1 universally across the build path

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-frozenlist_1.6.0.bb => python3-frozenlist_1.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-frozenlist_1.6.0.bb => python3-frozenlist_1.6.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.6.0.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.6.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-frozenlist_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-frozenlist_1.6.2.bb
index 8c4acf39d1..0a8c58e1da 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.6.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/frozenlist"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[sha256sum] = "b99655c32c1c8e06d111e7f41c06c29a5318cb1835df23a45518e02a47c63b68"
+SRC_URI[sha256sum] = "effc641518696471cf4962e8e32050133bc1f7b2851ae8fd0cb8797dd70dc202"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


