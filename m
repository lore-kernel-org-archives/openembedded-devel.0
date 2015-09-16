Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A5E0360053
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 05:35:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G5ZNPu008028
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 22:35:23 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 22:35:22 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Sep 2015 01:35:21 -0400
Message-ID: <1442381721-59673-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] rsyslog: fix ptest
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
X-List-Received-Date: Wed, 16 Sep 2015 05:35:25 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

After rsyslog updated to 7.6.1, ptest fails to build & run since the
serial-tests config patch was dropped:

 - rsyslog-use-serial-tests-config-needed-by-ptest.patch

This patch involved serial test harness:

 + AM_INIT_AUTOMAKE([serial-tests])

Which is deprecated in favour of parallel test harness. Automake
generated a parallel test harness by default. It features automatic
collection of the test scripts output in .log files ...

More details please refer to:

 http://www.gnu.org/software/automake/manual/html_node/Parallel-Test-Harness.html

To enable the ptest with new changes, we should:

* add target 'buildtest-TESTS' for building test components;
* fix 'top_srcdir' and install required script 'test-driver';
* run testcases with target 'check-TESTS'.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest | 2 +-
 meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb  | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest b/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
index 38a1d1b..3770a75 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 #
-make -C tests -k runtest-TESTS
+make -C tests -k check-TESTS
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
index 15b0f29..b7a8140 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
@@ -70,7 +70,7 @@ PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
 
 TESTDIR = "tests"
 do_compile_ptest() {
-    sed -i 's/\(^buildtest-TESTS: \)/\1 $(check_PROGRAMS) /' ${TESTDIR}/Makefile
+    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
     oe_runmake -C ${TESTDIR} buildtest-TESTS
 }
 
@@ -82,8 +82,9 @@ do_install_ptest() {
     # do NOT need to rebuild Makefile itself
     sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
 
-    # fix the srcdir
+    # fix the srcdir, top_srcdir
     sed -i 's,^\(srcdir = \).*,\1${PTEST_PATH}/tests,' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
+    sed -i 's,^\(top_srcdir = \).*,\1${PTEST_PATH}/tests,' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
 
     # valgrind is not compatible with arm and mips,
     # so remove related test cases if there is no valgrind.
@@ -91,6 +92,9 @@ do_install_ptest() {
         sed -i '/udp-msgreduc-/d' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
     fi
 
+    # install test-driver
+    install -m 644 ${S}/test-driver ${D}${PTEST_PATH}/${TESTDIR}
+
     # install necessary links
     install -d ${D}${PTEST_PATH}/tools
     ln -sf ${sbindir}/rsyslogd ${D}${PTEST_PATH}/tools/rsyslogd
-- 
1.9.1


