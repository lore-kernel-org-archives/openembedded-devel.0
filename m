Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1DCCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:12 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.27253.1761696967208203478
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L8ZhggcS;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696967; x=1793232967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6JNtZMOqtMmYSYDdGoJb2QLqh/GGRncTot1YzldGsq4=;
  b=L8ZhggcSFfy5ihL9xb84THdDTKjxCMbYeqjtYQgVY97G3LHhL+juxfJr
   IL5sH9w49GTdTGqM9STnr8+X6HZASwXdx89RN46GBeox/oQyCoksc0gNB
   QEdJeFFBTOI/aT/zX3EpE0EQa3oyXuMkUfsRWThwGg8USqpE0SBQ4nJ9O
   eCJtBlJTpk/bdYI0AucnKr0FwbXfrbvoOGxsSu1rZvxf4dwX1uYEvNUSp
   WloTGOn/DGrWvEJV5NuwSlVPo9inSkxS6YmCRJVw/iIHf8Wtv1dScdKzM
   3awywbChXTkcPclFnSDYjC0dOMMhof5MXMnwu/bShzo96vPRpT6ZOVIeR
   A==;
X-CSE-ConnectionGUID: RWg6twEST4a6oAtxyxTeZg==
X-CSE-MsgGUID: WgYdnKoKSPKm2OA1FzMoPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="196243096"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="196243096"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:16:05 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 9F905C00542
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:05 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 58D1C8D65CA
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 5A7AB826FD2;
	Wed, 29 Oct 2025 00:16:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/32] python3-regex: upgrade 2025.9.18 -> 2025.10.23
Date: Wed, 29 Oct 2025 08:14:58 +0800
Message-ID: <20251029001505.528-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121131

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- 'setup.py' was missing from the source distribution.
- Fixed test in main.yml.
- Moved tests into subfolder.
- Re-organised files.
- Updated to Unicode 17.0.0.
- Enable free-threading support in cibuildwheel in another place.
- Enable free-threading support in cibuildwheel.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2025.9.18.bb => python3-regex_2025.10.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2025.9.18.bb => python3-regex_2025.10.23.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2025.9.18.bb b/meta-python/recipes-devtools/python/python3-regex_2025.10.23.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2025.9.18.bb
rename to meta-python/recipes-devtools/python/python3-regex_2025.10.23.bb
index 5ee7ea85bd..bf6e7776af 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2025.9.18.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2025.10.23.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "c5ba23274c61c6fef447ba6a39333297d0c247f53059dba0bca415cac511edc4"
+SRC_URI[sha256sum] = "8cbaf8ceb88f96ae2356d01b9adf5e6306fa42fa6f7eab6b97794e37c959ac26"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0


