Return-Path: <Zhiquan.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 091F3773B0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 02:23:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAG2N09w002188
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 18:23:00 -0800 (PST)
Received: from pek-zli6-d1.corp.ad.wrs.com (128.224.162.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Sun, 15 Nov 2015 18:22:59 -0800
From: Zhiquan Li <zhiquan.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Nov 2015 10:23:00 +0800
Message-ID: <1447640580-11353-1-git-send-email-zhiquan.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] snort: 2.9.6.0 -> 2.9.7.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Nov 2015 02:23:01 -0000
Content-Type: text/plain

Upgrade snort from 2.9.6.0 to 2.9.7.5, as its dependency upgrade daq from
2.0.2 to 2.0.6, and accordingly update the patches:

* Add 2 new patches for snort to solve the cross compile issues
* Discard 2 snort patches since it is not needed
* Refresh the patch for daq new version
* Remove redundant '/' to getting round the rpm debugedit bug:
  canonicalization unexpectedly shrank character

Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
---
 .../daq/{daq_2.0.2.bb => daq_2.0.6.bb}             |   4 +-
 ...le-run-test-program-while-cross-compiling.patch |  18 +-
 ...fix-do_package-failed-since-snort-2.9.7.0.patch |  35 +++
 .../snort/snort/disable-daq-flow-id.patch          |  50 ++++
 .../snort/snort/disable-daq-verdict-retry.patch    |  51 ++++
 .../snort/snort/m4-oom-during-configure.patch      |  21 --
 .../snort/snort/not-hardcoded-libdir.patch         | 279 ---------------------
 .../snort/{snort_2.9.6.0.bb => snort_2.9.7.5.bb}   |  25 +-
 8 files changed, 162 insertions(+), 321 deletions(-)
 rename meta-networking/recipes-connectivity/daq/{daq_2.0.2.bb => daq_2.0.6.bb} (86%)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/0001-fix-do_package-failed-since-snort-2.9.7.0.patch
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort/not-hardcoded-libdir.patch
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.6.0.bb => snort_2.9.7.5.bb} (74%)

diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.2.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
similarity index 86%
rename from meta-networking/recipes-connectivity/daq/daq_2.0.2.bb
rename to meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
index b8f8407..48039f0 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.2.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
@@ -20,7 +20,7 @@ SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
 EXTRA_OECONF = "--disable-nfq-module --disable-ipq-module --includedir=${includedir} \
 	--with-libpcap-includes=${STAGING_INCDIR} --with-dnet-includes=${STAGING_LIBDIR}"
 
-SRC_URI[md5sum] = "865bf9b750a2a2ca632591a3c70b0ea0"
-SRC_URI[sha256sum] = "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51f605309beac269a8"
+SRC_URI[md5sum] = "2cd6da422a72c129c685fc4bb848c24c"
+SRC_URI[sha256sum] = "b40e1d1273e08aaeaa86e69d4f28d535b7e53bdb3898adf539266b63137be7cb"
 
 inherit autotools
diff --git a/meta-networking/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch b/meta-networking/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch
index 12a6cba..a100b7c 100644
--- a/meta-networking/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch
+++ b/meta-networking/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch
@@ -5,12 +5,13 @@ configure: error: cannot run test program while cross compiling
 
 Signed-off-by: Chunrong Guo <B40290@freescale.com>
 
---- a/m4/sf.m4old	2013-08-30 04:08:18.768409680 -0500
-+++ b/m4/sf.m4	2013-08-30 04:09:24.591367890 -0500
-@@ -135,19 +135,6 @@
+--- a/m4/sf.m4old    2015-10-28 10:21:20.270557986 +0800
++++ a/m4/sf.m4       2015-10-28 10:23:22.726551974 +0800
+@@ -135,20 +135,7 @@
+         echo
          exit 1
      fi
-     AC_MSG_CHECKING([for libpcap version >= $1])
+-    AC_CACHE_CHECK([for libpcap version >= $1], [daq_cv_libpcap_version_1x], [
 -    AC_RUN_IFELSE(
 -    [AC_LANG_PROGRAM(
 -    [[
@@ -22,8 +23,9 @@ Signed-off-by: Chunrong Guo <B40290@freescale.com>
 -        if (strcmp(pcap_version, $1) < 0)
 -            return 1;
 -    ]])],
--    [libpcap_version_1x="yes"],
--    [libpcap_version_1x="no"])
-     if test "x$libpcap_version_1x" = "xno"; then
-         AC_MSG_RESULT(no)
+-    [daq_cv_libpcap_version_1x="yes"],
+-    [daq_cv_libpcap_version_1x="no"])])
++    AC_CACHE_CHECK([for libpcap version >= $1], [daq_cv_libpcap_version_1x])
+     if test "x$daq_cv_libpcap_version_1x" = "xno"; then
          echo
+         echo "    ERROR!  Libpcap library version >= $1  not found."
diff --git a/meta-networking/recipes-connectivity/snort/snort/0001-fix-do_package-failed-since-snort-2.9.7.0.patch b/meta-networking/recipes-connectivity/snort/snort/0001-fix-do_package-failed-since-snort-2.9.7.0.patch
new file mode 100644
index 0000000..1520553
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/0001-fix-do_package-failed-since-snort-2.9.7.0.patch
@@ -0,0 +1,35 @@
+From 815e861721a9c43efddb78521147145ebc7569ca Mon Sep 17 00:00:00 2001
+From: Zhiquan Li <zhiquan.li@windriver.com>
+Date: Fri, 13 Nov 2015 17:40:24 +0800
+Subject: [PATCH] fix do_package failed since snort 2.9.7.0
+
+Remove redundant '/' as a workround for below error:
+/lib/rpm/bin/debugedit: canonicalization unexpectedly shrank by one character
+
+It's a rpm debugedit bug:
+* http://sourceforge.net/p/snort/mailman/message/34130268/
+* https://bugzilla.redhat.com/show_bug.cgi?id=304121
+
+Upstream-Status:Inappropriate [embedded specific]
+
+Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
+---
+ src/snort.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/snort.h b/src/snort.h
+index 8308e57..499d157 100644
+--- a/src/snort.h
++++ b/src/snort.h
+@@ -39,7 +39,7 @@
+ #include "sfdaq.h"
+ #include "sf_types.h"
+ #include "sfutil/sflsq.h"
+-#include "sfutil//sfActionQueue.h"
++#include "sfutil/sfActionQueue.h"
+ #include "profiler.h"
+ #include "rules.h"
+ #include "treenodes.h"
+--
+1.9.1
+
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch b/meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch
new file mode 100644
index 0000000..e6afcab
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch
@@ -0,0 +1,50 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+fix the below error:
+checking for daq flow ID... configure:
+configure: error: cannot run test program while cross compiling
+
+
+--- a/configure.in    2015-10-28 10:36:42.918512690 +0800
++++ b/configure.in    2015-10-28 10:37:36.738510048 +0800
+@@ -716,23 +716,23 @@
+ #        [DAQ version supports address space ID in header.])
+ #fi
+
+-AC_MSG_CHECKING([for daq flow ID])
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
+-AC_MSG_RESULT($have_daq_flow_id)
+-if test "x$have_daq_flow_id" = "xyes"; then
+-    AC_DEFINE([HAVE_DAQ_FLOW_ID],[1],
+-        [DAQ version supports flow ID in header.])
+-fi
++#AC_MSG_CHECKING([for daq flow ID])
++#AC_RUN_IFELSE(
++#[AC_LANG_PROGRAM(
++#[[
++##include <daq.h>
++#]],
++#[[
++#   DAQ_PktHdr_t hdr;
++#   hdr.flow_id = 0;
++#]])],
++have_daq_flow_id="yes"
++#[have_daq_flow_id="no"])
++#AC_MSG_RESULT($have_daq_flow_id)
++#if test "x$have_daq_flow_id" = "xyes"; then
++#    AC_DEFINE([HAVE_DAQ_FLOW_ID],[1],
++#        [DAQ version supports flow ID in header.])
++#fi
+
+ AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
+ AC_RUN_IFELSE(
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch b/meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch
new file mode 100644
index 0000000..1a13298
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch
@@ -0,0 +1,51 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+fix the below error:
+checking for DAQ_VERDICT_RETRY... configure:
+configure: error: cannot run test program while cross compiling
+
+
+--- a/configure.in    2015-10-28 10:45:18.174487395 +0800
++++ b/configure.in    2015-10-28 10:45:47.586485951 +0800
+@@ -734,23 +734,23 @@
+ #        [DAQ version supports flow ID in header.])
+ #fi
+
+-AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
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
+-AC_MSG_RESULT($have_daq_verdict_retry)
+-if test "x$have_daq_verdict_retry" = "xyes"; then
+-    AC_DEFINE([HAVE_DAQ_VERDICT_RETRY],[1],
+-        [DAQ version supports DAQ_VERDICT_RETRY in DAQ_Verdict.])
+-fi
++#AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
++#AC_RUN_IFELSE(
++#[AC_LANG_PROGRAM(
++#[[
++##include <daq.h>
++#]],
++#[[
++#   DAQ_Verdict verdict;
++#   verdict = DAQ_VERDICT_RETRY;
++#]])],
++have_daq_verdict_retry="yes"
++#[have_daq_verdict_retry="no"])
++#AC_MSG_RESULT($have_daq_verdict_retry)
++#if test "x$have_daq_verdict_retry" = "xyes"; then
++#    AC_DEFINE([HAVE_DAQ_VERDICT_RETRY],[1],
++#        [DAQ version supports DAQ_VERDICT_RETRY in DAQ_Verdict.])
++#fi
+
+ # any sparc platform has to have this one defined.
+ AC_MSG_CHECKING(for sparc)
+
diff --git a/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch b/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
deleted file mode 100644
index 2250611..0000000
--- a/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Backport
-
-There is an incorrect m4_define() in configure.in which will result in an
-infinite recursion, and it doesn't make sense, since snort 2.9.7 it has been
-commented out. We follow this solution to fix it.
-
-Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
-
---- a/configure.in	2015-10-22 13:58:50.743367251 +0800
-+++ b/configure.in	2015-10-22 13:59:13.855366117 +0800
-@@ -1100,8 +1100,8 @@
- # Define PKG_CHECK_MODULES if it doesnt already exist. 
- #file_ This prevents './configure' from erroring on machines that dont have
- # 'pkgconfig' installed.
--m4_ifdef([PKG_CHECK_MODULES],[], [m4_define([PKG_CHECK_MODULES], 
--     [echo "PKG_CHECK_MODULES not defined"])])
-+#m4_ifdef([PKG_CHECK_MODULES],[], [m4_define([PKG_CHECK_MODULES],
-+#     [echo "PKG_CHECK_MODULES not defined"])])
-
- if test "x$enable_rzb_saac" = "xyes"; then
-     AC_CHECK_PROG(PKG_CONFIG,pkg-config,yes)
diff --git a/meta-networking/recipes-connectivity/snort/snort/not-hardcoded-libdir.patch b/meta-networking/recipes-connectivity/snort/snort/not-hardcoded-libdir.patch
deleted file mode 100644
index 075ec13..0000000
--- a/meta-networking/recipes-connectivity/snort/snort/not-hardcoded-libdir.patch
+++ /dev/null
@@ -1,279 +0,0 @@
-[PATCH] do not hardcoded libdir
-
-Upstream-Status: Pending
-
-libdir is hardcoded to ${exec_prefix}/lib, but we want it to support multilib
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- src/dynamic-examples/dynamic-preprocessor/Makefile.am | 2 +-
- src/dynamic-examples/dynamic-rule/Makefile.am         | 2 +-
- src/dynamic-plugins/sf_engine/Makefile.am             | 2 +-
- src/dynamic-preprocessors/dcerpc2/Makefile.am         | 2 +-
- src/dynamic-preprocessors/dnp3/Makefile.am            | 2 +-
- src/dynamic-preprocessors/dns/Makefile.am             | 2 +-
- src/dynamic-preprocessors/file/Makefile.am            | 2 +-
- src/dynamic-preprocessors/ftptelnet/Makefile.am       | 2 +-
- src/dynamic-preprocessors/gtp/Makefile.am             | 2 +-
- src/dynamic-preprocessors/imap/Makefile.am            | 2 +-
- src/dynamic-preprocessors/modbus/Makefile.am          | 2 +-
- src/dynamic-preprocessors/pop/Makefile.am             | 2 +-
- src/dynamic-preprocessors/reputation/Makefile.am      | 2 +-
- src/dynamic-preprocessors/rzb_saac/Makefile.am        | 2 +-
- src/dynamic-preprocessors/sdf/Makefile.am             | 2 +-
- src/dynamic-preprocessors/sip/Makefile.am             | 2 +-
- src/dynamic-preprocessors/smtp/Makefile.am            | 2 +-
- src/dynamic-preprocessors/ssh/Makefile.am             | 2 +-
- src/dynamic-preprocessors/ssl/Makefile.am             | 2 +-
- 19 files changed, 19 insertions(+), 19 deletions(-)
-
-diff --git a/src/dynamic-examples/dynamic-preprocessor/Makefile.am b/src/dynamic-examples/dynamic-preprocessor/Makefile.am
-index 255755e..1cafead 100644
---- a/src/dynamic-examples/dynamic-preprocessor/Makefile.am
-+++ b/src/dynamic-examples/dynamic-preprocessor/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include
- 
--noinst_libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+noinst_libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- noinst_lib_LTLIBRARIES = lib_sfdynamic_preprocessor_example.la
- 
-diff --git a/src/dynamic-examples/dynamic-rule/Makefile.am b/src/dynamic-examples/dynamic-rule/Makefile.am
-index e5338d2..82eb212 100644
---- a/src/dynamic-examples/dynamic-rule/Makefile.am
-+++ b/src/dynamic-examples/dynamic-rule/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include
- 
--noinst_libdir = ${exec_prefix}/lib/snort_dynamicrules
-+noinst_libdir = ${exec_prefix}${base_libdir}/snort_dynamicrules
- 
- noinst_lib_LTLIBRARIES = lib_sfdynamic_example_rule.la
- 
-diff --git a/src/dynamic-plugins/sf_engine/Makefile.am b/src/dynamic-plugins/sf_engine/Makefile.am
-index d6a6200..3d270c3 100644
---- a/src/dynamic-plugins/sf_engine/Makefile.am
-+++ b/src/dynamic-plugins/sf_engine/Makefile.am
-@@ -5,7 +5,7 @@ INCLUDES = @INCLUDES@
- 
- lib_LTLIBRARIES = libsf_engine.la
- 
--libdir = ${exec_prefix}/lib/snort_dynamicengine
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicengine
- 
- libsf_engine_la_LDFLAGS = -export-dynamic -module @XCCFLAGS@
- 
-diff --git a/src/dynamic-preprocessors/dcerpc2/Makefile.am b/src/dynamic-preprocessors/dcerpc2/Makefile.am
-index 9843073..8a0caa5 100644
---- a/src/dynamic-preprocessors/dcerpc2/Makefile.am
-+++ b/src/dynamic-preprocessors/dcerpc2/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs -I$(srcdir)/includes
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_dce2_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/dnp3/Makefile.am b/src/dynamic-preprocessors/dnp3/Makefile.am
-index 1358862..18e2178 100644
---- a/src/dynamic-preprocessors/dnp3/Makefile.am
-+++ b/src/dynamic-preprocessors/dnp3/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_dnp3_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/dns/Makefile.am b/src/dynamic-preprocessors/dns/Makefile.am
-index f22d90e..49d2f55 100644
---- a/src/dynamic-preprocessors/dns/Makefile.am
-+++ b/src/dynamic-preprocessors/dns/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_dns_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/file/Makefile.am b/src/dynamic-preprocessors/file/Makefile.am
-index d71c0fd..834f7ac 100644
---- a/src/dynamic-preprocessors/file/Makefile.am
-+++ b/src/dynamic-preprocessors/file/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs -I./include   
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_file_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/ftptelnet/Makefile.am b/src/dynamic-preprocessors/ftptelnet/Makefile.am
-index fe73835..3457231 100644
---- a/src/dynamic-preprocessors/ftptelnet/Makefile.am
-+++ b/src/dynamic-preprocessors/ftptelnet/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs -I$(srcdir)/includes
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_ftptelnet_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/gtp/Makefile.am b/src/dynamic-preprocessors/gtp/Makefile.am
-index 51c961a..d7fb9b2 100644
---- a/src/dynamic-preprocessors/gtp/Makefile.am
-+++ b/src/dynamic-preprocessors/gtp/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs -I$(srcdir)/includes
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_gtp_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/imap/Makefile.am b/src/dynamic-preprocessors/imap/Makefile.am
-index 533e43d..9efcbc4 100644
---- a/src/dynamic-preprocessors/imap/Makefile.am
-+++ b/src/dynamic-preprocessors/imap/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_imap_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/modbus/Makefile.am b/src/dynamic-preprocessors/modbus/Makefile.am
-index 05fc63e..e4f1415 100644
---- a/src/dynamic-preprocessors/modbus/Makefile.am
-+++ b/src/dynamic-preprocessors/modbus/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_modbus_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/pop/Makefile.am b/src/dynamic-preprocessors/pop/Makefile.am
-index d4b07b3..1345bc6 100644
---- a/src/dynamic-preprocessors/pop/Makefile.am
-+++ b/src/dynamic-preprocessors/pop/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_pop_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/reputation/Makefile.am b/src/dynamic-preprocessors/reputation/Makefile.am
-index 4e16142..14ba0cb 100644
---- a/src/dynamic-preprocessors/reputation/Makefile.am
-+++ b/src/dynamic-preprocessors/reputation/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs -I$(srcdir)/includes
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_reputation_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/rzb_saac/Makefile.am b/src/dynamic-preprocessors/rzb_saac/Makefile.am
-index f0b0912..6ebe04e 100644
---- a/src/dynamic-preprocessors/rzb_saac/Makefile.am
-+++ b/src/dynamic-preprocessors/rzb_saac/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs
- 
--pkglibdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+pkglibdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- pkglib_LTLIBRARIES = sf_rzb_saac_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/sdf/Makefile.am b/src/dynamic-preprocessors/sdf/Makefile.am
-index 97b416e..04b5ce5 100644
---- a/src/dynamic-preprocessors/sdf/Makefile.am
-+++ b/src/dynamic-preprocessors/sdf/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_sdf_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/sip/Makefile.am b/src/dynamic-preprocessors/sip/Makefile.am
-index 67ac1e1..b4f360f 100644
---- a/src/dynamic-preprocessors/sip/Makefile.am
-+++ b/src/dynamic-preprocessors/sip/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs -I$(srcdir)/includes
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_sip_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/smtp/Makefile.am b/src/dynamic-preprocessors/smtp/Makefile.am
-index 3b5893f..96750df 100644
---- a/src/dynamic-preprocessors/smtp/Makefile.am
-+++ b/src/dynamic-preprocessors/smtp/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_smtp_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/ssh/Makefile.am b/src/dynamic-preprocessors/ssh/Makefile.am
-index 0eab645..5ae9b80 100644
---- a/src/dynamic-preprocessors/ssh/Makefile.am
-+++ b/src/dynamic-preprocessors/ssh/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_ssh_preproc.la
- 
-diff --git a/src/dynamic-preprocessors/ssl/Makefile.am b/src/dynamic-preprocessors/ssl/Makefile.am
-index 4ac2943..8d3abe3 100644
---- a/src/dynamic-preprocessors/ssl/Makefile.am
-+++ b/src/dynamic-preprocessors/ssl/Makefile.am
-@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
- 
- INCLUDES = -I../include -I${srcdir}/../libs
- 
--libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
-+libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
- 
- lib_LTLIBRARIES = libsf_ssl_preproc.la
- 
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
similarity index 74%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
index e15f7be..a81aa7f 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
@@ -10,13 +10,14 @@ SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
     file://snort.init \
     file://disable-inaddr-none.patch \
     file://disable-dap-address-space-id.patch \
+    file://disable-daq-flow-id.patch \
+    file://disable-daq-verdict-retry.patch \
     file://0001-libpcap-search-sysroot-for-headers.patch \
-    file://not-hardcoded-libdir.patch \
-    file://m4-oom-during-configure.patch \
+    file://0001-fix-do_package-failed-since-snort-2.9.7.0.patch \
 "
 
-SRC_URI[tarball.md5sum] = "18111f6de3989ca89add36077a7c2659"
-SRC_URI[tarball.sha256sum] = "3cc6c8a9b52f4c863a5736a73b4012aff340b50b5e002771b04d4877f47cd19e"
+SRC_URI[tarball.md5sum] = "fd271788c0f8876be87a858a9142f202"
+SRC_URI[tarball.sha256sum] = "ad03f11b5301b16642199a86aa90388eaa53f5003f83b0c5595745a490047be1"
 
 inherit autotools gettext update-rc.d pkgconfig
 
@@ -33,7 +34,9 @@ EXTRA_OECONF = " \
     --with-dnet-includes=${STAGING_INCDIR} \
     --with-dnet-libraries=${STAGING_LIBDIR} \
     --with-libpcre-includes=${STAGING_INCDIR} \
-    --with-libpcre-libraries=${STAGING_INCDIR} \
+    --with-libpcre-libraries=${STAGING_LIBDIR} \
+    --with-daq-includes=${STAGING_INCDIR} \
+    --with-daq-libraries=${STAGING_LIBDIR} \
 "
 
 # if you want to disable it, you need to patch configure.in first
@@ -43,15 +46,15 @@ PACKAGECONFIG ?= "openssl"
 PACKAGECONFIG[openssl] = "--with-openssl-includes=${STAGING_INCDIR} --with-openssl-libraries=${STAGING_LIBDIR}, --without-openssl-includes --without-openssl-libraries, openssl,"
 
 do_install_append() {
-    install -d ${D}/${sysconfdir}/snort/rules
-    install -d ${D}/${sysconfdir}/snort/preproc_rules
+    install -d ${D}${sysconfdir}/snort/rules
+    install -d ${D}${sysconfdir}/snort/preproc_rules
     install -d ${D}${sysconfdir}/init.d
     for i in map config conf dtd; do
-        cp ${S}/etc/*.$i ${D}/${sysconfdir}/snort/
+        cp ${S}/etc/*.$i ${D}${sysconfdir}/snort/
     done
-    cp ${S}/preproc_rules/*.rules ${D}/${sysconfdir}/snort/preproc_rules/
-    install -m 755 ${WORKDIR}/snort.init ${D}/${sysconfdir}/init.d/snort
-    mkdir -p ${D}/${localstatedir}/log/snort
+    cp ${S}/preproc_rules/*.rules ${D}${sysconfdir}/snort/preproc_rules/
+    install -m 755 ${WORKDIR}/snort.init ${D}${sysconfdir}/init.d/snort
+    mkdir -p ${D}${localstatedir}/log/snort
     install -d ${D}/var/log/snort
 }
 
-- 
1.9.1


