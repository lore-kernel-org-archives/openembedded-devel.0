Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E1DCD4F49
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:19:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.18544.1695377960065652485
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 03:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=JVurLxPY;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695377960; x=1726913960;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FW6GCSXS5DaWLc/mQxntVwQ7312tsQQ11qtx3FYdUtU=;
  b=JVurLxPYWcl94eHWtWtcgqKQxdP9Gk1lX3lQufH+q+fQ9uRicrM6TI4O
   tq7VO3UZZHl6zh2TkAa8cp3Oh99pj1GOM65/QbImfc3dteugQRITBcv1y
   OiVpBX034rZ6W4D90PjPIxbCV/6GIsVUIjso7fhZ4+9v7WNDgjO0v8WP8
   jzKqhpfOR0oOc2113kGL4U0yTBkxLAiI5YSOONvDLQJl7nbJCy8sRwCfB
   UY7XuLSojA0BMKkezucst8kwcBFjG/0CGyitZCVhmaneoPAvOBVjlK7hS
   0qRaIg/CzB9ScStYFxt8pBVOCezNxoV+Odm0Z8B222u32xtKr1QvnO44c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383542990"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="383542990"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 03:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817729063"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="817729063"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2023 03:19:18 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/5] irssi: 1.4.2 -> 1.4.4
Date: Fri, 22 Sep 2023 17:59:37 +0800
Message-Id: <20230922095941.3958983-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 10:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105050

From: Lee Chee Yang <chee.yang.lee@intel.com>

1.4.4
The Irssi team released this 2023-03-31

Changes
Expose location of signals.txt via pkg-config (codeberg!1, #1439, #1446,

Additions
Levels can now be inverted using ^ prefix in the /WINDOW (HIDE)LEVEL
commands (#1428)

Support receiving monospace (#1370, #1442). By Linus Heckemann

Fixes
Fix config broken by /WINDOW LOGFILE without parameter (#1392, #1432)

Fix broken /LASTLOG -window switch (#1418, #1424, regression introduced
in #1398)

Fix logic in how actions are printed for other protocols (codeberg!3,

Fix stale special collector use after free (#1456). Reported by ednash

Help and message fixes (#1421, #1429, #1431, #1434, #1438, #1452, #1453,

1.4.3
The Irssi team released this 2022-10-31

Fixes
Fix freeze on Alt+arrows (#1416, #1417)

Fix crash on /upgrade (#1399, #1419)

Fix saving of -disallow_starttls (#1401, #1420)

Fix libnv detection on FreeBSD (freebsd#265397, #1407). By Guido Falsi
and Kristof Provost

Minor help and script fixes (#1380, #1393, #1411, #1413, #1414, #1415)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../irssi/{irssi_1.4.2.bb => irssi_1.4.4.bb}                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/irssi/{irssi_1.4.2.bb => irssi_1.4.4.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_1.4.2.bb b/meta-oe/recipes-connectivity/irssi/irssi_1.4.4.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/irssi/irssi_1.4.2.bb
rename to meta-oe/recipes-connectivity/irssi/irssi_1.4.4.bb
index 455561f613..52de589dd8 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_1.4.2.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_1.4.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
 DEPENDS = "glib-2.0 ncurses openssl"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "79a4765d2dfe153c440a1775b074d5d0682b96814c7cf92325b5e15ce50e26a8"
+SRC_URI[sha256sum] = "fefe9ec8c7b1475449945c934a2360ab12693454892be47a6d288c63eb107ead"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.37.3


