Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B6DCD5BA7
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19028.1779190788902791494
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jJHa9fwL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190794; x=1810726794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8rKEVFmokEcrWV4JECUooJvYMY2ySrCF90AmenOS2Y0=;
  b=jJHa9fwLnI24txLRRywaL/e8JHQNJN/XTrwJFQhuKSc6LRd3XaMOb5iT
   +4Eop0EiZbQIhUCcb3lS3S7dgfAF8n4q1sHkWEWcygsS3w0/M5iULAffa
   YUqSWkxCTFKi4zuPIZYJydVZxbo4E4gbbiWP6eZJwlWJFVaHhiQLT7jio
   GVM2ltU3pBODjPOqbwCk+I1DYS1qTHgE77QUZ4CpgPD6iJq3DKTe3q+6e
   gojbEA6EqDPYsDtvnaHc0M5AUdu+AXcSBFOkWDxNSKwAkKA/Sca4Ko4Ox
   93P8DxA5FcuywGTLx8ekF7lSy3oeXYHazPF2hNmZpI/VvrUdG9Hb03di4
   A==;
X-CSE-ConnectionGUID: NFkT8BHOR2Odenk3Fl7XaA==
X-CSE-MsgGUID: xV54LB0wR6u7enQK3SNGNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="244313202"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="244313202"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:53 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 875FD42A304
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:53 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3268E1C00118
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id A016A405ECF;
	Tue, 19 May 2026 11:39:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/38] python3-coverage: upgrade 7.13.5 -> 7.14.0
Date: Tue, 19 May 2026 19:38:56 +0800
Message-ID: <20260519113921.655-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127075

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.13.5.bb => python3-coverage_7.14.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.13.5.bb => python3-coverage_7.14.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.13.5.bb b/meta-python/recipes-devtools/python/python3-coverage_7.14.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.13.5.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.14.0.bb
index 3cdce95d34..df8d140b8b 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "c81f6515c4c40141f83f502b07bbfa5c240ba25bbe73da7b33f1e5b6120ff179"
+SRC_URI[sha256sum] = "057a6af2f160a85384cde4ab36f0d2777bae1057bae255f95413cdd382aa5c74"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


