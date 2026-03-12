Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAF6105A571
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:54:08 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18542.1773312843955432254
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RibIouFo;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312844; x=1804848844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4NuZmxgJ1okj+ea8bN8dHxuMwFCWa7afxgvrYQ1He+E=;
  b=RibIouFolJAEjlXMtT+rRN0hUajVnREBgAqa0D+Lw1seOQR4He7RhalG
   vBk0k5TzxxD/7rMOYdvBNgrG89+d1OOUL60+6mi8MTk7HHzC3Fv0xsWkj
   0V3sVDsVpK5LZvqGob3fqTyyAeWr4mrpdm4hiiHfHShcS1yjyxpPgl4gM
   sFMxfmd441hmu/kHr4zwySrd7+c1YeN++B7EdgJ71f6omgRdOFIBSCB4Z
   yHgaX6QUOEkbQSCEd1yWCvwGQ74YzSOaNpeB0/g5WpcsrsVSLUfRorrZO
   LkuCiY+4GKyTY4b1V8pGPz6+LPbYMqPsSwYE//7PYkVmMYhIk78vx+46C
   Q==;
X-CSE-ConnectionGUID: 0OPosQc+QFqm+BiosVm9wQ==
X-CSE-MsgGUID: vXEQL4+xQhaZU7jcXw3frw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220449447"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220449447"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:54:02 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8019D1C01434
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:02 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 249661001511
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4935E1801925;
	Thu, 12 Mar 2026 10:53:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 45/64] python3-platformdirs: upgrade 4.9.2 -> 4.9.4
Date: Thu, 12 Mar 2026 18:52:01 +0800
Message-ID: <20260312105220.1856-45-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125145

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix test failures on BSD for runtime directory defaults
- Respect XDG_CONFIG_HOME in _get_user_dirs_folder
- Add missing _optionally_create_directory in Android user_log_dir and user_runtime_dir
- Add permissions to workflows
- Move SECURITY.md to .github/SECURITY.md
- Standardize .github files to .yaml suffix
- docs: add project logo to documentation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_4.9.2.bb => python3-platformdirs_4.9.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.9.2.bb => python3-platformdirs_4.9.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.9.2.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.9.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.9.2.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.9.4.bb
index cbe638d47d..df0e3597b7 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.9.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/platformdirs/platformdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
 
-SRC_URI[sha256sum] = "9a33809944b9db043ad67ca0db94b14bf452cc6aeaac46a88ea55b26e2e9d291"
+SRC_URI[sha256sum] = "1ec356301b7dc906d83f371c8f487070e99d3ccf9e501686456394622a01a934"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


