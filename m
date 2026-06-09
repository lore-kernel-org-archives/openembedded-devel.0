Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91426CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:29:41 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76500.1781000972272241171
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LUDb9FX9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000974; x=1812536974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AbaBmfpageTui7o3kKEoq3mQBjfbR0YGyhqEHVmQ3gw=;
  b=LUDb9FX9qagS84R8kekthfumMwsKltVWXF3fO7C48jcu9vSP/GxIMJeZ
   6FpDny+9C7dbeGwO5UbQywggx+fE2/psmry0JbaBBhGZGK52aFf9T6Y4b
   QzFLTnBW0KXmri2d3zHNriFFVQ3FmDpV9Z0lgcPRMhyHVO1/hTok6xc3b
   Pak5gBAupACKrLFKx91Pg3Z2NDmL59B4mwNCdaQdRk+ZtLBDt5fSCX7rV
   TTAUfClLP23YN6gnwZPVHuoX5xHbdWRPFp+9pWdz0DivyT/OhXPds33M9
   nqPBmWQxRWZCw1NBVMr9nY5uVvIwuTzNe+uWtkRMTuslj7g9qXbti5gag
   g==;
X-CSE-ConnectionGUID: xrMdUeX3RPq3wJTJaQLJCw==
X-CSE-MsgGUID: YQHtYFM4Q2WUTILvvnVMNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="243544140"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="243544140"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:32 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2AE1FC0182D
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:32 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id D92C21400362
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 050C810003CE;
	Tue,  9 Jun 2026 10:29:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 06/30] freeradius: upgrade 3.2.9 -> 3.2.10
Date: Tue,  9 Jun 2026 18:28:49 +0800
Message-ID: <20260609102913.2204-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127460

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Correct bug where detail file reader would not read files.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freeradius/{freeradius_3.2.9.bb => freeradius_3.2.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.2.9.bb => freeradius_3.2.10.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.9.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.2.9.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.bb
index 39b43c2a73..eef0e8f519 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.9.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.bb
@@ -42,7 +42,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;tag=$
 
 raddbdir = "${sysconfdir}/${MLPREFIX}raddb"
 
-SRCREV = "23811c830f1230ad466b3fc597e5676c045f8e0c"
+SRCREV = "9071ea041b9172e52eabbba91619afaf3a238795"
 
 UPSTREAM_CHECK_GITTAGREGEX = "release_(?P<pver>\d+(\_\d+)+)"
 
-- 
2.43.0


