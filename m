Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E408CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:43 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19039.1779190835002275170
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pCjee3rE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190835; x=1810726835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zswe5IimS3KLgQLUetpD7eUyHYQbrmMTZHEFkOiBqaE=;
  b=pCjee3rEDe8nqJN0+i1EnaRtb7NkyvKA7sAWgU5E76CO1dfGokernleC
   lrI10joNH3MsNzgr4JpPh3940WxmYN2OlOsCIJIp5xZOhTHxLFwzkihRn
   e07gaYZwkZYWsLXoCw5Fg4KtfbIBgu0onB9QMZVnT0DflfKhhXyClHntG
   t0skZD73SAK+qb6X+hl+qfLz7DBd6AIRbR6VXZevepp/yTJVRfR1+Ymkw
   3oHnUwdcfrpnHK4myAhoQ8IxFSTmWmy3RP+V6stYsvK2NhFijhNJb5V+G
   DhdQJX8d0oIAFUj7VMAyJIwyxm7+umSOamIVs5fVB4zBGbvoWMgRVeh+y
   A==;
X-CSE-ConnectionGUID: ppllh9IORwOi8HaB54JjxQ==
X-CSE-MsgGUID: O1DFCKaHTxuGUPgL8dsK1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="241113890"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="241113890"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:40:33 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6B6428200B9
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:33 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2446184F4A5
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id B987A405E0C;
	Tue, 19 May 2026 11:40:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/38] python3-pandas: upgrade 3.0.2 -> 3.0.3
Date: Tue, 19 May 2026 19:39:05 +0800
Message-ID: <20260519113921.655-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127084

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pandas_3.0.2.bb => python3-pandas_3.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_3.0.2.bb => python3-pandas_3.0.3.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_3.0.2.bb b/meta-python/recipes-devtools/python/python3-pandas_3.0.3.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pandas_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pandas_3.0.3.bb
index 62affc5f45..132a0acee7 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_3.0.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e98642e1210ade884e5254ab18d55b7d"
 
 SRC_URI:append:class-target = " file://0001-BLD-add-option-to-specify-numpy-header-location.patch "
 
-SRC_URI[sha256sum] = "f4753e73e34c8d83221ba58f232433fca2748be8b18dbca02d242ed153945043"
+SRC_URI[sha256sum] = "696a4a00a2a2a35d4e5deb3fc946641b96c944f02230e4f76137fe35d806c4fc"
 
 CVE_PRODUCT = "pandas"
 
-- 
2.43.0


