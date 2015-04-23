Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6F39B6AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 08:08:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3N88tIf025635
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Apr 2015 01:08:55 -0700 (PDT)
Received: from lirq-OptiPlex-780.wrs.com (128.224.162.139) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 23 Apr 2015 01:08:55 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe_macdonald@mentor.com>
Date: Thu, 23 Apr 2015 16:08:53 +0800
Message-ID: <1429776533-3491-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-networking] tcpdump: upgrade to 4.7.4
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
X-List-Received-Date: Thu, 23 Apr 2015 08:08:55 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Remove two unneeded patches, configure.patch and tcpdump-cross-getaddrinfo.patch

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../tcpdump/tcpdump-4.6.1/configure.patch          | 29 ----------------------
 .../tcpdump-4.6.1/tcpdump-cross-getaddrinfo.patch  | 23 -----------------
 .../{tcpdump-4.6.1 => tcpdump}/add-ptest.patch     |  0
 .../tcpdump/{tcpdump-4.6.1 => tcpdump}/run-ptest   |  0
 .../tcpdump-configure-dlpi.patch                   |  0
 .../unnecessary-to-check-libpcap.patch             |  0
 .../tcpdump/{tcpdump_4.6.1.bb => tcpdump_4.7.4.bb} |  6 ++---
 7 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/configure.patch
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/tcpdump-cross-getaddrinfo.patch
 rename meta-networking/recipes-support/tcpdump/{tcpdump-4.6.1 => tcpdump}/add-ptest.patch (100%)
 rename meta-networking/recipes-support/tcpdump/{tcpdump-4.6.1 => tcpdump}/run-ptest (100%)
 rename meta-networking/recipes-support/tcpdump/{tcpdump-4.6.1 => tcpdump}/tcpdump-configure-dlpi.patch (100%)
 rename meta-networking/recipes-support/tcpdump/{tcpdump-4.6.1 => tcpdump}/unnecessary-to-check-libpcap.patch (100%)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.6.1.bb => tcpdump_4.7.4.bb} (85%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/configure.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/configure.patch
deleted file mode 100644
index 3697420..0000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/configure.patch
+++ /dev/null
@@ -1,29 +0,0 @@
----
- aclocal.m4   |    1 -
- configure.in |    1 +
- 2 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index 40b5866..0c662b0 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -40,7 +40,6 @@ dnl
- AC_DEFUN(AC_LBL_C_INIT_BEFORE_CC,
-     [AC_PREREQ(2.50)
-     AC_BEFORE([$0], [AC_LBL_C_INIT])
--    AC_BEFORE([$0], [AC_PROG_CC])
-     AC_BEFORE([$0], [AC_LBL_FIXINCLUDES])
-     AC_BEFORE([$0], [AC_LBL_DEVEL])
-     AC_ARG_WITH(gcc, [  --without-gcc           don't use gcc])
-diff --git a/configure.in b/configure.in
-index 11257c9..7f9591c 100644
---- a/configure.in
-+++ b/configure.in
-@@ -19,6 +19,7 @@ AC_REVISION($Revision: 1.204 $)
- AC_PREREQ(2.50)
- AC_INIT(tcpdump.c)
- 
-+AC_PROG_CC
- AC_CANONICAL_HOST
- 
- AC_LBL_C_INIT_BEFORE_CC(V_CCOPT, V_INCLS)
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/tcpdump-cross-getaddrinfo.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/tcpdump-cross-getaddrinfo.patch
deleted file mode 100644
index b414b72..0000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/tcpdump-cross-getaddrinfo.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Fix getaddinfo check when cross compiling
-
-Upstream-Status: Pending.
-
-AC_TRY_RUN defaults to td_cv_buggygetaddrinfo=yes when
-cross-compiling. So this change indicates that we
-are cross-compiling.
-
-Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
-
-diff --git a/configure.in b/configure.in
-index ca277c0..283035e 100644
---- a/configure.in
-+++ b/configure.in
-@@ -434,7 +434,7 @@ main()
- ],
- 	td_cv_buggygetaddrinfo=no,
- 	td_cv_buggygetaddrinfo=yes,
--	td_cv_buggygetaddrinfo=yes)])
-+	td_cv_buggygetaddrinfo=cross)])
- 	if test "$td_cv_buggygetaddrinfo" = no; then
- 		AC_MSG_RESULT(good)
- 	else
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/add-ptest.patch b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
similarity index 100%
rename from meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/add-ptest.patch
rename to meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/run-ptest b/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest
similarity index 100%
rename from meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/run-ptest
rename to meta-networking/recipes-support/tcpdump/tcpdump/run-ptest
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/tcpdump-configure-dlpi.patch b/meta-networking/recipes-support/tcpdump/tcpdump/tcpdump-configure-dlpi.patch
similarity index 100%
rename from meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/tcpdump-configure-dlpi.patch
rename to meta-networking/recipes-support/tcpdump/tcpdump/tcpdump-configure-dlpi.patch
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/unnecessary-to-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
similarity index 100%
rename from meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/unnecessary-to-check-libpcap.patch
rename to meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
similarity index 85%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
index 1fdaf30..e01f5fb 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
@@ -7,15 +7,13 @@ DEPENDS = "libpcap"
 
 SRC_URI = " \
     http://www.tcpdump.org/release/${BP}.tar.gz \
-    file://configure.patch \
     file://unnecessary-to-check-libpcap.patch \
     file://tcpdump-configure-dlpi.patch \
-    file://tcpdump-cross-getaddrinfo.patch \
     file://add-ptest.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "dab267ec30216a069747d10314079ec7"
-SRC_URI[sha256sum] = "4c88c2a9aeb4047074f344fc9b2b6577b219972d359e192f6d12ccf983a13fd7"
+SRC_URI[md5sum] = "58af728de36f499341918fc4b8e827c3"
+SRC_URI[sha256sum] = "6be520269a89036f99c0b2126713a60965953eab921002b07608ccfc0c47d9af"
 export LIBS=" -lpcap"
 
 inherit autotools-brokensep ptest
-- 
1.9.1


