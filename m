Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB66CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 11:30:48 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17500.1781782243835052395
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 04:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=K3xrek8L;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202606181130382e381d644c00020772-zqj9h9@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202606181130382e381d644c00020772
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 18 Jun 2026 13:30:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=M1IB7kEb7p3NigUE+IkGM/L8LYgXMqFw8hSZm0EMVew=;
 b=K3xrek8L2QLHrOhJlM/ZZLcBq1mYbuGYJ3zndg17p1FRd9bFyOM4L8YRdvOG46ue1DnW3U
 sa+PmyrLrMgzvTpFY9Ksa5I6Dv0nOV0ekHjgipWHm4lp3IH7AAly+uEd7CCfnZlfU8Ot2Gqu
 8hAz0XjNzkR7rBvIMVcRfRjP2cWuynS+vRtgQyb9iL1ovHUCgQpgKmGlE+1uXfdkNbiv20/O
 8sYQY/q+3cpWf22Xwyol+6gD5mRHZQdsQLmtlR6gkfu/RyERDJDqAfagU3Y22C4QaMKdgnjr
 4D/i16b7HsZ+RoIUx5Da27sKEwhY+cW3Wuks3aauNK4dpJ6J0GWp5z7g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] libpcre: move recipe from oe-core
Date: Thu, 18 Jun 2026 13:30:29 +0200
Message-ID: <20260618113029.1051020-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 11:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127662

From: Peter Marko <peter.marko@siemens.com>

This recipe was removed in oe-core as obsolete (replaced by libpcre2).
Since some recipes in meta-oe still depend on it, moe it here.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |   1 +
 .../recipes-support/libpcre/libpcre/Makefile  | 183 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre/run-ptest |   3 +
 .../recipes-support/libpcre/libpcre_8.45.bb   |  74 +++++++
 4 files changed, 261 insertions(+)
 create mode 100644 meta-oe/recipes-support/libpcre/libpcre/Makefile
 create mode 100644 meta-oe/recipes-support/libpcre/libpcre/run-ptest
 create mode 100644 meta-oe/recipes-support/libpcre/libpcre_8.45.bb

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 0467d1f424..46cf9254df 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -36,6 +36,7 @@ PTESTS_FAST_META_OE = "\
     libjcat \
     libio-pty-perl \
     libmanette \
+    libpcre \
     libplist \
     librelp \
     libssh \
diff --git a/meta-oe/recipes-support/libpcre/libpcre/Makefile b/meta-oe/recipes-support/libpcre/libpcre/Makefile
new file mode 100644
index 0000000000..708d807d08
--- /dev/null
+++ b/meta-oe/recipes-support/libpcre/libpcre/Makefile
@@ -0,0 +1,183 @@
+TESTS = pcre_stringpiece_unittest RunTest RunGrepTest
+subdir = .
+am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
+am__vpath_adj = case $$p in \
+    $(srcdir)/*) f=`echo "$$p" | sed "s|^$$srcdirstrip/||"`;; \
+    *) f=$$p;; \
+  esac;
+am__tty_colors_dummy = \
+  mgn= red= grn= lgn= blu= brg= std=; \
+  am__color_tests=no
+am__tty_colors = { \
+  $(am__tty_colors_dummy); \
+  if test "X$(AM_COLOR_TESTS)" = Xno; then \
+    am__color_tests=no; \
+  elif test "X$(AM_COLOR_TESTS)" = Xalways; then \
+    am__color_tests=yes; \
+  elif test "X$$TERM" != Xdumb && { test -t 1; } 2>/dev/null; then \
+    am__color_tests=yes; \
+  fi; \
+  if test $$am__color_tests = yes; then \
+    red='[0;31m'; \
+    grn='[0;32m'; \
+    lgn='[1;32m'; \
+    blu='[1;34m'; \
+    mgn='[0;35m'; \
+    brg='[1m'; \
+    std='[m'; \
+  fi; \
+}
+am__rst_title = { sed 's/.*/   &   /;h;s/./=/g;p;x;s/ *$$//;p;g' && echo; }
+am__sh_e_setup = case $$- in *e*) set +e;; esac
+am__common_driver_flags = \
+  --color-tests "$$am__color_tests" \
+  --enable-hard-errors "$$am__enable_hard_errors" \
+  --expect-failure "$$am__expect_failure"
+am__check_pre = \
+$(am__sh_e_setup); \
+$(am__vpath_adj_setup) $(am__vpath_adj) \
+$(am__tty_colors); \
+srcdir=$(srcdir); export srcdir; \
+case "$@" in \
+  */*) am__odir=`echo "./$@" | sed 's|/[^/]*$$||'`;; \
+    *) am__odir=.;; \
+esac; \
+test "x$$am__odir" = x"." || test -d "$$am__odir" \
+  || $(MKDIR_P) "$$am__odir" || exit $$?; \
+if test -f "./$$f"; then dir=./; \
+elif test -f "$$f"; then dir=; \
+else dir="$(srcdir)/"; fi; \
+tst=$$dir$$f; log='$@'; \
+if test -n '$(DISABLE_HARD_ERRORS)'; then \
+  am__enable_hard_errors=no; \
+else \
+  am__enable_hard_errors=yes; \
+fi;
+am__set_TESTS_bases = \
+  bases='$(TEST_LOGS)'; \
+  bases=`for i in $$bases; do echo $$i; done | sed 's/\.log$$//'`; \
+  bases=`echo $$bases`
+RECHECK_LOGS = $(TEST_LOGS)
+TEST_SUITE_LOG = test-suite.log
+TEST_EXTENSIONS =  .test
+LOG_DRIVER = $(SHELL) $(top_srcdir)/test-driver
+am__test_logs1 = $(TESTS:=.log)
+am__test_logs2 = $(am__test_logs1:.log=.log)
+TEST_LOGS = $(am__test_logs2:.test.log=.log)
+MKDIR_P = /bin/mkdir -p
+PACKAGE_STRING = PCRE 8.36
+SHELL = /bin/sh
+srcdir = .
+top_srcdir = .
+$(TEST_SUITE_LOG): $(TEST_LOGS)
+	@$(am__set_TESTS_bases); \
+	am__f_ok () { test -f "$$1" && test -r "$$1"; }; \
+	redo_bases=`for i in $$bases; do \
+	              am__f_ok $$i.trs && am__f_ok $$i.log || echo $$i; \
+	            done`; \
+	st=0;  \
+	errmsg="fatal: making $(TEST_SUITE_LOG): failed to create"; \
+	for i in $$redo_bases; do \
+	  test -f $$i.trs && test -r $$i.trs \
+	    || { echo "$$errmsg $$i.trs" >&2; st=1; }; \
+	  test -f $$i.log && test -r $$i.log \
+	    || { echo "$$errmsg $$i.log" >&2; st=1; }; \
+	done; \
+	test $$st -eq 0 || exit 1;
+	@$(am__sh_e_setup); $(am__tty_colors); $(am__set_TESTS_bases); \
+	ws='[ 	]'; \
+	results=`for b in $$bases; do echo $$b.trs; done`; \
+	test -n "$$results" || results=/dev/null; \
+	all=`  grep "^$$ws*:test-result:"           $$results | wc -l`; \
+	pass=` grep "^$$ws*:test-result:$$ws*PASS"  $$results | wc -l`; \
+	fail=` grep "^$$ws*:test-result:$$ws*FAIL"  $$results | wc -l`; \
+	skip=` grep "^$$ws*:test-result:$$ws*SKIP"  $$results | wc -l`; \
+	xfail=`grep "^$$ws*:test-result:$$ws*XFAIL" $$results | wc -l`; \
+	xpass=`grep "^$$ws*:test-result:$$ws*XPASS" $$results | wc -l`; \
+	error=`grep "^$$ws*:test-result:$$ws*ERROR" $$results | wc -l`; \
+	if test `expr $$fail + $$xpass + $$error` -eq 0; then \
+	  success=true; \
+	else \
+	  success=false; \
+	fi; \
+	br='==================='; br=$$br$$br$$br$$br; \
+	result_count () \
+	{ \
+	    if test x"$$1" = x"--maybe-color"; then \
+	      maybe_colorize=yes; \
+	    elif test x"$$1" = x"--no-color"; then \
+	      maybe_colorize=no; \
+	    else \
+	      echo "$@: invalid 'result_count' usage" >&2; exit 4; \
+	    fi; \
+	    shift; \
+	    desc=$$1 count=$$2; \
+	    if test $$maybe_colorize = yes && test $$count -gt 0; then \
+	      color_start=$$3 color_end=$$std; \
+	    else \
+	      color_start= color_end=; \
+	    fi; \
+	    echo "$${color_start}# $$desc $$count$${color_end}"; \
+	}; \
+	create_testsuite_report () \
+	{ \
+	  result_count $$1 "TOTAL:" $$all   "$$brg"; \
+	  result_count $$1 "PASS: " $$pass  "$$grn"; \
+	  result_count $$1 "SKIP: " $$skip  "$$blu"; \
+	  result_count $$1 "XFAIL:" $$xfail "$$lgn"; \
+	  result_count $$1 "FAIL: " $$fail  "$$red"; \
+	  result_count $$1 "XPASS:" $$xpass "$$red"; \
+	  result_count $$1 "ERROR:" $$error "$$mgn"; \
+	}; \
+	{								\
+	  echo "$(PACKAGE_STRING): $(subdir)/$(TEST_SUITE_LOG)" |	\
+	    $(am__rst_title);						\
+	  create_testsuite_report --no-color;				\
+	  echo;								\
+	  echo ".. contents:: :depth: 2";				\
+	  echo;								\
+	  for b in $$bases; do echo $$b; done;				\
+	} >$(TEST_SUITE_LOG).tmp || exit 1;				\
+	mv $(TEST_SUITE_LOG).tmp $(TEST_SUITE_LOG);			\
+	if $$success; then						\
+	  col="$$grn";							\
+	 else								\
+	  col="$$red";							\
+	  test x"$$VERBOSE" = x || cat $(TEST_SUITE_LOG);		\
+	fi;								\
+	echo "$${col}$$br$${std}"; 					\
+	echo "$${col}Testsuite summary for $(PACKAGE_STRING)$${std}";	\
+	echo "$${col}$$br$${std}"; 					\
+	create_testsuite_report --maybe-color;				\
+	echo "$$col$$br$$std";						\
+	if $$success; then :; else					\
+	  echo "$${col}See $(subdir)/$(TEST_SUITE_LOG)$${std}";		\
+	  echo "$$col$$br$$std";					\
+	fi;								\
+	$$success || exit 1
+check-TESTS:
+	@list='$(RECHECK_LOGS)';           test -z "$$list" || rm -f $$list
+	@test -z "$(TEST_SUITE_LOG)" || rm -f $(TEST_SUITE_LOG)
+	@set +e; $(am__set_TESTS_bases); \
+	log_list=`for i in $$bases; do echo $$i.log; done`; \
+	log_list=`echo $$log_list`; \
+	$(MAKE) $(AM_MAKEFLAGS) $(TEST_SUITE_LOG) TEST_LOGS="$$log_list"; \
+	exit $$?;
+pcre_stringpiece_unittest.log: pcre_stringpiece_unittest$(EXEEXT)
+	@p='pcre_stringpiece_unittest$(EXEEXT)'; \
+	b='pcre_stringpiece_unittest'; \
+	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
+	--log-file $$b.log --trs-file $$b.trs \
+	$(am__common_driver_flags) -- "$$tst"
+RunTest.log: RunTest
+	@p='RunTest'; \
+	b='RunTest'; \
+	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
+	--log-file $$b.log --trs-file $$b.trs \
+	$(am__common_driver_flags) -- "$$tst"
+RunGrepTest.log: RunGrepTest
+	@p='RunGrepTest'; \
+	b='RunGrepTest'; \
+	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
+	--log-file $$b.log --trs-file $$b.trs \
+	$(am__common_driver_flags) -- "$$tst"
diff --git a/meta-oe/recipes-support/libpcre/libpcre/run-ptest b/meta-oe/recipes-support/libpcre/libpcre/run-ptest
new file mode 100644
index 0000000000..990d4a12ad
--- /dev/null
+++ b/meta-oe/recipes-support/libpcre/libpcre/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make check-TESTS
diff --git a/meta-oe/recipes-support/libpcre/libpcre_8.45.bb b/meta-oe/recipes-support/libpcre/libpcre_8.45.bb
new file mode 100644
index 0000000000..c5ecbd8cf2
--- /dev/null
+++ b/meta-oe/recipes-support/libpcre/libpcre_8.45.bb
@@ -0,0 +1,74 @@
+DESCRIPTION = "The PCRE library is a set of functions that implement regular \
+expression pattern matching using the same syntax and semantics as Perl 5. PCRE \
+has its own native API, as well as a set of wrapper functions that correspond \
+to the POSIX regular expression API."
+SUMMARY = "Perl Compatible Regular Expressions"
+HOMEPAGE = "http://www.pcre.org"
+SECTION = "devel"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b5d5d1a69a24ea2718263f1ff85a1c58"
+SOURCEFORGE_PROJECT = "pcre"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/pcre-${PV}.tar.bz2 \
+           file://run-ptest \
+           file://Makefile \
+           "
+
+SRC_URI[sha256sum] = "4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8"
+
+CVE_PRODUCT = "pcre"
+
+S = "${UNPACKDIR}/pcre-${PV}"
+
+PROVIDES += "pcre"
+DEPENDS += "bzip2 zlib"
+
+PACKAGECONFIG ??= "pcre8 unicode-properties jit"
+
+PACKAGECONFIG[pcre8] = "--enable-pcre8,--disable-pcre8"
+PACKAGECONFIG[pcre16] = "--enable-pcre16,--disable-pcre16"
+PACKAGECONFIG[pcre32] = "--enable-pcre32,--disable-pcre32"
+PACKAGECONFIG[pcretest-readline] = "--enable-pcretest-libreadline,--disable-pcretest-libreadline,readline,"
+PACKAGECONFIG[unicode-properties] = "--enable-unicode-properties,--disable-unicode-properties"
+PACKAGECONFIG[jit] = "--enable-jit=auto,--disable-jit"
+
+BINCONFIG = "${bindir}/pcre-config"
+
+inherit autotools binconfig-disabled ptest sourceforge-releases
+
+EXTRA_OECONF = "--enable-utf"
+
+PACKAGES =+ "libpcrecpp libpcreposix pcregrep pcregrep-doc pcretest pcretest-doc"
+
+SUMMARY:libpcrecpp = "${SUMMARY} - C++ wrapper functions"
+SUMMARY:libpcreposix = "${SUMMARY} - C wrapper functions based on the POSIX regex API"
+SUMMARY:pcregrep = "grep utility that uses perl 5 compatible regexes"
+SUMMARY:pcregrep-doc = "grep utility that uses perl 5 compatible regexes - docs"
+SUMMARY:pcretest = "program for testing Perl-comatible regular expressions"
+SUMMARY:pcretest-doc = "program for testing Perl-comatible regular expressions - docs"
+
+FILES:libpcrecpp = "${libdir}/libpcrecpp.so.*"
+FILES:libpcreposix = "${libdir}/libpcreposix.so.*"
+FILES:pcregrep = "${bindir}/pcregrep"
+FILES:pcregrep-doc = "${mandir}/man1/pcregrep.1"
+FILES:pcretest = "${bindir}/pcretest"
+FILES:pcretest-doc = "${mandir}/man1/pcretest.1"
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install_ptest() {
+	t=${D}${PTEST_PATH}
+	cp ${UNPACKDIR}/Makefile $t
+	cp -r ${S}/testdata $t
+	for i in pcre_stringpiece_unittest pcregrep pcretest; do
+		${B}/libtool --mode=install install ${B}/$i $t/
+	done
+	for i in RunTest RunGrepTest test-driver; do
+		install ${S}/$i $t
+	done
+	# Skip the fr_FR locale test. If the locale fr_FR is found, it is tested.
+	# If not found, the test is skipped. The test program assumes fr_FR is non-UTF-8
+	# locale so the test fails if fr_FR is UTF-8 locale.
+	sed -i -e 's:do3=yes:do3=no:g' ${D}${PTEST_PATH}/RunTest 
+}
+
+RDEPENDS:${PN}-ptest += "make"

