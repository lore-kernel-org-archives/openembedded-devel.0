Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD5C103E315
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:52:56 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18749.1773312775484388319
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aJYpovmW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312775; x=1804848775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vcZZW2GFSz0VH56RT6/j+ytr6a9UTRDUXlEZ6aOsJcg=;
  b=aJYpovmWraSXIFbq9bLiGNiv80VfKTRJIR2BkK014a28xVkUCFk2/6JD
   7Q6aWvC2QNbZxM1azxLxlx+ZWDvK0GxqH1HEJ7dGOmi998tW8N0ro5dK2
   ibGVjJcn7YW9PYKWK4kbGLQdcWUwWuqGXJcCyDtAU7uqW06K8x8/xbT7z
   rwMYJcIxRV87O7fWjQ26kHgH+/y0/7caLPVF1tCLDW1dq3rUzsOhPxu54
   7gUIz/qWGa2Xp6Lfj1xBr9XDan7e5i/9UPXP1oF4jmSYNkQG873NJFE9Y
   Uoj7t59XkBsWvXtpz3SUPyCgEJSVVGtPGXcEDdX5O7iVwE8Wb2YGGXZ2h
   Q==;
X-CSE-ConnectionGUID: WeuMg74DQo+m1fp4UMahMA==
X-CSE-MsgGUID: G+yMoWDbTO2HWog+2pzbsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="237281224"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="237281224"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:53 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1A96B2B88
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:54 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B785A1C0CACC
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id D3C0C18005BE;
	Thu, 12 Mar 2026 10:52:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 13/64] libcompress-raw-zlib-perl: upgrade 2.217 -> 2.222
Date: Thu, 12 Mar 2026 18:51:29 +0800
Message-ID: <20260312105220.1856-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125113

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 zlib updated to 1.3.2
 Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-zlib-perl_2.217.bb => libcompress-raw-zlib-perl_2.222.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-zlib-perl_2.217.bb => libcompress-raw-zlib-perl_2.222.bb} (78%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.217.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.222.bb
similarity index 78%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.217.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.222.bb
index a95fbed30d..7b5dbd5475 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.217.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.222.bb
@@ -6,11 +6,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Zlib"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=000093d18bfdd0ac3594d80b6e055cec"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=ef65cee670356670f1663558bb46f16e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "48309aa25f126365a3c14f49b4e90da56d29d3c00506c7e7c3b724f6df0684c8"
+SRC_URI[sha256sum] = "1dfd7d511a655627c81815d30d3babc28fa5b88455ff03f8b04099dcb51286b8"
 
 DEPENDS += "zlib"
 
-- 
2.43.0


