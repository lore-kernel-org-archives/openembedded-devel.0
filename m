Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A3BCD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19029.1779190790925853936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jZ121xi0;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190795; x=1810726795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sf+u4Yz7bhlyB066PuDZzz4Z0cKY5MU+pouFlk7+BCM=;
  b=jZ121xi0DKRg7WK0nUawHoRylld7+gfsPMUIcnC6L1ND5gtWNXW55tMe
   sr2IDgF9BMhfkBZb+OU8BEyXklMfXzgGPKGU3leJOfolkL48+ULesgkso
   SK1CnFe5jG6n2FK1mx3Xtqx6pUCkhC200vcez24NYyyuWKtyC4cNjaXFx
   Ud5Jih6ELw4SigUT5YjQWMMMJowIiFk6DCb0VWl7PQ3CxAEy1PqwSS5te
   LeVKYS9nLl4HAT50qfnUr4+gUySy84W6uP7+F1WOtQfwG5rfXsLT2GCJx
   z+ATzcLjbcnychRHg9sMEpOnrk/rdIX97Gr+2A5iiCdM5Cw2rC2xK3MWz
   A==;
X-CSE-ConnectionGUID: 8Wf/aA50QRGz7yWrz1gsMQ==
X-CSE-MsgGUID: 8gNQMJIVTTKw5BKMUiAr9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="219995174"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="219995174"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:55 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 45B461002BA3
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:55 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id F17BDC06BE9
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 965454029AB;
	Tue, 19 May 2026 11:39:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/38] python3-faker: upgrade 40.15.0 -> 40.18.0
Date: Tue, 19 May 2026 19:38:57 +0800
Message-ID: <20260519113921.655-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127076

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add automotive providers for ar_DZ and fr_DZ locales.
- Add phone_number provider for ar_DZ and fr_DZ locales.
- Add am_ET phone_number provider for Ethiopia.
- Fix duplicate phone number prefix 145 in zh_CN locale.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-faker_40.15.0.bb => python3-faker_40.18.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.15.0.bb => python3-faker_40.18.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.15.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.18.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.15.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.18.0.bb
index cb7e3ebbff..029b407070 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.18.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "20f3a6ec8c266b74d4c554e34118b21c3c2056c0b4a519d15c8decb3a4e6e795"
+SRC_URI[sha256sum] = "2207575c0e8f90e6ccd6dbef764de875c614d16d3db4eee9712d9a00087f2e70"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.43.0


