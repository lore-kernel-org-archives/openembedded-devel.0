Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F89060119
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 02:57:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u892vbsO027161
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 8 Sep 2016 19:57:37 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 8 Sep 2016 19:57:36 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Fri, 9 Sep 2016 10:55:03 +0800
Message-ID: <1473389703-17992-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: jslater@windriver.com
Subject: [meta-networking][PATCH v2] tcpreplay: upgrade to 4.1.1
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
X-List-Received-Date: Fri, 09 Sep 2016 02:57:39 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Upgrade tcpreplay from 3.4.4 to 4.1.1
* Update the LICENSE file checksum as the LICENSE
  updated to implement GPLv3 license
* Remove the backport and unapplicable patches
  - tcpreplay-3.4.4-cross-compile.patch
  - tcpreplay-3.4.4-no-bfp-support.patch
  - tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
  - tcpreplay-3.4.4-improve-search-for-libpcap.patch are

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../files/tcpreplay-3.4.4-cross-compile.patch      | 92 ----------------------
 ...ay-3.4.4-fix-unable-to-link-libpcap-issue.patch | 17 ----
 ...cpreplay-3.4.4-improve-search-for-libpcap.patch | 33 --------
 .../files/tcpreplay-3.4.4-no-bfp-support.patch     | 15 ----
 .../{tcpreplay_3.4.4.bb => tcpreplay_4.1.1.bb}     | 10 +--
 5 files changed, 3 insertions(+), 164 deletions(-)
 delete mode 100755 meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch
 delete mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
 delete mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-improve-search-for-libpcap.patch
 delete mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_3.4.4.bb => tcpreplay_4.1.1.bb} (43%)

diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch
deleted file mode 100755
index a856b18..0000000
--- a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-Uptream-Status: Pending
-
-Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -402,7 +402,6 @@
- 
- dnl 0.9.6 (which is still thinks it is 0.9.5 due to a bug) introduces an important
- dnl fix for OSX.  See: http://tcpreplay.synfin.net/trac/ticket/167
--libpcap_version_096=no
- AC_RUN_IFELSE(AC_LANG_PROGRAM([[
- #include <string.h>
- #include <stdlib.h>
-@@ -419,11 +418,12 @@
-             exit(0);
- 
-     exit(1);
--]]), [
--    libpcap_version_096=yes
--])
-+]]),
-+ [libpcap_version_096=yes],
-+ [libpcap_version_096=no],
-+ [libpcap_version_096=yes]
-+)
- 
--libpcap_ver8=no
- AC_RUN_IFELSE(AC_LANG_PROGRAM([[
- #include <string.h>
- #include <stdlib.h>
-@@ -444,13 +444,12 @@
-         exit(0);
- 
-     exit(1);
--]]), [
--    libpcap_ver8=yes
--], [
--    libpcap_ver8=no
--])
-+]]),
-+ [libpcap_ver8=yes],
-+ [libpcap_ver8=no],
-+ [libpcap_ver8=yes]
-+)
- 
--libpcap_ver7=no
- AC_RUN_IFELSE(AC_LANG_PROGRAM([[
- #include <string.h>
- #include <stdlib.h>
-@@ -469,11 +468,11 @@
-             exit(0);
- 
-     exit(1);
--]]), [
--    libpcap_ver7=yes
--], [
--    libpcap_ver7=no
--])
-+]]),
-+ [libpcap_ver7=yes],
-+ [libpcap_ver7=no],
-+ [libpcap_ver7=yes]
-+)
- 
- if test x$libpcap_ver8 = xyes ; then
-     AC_MSG_RESULT(>= 0.8.0)
-@@ -761,8 +760,8 @@
- 
- have_bpf=no
- dnl Check for BSD's BPF
--AC_MSG_CHECKING(for BPF device sending support)
--AC_TRY_RUN([
-+AC_CACHE_CHECK([for BPF device sending support], ac_cv_have_bpf,
-+[AC_TRY_RUN([
- #include <stdio.h>
- #include <stdlib.h>
- #include <sys/types.h>
-@@ -796,8 +795,11 @@
-             [Do we have BPF device support?])
-     AC_MSG_RESULT(yes)
-     have_bpf=yes
--],[
--    AC_MSG_RESULT(no)
-+],
-+[AC_MSG_RESULT(no)],
-+[AC_MSG_ERROR([cross-compiling,
-+  presetting ac_cv_have_bpf=(yes|no) will help])]
-+)
- ])
- 
- 
diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
deleted file mode 100644
index 5f36c68..0000000
--- a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Uptream-Status: Pending
-
-Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
-
-Index: tcpreplay-3.4.4/configure.ac
-===================================================================
---- tcpreplay-3.4.4.orig/configure.ac
-+++ tcpreplay-3.4.4/configure.ac
-@@ -389,7 +389,7 @@ CFLAGS="$CFLAGS -I$LPCAPINCDIR"
- AC_SEARCH_LIBS([pcap_close], [pcap],
-     LPCAPLIB="$LIBS",
-     AC_ERROR([Unable to link libpcap in ${foundpcap}]),
--    -lnl)
-+    -lnl-3)
- 
- AC_SUBST(LPCAPINC)
- AC_SUBST(LPCAPLIB)
diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-improve-search-for-libpcap.patch b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-improve-search-for-libpcap.patch
deleted file mode 100644
index 50f024c..0000000
--- a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-improve-search-for-libpcap.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-tcpreplay: improve search for libpcap
-
-Add a test which will find libpcap if $testdir/.. is a sysroot.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -350,14 +350,20 @@ for testdir in $trypcapdir /usr/local /o
-     if test -f "${testdir}/include/pcap.h" -a $foundpcap = no ; then
-         LPCAPINC="${testdir}/include/pcap.h"
-         LPCAPINCDIR="${testdir}/include"
-+        # If testdir/.. is a sysroot, then sDir should point to where the libraries are.
-+        sDir=$(readlink -m ${testdir}/../${libdir})
-         if test $dynamic_link = yes; then
--            if test -f "${testdir}/lib64/libpcap${shrext_cmds}" ; then
-+            if test -f "${sDir}/libpcap${shrext_cmds}" ; then
-+                LPCAPLIB="-L${sDir} -lpcap"
-+            elif test -f "${testdir}/lib64/libpcap${shrext_cmds}" ; then
-                 LPCAPLIB="-L${testdir}/lib64 -lpcap"
-             elif test -f "${testdir}/lib/libpcap${shrext_cmds}" ; then
-                 LPCAPLIB="-L${testdir}/lib -lpcap"
-             else
-                 AC_ERROR([Unable to find libpcap in ${testdir}])
-             fi
-+        elif test -f "${sDir}/libpcap.${libext}" ; then
-+            LPCAPLIB="${sDir}/libpcap.${libext}"
-         elif test -f "${testdir}/lib64/libpcap.${libext}" ; then
-             LPCAPLIB="${testdir}/lib64/libpcap.${libext}"
-         elif test -f "${testdir}/lib/libpcap.${libext}" ; then
diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch
deleted file mode 100644
index 3c11c92..0000000
--- a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Uptream-Status: Pending
-
-Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -758,6 +758,8 @@
-     AC_MSG_RESULT(no)
- ])
- 
-+ac_cv_have_bpf=no
-+
- have_bpf=no
- dnl Check for BSD's BPF
- AC_CACHE_CHECK([for BPF device sending support], ac_cv_have_bpf,
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb
similarity index 43%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb
index ccbab9f..389d61b 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb
@@ -4,16 +4,12 @@ HOMEPAGE = "http://tcpreplay.synfin.net/"
 SECTION = "net"
 
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=c33cccf72cc1603e8a72a84811ae3ac8"
+LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=890b830b22fd632e9ffd996df20338f8"
 
 SRC_URI = "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcpreplay-${PV}.tar.gz \
-           file://tcpreplay-3.4.4-cross-compile.patch \
-           file://tcpreplay-3.4.4-no-bfp-support.patch \
-           file://tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch \
-           file://tcpreplay-3.4.4-improve-search-for-libpcap.patch \
            "
-SRC_URI[md5sum] = "22725feb9b2590809f9350308ec65180"
-SRC_URI[sha256sum] = "7a809c58ddec86407fd6e5597ac883d7874a19bea81d716bb2b1c6e3b0e7b58f"
+SRC_URI[md5sum] = "80394c33fe697b53b69eac9bb0968ae9"
+SRC_URI[sha256sum] = "61b916ef91049cad2a9ddc8de6f5e3e3cc5d9998dbb644dc91cf3a798497ffe4"
 
 DEPENDS = "libpcap"
 
-- 
2.8.1


