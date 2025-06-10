Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7754C61CE8
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:50 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.78430.1749526423382039445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PLBjQrvI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526430; x=1781062430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wtkMIp/6J9RAz/PVJoPCvCw5wKiOnsGuyADYE/qI7qU=;
  b=PLBjQrvIii1R06FS1vyzFgYcYLCi0iG8rA0Zv8Ccw6RiL/OTljEmlSJS
   shOMy36TW61PyBa0ecovxr1DoG2LVkelLeKgg23REJgKk6/id+TKA6Czw
   I+SsyuPvJpfw8/0r68ylFyX7+LfwdMPXju2L9KRwgPIYEtpdKzJxSlWys
   mR2IJQB8fTEOV3PMyKdgtohi93ZfEm+62I7bWr2RcPmaip3wiFsssPxB3
   dqUUXbQdv/jQ7Tkq2cCjYJo4LovgAMgoJi6TzEPSk5n4OvYWTwSvXQ7c7
   K2JxwXH3Bg9Gb2PILfX+cV8Ob47JLLpETduIDUV8t3LWlf3t6Z68Dogh3
   w==;
X-CSE-ConnectionGUID: MEWR7dkiR0KzfPGJtigEbg==
X-CSE-MsgGUID: Wf8GmJOwRIKSrgRQNOcD7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="205286186"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="205286186"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:48 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 618DEC68FB
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0ACF1D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:46 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8F0451A009B;
	Tue, 10 Jun 2025 11:33:45 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/64] python3-fsspec: upgrade 2025.3.2 -> 2025.5.1
Date: Tue, 10 Jun 2025 11:32:58 +0800
Message-ID: <20250610033330.924-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117822

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Enhancements
- file system for GitHub gists
- add rm in github
- cachingFS performance, don't ls every time
- pyscript: protocol and optional entrypoint

Other
- doc fixes
- add "gs" at mention of gcsfs in docs
- lint style
- glob docstring to reflect reality

Fixes
- improve cp in generic
- fix ls in dbfs
- fix parquet tests for pyarrow 20
- fix crosslink for local tempfile
- keep permissions in local transaction
- signature compatibility in local cp()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fsspec_2025.3.2.bb => python3-fsspec_2025.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fsspec_2025.3.2.bb => python3-fsspec_2025.5.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2025.3.2.bb b/meta-python/recipes-devtools/python/python3-fsspec_2025.5.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-fsspec_2025.3.2.bb
rename to meta-python/recipes-devtools/python/python3-fsspec_2025.5.1.bb
index 623f0a7ed0..c65111e5cc 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2025.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2025.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
 
-SRC_URI[sha256sum] = "e52c77ef398680bbd6a98c0e628fbc469491282981209907bbc8aea76a04fdc6"
+SRC_URI[sha256sum] = "2e55e47a540b91843b755e83ded97c6e897fa0942b11490113f09e9c443c2475"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


