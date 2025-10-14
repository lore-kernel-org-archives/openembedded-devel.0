Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5728FCCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:08 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.11098.1760433607121321706
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XK23/8FJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433607; x=1791969607;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1y+gC11guqaxHHQOFhJdzjekM4Rc+gSu7irsRqouTrM=;
  b=XK23/8FJmXlZnUsyyaOnp4hEhV67qs9D+USA0RMexGH/K9M78AMuMnaY
   qDyN2FXTkvLBb4UuUEyflpmqj3ivPzvXUdXAt+2nagwvQRSafIvD/x+Wm
   WzFpvwBMKMPk97bStYXy5dOv62YFTfzX/GrIf8tVTKTkHl7pc018MwLCk
   IFQ4sVBtd2TnF0mTVLFIvf8OpWoNYiV1rhhuT4oBiuGl6zTdbkmiNfzf/
   S6Nj6OyhHTSAz+4IByTTqaR70PKL0LkugruGE1H4m1dhKmSBjokTrrFtj
   U89PPSm+vt5I2byq4CaCOp9az9X1DU7LAIo9sjc/HEBDNXIKyAi9mwtdp
   w==;
X-CSE-ConnectionGUID: Jg1OAWQHQLyCqy7sKVg3Lw==
X-CSE-MsgGUID: 5JIG2800TBKITOrmLpFm5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="204394465"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="204394465"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:05 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id AC6EC1569
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:05 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 684AE1800BFC
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E86FE101BB76;
	Tue, 14 Oct 2025 09:20:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/44] python3-astroid: upgrade 3.3.11 -> 4.0.1
Date: Tue, 14 Oct 2025 17:19:01 +0800
Message-ID: <20251014091927.493-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120575

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_3.3.11.bb => python3-astroid_4.0.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.3.11.bb => python3-astroid_4.0.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.3.11.bb b/meta-python/recipes-devtools/python/python3-astroid_4.0.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.3.11.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.0.1.bb
index cdb25a6515..be69adeee5 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.3.11.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.0.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "1e5a5011af2920c7c67a53f65d536d65bfa7116feeaf2354d8b94f29573bb0ce"
+SRC_URI[sha256sum] = "0d778ec0def05b935e198412e62f9bcca8b3b5c39fdbe50b0ba074005e477aab"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


