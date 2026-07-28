Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0570C54F54
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:06:59 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5764.1785218810579443964
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aDX/dL4T;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218814; x=1816754814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Zg0vYDe+uM2vw2Iweq8JyB4QC1qw5nbFVpIPVTOqgSI=;
  b=aDX/dL4TfXFtUhoIjtDsAQbeMCQJPXSZT7LCmRLNRysS2Ds8apJuKjjM
   3NYSXzLec2cgYmh/QE9vfSqweDAT//alEeoGPnJmwNuJLYFVjk0j1B/KL
   qc0HtIfffP4J27sbV9ehvRBcY8xx35PxZM9WTZNOI6KvM4ysrD7X16BZw
   rdSMeb3ogt7EcbntuMhZse4VvHuC83thEzpXjBhBwWOv0QIhjWX6XTlxY
   XXgSnbRe4RSSaRVpow7eXjAPwbfyO4Am9pU7IxBC+sHfklrsKQ7gXkno/
   OwXIKZ/vvMw77lKbmyiAOAzDiPnDuhwmWsGY4bJeQxUBbuiFpK63Oszwa
   Q==;
X-CSE-ConnectionGUID: E7Swz6GFTT6P/8YSS3v0Vg==
X-CSE-MsgGUID: cm5rNcJOTBypLxC9Gp4IhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="236797053"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="236797053"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:06:54 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 33B568200B9
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:51 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id E05FC140735A
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:50 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 451D610005EF
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:49 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] dialog: upgrade 1.3-20260107 -> 1.3-20260721
Date: Tue, 28 Jul 2026 14:06:15 +0800
Message-ID: <20260728060645.819-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128472

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dialog/{dialog_1.3-20260107.bb => dialog_1.3-20260721.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20260107.bb => dialog_1.3-20260721.bb} (93%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20260107.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20260721.bb
similarity index 93%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20260107.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20260721.bb
index 42c0a8c434..d7a35b3a0d 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20260107.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20260721.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
-SRC_URI[sha256sum] = "78b3dd18d95e50f0be8f9b9c1e7cffe28c9bf1cdf20d5b3ef17279c4da35c5b5"
+SRC_URI[sha256sum] = "62bdf59057d4f760a1cc2217827f07887b4a3eebf694c25eacd4803d2171cdc6"
 
 # hardcoded here for use in dialog-static recipe
 S = "${UNPACKDIR}/dialog-${PV}"
-- 
2.43.0


