Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A48105A562
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:47 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18767.1773312818335437633
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dkSTBBst;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312816; x=1804848816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wPeo4UcW3kOE4gSintSA6EEOUtdcqiR0tWQ6xIKE+04=;
  b=dkSTBBstfOkyLX6kLcdaX8YFySC/wXjSVBm0qS/f1eziKw2Ht1ZdqVwh
   Pzd9lTjIUJVuowKJo6ibxIayuyDdmptdt5vGnor5LOPvV7Gl5NwiYV7U+
   EHBpmMscp0XGNT6SaDlWJgX4ykQ255CjiVOYH+5OkbTZCGmiHOhjzus/S
   Io7x74m+jHf1AsmWJ0T0SrXQY7G43OSrX4ynqHGONhDw/3pF4QYx8CKZo
   TRE0YEg5a9UK9dZZ6ryhaJcBfinx0Uwp8e0+/KowwxO20J3rLRaOSMx56
   UbdBAHfIud7dR9aQI6ctRtTiqKMC4Yy+4bGYflH1CcKsXeJZ67X1tnfPB
   Q==;
X-CSE-ConnectionGUID: oY3WGerhSbO/OTJu4lPLtQ==
X-CSE-MsgGUID: /MTxM+aIQ9GpqN8lD7TdRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220950496"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220950496"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:35 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D61E21C000BF
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:36 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 81B141C0CACC
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9CE791801925;
	Thu, 12 Mar 2026 10:53:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/64] python3-faker: upgrade 40.1.2 -> 40.8.0
Date: Thu, 12 Mar 2026 18:51:49 +0800
Message-ID: <20260312105220.1856-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125133

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add free email domains to hu_HU locale.
- Improve Polish address grammar: categorize street types and prefixes.
- Add country names to he_IL locale.
- Fix _get_local_timezone() missing return statement.
- Add missing formats and remove duplicates in user_name_formats.
- Add passport and cie for it_IT.
- Add major Greek banks to el_GR bank provider.
- Update internet pt_bR provider (domains, tlds, slugify).
- fix pyfloat TypeError when combining positive=True with max_value.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-faker_40.1.2.bb => python3-faker_40.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.1.2.bb => python3-faker_40.8.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.1.2.bb b/meta-python/recipes-devtools/python/python3-faker_40.8.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.1.2.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.8.0.bb
index 2a9970a91c..36c81ded0b 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.8.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "b76a68163aa5f171d260fc24827a8349bc1db672f6a665359e8d0095e8135d30"
+SRC_URI[sha256sum] = "936a3c9be6c004433f20aa4d99095df5dec82b8c7ad07459756041f8c1728875"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.43.0


