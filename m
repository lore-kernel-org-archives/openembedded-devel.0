Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF327CFC8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 01:16:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2M1GQol013620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 18:16:37 -0700
Received: from fidler.wrs.com (172.25.44.10) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 21 Mar 2019 18:16:16 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Mar 2019 21:16:13 -0400
Message-ID: <20190322011613.32505-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190322011613.32505-1-Randy.MacLeod@windriver.com>
References: <20190322011613.32505-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] rsyslog: Update from 8.37.0 to 8.1903.0
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
X-List-Received-Date: Fri, 22 Mar 2019 01:16:46 -0000
Content-Type: text/plain

Remove obsoleted fix-ptest-not-finish patch which is
no longer required after rsyslog commit:
   a5b9fbc02 testbench: remove no longer needed .conf files

Add libgcc and python dependencies for ptest:
  Testsuite summary for rsyslog 8.1903.0
  ========================================================================
  # TOTAL: 351
  # PASS:  309
  # SKIP:  38
  # XFAIL: 0
  # FAIL:  4
  # XPASS: 0
  # ERROR: 0
for qemux86[-64] when run with ptest-runner -t 800 since some tests
are stress tests and take quite a while to complete.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../rsyslog-fix-ptest-not-finish.patch        | 118 ------------------
 ...{rsyslog_8.37.0.bb => rsyslog_8.1903.0.bb} |  11 +-
 2 files changed, 7 insertions(+), 122 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-fix-ptest-not-finish.patch
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.37.0.bb => rsyslog_8.1903.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-fix-ptest-not-finish.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-fix-ptest-not-finish.patch
deleted file mode 100644
index a248f75e5..000000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-fix-ptest-not-finish.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 07ad2a1905089b9124623324a9969e4522317110 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Fri, 12 Sep 2014 03:41:11 -0400
-Subject: [PATCH] rsyslog: update configure to fix ptest
-
-$MaxMessageSize doesn't work if before $IncludeConfig diag-common.conf, then
-test cases fall into infinite loop with error message:
-
-8062.511110729:4902c480: error: message received is larger than max msg size, we split it
-8062.511152265:4902c480: discarding zero-sized message
-
-Update configure to fix it.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
----
- tests/testsuites/complex1.conf             | 2 +-
- tests/testsuites/gzipwr_large.conf         | 2 +-
- tests/testsuites/gzipwr_large_dynfile.conf | 2 +-
- tests/testsuites/imptcp_conndrop.conf      | 2 +-
- tests/testsuites/imptcp_large.conf         | 2 +-
- tests/testsuites/imtcp_conndrop.conf       | 2 +-
- tests/testsuites/wr_large.conf             | 2 +-
- 7 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/tests/testsuites/complex1.conf b/tests/testsuites/complex1.conf
-index 9b6a9f3..e00caa4 100644
---- a/tests/testsuites/complex1.conf
-+++ b/tests/testsuites/complex1.conf
-@@ -1,7 +1,7 @@
- # complex test case with multiple actions in gzip mode
- # rgerhards, 2009-05-22
--$MaxMessageSize 10k
- $IncludeConfig diag-common.conf
-+$MaxMessageSize 10k
- 
- $MainMsgQueueTimeoutEnqueue 5000
- 
-diff --git a/tests/testsuites/gzipwr_large.conf b/tests/testsuites/gzipwr_large.conf
-index 54ad3bb..e8247a9 100644
---- a/tests/testsuites/gzipwr_large.conf
-+++ b/tests/testsuites/gzipwr_large.conf
-@@ -1,7 +1,7 @@
- # simple async writing test
- # rgerhards, 2010-03-09
--$MaxMessageSize 10k
- $IncludeConfig diag-common.conf
-+$MaxMessageSize 10k
- 
- $ModLoad ../plugins/imtcp/.libs/imtcp
- $MainMsgQueueTimeoutShutdown 10000
-diff --git a/tests/testsuites/gzipwr_large_dynfile.conf b/tests/testsuites/gzipwr_large_dynfile.conf
-index 3a1b255..297cb70 100644
---- a/tests/testsuites/gzipwr_large_dynfile.conf
-+++ b/tests/testsuites/gzipwr_large_dynfile.conf
-@@ -1,7 +1,7 @@
- # simple async writing test
- # rgerhards, 2010-03-09
--$MaxMessageSize 10k
- $IncludeConfig diag-common.conf
-+$MaxMessageSize 10k
- 
- $ModLoad ../plugins/imtcp/.libs/imtcp
- $MainMsgQueueTimeoutShutdown 10000
-diff --git a/tests/testsuites/imptcp_conndrop.conf b/tests/testsuites/imptcp_conndrop.conf
-index 77a5d79..d9a14a8 100644
---- a/tests/testsuites/imptcp_conndrop.conf
-+++ b/tests/testsuites/imptcp_conndrop.conf
-@@ -1,7 +1,7 @@
- # simple async writing test
- # rgerhards, 2010-03-09
--$MaxMessageSize 10k
- $IncludeConfig diag-common.conf
-+$MaxMessageSize 10k
- 
- $ModLoad ../plugins/imptcp/.libs/imptcp
- $MainMsgQueueTimeoutShutdown 10000
-diff --git a/tests/testsuites/imptcp_large.conf b/tests/testsuites/imptcp_large.conf
-index 77a5d79..d9a14a8 100644
---- a/tests/testsuites/imptcp_large.conf
-+++ b/tests/testsuites/imptcp_large.conf
-@@ -1,7 +1,7 @@
- # simple async writing test
- # rgerhards, 2010-03-09
--$MaxMessageSize 10k
- $IncludeConfig diag-common.conf
-+$MaxMessageSize 10k
- 
- $ModLoad ../plugins/imptcp/.libs/imptcp
- $MainMsgQueueTimeoutShutdown 10000
-diff --git a/tests/testsuites/imtcp_conndrop.conf b/tests/testsuites/imtcp_conndrop.conf
-index de41bc4..7844dc7 100644
---- a/tests/testsuites/imtcp_conndrop.conf
-+++ b/tests/testsuites/imtcp_conndrop.conf
-@@ -1,7 +1,7 @@
- # simple async writing test
- # rgerhards, 2010-03-09
--$MaxMessageSize 10k
- $IncludeConfig diag-common.conf
-+$MaxMessageSize 10k
- 
- $ModLoad ../plugins/imtcp/.libs/imtcp
- $MainMsgQueueTimeoutShutdown 10000
-diff --git a/tests/testsuites/wr_large.conf b/tests/testsuites/wr_large.conf
-index b64f132..b0ae264 100644
---- a/tests/testsuites/wr_large.conf
-+++ b/tests/testsuites/wr_large.conf
-@@ -1,7 +1,7 @@
- # simple async writing test
- # rgerhards, 2010-03-09
--$MaxMessageSize 10k
- $IncludeConfig diag-common.conf
-+$MaxMessageSize 10k
- 
- $ModLoad ../plugins/imtcp/.libs/imtcp
- $MainMsgQueueTimeoutShutdown 10000
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1903.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.1903.0.bb
index 1fb439015..e06141e81 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1903.0.bb
@@ -23,15 +23,15 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://rsyslog.logrotate \
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
-           file://rsyslog-fix-ptest-not-finish.patch \
 "
 
 SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "e0942b4b88a13602a6b6352bf9f05091"
-SRC_URI[sha256sum] = "295c289b4c8abd8f8f3fe35a83249b739cedabe82721702b910255f9faf147e7"
+SRC_URI[md5sum] = "f0d454c79d4040e3f25fcd12f8f33fe2"
+SRC_URI[sha256sum] = "d0d23a493dcec64c7b6807a1bb8ee864ed0f3760c2ff3088008bb661d304056f"
+
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -162,5 +162,8 @@ VALGRIND_mips64n32 = ""
 VALGRIND_arm = ""
 VALGRIND_aarch64 = ""
 VALGRIND_riscv64 = ""
-RDEPENDS_${PN}-ptest += "make diffutils gzip bash gawk coreutils procps"
+RDEPENDS_${PN}-ptest += "\
+  make diffutils gzip bash gawk coreutils procps \
+  libgcc python-core python-io \
+  "
 RRECOMMENDS_${PN}-ptest += "${TCLIBC}-dbg ${VALGRIND}"
-- 
2.17.0


