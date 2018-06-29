Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id C207075452
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 22:56:24 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id y15-v6so3240031pll.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 15:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aoLOlgnGY4RwGuL0vUaOS9SfsCuUVnUdZvWHi/muhfg=;
	b=Laemhq3gD/pgrl04HHnMjerWYSln5+Hu6aR020rCJdKZddiQSpE45xmFJYnOsaN7e6
	KIZbsIIdmFn+KC2ZRuCB1sQGTYGDqmQdNbSjAXG/fUGcl1yBDINLYGlu++VNQxoOTggS
	JrMe6DrnBwfyKElTEwTmH9D30JACkYIuvKmtacoKknyda6wR/JF8HRLZtFME7bn/zvYQ
	CY20VOVvKvtJ/SI+N5icJj9nd2O9iW2YcUbFUPsdo7Zm2dr6vsxyI0hGLivwJl+/U31m
	B2OAT3KQ1mqLIWIx74TzkUGGTDIW8CNEoDpdW9ay6wBCtp/DqTp29eGuIpA1IqtKWuQ3
	tG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aoLOlgnGY4RwGuL0vUaOS9SfsCuUVnUdZvWHi/muhfg=;
	b=Aswcdv3s+ZK9iFLOF02BclLVKjz9hTVJIC/yE4oh5pVwHXJVxvMjefPwdo4vSjY364
	TcmXOLHIxnxKTD8CFc2NWuCmWqdhtUQD/oSCu5CGdLP4xwwGE0KlN73HL6nKZk4SPUFb
	gC3I57JRmm79UN+kzcLKMD/uJipkYoNuwtxuKu8kAHhN+PytqoEIQOQlGpGN9tD6a6IC
	YCH2AD7jhubVJ1D5tt1GsL6xj2SchWGeNrIFvXSEJzLBhW9JB9Nxa1SrdNbkLug02xh5
	fTbi8hyV4VhX8Z9kOiS3eImW0YBp0XcSs6T5pCPeiLCOhDTmO5I+QMagnD4LoKs1YTSl
	paxw==
X-Gm-Message-State: APt69E0bt11gO85Ef1wQl68PbTq7/SyZLzsGaRbLNFsiYIbgC8yPhSsW
	6ZzoPOKuGE9PZzOz+/Kgws95lA==
X-Google-Smtp-Source: ADUXVKKsb9+IWzstq5D4QhQiZAmuz4Df1xd3w9i0dfmxNv9VeCry0k1q4iASM8GHUdJLuNFU+mJotg==
X-Received: by 2002:a17:902:22e:: with SMTP id
	43-v6mr17030380plc.82.1530312985352; 
	Fri, 29 Jun 2018 15:56:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	b69-v6sm3009171pfd.33.2018.06.29.15.56.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jun 2018 15:56:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 15:56:26 -0700
Message-Id: <20180629225626.33238-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180629225626.33238-1-raj.khem@gmail.com>
References: <20180629225626.33238-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] kea: Upgrade to 1.4.0 release
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
X-List-Received-Date: Fri, 29 Jun 2018 22:56:26 -0000

Licence-Update:
* Co-routines are now used from external boost
* ISC Copyright years are updated to 2018
* Support for Google Benchmark has been added under Apache-2.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-option-to-provide-kea-msg-compiler.patch | 235 ------------------
 ...compile-error-about-kea-msg-compiler.patch |  72 ------
 ...1-asiolink-fix-build-with-boost-1.66.patch | 103 --------
 ...e.am-update-hooksdir-for-lease_cmds.patch} |   7 +-
 .../kea/{kea_1.3.0.bb => kea_1.4.0.bb}        |  29 ++-
 5 files changed, 18 insertions(+), 428 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/kea/files/0001-Added-option-to-provide-kea-msg-compiler.patch
 delete mode 100644 meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-fix-compile-error-about-kea-msg-compiler.patch
 delete mode 100644 meta-networking/recipes-connectivity/kea/files/0001-asiolink-fix-build-with-boost-1.66.patch
 rename meta-networking/recipes-connectivity/kea/files/{0001-Makefile.am-update-hooksdir-for-lease_cmds.patch => 0003-Makefile.am-update-hooksdir-for-lease_cmds.patch} (85%)
 rename meta-networking/recipes-connectivity/kea/{kea_1.3.0.bb => kea_1.4.0.bb} (64%)

diff --git a/meta-networking/recipes-connectivity/kea/files/0001-Added-option-to-provide-kea-msg-compiler.patch b/meta-networking/recipes-connectivity/kea/files/0001-Added-option-to-provide-kea-msg-compiler.patch
deleted file mode 100644
index b58a658b92..0000000000
--- a/meta-networking/recipes-connectivity/kea/files/0001-Added-option-to-provide-kea-msg-compiler.patch
+++ /dev/null
@@ -1,235 +0,0 @@
-From c7806af2957627151ef603ad4aa893ca1a4bf59e Mon Sep 17 00:00:00 2001
-From: Siyu Zhang <siyu.zhang@windriver.com>
-Date: Sat, 10 Sep 2016 15:44:10 +0200
-Subject: [PATCH 1/1] Added option to provide kea-msg-compiler
-
-Upstream-Status: Inappropriate[oe specific]
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- configure.ac                        | 18 ++++++++++++++++++
- src/bin/d2/Makefile.am              |  2 +-
- src/bin/dhcp4/Makefile.am           |  2 +-
- src/bin/dhcp6/Makefile.am           |  2 +-
- src/bin/lfc/Makefile.am             |  2 +-
- src/hooks/dhcp/user_chk/Makefile.am |  2 +-
- src/lib/asiodns/Makefile.am         |  2 +-
- src/lib/config/Makefile.am          |  2 +-
- src/lib/dhcp_ddns/Makefile.am       |  2 +-
- src/lib/dhcpsrv/Makefile.am         |  6 +++---
- src/lib/eval/Makefile.am            |  2 +-
- src/lib/hooks/Makefile.am           |  2 +-
- src/lib/log/Makefile.am             |  8 +++++++-
- src/lib/log/tests/Makefile.am       |  2 +-
- 14 files changed, 39 insertions(+), 15 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ea41f08..edb5120 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -202,6 +202,24 @@ case "$host" in
- esac
- KEA_CXXFLAGS="$KEA_CXXFLAGS $MULTITHREADING_FLAG"
- 
-+AC_MSG_CHECKING(whether kea-msg-compiler is provided)
-+AC_ARG_WITH(msg-compiler,
-+    AC_HELP_STRING([--with-msg-compiler=PATH], [use provided kea-msg-compiler instead of local build]),
-+    [
-+     dnl TODO: Validate provided kea-msg-compiler
-+     AC_SUBST([KEA_MSG_COMPILER], [${withval}])
-+     AC_MSG_RESULT(${withval})],
-+    [
-+     AC_MSG_RESULT([no])
-+     if test x"$host" != x"$build" && test x"$host" == x"$target"; then
-+         AC_MSG_ERROR(native kea-msg-compiler not provided for cross compilation: build=${build} host=${host} target=${target})
-+     else
-+         AC_SUBST([KEA_MSG_COMPILER], ['$(top_builddir)/src/lib/log/compiler/kea-msg-compiler'])
-+         with_msg_compiler=no
-+     fi])
-+
-+AM_CONDITIONAL([HAVE_MSG_COMPILER], [test x"$with_msg_compiler" != x"no"])
-+
- # Disable -Werror by default. Only use it if specifically enabled.
- # The usage of this flag is:
- #
-diff --git a/src/bin/d2/Makefile.am b/src/bin/d2/Makefile.am
-index 0b4e7d5..40cc094 100644
---- a/src/bin/d2/Makefile.am
-+++ b/src/bin/d2/Makefile.am
-@@ -53,7 +53,7 @@ spec_config.h: spec_config.h.pre
- d2_messages.h d2_messages.cc: s-messages
- 
- s-messages: d2_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/bin/d2/d2_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/bin/d2/d2_messages.mes
- 	touch $@
- 
- BUILT_SOURCES = d2_messages.h d2_messages.cc
-diff --git a/src/bin/dhcp4/Makefile.am b/src/bin/dhcp4/Makefile.am
-index 8360677..57acb91 100644
---- a/src/bin/dhcp4/Makefile.am
-+++ b/src/bin/dhcp4/Makefile.am
-@@ -47,7 +47,7 @@ spec_config.h: spec_config.h.pre
- dhcp4_messages.h dhcp4_messages.cc: s-messages
- 
- s-messages: dhcp4_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/bin/dhcp4/dhcp4_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/bin/dhcp4/dhcp4_messages.mes
- 	touch $@
- 
- BUILT_SOURCES = spec_config.h dhcp4_messages.h dhcp4_messages.cc
-diff --git a/src/bin/dhcp6/Makefile.am b/src/bin/dhcp6/Makefile.am
-index 47155ae..d7ed722 100644
---- a/src/bin/dhcp6/Makefile.am
-+++ b/src/bin/dhcp6/Makefile.am
-@@ -48,7 +48,7 @@ spec_config.h: spec_config.h.pre
- dhcp6_messages.h dhcp6_messages.cc: s-messages
- 
- s-messages: dhcp6_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/bin/dhcp6/dhcp6_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/bin/dhcp6/dhcp6_messages.mes
- 	touch $@
- 
- BUILT_SOURCES = spec_config.h dhcp6_messages.h dhcp6_messages.cc
-diff --git a/src/bin/lfc/Makefile.am b/src/bin/lfc/Makefile.am
-index 7bfeb96..09a700e 100644
---- a/src/bin/lfc/Makefile.am
-+++ b/src/bin/lfc/Makefile.am
-@@ -32,7 +32,7 @@ endif
- lfc_messages.h lfc_messages.cc: s-messages
- 
- s-messages: lfc_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/bin/lfc/lfc_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/bin/lfc/lfc_messages.mes
- 	touch $@
- 
- BUILT_SOURCES = lfc_messages.h lfc_messages.cc
-diff --git a/src/hooks/dhcp/user_chk/Makefile.am b/src/hooks/dhcp/user_chk/Makefile.am
-index 41ad7b2..32a93412 100644
---- a/src/hooks/dhcp/user_chk/Makefile.am
-+++ b/src/hooks/dhcp/user_chk/Makefile.am
-@@ -7,7 +7,7 @@ AM_CXXFLAGS  = $(KEA_CXXFLAGS)
- # Define rule to build logging source files from message file
- user_chk_messages.h user_chk_messages.cc: s-messages
- s-messages: user_chk_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/hooks/dhcp/user_chk/user_chk_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/hooks/dhcp/user_chk/user_chk_messages.mes
- 	touch $@
- 
- # Tell automake that the message files are built as part of the build process
-diff --git a/src/lib/asiodns/Makefile.am b/src/lib/asiodns/Makefile.am
-index 24dfe05..60c9f80 100644
---- a/src/lib/asiodns/Makefile.am
-+++ b/src/lib/asiodns/Makefile.am
-@@ -11,7 +11,7 @@ CLEANFILES = *.gcno *.gcda asiodns_messages.h asiodns_messages.cc s-messages
- asiodns_messages.h asiodns_messages.cc: s-messages
- 
- s-messages: asiodns_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/asiodns/asiodns_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/asiodns/asiodns_messages.mes
- 	touch $@
- 
- BUILT_SOURCES = asiodns_messages.h asiodns_messages.cc
-diff --git a/src/lib/config/Makefile.am b/src/lib/config/Makefile.am
-index a89d530..26894ad 100644
---- a/src/lib/config/Makefile.am
-+++ b/src/lib/config/Makefile.am
-@@ -7,7 +7,7 @@ AM_CPPFLAGS += $(BOOST_INCLUDES)
- config_messages.h config_messages.cc: s-messages
- 
- s-messages: config_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/config/config_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/config/config_messages.mes
- 	touch $@
- 
- BUILT_SOURCES = config_messages.h config_messages.cc
-diff --git a/src/lib/dhcp_ddns/Makefile.am b/src/lib/dhcp_ddns/Makefile.am
-index 820f448..fe15533 100644
---- a/src/lib/dhcp_ddns/Makefile.am
-+++ b/src/lib/dhcp_ddns/Makefile.am
-@@ -8,7 +8,7 @@ AM_CXXFLAGS  = $(KEA_CXXFLAGS)
- dhcp_ddns_messages.h dhcp_ddns_messages.cc: s-messages
- 
- s-messages: dhcp_ddns_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/dhcp_ddns/dhcp_ddns_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/dhcp_ddns/dhcp_ddns_messages.mes
- 	touch $@
- 
- # Tell automake that the message files are built as part of the build process
-diff --git a/src/lib/dhcpsrv/Makefile.am b/src/lib/dhcpsrv/Makefile.am
-index db95dbd..6499b9f 100644
---- a/src/lib/dhcpsrv/Makefile.am
-+++ b/src/lib/dhcpsrv/Makefile.am
-@@ -52,11 +52,11 @@ alloc_engine_messages.h alloc_engine_messages.cc dhcpsrv_messages.h \
- dhcpsrv_messages.cc hosts_messages.h hosts_messages.cc: s-messages
- 
- s-messages: alloc_engine_messages.mes dhcpsrv_messages.mes hosts_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/dhcpsrv/alloc_engine_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/dhcpsrv/alloc_engine_messages.mes
- 	touch $@
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/dhcpsrv/dhcpsrv_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/dhcpsrv/dhcpsrv_messages.mes
- 	touch $@
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/dhcpsrv/hosts_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/dhcpsrv/hosts_messages.mes
- 	touch $@
- 
- # Tell Automake that the {alloc_engine,dhcpsrv,hosts}_messages.{cc,h} source files
-diff --git a/src/lib/eval/Makefile.am b/src/lib/eval/Makefile.am
-index e4968c1..f8464f8 100644
---- a/src/lib/eval/Makefile.am
-+++ b/src/lib/eval/Makefile.am
-@@ -47,7 +47,7 @@ EXTRA_DIST += lexer.ll parser.yy
- eval_messages.h eval_messages.cc: s-messages
- 
- s-messages: eval_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/eval/eval_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/eval/eval_messages.mes
- 	touch $@
- 
- # Tell Automake that the eval_messages.{cc,h} source files are created in the
-diff --git a/src/lib/hooks/Makefile.am b/src/lib/hooks/Makefile.am
-index 624e227..3458da8 100644
---- a/src/lib/hooks/Makefile.am
-+++ b/src/lib/hooks/Makefile.am
-@@ -8,7 +8,7 @@ AM_CXXFLAGS  = $(KEA_CXXFLAGS)
- hooks_messages.h hooks_messages.cc: s-messages
- 
- s-messages: hooks_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/hooks/hooks_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/hooks/hooks_messages.mes
- 	touch $@
- 
- # Tell automake that the message files are built as part of the build process
-diff --git a/src/lib/log/Makefile.am b/src/lib/log/Makefile.am
-index e1185cd..22e9ce6 100644
---- a/src/lib/log/Makefile.am
-+++ b/src/lib/log/Makefile.am
-@@ -1,4 +1,10 @@
--SUBDIRS = interprocess . compiler tests
-+SUBDIRS = interprocess .
-+
-+if !HAVE_MSG_COMPILER
-+SUBDIRS += compiler
-+endif
-+
-+SUBDIRS += tests
- 
- AM_CPPFLAGS = -I$(top_builddir)/src/lib -I$(top_srcdir)/src/lib
- AM_CPPFLAGS += $(BOOST_INCLUDES)
-diff --git a/src/lib/log/tests/Makefile.am b/src/lib/log/tests/Makefile.am
-index 03806f9..caf9cab 100644
---- a/src/lib/log/tests/Makefile.am
-+++ b/src/lib/log/tests/Makefile.am
-@@ -17,7 +17,7 @@ BUILT_SOURCES = log_test_messages.h log_test_messages.cc
- log_test_messages.h log_test_messages.cc: s-messages
- 
- s-messages: log_test_messages.mes
--	$(AM_V_GEN) $(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/log/tests/log_test_messages.mes
-+	$(AM_V_GEN) @KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/log/tests/log_test_messages.mes
- 	touch $@
- 
- CLEANFILES += log_test_messages.h log_test_messages.cc s-messages
--- 
-1.8.4.2
-
diff --git a/meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-fix-compile-error-about-kea-msg-compiler.patch b/meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-fix-compile-error-about-kea-msg-compiler.patch
deleted file mode 100644
index e8a4ae41b5..0000000000
--- a/meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-fix-compile-error-about-kea-msg-compiler.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From d800c6017962e358c8b2ada6803acb0f4011a763 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Fri, 16 Mar 2018 08:03:20 +0000
-Subject: [PATCH] Makefile.am: fix compile error about kea-msg-compiler
-
-fix compile error about kea-msg-compiler
-
-Upstream-Status: Inappropriate[oe specific]
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- src/bin/agent/Makefile.am             | 2 +-
- src/hooks/dhcp/lease_cmds/Makefile.am | 2 +-
- src/lib/http/Makefile.am              | 2 +-
- src/lib/process/Makefile.am           | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/bin/agent/Makefile.am b/src/bin/agent/Makefile.am
-index e67c572..b646325 100644
---- a/src/bin/agent/Makefile.am
-+++ b/src/bin/agent/Makefile.am
-@@ -33,7 +33,7 @@ endif
- ca_messages.h ca_messages.cc: s-messages
- 
- s-messages: ca_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/bin/agent/ca_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/bin/agent/ca_messages.mes
- 	touch $@
- 
- BUILT_SOURCES = ca_messages.h ca_messages.cc
-diff --git a/src/hooks/dhcp/lease_cmds/Makefile.am b/src/hooks/dhcp/lease_cmds/Makefile.am
-index 90abfda..cfd6779 100644
---- a/src/hooks/dhcp/lease_cmds/Makefile.am
-+++ b/src/hooks/dhcp/lease_cmds/Makefile.am
-@@ -7,7 +7,7 @@ AM_CXXFLAGS  = $(KEA_CXXFLAGS)
- # Define rule to build logging source files from message file
- lease_cmds_messages.h lease_cmds_messages.cc: s-messages
- s-messages: lease_cmds_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/hooks/dhcp/lease_cmds/lease_cmds_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/hooks/dhcp/lease_cmds/lease_cmds_messages.mes
- 	touch $@
- 
- # Tell automake that the message files are built as part of the build process
-diff --git a/src/lib/http/Makefile.am b/src/lib/http/Makefile.am
-index 2b0eed5..db3bb0e 100644
---- a/src/lib/http/Makefile.am
-+++ b/src/lib/http/Makefile.am
-@@ -8,7 +8,7 @@ AM_CXXFLAGS  = $(KEA_CXXFLAGS)
- http_messages.h http_messages.cc: s-messages
- 
- s-messages: http_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/http/http_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/http/http_messages.mes
- 	touch $@
- 
- # Tell automake that the message files are built as part of the build process
-diff --git a/src/lib/process/Makefile.am b/src/lib/process/Makefile.am
-index c7746c6..71998ed 100644
---- a/src/lib/process/Makefile.am
-+++ b/src/lib/process/Makefile.am
-@@ -19,7 +19,7 @@ AM_CXXFLAGS  = $(KEA_CXXFLAGS)
- process_messages.h process_messages.cc: s-messages
- 
- s-messages: process_messages.mes
--	$(top_builddir)/src/lib/log/compiler/kea-msg-compiler $(top_srcdir)/src/lib/process/process_messages.mes
-+	@KEA_MSG_COMPILER@ $(top_srcdir)/src/lib/process/process_messages.mes
- 	touch $@
- 
- spec_config.h: spec_config.h.pre
--- 
-2.13.3
-
diff --git a/meta-networking/recipes-connectivity/kea/files/0001-asiolink-fix-build-with-boost-1.66.patch b/meta-networking/recipes-connectivity/kea/files/0001-asiolink-fix-build-with-boost-1.66.patch
deleted file mode 100644
index 9262381d5b..0000000000
--- a/meta-networking/recipes-connectivity/kea/files/0001-asiolink-fix-build-with-boost-1.66.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 4fd11ef050438adeb1e0ae0d9d2d8ec3a2cb659c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Bart=C5=82omiej=20Piotrowski?= <bpiotrowski@archlinux.org>
-Date: Sat, 30 Dec 2017 14:40:24 +0100
-Subject: [PATCH] asiolink: fix build with boost 1.66
-
-- use native_handle() for getting native socket type
-- use io_context instead of io_service
-
-Upstream-Status: Backport
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- src/lib/asiolink/io_acceptor.h         | 4 ++++
- src/lib/asiolink/io_service.h          | 5 +++++
- src/lib/asiolink/tcp_socket.h          | 4 ++++
- src/lib/asiolink/udp_socket.h          | 4 ++++
- src/lib/asiolink/unix_domain_socket.cc | 4 ++++
- 5 files changed, 21 insertions(+)
-
-diff --git a/src/lib/asiolink/io_acceptor.h b/src/lib/asiolink/io_acceptor.h
-index c493d3427..913a3280b 100644
---- a/src/lib/asiolink/io_acceptor.h
-+++ b/src/lib/asiolink/io_acceptor.h
-@@ -47,7 +47,11 @@ public:
- 
-     /// @brief Returns file descriptor of the underlying socket.
-     virtual int getNative() const {
-+#if BOOST_VERSION < 106600
-         return (acceptor_->native());
-+#else
-+        return (acceptor_->native_handle());
-+#endif
-     }
- 
-     /// @brief Opens acceptor socket given the endpoint.
-diff --git a/src/lib/asiolink/io_service.h b/src/lib/asiolink/io_service.h
-index e9e402d11..e0832b2c0 100644
---- a/src/lib/asiolink/io_service.h
-+++ b/src/lib/asiolink/io_service.h
-@@ -11,7 +11,12 @@
- 
- namespace boost {
- namespace asio {
-+#if BOOST_VERSION < 106600
-     class io_service;
-+#else
-+    class io_context;
-+    typedef io_context io_service;
-+#endif
- }
- }
- 
-diff --git a/src/lib/asiolink/tcp_socket.h b/src/lib/asiolink/tcp_socket.h
-index adf74d1f0..83b8264c8 100644
---- a/src/lib/asiolink/tcp_socket.h
-+++ b/src/lib/asiolink/tcp_socket.h
-@@ -75,7 +75,11 @@ public:
- 
-     /// \brief Return file descriptor of underlying socket
-     virtual int getNative() const {
-+#if BOOST_VERSION < 106600
-         return (socket_.native());
-+#else
-+        return (socket_.native_handle());
-+#endif
-     }
- 
-     /// \brief Return protocol of socket
-diff --git a/src/lib/asiolink/udp_socket.h b/src/lib/asiolink/udp_socket.h
-index 07ba44743..5b040cfe1 100644
---- a/src/lib/asiolink/udp_socket.h
-+++ b/src/lib/asiolink/udp_socket.h
-@@ -61,7 +61,11 @@ public:
- 
-     /// \brief Return file descriptor of underlying socket
-     virtual int getNative() const {
-+#if BOOST_VERSION < 106600
-         return (socket_.native());
-+#else
-+        return (socket_.native_handle());
-+#endif
-     }
- 
-     /// \brief Return protocol of socket
-diff --git a/src/lib/asiolink/unix_domain_socket.cc b/src/lib/asiolink/unix_domain_socket.cc
-index f17ec2e8f..d1ad9ec30 100644
---- a/src/lib/asiolink/unix_domain_socket.cc
-+++ b/src/lib/asiolink/unix_domain_socket.cc
-@@ -287,7 +287,11 @@ UnixDomainSocket::UnixDomainSocket(IOService& io_service)
- 
- int
- UnixDomainSocket::getNative() const {
-+#if BOOST_VERSION < 106600
-     return (impl_->socket_.native());
-+#else
-+    return (impl_->socket_.native_handle());
-+#endif
- }
- 
- int
--- 
-2.11.0
-
diff --git a/meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-update-hooksdir-for-lease_cmds.patch b/meta-networking/recipes-connectivity/kea/files/0003-Makefile.am-update-hooksdir-for-lease_cmds.patch
similarity index 85%
rename from meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-update-hooksdir-for-lease_cmds.patch
rename to meta-networking/recipes-connectivity/kea/files/0003-Makefile.am-update-hooksdir-for-lease_cmds.patch
index 72fa113b00..381a3a7eb8 100644
--- a/meta-networking/recipes-connectivity/kea/files/0001-Makefile.am-update-hooksdir-for-lease_cmds.patch
+++ b/meta-networking/recipes-connectivity/kea/files/0003-Makefile.am-update-hooksdir-for-lease_cmds.patch
@@ -1,13 +1,14 @@
-From 77ab10015512e9cc0c7a160bd6b534bf4174bc95 Mon Sep 17 00:00:00 2001
+From cd902b8b588681a27d5321f1ee078a1c8f6e6935 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Wed, 21 Mar 2018 06:01:38 +0000
-Subject: [PATCH] Makefile.am: update hooksdir for lease_cmds
+Subject: [PATCH 3/3] Makefile.am: update hooksdir for lease_cmds
 
 update hooksdir for lease_cmds
 
 Upstream-Status: Pending
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+
 ---
  src/hooks/dhcp/lease_cmds/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -26,5 +27,5 @@ index cfd6779..22cc4a9 100644
  
  libdhcp_lease_cmds_la_SOURCES  =
 -- 
-2.13.3
+2.18.0
 
diff --git a/meta-networking/recipes-connectivity/kea/kea_1.3.0.bb b/meta-networking/recipes-connectivity/kea/kea_1.4.0.bb
similarity index 64%
rename from meta-networking/recipes-connectivity/kea/kea_1.3.0.bb
rename to meta-networking/recipes-connectivity/kea/kea_1.4.0.bb
index 946c1e17dd..40db22bf02 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.3.0.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.4.0.bb
@@ -2,31 +2,31 @@ SUMMARY = "ISC Kea DHCP Server"
 DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It supports both DHCPv4 and DHCPv6 protocols along with their extensions, e.g. prefix delegation and dynamic updates to DNS."
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
-LICENSE = "MPL-2.0 & BSL-1.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=9310b19bc010f85f4ad19637f168f23f \
-    file://ext/coroutine/LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c \
-"
+LICENSE = "MPL-2.0 & Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1666a9c4bb55adbc8939d85643096bd3"
+
+DEPENDS += "kea-native"
 
 SRC_URI = "\
     http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
-    file://0001-Added-option-to-provide-kea-msg-compiler.patch \
-    file://0001-Makefile.am-fix-compile-error-about-kea-msg-compiler.patch \
-    file://0001-asiolink-fix-build-with-boost-1.66.patch \
-    file://0001-Makefile.am-update-hooksdir-for-lease_cmds.patch \
+    file://0003-Makefile.am-update-hooksdir-for-lease_cmds.patch \
     file://kea-dhcp4.service \
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
 "
-
-SRC_URI[md5sum] = "f93bf836fd555a221f9ed0d4520058db"
-SRC_URI[sha256sum] = "6edfcdbf2526c218426a1d1a6a6694a4050c97bb8412953a230285d63415c391"
+SRC_URI[md5sum] = "26eedd749101642757d788431605aaa5"
+SRC_URI[sha256sum] = "c0f8ecb93657adfc5ab970c91706754e601084828493f053f159661d21b31128"
 
 inherit autotools systemd
 
 SYSTEMD_SERVICE_${PN} = "kea-dhcp4.service kea-dhcp6.service kea-dhcp-ddns.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
+do_configure_prepend_class-target() {
+    mkdir -p ${B}/src/lib/log/compiler/
+    ln -sf ${STAGING_BINDIR_NATIVE}/kea-msg-compiler ${B}/src/lib/log/compiler/kea-msg-compiler
+}
+
 do_install_append_class-target() {
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 ${WORKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
@@ -39,14 +39,13 @@ do_install_append() {
     rm -rf "${D}${localstatedir}"
 }
 
-PACKAGECONFIG_class-target ??= "kmc openssl log4cplus boost"
-PACKAGECONFIG_class-native ??= "openssl log4cplus boost"
+PACKAGECONFIG ??= "openssl log4cplus boost"
 
-PACKAGECONFIG[kmc] = "--with-msg-compiler=${STAGING_BINDIR_NATIVE}/kea-msg-compiler,,kea-native,"
 PACKAGECONFIG[openssl] = "--with-openssl=${STAGING_DIR_TARGET}${prefix},,openssl,openssl"
 PACKAGECONFIG[log4cplus] = "--with-log4cplus=${STAGING_DIR_TARGET}${prefix},,log4cplus,log4cplus"
 PACKAGECONFIG[boost] = "--with-boost-include=${STAGING_INCDIR} --with-boost-lib-dir=${STAGING_LIBDIR} --with-boost-libs=-lboost_system,,boost,boost"
 
 FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a"
+FILES_${PN} += "${libdir}/hooks/*.so"
 
 BBCLASSEXTEND += "native"
-- 
2.18.0


