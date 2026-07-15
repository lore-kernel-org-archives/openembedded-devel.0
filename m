Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C067C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:11 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3444.1784112005889221873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i5JS0UVh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112010; x=1815648010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/4j8ZOUdnvf0wxu7Cq6nKEBzb4vZ1dfX8Cay2p9GZ+w=;
  b=i5JS0UVh49uwkmUHssXktZQt0afDrPk4gip5Qa/x3ii3L6Sk70338FLw
   FgTI5ROUY2Ck7Tp5u6G0L8/LHGC0YRe7uSaUkwTcm3kGNoBtJLhp8cZCa
   qhQm5hh+n0rjskamySvlXM+gvyJP7MIjS5Sn90CvBCUAtT5A2Lgbe4RDX
   o4gAeKsXRhlli4RLeOddBBvEOzzJ4VWKgqoHN59IIvozt8lVMfTDwo9z+
   rMpPZfuezdwxQSBH61F8gBCnImcidUqM6O8SiNUTl5LTyrIroIYiSiTP8
   ssI20WkHcY1AK/bBG9W9ktZaCeD5ha4RA4IzfQmt2Mv0FRMowEOvRU5hy
   Q==;
X-CSE-ConnectionGUID: njhV+2rHS1WZhhtzuM7yWg==
X-CSE-MsgGUID: oXRsV8EgScua33dwlInLDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247440401"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247440401"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:10 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4D9BD1002819
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:07 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id F14A1181AE9C
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 21C98180113F;
	Wed, 15 Jul 2026 10:40:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/44] python3-filelock: upgrade 3.29.6 -> 3.29.7
Date: Wed, 15 Jul 2026 18:38:50 +0800
Message-ID: <20260715103914.2120-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128193

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- asyncio: detect cross-instance reentrant deadlocks before the poll loop
- fix(soft_rw): evict non-regular write marker without reading it
- _util: drop the dead st_mtime=0 short-circuit in raise_on_not_writable_file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.29.6.bb => python3-filelock_3.29.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.29.6.bb => python3-filelock_3.29.7.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.29.6.bb b/meta-python/recipes-devtools/python/python3-filelock_3.29.7.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-filelock_3.29.6.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.29.7.bb
index 75e29dab4e..4f6bca9191 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.29.6.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.29.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "895c532ef3f4ef04972b9446a8c4e2931a5c399ff3c4be4c9369f2639b80f793"
+SRC_URI[sha256sum] = "5b481979797ae69e72f0b389d89a80bdd585c260c5b3f1fb9c0a5ba9bb3f195d"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


