Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.17003.1615085925278533319
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 18:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 1272wX2d023565
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sat, 6 Mar 2021 18:58:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 6 Mar 2021 18:58:32 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Sat, 6 Mar 2021 18:58:32 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] gperftools: upgrade 2.8.1 -> 2.9.1
Date: Sat, 6 Mar 2021 21:58:26 -0500
Message-ID: <20210307025827.137764-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add perl modules, sort RDEPENDS and add a description.
Add curl as RDPENDS since it's needed by pprof.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../{gperftools_2.8.1.bb => gperftools_2.9.1.bb}  | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/gperftools/{gperftools_2.8.1.bb => gperftools_2.9.1.bb} (81%)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.8.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb
similarity index 81%
rename from meta-oe/recipes-support/gperftools/gperftools_2.8.1.bb
rename to meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb
index 2a386086f..97942278d 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.8.1.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb
@@ -1,5 +1,10 @@
 SUMMARY = "Fast, multi-threaded malloc() and nifty performance analysis tools"
 HOMEPAGE = "https://github.com/gperftools/gperftools"
+DESCRIPTION = "The gperftools, previously called google-perftools, package contains some \
+utilities to improve and analyze the performance of C++ programs. \
+Included are an optimized thread-caching malloc() and cpu and heap profiling utilities. \
+"
+
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 
@@ -44,7 +49,15 @@ FILES_libtcmalloc-minimal = "${libdir}/libtcmalloc_minimal*${SOLIBS} ${libdir}/l
 
 # pprof tool requires Getopt::long and POSIX perl5 modules.
 # Also runs `objdump` on each cpuprofile data file
-RDEPENDS_${PN} += "binutils perl-module-getopt-long perl-module-posix"
+RDEPENDS_${PN} += " \
+    binutils \
+    curl \
+    perl-module-carp \
+    perl-module-cwd \
+    perl-module-getopt-long \
+    perl-module-overloading \
+    perl-module-posix \
+"
 
 RDEPENDS_${PN} += "libtcmalloc-minimal (= ${EXTENDPKGV})"
 
-- 
2.27.0

