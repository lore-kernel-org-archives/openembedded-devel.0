Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5259C44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:10 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3438.1784111994956034428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dgvdf4qm;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112001; x=1815648001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zjlvl3HZc/4vjl+GZAUA5dNaeQGNEmD3iz7wVc9UF34=;
  b=Dgvdf4qmK+8TuHechaZV+FqSPZc2h8ofMYP6te1PoW/Wvj3Ldjwwr2TS
   ESgH/uAElNHQvr+JmhegpeHMmkB/dx4NldApsrWAz/+eeY05FI7e5n5dF
   5Zf8e+MPN/2Updms8OeBhP5zeIw5FX7L3p4rG+pK75EpGBkXVrvYd3c52
   kyruzzfJk5/JhpTyoW06WVcoV49IefN/VyMz5pPqU3iEV1au+O0bgRRuJ
   DelfqwQGGpvySqk9sVC1MUlFs1CF4OxtS478W5vdZRi5PNHwIWEt0hvVe
   QIqa3ps7w16m6NS9l88DWa7QmsSAr/5tTCqdQgXGiOvDSFvEA0BLQzqeX
   Q==;
X-CSE-ConnectionGUID: FM3wSEGIReah18HdLo7hxw==
X-CSE-MsgGUID: Di0YrtinSEygFFIeIR1QpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="225218902"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="225218902"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:01 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1D883AC
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:01 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id BDFF9102FBAC
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C2DE91801122;
	Wed, 15 Jul 2026 10:39:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/44] python3-cmd2: upgrade 4.0.0 -> 4.1.1
Date: Wed, 15 Jul 2026 18:38:46 +0800
Message-ID: <20260715103914.2120-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128189

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_4.0.0.bb => python3-cmd2_4.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_4.0.0.bb => python3-cmd2_4.1.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_4.0.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.1.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.1.1.bb
index 13c84adff7..79407d00dc 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.1.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "97956c491be8ae2c5239ba1e7658b52804f0e54b401b15cae80c6b85c9dce74f"
+SRC_URI[sha256sum] = "8a70157dacbbbc11290c18cb3453f0c8ab1dba742572d247a06f4bb519a16472"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


