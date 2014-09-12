Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB40E65CE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 07:41:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8C7fDgk008588
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 00:41:14 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 12 Sep 2014 00:41:13 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Sep 2014 03:41:11 -0400
Message-ID: <1410507671-22872-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: add ptest support
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
X-List-Received-Date: Fri, 12 Sep 2014 07:41:16 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changed:
- add a patch to use serial-tests config needed by ptest
- add a patch to fix rsyslog test cases don't finish issue
- add run-ptest, do_compile_ptest and do_install_ptest
- add dependency for rsyslog-ptest
- add PACKAGECONFIG for valgrind

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../rsyslog/rsyslog-fix-ptest-not-finish.patch     | 96 ++++++++++++++++++++++
 ...g-use-serial-tests-config-needed-by-ptest.patch | 28 +++++++
 meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest |  3 +
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb  | 59 ++++++++++++-
 4 files changed, 185 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-fix-ptest-not-finish.patch
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-use-serial-tests-config-needed-by-ptest.patch
 create mode 100755 meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-fix-ptest-not-finish.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-fix-ptest-not-finish.patch
new file mode 100644
index 0000000..bdcb6e2
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-fix-ptest-not-finish.patch
@@ -0,0 +1,96 @@
+$MaxMessageSize doesn't work if before $IncludeConfig diag-common.conf, then
+test cases fall into infinite loop with error message:
+
+8062.511110729:4902c480: error: message received is larger than max msg size, we split it
+8062.511152265:4902c480: discarding zero-sized message
+
+Update configure to fix it.
+
+Upstream-Status: pending
+
+Kai Kang <kai.kang@windriver.com>
+---
+diff -Nru rsyslog-7.4.4/tests/testsuites/complex1.conf rsyslog-7.4.4.new/tests/testsuites/complex1.conf
+--- rsyslog-7.4.4/tests/testsuites/complex1.conf	2013-08-31 00:30:41.000000000 +0800
++++ rsyslog-7.4.4.new/tests/testsuites/complex1.conf	2013-12-18 14:28:10.644004184 +0800
+@@ -1,7 +1,7 @@
+ # complex test case with multiple actions in gzip mode
+ # rgerhards, 2009-05-22
+-$MaxMessageSize 10k
+ $IncludeConfig diag-common.conf
++$MaxMessageSize 10k
+ 
+ $MainMsgQueueTimeoutEnqueue 5000
+ 
+diff -Nru rsyslog-7.4.4/tests/testsuites/gzipwr_large.conf rsyslog-7.4.4.new/tests/testsuites/gzipwr_large.conf
+--- rsyslog-7.4.4/tests/testsuites/gzipwr_large.conf	2012-04-04 14:29:55.000000000 +0800
++++ rsyslog-7.4.4.new/tests/testsuites/gzipwr_large.conf	2013-12-18 14:28:10.645004186 +0800
+@@ -1,7 +1,7 @@
+ # simple async writing test
+ # rgerhards, 2010-03-09
+-$MaxMessageSize 10k
+ $IncludeConfig diag-common.conf
++$MaxMessageSize 10k
+ 
+ $ModLoad ../plugins/imtcp/.libs/imtcp
+ $MainMsgQueueTimeoutShutdown 10000
+diff -Nru rsyslog-7.4.4/tests/testsuites/gzipwr_large_dynfile.conf rsyslog-7.4.4.new/tests/testsuites/gzipwr_large_dynfile.conf
+--- rsyslog-7.4.4/tests/testsuites/gzipwr_large_dynfile.conf	2012-04-04 14:29:55.000000000 +0800
++++ rsyslog-7.4.4.new/tests/testsuites/gzipwr_large_dynfile.conf	2013-12-18 14:28:10.645004186 +0800
+@@ -1,7 +1,7 @@
+ # simple async writing test
+ # rgerhards, 2010-03-09
+-$MaxMessageSize 10k
+ $IncludeConfig diag-common.conf
++$MaxMessageSize 10k
+ 
+ $ModLoad ../plugins/imtcp/.libs/imtcp
+ $MainMsgQueueTimeoutShutdown 10000
+diff -Nru rsyslog-7.4.4/tests/testsuites/imptcp_conndrop.conf rsyslog-7.4.4.new/tests/testsuites/imptcp_conndrop.conf
+--- rsyslog-7.4.4/tests/testsuites/imptcp_conndrop.conf	2013-08-31 00:30:41.000000000 +0800
++++ rsyslog-7.4.4.new/tests/testsuites/imptcp_conndrop.conf	2013-12-18 14:28:10.646004189 +0800
+@@ -1,7 +1,7 @@
+ # simple async writing test
+ # rgerhards, 2010-03-09
+-$MaxMessageSize 10k
+ $IncludeConfig diag-common.conf
++$MaxMessageSize 10k
+ 
+ $ModLoad ../plugins/imptcp/.libs/imptcp
+ $MainMsgQueueTimeoutShutdown 10000
+diff -Nru rsyslog-7.4.4/tests/testsuites/imptcp_large.conf rsyslog-7.4.4.new/tests/testsuites/imptcp_large.conf
+--- rsyslog-7.4.4/tests/testsuites/imptcp_large.conf	2013-08-31 00:30:41.000000000 +0800
++++ rsyslog-7.4.4.new/tests/testsuites/imptcp_large.conf	2013-12-18 14:28:10.646004189 +0800
+@@ -1,7 +1,7 @@
+ # simple async writing test
+ # rgerhards, 2010-03-09
+-$MaxMessageSize 10k
+ $IncludeConfig diag-common.conf
++$MaxMessageSize 10k
+ 
+ $ModLoad ../plugins/imptcp/.libs/imptcp
+ $MainMsgQueueTimeoutShutdown 10000
+diff -Nru rsyslog-7.4.4/tests/testsuites/imtcp_conndrop.conf rsyslog-7.4.4.new/tests/testsuites/imtcp_conndrop.conf
+--- rsyslog-7.4.4/tests/testsuites/imtcp_conndrop.conf	2013-07-19 20:59:03.000000000 +0800
++++ rsyslog-7.4.4.new/tests/testsuites/imtcp_conndrop.conf	2013-12-18 14:28:10.646004189 +0800
+@@ -1,7 +1,7 @@
+ # simple async writing test
+ # rgerhards, 2010-03-09
+-$MaxMessageSize 10k
+ $IncludeConfig diag-common.conf
++$MaxMessageSize 10k
+ 
+ $ModLoad ../plugins/imtcp/.libs/imtcp
+ $MainMsgQueueTimeoutShutdown 10000
+diff -Nru rsyslog-7.4.4/tests/testsuites/wr_large.conf rsyslog-7.4.4.new/tests/testsuites/wr_large.conf
+--- rsyslog-7.4.4/tests/testsuites/wr_large.conf	2012-04-04 14:29:55.000000000 +0800
++++ rsyslog-7.4.4.new/tests/testsuites/wr_large.conf	2013-12-18 14:28:10.647004190 +0800
+@@ -1,7 +1,7 @@
+ # simple async writing test
+ # rgerhards, 2010-03-09
+-$MaxMessageSize 10k
+ $IncludeConfig diag-common.conf
++$MaxMessageSize 10k
+ 
+ $ModLoad ../plugins/imtcp/.libs/imtcp
+ $MainMsgQueueTimeoutShutdown 10000
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-use-serial-tests-config-needed-by-ptest.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-use-serial-tests-config-needed-by-ptest.patch
new file mode 100644
index 0000000..3a16f26
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-use-serial-tests-config-needed-by-ptest.patch
@@ -0,0 +1,28 @@
+Subject: [PATCH] rsyslog: use serial-tests config needed by ptest
+
+ptest needs buildtest-TESTS and runtest-TESTS targets.
+serial-tests is required to generate those targets.
+
+Upstream-Status: Inappropriate [default automake behavior incompatible with ptest]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1b880f8..0e29742 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,7 @@
+ 
+ AC_PREREQ(2.61)
+ AC_INIT([rsyslog],[7.4.4],[rsyslog@lists.adiscon.com])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([serial-tests])
+ 
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
+-- 
+2.0.0
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest b/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
new file mode 100755
index 0000000..38a1d1b
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+#
+make -C tests -k runtest-TESTS
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index 6ee571e..50b6b35 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -22,12 +22,15 @@ SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://rsyslog.conf \
            file://rsyslog.logrotate \
            file://use-pkgconfig-to-check-libgcrypt.patch \
+           file://run-ptest \
+           file://rsyslog-fix-ptest-not-finish.patch \
+           file://rsyslog-use-serial-tests-config-needed-by-ptest.patch \
 "
 
 SRC_URI[md5sum] = "ebcc010a6205c28eb505c0fe862f32c6"
 SRC_URI[sha256sum] = "276d094d1e4c62c770ec8a72723667f119eee038912b79cf3337d439bc2f9087"
 
-inherit autotools pkgconfig systemd update-rc.d update-alternatives
+inherit autotools pkgconfig systemd update-rc.d update-alternatives ptest
 
 EXTRA_OECONF += "--enable-cached-man-pages"
 
@@ -37,6 +40,7 @@ PACKAGECONFIG ??= " \
     imdiag gnutls \
     ${@base_contains('DISTRO_FEATURES', 'snmp', 'snmp', '', d)} \
     ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'ptest', 'testbench ${VALGRIND}', '', d)} \
 "
 
 # default yes in configure
@@ -61,6 +65,50 @@ PACKAGECONFIG[postgresql] = "--enable-pgsql,--disable-pgsql,postgresql,"
 PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
 PACKAGECONFIG[mail] = "--enable-mail,--disable-mail,,"
 PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,,"
+PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
+
+TESTDIR = "tests"
+do_compile_ptest() {
+    sed -i 's/\(^buildtest-TESTS: \)/\1 $(check_PROGRAMS) /' ${TESTDIR}/Makefile
+    oe_runmake -C ${TESTDIR} buildtest-TESTS
+}
+
+do_install_ptest() {
+    # install the tests
+    cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}
+    cp -rf ${B}/${TESTDIR} ${D}${PTEST_PATH}
+
+    # do NOT need to rebuild Makefile itself
+    sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
+
+    # fix the srcdir
+    sed -i 's,^\(srcdir = \).*,\1${PTEST_PATH}/tests,' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
+
+    # valgrind is not compatible with arm and mips,
+    # so remove related test cases if there is no valgrind.
+    if [ x${VALGRIND} = x ]; then
+        sed -i '/udp-msgreduc-/d' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
+    fi
+
+    # install necessary links
+    install -d ${D}${PTEST_PATH}/tools
+    ln -sf ${sbindir}/rsyslogd ${D}${PTEST_PATH}/tools/rsyslogd
+
+    install -d ${D}${PTEST_PATH}/runtime
+    install -d ${D}${PTEST_PATH}/runtime/.libs
+    (
+        cd ${D}/${libdir}/rsyslog
+        allso="*.so"
+        for i in $allso; do
+            ln -sf ${libdir}/rsyslog/$i ${D}${PTEST_PATH}/runtime/.libs/$i
+        done
+    )
+
+    # fix the module load path with runtime/.libs
+    find ${D}${PTEST_PATH}/${TESTDIR} -name \*.conf -exec \
+        sed -i -e 's:../plugins/.*/.libs/:../runtime/.libs/:' \
+        '{}' \;
+}
 
 do_install_append() {
     install -d "${D}${sysconfdir}/init.d"
@@ -95,6 +143,15 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 
 RDEPENDS_${PN} += "logrotate"
 
+# for rsyslog-ptest
+VALGRIND = "valgrind"
+VALGRIND_mips = ""
+VALGRIND_mips64 = ""
+VALGRIND_arm = ""
+VALGRIND_aarch64 = ""
+RDEPENDS_${PN}-ptest += "make diffutils gzip"
+RRECOMMENDS_${PN}-ptest += "${TCLIBC}-dbg ${VALGRIND}"
+
 # no syslog-init for systemd
 python () {
     if 'sysvinit' in d.getVar("DISTRO_FEATURES", True).split():
-- 
2.0.0


