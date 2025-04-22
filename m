Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C96C369D8
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:54 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.35404.1745311787534691791
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mOGY5COW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311788; x=1776847788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CWN6ODMNuSZ53WkJJlEx4CpVXL5tiGJV0GauSCi/ktU=;
  b=mOGY5COWyVG57F2DCpILsbmCCpJ/tbHyUKPDZlJVVSQ5G5WQiV2lpuYb
   Yb5hUiiEO+RhskxwZPNhcN2vtuF8yT54Ayp1oSra6a0bZXmZ2Vua74S1O
   R3eE9bE0UWMsy3Fa1iCtpvbPrjdhRcCXqP+0d/SB82RGRdIDCTkLZ1s2Q
   O1UHGUjra0W9u7Ci5J7pLGS8NON6OfX1MfwCsTtA1GIu+h5PY6YRZIZlC
   /AsR7JCrUCfHZQe7Tm3vodEml1o8HVj8AWOd5b0ZhFU98Xmu+jLApwuts
   WFSvjFJVTnpE/iIfeRh88bIKkry7t/vX7RuhXTJcV1QRAqW9ecum6PKnS
   w==;
X-CSE-ConnectionGUID: hNNjrbTZRYCU+u4VcMLLdA==
X-CSE-MsgGUID: FlNY6FwiT/KF7JMvy/+mkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197277135"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="197277135"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:34 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D93B4E0767
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A774D3F31
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 30A531A0078;
	Tue, 22 Apr 2025 16:49:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/30] python3-frozenlist: upgrade 1.5.0 -> 1.6.0
Date: Tue, 22 Apr 2025 16:49:06 +0800
Message-Id: <1745311761-1912-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117048

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-frozenlist_1.5.0.bb => python3-frozenlist_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-frozenlist_1.5.0.bb => python3-frozenlist_1.6.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.5.0.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.6.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-frozenlist_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-frozenlist_1.6.0.bb
index a3aebc59bd..8c4acf39d1 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/frozenlist"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[sha256sum] = "81d5af29e61b9c8348e876d442253723928dce6433e0e76cd925cd83f1b4b817"
+SRC_URI[sha256sum] = "b99655c32c1c8e06d111e7f41c06c29a5318cb1835df23a45518e02a47c63b68"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


