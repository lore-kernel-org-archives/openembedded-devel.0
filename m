Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CDFEE6E672
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:33:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6O2XdtV024650
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 19:33:39 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 23 Jul 2018 19:33:37 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Jul 2018 10:33:33 +0800
Message-ID: <1532399613-7129-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH] snort: upgrade 2.9.7.5 -> 2.9.11.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jul 2018 02:33:37 -0000
Content-Type: text/plain

* Update SRC_URI

* Drop 0001-fix-do_package-failed-since-snort-2.9.7.0.patch since the
  issue had been fixed upstream.

* Drop the following patches and merge their modifications to
  disable-run-test-program-while-cross-compiling.patch:
    disable-dap-address-space-id.patch
    disable-daq-flow-id.patch
    disable-daq-verdict-retry.patch
    disable-inaddr-none.patch

* Add disable-run-test-program-while-cross-compiling.patch to fix
  configure error: cannot run test program while cross compiling.

  The variables have_daq_real_addresses, have_daq_ext_modflow,
  have_daq_queryflow, have_daq_data_channel_flags and
  have_daq_data_channel_separate_ip_versions are set to no since they
  are for daq 2.2.2 but we have daq 2.0.6 in meta-networking layer.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...fix-do_package-failed-since-snort-2.9.7.0.patch |  33 ---
 .../snort/snort/disable-dap-address-space-id.patch |  62 -----
 .../snort/snort/disable-daq-flow-id.patch          |  60 -----
 .../snort/snort/disable-daq-verdict-retry.patch    |  60 -----
 .../snort/snort/disable-inaddr-none.patch          |  85 -------
 ...le-run-test-program-while-cross-compiling.patch | 254 +++++++++++++++++++++
 .../snort/{snort_2.9.7.5.bb => snort_2.9.11.1.bb}  |  12 +-
 7 files changed, 258 insertions(+), 308 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort/0001-fix-do_package-failed-since-snort-2.9.7.0.patch
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort/disable-dap-address-space-id.patch
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort/disable-inaddr-none.patch
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/disable-run-test-program-while-cross-compiling.patch
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.7.5.bb => snort_2.9.11.1.bb} (89%)

diff --git a/meta-networking/recipes-connectivity/snort/snort/0001-fix-do_package-failed-since-snort-2.9.7.0.patch b/meta-networking/recipes-connectivity/snort/snort/0001-fix-do_package-failed-since-snort-2.9.7.0.patch
deleted file mode 100644
index 047caec..0000000
--- a/meta-networking/recipes-connectivity/snort/snort/0001-fix-do_package-failed-since-snort-2.9.7.0.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 4335c4c61877c0b65ff4ec767e8ad3ad8c73c32d Mon Sep 17 00:00:00 2001
-From: Zhiquan Li <zhiquan.li@windriver.com>
-Date: Fri, 13 Nov 2015 17:40:24 +0800
-Subject: [PATCH] fix do_package failed since snort 2.9.7.0
-
-Remove redundant '/' as a workround for below error:
-/lib/rpm/bin/debugedit: canonicalization unexpectedly shrank by one character
-
-It's a rpm debugedit bug:
-* http://sourceforge.net/p/snort/mailman/message/34130268/
-* https://bugzilla.redhat.com/show_bug.cgi?id=304121
-
-Upstream-Status:Inappropriate [embedded specific]
-
-Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
-
----
- src/snort.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/snort.h b/src/snort.h
-index 8308e57..499d157 100644
---- a/src/snort.h
-+++ b/src/snort.h
-@@ -39,7 +39,7 @@
- #include "sfdaq.h"
- #include "sf_types.h"
- #include "sfutil/sflsq.h"
--#include "sfutil//sfActionQueue.h"
-+#include "sfutil/sfActionQueue.h"
- #include "profiler.h"
- #include "rules.h"
- #include "treenodes.h"
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-dap-address-space-id.patch b/meta-networking/recipes-connectivity/snort/snort/disable-dap-address-space-id.patch
deleted file mode 100644
index 6aa0b73..0000000
--- a/meta-networking/recipes-connectivity/snort/snort/disable-dap-address-space-id.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 5a53260a819e2873f58165e96852529719101c53 Mon Sep 17 00:00:00 2001
-From: Chunrong Guo <B40290@freescale.com>
-Date: Mon, 4 Nov 2013 10:39:56 +0800
-Subject: [PATCH] snort: add recipe
-
-Upstream-Status:Inappropriate [embedded specific]
-
-fix the below error:
-checking for dap address space id... configure:
-configure: error: cannot run test program while cross compiling
-
-Signed-off-by: Chunrong Guo <B40290@freescale.com>
-
----
- configure.in | 34 +++++++++++++++++-----------------
- 1 file changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 6fe5d68..e7636ce 100644
---- a/configure.in
-+++ b/configure.in
-@@ -698,23 +698,23 @@ if test "x$ac_cv_func_daq_dp_add_dc" = "xyes"; then
- 
- fi
- 
--AC_MSG_CHECKING([for daq address space ID])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <daq.h>
--]],
--[[
--   DAQ_PktHdr_t hdr;
--   hdr.address_space_id = 0;
--]])],
--[have_daq_address_space_id="yes"],
--[have_daq_address_space_id="no"])
--AC_MSG_RESULT($have_daq_address_space_id)
--if test "x$have_daq_address_space_id" = "xyes"; then
--    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
--        [DAQ version supports address space ID in header.])
--fi
-+#AC_MSG_CHECKING([for daq address space ID])
-+#AC_RUN_IFELSE(
-+#[AC_LANG_PROGRAM(
-+#[[
-+##include <daq.h>
-+#]],
-+#[[
-+#   DAQ_PktHdr_t hdr;
-+#   hdr.address_space_id = 0;
-+#]])],
-+have_daq_address_space_id="yes"
-+#[have_daq_address_space_id="no"])
-+#AC_MSG_RESULT($have_daq_address_space_id)
-+#if test "x$have_daq_address_space_id" = "xyes"; then
-+#    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
-+#        [DAQ version supports address space ID in header.])
-+#fi
- 
- AC_MSG_CHECKING([for daq flow ID])
- AC_RUN_IFELSE(
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch b/meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch
deleted file mode 100644
index 04df37c..0000000
--- a/meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 5aa42a3137c657b5eddd4608343aa1854bd7cd27 Mon Sep 17 00:00:00 2001
-From: Zhiquan Li <zhiquan.li@windriver.com>
-Date: Mon, 16 Nov 2015 10:23:00 +0800
-Subject: [PATCH] snort: 2.9.6.0 -> 2.9.7.5
-
-Upstream-Status:Inappropriate [embedded specific]
-
-fix the below error:
-checking for daq flow ID... configure:
-configure: error: cannot run test program while cross compiling
-
----
- configure.in | 34 +++++++++++++++++-----------------
- 1 file changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index e7636ce..2fbd298 100644
---- a/configure.in
-+++ b/configure.in
-@@ -716,23 +716,23 @@ have_daq_address_space_id="yes"
- #        [DAQ version supports address space ID in header.])
- #fi
- 
--AC_MSG_CHECKING([for daq flow ID])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <daq.h>
--]],
--[[
--   DAQ_PktHdr_t hdr;
--   hdr.flow_id = 0;
--]])],
--[have_daq_flow_id="yes"],
--[have_daq_flow_id="no"])
--AC_MSG_RESULT($have_daq_flow_id)
--if test "x$have_daq_flow_id" = "xyes"; then
--    AC_DEFINE([HAVE_DAQ_FLOW_ID],[1],
--        [DAQ version supports flow ID in header.])
--fi
-+#AC_MSG_CHECKING([for daq flow ID])
-+#AC_RUN_IFELSE(
-+#[AC_LANG_PROGRAM(
-+#[[
-+##include <daq.h>
-+#]],
-+#[[
-+#   DAQ_PktHdr_t hdr;
-+#   hdr.flow_id = 0;
-+#]])],
-+have_daq_flow_id="yes"
-+#[have_daq_flow_id="no"])
-+#AC_MSG_RESULT($have_daq_flow_id)
-+#if test "x$have_daq_flow_id" = "xyes"; then
-+#    AC_DEFINE([HAVE_DAQ_FLOW_ID],[1],
-+#        [DAQ version supports flow ID in header.])
-+#fi
- 
- AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
- AC_RUN_IFELSE(
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch b/meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch
deleted file mode 100644
index 15958a7..0000000
--- a/meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From b916443d43f2e1eeacfbed0033274a0270ef634d Mon Sep 17 00:00:00 2001
-From: Zhiquan Li <zhiquan.li@windriver.com>
-Date: Mon, 16 Nov 2015 10:23:00 +0800
-Subject: [PATCH] snort: 2.9.6.0 -> 2.9.7.5
-
-Upstream-Status:Inappropriate [embedded specific]
-
-fix the below error:
-checking for DAQ_VERDICT_RETRY... configure:
-configure: error: cannot run test program while cross compiling
-
----
- configure.in | 34 +++++++++++++++++-----------------
- 1 file changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 2fbd298..62573a8 100644
---- a/configure.in
-+++ b/configure.in
-@@ -734,23 +734,23 @@ have_daq_flow_id="yes"
- #        [DAQ version supports flow ID in header.])
- #fi
- 
--AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <daq.h>
--]],
--[[
--   DAQ_Verdict verdict;
--   verdict = DAQ_VERDICT_RETRY;
--]])],
--[have_daq_verdict_retry="yes"],
--[have_daq_verdict_retry="no"])
--AC_MSG_RESULT($have_daq_verdict_retry)
--if test "x$have_daq_verdict_retry" = "xyes"; then
--    AC_DEFINE([HAVE_DAQ_VERDICT_RETRY],[1],
--        [DAQ version supports DAQ_VERDICT_RETRY in DAQ_Verdict.])
--fi
-+#AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
-+#AC_RUN_IFELSE(
-+#[AC_LANG_PROGRAM(
-+#[[
-+##include <daq.h>
-+#]],
-+#[[
-+#   DAQ_Verdict verdict;
-+#   verdict = DAQ_VERDICT_RETRY;
-+#]])],
-+have_daq_verdict_retry="yes"
-+#[have_daq_verdict_retry="no"])
-+#AC_MSG_RESULT($have_daq_verdict_retry)
-+#if test "x$have_daq_verdict_retry" = "xyes"; then
-+#    AC_DEFINE([HAVE_DAQ_VERDICT_RETRY],[1],
-+#        [DAQ version supports DAQ_VERDICT_RETRY in DAQ_Verdict.])
-+#fi
- 
- # any sparc platform has to have this one defined.
- AC_MSG_CHECKING(for sparc)
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-inaddr-none.patch b/meta-networking/recipes-connectivity/snort/snort/disable-inaddr-none.patch
deleted file mode 100644
index 79e9f07..0000000
--- a/meta-networking/recipes-connectivity/snort/snort/disable-inaddr-none.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From a1fdbced4166cb0f35d23b63a59312d86860485a Mon Sep 17 00:00:00 2001
-From: Chunrong Guo <B40290@freescale.com>
-Date: Mon, 4 Nov 2013 10:39:56 +0800
-Subject: [PATCH] snort: add recipe
-
-Upstream-Status: Inappropriate [embedded specific]
-
-fix the below error:
-checking for INADDR_NONE... configure:
-configure: error: cannot run test program while cross compiling
-
-Signed-off-by: Chunrong Guo <B40290@freescale.com>
-
----
- configure.in | 50 ++++++++++++++++----------------------------------
- 1 file changed, 16 insertions(+), 34 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 20d15eb..6fe5d68 100644
---- a/configure.in
-+++ b/configure.in
-@@ -274,25 +274,7 @@ AC_CHECK_TYPES([int8_t,int16_t,int32_t,int64_t])
- AC_CHECK_TYPES([boolean])
- 
- # In case INADDR_NONE is not defined (like on Solaris)
--have_inaddr_none="no"
--AC_MSG_CHECKING([for INADDR_NONE])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <sys/types.h>
--#include <netinet/in.h>
--#include <arpa/inet.h>
--]],
--[[
--	if (inet_addr("10,5,2") == INADDR_NONE);
--    return 0;
--]])],
--[have_inaddr_none="yes"],
--[have_inaddr_none="no"])
--AC_MSG_RESULT($have_inaddr_none)
--if test "x$have_inaddr_none" = "xno"; then
--	AC_DEFINE([INADDR_NONE],[-1],[For INADDR_NONE definition])
--fi
-+have_inaddr_none="yes"
- 
- AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
- #include <stdio.h>
-@@ -421,21 +403,21 @@ if test "x$LPCAP" = "xno"; then
-   fi
- fi
- 
--AC_MSG_CHECKING([for pcap_lex_destroy])
--AC_RUN_IFELSE(
--[AC_LANG_PROGRAM(
--[[
--#include <pcap.h>
--]],
--[[
--   pcap_lex_destroy();
--]])],
--[have_pcap_lex_destroy="yes"],
--[have_pcap_lex_destroy="no"])
--AC_MSG_RESULT($have_pcap_lex_destroy)
--if test "x$have_pcap_lex_destroy" = "xyes"; then
--    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack created by pcap bpf filter])
--fi
-+#AC_MSG_CHECKING([for pcap_lex_destroy])
-+#AC_RUN_IFELSE(
-+#[AC_LANG_PROGRAM(
-+#[[
-+##include <pcap.h>
-+#]],
-+#[[
-+#   pcap_lex_destroy();
-+#]])],
-+have_pcap_lex_destroy="yes"
-+#[have_pcap_lex_destroy="no"])
-+#AC_MSG_RESULT($have_pcap_lex_destroy)
-+#if test "x$have_pcap_lex_destroy" = "xyes"; then
-+#    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack created by pcap bpf filter])
-+#fi
- 
- AC_MSG_CHECKING([for pcap_lib_version])
- AC_LINK_IFELSE(
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-run-test-program-while-cross-compiling.patch b/meta-networking/recipes-connectivity/snort/snort/disable-run-test-program-while-cross-compiling.patch
new file mode 100644
index 0000000..037962f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/disable-run-test-program-while-cross-compiling.patch
@@ -0,0 +1,254 @@
+From dc390837bc7adc205bb955d0922040a7e365d8dd Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Mon, 23 Jul 2018 13:54:07 +0800
+Subject: [PATCH] Disable run test program while cross compiling
+
+fix configure error:
+configure: error: cannot run test program while cross compiling
+
+Upstream-Status:Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ configure.in | 148 +++++------------------------------------------------------
+ 1 file changed, 12 insertions(+), 136 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 4b3a5db..a6c5498 100644
+--- a/configure.in
++++ b/configure.in
+@@ -284,19 +284,7 @@ AC_CHECK_TYPES([boolean])
+ # In case INADDR_NONE is not defined (like on Solaris)
+ have_inaddr_none="no"
+ AC_MSG_CHECKING([for INADDR_NONE])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <sys/types.h>
+-#include <netinet/in.h>
+-#include <arpa/inet.h>
+-]],
+-[[
+-	if (inet_addr("10,5,2") == INADDR_NONE);
+-    return 0;
+-]])],
+-[have_inaddr_none="yes"],
+-[have_inaddr_none="no"])
++have_inaddr_none="yes"
+ AC_MSG_RESULT($have_inaddr_none)
+ if test "x$have_inaddr_none" = "xno"; then
+ 	AC_DEFINE([INADDR_NONE],[-1],[For INADDR_NONE definition])
+@@ -429,16 +417,7 @@ if test "x$LPCAP" = "xno"; then
+ fi
+ 
+ AC_MSG_CHECKING([for pcap_lex_destroy])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <pcap.h>
+-]],
+-[[
+-   pcap_lex_destroy();
+-]])],
+-[have_pcap_lex_destroy="yes"],
+-[have_pcap_lex_destroy="no"])
++have_pcap_lex_destroy="yes"
+ AC_MSG_RESULT($have_pcap_lex_destroy)
+ if test "x$have_pcap_lex_destroy" = "xyes"; then
+     AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack created by pcap bpf filter])
+@@ -716,17 +695,7 @@ fi
+ AC_CHECK_FUNCS([daq_hup_apply] [daq_acquire_with_meta] [daq_dp_add_dc])
+ 
+ AC_MSG_CHECKING([for daq real addresses])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_PktHdr_t hdr;
+-   hdr.n_real_dPort = 0;
+-]])],
+-[have_daq_real_addresses="yes"],
+-[have_daq_real_addresses="no"])
++have_daq_real_addresses="no"
+ AC_MSG_RESULT($have_daq_real_addresses)
+ if test "x$have_daq_real_addresses" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_REAL_ADDRESSES],[1],
+@@ -754,17 +723,7 @@ if test "x$ac_cv_func_daq_dp_add_dc" = "xyes"; then
+ fi
+ 
+ AC_MSG_CHECKING([for daq address space ID])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_PktHdr_t hdr;
+-   hdr.address_space_id = 0;
+-]])],
+-[have_daq_address_space_id="yes"],
+-[have_daq_address_space_id="no"])
++have_daq_address_space_id="yes"
+ AC_MSG_RESULT($have_daq_address_space_id)
+ if test "x$have_daq_address_space_id" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
+@@ -772,17 +731,7 @@ if test "x$have_daq_address_space_id" = "xyes"; then
+ fi
+ 
+ AC_MSG_CHECKING([for daq flow ID])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_PktHdr_t hdr;
+-   hdr.flow_id = 0;
+-]])],
+-[have_daq_flow_id="yes"],
+-[have_daq_flow_id="no"])
++have_daq_flow_id="yes"
+ AC_MSG_RESULT($have_daq_flow_id)
+ if test "x$have_daq_flow_id" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_FLOW_ID],[1],
+@@ -790,19 +739,7 @@ if test "x$have_daq_flow_id" = "xyes"; then
+ fi
+ 
+ AC_MSG_CHECKING([for daq extended flow modifiers])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_ModFlow_t mod;
+-   mod.type = 0;
+-   mod.length = 0;
+-   mod.value = NULL;
+-]])],
+-[have_daq_ext_modflow="yes"],
+-[have_daq_ext_modflow="no"])
++have_daq_ext_modflow="no"
+ AC_MSG_RESULT($have_daq_ext_modflow)
+ if test "x$have_daq_ext_modflow" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_EXT_MODFLOW"
+@@ -811,19 +748,7 @@ if test "x$have_daq_ext_modflow" = "xyes"; then
+ fi
+ 
+ AC_MSG_CHECKING([for daq query flow])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_QueryFlow_t mod;
+-   mod.type = 0;
+-   mod.length = 0;
+-   mod.value = NULL;
+-]])],
+-[have_daq_queryflow="yes"],
+-[have_daq_queryflow="no"])
++have_daq_queryflow="no"
+ AC_MSG_RESULT($have_daq_queryflow)
+ if test "x$have_daq_queryflow" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_QUERYFLOW"
+@@ -832,16 +757,7 @@ if test "x$have_daq_queryflow" = "xyes"; then
+ fi
+ 
+ AC_MSG_CHECKING([for daq data channel flags])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_Data_Channel_Params_t params;
+-]])],
+-[have_daq_data_channel_flags="yes"],
+-[have_daq_data_channel_flags="no"])
++have_daq_data_channel_flags="no"
+ AC_MSG_RESULT($have_daq_data_channel_flags)
+ if test "x$have_daq_data_channel_flags" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_DATA_CHANNEL_PARAMS"
+@@ -850,17 +766,7 @@ if test "x$have_daq_data_channel_flags" = "xyes"; then
+ fi
+ 
+ AC_MSG_CHECKING([for separate IP versions on pinhole endpoints])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_DP_key_t dpKey;
+-   dpKey.src_af = 0;
+-]])],
+-[have_daq_data_channel_separate_ip_versions="yes"],
+-[have_daq_data_channel_separate_ip_versions="no"])
++have_daq_data_channel_separate_ip_versions="no"
+ AC_MSG_RESULT($have_daq_data_channel_separate_ip_versions)
+ if test "x$have_daq_data_channel_separate_ip_versions" = "xyes"; then
+     CCONFIGFLAGS="${CCONFIGFLAGS} -DHAVE_DAQ_DATA_CHANNEL_SEPARATE_IP_VERSIONS"
+@@ -869,17 +775,7 @@ if test "x$have_daq_data_channel_separate_ip_versions" = "xyes"; then
+ fi
+ 
+ AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_Verdict verdict;
+-   verdict = DAQ_VERDICT_RETRY;
+-]])],
+-[have_daq_verdict_retry="yes"],
+-[have_daq_verdict_retry="no"])
++have_daq_verdict_retry="yes"
+ AC_MSG_RESULT($have_daq_verdict_retry)
+ if test "x$have_daq_verdict_retry" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_VERDICT_RETRY],[1],
+@@ -887,17 +783,7 @@ if test "x$have_daq_verdict_retry" = "xyes"; then
+ fi
+ 
+ AC_MSG_CHECKING([for daq packet trace])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_PktHdr_t hdr;
+-   hdr.flags = DAQ_PKT_FLAG_TRACE_ENABLED;
+-]])],
+-[have_daq_packet_trace="yes"],
+-[have_daq_packet_trace="no"])
++have_daq_packet_trace="yes"
+ AC_MSG_RESULT($have_daq_packet_trace)
+ if test "x$have_daq_packet_trace" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_PKT_TRACE],[1],
+@@ -907,17 +793,7 @@ else
+ fi
+ 
+ AC_MSG_CHECKING([for daq verdict reason])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_ModFlow_t fl;
+-   fl.type = DAQ_MODFLOW_TYPE_VER_REASON;
+-]])],
+-[have_daq_verdict_reason="yes"],
+-[have_daq_verdict_reason="no"])
++have_daq_verdict_reason="yes"
+ AC_MSG_RESULT($have_daq_verdict_reason)
+ if test "x$have_daq_verdict_reason" = "xyes"; then
+     AC_DEFINE([HAVE_DAQ_VERDICT_REASON],[1],
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
index 24b91b9..fdf41bf 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
@@ -6,19 +6,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
 DEPENDS = "xz libpcap libpcre daq libdnet util-linux daq-native libtirpc"
 
-SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
+SRC_URI = "https://www.snort.org/downloads/snort/${BP}.tar.gz \
     file://snort.init \
-    file://disable-inaddr-none.patch \
-    file://disable-dap-address-space-id.patch \
-    file://disable-daq-flow-id.patch \
-    file://disable-daq-verdict-retry.patch \
     file://0001-libpcap-search-sysroot-for-headers.patch \
-    file://0001-fix-do_package-failed-since-snort-2.9.7.0.patch \
     file://fix-host-contamination-when-enable-static-daq.patch \
+    file://disable-run-test-program-while-cross-compiling.patch \
 "
 
-SRC_URI[tarball.md5sum] = "fd271788c0f8876be87a858a9142f202"
-SRC_URI[tarball.sha256sum] = "ad03f11b5301b16642199a86aa90388eaa53f5003f83b0c5595745a490047be1"
+SRC_URI[md5sum] = "378e3938b2b5c8e358f942d0ffce18cc"
+SRC_URI[sha256sum] = "9f6b3aeac5a109f55504bd370564ac431cb1773507929dc461626898f33f46cd"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.7.4


