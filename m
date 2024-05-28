Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FEBC27C4E
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:59 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.12887.1716861051661752646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MaZe8vus;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861051; x=1748397051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6V5V/X2UhMd1IIueTuan7216Ny3H4nnGxQsEzlfnd64=;
  b=MaZe8vuseDD4qi5n4qZBNbJVOE1jYMzNk9a2PSKNdcWj6415ncKOHcog
   szMTcs88HhmPjbEg2kZc2PR8G+LIqpxeBK+vXKv2o4zq0a7kHrYfjLbm2
   Y7rvhlykti5sFOHE3CjxRnhFvX4y8omiKDhTpuCEujLDRItj9ibtu9o2D
   u+eiY+BF/FHeJ98XtZ8C35D4BfnxltUUZYOZg2fXOmLtYCz0WxKxgHhRH
   n31ulW2xzFOWzB3fnX1r3bABXWeyflQx4lSpNggG29suPHtTu04kEvu3j
   B/3wzQrSZjXYxh7fv/PP7HPr39W7067pfEYkJZhS1fHE9UoSlAHiwJaQg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="139576214"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="139576214"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:44 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C8C8CDE567
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0663FBF3C7
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BE172007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4A65A1A000A;
	Tue, 28 May 2024 09:50:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/40] python3-types-setuptools: upgrade 69.0.0.20240125 -> 70.0.0.20240524
Date: Tue, 28 May 2024 09:48:11 +0800
Message-Id: <1716860901-863-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--4.153100-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytJEjJjpEhCn9ko
	t/+2LaVUJjdZvprOsDzmFb4v6eBYPBSHrTqtvqVQNmg1ckxsf6dlYaAnvOYUB8eQfu6iwSfsEn1
	MZtDUjB4xvGIJDFz1iYZOw+CIbDzRInM7VIOun4L0MaQO2ri8DJXdNEOUjtKulPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDbnHu4BcYSmtwRdjnTeqAAEpeqaZhManGJ6ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSdET58jp62S7NQ/HM1yqYR3XHJ16zWHxWcpCBWD3XnLjglc
	RyKi+7pVI9fLW8nghqfndfO+zNPtcSoRoyHLsPj82VagtsC3pzBKs9s5syQ6S7+RMq/2CK6rA4c
	7UV2fQpvi2PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110569

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Small fix for pkg_resources StrPath
- Make shutil.rmtree.onexc parameter optional
- distutils & setuptools: Relax path related params
- Make distutils.dist.Distribution.get_command_obj not return None by default
- distutils & setuptools: Complete sub_commands ClassVar typing
- distutils: improve boolean parameters with int defaults
- Avoid using new _typeshed protocol in pkg_resources for now
- Use protocols instead of importlib.abc.Loader/MetaPathFinder/PathEntryFinder
- Add precise values for enum members where possible
- Ensure that distutils and setuptools._distutils stay consistent
- Update setuptools to 69.5.*
- Add distutils as a top-level package included with types-setuptools
- setuptools&distutils: setup returns a Distribution
- setup returns a Distribution
- pkg_resources: Make _InstallerType stricter and generic
- Use strict pyright configs for pkg_resources
- pkg_resources: Updates from upstream typing merge
- pkg_resources: Remove stray Anys and use more Self & NoReturn types
- pkg_resources: Remove type-only _Importer class
- pkg_resources: Types from assignments and aliases
- Override pkg_resources.ZipProvider.loader type
- setuptools & pkg_resources: Complete VendorImporter class
- pkg_resources: don't ignore "missing symbol from stub" in stubtest
- Fix invalid noqa comments and poorly formatted type ignores
- pkg_resources: Reorder names to be closer to implementation
- Improve typing of sysconfig.get_config_var(s)
- fix: typo on setuptools

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ....20240125.bb => python3-types-setuptools_70.0.0.20240524.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_69.0.0.20240125.bb => python3-types-setuptools_70.0.0.20240524.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_69.0.0.20240125.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_70.0.0.20240524.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-setuptools_69.0.0.20240125.bb
rename to meta-python/recipes-devtools/python/python3-types-setuptools_70.0.0.20240524.bb
index 7e15dcb13..781d3b5bb 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_69.0.0.20240125.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_70.0.0.20240524.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "22ad498cb585b22ce8c97ada1fccdf294a2e0dd7dc984a28535a84ea82f45b3f"
+SRC_URI[sha256sum] = "e31fee7b9d15ef53980526579ac6089b3ae51a005a281acf97178e90ac71aff6"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


