Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A434C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:20 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44617.1784715852600916875
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WcZiux5p;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715853; x=1816251853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A5Qf3rym2N50aEwKW7peZUF7u67K8gX/InuK9sVALsw=;
  b=WcZiux5pREN0oWElK/BXrS4DQPqIXqUsUMwGqU2WSOv9eEuaHZq6sxuv
   TgQQvhqT4hG7HSvhIDqkaiwSjAy/M0EVsJ2jDQhvwruHmARcGNnfwAQ0x
   mdocWP+uEjzDwyvfqa1R+4SiIa2EVd0PstJN2TLlfy96n8sskzP71u2hl
   IG7kkRxbhyJjJEoH0Eyq5f6SwE8HCdyo3Zv6ycN5FOdXKDqDuq/2h9RRn
   Jsio0Mox9+HItH7Et9g/bAGsogs6JlCZh9qDyQMgghrbsuiMFJhLZbzPs
   8NJpGuzde22asZZtepmkxglLRHdclwkIB/ladSZYzXLniE5OfeokRWq29
   g==;
X-CSE-ConnectionGUID: AP5VE7gGTNe2iNF4Zjjezw==
X-CSE-MsgGUID: 89ISvhyrT62IcsA6eVtQ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="246377073"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="246377073"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:12 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 782BC1002B85
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:12 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2FBE38D65F7
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 4E6D940261D;
	Wed, 22 Jul 2026 10:24:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/37] python3-eventlet: upgrade 0.41.0 -> 0.41.1
Date: Wed, 22 Jul 2026 18:23:01 +0800
Message-ID: <20260722102320.1019-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128388

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* Bump actions dependent on nodejs 20 (#1091)
* wsgi: Handle ENOTCONN (#1092)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.41.0.bb => python3-eventlet_0.41.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.41.0.bb => python3-eventlet_0.41.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.41.0.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.41.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.41.0.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.41.1.bb
index 3c27caf968..00bccc9e16 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.41.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.41.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
-SRC_URI[sha256sum] = "35df85f0ccd3e73effb6fd9f1ceae46b500b966c7da1817289c323a307bd397b"
+SRC_URI[sha256sum] = "e91010caa1880bb511de6ce2ed2186ef3493e0762a4d3ee93e97a0fcccdaaa28"
 
 CVE_PRODUCT = "eventlet"
 
-- 
2.43.0


