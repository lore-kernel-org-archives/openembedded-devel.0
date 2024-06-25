Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25E5C30653
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 06:59:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.web11.165158.1719298767523181894
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jun 2024 23:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=RPFQnnvo;
 spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 198.175.65.17, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719298768; x=1750834768;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0wpV/jKTL9P9pL+GUoIUlj8g9WtcYzZayuQoFJYg7zA=;
  b=RPFQnnvokkDHvm1F/E3Nu0MzQdGTlM5ON2eBl/Maw5pyDqfEMDgBcesQ
   RODe0S6wcNMZI2b5cFIJ913zVXRyCnzz0BFgnnVF+NAj4gU0RYOi1qr/H
   rzvUziFSVkDRgZxBAsQ7GZuJVCT/vJ5MPzE6Lj7vd6uB5OpjF1IEUAL9o
   Oz8aPbhQIbvLmsZIE0i7rjIjZWocRWzdiRcEzGQz+9HsyXwxLocJ6cf/B
   LuarXME7mw0hltWvqUzUCbAQ1YmkPNXmqKXPnSFSbBrVMz1akZZBBkTsY
   wCQW+ra95mstLFa4cfHSmuZCz15CVXKv+fefArOzFcyL1Y8+TX6HNirkK
   w==;
X-CSE-ConnectionGUID: 67U/txD9R86MHHY/H+eg0A==
X-CSE-MsgGUID: qQ4y1yB+SZ+7yNoBK9yh8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16429041"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="16429041"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 23:59:27 -0700
X-CSE-ConnectionGUID: jGC8QcoERI+QIf69NmMN3g==
X-CSE-MsgGUID: cPW2xNAdRaaQKumxUGLKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="43981344"
Received: from unknown (HELO jiaqingz-acrn-container.sh.intel.com) ([10.239.43.235])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 23:59:26 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [meta-oe][kirkstone][PATCH] rdfind: fix build with gcc-13
Date: Tue, 25 Jun 2024 06:59:16 +0000
Message-ID: <20240625065916.440427-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 06:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111012

<cstdint> need to be included explicitly when compiling with gcc-13.

Upstream-Status: Backport [1.6.0 https://github.com/pauldreik/rdfind/commit/f6c3f698dd680931b5c2f05688319290bdf0d930]
Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 ...0001-include-standard-header-cstdint.patch | 41 +++++++++++++++++++
 .../recipes-support/rdfind/rdfind_1.4.1.bb    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-header-cstdint.patch

diff --git a/meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-header-cstdint.patch b/meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-header-cstdint.patch
new file mode 100644
index 000000000..6875f5f46
--- /dev/null
+++ b/meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-header-cstdint.patch
@@ -0,0 +1,41 @@
+From 067790f733ad55a53e8218015710885da9484304 Mon Sep 17 00:00:00 2001
+From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+Date: Tue, 25 Jun 2024 06:45:20 +0000
+Subject: [PATCH] include standard header <cstdint>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer
+transitively included [1]. Explicitly include it for uint64_t.
+
+Fixes errors like below
+
+In file included from ../rdfind-1.4.1/Fileinfo.cc:22:
+../rdfind-1.4.1/Fileinfo.hh:68:8: error: 'int64_t' in namespace 'std' does not name a type
+   68 |   std::int64_t getidentity() const { return m_identity; }
+      |        ^~~~~~~
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Backport [1.6.0 https://github.com/pauldreik/rdfind/commit/f6c3f698dd680931b5c2f05688319290bdf0d930]
+Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+---
+ Fileinfo.hh | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Fileinfo.hh b/Fileinfo.hh
+index 69a1b2a..f1eb748 100644
+--- a/Fileinfo.hh
++++ b/Fileinfo.hh
+@@ -8,6 +8,7 @@
+ #define Fileinfo_hh
+ 
+ #include <array>
++#include <cstdint>
+ #include <string>
+ 
+ // os specific headers
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb b/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
index 64ae62a2d..3a5938d22 100644
--- a/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
+++ b/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fa22e16ebbe6638b2bd253338fbded9f"
 DEPENDS = "nettle autoconf-archive"
 
 SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz \
+           file://0001-include-standard-header-cstdint.patch \
 "
 
 SRC_URI[md5sum] = "180418c863b861d1df221bc486a07ce7"
-- 
2.43.0


