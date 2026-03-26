Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEE3109C047
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:33 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46419.1774526244265377094
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UYv3BNDT;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526245; x=1806062245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CgShx+uZyp1+ZZZXLBMWZwuh0lN4EAxMLEra5ofZAxQ=;
  b=UYv3BNDTCvYaRqW+wcDJ8OeLrAiSfCfEofy638fote2UbdVSM4INWLEW
   u4yKpVXC1kSy5KOqH/LDElctJ74c545vYWuDqCDcPMvm0X/pEiHa3RmaC
   RqYXzUU1/nFjlXFmd5UvDpgZBrtUJP8dQEQA7JejgL0ZYcukyI9V17ZcY
   Z2W2wZaM9itdKS2vKavDku1fidMGf3cULUBVByx7wSmsGtvd4aiLBJtfN
   NkrD3aNWrxJXHywgmAZ4Xrh6QZZURdy4rYAmtLxCKRWC2/fy0QS8dxQtw
   UPIlr4G84kHTGbOo+YZT7YZbGSlqoQY50G99G+NHhrGxWoABeKYCKkQUO
   g==;
X-CSE-ConnectionGUID: fwLz0O+YT9ugdKqh+lLZrw==
X-CSE-MsgGUID: xKuGH1xrTCqDeXolCE5p0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213520829"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213520829"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:24 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 75F3542A313
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:24 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 27F1B1800E9E
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A18AD1807148;
	Thu, 26 Mar 2026 11:57:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/63] python3-astroid: upgrade 4.1.1 -> 4.1.2
Date: Thu, 26 Mar 2026 19:55:57 +0800
Message-ID: <20260326115634.1199-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125682

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_4.1.1.bb => python3-astroid_4.1.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.1.1.bb => python3-astroid_4.1.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.1.1.bb b/meta-python/recipes-devtools/python/python3-astroid_4.1.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.1.2.bb
index 568769c58a..d75b14c49f 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.1.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "445d831fe785df8c670bbb46b900b8424b82f85b4af187103f71a63a63ebed43"
+SRC_URI[sha256sum] = "d6c4a52bfcda4bbeb7359dead642b0248b90f7d9a07e690230bd86fefd6d37f1"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


