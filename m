Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76DC870016
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2016 09:51:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7P9pvFG027252
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2016 02:51:58 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 25 Aug 2016 02:51:56 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Aug 2016 17:36:36 +0800
Message-ID: <20160825093636.24589-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH] squid: don't do squid-conf-tests at build time
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
X-List-Received-Date: Thu, 25 Aug 2016 09:51:59 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* squid-conf-tests is a test to run "squid -k parse -f"
  to perse the config files, which should not be run
  at build time since we are cross compiling, so remove
  it when compiling test-suite

* Fix the directories of the conf files for squid-conf-tests
  so that it can run on the target and add it for ptest

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...d-don-t-do-squid-conf-tests-at-build-time.patch | 63 ++++++++++++++++++++++
 .../recipes-daemons/squid/squid_3.5.20.bb          |  6 +++
 2 files changed, 69 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf-tests-at-build-time.patch

diff --git a/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf-tests-at-build-time.patch b/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf-tests-at-build-time.patch
new file mode 100644
index 0000000..a5e5547
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf-tests-at-build-time.patch
@@ -0,0 +1,63 @@
+From 54a9c2ba60adc7ec2724786662fd398e7c03999f Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 25 Aug 2016 15:22:57 +0800
+Subject: [PATCH] squid: don't do squid-conf-tests at build time
+
+* squid-conf-tests is a test to run "squid -k parse -f"
+  to perse the config files, which should not be run
+  at build time since we are cross compiling, so remove
+  it but it will be added back for the runtime ptest.
+
+* Fix the directories of the conf files for squid-conf-tests
+  so that it can run on the target board.
+
+Upstream-Status: Inappropriate [cross compile specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ test-suite/Makefile.am | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/test-suite/Makefile.am b/test-suite/Makefile.am
+index d5468be..77fc480 100644
+--- a/test-suite/Makefile.am
++++ b/test-suite/Makefile.am
+@@ -41,8 +41,7 @@ TESTS += debug \
+ 	MemPoolTest\
+ 	mem_node_test\
+ 	mem_hdr_test\
+-	$(ESI_TESTS) \
+-	squid-conf-tests
++	$(ESI_TESTS)
+ 
+ ## Sort by alpha - any build failures are significant.
+ check_PROGRAMS += debug \
+@@ -125,19 +124,19 @@ VirtualDeleteOperator_SOURCES = VirtualDeleteOperator.cc $(DEBUG_SOURCE)
+ ##$(TARGLIB): $(LIBOBJS)
+ ##	$(AR_R) $(TARGLIB) $(LIBOBJS)
+ 
+-squid-conf-tests: $(top_builddir)/src/squid.conf.default $(srcdir)/squidconf/*
++squid-conf-tests: /etc/squid.conf.default squidconf/*
+ 	@failed=0; cfglist="$?"; rm -f $@ || $(TRUE); \
+ 	for cfg in $$cfglist ; do \
+-		$(top_builddir)/src/squid -k parse -f $$cfg || \
++		squid -k parse -f $$cfg || \
+ 			{ echo "FAIL: squid.conf test: $$cfg" | \
+-				sed s%$(top_builddir)/src/%% | \
+-				sed s%$(srcdir)/squidconf/%% ; \
++				sed s%/etc/%% | \
++				sed s%squidconf/%% ; \
+ 				failed=1; break; \
+ 			}; \
+ 		if test "$$failed" -eq 0; then \
+ 			echo "PASS: squid.conf test: $$cfg" | \
+-				sed s%$(top_builddir)/src/%% | \
+-				sed s%$(srcdir)/squidconf/%% ; \
++				sed s%/etc/%% | \
++				sed s%squidconf/%% ; \
+ 		else break; fi; \
+ 	done; \
+ 	if test "$$failed" -eq 0; then cp $(TRUE) $@ ; fi
+-- 
+2.8.3
+
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
index 760eca8..fe1b027 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://run-ptest \
            file://volatiles.03_squid \
            file://set_sysroot_patch.patch \
+           file://squid-don-t-do-squid-conf-tests-at-build-time.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
@@ -66,6 +67,11 @@ do_install_ptest() {
 
     # do NOT need to rebuild Makefile itself
     sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
+
+    # Add squid-conf-tests for runtime tests
+    sed -e 's/^\(runtest-TESTS:\)/\1 squid-conf-tests/' \
+        -e "s/\(list=' \$(TESTS)\)/\1 squid-conf-tests/" \
+        -i ${D}${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
 do_install_append() {
-- 
2.8.3


