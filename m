Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA43C5B542
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.6739.1747817996288026139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jzXoUGUi;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818001; x=1779354001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QcsjFN6G2ewel2USdCPbLKl+ZXkXSSY5HVdl8qhbE2Q=;
  b=jzXoUGUi/XS5TrsS4t2DWpLHioovWdnwWyCMfMjfZgwIaY4LhqVYK4bI
   aw7VDERyMKJT+AxZqX31jzirmvU/bPmhaH9TPTfM588ThzvfW7w+p2TlB
   fqTCx8dOIm+bjQkdnYBNBdmWJfEQyKhfQ8a7DcbrxiZk+XRdf5/mWUk76
   Xe0h16fp9Jo48wAOSqnQCRAoAHa1gdaWo5Ye0HN5b9RNx+0u46AwmX++i
   bDDgmiTrsEYjalR4oU2270IQleQhDjnSZcKuF1C1yHFixAsN5ai3ogkjo
   NyHtFARjgo7LpXYsjoakjDTMyYf45LZIoBVy5E4+hboBP+FioEWJJm4To
   w==;
X-CSE-ConnectionGUID: rzaBfMZTQF2+B5bR8xlJEQ==
X-CSE-MsgGUID: LwfFGuQOSrGb0oRJuC4/2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="188157667"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="188157667"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:59 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F5BFD8034
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D6111D8BCC
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 94A1F1A00A0;
	Wed, 21 May 2025 16:59:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/43] python3-pymongo: upgrade 4.12.0 -> 4.13.0
Date: Wed, 21 May 2025 16:59:16 +0800
Message-Id: <1747817972-28874-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117550

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- The asynchronous API is now stable and no longer in beta.
- Fixed a bug where pymongo.write_concern.WriteConcern repr was not eval-able when using w="majority".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.12.0.bb => python3-pymongo_4.13.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.12.0.bb => python3-pymongo_4.13.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.12.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.13.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.12.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.13.0.bb
index 52f3d6cd10..28f12e7381 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.13.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "d9f74a5cf3fccdb72211e33e07a6c05ac09cd0d7c99d21db5c2473fcfdd03152"
+SRC_URI[sha256sum] = "92a06e3709e3c7e50820d352d3d4e60015406bcba69808937dac2a6d22226fde"
 
 inherit pypi python_setuptools_build_meta python_hatchling
 
-- 
2.43.0


