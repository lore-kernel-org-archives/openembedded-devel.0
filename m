Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0374EA3C40
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129132.1775730845071721888
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FKGGSKfp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730845; x=1807266845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kPSwkIk4fCr6xTy9XvkXXZYtzQnNJnDwJgjx0eSsUh0=;
  b=FKGGSKfpoy3kElp+oFJGIgSpURAEu6iUmZLoZ7zgvuiNDqKWuUKMuKSV
   nUb+oYKwVpS5OHDtjHnVfiFQ+mAxr1z8QXfirac+a+i5adIRvPCoiN+lV
   krcoQOwmofkUHOv+OGlQf/cmExTYq9cs+2kazYCtMwNQp4E3qyC7Xb/qu
   VOBSj4oPN8/7DqwmUuvJmT4DKSTDIZPydMrphfcklnprSgpwU+VASD1R1
   6ZSqN+NOowemz0fGAGwNgStOJafaBkxYT2oUsGNcHS1IXY46Qu2Cpx7TI
   p7VN0yJ2DLTjzi3f/lFt3YiJD0z9dXSbHj35JzfhBqZv5enWJ11W2ytzl
   w==;
X-CSE-ConnectionGUID: tgRljzCKT2u7uiBhksiwJg==
X-CSE-MsgGUID: 8y0Zu5iuR2ykdKiZZfQmgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="215190647"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="215190647"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:03 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 94E5F100015D
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:03 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 475D41003BE4
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id B567A403B5E;
	Thu,  9 Apr 2026 10:34:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/37] python3-icecream: upgrade 2.1.10 -> 2.2.0
Date: Thu,  9 Apr 2026 18:32:08 +0800
Message-ID: <20260409103223.1574-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126171

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Improved: Fixes Japanese character encoding issues.
- Added: noColor option for configureOutput, which disables
  colored output. It is set to False by default.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-icecream_2.1.10.bb => python3-icecream_2.2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icecream_2.1.10.bb => python3-icecream_2.2.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-icecream_2.1.10.bb b/meta-python/recipes-devtools/python/python3-icecream_2.2.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-icecream_2.1.10.bb
rename to meta-python/recipes-devtools/python/python3-icecream_2.2.0.bb
index 68728caf9b..e307311834 100644
--- a/meta-python/recipes-devtools/python/python3-icecream_2.1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-icecream_2.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gruns/icecream"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eca5ce1610d64ed40920efdce85ff8d1"
 
-SRC_URI[sha256sum] = "15900126ba7dbe1f83819583cbe5ff79a2943224600878d89307e4633b32e528"
+SRC_URI[sha256sum] = "9d7f244187f00a13f4ac77d176990e187e9c279d6cac4f7548e338291ad97343"
 
 inherit pypi setuptools3
 
-- 
2.43.0


