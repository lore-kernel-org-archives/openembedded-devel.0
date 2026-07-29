Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15F5C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 05:41:12 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5049.1785303655013310934
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 22:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OQUkgDvF;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785303657; x=1816839657;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GoXOJ8tGrBbUEYcTn86+/F3mxc/liIjIxRxyuhV6xMQ=;
  b=OQUkgDvF9hnbZJtDd+tmC8mkB5Ubafd5Ooe6QcI0wEtLWnno/zBncYT6
   aBA5MChxfoir+1DIOuA/yKed6HV4hRec9jqR01ChHw73i7O7vq+tTf0sF
   5l39BXQKPv+V1zzObcQFcEoKxBDu111yeGkQd9AXhhUbvAqwAGBjP6ixV
   dqeQtTOy+EOWLXYs0qW8JzEIYgXhNcj6HU59wak2Z3y56k2lLHoGyMZP6
   4JXuYP1HPkLygQMEWX3aqGpYsRagC9EywB1cDdooJSovKA+OikvEl8LS/
   mNBu8mMWJ7pccU62hHdmPp4O1Vcm+Nvs9mkuESIVEotLaz47fAEA98HZt
   A==;
X-CSE-ConnectionGUID: NHqB2IyHTb+M/Z5PkIrTfQ==
X-CSE-MsgGUID: zeKXey7MTKiK++Nnx11RMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="227840077"
X-IronPort-AV: E=Sophos;i="6.25,191,1779116400"; 
   d="scan'208";a="227840077"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 14:40:55 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E15421C1C707
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 05:40:52 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9D0CD82A4AE
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 05:40:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B52DA1801119;
	Wed, 29 Jul 2026 05:40:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] bats: upgrade 1.13.0 -> 1.14.0
Date: Wed, 29 Jul 2026 13:40:46 +0800
Message-ID: <20260729054047.1478-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 05:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128540

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/bats/{bats_1.13.0.bb => bats_1.14.0.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-test/bats/{bats_1.13.0.bb => bats_1.14.0.bb} (93%)

diff --git a/meta-oe/recipes-test/bats/bats_1.13.0.bb b/meta-oe/recipes-test/bats/bats_1.14.0.bb
similarity index 93%
rename from meta-oe/recipes-test/bats/bats_1.13.0.bb
rename to meta-oe/recipes-test/bats/bats_1.14.0.bb
index 3545295a3c..1f4b076cda 100644
--- a/meta-oe/recipes-test/bats/bats_1.13.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.14.0.bb
@@ -9,9 +9,7 @@ SRC_URI = "\
   git://github.com/bats-core/bats-core.git;branch=master;protocol=https;tag=v${PV} \
   "
 
-# v1.13.0
-SRCREV = "3bca150ec86275d6d9d5a4fd7d48ab8b6c6f3d87"
-
+SRCREV = "eb7f42f8d608ac693d7a4b67474f6714ea68cfc5"
 
 # Numerous scripts assume ${baselib} == lib, which is not true.
 #
-- 
2.43.0


