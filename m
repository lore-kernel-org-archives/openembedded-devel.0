Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0366011B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:56:01 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id r1-v6so4999689pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2018 23:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tD7yMLIapGCLz+AfNeBb+np0JBHr9HvSzO0tAO1hH8w=;
	b=Z4d13QIbew8xovKxy5PGoCS3NDv8WdMTT9m83mJ5qJ82MaISv7SY3DD+0tF7+Gf1aF
	W7uGLfNDmhVJnUmcSjKny28BWz1S0H+6yEa5Sygdjhm2J76kQ7D/BfQK++TeefhI+3mH
	xuNnkLhMnR0AgcUFFYZE06jKrdAF1dSiClbfMTAZhPo6EZp6YAXVmOzMNhx3Q7tCHcwu
	174USHtW7AXfZ04ysNIQjANnNxHISVj3bWeKPq5WNe4g1U1f5DcTU34xE4owaCIdG3Hk
	jb5F+J8bv/sA8jd/uzLJwMJpgoG4zABb9Xd5iDlDJEyXHZl93d/8Lcyaw9N4VseKmBUT
	M+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tD7yMLIapGCLz+AfNeBb+np0JBHr9HvSzO0tAO1hH8w=;
	b=l/ePI1lRJayPXOtyWx05VsyrqGaPimJBPsjKGsFjhU1WE3nZZ//Bqcz3DtYHAfnso3
	Kc6oOG6eQXemSpUuSUq1O97Xf8SUnACZed1g7jE2jsyBGDzpmD9ZfdXPGbUlbL9gTP0e
	4qfPFsMYg4xAfrAI1pnyKvKkdQR+h+no3NKL2wP23dbacnalLeggcJZpP1UIWeIB0cLi
	XvCYVJR5zNzygvC95QdETlEDC1wLHRrLRjDnSW/soW1O4r6D272UrEQZH9laxsUKv09G
	+upZDnm1M8OoLHYWoJuQXplgiAIC0K8LPkaunHsX2Z4PVIscV+bZYJS1aVNshwesS+gF
	cXBg==
X-Gm-Message-State: APzg51DrV4vYhr+se+5skKrsCK35YeH+b9DiiHPp/l7/FKPuAOVBtxVg
	CLGtVmlXsjoVupIJkLX6hk6PlA8o
X-Google-Smtp-Source: ANB0VdbWUyUAgbn3LwwY5cKRCbuAl/R/LFZEQvKWQOwOhFH2Hxsh/JeEmy2hOCA4HG3lAmyn4ZmT2w==
X-Received: by 2002:a62:41d6:: with SMTP id
	g83-v6mr14397675pfd.219.1535698561956; 
	Thu, 30 Aug 2018 23:56:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	f75-v6sm15884633pfk.85.2018.08.30.23.56.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Aug 2018 23:56:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2018 23:55:52 -0700
Message-Id: <20180831065552.19562-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH] libkcapi: Upgrade to 1.1.3
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
X-List-Received-Date: Fri, 31 Aug 2018 06:56:01 -0000

Drop upstream patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
---
 ...fer-overflow-with-strncpy-and-Wstrin.patch | 50 --------------
 ...ringop-truncation-warning-on-false-p.patch | 67 -------------------
 ...terminate-strncpy-copied-string-Wstr.patch | 37 ----------
 .../recipes-crypto/libkcapi/libkcapi_git.bb   |  9 +--
 4 files changed, 3 insertions(+), 160 deletions(-)
 delete mode 100644 meta-oe/recipes-crypto/libkcapi/files/0001-Fix-possible-buffer-overflow-with-strncpy-and-Wstrin.patch
 delete mode 100644 meta-oe/recipes-crypto/libkcapi/files/0002-apps-Disable-Wstringop-truncation-warning-on-false-p.patch
 delete mode 100644 meta-oe/recipes-crypto/libkcapi/files/0003-test-Be-sure-to-terminate-strncpy-copied-string-Wstr.patch

diff --git a/meta-oe/recipes-crypto/libkcapi/files/0001-Fix-possible-buffer-overflow-with-strncpy-and-Wstrin.patch b/meta-oe/recipes-crypto/libkcapi/files/0001-Fix-possible-buffer-overflow-with-strncpy-and-Wstrin.patch
deleted file mode 100644
index f35f631c60..0000000000
--- a/meta-oe/recipes-crypto/libkcapi/files/0001-Fix-possible-buffer-overflow-with-strncpy-and-Wstrin.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 303c766d67cef5c357e9b3d3a97f7b480d29e1cb Mon Sep 17 00:00:00 2001
-From: Krzysztof Kozlowski <krzk@kernel.org>
-Date: Thu, 12 Jul 2018 18:13:16 +0200
-Subject: [PATCH 1/3] Fix possible buffer overflow with strncpy and
- -Wstringop-truncation warning
-
-If valid cipher name (to which netlink socket was bound) is longer than
-CRYPTO_MAX_ALG_NAME defined in lib/cryptouser.h, then the strncpy() will
-try to copy length of this cipher name into smaller buffer.
-
-In libkcapi the CRYPTO_MAX_ALG_NAME (thus the size of the buffer) is
-defined as 64 but since commit f437a3f477cc ("crypto: api - Extend
-algorithm name limit to 128 bytes") in Linux kernel (v4.12), the kernel
-defines it as 128.
-
-It is error-prone to use source buffer length as limit of dst buffer.
-Instead choose sizeof(dst buffer).
-
-This also fixes the warning with GCC v8.1.0:
-
-    lib/kcapi-kernel-if.c: In function '__kcapi_common_getinfo.isra.2':
-    lib/kcapi-kernel-if.c:632:3: error: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Werror=stringop-truncation]
-        strncpy(req.cru.cru_name, ciphername, strlen(ciphername));
-        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
-Upstream-Status: Submitted
----
- lib/kcapi-kernel-if.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/kcapi-kernel-if.c b/lib/kcapi-kernel-if.c
-index 2481f8abde63..807cbfe219cd 100644
---- a/lib/kcapi-kernel-if.c
-+++ b/lib/kcapi-kernel-if.c
-@@ -627,9 +627,9 @@ static int __kcapi_common_getinfo(struct kcapi_handle *handle,
- 
- 	if (drivername)
- 		strncpy(req.cru.cru_driver_name, ciphername,
--			strlen(ciphername));
-+			sizeof(req.cru.cru_driver_name) - 1);
- 	else
--		strncpy(req.cru.cru_name, ciphername, strlen(ciphername));
-+		strncpy(req.cru.cru_name, ciphername, sizeof(req.cru.cru_name) - 1);
- 
- 	/* talk to netlink socket */
- 	sd =  socket(AF_NETLINK, SOCK_RAW, NETLINK_CRYPTO);
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-crypto/libkcapi/files/0002-apps-Disable-Wstringop-truncation-warning-on-false-p.patch b/meta-oe/recipes-crypto/libkcapi/files/0002-apps-Disable-Wstringop-truncation-warning-on-false-p.patch
deleted file mode 100644
index ba76599fd8..0000000000
--- a/meta-oe/recipes-crypto/libkcapi/files/0002-apps-Disable-Wstringop-truncation-warning-on-false-p.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 88f1a8fe4697b0921f39fcd9c7efc4a0486cf91b Mon Sep 17 00:00:00 2001
-From: Krzysztof Kozlowski <krzk@kernel.org>
-Date: Thu, 12 Jul 2018 18:13:24 +0200
-Subject: [PATCH 2/3] apps: Disable -Wstringop-truncation warning on false
- positives
-
-The GCC v8.1.0 warns:
-
-    In function 'paste',
-        inlined from 'get_hmac_file' at apps/kcapi-hasher.c:395:11:
-    apps/kcapi-hasher.c:346:2: error: 'strncpy' destination unchanged after copying no bytes [-Werror=stringop-truncation]
-      strncpy(dst, src, size);
-      ^~~~~~~~~~~~~~~~~~~~~~~
-
-These are false positives because at the end of paste() calls, the buffer is
-NULL terminated.
-
-Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
-Upstream-Status: Submitted
----
- apps/kcapi-hasher.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/apps/kcapi-hasher.c b/apps/kcapi-hasher.c
-index ae88211ff4dd..4052260bf871 100644
---- a/apps/kcapi-hasher.c
-+++ b/apps/kcapi-hasher.c
-@@ -61,6 +61,10 @@
- 
- #include "app-internal.h"
- 
-+#define GCC_VERSION (__GNUC__ * 10000 \
-+			+ __GNUC_MINOR__ * 100 \
-+			+ __GNUC_PATCHLEVEL__)
-+
- struct hash_name {
- 	const char *kcapiname;
- 	const char *bsdname;
-@@ -341,6 +345,17 @@ out:
- 	return ret;
- }
- 
-+/*
-+ * GCC v8.1.0 introduced -Wstringop-truncation but it is not smart enough to
-+ * find that cursor string will be NULL-terminated after all paste() calls and
-+ * warns with:
-+ * error: 'strncpy' destination unchanged after copying no bytes [-Werror=stringop-truncation]
-+ * error: 'strncpy' output truncated before terminating nul copying 5 bytes from a string of the same length [-Werror=stringop-truncation]
-+ */
-+#pragma GCC diagnostic push
-+#if GCC_VERSION >= 80100
-+#pragma GCC diagnostic ignored "-Wstringop-truncation"
-+#endif
- static char *paste(char *dst, const char *src, size_t size)
- {
- 	strncpy(dst, src, size);
-@@ -398,6 +413,7 @@ static char *get_hmac_file(const char *filename, const char *subdir)
- 	strncpy(cursor, "\0", 1);
- 	return checkfile;
- }
-+#pragma GCC diagnostic pop /* -Wstringop-truncation */
- 
- static int hash_files(const struct hash_params *params,
- 		      char *filenames[], uint32_t files,
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-crypto/libkcapi/files/0003-test-Be-sure-to-terminate-strncpy-copied-string-Wstr.patch b/meta-oe/recipes-crypto/libkcapi/files/0003-test-Be-sure-to-terminate-strncpy-copied-string-Wstr.patch
deleted file mode 100644
index 885f3ca124..0000000000
--- a/meta-oe/recipes-crypto/libkcapi/files/0003-test-Be-sure-to-terminate-strncpy-copied-string-Wstr.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 505d949dcb6b756f6db6588d3425d9cd6108c77f Mon Sep 17 00:00:00 2001
-From: Krzysztof Kozlowski <krzk@kernel.org>
-Date: Thu, 12 Jul 2018 18:13:32 +0200
-Subject: [PATCH 3/3] test: Be sure to terminate strncpy() copied string
- (-Wstringop-truncation)
-
-strncpy() might not NULL-terminate the buffer.  This fixes GCC v8.1.0 warning:
-
-    test/kcapi-main.c: In function 'main':
-    test/kcapi-main.c:3123:5: error: 'strncpy' specified bound 63 equals destination size [-Werror=stringop-truncation]
-         strncpy(cavs_test.cipher, optarg,
-         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-          CIPHERMAXNAME);
-          ~~~~~~~~~~~~~~
-
-Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
-Upstream-Status: Submitted
----
- test/kcapi-main.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/kcapi-main.c b/test/kcapi-main.c
-index 835249987aa5..c167b7f61809 100644
---- a/test/kcapi-main.c
-+++ b/test/kcapi-main.c
-@@ -3121,7 +3121,7 @@ int main(int argc, char *argv[])
- 				break;
- 			case 'c':
- 				strncpy(cavs_test.cipher, optarg,
--					CIPHERMAXNAME);
-+					CIPHERMAXNAME - 1);
- 				break;
- 			case 'p':
- 				len = strlen(optarg);
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
index e401b70a7d..addd169a8d 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
@@ -6,14 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d0421cf231423bda10cea691b613e866"
 DEPENDS = "libtool"
 
 S = "${WORKDIR}/git"
-# Use v1.1.1 with changes on top for building in OE
-SRCREV = "342b50fc9225a991c224126c13c188ad9f1ef9f9"
-PV = "1.1.1+git${SRCPV}"
+# Use v1.1.3 with changes on top for building in OE
+SRCREV = "1c736c43eb71fbb5640d00efaf34a1edf1972c49"
+PV = "1.1.3+git${SRCPV}"
 SRC_URI = " \
     git://github.com/smuellerDD/libkcapi.git \
-    file://0001-Fix-possible-buffer-overflow-with-strncpy-and-Wstrin.patch \
-    file://0002-apps-Disable-Wstringop-truncation-warning-on-false-p.patch \
-    file://0003-test-Be-sure-to-terminate-strncpy-copied-string-Wstr.patch \
 "
 
 inherit autotools
-- 
2.18.0


