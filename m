Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84436EFD235
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:51 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41961.1772012327454983407
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DabqrVuh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012328; x=1803548328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z/Z2ol+NdhJj61vvyH58AG4acbYRSPGY9RPfbUzeiRY=;
  b=DabqrVuhMOpxe+gp9FISN3FDY/HkZpuKpKD/U+uGhPpsT/n1olqAxH/s
   kmAhydAaqojnDuRXqOxlTYhRYMbFq0hR3fe0Vy9sGx4J7P1+wKXnG5gJi
   NPyryXHgbWuKYDwqLhOu2atFEDYvp7nAu5LAWsGRurpcXj3LWN9W0XDDT
   TlKUHfc0dN9p7PsW7D7Zm7Rv19eH2JDSCRvsw1GpjCCJ2YCIv5VQC+g18
   lEpDwzSWfjICo6fQsL+ixrzwDOEamUabIQs1FzgazTaTjb8W3rfFk3H1r
   pJspaTEQ6k1DKQYY8aOVNDLd9l98agO616HqO17vbe302HyO1Se6BhwaK
   A==;
X-CSE-ConnectionGUID: 618UqC2ZT/au2t3V3O4WkA==
X-CSE-MsgGUID: M+Sh3oeJSkKm2A0lKBol+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="230998355"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="230998355"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id DA58110853
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:45 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 877288D206B
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id A507F101BB42;
	Wed, 25 Feb 2026 09:38:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/33] python3-autoflake: upgrade 2.3.1 -> 2.3.3
Date: Wed, 25 Feb 2026 17:37:26 +0800
Message-ID: <20260225093727.1284-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124644

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Update README.md
- Drop Python 3.8
- pre-commit-config: --py39-plus
- github/workflows: add Python 3.13 to the test matrix
- Fix TypeError in is_literal_or_name on unhashable set literals
- Fix IndexError in extract_package_name on malformed import lines
- pre-commit: update hooks and formatting
- github/workflows/upload-to-pypi: oidc 
- pyproject: fix packaging
 
Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-autoflake_2.3.1.bb => python3-autoflake_2.3.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autoflake_2.3.1.bb => python3-autoflake_2.3.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-autoflake_2.3.1.bb b/meta-python/recipes-devtools/python/python3-autoflake_2.3.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-autoflake_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-autoflake_2.3.3.bb
index 0a44d751fb..8767d6f4d5 100644
--- a/meta-python/recipes-devtools/python/python3-autoflake_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autoflake_2.3.3.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=88246be6a34c1496c253f58599f3db85"
 
-SRC_URI[sha256sum] = "c98b75dc5b0a86459c4f01a1d32ac7eb4338ec4317a4469515ff1e687ecd909e"
+SRC_URI[sha256sum] = "c24809541e23999f7a7b0d2faadf15deb0bc04cdde49728a2fd943a0c8055504"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


