Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D727ECDE002
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7246.1782378161622588523
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ccWyaQ2a;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378162; x=1813914162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mo4WFTLQlZb/L59skcvUXsHTkC0t4RtzFRn8+Rf3DOc=;
  b=ccWyaQ2a2eeZ0A8Ov2LXjLa61BXebAHw10mUwc1rFr0RBnSBpYVL7lnt
   UpdmzqHCTiIDlKE8CHQwFos53ReM6vGNDQ17W719xBO8StCZUWCrLuO+a
   CrRg8nBNqYQ+MSBiNV7zTkUpLlg72Xvnq1bI9ynCBh34mOnWsd1otkosQ
   VgcyLIzov08upED2aWEHhPyEmTbbU0NXF59IxyEJZSSs3ObThhn/yWBPC
   VbpyrRF58jCPirHT/MkqDMvrUFvmFczcE6A3HNVAHQsSAL8Dl7qtNTfVy
   dWvCgxwBJtTxx0YHs22++AjhErgt9dnBmDtaS50p3hmkeM5BEC7yB2d2P
   w==;
X-CSE-ConnectionGUID: WIsoQHsNTaeyZFPX7jMINg==
X-CSE-MsgGUID: zcfvezUwTI+U10ZPrtxSbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="245302413"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="245302413"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:42 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D18151000169
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:41 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 854721C002B2
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 35FEF1017325;
	Thu, 25 Jun 2026 09:02:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/47] python3-wrapt: upgrade 2.2.1 -> 2.2.2
Date: Thu, 25 Jun 2026 17:01:24 +0800
Message-ID: <20260625090127.1563-44-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127776

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wrapt_2.2.1.bb => python3-wrapt_2.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_2.2.1.bb => python3-wrapt_2.2.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_2.2.1.bb b/meta-python/recipes-devtools/python/python3-wrapt_2.2.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-wrapt_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_2.2.2.bb
index 859e36c55f..fbe5e5719c 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_2.2.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=63a78af2900bfcc5ce482f3b8d445898"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "6744f504375775d7609c82c8d3d94af1c9a6f05586984536905908ba905277b9"
+SRC_URI[sha256sum] = "0788e321027c999bf221b667bd4a54aaefd1a36283749a860ac3eb77daed0302"
 
 # python3-misc for 'this' module
 RDEPENDS:${PN}-ptest += " \
-- 
2.43.0


