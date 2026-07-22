Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24080C4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:00 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44784.1784715836147500379
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BPGCtGz7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715836; x=1816251836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zYlxbfJZ+BP8ueQL6CWufhsVDxTEQxVrg3boIQ254Is=;
  b=BPGCtGz738VYUw7aJivlAvpblYRtQysEtB+C05tg3EkgoQioT+pd4tNx
   bi6pjQT2CglmK8LaLhTraujc/lgRbX4JCs030vwUlPIYBWaTEmhVF+LiS
   iD/lwLFlyyX1gJxPI6YdAjtfvnRZwq/laThNwTdG5PggVWBwNKI446Ala
   UHH2s2yC8eA78Dgc5y2jg0S91rsrKSDi/hoYb8am4lNUyS13Ro3eMqMG+
   7XfhZRu5cQFOsggMYaAX8PMf6M5O5el1v7d007xglzCbIL4XtjhdRNNr0
   A3jTeIc21w6/oTNhlORg0/VO7zuaJurT3sQjCDpmA41FDXtfSUqPXbqGE
   Q==;
X-CSE-ConnectionGUID: ygPidg8dRSaqMQZXTqcIMg==
X-CSE-MsgGUID: BU5TN0zPSyWfZnFZW83lUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="247687245"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="247687245"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:54 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8908A1C00095
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:54 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 30B99C02E62
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 370024064B2;
	Wed, 22 Jul 2026 10:23:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/37] python3-cmd2: upgrade 4.1.1 -> 4.1.2
Date: Wed, 22 Jul 2026 18:22:58 +0800
Message-ID: <20260722102320.1019-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128385

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Updated getting_started.py example to remove multi-line command usage
- [Settable] description argument can now be rich text
- Removed redundant ipython import which slowed application startup time

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_4.1.1.bb => python3-cmd2_4.1.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_4.1.1.bb => python3-cmd2_4.1.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_4.1.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.1.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.1.2.bb
index 79407d00dc..f8f06a6bd6 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.1.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "8a70157dacbbbc11290c18cb3453f0c8ab1dba742572d247a06f4bb519a16472"
+SRC_URI[sha256sum] = "07e62b40235ae4af1c5730fb6b3a4708456b57b9ff79acf02808ac584263290a"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


