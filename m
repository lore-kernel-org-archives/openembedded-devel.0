Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D28CC531BC
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:39 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44604.1784715814088869902
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IwkOxX6L;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715817; x=1816251817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K4x2by8aqm8ameYa6lk/35CUVRYgMwHqgZp/qyjglDY=;
  b=IwkOxX6LM1YaDUnze/v+aJbP01+smIWkpjZKdHm6fdT0awRd+RcjCwim
   Kc4rNuPQLw0RaJkC5wGMugFM3BltjJQIjLhvae24+UVz9u+YjoZvGmOll
   2ofCVWy+Uw7aVDdAcG1Xsl8zZv6L4fFLjj3SGlI035o/zQjebRydH9NxX
   2nhGgcfy42zbiHzRGqOD8CzfUyOJK3UaCIYG9tZxGR7vRhyvKr2lXfqvg
   DDdsGcB6BWMd9SFEQM5tpEEz43+pNsl+33gxYdSOEL3aBAG2zq+STf49b
   Wy1qhL5aFd5g1MN6Th0OZkbTKbEcpvy36I7/bNM+nAl/y5k55U9FYx+Lz
   Q==;
X-CSE-ConnectionGUID: au/4coNNThqSxtHZV/e0tA==
X-CSE-MsgGUID: qWzCfnSwTw+Gq92XhneJIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="251743030"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="251743030"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:36 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9754482008F
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:36 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 4E8FDC252C5
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 6DF03405E39;
	Wed, 22 Jul 2026 10:23:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/37] libdbi-perl: upgrade 1.650 -> 1.651
Date: Wed, 22 Jul 2026 18:22:48 +0800
Message-ID: <20260722102320.1019-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128375

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix inverted comparisons for strings in DBI::SQL::Nano  (CVE-2026-15043)
* Document that IS NULL matches empty strings in DBI::SQL::Nano
* Fix DBD::File to ensure that the table is not a symlink outside of f_dir (CVE-2026-15392)
* Fix an out-of-bounds error when a statement handle has no fields but the source row is not empty (CVE-2026-60082)
* Add an overridable upper bound $MAX_PATH_DEPTH for DBI::ProfileData (CVE-2026-60081)
* *** WARNING: Next release will require perl-5.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{libdbi-perl_1.650.bb => libdbi-perl_1.651.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{libdbi-perl_1.650.bb => libdbi-perl_1.651.bb} (95%)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.650.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.651.bb
similarity index 95%
rename from meta-oe/recipes-devtools/perl/libdbi-perl_1.650.bb
rename to meta-oe/recipes-devtools/perl/libdbi-perl_1.651.bb
index fa1a727eea..e641ac3167 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.650.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.651.bb
@@ -10,7 +10,7 @@ LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1a1138dff61f77bbc3d8782caba6758d"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz"
-SRC_URI[sha256sum] = "a807b817c1cfb0fe6ecccff1d9ddeb293c317d518f5ab2007dfb9d3bccdbcf83"
+SRC_URI[sha256sum] = "da621a23fa68e1e04fac824cfd3d41e8ffbab2ab3eba642a12499242e8be5253"
 
 S = "${UNPACKDIR}/DBI-${PV}"
 
-- 
2.43.0


