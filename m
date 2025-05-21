Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C63C5B547
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.6742.1747817999114261553
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L5SBTa05;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817999; x=1779353999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Wx3rP46yUgt0l9AA56YOVnf7Rgl4MD9lQQIaPD2NWCQ=;
  b=L5SBTa05QbLjAo77UTnQvkBRTzKvX+hBUuIMxbSzHN9p3oO2gUhKhrUc
   iHWKiN+SOJLY5l3CMkluKcBwy0M1duBd5XhhH+z4iJgoxwM9agzM+Spq8
   g0UAHs5bp83XI5x54IqFdrmiwiNnmu05cyw5jOA9zENvrbOPXrVV6Pxsu
   3BOkQMM+v2rsWmtRhnr5ZT9s1J+F52A2nObTWTnsmXCEi7mnCazIdyR97
   F0xKl/YWjDheJ0+H3YT672B3EPA5p5nQysBHIozPzz3nB0ZMXC8NLREyC
   4J75vg7bOlclo8s/o6ie4kc2JrK4GXeJeES1N6cK6W7Ta6lH4ZssEyfBa
   g==;
X-CSE-ConnectionGUID: MxCqr46jR8WBQwlwsC2rFQ==
X-CSE-MsgGUID: 9jdoMuLFSi6QTLH5tREV9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200574181"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200574181"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:57 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DA67D5056
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D2A7D50A3
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CD3591A0078;
	Wed, 21 May 2025 16:59:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/43] python3-importlib-metadata: upgrade 8.6.1 -> 8.7.0
Date: Wed, 21 May 2025 16:59:06 +0800
Message-Id: <1747817972-28874-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117547

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- .metadata() (and Distribution.metadata) can now return None if the metadata directory exists but not metadata file is present.
- Raise consistent ValueError for invalid EntryPoint.value

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_8.6.1.bb => python3-importlib-metadata_8.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_8.6.1.bb => python3-importlib-metadata_8.7.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.6.1.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_8.6.1.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.0.bb
index 4b2438b69c..7f5da81376 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "310b41d755445d74569f993ccfc22838295d9fe005425094fad953d7f15c8580"
+SRC_URI[sha256sum] = "d13b81ad223b890aa16c5471f2ac3056cf76c5f10f82d6f9292f0b415f389000"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.43.0


