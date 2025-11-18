Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A23ACEBF92
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:08 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8424.1763456942379571272
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LY9DvAoR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456942; x=1794992942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MhMj6b8jpvB4mngJZwiajYBnQuwzPyC3i5S+lc99Jkk=;
  b=LY9DvAoRUXKGZhUpdb8kcwzm1unO8c9PAngi2zJpoI9KNHdKmK8F3LzC
   czqtn91cUsWMonocP4AQFGtlQnyOVOjngZCvVbXEBqEflDdIFIBB6IkXo
   dQuy3nvnKBP7dWFKhNhwHqrF68dS+3IJvp34n0e+tdJ0oITRDgj7XrY/S
   2gV4+axnM4G36qL1a/395olGic2TyFXKWPAohgx7+WYTL4XLcmlbDTNBy
   2gpwjJxqBGwRZJ3NXiIlmKkkxXQ6yTrcQf1sYgRXLfFL9ayVNeTH4XReV
   DBcrlNeXN4awXVwwYsKA3TnoGAdhwO2d5B8hnn29xFpIcvbMwmAuraHj2
   Q==;
X-CSE-ConnectionGUID: Jx3ivMckSkOVxtoA7KEIxg==
X-CSE-MsgGUID: U62P3drfRYWKXJYEOxsOfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="223411634"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="223411634"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:00 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id C17A81C0008F
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:00 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 678981C00161
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id EE9F11400252;
	Tue, 18 Nov 2025 09:08:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/29] graphviz: upgrade 14.0.2 -> 14.0.4
Date: Tue, 18 Nov 2025 17:08:22 +0800
Message-ID: <20251118090846.1484-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121816

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
### Changed

- Internal timing operations now use 'clock()' on all platforms (previously this
  was only used on Windows). This should result in more accurate timing in
  verbose informational messages.
- Building Graphviz with expat &lt; 2.2.8 is no longer supported on MinGW.

### Fixed

- 'diffimg' now notices failures when calling Ghostscript to convert PS images
  to PNG and exits instead of continuing.
- 'dtstat' no longer reads/writes out of bounds memory on platforms where
  'sizeof(int) < sizeof(size_t)'. This was a regression in Graphviz 7.0.1.
- Some incorrect variable types in the libcdt man page have been corrected.
- 'gvgen' no longer triggers Undefined Behavior when asked to generate a binary
  tree with depth >= 32 (e.g. 'gvgen -t32').
- 'gvgen' no longer triggers Undefined Behavior when asked to generate a
  hypercube with depth  >= 32 (e.g. 'gvgen -h32').
- A null pointer dereference in edge pair analysis within the circo algorithm
  has been fixed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_14.0.2.bb => graphviz_14.0.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_14.0.2.bb => graphviz_14.0.4.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_14.0.2.bb b/meta-oe/recipes-graphics/graphviz/graphviz_14.0.4.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_14.0.2.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_14.0.4.bb
index 6cd285392f..3188c8afd5 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_14.0.2.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_14.0.4.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "31af4728cd0d7db91013d29286227ae6b5264ff897647c2ebfeb85f47c08177e"
+SRC_URI[sha256sum] = "a005977de2fec13753f5bde767cf97fdc28ac54bfd6a2737c563748bc4f32317"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


