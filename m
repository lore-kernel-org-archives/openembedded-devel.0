Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946E8C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 06:21:24 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web10.5560.1743142879228761184
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 23:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.53, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 28 Mar 2025 15:21:16 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.40)
	by 156.147.1.121 with ESMTP; 28 Mar 2025 15:21:16 +0900
X-Original-SENDERIP: 10.185.60.40
X-Original-MAILFROM: thond2009@gmail.com
From: thond2009 <thond2009@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "tho3.nguyen" <tho3.nguyen@lge.com>
Subject: [meta-oe][PATCH] apitrace: Fix build with gcc-15
Date: Fri, 28 Mar 2025 15:21:15 +0900
Message-Id: <20250328062115.126982-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 06:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116344

From: "tho3.nguyen" <tho3.nguyen@lge.com>

To fix errors:
In file included from TOPDIR/tmp/work/core2-64-oe-linux/apitrace/11.1+11.1+git/git/frametrim/ft_matrixstate.hpp:30,
                 from TOPDIR/tmp/work/core2-64-oe-linux/apitrace/11.1+11.1+git/git/frametrim/ft_matrixstate.cpp:28:
TOPDIR/tmp/work/core2-64-oe-linux/apitrace/11.1+11.1+git/git/frametrim/ft_dependecyobject.hpp:187:44: error: 'uint64_t' was not declared in this scope
  187 |     std::unordered_map<unsigned, std::pair<uint64_t, uint64_t>> m_buffer_mappings;
      |                                            ^~~~~~~~
...
TOPDIR/tmp/work/core2-64-oe-linux/apitrace/11.1+11.1+git/git/retrace/metric_writer.cpp:50:70: error: 'uint64_t' does not name a type
   50 |         case CNT_NUM_UINT64: std::cout << "\t" << *(reinterpret_cast<uint64_t*>(data)); break;
...

Signed-off-by: tho3.nguyen <tho3.nguyen@lge.com>
---
 .../0001-Explicit-header-stdint.patch         | 42 +++++++++++++++++++
 .../apitrace/apitrace_11.1.bb                 |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/apitrace/apitrace/0001-Explicit-header-stdint.patch

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace/0001-Explicit-header-stdint.patch b/meta-oe/recipes-devtools/apitrace/apitrace/0001-Explicit-header-stdint.patch
new file mode 100644
index 0000000000..9ce6693061
--- /dev/null
+++ b/meta-oe/recipes-devtools/apitrace/apitrace/0001-Explicit-header-stdint.patch
@@ -0,0 +1,42 @@
+From 952bad1469ea747012bdc48c48993bd5f13eec04 Mon Sep 17 00:00:00 2001
+From: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
+Date: Fri, 21 Mar 2025 05:02:23 +0000
+Subject: [PATCH] Explicit header: stdint
+
+Fix building with GCC-15. It no longer includes it by default.
+
+Upstream-Status: Backport [https://github.com/apitrace/apitrace/commit/952bad1469ea747012bdc48c48993bd5f13eec04]
+
+Signed-off-by: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
+---
+ frametrim/ft_dependecyobject.hpp | 1 +
+ retrace/metric_writer.cpp        | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/frametrim/ft_dependecyobject.hpp b/frametrim/ft_dependecyobject.hpp
+index 2cd0b768..0f17b601 100644
+--- a/frametrim/ft_dependecyobject.hpp
++++ b/frametrim/ft_dependecyobject.hpp
+@@ -28,6 +28,7 @@
+ #pragma once
+ 
+ #include "ft_tracecall.hpp"
++#include <stdint.h>
+ 
+ namespace frametrim {
+ 
+diff --git a/retrace/metric_writer.cpp b/retrace/metric_writer.cpp
+index e923ed1d..4e4ce748 100644
+--- a/retrace/metric_writer.cpp
++++ b/retrace/metric_writer.cpp
+@@ -24,6 +24,7 @@
+  **************************************************************************/
+ 
+ #include <iostream>
++#include <stdint.h>
+ 
+ #include "metric_writer.hpp"
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
index d872c4dbb5..48ba7dbaea 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
 SRCREV = "9352fc02bba106fbbeef9e8452ef34643c0d0764"
 PV .= "+11.1+git"
 SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
+           file://0001-Explicit-header-stdint.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


