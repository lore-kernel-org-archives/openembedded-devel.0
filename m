Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F192FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:41 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17461.1777546232639185052
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FpPZj/PF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546236; x=1809082236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YtMK/galDR3e3p+d2slPL6aqxiatnzwXZ2C0pRAdOwc=;
  b=FpPZj/PF13GmgA5WvB1PPkFt7mBD3JAXYBl8KEEopCSgrC+VowTz+huB
   TVxf8Jy8eGJYrk3kv919C1ibeY6FgzI+6/v6YUt2HqjhqCJZInehk5U5I
   DvvGU3iZG7CRWIJ/MLLsamLHxgR03DipzGmVwhfKC7y48Ieo1OKT4/90E
   fIbz5T+z4M50xTMCpKmsamYcI3w+mWYIFmlOxNOrZ3TLlKsHoWJ+AQ154
   OKi/kqt57n+eChq/vzEM/ooDma7LkamvtcHevj3lMqAGdnIWkZISzI0V+
   pAUXKpZt/BTaA/sOpolfNM6/NUPd3HY6LdnWmVOWDKFdGgXgIlS0v5VBs
   g==;
X-CSE-ConnectionGUID: snAQjdOZSkGreJ1PNQ1xmA==
X-CSE-MsgGUID: qwtj8P+qSvO9OZ3HyKuiKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238566125"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238566125"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:36 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C9297C00408
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:35 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 828B214003F2
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 298BC180113F;
	Thu, 30 Apr 2026 10:50:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/64] python3-pre-commit: upgrade 4.5.1 -> 4.6.0
Date: Thu, 30 Apr 2026 18:49:01 +0800
Message-ID: <20260430104924.1106-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126712

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- feature: allow --hook-dir to be missing to enable easier usage with git 2.54+ git hooks.
- fix: --hook-type is required

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pre-commit_4.5.1.bb => python3-pre-commit_4.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pre-commit_4.5.1.bb => python3-pre-commit_4.6.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pre-commit_4.5.1.bb b/meta-python/recipes-devtools/python/python3-pre-commit_4.6.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pre-commit_4.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pre-commit_4.6.0.bb
index df4769c13e..2dbe9e557b 100644
--- a/meta-python/recipes-devtools/python/python3-pre-commit_4.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pre-commit_4.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b53a93744e3ff841e5fc9a934da8e1c8"
 PYPI_PACKAGE = "pre_commit"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "eb545fcff725875197837263e977ea257a402056661f09dae08e4b149b030a61"
+SRC_URI[sha256sum] = "718d2208cef53fdc38206e40524a6d4d9576d103eb16f0fec11c875e7716e9d9"
 
 RDEPENDS:${PN} = " \
 	python3-cfgv \
-- 
2.43.0


