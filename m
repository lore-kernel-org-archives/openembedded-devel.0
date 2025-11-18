Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7D8CED24D
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:39 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8436.1763456978100301940
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NqL3YOT3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456977; x=1794992977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wabUREsg0GPl+Rm+vLnxNolq70YvAyV/fnY8MKbDJcM=;
  b=NqL3YOT3jxMHlslGlZyCfV521nLz8eEtw1dDG7aamgJECrzW7CA/WBY3
   n6LyRr3FGXawrCOpiy8/cVMm/cMIXSR7eYs6NwtDag4rCWBvYwKFbajdJ
   +kj4BdNN3sQMHt/1LMVdlmcjkTC1zZchT0gg1anc51L9wBdsV0BJKOnyv
   v+zrn5Im9HCkMn/Pc0QhvrzmTLTJjfwar3P34uU0+MQ+Gk4R8XbEydAkF
   4SjC744lTNqEEaGcGdxzvyv8plKal18iGyUJuo4jVfCq5hV/Jf9U1r4Pa
   fa/BjkjEHR887gW7rwoeE6y7Y6rh42O4/eLA7RRbe0+PXNG+9HddfKk2l
   g==;
X-CSE-ConnectionGUID: UzZdzwEDSIC10D89ecY9tg==
X-CSE-MsgGUID: /Z63gmBVRQikS07k940Psg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="198455940"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="198455940"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:36 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 84C5C1000348
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:36 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2BB881C00284
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9E6A814001F2;
	Tue, 18 Nov 2025 09:09:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/29] python3-yamlloader: upgrade 1.5.2 -> 1.6.0
Date: Tue, 18 Nov 2025 17:08:43 +0800
Message-ID: <20251118090846.1484-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121837

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Add Python 3.14 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-yamlloader_1.5.2.bb => python3-yamlloader_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yamlloader_1.5.2.bb => python3-yamlloader_1.6.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_1.5.2.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.6.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-yamlloader_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-yamlloader_1.6.0.bb
index 48fadb476e..4844e10de1 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/Phynix/yamlloader"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
 
-SRC_URI[sha256sum] = "c10ac1321a626b1ca8b09d3f3afe9855b818391c59992a76b65e4a2d95eac41b"
+SRC_URI[sha256sum] = "918232976c9910d079ef74b3266ff9ef674228609aa56e67718b3992940a823f"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


