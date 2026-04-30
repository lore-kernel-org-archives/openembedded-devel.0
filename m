Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54211CD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:30 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17231.1777546221601690184
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BcJFNtIP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546222; x=1809082222;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W7EIee9jiKYjefTezC+m20gpwh+hKIz0JUGFK1szx7s=;
  b=BcJFNtIP0TZspYtj/7M+YR6PPs6jNbwzZKNdlr0EfUyAUm0N5iuhooJu
   aEpVZy2RD4qSRD93gWN5BdQwb9I/aVxwHGh7kOpQC4VtPNAXzTpDR9tNd
   6Bsdyj1oTbIuoMXt7xw9cUzOgXqxA62R0TXrzwKk8yka+/ZcJsu06fyZB
   a64BIf+RvvlDQ4Lx4+0gFFHHNmJPnpVH3lMQi7a0wgLU9gVFHz4cWRAPw
   2Ccjhz+5CF1EhwwkXslxgbe4PFETbXa3+tv7jsBHXq3c+SCtS3io72J62
   /XkOGNTrSVK7PspVA/zVBZQVvQIygliL3SdWBWiFf/MzHfxeIcDaoT+kT
   Q==;
X-CSE-ConnectionGUID: xfB/do+lTXiwtI6xTlbIQQ==
X-CSE-MsgGUID: xFrT1JcXSRuCdIII4t9c8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238610035"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238610035"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:20 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DBD4A1C000D7
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:19 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8FF03C00228
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 12ECB1801137;
	Thu, 30 Apr 2026 10:50:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/64] python3-faker: upgrade 40.13.0 -> 40.15.0
Date: Thu, 30 Apr 2026 18:48:51 +0800
Message-ID: <20260430104924.1106-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126702

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add job providers for ar_DZ and fr_DZ locales (#2352).
- Add company providers for ar_DZ and fr_DZ locales (#2351).
- Add geo providers for ar_DZ and fr_DZ locales (#2350).
- Add currency providers for ar_DZ and fr_DZ locales (#2349).
- Add date_time provider for ar_DZ locale (#2348).
- Add ssn providers for ar_DZ and fr_DZ locales (#2347).
- v40.14.1 - 2026-04-17
- Fix UnicodeEncodeError in CLI docs on non-UTF consoles (#2362).
- v40.14.0 - 2026-04-17
- Fix: update placekitten URL to placekittens

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-faker_40.13.0.bb => python3-faker_40.15.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.13.0.bb => python3-faker_40.15.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.13.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.15.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.13.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.15.0.bb
index 97f0e6e8f6..cb7e3ebbff 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.15.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "a0751c84c3abac17327d7bb4c98e8afe70ebf7821e01dd7d0b15cd8856415525"
+SRC_URI[sha256sum] = "20f3a6ec8c266b74d4c554e34118b21c3c2056c0b4a519d15c8decb3a4e6e795"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.43.0


