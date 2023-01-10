Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195D3C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 07:23:04 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.98124.1673335373719364285
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 23:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=BhfXIGxR;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673335373; x=1704871373;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tTNV+FvayzlOLINF6zM9ZnTlenlotbmrbTGAvtpI0E4=;
  b=BhfXIGxRwEKK+owX9RmLfeyzC/1VWQ9ItCfpyWAPxEvBQF/CeO08mj8P
   cgNUEzFMzSlTGcFzeWYcFfXmgTt7lzDucW0BEvwYcUu7WTbA2T0WJJD9c
   6eFNRLXLac60O9MGfPaP+T0Wj5cf34sZCK2nyMvtADsof09jk23MoJKGm
   5stO3IA8MyGv5PjysXKABAejuE2bexCYdHvpxwzxS1t1WSZ8tgY5urnA9
   hrwJ3YPiqC0rqMJ++fIjenPDK7RwqzAYsadN/xEug+f/SR8STP2BmN2HJ
   Kbah5CNu5pFD3KoHi2pJidzm3ZjAU7Yv/Bi9JWuP6p9W67VHvvlBzsY5j
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="310882542"
X-IronPort-AV: E=Sophos;i="5.96,314,1665471600"; 
   d="scan'208";a="310882542"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 23:22:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="745667309"
X-IronPort-AV: E=Sophos;i="5.96,314,1665471600"; 
   d="scan'208";a="745667309"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Jan 2023 23:22:52 -0800
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHc] xerces-c: upgrade to 3.2.4
Date: Tue, 10 Jan 2023 15:22:45 +0800
Message-Id: <20230110072245.2179070-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 07:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100511

From: Chee Yang Lee <chee.yang.lee@intel.com>

also fix reproducible build

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../xerces-c/{xerces-c_3.1.4.bb => xerces-c_3.2.4.bb}      | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/xerces-c/{xerces-c_3.1.4.bb => xerces-c_3.2.4.bb} (83%)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.4.bb
similarity index 83%
rename from meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
rename to meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.4.bb
index 22fd94b093..582c29379a 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.4.bb
@@ -10,8 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "http://archive.apache.org/dist/xerces/c/3/sources/${BP}.tar.bz2"
-SRC_URI[md5sum] = "d04ae9d8b2dee2157c6db95fa908abfd"
-SRC_URI[sha256sum] = "9408f12c1628ecf80730bedbe8b2caad810edd01bb4c66f77b60c873e8cc6891"
+SRC_URI[sha256sum] = "74aa626fc71e729ee227602870dd29a5a01cd8c9c1c7330837a51da2eb5722cc"
 
 inherit autotools
 
@@ -20,7 +19,7 @@ PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR_TARGET}${prefix},--with-curl=no
 PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR_TARGET}${prefix},--with-icu=no,icu"
 
 do_install:prepend () {
-    sed -i -e 's:-L${STAGING_DIR}/lib:-L\$\{libdir\}:g' ${B}/xerces-c.pc
+    sed -i s:-L${STAGING_LIBDIR}::g ${B}/xerces-c.pc
 }
 
 PACKAGES = "libxerces-c \
@@ -32,7 +31,7 @@ PACKAGES = "libxerces-c \
 
 RPROVIDES:${PN}-dbg += "libxerces-c-dbg xerces-c-samples-dbg"
 
-FILES:libxerces-c = "${libdir}/libxerces-c-3.1.so"
+FILES:libxerces-c = "${libdir}/libxerces-c-3.2.so"
 FILES:libxerces-c-dev = "${libdir}/lib*.la \
     ${libdir}/libxerces-c.so \
     ${libdir}/pkgconfig/xerces-c.pc \
-- 
2.37.3


