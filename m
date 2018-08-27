Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 085307918C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 04:16:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7R4GDJX022295
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2018 21:16:14 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sun, 26 Aug 2018 21:16:12 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Aug 2018 12:16:11 +0800
Message-ID: <1535343371-347112-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] lmbench: fix usrmerge install path
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
X-List-Received-Date: Mon, 27 Aug 2018 04:16:13 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Rework the patch use-base_libdir-instead-of-hardcoded-lib.patch
to 0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch
to fix the below do_install error when usrmerge
enabled in DISTRO_FEATURES and also fix the lib
name from lmbench.a to libmbench.a

| if [ ! -d /poky-build/tmp-glibc/work/core2-64-wrs-linux/lmbench/3.0-a9-r2/image/usr/usr/lib64 ]; then mkdir
/poky-build/tmp-glibc/work/core2-64-wrs-linux/lmbench/3.0-a9-r2/image/usr/usr/lib64; fi
| mkdir: cannot create directory /poky-build/tmp-glibc/work/core2-64-wrs-linux/lmbench/3.0-a9-r2/image/usr/usr/lib64 No such file or directory
| Makefile:141: recipe for target 'install-target' failed
| make[1]: *** [install-target] Error 1

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...efile-use-libdir-instead-of-hardcoded-lib.patch | 34 ++++++++++++++++++++++
 .../use-base_libdir-instead-of-hardcoded-lib.patch | 30 -------------------
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |  3 +-
 3 files changed, 36 insertions(+), 31 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch
 delete mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch
new file mode 100644
index 0000000..04cef96
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch
@@ -0,0 +1,34 @@
+From ea683a0dbaa30a0bf101adb09a1a2531c7112c62 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Mon, 27 Aug 2018 11:02:45 +0800
+Subject: [PATCH] src/Makefile: use libdir instead of hardcoded /lib
+
+use libdir instead of hardcoded /lib
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ src/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 4678d54..b73ddb6 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -141,10 +141,10 @@ install-target:
+ 	if [ ! -d $(BASE) ]; then mkdir $(BASE); fi
+ 	if [ ! -d $(BASE)/bin ]; then mkdir $(BASE)/bin; fi
+ 	if [ ! -d $(BASE)/include ]; then mkdir $(BASE)/include; fi
+-	if [ ! -d $(BASE)/lib ]; then mkdir $(BASE)/lib; fi
++	if [ ! -d $(DESTDIR)$(libdir) ]; then mkdir $(DESTDIR)$(libdir); fi
+ 	cp $(EXES) $(BASE)/bin
+ 	cp $(INCS) $(BASE)/include
+-	cp $O/lmbench.a $(BASE)/lib/libmbench.a
++	cp $O/lmbench.a $(DESTDIR)$(libdir)/libmbench.a
+ 	cd ../doc; env MAKEFLAGS="$(MAKEFLAGS)" make CC="${CC}" OS="${OS}" BASE="$(BASE)" install
+ 
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch
deleted file mode 100644
index c6e9465..0000000
--- a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 73fdc58ca4eb9e2f24d854b3af3a4e5daac5a33e Mon Sep 17 00:00:00 2001
-From: Ting Liu <b28495@freescale.com>
-Date: Fri, 22 Nov 2013 15:20:08 +0800
-Subject: [PATCH] use base_libdir instead of hardcoded /lib
-
-Upstream Status: Inappropriate [configuration]
-
-Signed-off-by: Ting Liu <b28495@freescale.com>
-
----
- src/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index c7a8c79..c7e4e3c 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -143,10 +143,10 @@ install-target:
- 	if [ ! -d $(BASE) ]; then mkdir $(BASE); fi
- 	if [ ! -d $(BASE)/bin ]; then mkdir $(BASE)/bin; fi
- 	if [ ! -d $(BASE)/include ]; then mkdir $(BASE)/include; fi
--	if [ ! -d $(BASE)/lib ]; then mkdir $(BASE)/lib; fi
-+	if [ ! -d $(BASE)$(base_libdir) ]; then mkdir $(BASE)$(base_libdir); fi
- 	cp $(EXES) $(BASE)/bin
- 	cp $(INCS) $(BASE)/include
--	cp $O/lmbench.a $(BASE)/lib/libmbench.a
-+	cp $O/lmbench.a $(BASE)$(base_libdir)
- 	cd ../doc; env MAKEFLAGS="$(MAKEFLAGS)" make CC="${CC}" OS="${OS}" BASE="$(BASE)" install
- 
- 
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 593b62f..8e6e803 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -19,13 +19,13 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://update-results-script.patch \
            file://obey-ranlib.patch \
            file://update-config-script.patch \
-           file://use-base_libdir-instead-of-hardcoded-lib.patch \
            file://lmbench_result_html_report.patch \
            file://fix-lmbench-memory-check-failure.patch \
            file://0001-avoid-gcc-optimize-away-the-loops.patch \
            file://0001-lat_http.c-Add-printf-format.patch \
            file://0001-Check-for-musl-define-guard-before-redefining-sockle.patch \
            file://0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch \
+           file://0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch \
            "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
@@ -66,6 +66,7 @@ do_install () {
     fi
 
     oe_runmake BASE="${D}${prefix}" MANDIR="${D}${mandir}" \
+            DESTDIR="${D}" \
             -C src install
     mv ${D}${bindir}/line ${D}${bindir}/lm_line
     install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/
-- 
2.7.4


