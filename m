Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08C6571BFC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 05:59:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2M5xgE7030844
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 22:59:43 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 21 Mar 2018 22:59:42 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Mar 2018 22:59:42 -0700
Message-ID: <20180322055942.16376-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH][meta-networking] kea: add new recipe
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
X-List-Received-Date: Thu, 22 Mar 2018 05:59:42 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Kea is the next generation of DHCP software
  developed by ISC. It supports both DHCPv4
  and DHCPv6 protocols along with their extensions,
  e.g. prefix delegation and dynamic updates to DNS.
* Backport patch to fix issue with boost 1.66
* Add kea-msg-compiler related patch to support
  cross-compile

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...-Added-option-to-provide-kea-msg-compiler.patch | 235 +++++++++++++++++++++
 ...-fix-compile-error-about-kea-msg-compiler.patch |  72 +++++++
 ...akefile.am-update-hooksdir-for-lease_cmds.patch |  30 +++
 .../0001-asiolink-fix-build-with-boost-1.66.patch  | 103 +++++++++
 .../kea/files/kea-dhcp-ddns.service                |  13 ++
 .../kea/files/kea-dhcp4.service                    |  13 ++
 .../kea/files/kea-dhcp6.service                    |  13 ++
 .../recipes-connectivity/kea/kea_1.3.0.bb          |  52 +++++
 8 files changed, 531 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/kea/files/0001-Added-option-to-provide-kea-msg-compiler.patch
 create mode 100644 meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-fix-compile-error-about-kea-msg-compiler.patch
 create mode 100644 meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-update-hooksdir-for-lease_cmds.patch
 create mode 100644 meta-networking/recipes-connectivity/kea/files/0001-asiolink-fix-build-with-boost-1.66.patch
 create mode 100644 meta-networking/recipes-connectivity/kea/files/kea-dhcp-ddns.service
 create mode 100644 meta-networking/recipes-connectivity/kea/files/kea-dhcp4.service
 create mode 100644 meta-networking/recipes-connectivity/kea/files/kea-dhcp6.service
 create mode 100644 meta-networking/recipes-connectivity/kea/kea_1.3.0.bb

diff --git a/meta-networking/recipes-connectivity/kea/files/0001-Added-option-to-provide-kea-msg-compiler.patch b/meta-networking/recipes-connectivity/kea/files/0001-Added-option-to-provide-kea-msg-compiler.patch
new file mode 100644
index 000000000..b58a658b9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/kea/files/0001-Added-option-to-provide-kea-msg-compiler.patch
@@ -0,0 +1,235 @@
+From c7806af2957627151ef603ad4aa893ca1a4bf59e Mon Sep 17 00:00:00 2001
+From: Siyu Zhang <siyu.zhang@windriver.com>
+Date: Sat, 10 Sep 2016 15:44:10 +0200
+Subject: [PATCH 1/1] Added option to provide kea-msg-compiler
+
+Upstream-Status: Inappropriate[oe specific]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ configure.ac                        | 18 ++++++++++++++++++
+ src/bin/d2/Makefile.am              |  2 +-
+ src/bin/dhcp4/Makefile.am           |  2 +-
+ src/bin/dhcp6/Makefile.am           |  2 +-
+ src/bin/lfc/Makefile.am             |  2 +-
+ src/hooks/dhcp/user_chk/Makefile.am |  2 +-
+ src/lib/asiodns/Makefile.am         |  2 +-
+ src/lib/config/Makefile.am          |  2 +-
+ src/lib/dhcp_ddns/Makefile.am       |  2 +-
+ src/lib/dhcpsrv/Makefile.am         |  6 +++---
+ src/lib/eval/Makefile.am            |  2 +-
+ src/lib/hooks/Makefile.am           |  2 +-
+ src/lib/log/Makefile.am             |  8 +++++++-
+ src/lib/log/tests/Makefile.am       |  2 +-
+ 14 files changed, 39 insertions(+), 15 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ea41f08..edb5120 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -202,6 +202,24 @@ case "$host" in
+ esac
+ KEA_CXXFLAGS="$KEA_CXXFLAGS $MULTITHREADING_FLAG"
+ 
++AC_MSG_CHECKING(whether kea-msg-compiler is provided)
++AC_ARG_WITH(msg-compiler,
++    AC_HELP_STRING([--with-msg-compiler=PATH], [use provided kea-msg-compiler instead of local build]),
++    [
++     dnl TODO: Validate provided kea-msg-compiler
++     AC_SUBST([KEA_MSG_COMPILER], [${withval}])
++     AC_MSG_RESULT(${withval})],
++    [
++     AC_MSG_RESULT([no])
++     if test x"$host" != x"$build" && test x"$host" == x"$target"; then
++         AC_MSG_ERROR(native kea-msg-compiler not provided for cross compilation: build=${build} host=${host} target=${target})
++     else
++         AC_SUBST([KEA_MSG_COMPILER], ['$(top_builddir)/src/lib/log/compiler/kea-msg-compiler'])
++         with_msg_compiler=no
++     fi])
++
++AM_CONDITIONAL([HAVE_MSG_COMPILER], [test x"$with_msg_compiler" != x"no"])
++
+ # Disable -Werror by default. Only use it if specifically enabled.
+ # The usage of this flag is:
+ #
+diff --git a/src/bin/d2/Makefile.am b/src/bin/d2/Makefile.am
+index 0b4e7d5..40cc094 100644
+--- a/src/bin/d2/Makefile.am
++++ b/src/bin/d2/Makefile.am
+@@ -53,7 +53,7 @@ spec_config.h: spec_config.h.pre
+ d2_messages.h d2_messages.cc: s-messages
+ 
+ s-messages: d2_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/bin/d2/d2_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/bin/d2/d2_messages.mes
+ 	touch $@
+ 
+ BUILT_SOURCES = d2_messages.h d2_messages.cc
+diff --git a/src/bin/dhcp4/Makefile.am b/src/bin/dhcp4/Makefile.am
+index 8360677..57acb91 100644
+--- a/src/bin/dhcp4/Makefile.am
++++ b/src/bin/dhcp4/Makefile.am
+@@ -47,7 +47,7 @@ spec_config.h: spec_config.h.pre
+ dhcp4_messages.h dhcp4_messages.cc: s-messages
+ 
+ s-messages: dhcp4_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/bin/dhcp4/dhcp4_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/bin/dhcp4/dhcp4_messages.mes
+ 	touch $@
+ 
+ BUILT_SOURCES = spec_config.h dhcp4_messages.h dhcp4_messages.cc
+diff --git a/src/bin/dhcp6/Makefile.am b/src/bin/dhcp6/Makefile.am
+index 47155ae..d7ed722 100644
+--- a/src/bin/dhcp6/Makefile.am
++++ b/src/bin/dhcp6/Makefile.am
+@@ -48,7 +48,7 @@ spec_config.h: spec_config.h.pre
+ dhcp6_messages.h dhcp6_messages.cc: s-messages
+ 
+ s-messages: dhcp6_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/bin/dhcp6/dhcp6_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/bin/dhcp6/dhcp6_messages.mes
+ 	touch $@
+ 
+ BUILT_SOURCES = spec_config.h dhcp6_messages.h dhcp6_messages.cc
+diff --git a/src/bin/lfc/Makefile.am b/src/bin/lfc/Makefile.am
+index 7bfeb96..09a700e 100644
+--- a/src/bin/lfc/Makefile.am
++++ b/src/bin/lfc/Makefile.am
+@@ -32,7 +32,7 @@ endif
+ lfc_messages.h lfc_messages.cc: s-messages
+ 
+ s-messages: lfc_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/bin/lfc/lfc_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/bin/lfc/lfc_messages.mes
+ 	touch $@
+ 
+ BUILT_SOURCES = lfc_messages.h lfc_messages.cc
+diff --git a/src/hooks/dhcp/user_chk/Makefile.am b/src/hooks/dhcp/user_chk/Makefile.am
+index 41ad7b2..32a93412 100644
+--- a/src/hooks/dhcp/user_chk/Makefile.am
++++ b/src/hooks/dhcp/user_chk/Makefile.am
+@@ -7,7 +7,7 @@ AM_CXXFLAGS  = $(KEA_CXXFLAGS)
+ # Define rule to build logging source files from message file
+ user_chk_messages.h user_chk_messages.cc: s-messages
+ s-messages: user_chk_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/hooks/dhcp/user_chk/user_chk_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/hooks/dhcp/user_chk/user_chk_messages.mes
+ 	touch $@
+ 
+ # Tell automake that the message files are built as part of the build process
+diff --git a/src/lib/asiodns/Makefile.am b/src/lib/asiodns/Makefile.am
+index 24dfe05..60c9f80 100644
+--- a/src/lib/asiodns/Makefile.am
++++ b/src/lib/asiodns/Makefile.am
+@@ -11,7 +11,7 @@ CLEANFILES = *.gcno *.gcda asiodns_messages.h asiodns_messages.cc s-messages
+ asiodns_messages.h asiodns_messages.cc: s-messages
+ 
+ s-messages: asiodns_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/asiodns/asiodns_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/asiodns/asiodns_messages.mes
+ 	touch $@
+ 
+ BUILT_SOURCES = asiodns_messages.h asiodns_messages.cc
+diff --git a/src/lib/config/Makefile.am b/src/lib/config/Makefile.am
+index a89d530..26894ad 100644
+--- a/src/lib/config/Makefile.am
++++ b/src/lib/config/Makefile.am
+@@ -7,7 +7,7 @@ AM_CPPFLAGS += $(BOOST_INCLUDES)
+ config_messages.h config_messages.cc: s-messages
+ 
+ s-messages: config_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/config/config_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/config/config_messages.mes
+ 	touch $@
+ 
+ BUILT_SOURCES = config_messages.h config_messages.cc
+diff --git a/src/lib/dhcp_ddns/Makefile.am b/src/lib/dhcp_ddns/Makefile.am
+index 820f448..fe15533 100644
+--- a/src/lib/dhcp_ddns/Makefile.am
++++ b/src/lib/dhcp_ddns/Makefile.am
+@@ -8,7 +8,7 @@ AM_CXXFLAGS  = $(KEA_CXXFLAGS)
+ dhcp_ddns_messages.h dhcp_ddns_messages.cc: s-messages
+ 
+ s-messages: dhcp_ddns_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/dhcp_ddns/dhcp_ddns_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/dhcp_ddns/dhcp_ddns_messages.mes
+ 	touch $@
+ 
+ # Tell automake that the message files are built as part of the build process
+diff --git a/src/lib/dhcpsrv/Makefile.am b/src/lib/dhcpsrv/Makefile.am
+index db95dbd..6499b9f 100644
+--- a/src/lib/dhcpsrv/Makefile.am
++++ b/src/lib/dhcpsrv/Makefile.am
+@@ -52,11 +52,11 @@ alloc_engine_messages.h alloc_engine_messages.cc dhcpsrv_messages.h \
+ dhcpsrv_messages.cc hosts_messages.h hosts_messages.cc: s-messages
+ 
+ s-messages: alloc_engine_messages.mes dhcpsrv_messages.mes hosts_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/dhcpsrv/alloc_engine_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/dhcpsrv/alloc_engine_messages.mes
+ 	touch $@
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/dhcpsrv/dhcpsrv_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/dhcpsrv/dhcpsrv_messages.mes
+ 	touch $@
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/dhcpsrv/hosts_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/dhcpsrv/hosts_messages.mes
+ 	touch $@
+ 
+ # Tell Automake that the {alloc_engine,dhcpsrv,hosts}_messages.{cc,h} source files
+diff --git a/src/lib/eval/Makefile.am b/src/lib/eval/Makefile.am
+index e4968c1..f8464f8 100644
+--- a/src/lib/eval/Makefile.am
++++ b/src/lib/eval/Makefile.am
+@@ -47,7 +47,7 @@ EXTRA_DIST += lexer.ll parser.yy
+ eval_messages.h eval_messages.cc: s-messages
+ 
+ s-messages: eval_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/eval/eval_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/eval/eval_messages.mes
+ 	touch $@
+ 
+ # Tell Automake that the eval_messages.{cc,h} source files are created in the
+diff --git a/src/lib/hooks/Makefile.am b/src/lib/hooks/Makefile.am
+index 624e227..3458da8 100644
+--- a/src/lib/hooks/Makefile.am
++++ b/src/lib/hooks/Makefile.am
+@@ -8,7 +8,7 @@ AM_CXXFLAGS  = $(KEA_CXXFLAGS)
+ hooks_messages.h hooks_messages.cc: s-messages
+ 
+ s-messages: hooks_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/hooks/hooks_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/hooks/hooks_messages.mes
+ 	touch $@
+ 
+ # Tell automake that the message files are built as part of the build process
+diff --git a/src/lib/log/Makefile.am b/src/lib/log/Makefile.am
+index e1185cd..22e9ce6 100644
+--- a/src/lib/log/Makefile.am
++++ b/src/lib/log/Makefile.am
+@@ -1,4 +1,10 @@
+-SUBDIRS = interprocess . compiler tests
++SUBDIRS = interprocess .
++
++if !HAVE_MSG_COMPILER
++SUBDIRS += compiler
++endif
++
++SUBDIRS += tests
+ 
+ AM_CPPFLAGS = -I$(top_builddir)/src/lib -I$(top_srcdir)/src/lib
+ AM_CPPFLAGS += $(BOOST_INCLUDES)
+diff --git a/src/lib/log/tests/Makefile.am b/src/lib/log/tests/Makefile.am
+index 03806f9..caf9cab 100644
+--- a/src/lib/log/tests/Makefile.am
++++ b/src/lib/log/tests/Makefile.am
+@@ -17,7 +17,7 @@ BUILT_SOURCES = log_test_messages.h log_test_messages.cc
+ log_test_messages.h log_test_messages.cc: s-messages
+ 
+ s-messages: log_test_messages.mes
+-	$(AM_V_GEN) $(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/log/tests/log_test_messages.mes
++	$(AM_V_GEN) @KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/log/tests/log_test_messages.mes
+ 	touch $@
+ 
+ CLEANFILES += log_test_messages.h log_test_messages.cc s-messages
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-fix-compile-error-about-kea-msg-compiler.patch b/meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-fix-compile-error-about-kea-msg-compiler.patch
new file mode 100644
index 000000000..e8a4ae41b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-fix-compile-error-about-kea-msg-compiler.patch
@@ -0,0 +1,72 @@
+From d800c6017962e358c8b2ada6803acb0f4011a763 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Fri, 16 Mar 2018 08:03:20 +0000
+Subject: [PATCH] Makefile.am: fix compile error about kea-msg-compiler
+
+fix compile error about kea-msg-compiler
+
+Upstream-Status: Inappropriate[oe specific]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ src/bin/agent/Makefile.am             | 2 +-
+ src/hooks/dhcp/lease_cmds/Makefile.am | 2 +-
+ src/lib/http/Makefile.am              | 2 +-
+ src/lib/process/Makefile.am           | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/bin/agent/Makefile.am b/src/bin/agent/Makefile.am
+index e67c572..b646325 100644
+--- a/src/bin/agent/Makefile.am
++++ b/src/bin/agent/Makefile.am
+@@ -33,7 +33,7 @@ endif
+ ca_messages.h ca_messages.cc: s-messages
+ 
+ s-messages: ca_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/bin/agent/ca_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/bin/agent/ca_messages.mes
+ 	touch $@
+ 
+ BUILT_SOURCES = ca_messages.h ca_messages.cc
+diff --git a/src/hooks/dhcp/lease_cmds/Makefile.am b/src/hooks/dhcp/lease_cmds/Makefile.am
+index 90abfda..cfd6779 100644
+--- a/src/hooks/dhcp/lease_cmds/Makefile.am
++++ b/src/hooks/dhcp/lease_cmds/Makefile.am
+@@ -7,7 +7,7 @@ AM_CXXFLAGS  = $(KEA_CXXFLAGS)
+ # Define rule to build logging source files from message file
+ lease_cmds_messages.h lease_cmds_messages.cc: s-messages
+ s-messages: lease_cmds_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/hooks/dhcp/lease_cmds/lease_cmds_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/hooks/dhcp/lease_cmds/lease_cmds_messages.mes
+ 	touch $@
+ 
+ # Tell automake that the message files are built as part of the build process
+diff --git a/src/lib/http/Makefile.am b/src/lib/http/Makefile.am
+index 2b0eed5..db3bb0e 100644
+--- a/src/lib/http/Makefile.am
++++ b/src/lib/http/Makefile.am
+@@ -8,7 +8,7 @@ AM_CXXFLAGS  = $(KEA_CXXFLAGS)
+ http_messages.h http_messages.cc: s-messages
+ 
+ s-messages: http_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/http/http_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/http/http_messages.mes
+ 	touch $@
+ 
+ # Tell automake that the message files are built as part of the build process
+diff --git a/src/lib/process/Makefile.am b/src/lib/process/Makefile.am
+index c7746c6..71998ed 100644
+--- a/src/lib/process/Makefile.am
++++ b/src/lib/process/Makefile.am
+@@ -19,7 +19,7 @@ AM_CXXFLAGS  = $(KEA_CXXFLAGS)
+ process_messages.h process_messages.cc: s-messages
+ 
+ s-messages: process_messages.mes
+-	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/process/process_messages.mes
++	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/process/process_messages.mes
+ 	touch $@
+ 
+ spec_config.h: spec_config.h.pre
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-update-hooksdir-for-lease_cmds.patch b/meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-update-hooksdir-for-lease_cmds.patch
new file mode 100644
index 000000000..72fa113b0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-update-hooksdir-for-lease_cmds.patch
@@ -0,0 +1,30 @@
+From 77ab10015512e9cc0c7a160bd6b534bf4174bc95 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Wed, 21 Mar 2018 06:01:38 +0000
+Subject: [PATCH] Makefile.am: update hooksdir for lease_cmds
+
+update hooksdir for lease_cmds
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ src/hooks/dhcp/lease_cmds/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hooks/dhcp/lease_cmds/Makefile.am b/src/hooks/dhcp/lease_cmds/Makefile.am
+index cfd6779..22cc4a9 100644
+--- a/src/hooks/dhcp/lease_cmds/Makefile.am
++++ b/src/hooks/dhcp/lease_cmds/Makefile.am
+@@ -37,7 +37,7 @@ liblease_cmds_la_CXXFLAGS = $(AM_CXXFLAGS)
+ liblease_cmds_la_CPPFLAGS = $(AM_CPPFLAGS)
+ 
+ # install the shared object into $(libdir)/hooks
+-lib_hooksdir = $(libdir)/hooks
++lib_hooksdir = $(libdir)/kea/hooks
+ lib_hooks_LTLIBRARIES = libdhcp_lease_cmds.la
+ 
+ libdhcp_lease_cmds_la_SOURCES  =
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-connectivity/kea/files/0001-asiolink-fix-build-with-boost-1.66.patch b/meta-networking/recipes-connectivity/kea/files/0001-asiolink-fix-build-with-boost-1.66.patch
new file mode 100644
index 000000000..9262381d5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/kea/files/0001-asiolink-fix-build-with-boost-1.66.patch
@@ -0,0 +1,103 @@
+From 4fd11ef050438adeb1e0ae0d9d2d8ec3a2cb659c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bart=C5=82omiej=20Piotrowski?= <bpiotrowski@archlinux.org>
+Date: Sat, 30 Dec 2017 14:40:24 +0100
+Subject: [PATCH] asiolink: fix build with boost 1.66
+
+- use native_handle() for getting native socket type
+- use io_context instead of io_service
+
+Upstream-Status: Backport
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ src/lib/asiolink/io_acceptor.h         | 4 ++++
+ src/lib/asiolink/io_service.h          | 5 +++++
+ src/lib/asiolink/tcp_socket.h          | 4 ++++
+ src/lib/asiolink/udp_socket.h          | 4 ++++
+ src/lib/asiolink/unix_domain_socket.cc | 4 ++++
+ 5 files changed, 21 insertions(+)
+
+diff --git a/src/lib/asiolink/io_acceptor.h b/src/lib/asiolink/io_acceptor.h
+index c493d3427..913a3280b 100644
+--- a/src/lib/asiolink/io_acceptor.h
++++ b/src/lib/asiolink/io_acceptor.h
+@@ -47,7 +47,11 @@ public:
+ 
+     /// @brief Returns file descriptor of the underlying socket.
+     virtual int getNative() const {
++#if BOOST_VERSION < 106600
+         return (acceptor_->native());
++#else
++        return (acceptor_->native_handle());
++#endif
+     }
+ 
+     /// @brief Opens acceptor socket given the endpoint.
+diff --git a/src/lib/asiolink/io_service.h b/src/lib/asiolink/io_service.h
+index e9e402d11..e0832b2c0 100644
+--- a/src/lib/asiolink/io_service.h
++++ b/src/lib/asiolink/io_service.h
+@@ -11,7 +11,12 @@
+ 
+ namespace boost {
+ namespace asio {
++#if BOOST_VERSION < 106600
+     class io_service;
++#else
++    class io_context;
++    typedef io_context io_service;
++#endif
+ }
+ }
+ 
+diff --git a/src/lib/asiolink/tcp_socket.h b/src/lib/asiolink/tcp_socket.h
+index adf74d1f0..83b8264c8 100644
+--- a/src/lib/asiolink/tcp_socket.h
++++ b/src/lib/asiolink/tcp_socket.h
+@@ -75,7 +75,11 @@ public:
+ 
+     /// \brief Return file descriptor of underlying socket
+     virtual int getNative() const {
++#if BOOST_VERSION < 106600
+         return (socket_.native());
++#else
++        return (socket_.native_handle());
++#endif
+     }
+ 
+     /// \brief Return protocol of socket
+diff --git a/src/lib/asiolink/udp_socket.h b/src/lib/asiolink/udp_socket.h
+index 07ba44743..5b040cfe1 100644
+--- a/src/lib/asiolink/udp_socket.h
++++ b/src/lib/asiolink/udp_socket.h
+@@ -61,7 +61,11 @@ public:
+ 
+     /// \brief Return file descriptor of underlying socket
+     virtual int getNative() const {
++#if BOOST_VERSION < 106600
+         return (socket_.native());
++#else
++        return (socket_.native_handle());
++#endif
+     }
+ 
+     /// \brief Return protocol of socket
+diff --git a/src/lib/asiolink/unix_domain_socket.cc b/src/lib/asiolink/unix_domain_socket.cc
+index f17ec2e8f..d1ad9ec30 100644
+--- a/src/lib/asiolink/unix_domain_socket.cc
++++ b/src/lib/asiolink/unix_domain_socket.cc
+@@ -287,7 +287,11 @@ UnixDomainSocket::UnixDomainSocket(IOService& io_service)
+ 
+ int
+ UnixDomainSocket::getNative() const {
++#if BOOST_VERSION < 106600
+     return (impl_->socket_.native());
++#else
++    return (impl_->socket_.native_handle());
++#endif
+ }
+ 
+ int
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/meta-networking/recipes-connectivity/kea/files/kea-dhcp-ddns.service
new file mode 100644
index 000000000..91aa2eb14
--- /dev/null
+++ b/meta-networking/recipes-connectivity/kea/files/kea-dhcp-ddns.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Kea DHCP-DDNS Server
+Wants=network-online.target
+After=network-online.target
+After=time-sync.target
+
+[Service]
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/kea
+ExecStart=@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.conf
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/kea/files/kea-dhcp4.service b/meta-networking/recipes-connectivity/kea/files/kea-dhcp4.service
new file mode 100644
index 000000000..f32edcb90
--- /dev/null
+++ b/meta-networking/recipes-connectivity/kea/files/kea-dhcp4.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Kea DHCPv4 Server
+Wants=network-online.target
+After=network-online.target
+After=time-sync.target
+
+[Service]
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/kea
+ExecStart=@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/kea/files/kea-dhcp6.service b/meta-networking/recipes-connectivity/kea/files/kea-dhcp6.service
new file mode 100644
index 000000000..26d2205e6
--- /dev/null
+++ b/meta-networking/recipes-connectivity/kea/files/kea-dhcp6.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Kea DHCPv6 Server
+Wants=network-online.target
+After=network-online.target
+After=time-sync.target
+
+[Service]
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/kea
+ExecStart=@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/kea/kea_1.3.0.bb b/meta-networking/recipes-connectivity/kea/kea_1.3.0.bb
new file mode 100644
index 000000000..946c1e17d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/kea/kea_1.3.0.bb
@@ -0,0 +1,52 @@
+SUMMARY = "ISC Kea DHCP Server"
+DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It supports both DHCPv4 and DHCPv6 protocols along with their extensions, e.g. prefix delegation and dynamic updates to DNS."
+HOMEPAGE = "http://kea.isc.org"
+SECTION = "connectivity"
+LICENSE = "MPL-2.0 & BSL-1.0 & Apache-2.0"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=9310b19bc010f85f4ad19637f168f23f \
+    file://ext/coroutine/LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c \
+"
+
+SRC_URI = "\
+    http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
+    file://0001-Added-option-to-provide-kea-msg-compiler.patch \
+    file://0001-Makefile.am-fix-compile-error-about-kea-msg-compiler.patch \
+    file://0001-asiolink-fix-build-with-boost-1.66.patch \
+    file://0001-Makefile.am-update-hooksdir-for-lease_cmds.patch \
+    file://kea-dhcp4.service \
+    file://kea-dhcp6.service \
+    file://kea-dhcp-ddns.service \
+"
+
+SRC_URI[md5sum] = "f93bf836fd555a221f9ed0d4520058db"
+SRC_URI[sha256sum] = "6edfcdbf2526c218426a1d1a6a6694a4050c97bb8412953a230285d63415c391"
+
+inherit autotools systemd
+
+SYSTEMD_SERVICE_${PN} = "kea-dhcp4.service kea-dhcp6.service kea-dhcp-ddns.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+do_install_append_class-target() {
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
+    sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
+           -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+           ${D}${systemd_system_unitdir}/kea-dhcp*service
+}
+
+do_install_append() {
+    rm -rf "${D}${localstatedir}"
+}
+
+PACKAGECONFIG_class-target ??= "kmc openssl log4cplus boost"
+PACKAGECONFIG_class-native ??= "openssl log4cplus boost"
+
+PACKAGECONFIG[kmc] = "--with-msg-compiler=${STAGING_BINDIR_NATIVE}/kea-msg-compiler,,kea-native,"
+PACKAGECONFIG[openssl] = "--with-openssl=${STAGING_DIR_TARGET}${prefix},,openssl,openssl"
+PACKAGECONFIG[log4cplus] = "--with-log4cplus=${STAGING_DIR_TARGET}${prefix},,log4cplus,log4cplus"
+PACKAGECONFIG[boost] = "--with-boost-include=${STAGING_INCDIR} --with-boost-lib-dir=${STAGING_LIBDIR} --with-boost-libs=-lboost_system,,boost,boost"
+
+FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a"
+
+BBCLASSEXTEND += "native"
-- 
2.11.0


