Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BCA665D56
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 09:42:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7J9gwwg020282
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 02:42:59 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 19 Aug 2014 02:42:58 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Aug 2014 17:38:32 +0800
Message-ID: <1408441112-10650-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] memcached: add knob to detect whether hugetlbfs are checked
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
X-List-Received-Date: Tue, 19 Aug 2014 09:43:01 -0000
Content-Type: text/plain

Add knob to detect whether hugetlbfs are checked or not.
This patch fixed the error:
    ld: cannot find -lhugetlbfs

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../memcached/memcached-add-hugetlbfs-check.patch  | 32 ++++++++++++++++++++++
 .../recipes-support/memcached/memcached_1.4.17.bb  | 13 +++++++--
 2 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch

diff --git a/meta-networking/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch b/meta-networking/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch
new file mode 100644
index 0000000..544b840
--- /dev/null
+++ b/meta-networking/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch
@@ -0,0 +1,32 @@
+memcached: add knob to detect whether hugetlbfs are checked
+
+Add knob to detect whether hugetlbfs are checked or not.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ configure.ac | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7f22f21..21691b9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -314,7 +314,12 @@ fi
+ dnl ----------------------------------------------------------------------------
+ 
+ AC_SEARCH_LIBS(umem_cache_create, umem)
+-AC_SEARCH_LIBS(gethugepagesizes, hugetlbfs)
++AC_ARG_ENABLE(hugetlbfs,
++  [AS_HELP_STRING([--enable-hugetlbfs],[Enable hugetlbfs])])
++
++if test "x$enable_hugetlbfs" = "xyes"; then
++  AC_SEARCH_LIBS(gethugepagesizes, hugetlbfs)
++fi
+ 
+ AC_HEADER_STDBOOL
+ AH_BOTTOM([#if HAVE_STDBOOL_H
+-- 
+1.8.3.4
+
diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
index 5d37df0..e61bc74 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
@@ -18,7 +18,11 @@ DEPENDS += "libevent"
 RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader perl-module-tie-hash"
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
-           file://configure.patch"
+           file://configure.patch \
+           file://memcached-add-hugetlbfs-check.patch"
+
+# set the same COMPATIBLE_HOST as libhugetlbfs
+COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64|arm).*-linux'
 
 SRC_URI[md5sum] = "46402dfbd7faadf6182283dbbd18b1a6"
 SRC_URI[sha256sum] = "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf9926a89999d8cdc0458"
@@ -26,11 +30,14 @@ SRC_URI[sha256sum] = "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf9926a89999d8c
 python __anonymous () {
     endianness = d.getVar('SITEINFO_ENDIANNESS', True)
     if endianness == 'le':
-        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=little")
+        d.appendVar('EXTRA_OECONF', " ac_cv_c_endian=little")
     else:
-        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=big")
+        d.appendVar('EXTRA_OECONF', " ac_cv_c_endian=big")
 }
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[hugetlbfs] = "--enable-hugetlbfs, --disable-hugetlbfs, libhugetlbfs"
+
 inherit update-rc.d
 
 INITSCRIPT_NAME = "memcached"
-- 
1.9.1


