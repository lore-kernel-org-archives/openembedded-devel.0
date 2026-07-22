Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F7BC4453E
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:40 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44628.1784715874436533474
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dN5b9yO0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715877; x=1816251877;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LbG+7sppitvZX546RWPCtpjgWBWagTl+P/l8HMbSdTM=;
  b=dN5b9yO0LTDlegDfl7vAY4bcBTmG30MzIEA/VYEoIBpf/MR2ac5qc7Cl
   IT0xNt92nWR9GPzlWhAxqTHuapatH2tSJBLRESEUM79zbrqtVzb8Fo1Fu
   klN8enlXH0jOjOdBvw87J3tC6Mm2I9N5xjf0sgeK7/0yvNeQmzesvfz/0
   /xqbJ2O3BXhrmr+x8uBzJcoqNZmaTrjX8fdeWgZr4V6s6/V7u93Z7bZQq
   yAJVgFZcajYImyFaIj016PgN69/j0trFHegVS+WpbdWzKpuDhEbAECFfk
   60+tBRz0QP9qUDES+egJCsZBsNonZeCKX/Va18lgK84xip0rKTJyq2Czq
   A==;
X-CSE-ConnectionGUID: +FDdHApMSMeGWYHdKpb3RA==
X-CSE-MsgGUID: ZmRn94AXRxeSc45YlWLFdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="248149650"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="248149650"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:35 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CA6EC1C00095
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:32 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 79A0D102FB9E
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 8715F40267D;
	Wed, 22 Jul 2026 10:24:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/37] python3-platformdirs: upgrade 4.10.0 -> 4.10.1
Date: Wed, 22 Jul 2026 18:23:07 +0800
Message-ID: <20260722102320.1019-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128394

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- fix(windows): stop leaking memory on repeated folder lookups
- ci(release): towncrier changelog + publish on tag push
- docs(changelog): rebuild against release history

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-platformdirs_4.10.0.bb => python3-platformdirs_4.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.10.0.bb => python3-platformdirs_4.10.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.10.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.10.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.10.0.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.10.1.bb
index 84c423fdab..7c004a1ed3 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.10.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/platformdirs/platformdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
 
-SRC_URI[sha256sum] = "31e761a6a0ca04faf7353ea759bdba55652be214725111e5aac52dfa29d4bef7"
+SRC_URI[sha256sum] = "ceab4084426fe6319ce18e86deada8ab1b7487c7aee7040c55e277c9ae793695"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


