Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4CC744F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 07:01:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3J7120G022942
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 00:01:03 -0700
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 19 Apr 2018 00:01:01 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Apr 2018 15:00:59 +0800
Message-ID: <1524121259-17393-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [meta-oe][PATCH] rsyslog: refresh patches
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
X-List-Received-Date: Thu, 19 Apr 2018 07:01:02 -0000
Content-Type: text/plain

Refresh patches with devtool command to fix do_patch warning.
Drop 0001-Undefine-GLOB_BRACE.patch since it had been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../rsyslog/rsyslog/0001-Include-sys-time-h.patch  |  6 +-
 .../rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch | 35 -----------
 .../rsyslog/rsyslog-fix-ptest-not-finish.patch     | 68 ++++++++++++++--------
 .../rsyslog/use-pkgconfig-to-check-libgcrypt.patch | 12 ++--
 meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb |  1 -
 5 files changed, 52 insertions(+), 70 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
index 23c0f25..ca88dd3 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
@@ -1,4 +1,4 @@
-From 3c3c21f4735eb215206273bc714c57c969926d3d Mon Sep 17 00:00:00 2001
+From 9739095de6ae5f844354756ae968f5f8864eb3e3 Mon Sep 17 00:00:00 2001
 From: Ming Liu <peter.x.liu@external.atlascopco.com>
 Date: Sun, 26 Feb 2017 14:10:21 +0100
 Subject: [PATCH] Include sys/time.h
@@ -8,6 +8,7 @@ struct timeval is defined in sys/time.h with a musl libc.
 Upstream-Status: Inappropriate [musl libc specific]
 
 Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
+
 ---
  tests/msleep.c | 4 ----
  1 file changed, 4 deletions(-)
@@ -28,6 +29,3 @@ index 26a8206..ca818be 100644
  
  int main(int argc, char *argv[])
  {
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch
deleted file mode 100644
index 7903bb1..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6746e3a9615d1566bf228e9012d0841b15178810 Mon Sep 17 00:00:00 2001
-From: Ming Liu <liu.ming50@gmail.com>
-Date: Sun, 26 Feb 2017 13:50:33 +0100
-Subject: [PATCH] Undefine GLOB_BRACE
-
-GLOB_BRACE is not defined in posix and thus not implemented in musl libc.
-
-Fixed by defining it to 0 if it is undefined.
-
-Upstream-Status: Inappropriate [musl libc specific]
-
-Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
----
- plugins/imfile/imfile.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/plugins/imfile/imfile.c b/plugins/imfile/imfile.c
-index d20471f..f9aff81 100644
---- a/plugins/imfile/imfile.c
-+++ b/plugins/imfile/imfile.c
-@@ -85,6 +85,11 @@ static int bLegacyCnfModGlobalsPermitted;/* are legacy module-global config para
- 
- #define ADD_METADATA_UNSPECIFIED -1
- 
-+/* fixes build with musl libc */
-+#ifndef GLOB_BRACE
-+#define GLOB_BRACE 0
-+#endif
-+
- /* this structure is used in pure polling mode as well one of the support
-  * structures for inotify.
-  */
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-fix-ptest-not-finish.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-fix-ptest-not-finish.patch
index bdcb6e2..a248f75 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-fix-ptest-not-finish.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-fix-ptest-not-finish.patch
@@ -1,3 +1,8 @@
+From 07ad2a1905089b9124623324a9969e4522317110 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Fri, 12 Sep 2014 03:41:11 -0400
+Subject: [PATCH] rsyslog: update configure to fix ptest
+
 $MaxMessageSize doesn't work if before $IncludeConfig diag-common.conf, then
 test cases fall into infinite loop with error message:
 
@@ -6,13 +11,24 @@ test cases fall into infinite loop with error message:
 
 Update configure to fix it.
 
-Upstream-Status: pending
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
-Kai Kang <kai.kang@windriver.com>
 ---
-diff -Nru rsyslog-7.4.4/tests/testsuites/complex1.conf rsyslog-7.4.4.new/tests/testsuites/complex1.conf
---- rsyslog-7.4.4/tests/testsuites/complex1.conf	2013-08-31 00:30:41.000000000 +0800
-+++ rsyslog-7.4.4.new/tests/testsuites/complex1.conf	2013-12-18 14:28:10.644004184 +0800
+ tests/testsuites/complex1.conf             | 2 +-
+ tests/testsuites/gzipwr_large.conf         | 2 +-
+ tests/testsuites/gzipwr_large_dynfile.conf | 2 +-
+ tests/testsuites/imptcp_conndrop.conf      | 2 +-
+ tests/testsuites/imptcp_large.conf         | 2 +-
+ tests/testsuites/imtcp_conndrop.conf       | 2 +-
+ tests/testsuites/wr_large.conf             | 2 +-
+ 7 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/tests/testsuites/complex1.conf b/tests/testsuites/complex1.conf
+index 9b6a9f3..e00caa4 100644
+--- a/tests/testsuites/complex1.conf
++++ b/tests/testsuites/complex1.conf
 @@ -1,7 +1,7 @@
  # complex test case with multiple actions in gzip mode
  # rgerhards, 2009-05-22
@@ -22,9 +38,10 @@ diff -Nru rsyslog-7.4.4/tests/testsuites/complex1.conf rsyslog-7.4.4.new/tests/t
  
  $MainMsgQueueTimeoutEnqueue 5000
  
-diff -Nru rsyslog-7.4.4/tests/testsuites/gzipwr_large.conf rsyslog-7.4.4.new/tests/testsuites/gzipwr_large.conf
---- rsyslog-7.4.4/tests/testsuites/gzipwr_large.conf	2012-04-04 14:29:55.000000000 +0800
-+++ rsyslog-7.4.4.new/tests/testsuites/gzipwr_large.conf	2013-12-18 14:28:10.645004186 +0800
+diff --git a/tests/testsuites/gzipwr_large.conf b/tests/testsuites/gzipwr_large.conf
+index 54ad3bb..e8247a9 100644
+--- a/tests/testsuites/gzipwr_large.conf
++++ b/tests/testsuites/gzipwr_large.conf
 @@ -1,7 +1,7 @@
  # simple async writing test
  # rgerhards, 2010-03-09
@@ -34,9 +51,10 @@ diff -Nru rsyslog-7.4.4/tests/testsuites/gzipwr_large.conf rsyslog-7.4.4.new/tes
  
  $ModLoad ../plugins/imtcp/.libs/imtcp
  $MainMsgQueueTimeoutShutdown 10000
-diff -Nru rsyslog-7.4.4/tests/testsuites/gzipwr_large_dynfile.conf rsyslog-7.4.4.new/tests/testsuites/gzipwr_large_dynfile.conf
---- rsyslog-7.4.4/tests/testsuites/gzipwr_large_dynfile.conf	2012-04-04 14:29:55.000000000 +0800
-+++ rsyslog-7.4.4.new/tests/testsuites/gzipwr_large_dynfile.conf	2013-12-18 14:28:10.645004186 +0800
+diff --git a/tests/testsuites/gzipwr_large_dynfile.conf b/tests/testsuites/gzipwr_large_dynfile.conf
+index 3a1b255..297cb70 100644
+--- a/tests/testsuites/gzipwr_large_dynfile.conf
++++ b/tests/testsuites/gzipwr_large_dynfile.conf
 @@ -1,7 +1,7 @@
  # simple async writing test
  # rgerhards, 2010-03-09
@@ -46,9 +64,10 @@ diff -Nru rsyslog-7.4.4/tests/testsuites/gzipwr_large_dynfile.conf rsyslog-7.4.4
  
  $ModLoad ../plugins/imtcp/.libs/imtcp
  $MainMsgQueueTimeoutShutdown 10000
-diff -Nru rsyslog-7.4.4/tests/testsuites/imptcp_conndrop.conf rsyslog-7.4.4.new/tests/testsuites/imptcp_conndrop.conf
---- rsyslog-7.4.4/tests/testsuites/imptcp_conndrop.conf	2013-08-31 00:30:41.000000000 +0800
-+++ rsyslog-7.4.4.new/tests/testsuites/imptcp_conndrop.conf	2013-12-18 14:28:10.646004189 +0800
+diff --git a/tests/testsuites/imptcp_conndrop.conf b/tests/testsuites/imptcp_conndrop.conf
+index 77a5d79..d9a14a8 100644
+--- a/tests/testsuites/imptcp_conndrop.conf
++++ b/tests/testsuites/imptcp_conndrop.conf
 @@ -1,7 +1,7 @@
  # simple async writing test
  # rgerhards, 2010-03-09
@@ -58,9 +77,10 @@ diff -Nru rsyslog-7.4.4/tests/testsuites/imptcp_conndrop.conf rsyslog-7.4.4.new/
  
  $ModLoad ../plugins/imptcp/.libs/imptcp
  $MainMsgQueueTimeoutShutdown 10000
-diff -Nru rsyslog-7.4.4/tests/testsuites/imptcp_large.conf rsyslog-7.4.4.new/tests/testsuites/imptcp_large.conf
---- rsyslog-7.4.4/tests/testsuites/imptcp_large.conf	2013-08-31 00:30:41.000000000 +0800
-+++ rsyslog-7.4.4.new/tests/testsuites/imptcp_large.conf	2013-12-18 14:28:10.646004189 +0800
+diff --git a/tests/testsuites/imptcp_large.conf b/tests/testsuites/imptcp_large.conf
+index 77a5d79..d9a14a8 100644
+--- a/tests/testsuites/imptcp_large.conf
++++ b/tests/testsuites/imptcp_large.conf
 @@ -1,7 +1,7 @@
  # simple async writing test
  # rgerhards, 2010-03-09
@@ -70,9 +90,10 @@ diff -Nru rsyslog-7.4.4/tests/testsuites/imptcp_large.conf rsyslog-7.4.4.new/tes
  
  $ModLoad ../plugins/imptcp/.libs/imptcp
  $MainMsgQueueTimeoutShutdown 10000
-diff -Nru rsyslog-7.4.4/tests/testsuites/imtcp_conndrop.conf rsyslog-7.4.4.new/tests/testsuites/imtcp_conndrop.conf
---- rsyslog-7.4.4/tests/testsuites/imtcp_conndrop.conf	2013-07-19 20:59:03.000000000 +0800
-+++ rsyslog-7.4.4.new/tests/testsuites/imtcp_conndrop.conf	2013-12-18 14:28:10.646004189 +0800
+diff --git a/tests/testsuites/imtcp_conndrop.conf b/tests/testsuites/imtcp_conndrop.conf
+index de41bc4..7844dc7 100644
+--- a/tests/testsuites/imtcp_conndrop.conf
++++ b/tests/testsuites/imtcp_conndrop.conf
 @@ -1,7 +1,7 @@
  # simple async writing test
  # rgerhards, 2010-03-09
@@ -82,9 +103,10 @@ diff -Nru rsyslog-7.4.4/tests/testsuites/imtcp_conndrop.conf rsyslog-7.4.4.new/t
  
  $ModLoad ../plugins/imtcp/.libs/imtcp
  $MainMsgQueueTimeoutShutdown 10000
-diff -Nru rsyslog-7.4.4/tests/testsuites/wr_large.conf rsyslog-7.4.4.new/tests/testsuites/wr_large.conf
---- rsyslog-7.4.4/tests/testsuites/wr_large.conf	2012-04-04 14:29:55.000000000 +0800
-+++ rsyslog-7.4.4.new/tests/testsuites/wr_large.conf	2013-12-18 14:28:10.647004190 +0800
+diff --git a/tests/testsuites/wr_large.conf b/tests/testsuites/wr_large.conf
+index b64f132..b0ae264 100644
+--- a/tests/testsuites/wr_large.conf
++++ b/tests/testsuites/wr_large.conf
 @@ -1,7 +1,7 @@
  # simple async writing test
  # rgerhards, 2010-03-09
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
index 46eddd6..162d239 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
@@ -1,5 +1,5 @@
-From 5c3ba79177f7d1763db33c4358af2af60ff214b7 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com> 
+From d0852006bf3d305e8984b85b41997d43d4476937 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
 Date: Wed, 18 Jun 2014 13:46:52 +0800
 Subject: [PATCH] use pkgconfig to check libgcrypt
 
@@ -10,15 +10,16 @@ libgcrypt does no longer provide libgcrypt-config, and provide
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
 ---
  configure.ac | 15 +--------------
  1 file changed, 1 insertion(+), 14 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0f31869..d35db42 100644
+index 62178c3..b56c9c7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -777,20 +777,7 @@ AC_ARG_ENABLE(libgcrypt,
+@@ -889,20 +889,7 @@ AC_ARG_ENABLE(libgcrypt,
          [enable_libgcrypt=yes]
  )
  if test "x$enable_libgcrypt" = "xyes"; then
@@ -40,6 +41,3 @@ index 0f31869..d35db42 100644
  fi
  AM_CONDITIONAL(ENABLE_LIBGCRYPT, test x$enable_libgcrypt = xyes)
  AC_SUBST(LIBGCRYPT_CFLAGS)
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb
index 7056e1c..476540d 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb
@@ -27,7 +27,6 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
 "
 
 SRC_URI_append_libc-musl = " \
-    file://0001-Undefine-GLOB_BRACE.patch \
     file://0001-Include-sys-time-h.patch \
 "
 
-- 
2.7.4


