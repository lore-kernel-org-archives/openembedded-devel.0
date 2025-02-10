Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A47C021A2
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.46466.1739178122227882996
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hkDwysXN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178124; x=1770714124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eUo/ZRDl8v4TlqiI8B4JLnfNK3tnFQ/x4TnlMhAAGNg=;
  b=hkDwysXNncXUfgJzLx+GFOd+gtZv1vOHEdJbJvsv/AjyOW8vu1vMLe2k
   TQMJ1jPPjHbLeVbuPhSL7OvSuhCyC5muOGpqowelZPGi84DCVxca9kH0+
   uRIGmVOGSZycKEBRBfi4er+xcwOYNwAxQOpjAkBkfX1CqpWfZ1P1VK9wJ
   XtJhU4uImtz5Edtrh2+Fx8TavbokEmTb7CpisF5wNt+x+DK+rfkh09QY5
   jna4Xq888maaB9R3ZCb/Ccy23xBhHkukU+WciRq1Sb+WMO5Z58i3Z3uv3
   rvE93qzdJhE46Ntv0LatOYWP1lFJ4ErifzXtc4ubB6xIQlkH1Ys3gpSkX
   Q==;
X-CSE-ConnectionGUID: 2FtKQFfiQzWS1cxUy0KqqQ==
X-CSE-MsgGUID: krNTwBQASh6eeCVUZ9tAJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168346365"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168346365"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:03 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B9636D4C74
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CC12D88B1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 22E6D1A000B;
	Mon, 10 Feb 2025 17:02:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/66] python3-importlib-metadata: upgrade 8.5.0 -> 8.6.1
Date: Mon, 10 Feb 2025 17:01:11 +0800
Message-Id: <1739178095-26432-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115370

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed indentation logic to also honor blank lines.
- Add support for rendering metadata where some fields have newlines (python/cpython#119650).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_8.5.0.bb => python3-importlib-metadata_8.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_8.5.0.bb => python3-importlib-metadata_8.6.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.5.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.6.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_8.5.0.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_8.6.1.bb
index d51edf3356..4b2438b69c 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.6.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "71522656f0abace1d072b9e5481a48f07c138e00f079c38c8f883823f9c26bd7"
+SRC_URI[sha256sum] = "310b41d755445d74569f993ccfc22838295d9fe005425094fad953d7f15c8580"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.43.0


