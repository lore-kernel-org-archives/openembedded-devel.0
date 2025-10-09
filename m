Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 729D7CCD18D
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 21:41:48 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.2207.1760046107812530239
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 14:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=amiG9mxJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20251009214145f6432739880002078c-9q1y5d@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20251009214145f6432739880002078c
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 09 Oct 2025 23:41:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Ebj2wsphRFSeqimggJl1d+zFVHTPBOISgUzI8C3UvC4=;
 b=amiG9mxJRnkK4qDKLdQC65Q/I3MPOaX3/pM+9A9HQ58WPytUlylG6FycP9UAR8ItOTcQ0d
 sv/I75wxDhPCxQqGY4xc6XZ65+i1Tg91keSsXNGktfLbsSdbXAlr3ZRmw1YlMY8T1ekR2r/C
 OBEBmhAk1IQ9T7PhNXLqkSpohZ9KTiUJ+EYBaEZppRjnWUN9WJ928P7891E6vBF8L+HVhlu3
 Jjq2BkWUspT7MMVVKwl8BXhZ9g2chRPFGcUOIM6znWNv42xmRDwFQmus1ucCPdTcznbDUJZ1
 MeqU9/lb5avhIlrIwHLEnfuKyRmbglZqVujivzUIxk10eysr0oUhANug==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 2/3] squid: upgrade 6.12 -> 7.1
Date: Thu,  9 Oct 2025 23:41:31 +0200
Message-Id: <20251009214132.856182-2-peter.marko@siemens.com>
In-Reply-To: <20251009214132.856182-1-peter.marko@siemens.com>
References: <20251009214132.856182-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 21:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120452

From: Peter Marko <peter.marko@siemens.com>

Refresh all patches.
ptest patches needed larger rework for new test testHeader.

License-Update: copyright years refreshed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...quid-conf-tests-run-on-target-device.patch | 82 ++++++++++++++++---
 .../files/Set-up-for-cross-compilation.patch  |  6 +-
 .../files/Skip-AC_RUN_IFELSE-tests.patch      |  8 +-
 ...-serial-tests-config-needed-by-ptest.patch |  2 +
 .../squid/{squid_6.12.bb => squid_7.1.bb}     |  4 +-
 5 files changed, 84 insertions(+), 18 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_6.12.bb => squid_7.1.bb} (97%)

diff --git a/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch b/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
index ca1c16b83e..86b454d710 100644
--- a/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
+++ b/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
@@ -7,20 +7,46 @@ Subject: [PATCH] squid: make squid-conf-tests run on target device
 * Allow the tests to run on read-only root
   * Don't overwrite tests with true on success
   * Change logfile path to /var/log
+* skip testHeaders since it's not split to prepare/execute parts
 
 Upstream-Status: Inappropriate [cross compile specific]
 
 Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
-
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
- test-suite/Makefile.am        | 16 ++++++++--------
- test-suite/test-squid-conf.sh |  2 +-
- 2 files changed, 9 insertions(+), 9 deletions(-)
+ src/TestHeaders.am            |  6 +++---
+ test-suite/Makefile.am        | 26 +++++++++++++-------------
+ test-suite/test-squid-conf.sh |  4 ++--
+ 3 files changed, 18 insertions(+), 18 deletions(-)
 
+diff --git a/src/TestHeaders.am b/src/TestHeaders.am
+index 0ed5f56..d668876 100644
+--- a/src/TestHeaders.am
++++ b/src/TestHeaders.am
+@@ -14,8 +14,8 @@ EXCLUDE_FROM_HDR_TESTING =
+ # add an empty target named 'testHeaders' depending on the additional
+ # headers to test
+ 
+-testHeaders: $(SOURCES) $(noinst_HEADERS) $(EXTRA_DIST) $(top_srcdir)/test-suite/testHeader.cc.in
+-	$(MAKE) $(^:.h=.hdrtest) && cp $(TRUE) $@
++testHeaders: $(SOURCES) $(noinst_HEADERS) $(top_srcdir)/test-suite/testHeader.cc.in
++	$(MAKE) $(^:.h=.hdrtest)
+ 
+ .h.hdrtest:
+ 	@SrcFilePath=`echo $< | $(SED) 's%^$(top_srcdir)/%%'`; \
+@@ -31,5 +31,5 @@ testHeaders: $(SOURCES) $(noinst_HEADERS) $(EXTRA_DIST) $(top_srcdir)/test-suite
+ 		then echo "header-test: ok - $$SrcFilePath"; $(RM) "$$TargetFileName.cc" "$$TargetFileName"; \
+ 		else echo "header-test: not ok - $$SrcFilePath"; exit 1; fi
+ 
+-TESTS += testHeaders
++#TESTS += testHeaders
+ CLEANFILES += testHeaders
+diff --git a/test-suite/Makefile.am b/test-suite/Makefile.am
+index 0da5844..0bc381a 100644
 --- a/test-suite/Makefile.am
 +++ b/test-suite/Makefile.am
-@@ -21,7 +21,7 @@ LDADD = \
- EXTRA_PROGRAMS = mem_node_test splay
+@@ -11,7 +11,7 @@ include $(top_srcdir)/src/Common.am
+ AM_CPPFLAGS += -I$(srcdir)
  
  EXTRA_DIST = \
 -	$(srcdir)/squidconf/* \
@@ -28,14 +54,27 @@ Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
  	test-functionality.sh \
  	test-sources.sh \
  	test-squid-conf.sh \
-@@ -134,21 +134,21 @@ VirtualDeleteOperator_SOURCES = \
+@@ -124,37 +124,37 @@ VirtualDeleteOperator_LDADD = \
  
  installcheck-local: squid-conf-tests
  
 -squid-conf-tests: $(srcdir)/test-squid-conf.sh $(top_builddir)/src/squid.conf.default $(srcdir)/squidconf/*
--	@failed=0; cfglist="$(top_builddir)/src/squid.conf.default $(srcdir)/squidconf/*.conf"; rm -f $@ || $(TRUE); \
+-	@instructionFiles="$(srcdir)/squidconf/*.conf.instructions"; \
 +squid-conf-tests: test-squid-conf.sh $(top_builddir)/src/squid.conf.default squidconf/*
-+	@failed=0; cfglist="$(top_builddir)/src/squid.conf.default squidconf/*.conf"; rm -f $@ || $(TRUE); \
++	@instructionFiles="squidconf/*.conf.instructions"; \
+ 	for instructionFile in $$instructionFiles; do \
+ 		cfgBasename=`basename $$instructionFile .instructions`; \
+-		cfg=$(srcdir)/squidconf/$$cfgBasename; \
++		cfg=squidconf/$$cfgBasename; \
+ 		if ! test -f $$cfg; then \
+ 			echo "FAIL: $$instructionFile has no matching $$cfg"; \
+ 			exit 1; \
+ 		fi; \
+ 	done; \
+ 	failed=0; \
+-	cfglist="$(top_builddir)/src/squid.conf.default $(srcdir)/squidconf/*.conf"; \
++	cfglist="$(top_builddir)/src/squid.conf.default squidconf/*.conf"; \
+ 	rm -f $@ || $(TRUE); \
  	for cfg in $$cfglist ; do \
 -		$(srcdir)/test-squid-conf.sh $(top_builddir) $(sbindir) $$cfg || \
 +		./test-squid-conf.sh $(top_builddir) $(sbindir) $$cfg || \
@@ -55,11 +94,30 @@ Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
 -	if test "$$failed" -eq 0; then cp $(TRUE) $@ ; else exit 1; fi
 +	exit "$$failed"
  
--CLEANFILES += squid-conf-tests squid-stderr.log
-+CLEANFILES += squid-conf-tests /var/log/squid-stderr.log
+ CLEANFILES += \
+ 	squid-conf-tests \
+-	squid-expected-messages \
+-	squid-stderr.log \
+-	squid-stderr.log.next \
+-	squid-stderr.log.unmatched
++	/var/log/quid-expected-messages \
++	/var/log/squid-stderr.log \
++	/var/log/squid-stderr.log.next \
++	/var/log/squid-stderr.log.unmatched
+diff --git a/test-suite/test-squid-conf.sh b/test-suite/test-squid-conf.sh
+index 413a927..f678c5a 100755
 --- a/test-suite/test-squid-conf.sh
 +++ b/test-suite/test-squid-conf.sh
-@@ -111,7 +111,7 @@ then
+@@ -76,7 +76,7 @@ expectMessages()
+         exit 1
+     fi
+ 
+-    messageRegexFilename="squid-expected-messages"
++    messageRegexFilename="/var/log/squid-expected-messages"
+     if ! :> $messageRegexFilename
+     then
+         echo "$where: ERROR: Cannot create a temporary file named $messageRegexFilename"
+@@ -241,7 +241,7 @@ then
      done < $instructionsFile
  fi
  
diff --git a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
index 18bc78e6be..f80d37de20 100644
--- a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
+++ b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
@@ -16,11 +16,13 @@ Upstream-Status: Pending
  configure.ac | 1 +
  1 file changed, 1 insertion(+)
 
+diff --git a/configure.ac b/configure.ac
+index c7312d8..3b0e9e2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -29,6 +29,7 @@ m4_include([acinclude/tdb.m4])
- m4_include([acinclude/lib-checks.m4])
+@@ -29,6 +29,7 @@ m4_include([acinclude/lib-checks.m4])
  m4_include([acinclude/ax_cxx_compile_stdcxx.m4])
+ m4_include([acinclude/win32-sspi.m4])
  
 +HOSTCXX="$BUILD_CXX"
  PRESET_CFLAGS="$CFLAGS"
diff --git a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
index 489850e3bd..8522a299c1 100644
--- a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
+++ b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
@@ -16,10 +16,12 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  acinclude/lib-checks.m4 |  8 ++++++--
  2 files changed, 15 insertions(+), 3 deletions(-)
 
+diff --git a/acinclude/krb5.m4 b/acinclude/krb5.m4
+index e0286fa..b3e4bc7 100644
 --- a/acinclude/krb5.m4
 +++ b/acinclude/krb5.m4
-@@ -57,7 +57,15 @@ main(void)
- 
+@@ -98,7 +98,15 @@ main(void)
+         krb5_init_context(&context);
          return 0;
  }
 -]])], [ squid_cv_broken_heimdal_krb5_h=yes ], [ squid_cv_broken_heimdal_krb5_h=no ])
@@ -35,6 +37,8 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
      ])
      SQUID_STATE_ROLLBACK(squid_krb5_heimdal_test)
    ])
+diff --git a/acinclude/lib-checks.m4 b/acinclude/lib-checks.m4
+index 9793b9a..4f2dc83 100644
 --- a/acinclude/lib-checks.m4
 +++ b/acinclude/lib-checks.m4
 @@ -205,7 +205,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_METHOD],[
diff --git a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
index 5df006038b..d57ebe7869 100644
--- a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
+++ b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
@@ -14,6 +14,8 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/configure.ac b/configure.ac
+index 3b0e9e2..c730212 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -10,7 +10,7 @@ AC_PREREQ(2.61)
diff --git a/meta-networking/recipes-daemons/squid/squid_6.12.bb b/meta-networking/recipes-daemons/squid/squid_7.1.bb
similarity index 97%
rename from meta-networking/recipes-daemons/squid/squid_6.12.bb
rename to meta-networking/recipes-daemons/squid/squid_7.1.bb
index 41226f232e..d17223e866 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.12.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.1.bb
@@ -22,10 +22,10 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://squid.nm \
            "
 
-SRC_URI[sha256sum] = "f3df3abb2603a513266f24a5d4699a9f0d76b9f554d1848b67f9c51cd3b3cb50"
+SRC_URI[sha256sum] = "763b5a78561cedc4e47634fa42b8e6b8d46c87c949a151b4e7ac2396d2f97dea"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://errors/COPYRIGHT;md5=6fbb6a2adc362e206da7b4f42846cdec \
+                    file://errors/COPYRIGHT;md5=c2a0e15750d3a9743af9109fecc05622 \
                     "
 
 UPSTREAM_CHECK_URI = "https://github.com/squid-cache/${BPN}/releases/"

