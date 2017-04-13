Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5791477E89
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:40 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id x125so35483699pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NBUv4HSpAy78eHutYM8u58gUBMvhOgEfrJMMBFdhVYs=;
	b=uaX0EgZSWBxcdFTeowEtKmG8/JjnZAsvVMc5VpwDviYZlZ1DCv9deS28FKv2PilKKu
	8kGZepBaom/D8VlQL5G/2u+6ZUqmTdYlUmGQDOOSPz74efgY6U3627Foz0M5c6ff9Jgx
	Y4ROLEugn2DMu3Bt5uGJtwAzlRZPqim8scoQWlcNFblDYaGNolNp/o+SHSzrKi+FvJlK
	9KW32+DJsJw3WT5yoS9J85Ch9T20r+vIWdtqHpzJnrCnCwnMClG2BVENoOcvDTSURaXV
	bhB97AtFSnkIAWKEfdCggqeeIFvhPNE0rx351iikAkkTo8HBuFwgrFBRI6rBZ0KRYOsp
	n6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NBUv4HSpAy78eHutYM8u58gUBMvhOgEfrJMMBFdhVYs=;
	b=HFgmnm2HU1Awo5v9B+7E7n2rOpNnIq3aaB2t0+4Ou7JwMLf3eVIl1nwjJtxMIhpiLV
	pPYp/YcKIelGM2X15VIyvm+UB/d6qZIImCGdJANP70S2FqfrQ8VLHQ1uoufKOcKXKPpq
	CAbMnREOtNUDLmBJutVZ/dJUfxInFPi2GSKPgEkrCLKNzbh4uT4rlvAtO4iMnUpc9hfi
	GWeSDtKYfU/RrCv8/HdyRmx+W3Zh8/wW3+OhyZsPsdPZ5ol48sUWyuW/bDLUbtmuD4Ol
	kbUQjn7iQZVzyz+RPEKBOg71cHgVvU08nrG6XeWYxBxjAk9HKhv6bvnnCYbeh3Ux/pui
	B9JQ==
X-Gm-Message-State: AN3rC/7agiQt9K8+5RGPaHVbRtEa2k59WV/7ljfl89BrMIl7AlFEl2kv
	EO+7hoOOS4rSCA==
X-Received: by 10.98.88.130 with SMTP id m124mr4270964pfb.76.1492116101886;
	Thu, 13 Apr 2017 13:41:41 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:53 -0700
Message-Id: <20170413204106.30679-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-oe][ 16/29] sharutils: Upgrade to 4.15.2
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:42 -0000

Fix format error warnings with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sharutils-4.14/fix-for-cross-compiling.patch   | 29 ----------------------
 .../sharutils/0001-Fix-build-with-clang.patch      | 29 ++++++++++++++++++++++
 .../recipes-support/sharutils/sharutils_4.14.bb    | 18 --------------
 .../recipes-support/sharutils/sharutils_4.15.2.bb  | 21 ++++++++++++++++
 4 files changed, 50 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-support/sharutils/sharutils-4.14/fix-for-cross-compiling.patch
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils/0001-Fix-build-with-clang.patch
 delete mode 100644 meta-oe/recipes-support/sharutils/sharutils_4.14.bb
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb

diff --git a/meta-oe/recipes-support/sharutils/sharutils-4.14/fix-for-cross-compiling.patch b/meta-oe/recipes-support/sharutils/sharutils-4.14/fix-for-cross-compiling.patch
deleted file mode 100644
index 86a7da63c..000000000
--- a/meta-oe/recipes-support/sharutils/sharutils-4.14/fix-for-cross-compiling.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 990234af84a5399017d1c4fe03c5c756a8e51e23 Mon Sep 17 00:00:00 2001
-From: Hongjun Yang <Hongjun.Yang@windriver.com>
-Date: Tue, 20 Aug 2013 09:41:43 +0800
-Subject: [PATCH] fix cross compiling issue
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
-
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 6ee98e0..8067f54 100755
---- a/configure
-+++ b/configure
-@@ -26965,7 +26965,7 @@ fi
- if test "$cross_compiling" = yes; then :
-   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
- $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
--as_fn_error $? "cannot run test program while cross compiling
-+$as_echo "cannot run test program while cross compiling
- See \`config.log' for more details" "$LINENO" 5; }
- else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
--- 
-1.8.1.4
-
diff --git a/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-build-with-clang.patch b/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-build-with-clang.patch
new file mode 100644
index 000000000..7b627c16d
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-build-with-clang.patch
@@ -0,0 +1,29 @@
+From fa8371d348f6a8b0799b2e6c38247dd1399d85e3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Apr 2017 08:49:48 -0700
+Subject: [PATCH] Fix build with clang
+
+ATTRIBUTE_FORMAT_ARG macro gets computed to be empty with clang
+whereas it does support format attribute, we hard code it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shar-opts.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/shar-opts.h b/src/shar-opts.h
+index a287046..172676f 100644
+--- a/src/shar-opts.h
++++ b/src/shar-opts.h
+@@ -377,7 +377,7 @@ extern tOptions sharOptions;
+ #   define ATTRIBUTE_FORMAT_ARG(_a)
+ # endif
+ 
+-static inline char* aoGetsText(char const* pz) ATTRIBUTE_FORMAT_ARG(1);
++static inline char* aoGetsText(char const* pz) __attribute__ ((format_arg(1)));
+ static inline char* aoGetsText(char const* pz) {
+     if (pz == NULL) return NULL;
+     return (char*)gettext(pz);
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.14.bb b/meta-oe/recipes-support/sharutils/sharutils_4.14.bb
deleted file mode 100644
index d69e6ecbd..000000000
--- a/meta-oe/recipes-support/sharutils/sharutils_4.14.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "This is the set of GNU shar utilities."
-HOMEPAGE = "http://www.gnu.org/software/sharutils/"
-SECTION = "console/utils"
-LICENSE="GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-inherit gettext autotools-brokensep
-
-SRC_URI = "ftp://ftp.gnu.org/gnu/sharutils/sharutils-4.14.tar.gz \
-    file://fix-for-cross-compiling.patch \
-"
-
-SRC_URI[md5sum] = "5686c11131b4c4c0841f8f3ef34d136a"
-SRC_URI[sha256sum] = "90f5107c167cfd1b299bb211828d2586471087863dbed698f53109cd5f717208"
-
-do_configure () {
-    oe_runconf
-}
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
new file mode 100644
index 000000000..812fee955
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -0,0 +1,21 @@
+SUMMARY = "This is the set of GNU shar utilities."
+HOMEPAGE = "http://www.gnu.org/software/sharutils/"
+SECTION = "console/utils"
+LICENSE="GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+inherit gettext autotools
+
+SRC_URI = "ftp://ftp.gnu.org/gnu/${BPN}/${BP}.tar.gz \
+           file://0001-Fix-build-with-clang.patch \
+"
+SRC_URI[md5sum] = "32a51b23e25ad5e6af4b89f228be1800"
+SRC_URI[sha256sum] = "ee336e68549664e7a19b117adf02edfdeac6307f22e5ba78baca457116914637"
+
+do_install_append() {
+    if [ -e ${D}${libdir}/charset.alias ]
+    then
+        rm -rf ${D}${libdir}/charset.alias
+        rmdir --ignore-fail-on-non-empty ${D}${libdir}
+    fi
+}
-- 
2.12.2


