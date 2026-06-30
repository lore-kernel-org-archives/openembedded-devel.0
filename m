Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB88EC44501
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:50 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17242.1782811354103276966
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nOC4WODg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811363; x=1814347363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w4pV1rTOH8iSctXfitL9PkgjK8KPmKEiGNSJSxz91Vs=;
  b=nOC4WODgHUzfzij5RYO8BfUB7T3FVtmi85tNcKkXuWNgAb4CUcGPatAw
   leKDrTaw+0EsmGiJVrqVZXd0k6HLrx1CDa5tDgtgyt1fc9A3LFtJhf+ZT
   i0mhqKSdYgQSSRaoIzmJWlFCFiuy1lxWeG9enO2VWwM6t6Tl+07BcHDBq
   HXJO7pRwXphtRegULsPzp46rKFsZHhxfu9VWQMOayRVZnhivfvUzN6NFo
   dNYJIPC6cNU1JWbDWQ6oY7F13YfC+8O8wdOdam/4R76p7K6Q7CgqNycJh
   PCSF/O5/s6iKgDhtVdxhnMnP0KIUzUoCySccODaueYAW+wGac4m0kRCQ1
   g==;
X-CSE-ConnectionGUID: /bak18k7R1K2X+tuYy8Bxg==
X-CSE-MsgGUID: qePVkb05QTKBky15LoMC0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="233776235"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="233776235"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:43 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5428342A307
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:43 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 0CC48C073D2
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3611D826FEE;
	Tue, 30 Jun 2026 09:22:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/37] python3-hpack: upgrade 4.1.0 -> 4.2.0
Date: Tue, 30 Jun 2026 17:21:49 +0800
Message-ID: <20260630092206.322-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127963

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- Support for Python 3.9 has been removed.
- Support for PyPy 3.9 has been removed.
- Support for Python 3.14 has been added.
- Headers marked as sensitive will no longer log their value at DEBUG level.
  Instead a placeholder value of SENSITIVE_REDACTED is logged.
- Fixed perfect match missed for headers with empty values.
- Restricted variable integer decoding to uint32 to prevent run-away
  computation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-hpack_4.1.0.bb => python3-hpack_4.2.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python-hpack/{python3-hpack_4.1.0.bb => python3-hpack_4.2.0.bb} (87%)

diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.1.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.2.0.bb
similarity index 87%
rename from meta-python/recipes-connectivity/python-hpack/python3-hpack_4.1.0.bb
rename to meta-python/recipes-connectivity/python-hpack/python3-hpack_4.2.0.bb
index 4ecbd583f3..1688f9a877 100644
--- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.1.0.bb
+++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
 
-SRC_URI[sha256sum] = "ec5eca154f7056aa06f196a557655c5b009b382873ac8d1e66e79e87535f1dca"
+SRC_URI[sha256sum] = "0895cfa3b5531fc65fe439c05eb65144f123bf7a394fcaa56aa423548d8e45c0"
 
 inherit ptest-python-pytest pypi python_setuptools_build_meta
 
-- 
2.43.0


