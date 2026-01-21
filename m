Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068CBC4450A
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:29:51 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9439.1768994986905885337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jNd20w4F;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768994988; x=1800530988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FLG4AQ4yUDLWsyrW7yyfSCIcrtiNJjI6f5QIAWNMe5k=;
  b=jNd20w4FhPLuOFE98ayBN9rKW+C0NjDDVHVFVwq2TWOPcKGylA5su6u9
   kEl6pObL3M/b6UkGDPmGmUQfYdZR6pELm7B44wkAx3DqC+lQjzJHkNI7q
   LJ3g32ft9MHRQqbsqND2mILtoKFJj17f0eDb89FsgUQr1FbZNrDVAGOMn
   csP4Odu39HtEKACi0/JL/s7bxl6DqEcieHHUZ9Bso6OysQ/uxR35M47ZU
   aEdlGaTmWymZ8lYdK0K2DNs8nhxb3JDjgDhZ12Y8OKhVy6XX/RlL6J77s
   T41qzJx71pwaODWuyr0Rb2IuR/AHgDAXlT4Rv0WrHT7l33K7Mzs3b7vRz
   A==;
X-CSE-ConnectionGUID: qFyjHwy6TkGBI7IjOg5qXA==
X-CSE-MsgGUID: kbLlw0CiQ/yzcOS6yPV03A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="226551711"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="226551711"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:29:46 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 4FBFF1446
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:45 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0A683100045D
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 616E11404868;
	Wed, 21 Jan 2026 11:29:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/30] python3-alembic: upgrade 1.18.0 -> 1.18.1
Date: Wed, 21 Jan 2026 19:28:58 +0800
Message-ID: <20260121112921.857-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123698

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.18.0.bb => python3-alembic_1.18.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.18.0.bb => python3-alembic_1.18.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.18.0.bb b/meta-python/recipes-devtools/python/python3-alembic_1.18.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.18.0.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.18.1.bb
index 39038958f4..b9bc454bdb 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.18.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ff111c41e8748bbfa45e8ba92347b681"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "0c4c03c927dc54d4c56821bdcc988652f4f63bf7b9017fd9d78d63f09fd22b48"
+SRC_URI[sha256sum] = "83ac6b81359596816fb3b893099841a0862f2117b2963258e965d70dc62fb866"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0


