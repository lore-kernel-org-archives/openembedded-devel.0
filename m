Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B952C36011
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:15:51 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.47595.1743412547202131107
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.52, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 31 Mar 2025 18:15:45 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.84)
	by 156.147.1.127 with ESMTP; 31 Mar 2025 18:15:44 +0900
X-Original-SENDERIP: 10.185.60.84
X-Original-MAILFROM: thond2009@gmail.com
From: Nguyen Dat Tho <thond2009@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nguyen Dat Tho <tho3.nguyen@lge.com>
Subject: [meta-networking][PATCH] snort3: upgrade 3.6.1 -> 3.7.1
Date: Mon, 31 Mar 2025 18:15:35 +0900
Message-Id: <20250331091535.1849307-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116426

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

Changelog:
  https://github.com/snort3/snort3/blob/master/ChangeLog.md

Add 0001-Fix-build-with-gcc-15.patch to fix build with gcc-15

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
---
 .../snort3/0001-Fix-build-with-gcc-15.patch   | 79 +++++++++++++++++++
 .../{snort3_3.6.1.0.bb => snort3_3.7.1.0.bb}  |  5 +-
 2 files changed, 82 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-with-gcc-15.patch
 rename meta-networking/recipes-connectivity/snort/{snort3_3.6.1.0.bb => snort3_3.7.1.0.bb} (87%)

diff --git a/meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-with-gcc-15.patch b/meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..f9cade5256
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-with-gcc-15.patch
@@ -0,0 +1,79 @@
+From 2bfb46b11d35f2fc5f3926376651cc936c6eab13 Mon Sep 17 00:00:00 2001
+From: Nguyen Dat Tho <tho3.nguyen@lge.com>
+Date: Mon, 31 Mar 2025 15:59:51 +0900
+Subject: [PATCH] Fix build with gcc-15
+
+Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
+
+Upstream-Status: Submitted <https://github.com/snort3/snort3/pull/408>
+---
+ tools/snort2lua/config_states/config_ignore_ports.cc     | 1 +
+ tools/snort2lua/preprocessor_states/pps_dcerpc_server.cc | 1 +
+ tools/snort2lua/preprocessor_states/pps_frag3_engine.cc  | 1 +
+ tools/snort2lua/preprocessor_states/pps_stream5_tcp.cc   | 1 +
+ tools/snort2lua/rule_states/rule_gid_sid.cc              | 1 +
+ 5 files changed, 5 insertions(+)
+
+diff --git a/tools/snort2lua/config_states/config_ignore_ports.cc b/tools/snort2lua/config_states/config_ignore_ports.cc
+index 4ddfebb5d..ec180a558 100644
+--- a/tools/snort2lua/config_states/config_ignore_ports.cc
++++ b/tools/snort2lua/config_states/config_ignore_ports.cc
+@@ -21,6 +21,7 @@
+ #include <vector>
+ #include <string>
+ #include <stdexcept>
++#include <cstdint>
+ 
+ #include "conversion_state.h"
+ #include "helpers/converter.h"
+diff --git a/tools/snort2lua/preprocessor_states/pps_dcerpc_server.cc b/tools/snort2lua/preprocessor_states/pps_dcerpc_server.cc
+index 2a41decb8..79e98dd2b 100644
+--- a/tools/snort2lua/preprocessor_states/pps_dcerpc_server.cc
++++ b/tools/snort2lua/preprocessor_states/pps_dcerpc_server.cc
+@@ -25,6 +25,7 @@
+ 
+ #include <algorithm>
+ #include <cstring>
++#include <cstdint>
+ 
+ namespace preprocessors
+ {
+diff --git a/tools/snort2lua/preprocessor_states/pps_frag3_engine.cc b/tools/snort2lua/preprocessor_states/pps_frag3_engine.cc
+index d5c1fcf4d..c0309cc6f 100644
+--- a/tools/snort2lua/preprocessor_states/pps_frag3_engine.cc
++++ b/tools/snort2lua/preprocessor_states/pps_frag3_engine.cc
+@@ -19,6 +19,7 @@
+ 
+ #include <sstream>
+ #include <vector>
++#include <cstdint>
+ 
+ #include "conversion_state.h"
+ #include "helpers/converter.h"
+diff --git a/tools/snort2lua/preprocessor_states/pps_stream5_tcp.cc b/tools/snort2lua/preprocessor_states/pps_stream5_tcp.cc
+index 1e97a58ad..3df35340e 100644
+--- a/tools/snort2lua/preprocessor_states/pps_stream5_tcp.cc
++++ b/tools/snort2lua/preprocessor_states/pps_stream5_tcp.cc
+@@ -20,6 +20,7 @@
+ #include <sstream>
+ #include <vector>
+ #include <string>
++#include <cstdint>
+ 
+ #include "conversion_state.h"
+ #include "helpers/s2l_util.h"
+diff --git a/tools/snort2lua/rule_states/rule_gid_sid.cc b/tools/snort2lua/rule_states/rule_gid_sid.cc
+index 7f2b84ae4..d3215b655 100644
+--- a/tools/snort2lua/rule_states/rule_gid_sid.cc
++++ b/tools/snort2lua/rule_states/rule_gid_sid.cc
+@@ -27,6 +27,7 @@
+ 
+ #include <sstream>
+ #include <unordered_map>
++#include <cstdint>
+ 
+ #include "conversion_state.h"
+ #include "helpers/converter.h"
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.6.1.0.bb b/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/snort/snort3_3.6.1.0.bb
rename to meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
index 622ab56ae9..54eef87a41 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.6.1.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
@@ -9,9 +9,10 @@ DEPENDS = "flex-native hwloc libdaq libdnet libpcap libpcre libtirpc libunwind l
 
 SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master \
            file://0001-cmake-Check-for-HP-libunwind.patch \
-           file://0001-cmake-Pass-noline-flag-to-flex.patch"
+           file://0001-cmake-Pass-noline-flag-to-flex.patch \
+           file://0001-Fix-build-with-gcc-15.patch"
 
-SRCREV = "2f8c230d6605279b19dac8fe59e27f034ee81510"
+SRCREV = "6a11279883a8584e06ad9ab2df162c639961cd61"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


