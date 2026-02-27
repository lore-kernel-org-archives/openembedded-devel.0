Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C68FD7F65
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:10 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92439.1772187245637931111
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YlPpJaxn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187245; x=1803723245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+qhB80i5NOEtJCJ3lV2pPnM3fJX8xOx3iAvrqYwW/fA=;
  b=YlPpJaxnCB/3dHltk5MAdbGF+haFJcjJuvRtS0dd9eDaOFRWSGcV4HGh
   MR6xkMvUL5n0cVfRbHf33w6BbEekVaIErwEQ82KkHBivyso61+rnPRiKs
   gvgOm8a8OFH7oTstIy0cKLmwrVoc9RRvSF8TX9t8DgktfLJxvk/lc+uRK
   2x2Tuv9ypeg31ICauiYrz3oIobjSBIIJHLJFtrZO43THdlgdjBajc4uQ7
   +Qr5KGgiRxjHjQNjbPVZONlMFGSkwWMpDmJULZz+Xi5VppyGv3N6XTEDj
   LwGetJCgXUazSo7I3a+Y8ksWziK/BxsFz7mnOqHOa6Empo6sdoAy/s7JO
   g==;
X-CSE-ConnectionGUID: 8AW6oT5QTYKT5j/DkDjN+A==
X-CSE-MsgGUID: kES+cZkgQ2GUcyQAmZT7wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="219257523"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="219257523"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.fujitsu.com (Postfix) with ESMTPS id 14D81C00354
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:04 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BF4398D65CC
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id CDD5918005BF;
	Fri, 27 Feb 2026 10:14:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/52] python3-gcovr: upgrade 8.5 -> 8.6
Date: Fri, 27 Feb 2026 18:12:47 +0800
Message-ID: <20260227101327.1432-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124712

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Drop support for Python 3.9.Add support for Python 3.14.
- To avoid merge errors, add the line number to the name of the unknown function.
- If intermediate files are kept, rename the gcov files before processing them to log the final filename.
- Use the first line after a function definition and not the first line which is hit.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gcovr_8.5.bb => python3-gcovr_8.6.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gcovr_8.5.bb => python3-gcovr_8.6.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_8.5.bb b/meta-python/recipes-devtools/python/python3-gcovr_8.6.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gcovr_8.5.bb
rename to meta-python/recipes-devtools/python/python3-gcovr_8.6.bb
index 68cc9bc274..3098681bef 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_8.6.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     git://github.com/gcovr/gcovr.git;branch=main;protocol=https \
     file://0001-pyproject.toml-Support-newer-versions.patch \
 "
-SRCREV = "71eedb8f300612d4095f2ffa4ac60e3fdd58c192"
+SRCREV = "e01ad73582821b5f90e079482164f8e885121e57"
 
 
 inherit python_hatchling
-- 
2.43.0


