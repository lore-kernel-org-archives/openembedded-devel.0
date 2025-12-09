Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EA0D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4132.1765274201280552625
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cFDtHwy8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274200; x=1796810200;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+bYWjR72FysAOAgQJ3VdVH3lg0KcsS+O3Je653Fm3Us=;
  b=cFDtHwy8ogb3YYSM1xBUAB5Iz1cl3gg59v5jBB55EQKCJb3n/AJf0ytX
   ocD4bUiAubheyMvMhlTHnEaMVXWavtW0T32CyJk1tjvng1oXvmlWEHeyY
   7nhcJCVmfEaCQIkvosjXH0Q5p2VrZF+A1ORXpUEXC+BPt46+ds/C/NqDF
   NoMfOGTk5B2JSNUScBgEqgV3amryloPz7/lnfSUjrJxsvGRf5iEon9CnI
   PulPo1idv5zozWhJSmgu00sUxLrVl7j5CstWP7j+3QCD7KO9HoAfhUUS7
   nOoB1A+3G47xa+ubmWmPCK29NLGHXE9BHp5hfvaxDnvsuh0Do93fW5pwM
   A==;
X-CSE-ConnectionGUID: w19MfzpQQvC/g9E3kPvqdA==
X-CSE-MsgGUID: gxB67dbMQmmhCgEAVmz81Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="210560060"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="210560060"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:39 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id D208A1000363
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:39 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 87C61100044E
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 270EE20002BA;
	Tue,  9 Dec 2025 09:56:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/38] python3-argcomplete: upgrade 3.6.2 -> 3.6.3
Date: Tue,  9 Dec 2025 17:55:31 +0800
Message-ID: <20251209095552.690-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122421

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Make RE PCRE compatible.
- Only execute Python interpreters
- fish: set variable scope to local to avoid clobbering global or universal variables
- Documentation and help improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.6.2.bb => python3-argcomplete_3.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.6.2.bb => python3-argcomplete_3.6.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.6.2.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.6.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.6.2.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.6.3.bb
index abad776d8c..4a60dbaec2 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "d0519b1bc867f5f4f4713c41ad0aba73a4a5f007449716b16f385f2166dc6adf"
+SRC_URI[sha256sum] = "62e8ed4fd6a45864acc8235409461b72c9a28ee785a2011cc5eb78318786c89c"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.43.0


