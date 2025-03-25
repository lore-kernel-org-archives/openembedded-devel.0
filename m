Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0CCC36013
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:29 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.61534.1742893342203871676
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ABmiZubV;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893343; x=1774429343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XES+y4naC06xY3UQfhqzUwRXvsURkYHCp7WZ8kKibT8=;
  b=ABmiZubVEPKBhSiGymu8O/GIcoFA2LrPdTi8DRkh0clqrfT1IAQLjw4X
   Aowlt6F40851ZWgZJQXfn/RlOkOLb36y+MqudDYJ5sp1E9Wao5XpBjW18
   +hI65l0rrP/u2M++TOqr156ZNQv9YqrJxnWs1O6M16vRkxgJw40c6Ru+M
   wCRus/WWI+RAxM+p/xA0/gauQol8Xcm4lDn7M4wDnixF8h1I3F5tB3GZD
   phFSqhGbtS+RpeNQhrI+myB18wLvMdOVIWgUaiUkEJDHXDECN7Hqz1qfX
   2BYDlOaohHdVlaHP0UgHZixd6Gxc4AfcZGN7deD8iIx7xTd4leNKZSWVk
   A==;
X-CSE-ConnectionGUID: 2f6YMrqKRg+yKvRLoTIPfA==
X-CSE-MsgGUID: N/CqT9CwSx2QpBYA3LVvig==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="173063676"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="173063676"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F081BE6889
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DF30D729C
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 32D461A009B;
	Tue, 25 Mar 2025 17:02:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/45] python3-scikit-build-core: upgrade 0.11.0 -> 0.11.1
Date: Tue, 25 Mar 2025 17:01:45 +0800
Message-Id: <1742893312-3809-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116262

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Bump pyproject-metadata to handle form feeds on Python < 3.12.8
- Increase timeout on CI
- Ignore deprecation message from cattrs on Python 3.14 alphas
- Add more integration tests in Fedora
- Restore example builds for Windows/macOS
- Remove leftover Python 3.7 checks
- Bump pytest version and include pytest-xdist
- Bump to ruff 0.10, work around bug
- Clarify verbosity options
- Fix incorrect configuration example
- Fix incorrect name (PYBIND11_NEWPYTHON -> PYBIND11_FINDPYTHON)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...build-core_0.11.0.bb => python3-scikit-build-core_0.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-scikit-build-core_0.11.0.bb => python3-scikit-build-core_0.11.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.0.bb b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.0.bb
rename to meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.1.bb
index 2d01f0bf03..0632503ac9 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.1.bb
@@ -10,6 +10,6 @@ DEPENDS = "python3-hatch-vcs-native"
 inherit pypi python_hatchling
 
 SRC_URI += "file://0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch"
-SRC_URI[sha256sum] = "423d8b0885bf1942816c851f8ec7c1efc0a7ecad4f38ff43d5ba869a894b107b"
+SRC_URI[sha256sum] = "4e5988df5cd33f0bdb9967b72663ca99f50383c9bc21d8b24fa40c0661ae72b7"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


