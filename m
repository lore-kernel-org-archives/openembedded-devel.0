Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id B25D577190
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 10:28:58 +0000 (UTC)
Received: from localhost.localdomain (xdsl-188-155-58-14.adslplus.ch
	[188.155.58.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4BAF320858;
	Fri, 13 Jul 2018 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1531477739;
	bh=W2+BTsuKDkwRBU9Mr8Ymm6nhLV+dPqs9SOP5hVVVqXw=;
	h=From:To:Cc:Subject:Date:From;
	b=rqHSH2yfM5V+onD2Y88vbwXvhgKsGCdlNqMJdE+V+1ou7uCPq0GdG4jWLzLDVNqnQ
	Qn5so2r0lVVnZvRyVgySdlRIUtiWBje7xjUS7m4w5VgwgxTa5AazZwoq6GkiiPiQCi
	36j585S9JWpurv4YM8F4NzNCTwjt38ismpea7Sx4=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2018 12:28:35 +0200
Message-Id: <20180713102835.3442-1-krzk@kernel.org>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH v2] libkcapi: Add new recipe for v1.1.1
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
X-List-Received-Date: Fri, 13 Jul 2018 10:28:58 -0000

Add new recipe with libkcapi v1.1.1, Linux Kernel Crypto API User Space
Interface Library.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Add patches fixing compilation with GCC v8.1
---
 ...e-buffer-overflow-with-strncpy-and-Wstrin.patch | 50 ++++++++++++++++
 ...e-Wstringop-truncation-warning-on-false-p.patch | 67 ++++++++++++++++++++++
 ...e-to-terminate-strncpy-copied-string-Wstr.patch | 37 ++++++++++++
 meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb    | 29 ++++++++++
 4 files changed, 183 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/libkcapi/files/0001-Fix-possible-buffer-overflow-with-strncpy-and-Wstrin.patch
 create mode 100644 meta-oe/recipes-crypto/libkcapi/files/0002-apps-Disable-Wstringop-truncation-warning-on-false-p.patch
 create mode 100644 meta-oe/recipes-crypto/libkcapi/files/0003-test-Be-sure-to-terminate-strncpy-copied-string-Wstr.patch
 create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb

diff --git a/meta-oe/recipes-crypto/libkcapi/files/0001-Fix-possible-buffer-overflow-with-strncpy-and-Wstrin.patch b/meta-oe/recipes-crypto/libkcapi/files/0001-Fix-possible-buffer-overflow-with-strncpy-and-Wstrin.patch
new file mode 100644
index 000000000000..f35f631c6010
--- /dev/null
+++ b/meta-oe/recipes-crypto/libkcapi/files/0001-Fix-possible-buffer-overflow-with-strncpy-and-Wstrin.patch
@@ -0,0 +1,50 @@
+From 303c766d67cef5c357e9b3d3a97f7b480d29e1cb Mon Sep 17 00:00:00 2001
+From: Krzysztof Kozlowski <krzk@kernel.org>
+Date: Thu, 12 Jul 2018 18:13:16 +0200
+Subject: [PATCH 1/3] Fix possible buffer overflow with strncpy and
+ -Wstringop-truncation warning
+
+If valid cipher name (to which netlink socket was bound) is longer than
+CRYPTO_MAX_ALG_NAME defined in lib/cryptouser.h, then the strncpy() will
+try to copy length of this cipher name into smaller buffer.
+
+In libkcapi the CRYPTO_MAX_ALG_NAME (thus the size of the buffer) is
+defined as 64 but since commit f437a3f477cc ("crypto: api - Extend
+algorithm name limit to 128 bytes") in Linux kernel (v4.12), the kernel
+defines it as 128.
+
+It is error-prone to use source buffer length as limit of dst buffer.
+Instead choose sizeof(dst buffer).
+
+This also fixes the warning with GCC v8.1.0:
+
+    lib/kcapi-kernel-if.c: In function '__kcapi_common_getinfo.isra.2':
+    lib/kcapi-kernel-if.c:632:3: error: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Werror=stringop-truncation]
+        strncpy(req.cru.cru_name, ciphername, strlen(ciphername));
+        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
+Upstream-Status: Submitted
+---
+ lib/kcapi-kernel-if.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/kcapi-kernel-if.c b/lib/kcapi-kernel-if.c
+index 2481f8abde63..807cbfe219cd 100644
+--- a/lib/kcapi-kernel-if.c
++++ b/lib/kcapi-kernel-if.c
+@@ -627,9 +627,9 @@ static int __kcapi_common_getinfo(struct kcapi_handle *handle,
+ 
+ 	if (drivername)
+ 		strncpy(req.cru.cru_driver_name, ciphername,
+-			strlen(ciphername));
++			sizeof(req.cru.cru_driver_name) - 1);
+ 	else
+-		strncpy(req.cru.cru_name, ciphername, strlen(ciphername));
++		strncpy(req.cru.cru_name, ciphername, sizeof(req.cru.cru_name) - 1);
+ 
+ 	/* talk to netlink socket */
+ 	sd =  socket(AF_NETLINK, SOCK_RAW, NETLINK_CRYPTO);
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-crypto/libkcapi/files/0002-apps-Disable-Wstringop-truncation-warning-on-false-p.patch b/meta-oe/recipes-crypto/libkcapi/files/0002-apps-Disable-Wstringop-truncation-warning-on-false-p.patch
new file mode 100644
index 000000000000..ba76599fd831
--- /dev/null
+++ b/meta-oe/recipes-crypto/libkcapi/files/0002-apps-Disable-Wstringop-truncation-warning-on-false-p.patch
@@ -0,0 +1,67 @@
+From 88f1a8fe4697b0921f39fcd9c7efc4a0486cf91b Mon Sep 17 00:00:00 2001
+From: Krzysztof Kozlowski <krzk@kernel.org>
+Date: Thu, 12 Jul 2018 18:13:24 +0200
+Subject: [PATCH 2/3] apps: Disable -Wstringop-truncation warning on false
+ positives
+
+The GCC v8.1.0 warns:
+
+    In function 'paste',
+        inlined from 'get_hmac_file' at apps/kcapi-hasher.c:395:11:
+    apps/kcapi-hasher.c:346:2: error: 'strncpy' destination unchanged after copying no bytes [-Werror=stringop-truncation]
+      strncpy(dst, src, size);
+      ^~~~~~~~~~~~~~~~~~~~~~~
+
+These are false positives because at the end of paste() calls, the buffer is
+NULL terminated.
+
+Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
+Upstream-Status: Submitted
+---
+ apps/kcapi-hasher.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/apps/kcapi-hasher.c b/apps/kcapi-hasher.c
+index ae88211ff4dd..4052260bf871 100644
+--- a/apps/kcapi-hasher.c
++++ b/apps/kcapi-hasher.c
+@@ -61,6 +61,10 @@
+ 
+ #include "app-internal.h"
+ 
++#define GCC_VERSION (__GNUC__ * 10000 \
++			+ __GNUC_MINOR__ * 100 \
++			+ __GNUC_PATCHLEVEL__)
++
+ struct hash_name {
+ 	const char *kcapiname;
+ 	const char *bsdname;
+@@ -341,6 +345,17 @@ out:
+ 	return ret;
+ }
+ 
++/*
++ * GCC v8.1.0 introduced -Wstringop-truncation but it is not smart enough to
++ * find that cursor string will be NULL-terminated after all paste() calls and
++ * warns with:
++ * error: 'strncpy' destination unchanged after copying no bytes [-Werror=stringop-truncation]
++ * error: 'strncpy' output truncated before terminating nul copying 5 bytes from a string of the same length [-Werror=stringop-truncation]
++ */
++#pragma GCC diagnostic push
++#if GCC_VERSION >= 80100
++#pragma GCC diagnostic ignored "-Wstringop-truncation"
++#endif
+ static char *paste(char *dst, const char *src, size_t size)
+ {
+ 	strncpy(dst, src, size);
+@@ -398,6 +413,7 @@ static char *get_hmac_file(const char *filename, const char *subdir)
+ 	strncpy(cursor, "\0", 1);
+ 	return checkfile;
+ }
++#pragma GCC diagnostic pop /* -Wstringop-truncation */
+ 
+ static int hash_files(const struct hash_params *params,
+ 		      char *filenames[], uint32_t files,
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-crypto/libkcapi/files/0003-test-Be-sure-to-terminate-strncpy-copied-string-Wstr.patch b/meta-oe/recipes-crypto/libkcapi/files/0003-test-Be-sure-to-terminate-strncpy-copied-string-Wstr.patch
new file mode 100644
index 000000000000..885f3ca12465
--- /dev/null
+++ b/meta-oe/recipes-crypto/libkcapi/files/0003-test-Be-sure-to-terminate-strncpy-copied-string-Wstr.patch
@@ -0,0 +1,37 @@
+From 505d949dcb6b756f6db6588d3425d9cd6108c77f Mon Sep 17 00:00:00 2001
+From: Krzysztof Kozlowski <krzk@kernel.org>
+Date: Thu, 12 Jul 2018 18:13:32 +0200
+Subject: [PATCH 3/3] test: Be sure to terminate strncpy() copied string
+ (-Wstringop-truncation)
+
+strncpy() might not NULL-terminate the buffer.  This fixes GCC v8.1.0 warning:
+
+    test/kcapi-main.c: In function 'main':
+    test/kcapi-main.c:3123:5: error: 'strncpy' specified bound 63 equals destination size [-Werror=stringop-truncation]
+         strncpy(cavs_test.cipher, optarg,
+         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+          CIPHERMAXNAME);
+          ~~~~~~~~~~~~~~
+
+Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
+Upstream-Status: Submitted
+---
+ test/kcapi-main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/kcapi-main.c b/test/kcapi-main.c
+index 835249987aa5..c167b7f61809 100644
+--- a/test/kcapi-main.c
++++ b/test/kcapi-main.c
+@@ -3121,7 +3121,7 @@ int main(int argc, char *argv[])
+ 				break;
+ 			case 'c':
+ 				strncpy(cavs_test.cipher, optarg,
+-					CIPHERMAXNAME);
++					CIPHERMAXNAME - 1);
+ 				break;
+ 			case 'p':
+ 				len = strlen(optarg);
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
new file mode 100644
index 000000000000..e401b70a7da3
--- /dev/null
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
+HOMEPAGE = "http://www.chronox.de/libkcapi.html"
+LICENSE = "BSD | GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d0421cf231423bda10cea691b613e866"
+
+DEPENDS = "libtool"
+
+S = "${WORKDIR}/git"
+# Use v1.1.1 with changes on top for building in OE
+SRCREV = "342b50fc9225a991c224126c13c188ad9f1ef9f9"
+PV = "1.1.1+git${SRCPV}"
+SRC_URI = " \
+    git://github.com/smuellerDD/libkcapi.git \
+    file://0001-Fix-possible-buffer-overflow-with-strncpy-and-Wstrin.patch \
+    file://0002-apps-Disable-Wstringop-truncation-warning-on-false-p.patch \
+    file://0003-test-Be-sure-to-terminate-strncpy-copied-string-Wstr.patch \
+"
+
+inherit autotools
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[testapp] = "--enable-kcapi-test,,,"
+PACKAGECONFIG[apps] = "--enable-kcapi-speed --enable-kcapi-hasher --enable-kcapi-rngapp --enable-kcapi-encapp --enable-kcapi-dgstapp,,,"
+
+do_install_append() {
+    # bindir contains testapp and apps.  However it is always created, even
+    # when no binaries are installed (empty bin_PROGRAMS in Makefile.am),
+    rmdir --ignore-fail-on-non-empty ${D}${bindir}
+}
-- 
2.14.1


