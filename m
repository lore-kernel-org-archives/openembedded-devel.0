Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A8BFD65E2B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jul 2014 05:20:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s685KhCu013872
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Jul 2014 22:20:43 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 7 Jul 2014 22:20:43 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Jul 2014 13:20:47 +0800
Message-ID: <1404796847-22332-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] Uprev tcpdump to 4.5.1
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
X-List-Received-Date: Tue, 08 Jul 2014 05:20:50 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com> 

1. update the patch tcpdump_configure_no_-O2.patch
2. do not check libdlpi dependence on cross-compile, or else it will
cause do_qa_configure to fail.
3. do not check libpcap dependence, since the libpcap has been added
into DEPENDS, or else it will cause do_qa_configure to fail
4. make the check of getaddrinfo work on cross-compile

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-minimal-IEEE802.15.4-allowed.patch        |    0
 .../{tcpdump-4.3.0 => files}/configure.patch       |    0
 .../{tcpdump-4.3.0 => files}/ipv6-cross.patch      |    0
 .../tcpdump/files/tcpdump-configure-dlpi.patch     |   31 +++++++++++++++
 .../tcpdump/files/tcpdump-cross-getaddrinfo.patch  |   23 +++++++++++
 .../tcpdump/files/tcpdump_configure_no_-O2.patch   |   27 +++++++++++++
 .../files/unnecessary-to-check-libpcap.patch       |   33 +++++++++++++++
 .../tcpdump-4.3.0/tcpdump_configure_no_-O2.patch   |   42 --------------------
 .../tcpdump/{tcpdump_4.3.0.bb => tcpdump_4.5.1.bb} |    8 +++-
 9 files changed, 120 insertions(+), 44 deletions(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump-4.3.0 => files}/0001-minimal-IEEE802.15.4-allowed.patch (100%)
 rename meta-networking/recipes-support/tcpdump/{tcpdump-4.3.0 => files}/configure.patch (100%)
 rename meta-networking/recipes-support/tcpdump/{tcpdump-4.3.0 => files}/ipv6-cross.patch (100%)
 create mode 100644 meta-networking/recipes-support/tcpdump/files/tcpdump-configure-dlpi.patch
 create mode 100644 meta-networking/recipes-support/tcpdump/files/tcpdump-cross-getaddrinfo.patch
 create mode 100644 meta-networking/recipes-support/tcpdump/files/tcpdump_configure_no_-O2.patch
 create mode 100644 meta-networking/recipes-support/tcpdump/files/unnecessary-to-check-libpcap.patch
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.3.0.bb => tcpdump_4.5.1.bb} (80%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch b/meta-networking/recipes-support/tcpdump/files/0001-minimal-IEEE802.15.4-allowed.patch
similarity index 100%
rename from meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
rename to meta-networking/recipes-support/tcpdump/files/0001-minimal-IEEE802.15.4-allowed.patch
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch b/meta-networking/recipes-support/tcpdump/files/configure.patch
similarity index 100%
rename from meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
rename to meta-networking/recipes-support/tcpdump/files/configure.patch
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch b/meta-networking/recipes-support/tcpdump/files/ipv6-cross.patch
similarity index 100%
rename from meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
rename to meta-networking/recipes-support/tcpdump/files/ipv6-cross.patch
diff --git a/meta-networking/recipes-support/tcpdump/files/tcpdump-configure-dlpi.patch b/meta-networking/recipes-support/tcpdump/files/tcpdump-configure-dlpi.patch
new file mode 100644
index 0000000..50e2d54
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/files/tcpdump-configure-dlpi.patch
@@ -0,0 +1,31 @@
+[PATCH] tcpdump: cross-compiling not check dlpi.
+
+For cross-compiling on Linux platforms, we do not need to check libdlpi 
+since it is only placed on Solaris.
+Also, checking libdlpi in native /lib would cause do_qa_configure fail.
+
+Upstream-Status: Pending.
+
+Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+---
+ configure.in |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 7f9591c..ca277c0 100644
+--- a/configure.in
++++ b/configure.in
+@@ -716,7 +716,9 @@ don't.])
+ fi
+ 
+ # libdlpi is needed for Solaris 11 and later.
+-AC_CHECK_LIB(dlpi, dlpi_walk, LIBS="$LIBS -ldlpi" LDFLAGS="-L/lib $LDFLAGS", ,-L/lib)
++if test "$cross_compiling" != yes; then
++	AC_CHECK_LIB(dlpi, dlpi_walk, LIBS="$LIBS -ldlpi" LDFLAGS="-L/lib $LDFLAGS", ,-L/lib)
++fi
+ 
+ dnl portability macros for getaddrinfo/getnameinfo
+ dnl
+-- 
+1.7.5.4
+
diff --git a/meta-networking/recipes-support/tcpdump/files/tcpdump-cross-getaddrinfo.patch b/meta-networking/recipes-support/tcpdump/files/tcpdump-cross-getaddrinfo.patch
new file mode 100644
index 0000000..b414b72
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/files/tcpdump-cross-getaddrinfo.patch
@@ -0,0 +1,23 @@
+Fix getaddinfo check when cross compiling
+
+Upstream-Status: Pending.
+
+AC_TRY_RUN defaults to td_cv_buggygetaddrinfo=yes when
+cross-compiling. So this change indicates that we
+are cross-compiling.
+
+Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
+
+diff --git a/configure.in b/configure.in
+index ca277c0..283035e 100644
+--- a/configure.in
++++ b/configure.in
+@@ -434,7 +434,7 @@ main()
+ ],
+ 	td_cv_buggygetaddrinfo=no,
+ 	td_cv_buggygetaddrinfo=yes,
+-	td_cv_buggygetaddrinfo=yes)])
++	td_cv_buggygetaddrinfo=cross)])
+ 	if test "$td_cv_buggygetaddrinfo" = no; then
+ 		AC_MSG_RESULT(good)
+ 	else
diff --git a/meta-networking/recipes-support/tcpdump/files/tcpdump_configure_no_-O2.patch b/meta-networking/recipes-support/tcpdump/files/tcpdump_configure_no_-O2.patch
new file mode 100644
index 0000000..b2296bc
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/files/tcpdump_configure_no_-O2.patch
@@ -0,0 +1,27 @@
+---
+ configure |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 468a517..a890728 100755
+--- a/configure
++++ b/configure
+@@ -3036,13 +3036,13 @@ if test "$ac_test_CFLAGS" = set; then
+   CFLAGS=$ac_save_CFLAGS
+ elif test $ac_cv_prog_cc_g = yes; then
+   if test "$GCC" = yes; then
+-    CFLAGS="-g -O2"
++    CFLAGS="-g"
+   else
+     CFLAGS="-g"
+   fi
+ else
+   if test "$GCC" = yes; then
+-    CFLAGS="-O2"
++    CFLAGS=
+   else
+     CFLAGS=
+   fi
+-- 
+1.7.9.5
+
diff --git a/meta-networking/recipes-support/tcpdump/files/unnecessary-to-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/files/unnecessary-to-check-libpcap.patch
new file mode 100644
index 0000000..d7a3ac2
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/files/unnecessary-to-check-libpcap.patch
@@ -0,0 +1,33 @@
+unnecessary to check libpcap
+
+Upstream-Status: Pending
+
+since the check of libpcap did not consider the cross-compile, lead to the
+below error:
+	This autoconf log indicates errors, it looked at host include and/or
+	library paths while determining system capabilities.
+
+In fact, the libpcap has been added into the tcpdump's DEPENDS, not need to
+check if libpcap existed.
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ configure.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 06fade1..9125de7 100644
+--- a/configure.in
++++ b/configure.in
+@@ -567,7 +567,7 @@ AC_SEARCH_LIBS(getrpcbynumber, nsl,
+ dnl AC_CHECK_LIB(z, uncompress)
+ dnl AC_CHECK_HEADERS(zlib.h)
+ 
+-AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
++#AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
+ 
+ #
+ # Check for these after AC_LBL_LIBPCAP, so we link with the appropriate
+-- 
+1.7.9.5
+
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
deleted file mode 100644
index 7929da5..0000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
+++ /dev/null
@@ -1,42 +0,0 @@
----
- configure |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure b/configure
-index cb51d19..73d51af 100755
---- a/configure
-+++ b/configure
-@@ -2691,13 +2691,13 @@ if test "$ac_test_CFLAGS" = set; then
-   CFLAGS=$ac_save_CFLAGS
- elif test $ac_cv_prog_cc_g = yes; then
-   if test "$GCC" = yes; then
--    CFLAGS="-g -O2"
-+    CFLAGS="-g"
-   else
-     CFLAGS="-g"
-   fi
- else
-   if test "$GCC" = yes; then
--    CFLAGS="-O2"
-+    CFLAGS=""
-   else
-     CFLAGS=
-   fi
-@@ -2830,7 +2830,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
-     if test "$GCC" = yes ; then
- 	    if test "$SHLICC2" = yes ; then
- 		    ac_cv_lbl_gcc_vers=2
--		    V_CCOPT="-O2"
-+		    V_CCOPT=""
- 	    else
- 		    { echo "$as_me:$LINENO: checking gcc version" >&5
- echo $ECHO_N "checking gcc version... $ECHO_C" >&6; }
-@@ -2847,7 +2847,7 @@ fi
- 		    { echo "$as_me:$LINENO: result: $ac_cv_lbl_gcc_vers" >&5
- echo "${ECHO_T}$ac_cv_lbl_gcc_vers" >&6; }
- 		    if test $ac_cv_lbl_gcc_vers -gt 1 ; then
--			    V_CCOPT="-O2"
-+			    V_CCOPT=""
- 		    fi
- 	    fi
-     else
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.5.1.bb
similarity index 80%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.5.1.bb
index 0d88990..9ce02d6 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.5.1.bb
@@ -11,9 +11,13 @@ SRC_URI = " \
     file://0001-minimal-IEEE802.15.4-allowed.patch \
     file://ipv6-cross.patch \
     file://configure.patch \
+    file://unnecessary-to-check-libpcap.patch \
+    file://tcpdump-configure-dlpi.patch \
+    file://tcpdump-cross-getaddrinfo.patch \
 "
-SRC_URI[md5sum] = "a3fe4d30ac85ff5467c889ff46b7e1e8"
-SRC_URI[sha256sum] = "efd08b610210d39977ec3175fa82dad9fbd33587930081be2a905a712dba4286"
+SRC_URI[md5sum] = "973a2513d0076e34aa9da7e15ed98e1b"
+SRC_URI[sha256sum] = "14ab39657128f3a650aed4cf455f76c7590601087b6101c253d698f6e73f0b96"
+export LIBS=" -lpcap"
 
 inherit autotools-brokensep
 CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
-- 
1.7.10.4


