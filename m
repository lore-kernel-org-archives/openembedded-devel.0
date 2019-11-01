Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DC5DC7F642
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 05:55:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,254,1569254400"; d="scan'208";a="77780854"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 13:54:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 21A894CE1508
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 13:46:45 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 1 Nov 2019 13:54:46 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 17:34:21 +0800
Message-ID: <1572600861-65655-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 21A894CE1508.A62AC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] rtorrent: upgrade 0.9.7 -> 0.9.8
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
X-List-Received-Date: Fri, 01 Nov 2019 05:55:04 -0000
Content-Type: text/plain

1) Upgrade rtorrent from 0.9.7 to 0.9.8.

2) Update don-t-run-code-while-configuring-package.patch for new version

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../don-t-run-code-while-configuring-package.patch | 48 +++++++++++++---------
 .../recipes-connectivity/rtorrent/rtorrent_git.bb  |  6 +--
 2 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent/don-t-run-code-while-configuring-package.patch b/meta-oe/recipes-connectivity/rtorrent/rtorrent/don-t-run-code-while-configuring-package.patch
index 79d4f29..7d09f43 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent/don-t-run-code-while-configuring-package.patch
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent/don-t-run-code-while-configuring-package.patch
@@ -1,19 +1,26 @@
-Using AC_RUN_IFELSE prevent people from configuring package for
-cross-compiling. Don't run code while configuring package.
+Using AC_RUN_IFELSE prevent people from configuring package
+ for cross-compiling. Don't run code while configuring package.
 
 Upstream-Status: Pending
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
-Index: libtorrent-0.13.3/scripts/checks.m4
-===================================================================
---- libtorrent-0.13.3.orig/scripts/checks.m4	2012-05-14 14:17:04.000000000 +0300
-+++ libtorrent-0.13.3/scripts/checks.m4	2013-02-10 15:28:37.414445524 +0200
-@@ -95,40 +95,6 @@
+Update for 0.9.8.
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ scripts/checks.m4 | 34 ----------------------------------
+ scripts/common.m4 | 28 ----------------------------
+ 2 files changed, 62 deletions(-)
 
+diff --git a/scripts/checks.m4 b/scripts/checks.m4
+index 83be846..1af80f5 100644
+--- a/scripts/checks.m4
++++ b/scripts/checks.m4
+@@ -95,40 +95,6 @@ AC_DEFUN([TORRENT_CHECK_KQUEUE], [
+ 
  AC_DEFUN([TORRENT_CHECK_KQUEUE_SOCKET_ONLY], [
    AC_MSG_CHECKING(whether kqueue supports pipes and ptys)
 -
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
+-  AC_LINK_IFELSE([AC_LANG_SOURCE([
 -      #include <fcntl.h>
 -      #include <stdlib.h>
 -      #include <unistd.h>
@@ -47,18 +54,18 @@ Index: libtorrent-0.13.3/scripts/checks.m4
 -      AC_MSG_RESULT(no)
 -    ])
  ])
-
+ 
  AC_DEFUN([TORRENT_WITH_KQUEUE], [
-Index: libtorrent-0.13.3/scripts/common.m4
-===================================================================
---- libtorrent-0.13.3.orig/scripts/common.m4	2012-05-14 14:17:04.000000000 +0300
-+++ libtorrent-0.13.3/scripts/common.m4	2013-02-10 15:27:55.874446741 +0200
-@@ -222,38 +222,10 @@
-
+diff --git a/scripts/common.m4 b/scripts/common.m4
+index aaf005e..42fb016 100644
+--- a/scripts/common.m4
++++ b/scripts/common.m4
+@@ -152,38 +152,10 @@ dnl   Need to fix this so that it uses the stuff defined by the system.
+ 
  AC_DEFUN([TORRENT_CHECK_EXECINFO], [
    AC_MSG_CHECKING(for execinfo.h)
 -
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
+-  AC_COMPILE_IFELSE([AC_LANG_SOURCE([
 -      #include <execinfo.h>
 -      int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, 0); return 0;}
 -      ])],
@@ -69,11 +76,11 @@ Index: libtorrent-0.13.3/scripts/common.m4
 -      AC_MSG_RESULT(no)
 -  ])
  ])
-
+ 
  AC_DEFUN([TORRENT_CHECK_ALIGNED], [
    AC_MSG_CHECKING(the byte alignment)
 -
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
+-  AC_LINK_IFELSE([AC_LANG_SOURCE([
 -      #include <inttypes.h>
 -      int main() {
 -        char buf@<:@8@:>@ = { 0, 0, 0, 0, 1, 0, 0, 0 };
@@ -90,5 +97,8 @@ Index: libtorrent-0.13.3/scripts/common.m4
 -      AC_MSG_RESULT(required)
 -  ])
  ])
-
+ 
+ 
+-- 
+2.7.4
 
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
index 9bb81c4..6f0e8c1 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
@@ -8,10 +8,10 @@ DEPENDS = "libsigc++-2.0 curl cppunit libtorrent ncurses"
 SRC_URI = "git://github.com/rakshasa/rtorrent \
     file://don-t-run-code-while-configuring-package.patch \
 "
-# v0.9.7
-SRCREV = "327164f9d86aafcd2500a317d485374df32ea622"
+# v0.9.8
+SRCREV = "6154d1698756e0c4842b1c13a0e56db93f1aa947"
 
-PV = "0.9.7+git${SRCPV}"
+PV = "0.9.8+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




