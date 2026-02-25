Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A39DEFD226
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:11 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42038.1772012282145054287
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SjMWp25o;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012282; x=1803548282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Di39ruo0xWB4bnOQ3MPp22/ylzN+/+BZxtRk/sa81YI=;
  b=SjMWp25oWx2FLfVvCqvZf/cKJOCoxP0jIe1s0nrgGh39V2tP8dG2SXq9
   WfB9w3kRu0FXoqvCUdzXGvYN79uoEacWwzStODCFZ+I/sTC9ZlacKnhde
   HhcFhy9Cuc0mCtZVPyyPMYGb0RY3V3I/NzfBGQWTYeJeThWKrnIEHVGVH
   bnO0yKutKaHJN3xysPWpF9wVzhsflWqIrS1cao/2WSxkoe3KZgITHdqOJ
   Y0pLCPv8MVV3VaG/LgRU6XTbaGZdSJ37XEs2quVdJFoQYiokiRi0b5L9T
   B6ANpJY+JcXY4d4Rdw+f4l3fJ+sPJKp2phlUIvcS9ModFl9zQg/OKXien
   g==;
X-CSE-ConnectionGUID: ZDek4XZiQn2GjJUHiP5WWQ==
X-CSE-MsgGUID: Apx7CVs9TBimazTYcQXOmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="219620571"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="219620571"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id AE8FE40757F
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:00 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 52C381400609
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 743EB101BB70;
	Wed, 25 Feb 2026 09:37:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/33] jwt-cpp: upgrade 0.7.1 -> 0.7.2
Date: Wed, 25 Feb 2026 17:37:07 +0800
Message-ID: <20260225093727.1284-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124625

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Improve as_date narrowing conversion from C4244 warning
- update trait dependencies to support CMake v4
- Fix linter error
- Update workflows for new GitHub Action Runner Images
- Support passing ssl library key handles to algorithms
- Update CMP0135 to new behaviour
- Fix error in CMake config-file package
- CMake: synchronize cmake_minimum_required from main CMakeLists.txt
- Reduce usage of std::time_t, std::chrono::system_clock::to_time_t and
  system_clock::from_time_t in order to get correct dates when working with a
  32bit application
- Fix set_expires_in not accepting non-default Period
- AppVeyor Warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jwt-cpp/{jwt-cpp_0.7.1.bb => jwt-cpp_0.7.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/jwt-cpp/{jwt-cpp_0.7.1.bb => jwt-cpp_0.7.2.bb} (85%)

diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb
similarity index 85%
rename from meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
rename to meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb
index 5ad953d260..eb8bc59322 100644
--- a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
+++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb
@@ -4,10 +4,10 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8325a5ce4414c65ffdda392e0d96a9ff"
 
-SRC_URI = "git://github.com/Thalhammer/jwt-cpp.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/Thalhammer/jwt-cpp.git;branch=master;protocol=https;tag=v${PV} \
             "
 
-SRCREV = "e71e0c2d584baff06925bbb3aad683f677e4d498"
+SRCREV = "b0ea29a58fc852a67d4e896d266880c2c63b0c4c"
 
 
 DEPENDS = "openssl"
-- 
2.43.0


