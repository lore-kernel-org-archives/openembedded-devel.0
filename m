Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCDECCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:23:30 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4837.1761099798259613546
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iPqCM2T6;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099803; x=1792635803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p8YpxEaA8cme2UOCRKx+eOC4qIV+BdFflNuEFGGy0Pw=;
  b=iPqCM2T6jvIL6vPhiQhLhhd3UT9MPYEF425/KjM0mz9v4whp9A8PyxkD
   eL6IJ7k/7OPBPUbiHKXncUTWGDpR3STnX347lgwv5o9leoU11M9TBJRs9
   Xu0SOqOQNeoouHvZlyaZCGRAoLvCC3vxbDaAUrqrojqPIeqPoHQaOAt/3
   5iTdqbLzBsGOhVOBcoJp8IjvmPN3TZ5DYoBWkcgx1KS6Nf6qS7l/+oH+p
   Ee++lzADNYTiq+OKiRWEEFtIRsUCmCpL6d4R3sV0kjearNPLd2osVHhh3
   PH302Z7ChQWt1iGCoitbSftU+Oz8yxQsaw6xaJgYld4oE2E96RzJKOHM+
   Q==;
X-CSE-ConnectionGUID: u0QxaUXZQ6i65aR4O2C3jw==
X-CSE-MsgGUID: pV+RiMWrRy6+rq8zYXDGmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="195536365"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="195536365"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:23:22 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id DF9E31002BBC
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:22 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 970FE8D205F
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DDE7182C0DB;
	Wed, 22 Oct 2025 02:23:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/29] python3-xmlschema: upgrade 4.1.0 -> 4.2.0
Date: Wed, 22 Oct 2025 10:22:21 +0800
Message-ID: <20251022022227.226-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120872

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Add arguments validation for schemas and validation methods
- Add SchemaSettings dataclass for storing read-only settings for schema instances and for managing package default settings
- Add block argument to XMLResource class
- Add MAX_SCHEMA_SOURCES package limit
- Add MAX_XML_ELEMENTS package limit
- Reduce MAX_XML_DEPTH limit to 1000 and apply it to all XMLResource instances
- Fix for substitute match in case of unexpected child

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_4.1.0.bb => python3-xmlschema_4.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_4.1.0.bb => python3-xmlschema_4.2.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_4.1.0.bb b/meta-python/recipes-devtools/python/python3-xmlschema_4.2.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-xmlschema_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_4.2.0.bb
index abdbf828c2..7ff9b8a21d 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_4.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
-SRC_URI[sha256sum] = "88ac771cf94d5fc6bbd1a763db8c157f3d683ad23120b0d0b8c46fe4537f2adf"
+SRC_URI[sha256sum] = "b1f88c53493b2e75471977cbf218d939b872d0c7046bb63d48cc219fa7e241b9"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


