Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1736FC83F3D
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:24 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.15678.1752648080473378782
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Pa8fljtp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648081; x=1784184081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KaJgc+UIzDU4/g0Idj5/H/r6xwZEzlIRVOMAJhtWdE4=;
  b=Pa8fljtpZ9ZO053ytXmdVgN+bquC7u0BkooDNvv4KQnFSHLER1ScQaiH
   J+5Y6fXLk+5GiPL6LAY2/XtW+y/Uu7Qk9DmroEwPrmVivHo8tiY48JJJn
   h033tYjQ2AlPyRcF/HZvYXd5A2rnWG38nzsUvT3nlM5N7CR/ef1RSX+To
   MZW58yt5SRWHqHK/JkoL8H0CTSmwdhDEoJiXRLNAoG3iQFQpqh1gc9wG1
   ZejVHEGWgOnhKIV0sAi8n0gQGd/Bq/HxHZ8xOpPmnlr2Fvq24/m6ssijn
   Tb9YUDennfayKUgi0890AydxwTOVm7n9j9BuH7sUP8/RZZqUO+1vjKMPR
   Q==;
X-CSE-ConnectionGUID: a/LlOUtZTBC1v8dMOpZbVg==
X-CSE-MsgGUID: q3VF5bcHRmeNxgK2wY/Syg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="185364933"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="185364933"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:20 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id AAA97C00233
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:18 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 1408B14003BE
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B50251A0090;
	Wed, 16 Jul 2025 14:41:14 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/14] python3-astroid: upgrade 3.3.10 -> 3.3.11
Date: Wed, 16 Jul 2025 14:40:56 +0800
Message-ID: <20250716064102.1813-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250716064102.1813-1-wangmy@fujitsu.com>
References: <20250716064102.1813-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118578

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fix a crash when parsing an empty arbitrary expression with extract_node (extract_node("__()")).
- Fix a crash when parsing a slice called in a decorator on a function that is
  also decorated with a known six decorator.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_3.3.10.bb => python3-astroid_3.3.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.3.10.bb => python3-astroid_3.3.11.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.3.10.bb b/meta-python/recipes-devtools/python/python3-astroid_3.3.11.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.3.10.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.3.11.bb
index b595335b99..cdb25a6515 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.3.10.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.3.11.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "c332157953060c6deb9caa57303ae0d20b0fbdb2e59b4a4f2a6ba49d0a7961ce"
+SRC_URI[sha256sum] = "1e5a5011af2920c7c67a53f65d536d65bfa7116feeaf2354d8b94f29573bb0ce"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


